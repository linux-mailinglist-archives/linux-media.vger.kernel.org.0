Return-Path: <linux-media+bounces-30695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A04BA96472
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 11:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D5193AB1B7
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 09:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B58920CCDF;
	Tue, 22 Apr 2025 09:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="E523KKnc"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022082.outbound.protection.outlook.com [40.107.43.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD51201270;
	Tue, 22 Apr 2025 09:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745314313; cv=fail; b=m75qNgK+Vwo8EQtxBjrZ3eUjlg9b0AkyHnYM0XesoIX9Pf4fjy6xZngaFqQGbawAcy6U1BFxGMYh3bTzifCspoduA0ftVr6BDdHsrlvFoOtOTTD7whVEMCc72GkmsK4dbjUi4vqWQzkRXwwSVey/yEU5gPugpU2U+Jp9Xxd5tAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745314313; c=relaxed/simple;
	bh=VluaPHL9UX9LqMPQMC0/Jh2vKC2+SpztPMQr3w/jmc4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FdMVTPM+Ek/GC8nAPOctydjKJlQ74RbFhL6GtmDL9DQ3W9yarVMFcsSKqEglFDF41nd8uqWjZXMgvMUdURlGnl3IE+9CsSamURyFE3fc3FdH84QaxymGIKKhFpH5Vi4TQKBgj+1OjAKZA+H7c/q/axeKKP7c3ZoV43L89ZyL65k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=E523KKnc; arc=fail smtp.client-ip=40.107.43.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qh4yJCBWek5FfSWgyyVVy4FjLAbHfVAOJxyrVx7SyCl78Z4ko8jOEl0ZkA+sgtyVj/uC9VnhF8DkklYWIyf2bnbPzUVSJn/BSp7ZMxhA47oBM/zSt1y+6/25sBXqC2J2H3ZfwoNRM6NlHXgD+QHf126fpnhiN1KRwhZRJe5hwe5N6P+hHBv95aqHEdhZpMq1uivkmh9Kw631jwy+bXU2lmAna7cx18vmCINhbor7NlEuAlGWgzUZIgcdfh2tQmOuDBx2FiiDaUFsYB/Y0dCMh3AEWrK6AZhpSNHqB06/l6VyvVYhS7LzaVD6knnwXpk92G2Sm/4AZ/NFLVlyyKrUJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J27edSFdIELhJiatcHJmPGjPZyF2yRGGhn+qGuee2B8=;
 b=G9N4CGif3s23Qag1+h1RW5FNjtm5Mp3KFJEmUJ4xAUw30t6Px7+OyFP1QTOTUhZiVUUoohIWp9dRPcuxTN61oF69VKLm4hmkxaXenI61s166k7AFKKdmD+3XtTydD2maR92R4D5d2BomLS5E4cRcJNDdaEcXc3LKWCJI60MNY8OE2Dgcv+gMbUOIo6+wDdDJvVOdaBEO/hdm5R0qlm12Fe1xMrHyhXBW4KIb+Lwmgpq3ZBMAJKMeR875zEwjAvguRuono7/6CayOEfwcBl8gQFSiY1k0wg5RtwoIMyYNAfhpbDJSV2HbrioHclVu4QdS/HHW1y5E+1tz44dxmk963A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J27edSFdIELhJiatcHJmPGjPZyF2yRGGhn+qGuee2B8=;
 b=E523KKncpoPczbHaCHX18p07TMdEm4P3QK5ZTHvdbQFxfhWFUyGd+PDWOE+wBsnpTJRIO/qs6zwP4N3T1VwX5Nkg4pMg7GMFatxuAGPJtrjCQvbG0eVsy1newADxHhFDLT+q91LvqEUh2t9+yifC5Ud3+98mYS5B0goeI5UqeMQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SE2P216MB1521.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.34; Tue, 22 Apr 2025 09:31:39 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%3]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 09:31:39 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	sebastian.fricke@collabora.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	marex@denx.de,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Ming Qian <ming.qian@oss.nxp.com>
