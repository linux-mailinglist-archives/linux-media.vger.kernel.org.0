Return-Path: <linux-media+bounces-45463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3079C054B5
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 11:19:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2075642483C
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 09:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517C03081DF;
	Fri, 24 Oct 2025 09:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="L85JkXQJ"
X-Original-To: linux-media@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012018.outbound.protection.outlook.com [52.101.48.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F6C304969;
	Fri, 24 Oct 2025 09:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761296833; cv=fail; b=b/3D4f+qp25H4eRw3ZGQlinfJxeJ0LjSnKIIJ5MG2hU8hNQ8hFqKJLRoGDv5c9wsyVTg6CPvOAAQ5yrTibYTqDdwLv63t4n/yfS5BFe33Rtjk+fvh2/REtG9s+CaJTY+dNU+cxeo+2WJ676bDc15QAsPg/xf4+BMHS+6k53q+RI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761296833; c=relaxed/simple;
	bh=6w4+iJjlm4x8BfoTmdJClVg3OpfPjTL2Tocnsl91um0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pMepWlz3lEcsCVJFrpfDNcK00vrEDQ5px1ODpStp4J1KiGRgb3SU6HvB6A0fJEW630kc0gz86kzbUL6FZ5ulEWx6AIbCIkn1aB+9RwtXF1Xh9E/g33VTMF6bKMwrvpu1VnB3+UKRt4kDdt27iiIrs42/gW609pVLDNprOAQWdWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=L85JkXQJ; arc=fail smtp.client-ip=52.101.48.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t9J/mBHxaI3ngAzV/DubqoCVOW8ntpDQXauFC2Snbb2GkAFSJkgSO5yz5azWaInxEb5pNUceVIl+VsAq91jC0v3ZQAXgG0lTKfSCIky5GXWE3R4v+cNg8FnLxqzStCB3DT7EzVs+TlPnnS5nWVvm6kiSzkdVpJOFz9T1m8wvmL5g3GykyAhFQBawDcoiRqZFqW5eNwM2SF1BC6H0IYKnHZqqKEru7gVIiUWHFMFUU7xScqaFv4hoiUfWvNHIF9M22L0W9wumjDkyL/d/ijp/wYOVKSonfOCDiSNWNJQbZXAbpNVTNzqcv27lpX305nVrI7LcSlq80/co7ECXlu93Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MdS3EkjOV4KRlLwY45OTXxMGvOFXHrODyc+nZBioSk=;
 b=QbdV4QrYaIVtqulOkpcc+HceKn9SKJICQsxtjiQflXyiBnE5KIucH4HpTQ2zYAU/vNDcaNpAbRJeA7iwUu1lLPr7r8epL16Xq9i0PjXzDj9oy1Wru4uPn5XCclLg9KExvaDuhcBhrGtV9Qpf+F038CBDN3+qbkC5q+dRkQi7OuRqnmefNae+Ig0/godqiOMuRsRyDaILF3lvuYhJFz9Qtb5g+X+vE5rWV/vsVCF+0vMtt5qiz8xCD6ZFTR+ExF5myRNFBhtVpZi6D7ZyrSK6h9cyn35B76bcBteK850NUtwNfimPlpWgoUwk5GDnUCzwwTLGtJwxzoIgKkDOEh+YFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MdS3EkjOV4KRlLwY45OTXxMGvOFXHrODyc+nZBioSk=;
 b=L85JkXQJb9ats+XYzHzcxB5NSSfMrlSI+wrjYkvmekqjyS69J5O0P8xsaSjge5H3S2B2j0bcgWhY9ENsgTQL/KZRQLOJYCWed66ZL2g4twLjTTPzbUd5ehZYAdCLvQNgi1t++4H0CchQuEL26oZwy84bCdrvfYMzvzDHo+14joI=
Received: from SA1PR02CA0022.namprd02.prod.outlook.com (2603:10b6:806:2cf::29)
 by CH1PR12MB9646.namprd12.prod.outlook.com (2603:10b6:610:2af::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 09:07:05 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:806:2cf:cafe::a3) by SA1PR02CA0022.outlook.office365.com
 (2603:10b6:806:2cf::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 09:07:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 24 Oct 2025 09:07:04 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 24 Oct
 2025 02:06:59 -0700
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
Subject: [PATCH v5 0/7] Add AMD ISP4 driver
Date: Fri, 24 Oct 2025 17:06:36 +0800
Message-ID: <20251024090643.271883-1-Bin.Du@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|CH1PR12MB9646:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c462368-2dcf-4013-c989-08de12dcb38b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GZgfFWcibQygiE8BJj97MXGP5pvsxFa/k0M5tnPQrcxHZ6epheRMyhS86JJs?=
 =?us-ascii?Q?3WNwRtNH0qUGIPo9mKF1UTYasxx/NaLM6Z7uDiEnLkMLA5EtK22SWpGbFj3e?=
 =?us-ascii?Q?vBADa89XysD1guhId6rNJ2EEw4SVcvRZSXeZygp9k/s4e4dqdNsYwweVyscC?=
 =?us-ascii?Q?7AIuXIFcV4XuHV7qmvCjgesaYyN7aDfCKMgQ201pYsXs5VE224w7wEvABKVv?=
 =?us-ascii?Q?j4xW6GbFzYoCmkpWFaUIz0FnvpWD41ynAxPj5mivBDC/CTgGbCz1b0qO6E8P?=
 =?us-ascii?Q?kZIwo+fYULZM3efn39AiMFtRrz9CuJYTwC2GM/nX/nh03LtbAaIkOI/gZonL?=
 =?us-ascii?Q?RV4DoT6SO4q2UypLL9fZqddCOiFd+0ytOxNNf+FqgBvX0NlYSpZ1yZMBsrz2?=
 =?us-ascii?Q?cFja0A0lSwVQjZ7popgZ1sJhCtXkEp+cSEEx41ZTDuU+IaJ0468kKYLqN4lj?=
 =?us-ascii?Q?p6wEevaDKl3u/330cPd6tbHv02Wb2NpzNrxHIleUUFHl1vG51tzJQWL0ISc2?=
 =?us-ascii?Q?oXrGkPxY3BM5T4nTBGIlCTZYQOXqj99DLqSbHypk9n9fx+eU1NRybHTQHBdc?=
 =?us-ascii?Q?AAOw+URhyPXFNpS0yY+sz0dHU/pe1TOdWQQ06fdP7Mgr9gyHGWoYC1xJt30D?=
 =?us-ascii?Q?oQO/OwvcayeDjJALUJsDLMcSrs48cCt5TuL7rGN/LUwYgTkmN9eYB4eM/5qs?=
 =?us-ascii?Q?xpPXpCnGCjycljsA0eg/Od8XGgatucJRtUE/4Kas+aT6hBM5lvC6WuOhy0l7?=
 =?us-ascii?Q?UMs54+MmuW0JiFZWn9uJQbsp3sEg7Wrl/k7KhuVuam3V8eNcS+gRmx/IASbt?=
 =?us-ascii?Q?rHr3EABWaiO8OT8tM2KuErtfMdEr1FDJuTL4WvC0wOjL9SWRgo8YdZ9n3PLc?=
 =?us-ascii?Q?Mu10O9bGkwCRoQFHARkEm4949oasNFn6bN79P+clQNkbnxvA1nbi/hTUJ6Bg?=
 =?us-ascii?Q?mAeiRFtFffshLzT7BNNTnXUvb3rzBG1weIBCTAoZpp0XCa8pq5A6WD74+N1Y?=
 =?us-ascii?Q?u9NYrqeXRh5TdvmIjX1sGiR52hmGooO1525qSUKGIvdhGmQGnypZfTjHd5gh?=
 =?us-ascii?Q?WpF0jWKxJB40JD6fFkjssxgjhoCTcP/A6U1Ug8Kmjeu3GZZpltLBOPFWyeHT?=
 =?us-ascii?Q?ZvloRcj+n0vQM0Ayd5Ockh8jmkrcUnIKyuxYPAnMJpSdSqGhA0MSc4NoFIS2?=
 =?us-ascii?Q?gYQnXmU+hi+ZYFTQKcHBUrpWnScoeZ3NF2nEYVD110huDhv5Hg3NZAS55Yud?=
 =?us-ascii?Q?Z4UMFUF7ljJVFUICx5WeWIzz4gLwwKGuWqI5SpLw1+56Kx2RVMOihxBZ0qxR?=
 =?us-ascii?Q?ZwuSuXpk87IItKTvrjpKnYjCueQH6AB6nTD3QzHm3viYtlRsQk0h+R5ayT3r?=
 =?us-ascii?Q?aK4H/+F+504rARcneMgpn1iGVEUo8xL2bodStXZHWxT391qWOhZCxWSnmt7x?=
 =?us-ascii?Q?X+jMgGGqoj6DIj31MRQkNaXrMHQgyeSKPt6ZcudJIXDroRYkr1OblQ/oMDhB?=
 =?us-ascii?Q?YdTr2C0/iTeS+4QCgF/TjR5n+ZLLP+hAFf+v?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 09:07:04.6932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c462368-2dcf-4013-c989-08de12dcb38b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9646

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
 drivers/media/platform/amd/isp4/isp4.c        |  209 +++
 drivers/media/platform/amd/isp4/isp4.h        |   21 +
 drivers/media/platform/amd/isp4/isp4_debug.c  |  271 ++++
 drivers/media/platform/amd/isp4/isp4_debug.h  |   41 +
 .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  314 +++++
 drivers/media/platform/amd/isp4/isp4_hw_reg.h |  124 ++
 .../media/platform/amd/isp4/isp4_interface.c  |  923 +++++++++++++
 .../media/platform/amd/isp4/isp4_interface.h  |  147 ++
 drivers/media/platform/amd/isp4/isp4_subdev.c | 1172 ++++++++++++++++
 drivers/media/platform/amd/isp4/isp4_subdev.h |  128 ++
 drivers/media/platform/amd/isp4/isp4_video.c  | 1179 +++++++++++++++++
 drivers/media/platform/amd/isp4/isp4_video.h  |   84 ++
 22 files changed, 4740 insertions(+)
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


