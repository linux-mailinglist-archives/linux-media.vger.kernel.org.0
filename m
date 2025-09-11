Return-Path: <linux-media+bounces-42281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B1CB52DF6
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 12:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84FE45678B6
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F0E30EF82;
	Thu, 11 Sep 2025 10:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZKOR1zM3"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992B027E05E;
	Thu, 11 Sep 2025 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757585360; cv=fail; b=ODa3y6QUrargmT2G4rDK0dIlgV7ypTS2Y6RmIImtAALqqeVi7lwN9n4tB+8iCRrbur9OMpxit9hhnsoQOWxWNOXvHMv8bpNQG9z0LG9PiMu28pu53wFLbLTvbaTBG3UCmZHeFueVCxqMptCWKRscy/+zmCNr2+pwHIrwum6wTu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757585360; c=relaxed/simple;
	bh=52ORY9GyZCLQQrZOZilRlV53gzhbQgDqzKZf2a448fo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uoq2SxyeKWGjK0OHpQNxWfgcT/vRlDK0CZfy35ri5mOVv8EQaf2cxvC2OYp/tbfZP5A+zVALgDgN11pHpMfLM54iObN9K3tXgLgPggISLiXx0pierJ6WSpgkSKis/VU8WQQMEJSfDf5zOHeILwSN7DW20NrC1GKWewhhpwnJBcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZKOR1zM3; arc=fail smtp.client-ip=40.107.236.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lPZhu9tcmaIxpS+FowGRCrMKoAHIZSlZTFfwrsP+4945pbS7jw/rt6KHdltbQdta+VpTmJRWMH/sUR0MYibsrDoQlEZFvbGLv3L9LfonUGo/9mqDNnSRAynIdj8PUEtf8Qeo2kpXJtsN0M0tCRu6btsyZgTUjfYoj53aMnoMztiWeY7GfsahGKMtDSC9Ln2voE8HpZylwl8nsKrLQGP5W06TX6Epx9vEb+rGoQfF1AhAVilyiZ6BPOoFee/T3fH5SnH1ZALbJIkvJvWCTduDU3/2QsK9IfATFL5pbv33ij/TnAEJaRM8ffxxAdc4WErKODCRdLfazdcPiY8yG3Dytg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8p8KrKJ8xW6nqQYBbRRlgkfTaTuzedYApVfKwyYmXpk=;
 b=HfiwYdvXingMUnUEpE0L9s9JXugjsNL6MGeiDIrtoJjh8IqNfa8Zs2sRTTHQfMNtI9PbzMiznHf4EKoCVAeNl2HqaKafh5PvguTQu968fUbYJG06L78to5GIQkFLjc69iHeP8jDNlLpokoHaYeGrQtAZw8GzGeyGb/n1F9svhnOcGTspcz4nfhqDwbPe4v+AMpXVnupgKxb4K8dNXJlp3BxZy7r1lXkq82/6DAz8ODXNCQJWX0PGgWgWybfBR3KjoWOxyQYNFvkseRqnT+b+o/0lo0+DRqI5wo8lL5FEnhYH1nSLredMjpYCHgs96c5rx5eYL7Zn5du0MkOh15Og7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8p8KrKJ8xW6nqQYBbRRlgkfTaTuzedYApVfKwyYmXpk=;
 b=ZKOR1zM3vUAiaUwIhlB8dbdV4RLW7ezbnLfUcbmYHWuRU7ELnJODqvh9fRKY/TJQLAovv/KRXEZPHF8oLrMjXaPdkeN6zO26E9q94jlCvP7xp2qURpdU+Own2WkEenMg1ILp1CEwUdZBLLKVuJYbCWkPAjaBPxLaSr4RZlUg0Uk=
