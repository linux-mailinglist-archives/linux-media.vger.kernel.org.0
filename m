Return-Path: <linux-media+bounces-41232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 276DAB39800
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 11:17:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E308717BF70
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 09:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F100A2C15AF;
	Thu, 28 Aug 2025 09:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZVeDCsU7"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2055.outbound.protection.outlook.com [40.107.101.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06C426D4EB;
	Thu, 28 Aug 2025 09:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756372669; cv=fail; b=u7JosGsWzt8NMMk+JzI0L12oMLN5pofge6BAUfloOBEsnUdrGEr0TFkpS/gwr3BFRz/ZL0UB4U60riU7xFQ8XpJbEsZECL9vyIDTZMlLtuS61pBlkQPLiJ2I6tZNf+jeem3RzvKfivI1CssEOgQiu97dFDb2sCc0XE2fVBIoL9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756372669; c=relaxed/simple;
	bh=urtqQysZ02JmxXHaMNZYLoUPK5OsX/kpkCdn+GbEEMg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bLJDtpdis8DZxFoucSBwE/QiThriJ2fr0c2k3jn4thCkNbMRBACbCHR4Q2TBdIfcTcnJW0I6HNAh+tcyKgvaYNas5f8iV/h2rrsruD9mZ59sSKe+CiRx58cX2zmkFbA7eJnGnqjcZNYzOMaSnh0Mlb22Cx3kUlVJBJpCSqdpXMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZVeDCsU7; arc=fail smtp.client-ip=40.107.101.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lc0nzR4q718+9FAmdaQa3RsU2xQN3NZ8Wg8f5f3S8xfTCoOQeM/kaHCubAPJTlvjQEnk3gXk1nqUXnFn1fqlEpxCjFErecCubJ5OHzgJIKs2pdQulTF/krHY+Jrxu1X6Cjv6k9FgO+dl/cXURY7C3CAQu8vE+DJrnbGFoEtvwM2Sf/Q++HgCgBr0R42RqDsuWz/ArgeNElNgNPPrEwestyFx7Dq9hwkRLVZp+Sot1p6/YxlAmMgJ06c6A2jKRWPLKtVLsYLi0rgX4O+FuGpt57fWfBwepFx3Rgco+NtqA4kQmrhDBt52sUD6OvQLt6rnbp4qQCbLcBH/tY/8NagjNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLxVZ3sJvbVJ7+yBPnAEUieQGTrl5VIy0BJ5vQ1cSvY=;
 b=YbQgVpWksfz+h68Cmi3XbJmimxJesGyYoyk4fR9Q/9mZuL7r9STJxEY5tKgafZc0rx/CesnplEnkz58wl3CL4a1m3PrJ4KfewiICrYiq/PrBj7qOjH53TvcKaVtioq0A39KEthl/PaAkczsRJ1JkdNJi7XC20ymZhdbAkaxr8cv5pVpm3WfuH3V29aXg6Gfcx0OQlkoKyvQ4p2oshShfVMDFeYenpGwiuky60zMZxV5AyclnowJeGfaKI9BUWCr2RvblqdG1U2wLx/f8bYV5qXlFf6ystRmnwk7xSuG6luMbQ6YOWz1yH9vBp+B8+WbJYQI4tKMux4XWAP98/kr37Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLxVZ3sJvbVJ7+yBPnAEUieQGTrl5VIy0BJ5vQ1cSvY=;
 b=ZVeDCsU76VExz5vdNKf6B9LTLYYbxzQi4CewcnVXkNKWFpf9qSZX6oSImfNinLBOeHeNiZWf9A73hG0pl57W/sVWSdI8MCpSs2f6K5U9TQB9CpGQjIz9ATziRiiiisr1RDxg9QgRwy7Xz/OJwfQtMkWYZCkxTzmtfobVsleAf9Q=