Subject: [PATCH v2 8/8] media: chips-media: wave6: Add Wave6 core driver
Date: Tue, 22 Apr 2025 18:31:19 +0900
Message-Id: <20250422093119.595-9-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250422093119.595-1-nas.chung@chipsnmedia.com>
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0120.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c9::7) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|SE2P216MB1521:EE_
X-MS-Office365-Filtering-Correlation-Id: fe2a3e2c-ddfc-4694-a323-08dd81807bf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n4KSr2Gc1VQ4fKF+40J6p/1LBoWyu4khtN14ZgLkNt76PYSCcPvvJP7OZc0f?=
 =?us-ascii?Q?nbRnN/hoP8518ZAF0T+TVEzdyc04i88r5kWxNAyhmFCog5fHDQ2PzWyeg7U5?=
 =?us-ascii?Q?YeiTOvVQBjmsktkXCgkAfL9/cyzYN1yF4bP9zO55WKxtJylDeCjur+GQcG41?=
 =?us-ascii?Q?FAEHG2ctNUxOO6FyX58z5xJsRXmYJfr2sSCsgDfY4YRQ+sPRcI5O31SBgO7I?=
 =?us-ascii?Q?hcUJAhVWB9BBrcD/Iq26oRB0ZLjV3LxMqyxfsTECA0h9oWtBrsuYWDpnBTiV?=
 =?us-ascii?Q?ojHZYKGw6dqcILBTk7zgxk1O8LK+HhKB2Z7bdrsaSABmGsaB0Rp2pt8sTOCS?=
 =?us-ascii?Q?SHXaTxjEl8hgSn1nJ8YOh3UKxIwIXwSfDnOuhoLYfFNRUc1YJCDgmPU0Jrzg?=
 =?us-ascii?Q?5NzHibZDE5ME+PNT4NUEJgtnB+QS/mC6uf4+AssMmcjFuG19jNeLMAiMs0QW?=
 =?us-ascii?Q?5cEt0DCsnoxUOJIqpsBluhgZF6a+Skx7jfhsPuhNuRB7gK4Qy48emULZsZ8S?=
 =?us-ascii?Q?GQJeJ7k6NYbIFSNYGPdtWNkdKhiNzHTL37Bq2no1lP7l6XkEKZseOtjfp68K?=
 =?us-ascii?Q?XwRVWu4czt4rw6N6OdzAnDQqCXdOmaptHlly2dzzCH+rY8X7pm6GAjYxDULH?=
 =?us-ascii?Q?ZLRKwkBgZd2Ocd/8GK7F9fW142lAI36hNjMRlVERmmj2f3yiW8TC3DUpBb+u?=
 =?us-ascii?Q?LVDtIJhsdKJxjfar0FfpD8JOC8JpuyctIaZ9yWMPxQuf1t90+s2E+3IameHC?=
 =?us-ascii?Q?gzatsbvmk5UutVT6fpyIGglZ+4LM8puZJwg30zz+mdx1WDU6nIkIizUKbz7h?=
 =?us-ascii?Q?mOgkOvrTKBR/AibtDtOfJaNUXthIi/lP5/N11jYOmbWFwLU/WP0aOB8hw9xT?=
 =?us-ascii?Q?OuOxc3vQagvrtcAtJVtVkjNLzul36s81DHIfI+sKam6hKwoNr79e5xJOPJ0d?=
 =?us-ascii?Q?Y1GfTMoNtGt6fex4nUqBZhcpOtCfGx3kMJLcPebKhj45xInLewB4iiEl4MUS?=
 =?us-ascii?Q?DQjNDa3y/2nSAPSqUwAT37kmGQs8e6slzblFflvJg5IEMUiON5WMQUFh1FLn?=
 =?us-ascii?Q?8NIKM3S8HiDO7L4E2sx7ykAiv4b9j0dK/OujXZmVLblDjABTecrksOrWKgzA?=
 =?us-ascii?Q?VsR5PZpHRUOHvYAVHzHA0Kb7ftZTpgufamDTYpe1ogpXFxuCygw9Yova5NQb?=
 =?us-ascii?Q?mCHBdaAPomcvbRFIc8juGVYLl88ofUi3gpjUczzd/EtjAmMnmJDCyStTmwFz?=
 =?us-ascii?Q?VIMSnAYfKlaVV82zqlQytVQXvJ/749YqR9WhdQlV+sQsxVn9VKdU4HtuWD4O?=
 =?us-ascii?Q?RP+UqOuNSnI3a+rXKv34cYKXYDx4eye9fVoi7gH5QeZ6QGAneQO3CymKBUe7?=
 =?us-ascii?Q?FOuAE5NajSRFRRMGqGT8Zkwus9J/5bhW2kK9k13KYK6XyW2LSQ071vmJtW8I?=
 =?us-ascii?Q?5M2afN9T3GVCGm327Mi8ztxSls0ffehR3uL88Y91LsoRXI9AL76SLg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+GxXOWpEmNm1nK73O1OKo2zc9Jxw2EBc7xWdVH0bqRTgBR787rIdI6z++TnJ?=
 =?us-ascii?Q?9tiliQivWxQLObPMj1j6DIA/zwY8J6LizOnFZXoszYCHrkv9WmBfCoaLV0Ba?=
 =?us-ascii?Q?ncQW1IjE0csFcqKQ3qk6N/i/wWyQ4nmMGmO3k+X0FQEhXbrfumKQfhuuf8NR?=
 =?us-ascii?Q?RuceDhYuRi5M+jsbCJwzl74TfX27mC8bKmkLhkN9+vu5YCX+aba/umuJqTZz?=
 =?us-ascii?Q?0GZ2ZNCSksjPDm/onFzUHwQAGuFGCR3QLyowohqNctVEOSc6AicjwZETLQoE?=
 =?us-ascii?Q?oJy1C2ZWY9F8mjl7IszEo11s5k0OgAa5VfcbpuK2JmIGyXS1GYQ2wxHc1Oli?=
 =?us-ascii?Q?4VGFv48SEzRQ/s+tzIldBZN1/Jb49Ns4fvoqHKAycxXhaF6MBSasVLDIG1ZI?=
 =?us-ascii?Q?EndUsptDM/Y+5xTACrVfQkeF9X0FqK3sg0O38MfpwR8GowqjKefKZ7lkv/NW?=
 =?us-ascii?Q?9NLOLralxgdOBLQDbycC9aAHIggHk2RzOej5r6f8cHzZJRtroHU/NjACH5rL?=
 =?us-ascii?Q?Ve0Wvg18VdCnpbQAn1Kf3q2CFbS3ncxFPaC/+9IcgPiGQjZyqFDCoScvkfK6?=
 =?us-ascii?Q?4HA7W8+xzBam6d7ILJ/3dePvfApQ6JSJpDMYs3TM630R7G1TmhxdYNgwUqiX?=
 =?us-ascii?Q?ztLdjIuB9XLHpGLCrA9NPyo2ddlv9bkGh2y+LFQOVFxvAfDmgFt+g6DVQQMe?=
 =?us-ascii?Q?M0u8GtEY8l6IuLjxdR88dijtL6uyMth/9ZWLpGSDM02EG8nf54lPqc4s6xn3?=
 =?us-ascii?Q?7AidSkSNOoOLk/v6XsnqDQuL/7uDUd1UX7Mm/iCVcIRzKxCwJzRPyXKPBN1R?=
 =?us-ascii?Q?qZnOqHZItg0bD7fbdb+ayXSecZgKqNk6k3lEImC8W94YXYWOR9Kkg5/KxQV/?=
 =?us-ascii?Q?TwiYxlOo4qjxMIix9qbNEW7OYSi3PXzkE/LhQyxUikbNVeTdXczn3w9YVjK6?=
 =?us-ascii?Q?OeeKEUojKWY3hmqmK47Ac2x4OmsaM5aL1xouG2xyle0GiNTn/U0/p6JTian1?=
 =?us-ascii?Q?Xw0oD+c2CpnG8EsZ70ubXwukXHdiXVY2rB/hmzBmyl/jw9/drVMfHv9ECV/l?=
 =?us-ascii?Q?gAAMJGHixu5pUS1WyBosaTkwa6P7lkFsscDWP9AZCP5jsFkJuMQ66rYw8Nii?=
 =?us-ascii?Q?bj1nSWzUQOtuC5WJ01WNsjNfbIBAuD+4qnrX7i5EyUzAsgzNIaTCjk2Cw1Is?=
 =?us-ascii?Q?ZP0+xQzNoGKH7gUqKmwpj8eRrFQWaMxqJAR0kqLJA701bCopqD2weMJTLOaH?=
 =?us-ascii?Q?sgwKbxh3M2dx7iyXCDpHawTSEm8T3lcFYPJ9oiCsW9dluwJj07Hu6+J2c9Xz?=
 =?us-ascii?Q?PCmip8wUCQfiYum77q5udabzkglTSx84MME2yVE5P6Wl/ABB/7kEswbodzu3?=
 =?us-ascii?Q?HQZh2J8+RqOkqA1BbAo3mprrSRYdx1A2DAOhOhIALxjKS38ewl/GKlFDklZ2?=
 =?us-ascii?Q?eVm9LLxCLgxk/6HPPWYDKO02gcXky6y3OjpT2pQuptFYCJznoqDHMOw+FhVc?=
 =?us-ascii?Q?zQXEuMqijRNFQBzzd09Sfg5nQpliLQ44CLUclLRLG7pXzTeZ3awgkcPy9dlj?=
 =?us-ascii?Q?2wH3m7mDmMMGemA6OMIiyIT+mX9TllzaRx7Irp076iMqCKSCwqSPkAtyB5li?=
 =?us-ascii?Q?5Q=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe2a3e2c-ddfc-4694-a323-08dd81807bf7
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 09:31:39.3823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wDbei8Aqp2I8XDIeY3TrTyJzAzu33PLUjktDOam0P12sdou4pGvPDAQ8Afrp5oaMMk7iLH+jR1aRsG/gzszv6H0mXloqbx6h1ysyq8CP1ts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1521