Received: from BN0PR10CA0005.namprd10.prod.outlook.com (2603:10b6:408:143::19)
 by IA1PR12MB8310.namprd12.prod.outlook.com (2603:10b6:208:3ff::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 10:09:12 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:408:143:cafe::98) by BN0PR10CA0005.outlook.office365.com
 (2603:10b6:408:143::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Thu,
 11 Sep 2025 10:09:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 10:09:12 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Sep
 2025 03:09:07 -0700
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
Subject: [PATCH v4 0/7] Add AMD ISP4 driver
Date: Thu, 11 Sep 2025 18:08:40 +0800
Message-ID: <20250911100847.277408-1-Bin.Du@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|IA1PR12MB8310:EE_
X-MS-Office365-Filtering-Correlation-Id: a1133392-48d2-4cbe-61fe-08ddf11b41b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gg0BhjEiDkdA0wn+stewU2bQZqdqgxzLsZoNOTFeazuXriGdLEMU1qrtxEz/?=
 =?us-ascii?Q?ZuStgt6twFL6XEt1gLlhAq4rCQk2NJs3GgdeHv5i4ZN4OP2iLu6k5Be6xHya?=
 =?us-ascii?Q?qPatAFdGk/7dKVG1czhsLhJ54UK2L9JrwRVo5jpHuwpIN0ztkOZc4bRMFldP?=
 =?us-ascii?Q?kPY23+urVBGEIluOz/7r6ouSbMWckhoAPmHuY0j3eZzH2Z2Q6B+GOL3WtQHN?=
 =?us-ascii?Q?4XgOLGDh6RG5zS8PPh3zYSvJNcr+fCh/8dxAzIGeYXWcTBCtC1aiKXKdFWcC?=
 =?us-ascii?Q?2SeUoNVzVlDlWzAakDbi3zmNR+RwtXXB7aV9D/uEkjpgegnIDL4XSqxq9WHX?=
 =?us-ascii?Q?tz8VEVsdnN9flT5rpaBGmy/41pJ400JIOJQppkyzOe+4FsQxbv0zTl31P0L0?=
 =?us-ascii?Q?YhymSjr4YLW8O0eooXcgPHsCQWCqpai0Ey8/oY1lxrfXiTFuZOIw2MBwj92C?=
 =?us-ascii?Q?1lerkUIT1y7mjJsABp8lyCcb4iOmG733KH9iOD41RLPDsYtQ2CHdpr+letgU?=
 =?us-ascii?Q?tZJ90z3Qj29xmVBCpPiBBmrpYnf/uvO0KyFkdDdeFZ2/T4nHIEDhKHhixfCQ?=
 =?us-ascii?Q?OK/Ssm9C40VgIM7Kuic5k5OFZU6La+Y+zt6ot3hsa/q1Mz7Bev7OZbYE1B8l?=
 =?us-ascii?Q?O5NrtczuRxMxcVJ0GETOG4uQJRL9o9OBu2tI+RYRi4FMmcl5FtRqwWO/F4/x?=
 =?us-ascii?Q?W4aw0+tkyEEYA0PTPzYljXNTCo9u5gNosLpkoBsSnLvhMq4oBZK4B8O+OG0L?=
 =?us-ascii?Q?ygiVbsWyAOkvv8WuNAO3inAjasmNfCCIeuG0kbRFyP/WrRtDi9J6epZd18oF?=
 =?us-ascii?Q?mAi6be4JOvsFzamBi0lIAP+UGsfqn4RazgDDB/2fhl5+ryA+9F7JBylZicEL?=
 =?us-ascii?Q?A27N/D8VQjgDAWPIHKm3L8arQ6T3KSTCVTgd8eeD0WFLQrI+iywIJHhvzA+7?=
 =?us-ascii?Q?D8nb5N8nm/dRSCfq5P5IixtVCYTdux7UmCyR4rwSx0tEe9SMXfuY1KVhccRj?=
 =?us-ascii?Q?ress8m7GqDUf3lPUNjLIAS25Z9123CjPHhSb5PvYY4CdbR8nwRADJw1R1ysa?=
 =?us-ascii?Q?9c8Fp7efuPlzDrfIUsALSr+kB0lgdx9A6wSS7pYmWlOT00aFVFmmVqvVXtQJ?=
 =?us-ascii?Q?7FsPB6Jw9EFFHz3UQYw3DeaAorkjthcPtT2MLucjOBPMbyS0riuvjMjDSAhc?=
 =?us-ascii?Q?fUs8PBihXGdbX/jkEoRe/f8mR1zF06piypNfvJS4r8QHJ65zQVYDZJEcms3E?=
 =?us-ascii?Q?0vF1tQ3ttLzCI8LulUbGpCtfZWfH18aSikwU7/cwG5oq/T7Ni6601u9376gX?=
 =?us-ascii?Q?rNlMogTh6QTsWhkL9ToJJhFa9B9wE7HSVKLmvIlgHW9sWp02CYOVeOwXWNib?=
 =?us-ascii?Q?10uZv8h+QRzjo1A/qrPqmcawu1IItGW29li9L+5VsChh/rx13TKoIll4g6Jy?=
 =?us-ascii?Q?GbX8ROEOf15f1lTag03BvWTMhQyGG4YEfI6LGeyduHynWmDiRmFw/Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 10:09:12.5060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1133392-48d2-4cbe-61fe-08ddf11b41b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8310

Hello,

AMD ISP4 is the AMD image processing gen 4 which can be found in HP ZBook Ultra G1a 14 inch Mobile Workstation PC (Ryzen AI Max 300 Series)
(https://ubuntu.com/certified/202411-36043)
This patch series introduces the initial driver support for the AMD ISP4.

Patch summary:
- Powers up/off and initializes ISP HW
- Configures and kicks off ISP FW
- Interacts with APP using standard V4l2 interface by video node
- Controls ISP HW and interacts with ISP FW to do image processing
- Supports enum/set output image format and resolution
- Supports queueing buffer from app and dequeuing ISP filled buffer to App
- It is verified on qv4l2, cheese and qcam
- It is verified together with following patches
	platform/x86: Add AMD ISP platform config (https://lore.kernel.org/all/20250514215623.522746-1-pratap.nirujogi@amd.com/)
	pinctrl: amd: isp411: Add amdisp GPIO pinctrl (https://github.com/torvalds/linux/commit/e97435ab09f3ad7b6a588dd7c4e45a96699bbb4a)
	drm/amd/amdgpu: Add GPIO resources required for amdisp (https://gitlab.freedesktop.org/agd5f/linux/-/commit/ad0f5966ed8297aa47b3184192b00b7379ae0758)
	drm/amd/amdgpu: Declare isp firmware binary file (https://gitlab.freedesktop.org/agd5f/linux/-/commit/35345917bc9f7c86152b270d9d93c220230b667f)

AMD ISP4 Key features:
- Processes bayer raw data from the connected sensor and output them to different YUV formats
- Downscale input image to different output image resolution
- Pipeline to do image processing on the input image including demosaic, denoise, 3A, etc.

----------

Changes v3 -> v4:

- Replace one mutex with guard mutex.
- Remove unnecessary bus_info initialization of v4l2_capability.
- Drop V4L2_CAP_IO_MC from capabilities of v4l2_capability.
- Modify document with better SOC description.
- Fix Test x86 failure in Media CI test https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/83470456/artifacts/report.htm
- Modify some commit messages by describing changes in imperative mood.
- Add media-ctl output in cover letter.
- Create separated dedicated amdgpu patch to add declaration MODULE_FIRMWARE("amdgpu/isp_4_1_1.bin");
- Fix typo errors and other cosmetic issues.
- Add DRM_AMD_ISP dependency in Kconfig.


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
- Fix typo errors and other cosmetic issues.


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

The media-ctl output of media device /dev/media0:
-------------------------------------------------------

atg@atg-HP-PV:~$ media-ctl -p -d /dev/media0
Media controller API version 6.17.0

Media device information
------------------------
driver          amd_isp_capture
model           amd_isp41_mdev
serial
bus info        platform:amd_isp_capture
hw revision     0x0
driver version  6.17.0

Device topology
- entity 1: amd isp4 (1 pad, 1 link, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
        pad0: Source
                -> "Preview":0 [ENABLED,IMMUTABLE]

- entity 3: Preview (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video0
        pad0: Sink
                <- "amd isp4":0 [ENABLED,IMMUTABLE]

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

 Documentation/admin-guide/media/amdisp4-1.rst |   63 +
 Documentation/admin-guide/media/amdisp4.dot   |    6 +
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
 .../media/platform/amd/isp4/isp4_interface.c  |  966 +++++++++++++
 .../media/platform/amd/isp4/isp4_interface.h  |  149 ++
 drivers/media/platform/amd/isp4/isp4_subdev.c | 1197 ++++++++++++++++
 drivers/media/platform/amd/isp4/isp4_subdev.h |  133 ++
 drivers/media/platform/amd/isp4/isp4_video.c  | 1207 +++++++++++++++++
 drivers/media/platform/amd/isp4/isp4_video.h  |   87 ++
 22 files changed, 4880 insertions(+)
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


