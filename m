Return-Path: <linux-media+bounces-48860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76241CC1B42
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 10:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA94A3012754
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 09:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0064833A6E8;
	Tue, 16 Dec 2025 09:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aWV9NaGM"
X-Original-To: linux-media@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013024.outbound.protection.outlook.com [40.93.201.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394ED2E413;
	Tue, 16 Dec 2025 09:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765876441; cv=fail; b=tIWeoiCx4Hz0eH5Chnc4StuDlxTCzitTzOUeH5hpKhbNcZWsLQntO+F4WRTuHk/dCOtWdu1ypEoE1wqqpQw4eQdp+xUB1q6iKp0MYIYWHmGrUoO7uzke+SeUxSlgB+UCbqSRyRIYA4OFdAMKzCXoH4DGGkA3fKkhrm7rThTKN5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765876441; c=relaxed/simple;
	bh=zhqVxbnFYnNjSM7gT44IpdrpHPop5yRY5kfevWalSfo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dGwbfjHz0+Fg0HZ9xZotXTCTciKyrEQWCqD0aaBaRAEG491m+bw/tlKSgAhOOxxxpxrWGCVSMQMgrHbWxc+q4pXWg0I6bxgTasSm5o3Ltv7hWaVzQnyg+UsYWWO4rXda2gE6h0Wrp+g3lQSd85Pz9QTYkYssqRYEL3hNEujmRYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aWV9NaGM; arc=fail smtp.client-ip=40.93.201.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uE4HfwVI9XAfuT6SyNK865TDpJ/9XqXNIlSg/nVIDoschVUzi/kTboWBV/8Usp5P5peFDuuBSszIsqjt3J9NgwUllJ5tnTXbSkQDdB7JPBuoo7hCkGl3z9DQBoGT/htkl1bUBilsQfmdMlLes7cvB2kDoDDzKS4A+p8rbPVb1Kd2Ta4m2cKiAapAczw46FmbpKKSsEjnO7cGuATWXmfpy8uci6I+TtapOQheQWYpSjToAWWehkXi1TaNCfrZCw6YONMF32OuzP2eqvl6dyDeK3y8pUSOy5LuLrGX4JvMqpNHjT/B4VEqxRz0jfpVPBg4Ft+uSUDIQyD4ketww8JZaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwbApB7U1iq6nA6PLM5FmC5Rx2MINC/UwxchpsMAxIA=;
 b=DdDGwqskyVzS/0ENz1mTWZyRUio4gLxJ15GzYyRa3l4363r49AJm96+BltKyBqcJdJ/bw/87t9JnahLH5rnFfcOrQHr5OAXMNZxQNdPdslMeeUZCkgqtC3B0yTHxW+ONHAXoNDIMv6va1Df/7JWFpjoZ60vsi/KNwLGWXJDntjVxVJgf3mH7Z0odIGuC4nJre0PWzInJSzozICPrS0WCY2BmaJ2Chu9Bi2zzkaW7smF4adM0vH59EeAt0Eeh8ZBplbcY/GsOY+1QXUp71DhIMgp7Zy4dnDao6EZsgLv7/zIaA6cGcdY9OkKNSzwOJrfJsRvA0C4kqUoaHocTryuq9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwbApB7U1iq6nA6PLM5FmC5Rx2MINC/UwxchpsMAxIA=;
 b=aWV9NaGMbGA9+QYLQlhHRygBCngqFU6DOPXOxzMp2sOZEofonkAWz7Yspl+72A8wJwyVBWyYYN/2cB3CQTa57qnq536or1fhWFHTduX6xQTfInA+O9/l62YAN2ZW9v7ONs66qbepheACK46o7IP7puwbDiDHiArcJ6pnYn7V0c8=
Received: from SN6PR2101CA0021.namprd21.prod.outlook.com
 (2603:10b6:805:106::31) by CY3PR12MB9677.namprd12.prod.outlook.com
 (2603:10b6:930:101::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 09:13:50 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:805:106:cafe::a3) by SN6PR2101CA0021.outlook.office365.com
 (2603:10b6:805:106::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.2 via Frontend Transport; Tue,
 16 Dec 2025 09:13:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 09:13:50 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Dec
 2025 03:13:45 -0600
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
Subject: [PATCH v7 0/7] Add AMD ISP4 driver
Date: Tue, 16 Dec 2025 17:13:19 +0800
Message-ID: <20251216091326.111977-1-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|CY3PR12MB9677:EE_
X-MS-Office365-Filtering-Correlation-Id: 78d46da3-964b-4f12-6125-08de3c836d46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hp+N0OeTNqLsMhzSRMsL4MPSbgQATL9bQNvfCJzLyA1tSvvmx+IBDGjKroNJ?=
 =?us-ascii?Q?6Bft1VVu4WfRIKKgafLMQXd+RGoa5QQ2nubpDHqdxL64gqFiA2lm6s0A2FhM?=
 =?us-ascii?Q?0Bf0v/JelaEn1mIsMeX2Pq+bDtaHk/e6ogGmax461MUHpCmED1jqgaljLRy5?=
 =?us-ascii?Q?sMgJ3a7PhPsdtZUpN1hrzTbs/R22QuiqOvz9tEMTiT8AdLTSNI8CFvtKXNOV?=
 =?us-ascii?Q?5qpJFHdLkptJQmgjcmwQxLkt/lrH9FsWEHPVR6XAYe2CgAYGjPoPqnXaQpl4?=
 =?us-ascii?Q?9wZrkScBqbFpbJCt+R5beUJEug/mdKa4iem/h0OlC+Um9w8Cev3h/r4x2p52?=
 =?us-ascii?Q?hIXOMtIsof/hR9zTKWPmJFRLdA0Qmx1au9QD4xQlpo01NtKUxUrU2WGOjvnt?=
 =?us-ascii?Q?LKX3pzDrlVt58SwGQHfY0u9sUxWP6GPOzymhW/+2zxDfa1A70BDu10Bz4eQY?=
 =?us-ascii?Q?wAMSfCTseg5Pbu4UkqiiTDbSEcHa4DNZOP0zcNXy/VQCoOmHJsm0p4qaDexr?=
 =?us-ascii?Q?qBOciTS65BcL3ERF0F7rDtpW7+ZHEWIHnnCOPBS4lKUxuiZUEPDxxfunD+tc?=
 =?us-ascii?Q?Ie4w3exrPAyFxMH0zgahoFI4AahKKjmzaGbNcxNXvSpiql9ODA0yDiNpvlCw?=
 =?us-ascii?Q?16v8eqo9q2uigHy4FEpwiHhWp4c4nBZVffzQ5kfbkKffeYGBgFLFqultuQwZ?=
 =?us-ascii?Q?Nnu+IKD0r5tgIyrh6Y2thBToVd2qL7pZAftgngzezpBlnfulRt/2wmU+JLvY?=
 =?us-ascii?Q?++Ue0aGT+8K05zxJ4VtSGfveAo56ZbRAfofKihDGwbCuGDgS8V0cO34Uhqme?=
 =?us-ascii?Q?Xyeu+S9Ndlky0GNvenrpxrscb/wFLmsfZd3BcVPklHTMOW815xMzsRAPuqhW?=
 =?us-ascii?Q?7sxo4NEF5Tp4uEYeuZ6uF1yD+vitl+0JCMy1F/cQso+pj8MMjUfvRsHuEvOx?=
 =?us-ascii?Q?kzU3OuvZJa1YJIHdM1khjHyfoJx2LxDwdVJJBq6acUzV/OHTnQRMWyBc2kXI?=
 =?us-ascii?Q?VqGFYV3HnBYsFtLk/NhXb0uKszbZmsp4OQBdWz2BNPEeCzUPCNWMDboZhQdj?=
 =?us-ascii?Q?p9lyiUs6Qu+3eYfTu2DF8t39HU3a+F5yZjznZdCjdIBLp3s9SJz5v6ZEzWiP?=
 =?us-ascii?Q?Hj4RjWCYMYKkaNReMPSQOZCifaHFIH+XXi05r1J+6eW+Jc8wjJbIZa2Fs9U3?=
 =?us-ascii?Q?fhV4OOGnP3gKpzlTL6Mz3KaXGYE0t6km58dSHw5McnlLwAhy99OM1iVzy1uc?=
 =?us-ascii?Q?GR3el6u052rnbDalwdRMvyVUyqH1Rlm19vAsoIIDajlHHecky4TFP96I0uGE?=
 =?us-ascii?Q?XkxBcPZ6mtctQJ4xOmMXTOJMgVAoDPV+OyFz96caPBpAZJtf9qmZZfiOF0db?=
 =?us-ascii?Q?bTC6LaGVmO5ZWtvisXlauIcktSn7wd8sMeVx2xudCddtLOqzpD88Q5+i5A5C?=
 =?us-ascii?Q?I7+XYAtBTNNU86vF19HYKbxmSuDZlgymusLC8UklldpOcf3KCg7NQxZRQkR0?=
 =?us-ascii?Q?HM5hFYmLHOjf+Wj3LLhQSggRovA1DySxmUb+dFmiLASvsN8lBgRlLdeTKAeQ?=
 =?us-ascii?Q?hW6I5xPUWI5wQysYRg5FiRXZbZPUDzXU2lVNRYZ5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 09:13:50.4304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d46da3-964b-4f12-6125-08de3c836d46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9677

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

Changes v6 -> v7:

- Added missed blank line after some if statements.
- Changed the pm_runtime_disable() order in isp4_capture_remove() to align with initialization.
- Reset buf_sent_cnt and start_stream_cmd_sent on stream stop.
- Removed duplicate buf_sent_cnt and start_stream_cmd_sent reset in isp4sd_pwron_and_init().
- Combined isp4sd_reset_stream_info() and isp4sd_reset_camera_info() into isp4sd_uninit_stream() to eliminate redundant stream info reset.
- Removed always-false status check in isp4sd_uninit_stream().
- Minor style improvements.


Changes v5 -> v6:

- Lowered FW mempool buffer size from 200M to 100M (actual usage).
- Added an irq_enabled member to the ISP subdev for proper IRQ disable handling in both normal and error cases.
- Removed unnecessary .owner assignment from isp4_capture_drv definition
- Updated IRQ handling to enable and disable interrupts via the ISP register for improved performance.
- Revised ring buffer management in isp4if_f2h_resp(), addressing safety checks to ensure the read pointer is validated before memcpy operations, reducing the risk of out-of-bounds access. The ring buffer logic was also streamlined significantly.
- Modified ring buffer handling in isp4if_is_cmdq_rb_full(), correcting an off-by-one error in safety checks that previously allowed rd_ptr to equal wr_ptr when the buffer was full.
- Refactored ring buffer handling in isp4if_insert_isp_fw_cmd(), simplifying overall logic.
- Resolved a regression from v4 to v5 where isp4if_dequeue_buffer() did not protect list_del with bufq_lock.
- Addressed a subtle use-after-free issue that could occur if a timeout on a synchronous command coincided with completion.
- Added missing pm_runtime_disable() calls to isp4_capture_remove() and to the error path in isp4_capture_probe().
- Removed stray semicolons following closing curly braces.
- Improved and clarified macro definitions in isp4_interface.h.
- Eliminated unnecessary (u8 *) casts.
- Added missing memset for firmware command structures in isp4sd_stop_stream().
- Excluded streams 2 and 3 from ISP4IF_FW_RESP_RB_IRQ_EN_MASK, preventing their activation in the interrupt enable register.
- Enhanced error handling to clean up kthreads in the event of startup failure.
- Corrected a race condition during kthread creation where waitqueue head initialization could be delayed, as it was performed by the kthread itself.
- Removed status checks in isp4sd_pwroff_and_deinit() that were always false.
- Ensured isp4sd_init_stream() is only invoked once per stream start and reordered corresponding status checks in isp4sd_start_stream().
- Improved error handling in isp4sd_start_stream() to propagate errors from failed functions.
- Relocated debugging messages in isp4sd_stop_stream() to execute under lock protection due to access to output_info->start_status.
- Eliminated redundant GET_REG_BASE() macros.
- Removed isp4sd_is_stream_running() function.
- Corrected error message in isp4sd_init_stream() caused by copy/paste.
- Refined struct isp4_interface to remove firmware ring buffer configurations.
- Removed obsolete isp4sd_is_stream_running function.
- Removed pdev member from struct isp4_device, as it is unnecessary.
- Fixed typo in 'isp_mmip' parameter name within isp4if_init().
- Removed gap in struct isp4_subdev definition.
- Performed extensive dead code removal and minor style improvements throughout the codebase.


Changes v4 -> v5:

- Transitioned VIDEOBUF2_V4L2 from 'depends' to 'select' within Kconfig.
- Standardized object file naming conventions in the Makefile and sorted entries alphabetically.
- Removed the unused macro definition to_isp4_device.
- Eliminated unused members mem_domain and mem_align from struct isp4if_gpu_mem_info.
- Deleted unused fields mc_addr and gpu_pkg from struct isp4if_cmd_element.
- Removed obsolete pltf_data, i2c_nb, and notifier elements from struct isp4_device.
- Updated platform_get_irq failure handling to return its actual result rather than -ENODEV.
- Refined inclusion of header files for clarity and efficiency.
- Appended comments following #endif statements in header files.
- Improved implementation of isp4if_gpu_mem_free and isp4if_dealloc_fw_gpumem.
- Removed isp4if_append_cmd_2_cmdq and revised isp4if_send_fw_cmd accordingly.
- Enhanced isp4if_clear_cmdq and isp4if_clear_bufq by eliminating unnecessary list_del operations.
- Adopted completion mechanism instead of wait queue and condition for command completion notifications.
- Employed memset to ensure proper zeroing of padding bits in structures shared between ISP driver and firmware.
- Streamlined IRQs, reducing total from four to two, retaining only essential ones.
- Optimized IRQ handler logic using a while loop for greater efficiency.
- Introduced dynamic IRQ enable/disable functionality based on camera status (open/close).
- Applied distinct identifiers to differentiate multiple threads and IRQs.
- Removed unnecessary initialization of local variables.
- Refined camera start/stop workflow to mitigate potential synchronization concerns.
- Replaced all remaining mutex with guard mutex.
- Enhanced command and buffer queue performance by substituting mutexes with spinlocks.
- Removed redundant isp4sd_init_meta_buf function and its references.
- Limited firmware logging activities to the stream1 thread.
- Relocated v4l2_device_unregister_subdev() and media_entity_cleanup() calls from isp4_capture_remove to isp4sd_deinit.
- Resolved media device registration sequence issues.
- Modified stream processing thread behavior to await IRQ without a timeout.
- Addressed cleanup procedures in video device initialization and deinitialization routines.
- Corrected typos and made other cosmetic improvements.


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
 drivers/media/platform/amd/isp4/Kconfig       |   14 +
 drivers/media/platform/amd/isp4/Makefile      |   10 +
 drivers/media/platform/amd/isp4/isp4.c        |  235 ++++
 drivers/media/platform/amd/isp4/isp4.h        |   20 +
 drivers/media/platform/amd/isp4/isp4_debug.c  |  271 ++++
 drivers/media/platform/amd/isp4/isp4_debug.h  |   41 +
 .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  314 +++++
 drivers/media/platform/amd/isp4/isp4_hw_reg.h |  124 ++
 .../media/platform/amd/isp4/isp4_interface.c  |  789 +++++++++++
 .../media/platform/amd/isp4/isp4_interface.h  |  141 ++
 drivers/media/platform/amd/isp4/isp4_subdev.c | 1057 +++++++++++++++
 drivers/media/platform/amd/isp4/isp4_subdev.h |  131 ++
 drivers/media/platform/amd/isp4/isp4_video.c  | 1165 +++++++++++++++++
 drivers/media/platform/amd/isp4/isp4_video.h  |   65 +
 22 files changed, 4480 insertions(+)
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


