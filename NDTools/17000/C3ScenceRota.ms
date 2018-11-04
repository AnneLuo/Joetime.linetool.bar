try(destroyDialog C3ScenceRota)
	catch()

rollout C3ScenceRota "C3������ת" width:180 height:120
(
	button btn_create_cam "����C3���" height:28 tooltip:"����C3���"
	edittext edt_Axis "����"  width:124 height:18 across:2 offset:[-3,0]
	pickbutton btn_PickAxis "..." width:31 height:19 toolTip:"�����ť �ӳ�����ʰȡһ���µ�������Ϊ������ת��������" offset:[25,0]

	spinner spn_RotaAngle "��ת�Ƕ�"  width:100 height:16 range:[0,360,45] type:#integer scale:1 across:2 offset:[2,0]
	button btn_Reset45 "Rest45"  width:45 height:18 toolTip:"������ת�Ƕ�Ϊ45��" offset:[5,0]

	button btn_Rota_L "<-"  width:50 height:28 toolTip:"��ʱ����ת����" across:3
	button btn_ResetAngle "Reset"  width:50 height:28 toolTip:"��ת�����س�ʼ�Ƕ�"
	button btn_Rota_R "->"  width:50 height:28 toolTip:"˳ʱ����ת����"

    ----------------------------------------------------------------------------------------------------

	fn c3_cam_view = --���
    (
    	animate off
    	(
	    	cam_axis = point name:"�������ת����"
	    	cam_axis.pos = [0,1.43051e-006,-9.84252] ; setTransformLockFlags cam_axis #all
	        cam_axis.ishidden = true
	    	------------
	    	/*
	    	back = plane length:309.449 width:406.693 name:"����"
	    	back.transform = (matrix3 [2.93301,-1.94311e-005,-1.07288e-006] [1.59629e-005,2.54006,1.4665] [-1.0252e-005,-1.4665,2.54006] [0.00533202,806.053,-211.507])
	    	setTransformLockFlags back #all
	    	*/
	    	----------
	        view_camer = freeCamera()
	        view_camer.type = #target
	        view_camer.ishidden = true
	        move view_camer [0,-1235.957,960.772]
	        viewport.setCamera view_camer

	        view_camer.target.pos = [-0.000107612,-3.56955,249.253]
	        view_camer.target.ishidden = true
	        setTransformLockFlags view_camer.target #all
	        setTransformLockFlags view_camer #all
	        ---------
	        view_camer.parent = cam_axis
	        view_camer.target.parent = cam_axis
	        --back.parent = cam_axis
	        (NitrousGraphicsManager.GetActiveViewportSetting()).VisualStyleMode =  #ConsistentColors
	        selectionSets["C3���"] = #(view_camer, cam_axis, view_camer.target)

	        max tool maximize;max adaptive persp grid
        )
    )

    ----------------------------------------------------------------------------------------------------
	on C3ScenceRota open do
	(
		edt_Axis.text = "�������ת����"
	)
	on btn_create_cam pressed do
    (
    	if (getNodeByname "�������ת����" == undefined )do (c3_cam_view())

    )
	on btn_Rota_L pressed do
		(
		try
			(
			AniMode = animButtonState
			if AniMode do animButtonState = false
			RotaNode = getNodeByname edt_Axis.text
			RotaNode.rotation.z_rotation +=spn_RotaAngle.value
			animButtonState = AniMode
			redrawViews()
			)
			catch()
		)
	on btn_Rota_R  pressed do
		(
		try
			(
			AniMode = animButtonState
			if AniMode do animButtonState = false
			RotaNode = getNodeByname edt_Axis.text
			RotaNode.rotation.z_rotation -=spn_RotaAngle.value
			animButtonState = AniMode
			redrawViews()
			)
			catch()
		)
	on btn_ResetAngle  pressed do
		(
		try
			(
			AniMode = animButtonState
			if AniMode do animButtonState = false
			RotaNode = getNodeByname edt_Axis.text
			RotaNode.rotation.z_rotation = 0
			animButtonState = AniMode
			redrawViews()
			)
			catch()
		)
	on btn_PickAxis picked obj do
		if obj != undefined do
			edt_Axis.text = obj.name
	on btn_Reset45 pressed do spn_RotaAngle.value = 45
)




createDialog C3ScenceRota






