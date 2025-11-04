Return-Path: <linux-media+bounces-46260-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36392C2FFDA
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 09:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C0281889802
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 08:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F1930498F;
	Tue,  4 Nov 2025 08:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ChIA61/K"
X-Original-To: linux-media@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010017.outbound.protection.outlook.com [52.101.56.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707C030147C;
	Tue,  4 Nov 2025 08:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762245391; cv=fail; b=Xd7jMlljbbjNtmtyT21zs5eqWZqwS9Tf4kY6zxhLRArM2IcJXtFwf+pDNwlWSNpG1yC0SpfHcILHhi03yfalkB3P9mkI0neqvcbnIh019CSX84TSbJa3vMo7QhKMZSh4KH+WmOcAMlsHd5YLRxtSkilwQlZ3m3YDGlSRU7GUW/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762245391; c=relaxed/simple;
	bh=lJi1BjsYmo87Y8vme5vJ8Ooub7PwcKHtTUDNceJK9+4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QdOf18sP6s75P9xZ9TORkzWST1nvltb3PezujwQ8c/3UE+ljC8u3qOB9Dj18P1jWy0qtepRzwdTS+5Hmx5RCRWMvcAzQeamL+i/hoFi2EKLdcpjhpI7V6w2TpToXVizMjnvk9VuqUNCNxVdqm/rg7YBANqpHlToMRUyNcL3rKV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ChIA61/K; arc=fail smtp.client-ip=52.101.56.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OmO2PWmzXWYetQTFgGANmi01qbmjW+1Mjv0mZhPpnSJkH2TGWR0/m3gVgtavFmrogpix2eV8ym72aURJu0UJj4LwWv4IghSrwD7N2sFLkcncZi9yNAfJ6So6aabMW3ohET3QWYp6CvAm7wTLXPESwvvWnGJpbxQiDgQhiOndGrCc6TDoEkac2YDFLCvwxpnhzl/VAzuTfnptI3bNfLI19lTcUi8MaKcs/aAXJjIci9f6MZMR+pvcTXEUpkbQGzDGWuhrPey6GvIAHMsqJzt6HSwwFgTeOaHr+u6FwR6gQZyYnAJbaLqwW9dUCUEsNl30oEYfZJr0wRgTe25Gw/MeVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jg1+43C35mWs9x0Sh/VnKCJizCwGfVhf7CqzL4d6E8w=;
 b=Ytc0O0exlkkd6D0lKRbQIzwAk3jr1cWpKzWMR+drfl78zbRniGgdofs8t9ulRsi9huTYAHUILFR5jLmflrg/JmPAaYRc1EfliVodVCC6H+E5uai210Nqjo5h9jlm4ZLx1E/dlZM5+9NtS97w0gGLd0YQJWeqwmHejfsdc1QujpnmD/KLD1xulO2mJAr024LP7Zl4R+M56IJWr9gXaNKx6CY579nSU5LoJI72JbcdUF1FlwFWikYxXkDAK/yClqhNoOzlFsa+cpBXSMNU3QSKQ6LH9zJrtdO6leurIPRKgJ4+8PdhLHxYZr3S/7OjAcnbWNk2cJB2eviYUPq9iHjN8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jg1+43C35mWs9x0Sh/VnKCJizCwGfVhf7CqzL4d6E8w=;
 b=ChIA61/KrohP7LVvG/GDpHX08I9KURPid8IAf1WesxLVs6o4C2KUlV+gyrFekQOjU0B0Hj8mdw6rnKe65R2KRrEpKpZjULW3HXqX8xA+Dfy+6e1bDoblb/Sqmpl3hXOEU7axHhs7DfVtuKY1mp27EYCXO4vYgen/01TTfMxIVZo=
Received: from MW4PR04CA0260.namprd04.prod.outlook.com (2603:10b6:303:88::25)
 by CY3PR12MB9605.namprd12.prod.outlook.com (2603:10b6:930:103::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 08:36:25 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:303:88:cafe::4d) by MW4PR04CA0260.outlook.office365.com
 (2603:10b6:303:88::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 08:36:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 08:36:22 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 4 Nov 2025 00:36:19 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To:
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
	<alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, Felix Kuehling
	<Felix.Kuehling@amd.com>, Harry Wentland <harry.wentland@amd.com>, Huang Rui
	<ray.huang@amd.com>, Leo Li <sunpeng.li@amd.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, <amd-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v1 00/20] drm/amdgpu: use all SDMA instances for TTM clears and moves
Date: Tue, 4 Nov 2025 09:35:15 +0100
Message-ID: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|CY3PR12MB9605:EE_
X-MS-Office365-Filtering-Correlation-Id: dd2281e3-9bd4-4986-0c4b-08de1b7d3c4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3BET/Sz/jflXxImGGYc8/M4tllDJOLAXmKEHJyyn1a4uIFtYjhGVZXXlMNbe?=
 =?us-ascii?Q?nexyaG4uSovhFYLbESvNJ46/5XEDb0eLOEQAebT8FcITkscYtIUYvlQAyZmf?=
 =?us-ascii?Q?0gu0ajOwnOwPUhC30KFkYECvmEZUH8xKi4YeVXGYNK8irYW14FI0UVeNYfxl?=
 =?us-ascii?Q?OoKlB00RYpP0JAMPAsWwedQBtU9Vslqw+h1Xax4inTw4Vq809ZJ6TUbQIHIe?=
 =?us-ascii?Q?P+CKVrhZo/4aAIW9OqARYe12+5sgb54kO0Ry4VmT0OzVQ+/zy2niMVKDin5y?=
 =?us-ascii?Q?qCOdMCjNWCbDHrUvisj8TfQVE19xk0oDd+aZvGfbNk+yOT9n45u9blI7ffYo?=
 =?us-ascii?Q?Gtz2z0/i/wcfRf9yeoAWmZ3sCLK85+raJMu47s0wV15T2cLbYfBNmf+edQ6f?=
 =?us-ascii?Q?DgMFthvgYuKoZ2leUda3/FNf+5vUxsR7qMew05LSfPFZKC8iL38STiJGCOyh?=
 =?us-ascii?Q?v/gyjACQgawhpGbG9Bdgm8D4vrFdPwZQoyTnTQv+3lLfFxUwQVfqJ1cMO+4x?=
 =?us-ascii?Q?12S8kJgz4fx2y6OI/rdXkcFXMEsfZMLN/bxmpoCEQO82d95aQr/SdfQ1NaeD?=
 =?us-ascii?Q?v+7szgOR/dLQOgMVddRyO003dLdYXzaUt4rogMnNtK0Ay5kvT3yNjogwAhxU?=
 =?us-ascii?Q?zEShIN4ETQyhK3dC/A+60VdjtBhJ/qagxMHAXGuIL84Fhvs6uuPIou+to2qG?=
 =?us-ascii?Q?oqDBhN327HuTUVgcj++oEdwgxS7cwVU6fssP29SvejHykOu02zmP4mqB9aIg?=
 =?us-ascii?Q?932H++Z5JSfBQqmdseEtZYvjdSHvvbWEv7oZMs210JDzxe7NkUpNc3Yni2qM?=
 =?us-ascii?Q?dTAidXGmAlzwhRq5KR9laV9XHoGyTYzUl7IayWCVK7zwzVRakqEEjMI3yG5a?=
 =?us-ascii?Q?fwxG4lvc+UwCg7X4b+72F0bb9QfkfMc67KI6/0/uoojkNlaVmRw8/8VJs0nh?=
 =?us-ascii?Q?CH7ZiMiPANFLeEjZYRgldHFzJqGlNeDmSNAa9M1opke/AhbOk61EqxSBjPDS?=
 =?us-ascii?Q?f/UWISpAeNn3PO5B3dN0kvTuMElVVHsMlYw2/eZN6K1UGhCYjvf4P8PZh+Ym?=
 =?us-ascii?Q?LtS4d7PeN1MwFxGBjUflw/5cR3aaSxQnugvl5j44t0TD8oLnkroLHwgd0Lqe?=
 =?us-ascii?Q?9yS4mdeeGbud5DQCXSHRrJ9EJmKY7jDv6FQaNRqFe6+bv/uuThbp0IEh3POm?=
 =?us-ascii?Q?Y1g2h/DqCHduGLt0xhdwU2WALelaUAqBjBdFd0iEAm6LIH/3B3MjVn6NOLoH?=
 =?us-ascii?Q?JEdOdOW1Y5MhGOQX4hznZqxIr0qldWToq8nixGrzLp6RNWFclGnUdQci384a?=
 =?us-ascii?Q?e07r4XlJGfdhwLE5MCMesbtuO75omaqU6O452xbkK3n3jlSGcxyoFVvOPjq4?=
 =?us-ascii?Q?WiUU23aGVznXqqMa3JsNojboyAtVabbmjHCG5bNLElbT3ehXYQ/5ADvnKIyL?=
 =?us-ascii?Q?Eeqs3O46KNDm2fki21xaU5DUggfke5kPRusv51BboVuecLJCeltNSc3SERZS?=
 =?us-ascii?Q?3XG5PJeRRXqZi+ML7uiM89NlKG7a6zQNfTlciFO1PrJMYcyqb6kc9yU5wMgQ?=
 =?us-ascii?Q?yxTanGdP3Rqp9e5RyUE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:36:22.8202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd2281e3-9bd4-4986-0c4b-08de1b7d3c4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9605

The drm/ttm patch modifies TTM to support multiple contexts for the pipelined moves.

Then amdgpu/ttm is updated to express dependencies between jobs explicitely,
instead of relying on the ordering of execution guaranteed by the use of a single
instance.
With all of this in place, we can use multiple entities, with each having access
to the available SDMA instances.

This rework also gives the opportunity to merge the clear functions into a single
one and to optimize a bit GART usage.

(The first patch of the series has already been merged through drm-misc but I'm
including it here to reduce conflicts)

Pierre-Eric Pelloux-Prayer (20):
  drm/amdgpu: give each kernel job a unique id
  drm/ttm: rework pipelined eviction fence handling
  drm/amdgpu: remove direct_submit arg from amdgpu_copy_buffer
  drm/amdgpu: introduce amdgpu_ttm_entity
  drm/amdgpu: pass the entity to use to ttm functions
  drm/amdgpu: statically assign gart windows to ttm entities
  drm/amdgpu: allocate multiple clear entities
  drm/amdgpu: allocate multiple move entities
  drm/amdgpu: pass optional dependency to amdgpu_fill_buffer
  drm/amdgpu: prepare amdgpu_fill_buffer to use N entities
  drm/amdgpu: use multiple entities in amdgpu_fill_buffer
  drm/amdgpu: use TTM_FENCES_MAX_SLOT_COUNT
  drm/amdgpu: use multiple entities in amdgpu_move_blit
  drm/amdgpu: pass all the sdma rings to amdgpu_mman
  drm/amdgpu: introduce amdgpu_sdma_set_vm_pte_scheds
  drm/amdgpu: give ttm entities access to all the sdma scheds
  drm/amdgpu: get rid of amdgpu_ttm_clear_buffer
  drm/amdgpu: rename amdgpu_fill_buffer as amdgpu_clear_buffer
  drm/amdgpu: use larger gart window when possible
  drm/amdgpu: double AMDGPU_GTT_MAX_TRANSFER_SIZE

 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c       |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       |  23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h       |  19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c      |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 496 ++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  51 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c       |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c       |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c       |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c      |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c    |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c     |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   |  12 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c         |  10 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c        |  10 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c        |  10 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  17 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c      |  17 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        |  10 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        |  10 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c        |  10 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c        |  10 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c           |  10 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c         |   6 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c         |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  31 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |   2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |   2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c  |   2 +-
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |  13 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c |   5 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  |  56 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c             |  36 +-
 drivers/gpu/drm/ttm/ttm_resource.c            |  45 +-
 include/drm/ttm/ttm_resource.h                |  34 +-
 45 files changed, 651 insertions(+), 414 deletions(-)

-- 
2.43.0