This adds the core driver for the Chips&Media Wave6 video codec IP.

The core region provides the encoding and decoding capabilities of
the VPU and depends on the control region for firmware and shared
resource management.

This driver configure the v4l2 m2m video device and handles
communication with the Wave6 hardware to perform video processing tasks.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Tested-by: Ming Qian <ming.qian@oss.nxp.com>
---
 .../media/platform/chips-media/wave6/Kconfig  |   2 +-
 .../media/platform/chips-media/wave6/Makefile |  13 +
 .../chips-media/wave6/wave6-vpu-core.c        | 461 ++++++++++++++++++
 .../chips-media/wave6/wave6-vpu-core.h        | 105 ++++
 4 files changed, 580 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.h

diff --git a/drivers/media/platform/chips-media/wave6/Kconfig b/drivers/media/platform/chips-media/wave6/Kconfig
index 9ca428f9d20c..14ea908e3cd4 100644
--- a/drivers/media/platform/chips-media/wave6/Kconfig
+++ b/drivers/media/platform/chips-media/wave6/Kconfig
@@ -13,7 +13,7 @@ config VIDEO_WAVE6_VPU
 	  The codec driver provides encoding and decoding capabilities
 	  for H.264, HEVC, and other video formats.
 	  To compile this driver as modules, choose M here: the
