Return-Path: <linux-media+bounces-34303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20625AD12B7
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 16:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2695F3A8735
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 14:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A1D024E019;
	Sun,  8 Jun 2025 14:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Rr/JJbjb"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2059.outbound.protection.outlook.com [40.107.102.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B048D2746A;
	Sun,  8 Jun 2025 14:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749394184; cv=fail; b=CcfP4S56rDj9sDrt48B/015581+kxbOSpDlrAau0O+cwIjZ/W3FqiDSvcw0viFR7J2m1C2uSI6NXWDRKajBHG8PZt3ah1xCVK0PRXWc0OqCViRQNLc+GMXi19kTTM3I4TyQPII1Xx4+o1P6j7KA1vktYRHiFOG2urUQRl7f/wRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749394184; c=relaxed/simple;
	bh=UTD6qKhIbeAZRKcNbltKR9pSI7/H3W3KGdmoVIWMLxA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RiGKb8zVPrjkFWHktmRygb9YUQ/Smlc+vLEz7QD6nV5ui+ahFdtWpgJ1/sulFbTHlpKq2oHSr0OCCkogABdXTs1eaXC4DjS4oaIF9S75VivZIHD6E9JLJ5S6VpJIJEddj8cb6tUcexDV2/MyWZQD9yQ4yowWdk1KL1GZbXdB3po=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Rr/JJbjb; arc=fail smtp.client-ip=40.107.102.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJWery/uR1/5Dso3oTt86eI8YxZ+zWno2octrZ4sJV0fslA44PvMwAob2FRx83+vc+8fkBpIHdOkcTCSPfOp8BjuFpjeGJOSRMZguHar35R/Lx621MjXGQGvzYDbnqEZCrM9t5GHJtpQOuFq+6hQ46E8mLjvf4p4s4CpZbf4tCvMmD9SpJIlL1tDzb6vWSCk1AmHasFKeGTkGjowTR0m6y10IJ1Vy5Ja6VQLjmlYgfC3W+Sn/Qds91nHIMKt+pYJ7yDqSp5GVm6c22UEJ9kQBWXLeJkDKf5Lzu3alxnRYITiNB88wQb3lZ2Gjl0QtPiGLMUNEvRJbogKAt43RQQA8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJUNnMbI09QswK7oPKhGwa2VBHXF05K7Bv0hMhKuSpU=;
 b=xAgeTEnkGbBSKNwbERg9y/D7fSPAUrwIprQK2rsLAk4GcLt/clog8SoFLY47B6wEuB+SdQJIJpvetRcIncNrN5NEG/4srxRUwIhpF0r1CfF2vHnbjHmIIKCe1JsL4D892mYUmBvZ9SWdaeGFQCumHdpKBPpPHmktoBKyTi/Fi5V71NiHVeKNAIkahAsFES7iQJxkSaGpJA/wpEJr2q9ZK5sMHPQ6et0prpPeV28azpRO1FLO4ZJ13ll1sawURkZrlAwNfLAFIliC0/xxNZ54zeYmYOGL/WuwHFX/JbB9lJGwQ+wyNQspSevnstTj2lXOdpfk1v/PTpBGMsQcwtx95A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJUNnMbI09QswK7oPKhGwa2VBHXF05K7Bv0hMhKuSpU=;
 b=Rr/JJbjbEAg/CEmZ1y8cdQua/icMRR9pyJVtlT/27srAzeoue5KnAZpmsVq1iZPOGRP/ZHdnU7+CbVQS4v/IjcmBVQFx5Uq/lUtiXDFnWpAqDhdMqHil/qPTM7rw86MMh7p3yY65YzZlR7xQTiuYOOPImPAYMTCT5sdurafzEVo=