Received: from CH0PR08CA0008.namprd08.prod.outlook.com (2603:10b6:610:33::13)
 by CY5PR12MB6298.namprd12.prod.outlook.com (2603:10b6:930:21::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 28 Aug
 2025 09:17:35 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:33:cafe::f6) by CH0PR08CA0008.outlook.office365.com
 (2603:10b6:610:33::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.18 via Frontend Transport; Thu,
 28 Aug 2025 09:17:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Thu, 28 Aug 2025 09:17:35 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 03:45:29 -0500
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 28 Aug
 2025 01:45:24 -0700
From: Bin Du <Bin.Du@amd.com>
To: <mchehab@kernel.org>, <hverkuil@xs4all.nl>,
	<laurent.pinchart+renesas@ideasonboard.com>, <bryan.odonoghue@linaro.org>,
	<sakari.ailus@linux.intel.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<sultan@kerneltoast.com>
CC: <pratap.nirujogi@amd.com>, <benjamin.chan@amd.com>, <king.li@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <Phil.Jawich@amd.com>,
	<Dominic.Antony@amd.com>, <mario.limonciello@amd.com>,
	<richard.gong@amd.com>, <anson.tsao@amd.com>, <bin.du@amd.com>, Bin Du
	<Bin.Du@amd.com>
Subject: [PATCH v3 0/7] Add AMD ISP4 driver
Date: Thu, 28 Aug 2025 16:45:00 +0800
Message-ID: <20250828084507.94552-1-Bin.Du@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|CY5PR12MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: 95ebf81c-804e-46fa-3eef-08dde613ba04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U6o4IHgUzy0r73XbF0EvFdCwL5k0qMLMK7EA+1+exSy6nv2xA+QJcK6W8Eom?=
 =?us-ascii?Q?krtTIPZdW5WiqRuLCN5WqN6uaTm+lL8y+S2FIaf1p005kepu2l3BXlOjoIP9?=
 =?us-ascii?Q?KgcpXYojehO88JA2b2LY75s5U+LEQDgzA9bsbMEATxehoizhfLFd+2dnqr31?=
 =?us-ascii?Q?K+zwj9ZczjZrrnekZtGASk7lEhtlMbYA8Pwrs5eGGH8vBrofX6Sv4CrXUsgP?=
 =?us-ascii?Q?Bbm06x4rA42DY65evJsrwdYMsi/tWeidBqaJVI5mFPdTSG3zCUI443E0jSqZ?=
 =?us-ascii?Q?g8xyeMiEpr9ffVQND9IKGj251bVx9vCxla1Mkf3ndYLbW8YytiZjAGp3aU4J?=
 =?us-ascii?Q?PhRGCivmMZLHrb3mUk1YB60fWmlhy1rD8MgaWs46gTLSo92KRO0yMp01ze2s?=
 =?us-ascii?Q?2x/BwuR+fzuGpmk69hXw5CWh5CcunwUrmU29MEzhPrHXNkY2w2VqCtX5VfNQ?=
 =?us-ascii?Q?TvJeR/YUZu93+bYh1ZlEucwkixYBXirXgQPyZTVJWwf34FNtwt2S0SyYhPOk?=
 =?us-ascii?Q?AP9os9C++wX7VsRXAprSS7lNRwi8lU9QslZ6YaRJtWHztbtAhad0tNpZayvh?=
 =?us-ascii?Q?Isql6/gVdVJOLYxHQhwFMLitPr5X93r7+dG0Zs2l2IeoDcSqE51LI5ffK4R9?=
 =?us-ascii?Q?R3YiuxeCvm/E3zgcVMqe6L43lVeKOX/rEYc+yHqopxKi7rkKmH/RJOlTOs5D?=
 =?us-ascii?Q?2Q98k/8ijBn6Xy3iFjIpowXU6+aGPDXwJef+cULoHlJsY9rjaLVwN/mhCKZi?=
 =?us-ascii?Q?ljmJseKUskzdXoF7/2QuKnB4W7Q/zIQ0AZqPPV+rRmXfqgk35ISm9L1KkcBh?=
 =?us-ascii?Q?v8U5z+JSbPjnOkg1ILatKRw1fHA1dWyFHISQUwFEUNLv6JhT5jwOqPAIIKJq?=
 =?us-ascii?Q?zM42lJLcmFqCa8hjqCQIUEnZXVdmRQD8ILIqeRCQbVlkUDSBuEcvgVdgSyj6?=
 =?us-ascii?Q?yHqgNUYU5oF6A9GoHlfb8FX43+cIs+e0NGGqjy5kvN2doDwfdHsMEpKcY7N5?=
 =?us-ascii?Q?n0qJ8LKTFgJYfz8RfvsCeLASDsWD+EXlrMToeCafFnFCHYvE0Ws0Y227564k?=
 =?us-ascii?Q?ovC80BFE7c1ef90RbSEAEEs11wPvbJLzZnLmMp8LqcL6QX79/MghQB6ZgB4L?=
 =?us-ascii?Q?T9Db5I96fvhURPflVyGeMJPbJO2dOrmPSm5yYk8f8B4yodifT23+eLP1EE0G?=
 =?us-ascii?Q?84Zhe5kpghqghgNu1lf9y3U9KTJe+Xb4hf9X90gXwlc/d6mD2Zd+9vBIyJqd?=
 =?us-ascii?Q?9VN9aZNhi55i5SBPxc9rzkJfZ9kf3A0w//lKIHPGTdxPijvjbSmmXTZrtOPP?=
 =?us-ascii?Q?EnppyNUQbAfWK3preuvJLQAGFduv1J5o7bJ0fAqpI/lJgk0BBcnMnafXF9As?=
 =?us-ascii?Q?1V/oJCkeeOKWpeHxDIvWdNCXqrl0JoraTiRzdHoevZa6jMjzd8om7tb313Yj?=
 =?us-ascii?Q?hscZYy5IeMjH6kh+CFdTVQVpxPEiJc60trsE1dppHcoucvMMjizMXw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 09:17:35.5551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ebf81c-804e-46fa-3eef-08dde613ba04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6298

Hello,

AMD ISP4 is the AMD image processing gen 4 which can be found in HP ZBook Ultra G1a 14 inch Mobile Workstation PC ( Ryzen AI Max 385)
(https://ubuntu.com/certified/202411-36043)
This patch series introduces the initial driver support for the AMD ISP4.

Patch summary:
- Powers up/off and initializes ISP HW
- Configures and kicks off ISP FW
- Interacts with APP using standard V4l2 interface by video node
- Controls ISP HW and interacts with ISP FW to do image processing
- Support enum/set output image format and resolution
- Support queueing buffer from app and dequeueing ISP filled buffer to App
- It supports libcamera ver0.2 SimplePipeline
- It is verified on qv4l2, cheese and qcam
- It is verified together with following patches
	platform/x86: Add AMD ISP platform config (https://lore.kernel.org/all/20250514215623.522746-1-pratap.nirujogi@amd.com/)
	pinctrl: amd: isp411: Add amdisp GPIO pinctrl (https://github.com/torvalds/linux/commit/e97435ab09f3ad7b6a588dd7c4e45a96699bbb4a)
	drm/amd/amdgpu: Add GPIO resources required for amdisp (https://gitlab.freedesktop.org/agd5f/linux/-/commit/ad0f5966ed8297aa47b3184192b00b7379ae0758)

AMD ISP4 Key features:
- Processes bayer raw data from the connected sensor and output them to different YUV formats
- Downscale input image to different output image resolution
- Pipeline to do image processing on the input image including demosaic, denoise, 3A, etc

----------

Changes v2 -> v3:

- All the dependent patches in other modules (drm/amd/amdgpu, platform/x86, pinctrl/amd) merged on upstream mainline kernel (https://github.com/torvalds/linux) v6.17.
- Removed usage of amdgpu structs in ISP driver. Added helper functions in amdgpu accepting opaque params from ISP driver to allocate and release ISP GART buffers.
- Moved sensor and MIPI phy control entirely into ISP FW instead of the previous hybrid approach controlling sensor from both FW and x86 (sensor driver).
- Removed phy configuration and sensor binding as x86 (sensor driver) had relinquished the sensor control for ISP FW. With this approach the driver will be exposed as web camera like interface.
- New FW with built-in sensor driver is submitted on upstream linux-firmware repo (https://gitlab.com/kernel-firmware/linux-firmware/).
- Please note the new FW submitted is not directly compatible with OEM Kernel ISP4.0 (https://github.com/amd/Linux_ISP_Kernel/tree/4.0) and the previous ISP V2 patch series.
- If intend to use the new FW, please rebuild OEM ISP4.0 Kernel with CONFIG_VIDEO_OV05C10=N and CONFIG_PINCTRL_AMDISP=Y.
- Included critical fixes from Sultan Alsawaf branch (https://github.com/kerneltoast/kernel_x86_laptop.git) related to managing lifetime of isp buffers.
      media: amd: isp4: Add missing refcount tracking to mmap memop
      media: amd: isp4: Don't put or unmap the dmabuf when detaching
      media: amd: isp4: Don't increment refcount when dmabuf export fails
      media: amd: isp4: Fix possible use-after-free in isp4vid_vb2_put()
      media: amd: isp4: Always export a new dmabuf from get_dmabuf memop
      media: amd: isp4: Fix implicit dmabuf lifetime tracking
      media: amd: isp4: Fix possible use-after-free when putting implicit dmabuf
      media: amd: isp4: Simplify isp4vid_get_dmabuf() arguments
      media: amd: isp4: Move up buf->vaddr check in isp4vid_get_dmabuf()
      media: amd: isp4: Remove unused userptr memops
      media: amd: isp4: Add missing cleanup on error in isp4vid_vb2_alloc()
      media: amd: isp4: Release queued buffers on error in start_streaming
- Addressed all code related upstream comments
- Fix typo errors and other cosmetic issue.


Changes v1 -> v2:

- Fix media CI test errors and valid warnings
- Reduce patch number in the series from 9 to 8 by merging MAINTAINERS adding patch to the first patch
- In patch 5
	- do modification to use remote endpoint instead of local endpoint
	- use link frequency and port number as start phy parameter instead of extra added phy-id and phy-bit-rate property of endpoint

----------

It passes v4l2 compliance test, the test reports for:

(a) amd_isp_capture device /dev/video0

Compliance test for amd_isp_capture device /dev/video0:
-------------------------------------------------------

atg@atg-HP-PV:~/bin$ ./v4l2-compliance -d /dev/video0
v4l2-compliance 1.29.0-5348, 64 bits, 64-bit time_t
v4l2-compliance SHA: 75e3f0e2c2cb 2025-03-17 18:12:17

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
        ID               : 0x03000005
        Type             : V4L Video
Entity Info:
        ID               : 0x00000003 (3)
        Name             : Preview
        Function         : V4L2 I/O
        Pad 0x01000004   : 0: Sink
          Link 0x02000007: from remote pad 0x1000002 of entity 'amd isp4' (Image Signal Processor): Data, Enabled, Immutable

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

Bin Du (7):
  media: platform: amd: Introduce amd isp4 capture driver
  media: platform: amd: low level support for isp4 firmware
  media: platform: amd: Add isp4 fw and hw interface
  media: platform: amd: isp4 subdev and firmware loading handling added
  media: platform: amd: isp4 video node and buffers handling added
  media: platform: amd: isp4 debug fs logging and  more descriptive
    errors
  Documentation: add documentation of AMD isp 4 driver

 Documentation/admin-guide/media/amdisp4-1.rst |   66 +
 Documentation/admin-guide/media/amdisp4.dot   |    8 +
 .../admin-guide/media/v4l-drivers.rst         |    1 +
 MAINTAINERS                                   |   25 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/amd/Kconfig            |    3 +
 drivers/media/platform/amd/Makefile           |    3 +
 drivers/media/platform/amd/isp4/Kconfig       |   13 +
 drivers/media/platform/amd/isp4/Makefile      |   10 +
 drivers/media/platform/amd/isp4/isp4.c        |  237 ++++
 drivers/media/platform/amd/isp4/isp4.h        |   26 +
 drivers/media/platform/amd/isp4/isp4_debug.c  |  272 ++++
 drivers/media/platform/amd/isp4/isp4_debug.h  |   41 +
 .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  314 +++++
 drivers/media/platform/amd/isp4/isp4_hw_reg.h |  125 ++
 .../media/platform/amd/isp4/isp4_interface.c  |  972 +++++++++++++
 .../media/platform/amd/isp4/isp4_interface.h  |  149 ++
 drivers/media/platform/amd/isp4/isp4_subdev.c | 1198 ++++++++++++++++
 drivers/media/platform/amd/isp4/isp4_subdev.h |  133 ++
 drivers/media/platform/amd/isp4/isp4_video.c  | 1213 +++++++++++++++++
 drivers/media/platform/amd/isp4/isp4_video.h  |   87 ++
 22 files changed, 4898 insertions(+)
 create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
 create mode 100644 Documentation/admin-guide/media/amdisp4.dot
 create mode 100644 drivers/media/platform/amd/Kconfig
 create mode 100644 drivers/media/platform/amd/Makefile
 create mode 100644 drivers/media/platform/amd/isp4/Kconfig
 create mode 100644 drivers/media/platform/amd/isp4/Makefile
 create mode 100644 drivers/media/platform/amd/isp4/isp4.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_video.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_video.h

-- 
2.34.1