-	  modules will be called wave6.
+	  modules will be called wave6 and wave6-core.
 
 config VIDEO_WAVE6_VPU_SUPPORT_FOLLOWER
 	bool "Support Wave6 VPU follower"
diff --git a/drivers/media/platform/chips-media/wave6/Makefile b/drivers/media/platform/chips-media/wave6/Makefile
index 7bbc8615c5b9..b99f8bec1b9a 100644
--- a/drivers/media/platform/chips-media/wave6/Makefile
+++ b/drivers/media/platform/chips-media/wave6/Makefile
@@ -1,7 +1,20 @@
 # SPDX-License-Identifier: GPL-2.0
 
+# tell define_trace.h where to find the trace header
+CFLAGS_wave6-vpu-core.o := -I$(src)
+
 wave6-objs += wave6-vpu.o
 obj-$(CONFIG_VIDEO_WAVE6_VPU) += wave6.o
 
+wave6-core-objs += wave6-vpu-core.o \
+		   wave6-vpu-v4l2.o \
+		   wave6-vpu-dbg.o \
+		   wave6-vdi.o \
+		   wave6-vpuapi.o \
+		   wave6-vpu-dec.o \
+		   wave6-vpu-enc.o \
+		   wave6-hw.o
+obj-$(CONFIG_VIDEO_WAVE6_VPU) += wave6-core.o
+
 wave6-ctrl-objs += wave6-vpu-ctrl.o
 obj-$(CONFIG_VIDEO_WAVE6_VPU_CTRL) += wave6-ctrl.o
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
new file mode 100644
index 000000000000..572c2e55067d
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
@@ -0,0 +1,461 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - wave6 core driver
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/firmware.h>
+#include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
+#include <linux/debugfs.h>
+#include "wave6-vpu-core.h"
+#include "wave6-regdefine.h"
+#include "wave6-vpuconfig.h"
+#include "wave6-hw.h"
+#include "wave6-vpu.h"
+#include "wave6-vpu-dbg.h"
+
+#define CREATE_TRACE_POINTS
+#include "wave6-trace.h"
+
+#define VPU_CORE_PLATFORM_DEVICE_NAME "wave6-vpu-core"
+#define WAVE6_VPU_DEBUGFS_DIR "wave6"
+
+#define WAVE6_IS_ENC BIT(0)
+#define WAVE6_IS_DEC BIT(1)
+
+struct wave6_match_data {
+	int codec_types;
+	u32 compatible_fw_version;
+};
+
+static const struct wave6_match_data wave633c_data = {
+	.codec_types = WAVE6_IS_ENC | WAVE6_IS_DEC,
+	.compatible_fw_version = 0x2010000,
+};
+
+static irqreturn_t wave6_vpu_irq(int irq, void *dev_id)
+{
+	struct vpu_core_device *dev = dev_id;
+	u32 irq_status;
+
+	if (wave6_vdi_readl(dev, W6_VPU_VPU_INT_STS)) {
+		irq_status = wave6_vdi_readl(dev, W6_VPU_VINT_REASON);
+
+		wave6_vdi_writel(dev, W6_VPU_VINT_REASON_CLR, irq_status);
+		wave6_vdi_writel(dev, W6_VPU_VINT_CLEAR, 0x1);
+
+		trace_irq(dev, irq_status);
+
+		kfifo_in(&dev->irq_status, &irq_status, sizeof(int));
+
+		return IRQ_WAKE_THREAD;
+	}
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t wave6_vpu_irq_thread(int irq, void *dev_id)
+{
+	struct vpu_core_device *core = dev_id;
+	struct wave6_vpu_device *vpu = dev_get_drvdata(core->dev->parent);
+	struct vpu_instance *inst;
+	int irq_status, ret;
+
+	while (kfifo_len(&core->irq_status)) {
+		bool error = false;
+
+		ret = kfifo_out(&core->irq_status, &irq_status, sizeof(int));
+		if (!ret)
+			break;
+
+		if (irq_status & BIT(W6_INT_BIT_REQ_WORK_BUF)) {
+			call_void_vop(vpu, req_work_buffer, &core->entity);
+			continue;
+		}
+
+		if ((irq_status & BIT(W6_INT_BIT_INIT_SEQ)) ||
+		    (irq_status & BIT(W6_INT_BIT_ENC_SET_PARAM))) {
+			complete(&core->irq_done);
+			continue;
+		}
+
+		if (irq_status & BIT(W6_INT_BIT_BSBUF_ERROR))
+			error = true;
+
+		inst = v4l2_m2m_get_curr_priv(core->m2m_dev);
+		if (inst)
+			inst->ops->finish_process(inst, error);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static u32 wave6_vpu_read_reg(struct device *dev, u32 addr)
+{
+	struct vpu_core_device *vpu_dev = dev_get_drvdata(dev);
+
+	return wave6_vdi_readl(vpu_dev, addr);
+}
+
+static void wave6_vpu_write_reg(struct device *dev, u32 addr, u32 data)
+{
+	struct vpu_core_device *vpu_dev = dev_get_drvdata(dev);
+
+	wave6_vdi_writel(vpu_dev, addr, data);
+}
+
+static void wave6_vpu_on_boot(struct device *dev)
+{
+	struct vpu_core_device *vpu_dev = dev_get_drvdata(dev);
+	u32 product_code;
+	u32 version;
+	u32 revision;
+	u32 hw_version;
+	int ret;
+
+	mutex_lock(&vpu_dev->hw_lock);
+
+	product_code = wave6_vdi_readl(vpu_dev, W6_VPU_RET_PRODUCT_VERSION);
+
+	wave6_vpu_enable_interrupt(vpu_dev);
+	ret = wave6_vpu_get_version(vpu_dev, &version, &revision);
+	if (ret) {
+		dev_err(dev, "wave6_vpu_get_version fail\n");
+		goto unlock;
+	}
+
+	hw_version = wave6_vdi_readl(vpu_dev, W6_RET_CONF_REVISION);
+
+	if (vpu_dev->product_code != product_code ||
+	    vpu_dev->fw_version != version ||
+	    vpu_dev->fw_revision != revision ||
+	    vpu_dev->hw_version != hw_version) {
+		vpu_dev->product_code = product_code;
+		vpu_dev->fw_version = version;
+		vpu_dev->fw_revision = revision;
+		vpu_dev->hw_version = hw_version;
+		dev_info(dev, "product: %08x, fw_version : %d.%d.%d(r%d), hw_version : 0x%x\n",
+			 vpu_dev->product_code,
+			 (version >> 24) & 0xFF,
+			 (version >> 16) & 0xFF,
+			 (version >> 0) & 0xFFFF,
+			 revision,
+			 vpu_dev->hw_version);
+	}
+
+	if (vpu_dev->res->compatible_fw_version > version)
+		dev_err(dev, "compatible firmware version is v%d.%d.%d or higher, but only v%d.%d.%d\n",
+			(vpu_dev->res->compatible_fw_version >> 24) & 0xFF,
+			(vpu_dev->res->compatible_fw_version >> 16) & 0xFF,
+			vpu_dev->res->compatible_fw_version & 0xFFFF,
+			(version >> 24) & 0xFF,
+			(version >> 16) & 0xFF,
+			version & 0xFFFF);
+
+unlock:
+	mutex_unlock(&vpu_dev->hw_lock);
+}
+
+void wave6_vpu_pause(struct device *dev, int resume)
+{
+	struct vpu_core_device *vpu_dev = dev_get_drvdata(dev);
+
+	mutex_lock(&vpu_dev->pause_lock);
+
+	if (resume) {
+		vpu_dev->pause_request--;
+		if (!vpu_dev->pause_request)
+			v4l2_m2m_resume(vpu_dev->m2m_dev);
+	} else {
+		if (!vpu_dev->pause_request)
+			v4l2_m2m_suspend(vpu_dev->m2m_dev);
+		vpu_dev->pause_request++;
+	}
+	mutex_unlock(&vpu_dev->pause_lock);
+}
+
+void wave6_vpu_activate(struct vpu_core_device *dev)
+{
+	dev->entity.active = true;
+}
+
+static void wave6_vpu_wait_activated(struct vpu_core_device *dev)
+{
+	if (dev->entity.active)
+		wave6_vpu_check_state(dev);
+}
+
+static int wave6_vpu_core_register_device(struct vpu_core_device *core)
+{
+	struct wave6_vpu_device *vpu = dev_get_drvdata(core->dev->parent);
+
+	if (!vpu || !vpu->ops)
+		return -EPROBE_DEFER;
+
+	core->entity.dev = core->dev;
+	core->entity.read_reg = wave6_vpu_read_reg;
+	core->entity.write_reg = wave6_vpu_write_reg;
+	core->entity.on_boot = wave6_vpu_on_boot;
+	core->entity.pause = wave6_vpu_pause;
+
+	return call_vop(vpu, reg_core, &core->entity);
+}
+
+static void wave6_vpu_core_unregister_device(struct vpu_core_device *core)
+{
+	struct wave6_vpu_device *vpu = dev_get_drvdata(core->dev->parent);
+
+	if (!vpu || !vpu->ops)
+		return;
+
+	call_void_vop(vpu, unreg_core, &core->entity);
+}
+
+static int wave6_vpu_core_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct vpu_core_device *dev;
+	const struct wave6_match_data *match_data;
+
+	match_data = device_get_match_data(&pdev->dev);
+	if (!match_data) {
+		dev_err(&pdev->dev, "missing match_data\n");
+		return -EINVAL;
+	}
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret < 0) {
+		dev_err(&pdev->dev, "dma_set_mask_and_coherent failed: %d\n", ret);
+		return ret;
+	}
+
+	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	mutex_init(&dev->dev_lock);
+	mutex_init(&dev->hw_lock);
+	mutex_init(&dev->pause_lock);
+	init_completion(&dev->irq_done);
+	dev_set_drvdata(&pdev->dev, dev);
+	dev->dev = &pdev->dev;
+	dev->res = match_data;
+
+	dev->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dev->reg_base))
+		return PTR_ERR(dev->reg_base);
+
+	ret = devm_clk_bulk_get_all(&pdev->dev, &dev->clks);
+	if (ret < 0) {
+		dev_warn(&pdev->dev, "unable to get clocks: %d\n", ret);
+		ret = 0;
+	}
+	dev->num_clks = ret;
+
+	ret = wave6_vpu_core_register_device(dev);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "register vpu core fail, ret = %d\n", ret);
+		return ret;
+	}
+
+	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "v4l2_device_register fail: %d\n", ret);
+		goto err_register_core;
+	}
+
+	ret = wave6_vpu_init_m2m_dev(dev);
+	if (ret)
+		goto err_v4l2_unregister;
+
+	dev->irq = platform_get_irq(pdev, 0);
+	if (dev->irq < 0) {
+		dev_err(&pdev->dev, "failed to get irq resource\n");
+		ret = -ENXIO;
+		goto err_m2m_dev_release;
+	}
+
+	ret = kfifo_alloc(&dev->irq_status, 16 * sizeof(int), GFP_KERNEL);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to allocate fifo\n");
+		goto err_m2m_dev_release;
+	}
+
+	ret = devm_request_threaded_irq(&pdev->dev, dev->irq, wave6_vpu_irq,
+					wave6_vpu_irq_thread, 0, "vpu_irq", dev);
+	if (ret) {
+		dev_err(&pdev->dev, "fail to register interrupt handler: %d\n", ret);
+		goto err_kfifo_free;
+	}
+
+	dev->temp_vbuf.size = ALIGN(WAVE6_TEMPBUF_SIZE, 4096);
+	ret = wave6_alloc_dma(dev->dev, &dev->temp_vbuf);
+	if (ret) {
+		dev_err(&pdev->dev, "alloc temp of size %zu failed\n",
+			dev->temp_vbuf.size);
+		goto err_kfifo_free;
+	}
+
+	dev->debugfs = debugfs_lookup(WAVE6_VPU_DEBUGFS_DIR, NULL);
+	if (IS_ERR_OR_NULL(dev->debugfs))
+		dev->debugfs = debugfs_create_dir(WAVE6_VPU_DEBUGFS_DIR, NULL);
+
+	pm_runtime_enable(&pdev->dev);
+
+	if (dev->res->codec_types & WAVE6_IS_DEC) {
+		ret = wave6_vpu_dec_register_device(dev);
+		if (ret) {
+			dev_err(&pdev->dev, "wave6_vpu_dec_register_device fail: %d\n", ret);
+			goto err_temp_vbuf_free;
+		}
+	}
+	if (dev->res->codec_types & WAVE6_IS_ENC) {
+		ret = wave6_vpu_enc_register_device(dev);
+		if (ret) {
+			dev_err(&pdev->dev, "wave6_vpu_enc_register_device fail: %d\n", ret);
+			goto err_dec_unreg;
+		}
+	}
+
+	dev_dbg(&pdev->dev, "Added wave6 driver with caps %s %s\n",
+		dev->res->codec_types & WAVE6_IS_ENC ? "'ENCODE'" : "",
+		dev->res->codec_types & WAVE6_IS_DEC ? "'DECODE'" : "");
+
+	return 0;
+
+err_dec_unreg:
+	if (dev->res->codec_types & WAVE6_IS_DEC)
+		wave6_vpu_dec_unregister_device(dev);
+err_temp_vbuf_free:
+	wave6_free_dma(&dev->temp_vbuf);
+err_kfifo_free:
+	kfifo_free(&dev->irq_status);
+err_m2m_dev_release:
+	wave6_vpu_release_m2m_dev(dev);
+err_v4l2_unregister:
+	v4l2_device_unregister(&dev->v4l2_dev);
+err_register_core:
+	wave6_vpu_core_unregister_device(dev);
+	mutex_destroy(&dev->dev_lock);
+	mutex_destroy(&dev->hw_lock);
+	mutex_destroy(&dev->pause_lock);
+
+	return ret;
+}
+
+static void wave6_vpu_core_remove(struct platform_device *pdev)
+{
+	struct vpu_core_device *dev = dev_get_drvdata(&pdev->dev);
+
+	pm_runtime_disable(&pdev->dev);
+
+	wave6_vpu_enc_unregister_device(dev);
+	wave6_vpu_dec_unregister_device(dev);
+	wave6_free_dma(&dev->temp_vbuf);
+	kfifo_free(&dev->irq_status);
+	wave6_vpu_release_m2m_dev(dev);
+	v4l2_device_unregister(&dev->v4l2_dev);
+	wave6_vpu_core_unregister_device(dev);
+	mutex_destroy(&dev->dev_lock);
+	mutex_destroy(&dev->hw_lock);
+	mutex_destroy(&dev->pause_lock);
+}
+
+static int __maybe_unused wave6_vpu_core_runtime_suspend(struct device *dev)
+{
+	struct vpu_core_device *core = dev_get_drvdata(dev);
+	struct wave6_vpu_device *vpu = dev_get_drvdata(dev->parent);
+
+	if (!core || !vpu || !vpu->ops)
+		return -ENODEV;
+
+	call_void_vop(vpu, put_vpu, &core->entity);
+	if (core->num_clks)
+		clk_bulk_disable_unprepare(core->num_clks, core->clks);
+
+	return 0;
+}
+
+static int __maybe_unused wave6_vpu_core_runtime_resume(struct device *dev)
+{
+	struct vpu_core_device *core = dev_get_drvdata(dev);
+	struct wave6_vpu_device *vpu = dev_get_drvdata(dev->parent);
+	int ret = 0;
+
+	if (!core || !vpu || !vpu->ops)
+		return -ENODEV;
+
+	if (core->num_clks) {
+		ret = clk_bulk_prepare_enable(core->num_clks, core->clks);
+		if (ret) {
+			dev_err(dev, "failed to enable clocks: %d\n", ret);
+			return ret;
+		}
+	}
+
+	ret = call_vop(vpu, get_vpu, &core->entity);
+	if (!ret)
+		wave6_vpu_wait_activated(core);
+	else if (core->num_clks)
+		clk_bulk_disable_unprepare(core->num_clks, core->clks);
+
+	return ret;
+}
+
+static int __maybe_unused wave6_vpu_core_suspend(struct device *dev)
+{
+	int ret;
+
+	wave6_vpu_pause(dev, 0);
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		wave6_vpu_pause(dev, 1);
+
+	return ret;
+}
+
+static int __maybe_unused wave6_vpu_core_resume(struct device *dev)
+{
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
+
+	wave6_vpu_pause(dev, 1);
+	return 0;
+}
+
+static const struct dev_pm_ops wave6_vpu_core_pm_ops = {
+	SET_RUNTIME_PM_OPS(wave6_vpu_core_runtime_suspend,
+			   wave6_vpu_core_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(wave6_vpu_core_suspend,
+				wave6_vpu_core_resume)
+};
+
+static const struct of_device_id wave6_vpu_core_ids[] = {
+	{ .compatible = "nxp,imx95-vpu-core", .data = &wave633c_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, wave6_vpu_core_ids);
+
+static struct platform_driver wave6_vpu_core_driver = {
+	.driver = {
+		.name = VPU_CORE_PLATFORM_DEVICE_NAME,
+		.of_match_table = wave6_vpu_core_ids,
+		.pm = &wave6_vpu_core_pm_ops,
+	},
+	.probe = wave6_vpu_core_probe,
+	.remove = wave6_vpu_core_remove,
+};
+
+module_platform_driver(wave6_vpu_core_driver);
+MODULE_DESCRIPTION("chips&media Wave6 VPU CORE V4L2 driver");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
new file mode 100644
index 000000000000..0e5e305bf0af
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
@@ -0,0 +1,105 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 core driver
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_VPU_CORE_H__
+#define __WAVE6_VPU_CORE_H__
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/videobuf2-dma-contig.h>
+#include "wave6-vpuconfig.h"
+#include "wave6-vpuapi.h"
+
+struct vpu_buffer {
+	struct v4l2_m2m_buffer v4l2_m2m_buf;
+	bool consumed;
+	bool used;
+	bool error;
+	bool force_key_frame;
+	bool force_frame_qp;
+	u32 force_i_frame_qp;
+	u32 force_p_frame_qp;
+	u32 force_b_frame_qp;
+	ktime_t ts_input;
+	ktime_t ts_start;
+	ktime_t ts_finish;
+	ktime_t ts_output;
+	u64 hw_time;
+	u32 average_qp;
+};
+
+enum vpu_fmt_type {
+	VPU_FMT_TYPE_CODEC	= 0,
+	VPU_FMT_TYPE_RAW	= 1
+};
+
+struct vpu_format {
+	unsigned int v4l2_pix_fmt;
+	unsigned int max_width;
+	unsigned int min_width;
+	unsigned int max_height;
+	unsigned int min_height;
+	unsigned int num_planes;
+};
+
+static inline struct vpu_instance *wave6_to_vpu_inst(struct v4l2_fh *vfh)
+{
+	return container_of(vfh, struct vpu_instance, v4l2_fh);
+}
+
+static inline struct vpu_instance *wave6_ctrl_to_vpu_inst(struct v4l2_ctrl *vctrl)
+{
+	return container_of(vctrl->handler, struct vpu_instance, v4l2_ctrl_hdl);
+}
+
+static inline struct vpu_buffer *wave6_to_vpu_buf(struct vb2_v4l2_buffer *vbuf)
+{
+	return container_of(vbuf, struct vpu_buffer, v4l2_m2m_buf.vb);
+}
+
+static inline bool wave6_vpu_both_queues_are_streaming(struct vpu_instance *inst)
+{
+	struct vb2_queue *vq_cap = v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx);
+	struct vb2_queue *vq_out = v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx);
+
+	return vb2_is_streaming(vq_cap) && vb2_is_streaming(vq_out);
+}
+
+u32 wave6_vpu_get_consumed_fb_num(struct vpu_instance *inst);
+u32 wave6_vpu_get_used_fb_num(struct vpu_instance *inst);
+void wave6_vpu_pause(struct device *dev, int resume);
+void wave6_vpu_activate(struct vpu_core_device *dev);
+void wave6_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
+			  unsigned int width,
+			  unsigned int height);
+struct vb2_v4l2_buffer *wave6_get_dst_buf_by_addr(struct vpu_instance *inst,
+						  dma_addr_t addr);
+dma_addr_t wave6_get_dma_addr(struct vb2_v4l2_buffer *buf,
+			      unsigned int plane_no);
+enum codec_std wave6_to_codec_std(enum vpu_instance_type type, unsigned int v4l2_pix_fmt);
+const char *wave6_vpu_instance_state_name(u32 state);
+void wave6_vpu_set_instance_state(struct vpu_instance *inst, u32 state);
+u64 wave6_vpu_cycle_to_ns(struct vpu_core_device *core, u64 cycle);
+int wave6_vpu_wait_interrupt(struct vpu_instance *inst, unsigned int timeout);
+int  wave6_vpu_dec_register_device(struct vpu_core_device *dev);
+void wave6_vpu_dec_unregister_device(struct vpu_core_device *dev);
+int  wave6_vpu_enc_register_device(struct vpu_core_device *dev);
+void wave6_vpu_enc_unregister_device(struct vpu_core_device *dev);
+void wave6_vpu_finish_job(struct vpu_instance *inst);
+void wave6_vpu_handle_performance(struct vpu_instance *inst, struct vpu_buffer *vpu_buf);
+void wave6_vpu_reset_performance(struct vpu_instance *inst);
+int wave6_vpu_init_m2m_dev(struct vpu_core_device *dev);
+void wave6_vpu_release_m2m_dev(struct vpu_core_device *dev);
+int wave6_vpu_subscribe_event(struct v4l2_fh *fh,
+			      const struct v4l2_event_subscription *sub);
+void wave6_vpu_return_buffers(struct vpu_instance *inst,
+			      unsigned int type, enum vb2_buffer_state state);
+
+#endif /* __WAVE6_VPU_CORE_H__ */
-- 
2.31.1