Received: from MW4PR03CA0081.namprd03.prod.outlook.com (2603:10b6:303:b6::26)
 by SA1PR12MB9514.namprd12.prod.outlook.com (2603:10b6:806:458::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Sun, 8 Jun
 2025 14:49:38 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:303:b6:cafe::6b) by MW4PR03CA0081.outlook.office365.com
 (2603:10b6:303:b6::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Sun,
 8 Jun 2025 14:49:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Sun, 8 Jun 2025 14:49:37 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 8 Jun
 2025 09:49:32 -0500
From: Bin Du <Bin.Du@amd.com>
To: <mchehab@kernel.org>, <hverkuil@xs4all.nl>,
	<laurent.pinchart+renesas@ideasonboard.com>, <bryan.odonoghue@linaro.org>,
	<sakari.ailus@linux.intel.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <pratap.nirujogi@amd.com>, <benjamin.chan@amd.com>, <king.li@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <Phil.Jawich@amd.com>,
	<Dominic.Antony@amd.com>, <Svetoslav.Stoilov@amd.com>, <bin.du@amd.com>, "Bin
 Du" <Bin.Du@amd.com>
Subject: [PATCH v1 0/9] Add AMD ISP4 driver
Date: Sun, 8 Jun 2025 22:49:07 +0800
Message-ID: <20250608144916.222835-1-Bin.Du@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|SA1PR12MB9514:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c9a470c-70c9-4683-a4db-08dda69bb0ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IW5BnVO7880JMDLkqcy2U1hRiznS7l899tt69yogpNz0B1PUmVrQYS6MzNNx?=
 =?us-ascii?Q?PFT6So3FgWXeOsTbBhQe4A5VpltZ/ms7NIK3W9vWJdN6EWverTA8L27N26h1?=
 =?us-ascii?Q?svFnk7qjad6l1O1quIfVCLdIewBu6bR3VrKCY/Uy5DWdrDzcLle8gVBKMEux?=
 =?us-ascii?Q?P2bZWI75TGx4vrAGAIhn1jmfJy45mf81V1EN163FMsJwylXxIT7gFSjCtmZS?=
 =?us-ascii?Q?wNu0hw9WKztmzslkrs50WYO0eP151PeHNzH4VZEOK8mPonKrwpAbW0poGk3b?=
 =?us-ascii?Q?TJ9HSiQnMT/j0dq9gNs56gmEQIGPsfRa76UWFXNdjCyCMlLY/Ff1s50ESD4Q?=
 =?us-ascii?Q?J8M2edHXOEghyNhV39pci/lQgJvgE5LUXZhGY2kEiATH7cyORXmKsXqKRRXi?=
 =?us-ascii?Q?MYWJ7+NYQOMJg0/snYv8kePImc0ae1P2ghsbpnFWG7dIX6QLXtSxPxAuUDcI?=
 =?us-ascii?Q?N1Q92cjDJlvv1FXSLNWDaDmrgETHZQzhFyKsZkL4vx16jVKsqJUnbJshMd0I?=
 =?us-ascii?Q?CPYlSqxlMOYrfutKVzFZgcxOvClYragjY2LniswQal4pZ60+DeIqndqrJJdv?=
 =?us-ascii?Q?Co/2XtEHFsiZKKNW7HfaC6/TJbF/L0ETOLBoqBtG3/XxIyEn5zUHc7kFX4Au?=
 =?us-ascii?Q?Y4O5aTsFXvq9GdVivIl4dpSKnnLAtXDW2W2sZwlZRwhcUFZk7/VbALeX8x1A?=
 =?us-ascii?Q?82qIlvLGNyv8kJ2NX9ktQ4aCMSq3auerHN3C3CLQ0Kjc4eToBbTbPbN7vOyo?=
 =?us-ascii?Q?OlK+nUNqZQoWu9gnUD1UcOUdeCBA/ttGJ+wUHMCT/g4xx5RV71z41sr10BdY?=
 =?us-ascii?Q?LdCZ6vlPreBgYXRH36uvVsRzdX9S74L9wen/REEkWBVImmJ0g7aC/IQ2wzj3?=
 =?us-ascii?Q?BOay6d3WcsAwRH2Rr84BhPJRxk0PvYqiWeQL7oXJQWw2i8hjm2gozHcLUN4Z?=
 =?us-ascii?Q?kQmlq5lszZAkk7F664K7BjEhvtJfVyA2dJ32mJopqnvQ2burai11vahEs3SN?=
 =?us-ascii?Q?9lzUVlavFwPIm2IKsZ3rhSPRjLTurFWdRtXkjOzoqIhzWCko69gOty2lnq4Q?=
 =?us-ascii?Q?IL6jCQJypiOFnoV8zW9Ouccsd7sZbYVnZ+ZErTT7C0VmY7J8HbY1aA8lLzNa?=
 =?us-ascii?Q?H803Mk6fCOkPyExZWUkhpIcppfUv4No9nGYfmjVm5Nz304ON3d9DDSA4usod?=
 =?us-ascii?Q?i1PambKFG0koLxB8vzbpqWNZ3MIJFghWNqgtyuYvQM2TR8f6Ma3L0VknTuC5?=
 =?us-ascii?Q?a7WBMJPHExsAUPJXSFD3c5FYJnxjfMr1qspKfrjOOltYnlUg2uFsZoAiekJb?=
 =?us-ascii?Q?/YZUENlSEkZXJGzhEehiavLnrdzfKqZK3JOQsizlSl1lI6LZt+EvPY2BdOYt?=
 =?us-ascii?Q?kW7W/4cOdRyLw5vcxq0HW58VQ4wqeGEv0WB4R0X2t3+sGRz3Mgm9uhQlwk63?=
 =?us-ascii?Q?TULQyN/lvGtnyOGMwebv1Z170rdZG1W8Uz9FxqIhxDkBCfaEnLWhTw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2025 14:49:37.3647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9a470c-70c9-4683-a4db-08dda69bb0ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9514

Hello,

AMD ISP4 is the AMD image processing gen 4 which can be found in HP ZBook Ultra G1a 14 inch Mobile Workstation PC ( Ryzen AI Max 385)
(https://ubuntu.com/certified/202411-36043)

This patch series introduces the initial driver support for the AMD ISP4 including
- Powers up/off and initializes ISP HW
- Configures and kicks off ISP FW
- Interacts with APP using standard V4l2 interface by video node
- Controls ISP HW and interacts with ISP FW to do image processing
- Support enum/set output image format and resolution
- Support queueing buffer from app and dequeueing ISP filled buffer to App
- Starts/stops sensor and mipi csi when camera App starts/stops streaming.
- It supports libcamera ver0.2 SimplePipeline
- It is verified on qv4l2, cheese and qcam
- It is verified together with following patches
	platform/x86: Add AMD ISP platform config for OV05C10 (https://lore.kernel.org/all/20250514215623.522746-1-pratap.nirujogi@amd.com/)
	media: i2c: Add OV05C10 camera sensor driver (https://lore.kernel.org/all/20250408221246.911508-1-pratap.nirujogi@amd.com/)
	pinctrl: amd: isp411: Add amdisp GPIO pinctrl (https://github.com/torvalds/linux/commit/e97435ab09f3ad7b6a588dd7c4e45a96699bbb4a)
	i2c: amd-isp: Add ISP i2c-designware driver (https://github.com/torvalds/linux/commit/d6263c468a761cd4c89887073614394ac48441e1)
	drm/amd/amdgpu: Add GPIO resources required for amdisp (https://gitlab.freedesktop.org/agd5f/linux/-/commit/ad0f5966ed8297aa47b3184192b00b7379ae0758)

AMD ISP4 Key features:
- Processes bayer raw data from the connected sensor and output them to different YUV formats
- Downscale input image to different output image resolution
- Pipeline to do image processing on the input image including demosaic, denoise, 3A, etc

It passes v4l2 compliance test, the test reports for:

(a) ov05c10 device /dev/v4l-subdev0
(b) amd_isp_capture device /dev/video0


Compliance test for device /dev/v4l-subdev0:
--------------------------------------------

atg@isp-pv-linux:~/v4l-utils/build/utils/v4l2-compliance$ sudo ./v4l2-compliance -u 0 v4l2-compliance 1.29.0-5348, 64 bits, 64-bit time_t v4l2-compliance SHA: 75e3f0e2c2cb 2025-03-17 18:12:17

Compliance test for device /dev/v4l-subdev0:

Driver Info:
         Driver version   : 6.14.0
         Capabilities     : 0x00000000
         Client Capabilities: 0x0000000000000002 interval-uses-which Required ioctls:
         test VIDIOC_SUDBEV_QUERYCAP: OK
         test invalid ioctls: OK

Allow for multiple opens:
         test second /dev/v4l-subdev0 open: OK
         test VIDIOC_SUBDEV_QUERYCAP: OK
         test for unlimited opens: OK

Debug ioctls:
         test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
         test VIDIOC_ENUMAUDIO: OK (Not Supported)
         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
         test VIDIOC_G/S_AUDIO: OK (Not Supported)
         Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
         Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
         test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
         test VIDIOC_QUERYCTRL: OK
         test VIDIOC_G/S_CTRL: OK
         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
         Standard Controls: 11 Private Controls: 0

Format ioctls:
         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
         test VIDIOC_G/S_PARM: OK (Not Supported)
         test VIDIOC_G_FBUF: OK (Not Supported)
         test VIDIOC_G_FMT: OK (Not Supported)
         test VIDIOC_TRY_FMT: OK (Not Supported)
         test VIDIOC_S_FMT: OK (Not Supported)
         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
         test Cropping: OK (Not Supported)
         test Composing: OK (Not Supported)
         test Scaling: OK (Not Supported)

Codec ioctls:
         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
         test CREATE_BUFS maximum buffers: OK
         test VIDIOC_REMOVE_BUFS: OK
         test VIDIOC_EXPBUF: OK (Not Supported)
         test Requests: OK (Not Supported)
         test blocking wait: OK (Not Supported)

Total for device /dev/v4l-subdev0: 46, Succeeded: 46, Failed: 0, Warnings: 0
---

Compliance test for amd_isp_capture device /dev/video0:
-------------------------------------------------------
atg@isp-pv-linux:~/test$ sudo ./v4l2-compliance -d /dev/video0
v4l2-compliance 1.29.0-5348, 64 bits, 64-bit time_t v4l2-compliance SHA: 75e3f0e2c2cb 2025-03-17 18:12:17

Compliance test for amd_isp_capture device /dev/video0:

Driver Info:
         Driver name      : amd_isp_capture
         Card type        : amd_isp_capture
         Bus info         : platform:amd_isp_capture
         Driver version   : 6.14.0
         Capabilities     : 0xa4200001
                 Video Capture
                 I/O MC
                 Streaming
                 Extended Pix Format
                 Device Capabilities
         Device Caps      : 0x24200001
                 Video Capture
                 I/O MC
                 Streaming
                 Extended Pix Format
Media Driver Info:
         Driver name      : amd_isp_capture
         Model            : amd_isp41_mdev
         Serial           :
         Bus info         : platform:amd_isp_capture
         Media version    : 6.14.0
         Hardware revision: 0x00000000 (0)
         Driver version   : 6.14.0
Interface Info:
         ID               : 0x03000003
         Type             : V4L Video
Entity Info:
         ID               : 0x00000001 (1)
         Name             : Preview
         Function         : V4L2 I/O
         Pad 0x01000002   : 0: Sink
           Link 0x02000007: from remote pad 0x1000006 of entity 'ov05c10 99-0010' (Camera Sensor): Data, Enabled, Immutable

Required ioctls:
         test MC information (see 'Media Driver Info' above): OK
         test VIDIOC_QUERYCAP: OK
         test invalid ioctls: OK

Allow for multiple opens:
         test second /dev/video0 open: OK
         test VIDIOC_QUERYCAP: OK
         test VIDIOC_G/S_PRIORITY: OK
         test for unlimited opens: OK

Debug ioctls:
         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
         test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
         test VIDIOC_ENUMAUDIO: OK (Not Supported)
         test VIDIOC_G/S/ENUMINPUT: OK
         test VIDIOC_G/S_AUDIO: OK (Not Supported)
         Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
         Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
         test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
         test VIDIOC_QUERYCTRL: OK (Not Supported)
         test VIDIOC_G/S_CTRL: OK (Not Supported)
         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
         Standard Controls: 0 Private Controls: 0

Format ioctls (Input 0):
         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
         test VIDIOC_G/S_PARM: OK
         test VIDIOC_G_FBUF: OK (Not Supported)
         test VIDIOC_G_FMT: OK
         test VIDIOC_TRY_FMT: OK
         test VIDIOC_S_FMT: OK
         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
         test Cropping: OK (Not Supported)
         test Composing: OK (Not Supported)
         test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
         test CREATE_BUFS maximum buffers: OK
         test VIDIOC_REMOVE_BUFS: OK
         test VIDIOC_EXPBUF: OK
         test Requests: OK (Not Supported)
         test blocking wait: OK

Total for amd_isp_capture device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0

Please review and provide feedback.

Many thanks,
Bin Du (9):
  media: platform: amd: Introduce amd isp4 capture driver
  media: platform: amd: low level support for isp4 firmware
  media: platform: amd: Add helpers to configure isp4 mipi phy
  media: platform: amd: Add isp4 fw and hw interface
  media: platform: amd: isp4 subdev and firmware loading handling added
  media: platform: amd: isp4 video node and buffers handling added
  media: platform: amd: isp4 debug fs logging and  more descriptive
    errors
  Documentation: add documentation of AMD isp 4 driver
  MAINTAINERS: add entry for AMD isp 4 driver

 Documentation/admin-guide/media/amdisp4-1.rst |   60 +
 Documentation/admin-guide/media/amdisp4.dot   |    8 +
 MAINTAINERS                                   |   10 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/amd/Kconfig            |   15 +
 drivers/media/platform/amd/Makefile           |    5 +
 drivers/media/platform/amd/isp4/Makefile      |   36 +
 drivers/media/platform/amd/isp4/isp4.c        |  379 +++++
 drivers/media/platform/amd/isp4/isp4.h        |   37 +
 drivers/media/platform/amd/isp4/isp4_debug.c  |  272 +++
 drivers/media/platform/amd/isp4/isp4_debug.h  |   41 +
 .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  318 ++++
 drivers/media/platform/amd/isp4/isp4_hw.c     |   46 +
 drivers/media/platform/amd/isp4/isp4_hw.h     |   14 +
 drivers/media/platform/amd/isp4/isp4_hw_reg.h |  116 ++
 .../media/platform/amd/isp4/isp4_interface.c  | 1069 ++++++++++++
 .../media/platform/amd/isp4/isp4_interface.h  |  164 ++
 drivers/media/platform/amd/isp4/isp4_phy.c    | 1507 +++++++++++++++++
 drivers/media/platform/amd/isp4/isp4_phy.h    |   14 +
 drivers/media/platform/amd/isp4/isp4_subdev.c | 1338 +++++++++++++++
 drivers/media/platform/amd/isp4/isp4_subdev.h |  147 ++
 drivers/media/platform/amd/isp4/isp4_video.c  | 1457 ++++++++++++++++
 drivers/media/platform/amd/isp4/isp4_video.h  |   93 +
 24 files changed, 7148 insertions(+)
 create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
 create mode 100644 Documentation/admin-guide/media/amdisp4.dot
 create mode 100644 drivers/media/platform/amd/Kconfig
 create mode 100644 drivers/media/platform/amd/Makefile
 create mode 100644 drivers/media/platform/amd/isp4/Makefile
 create mode 100644 drivers/media/platform/amd/isp4/isp4.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_hw.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_hw.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_phy.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_phy.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_video.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_video.h

-- 
2.34.1


