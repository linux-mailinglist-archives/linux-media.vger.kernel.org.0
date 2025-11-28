Return-Path: <linux-media+bounces-47855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BB4C916E5
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 10:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8769A344337
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 09:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EEBA30217A;
	Fri, 28 Nov 2025 09:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="THEl0Pb9"
X-Original-To: linux-media@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013018.outbound.protection.outlook.com [40.93.201.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101A22D0C98;
	Fri, 28 Nov 2025 09:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764321837; cv=fail; b=KY6lp1jawdxf/BQQFm8bFdIMDB7MGfPApAAuX1le+tDkQ2X0tg7gD55IKUN5aZhcV99aah0IPQA1ZkTOXOPRDtSyh5CtPR6Q71hqs/wEMUI9+NDoRI72TrPANDc1i/PEAgKoC5v+1N2lo/v6tQszlD2sIfsQqcrwBrFwEwmwku8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764321837; c=relaxed/simple;
	bh=P8lpK+sbrSSWgIC12yEKemy1FZAeiTjePNL4YwXfevA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MyTVk05LnqI7MeE7Cz6y0rab8VwBaEqLQhGoxy+gFr0uZMgEmSOkFcv+7/NouCQb0eJDdIzOnyWuOK/HAO6utPaWo9ZVsWL1pVYwEZj7dpuYVWjJ82y5Hj16ftelGxR8h6jxftYdOt0tJG70ElDTN8dl3rYFx/Afnl3QfG4gkdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=THEl0Pb9; arc=fail smtp.client-ip=40.93.201.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SUpJC+XaceLTqgUa4hlEKgKGCWSx+OU265G7OXtybegVyqZUmHq3SPe/Kx+IDmok1MPzbn2atwXxXXo7LTSabv/PufMgBaaGCXPMKBbAurs2QzGf2YrFMydXgqdWxwCGji/gBBuoRY5xqsYARDNFYTe3jC2vFqBH5eJWoUnbAblE8ksBxnYDgDrLY4862azMY3F73zKoN5aLWgxmnhixc+zbnq+Zq44XkDWgWcOe4PzzrqRGKX6qsxDogFDTzauwgxMzOw05xwAS5H6T1HQiRwsOuT8nDQDvlk/kM1sBzH1WatfvAvgTOIh+UEy0cRbyuJQmyZJ4g7y9vu8LA5a/4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlpjTX3GGLzeL9VKqYlXgZDZPTWXaz/Oau+z1CYAi1o=;
 b=f204dQqZKOoSqFAXgFAxnwDNf8hJn2wfcapuTu52Z8VyBCwb0OpareLD9C7lL7E8ik/meIzcwRNYZMVBNFEI+myssJBqyEjlnvFVtowxBThBMdF2pjqAeNNpgB0ZHZObYWy4nTxtn5vOY8CgowQs7Uun0VzyeLmPhrouQusaMFWmDQucZAb7CLfY6WFP6plDAzzYsrMH0BnNuzuho9rpfLXSG2mkupRw2tJpv1Bk+3dXS2ZV7z+pk8GMwpIv0rfD9LOpuJo83HJa39HtzjIrCr6UarU245Ib2lrbCTR9tEIaVhbs9KRy5ExLt/MHCplA+msGwqLDvp8V3oGHLmmZew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xlpjTX3GGLzeL9VKqYlXgZDZPTWXaz/Oau+z1CYAi1o=;
 b=THEl0Pb9NAMeFK83Tkt8KS/iYwAanxYfMJVuNoVJmUq3rCGsWevvOoXyKMHnZzM8k5/k8fq/JROZ2wo5WVNRLLmT8Dk3/ZF2BU+457klWtIUKRUB2O4qJ2n8D3J5cVCxO2ZGZLpKTzYzlWVqKuTa0qyKB21twAj52GokWwU5GCA=
Received: from BYAPR05CA0003.namprd05.prod.outlook.com (2603:10b6:a03:c0::16)
 by BN7PPF7C0ACC722.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6d5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Fri, 28 Nov
 2025 09:19:51 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:a03:c0:cafe::3e) by BYAPR05CA0003.outlook.office365.com
 (2603:10b6:a03:c0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.4 via Frontend Transport; Fri,
 28 Nov 2025 09:19:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Fri, 28 Nov 2025 09:19:50 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 28 Nov
 2025 03:19:44 -0600
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
Subject: [PATCH v6 0/7] Add AMD ISP4 driver
Date: Fri, 28 Nov 2025 17:19:22 +0800
Message-ID: <20251128091929.165272-1-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|BN7PPF7C0ACC722:EE_
X-MS-Office365-Filtering-Correlation-Id: 55b328d8-a3ce-4524-16e7-08de2e5f48af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Xp26rB156hPkBgtNz/9bCs0huXngKtuR0u/PwhE/8TKly8K9bytPhm+84Z3z?=
 =?us-ascii?Q?aG3F4DfdGM/JZ1K+sC8ISRMUYHK8wtUk7uKpE8r9Bv21d9wFTF6N+iKsOUde?=
 =?us-ascii?Q?284yfL4YIeLKnDXZ9IksFp3QSrtxPvycPHu8DtDAnPIVm47jVCsqoUnh1OBS?=
 =?us-ascii?Q?Hhd0O1OyXKYXoxf9mPy1YvKnfRI5EYWLNeZRu9IfrAPbsz7RQugdZlbHOxe2?=
 =?us-ascii?Q?8695WN3KTHllaffoTZkRswpB7fbU/zSUF3DSJ/ne73o8CJT4KHBoSxBfORvz?=
 =?us-ascii?Q?H+rbsM3PIJS4BW32H1+Ns9DKqVj3CDZN1YdbG7jJz1Q5CYYdPDI1/fjfcc8f?=
 =?us-ascii?Q?GL/UEV9hg6kfmMnDTl79YtA0h+kiYRG50JE2WrlS+teMQ+eLB3yAks54YVMO?=
 =?us-ascii?Q?hwPd0aJqs8R4vX6Dd9ccj2o2xRtIDtyjgKXXsqcoBZromE9kTnCVHLkrzrEb?=
 =?us-ascii?Q?iYnfZKnIp2D29NUjdL65IWcOeI6USg9lNM2ucmT3lHBAat5gMpYr4pxlYPOa?=
 =?us-ascii?Q?YhxnqIXgrJ14oomHIdzHg94W/4AfUGwoYPGQl+E93/+3D9ZBJtfQdXmWAFrz?=
 =?us-ascii?Q?YfxD8BWDY+hpeWpkhvNI+dUYsHiaSfhPpyBBYLpc1fHWvYInjopg+opbz2M1?=
 =?us-ascii?Q?cQ5Fw+V1ol7X2cH1zbUy8vty0mpimOZyUbcn4AJbfv7iyOdryr9kgNu3Ljxx?=
 =?us-ascii?Q?MO5EGMU9HBjERYgQcflX3H3sRtz6ZgWEucBfitGkosAw7amck8iYQn1ZB7qY?=
 =?us-ascii?Q?uPGEcp6BWjDivZcMqi9l0zgK7vHQp+N0X6ydXbAXh7gjyyLDtzGUIInGgD1A?=
 =?us-ascii?Q?NDszEhbNkuasabFgyW6nQLXT43pUPnha058atIpk7Ltd4OoMZKQkIOFv5THB?=
 =?us-ascii?Q?DdTmqCND0cUzJNpN0/tu02UG3ruYJsHA/QYqqvBCIpv1lPxGXxISeZXQKkNz?=
 =?us-ascii?Q?kuuRjckEDteo9M+GM6z+qQmq608niX07jW/dR3Oy1sSEAO4NNKCqMNvEZJYC?=
 =?us-ascii?Q?SLZUk4ZuaU16z4bsWmzsKgldE0Jb25lY9lD3EnKXban9RMTEVv61UWwslmBR?=
 =?us-ascii?Q?nPXvlLfKFxndNd6KcfkqIxDx0lgQHktven3u0YUuJaNjxlv4FoZMMjhFaDG+?=
 =?us-ascii?Q?d7UGaaHJZlST8XYMCLZjaigUSUflhbyyFyW1QU4lFQX16NU4IFoLnts7lt86?=
 =?us-ascii?Q?CygfUO2qUeCydBN6RgnS5N5EA8oh/h1MZtjEz52gE+MrpPDsepO0TFXqGM29?=
 =?us-ascii?Q?0l9uuDUeoNu4v5YXz1nH4Z6oZdJm/G8fIkpixtR+eoPdgUnTibTHe3MKzK8X?=
 =?us-ascii?Q?pQVc9hv9TyVNjZVGsAl/EO/jCTnDnmbwYNqSu75NxRyCYBBsLNoE67CQVhGw?=
 =?us-ascii?Q?NoFoX/ihXWhmDXYBJImE0aQ2bxy69BWSU/TzBtOvs3uNuyRGKG19GN5/1GEU?=
 =?us-ascii?Q?ZC4pWsl+yo/faNevEo5+l3Wm+kiR0ThR73oXw6YtVIM1Z6IA46fumVQaPDAW?=
 =?us-ascii?Q?+FIforh6qpd1yUAVu4sGZkQOQj7xVq4J43re?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 09:19:50.8051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55b328d8-a3ce-4524-16e7-08de2e5f48af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF7C0ACC722

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
 drivers/media/platform/amd/isp4/isp4.c        |  234 ++++
 drivers/media/platform/amd/isp4/isp4.h        |   20 +
 drivers/media/platform/amd/isp4/isp4_debug.c  |  271 ++++
 drivers/media/platform/amd/isp4/isp4_debug.h  |   41 +
 .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  314 +++++
 drivers/media/platform/amd/isp4/isp4_hw_reg.h |  124 ++
 .../media/platform/amd/isp4/isp4_interface.c  |  787 +++++++++++
 .../media/platform/amd/isp4/isp4_interface.h  |  140 ++
 drivers/media/platform/amd/isp4/isp4_subdev.c | 1087 ++++++++++++++++
 drivers/media/platform/amd/isp4/isp4_subdev.h |  130 ++
 drivers/media/platform/amd/isp4/isp4_video.c  | 1158 +++++++++++++++++
 drivers/media/platform/amd/isp4/isp4_video.h  |   65 +
 22 files changed, 4498 insertions(+)
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


