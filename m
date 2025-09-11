Return-Path: <linux-media+bounces-42286-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A12CB52E08
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 12:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B58073B31D1
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B8D3115A1;
	Thu, 11 Sep 2025 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FabgaN7z"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB1630EF86;
	Thu, 11 Sep 2025 10:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757585395; cv=fail; b=BeESbkDhbTMc3MOi0HHaekq5IXHuTpK+ZdAwZMajn2TtN5pZ8se1i3Wr6c2+ZtXU4WguYFuaI2Hzy4RZaYtYWW+BN65ZVnS+sLAwuLmdtMBDfWt9yyPXEUSz9QvUqfmcXegyVmS1PTMRb93AHik0VPw79zdrO8lqu0/WVj0SaBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757585395; c=relaxed/simple;
	bh=t4Jn/1G4TsgNuOPOkS+EWqXYzxbfjFPQmJieaTdoXLE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JyFUewwPweoKiR3rlQKbw12EsZyLu7xhByzoLIinn9JHY1e1iBfCEeU3YCBw3+X5ew9BEBDb9lP7P8iTQlclCLinX1l65zlJRwb7dD0DTpvNrvHWZJFJy8KrbAla/UJhh0DsblgLobtkPWp5aB+pxf2VIDhd6EUXXWCWtmLIj40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FabgaN7z; arc=fail smtp.client-ip=40.107.93.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J2HB4/PXUEPjy9If6AevAyJKivkn8gr80nmYqMg2QCV3o0DLKT6uMInxn0jgAkAHY9ApGLjwzH+AbCo9/lAggrleZgXe1TsXcbqxJG5Q/eaz5zPwcaqaKrxII8Ahu2selOTzhyGW4yxs1uDke/EYOe4uxeMtk2prMgU14Gf4N9qfHhqZg39VvrU4Trd53g0b6q4QbNX0yri2ZywoI3DI17PoycHwU2hNQnnUYb57Q/9lQaGtxlM4pXWZaqofF0CV8Zplz5d6jyQviAxfmKubKyJp6T8FM1C0O+iU5S4OqhaLcNL6yVR2X5la9+L4m5K6tJsnPOTQd5RH+LCtdClRhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nrMl2UFD/ju1YQn4A+XBzJJmUgFywgLETGv8sKTaZcM=;
 b=weDwFHVzY24aaeA77B1Xw0NEOb4CBRipnzoR1REOqdTJ9zFFhLg3oPBYbY6TxSf1s9bV1ZGybW3mec7WOf7iFdZ1MqMV0J/LN4HZ6tQsERM687KoXhu9MIUza575vMq4RphQM190u3hKqNmlMfnkf68Z3DtZSbtVX3YTs9m8dlgK5WEtuifTLLvamqEKgAxoOg5FblF0aCh1vetI+3GWQW0njs7iY9vFKBO2K+RrUS4FrTkRSEnDgvnDTs8CEaSDHKeOmH/1QCB5XHCxn5zDdOuyUe/pwXpovTV89M/ow6BJQZgzm1g4Cvk/s3N785HwLuUAGXzCVYaa0WqsGPaMJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nrMl2UFD/ju1YQn4A+XBzJJmUgFywgLETGv8sKTaZcM=;
 b=FabgaN7zhBzfg2KR0j1jf11RUfKQ7Ai6Mvp+R7K6OB2QygY1V01iq2PqjA0VLH7aHe2tEw+twVLIRrZyAad1k6yxIX8QGHKyCqCDi4w8auiyQhg2P6tpL67fBzyRTaGG+CB9ZU/w9ZnHcw8tL+jhKEVz4o82ovKhUN9lNcGaSr8=
Received: from MN2PR04CA0011.namprd04.prod.outlook.com (2603:10b6:208:d4::24)
 by DS0PR12MB7728.namprd12.prod.outlook.com (2603:10b6:8:13a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 10:09:38 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:d4:cafe::9d) by MN2PR04CA0011.outlook.office365.com
 (2603:10b6:208:d4::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Thu,
 11 Sep 2025 10:09:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 10:09:38 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Sep
 2025 03:09:33 -0700
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
	<Bin.Du@amd.com>, Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, "Alexey
 Zagorodnikov" <xglooom@gmail.com>
Subject: [PATCH v4 5/7] media: platform: amd: isp4 video node and buffers handling added
Date: Thu, 11 Sep 2025 18:08:45 +0800
Message-ID: <20250911100847.277408-6-Bin.Du@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250911100847.277408-1-Bin.Du@amd.com>
References: <20250911100847.277408-1-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|DS0PR12MB7728:EE_
X-MS-Office365-Filtering-Correlation-Id: 150b6b6c-9ace-4ae0-63a4-08ddf11b511f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MlXpQtzzFZwF3KDjX6p3L94aICRR8j5CPV/pOQFCpiWWFQp0LEduUnM7tzN0?=
 =?us-ascii?Q?BRkIzfJAGSgd/H31rcj/w4wOaZP7TotC3p0ga59WNVDkR1wMkUczOSk6O+Rq?=
 =?us-ascii?Q?rRkGbkvUOxH10IqEZwYhQzjCDLUAjQCdlfEBM1o3CKAArD5NEkGaQ6YPB1Vg?=
 =?us-ascii?Q?03KRQPpKxs7lirjv22NHXPsv05B5l3sf+6ppupLlp9LaYNXpLOJqOjU+19uH?=
 =?us-ascii?Q?zUEH3BNAzjzgJTqm9WvfbHGDZro/mFog66RoMTt65VYpkEIoHwWVXZwg0q7i?=
 =?us-ascii?Q?dRL8Y+rZRk4JB3dEyshUMJSzFzGw6WBAdPU+vZKeT1mhnIZ+5ozIBebDZCmd?=
 =?us-ascii?Q?tFBCF/Fg9m8zpkzJeKBULk4hRdzaC/RrzAAbRpMkqC2CRcz0GrE13h+t1pMv?=
 =?us-ascii?Q?+XVoO/9WMC29d1sIivVn2UpAjlThUt0seRRBEFzIhQlV8bzmG87UqTybjr+v?=
 =?us-ascii?Q?jUSZbV5yE2lYegB/6Cg35UeMdt9iwkO3dO2Cp2djphoeMwD8koON5SBOcaOc?=
 =?us-ascii?Q?6A1+xZjmYaaFsqzIPa2FwWy/aCyaVoTQbpAHuldKG9yNMqeT/+6jJcVe2qZY?=
 =?us-ascii?Q?6QKp/7jGX2Du9H7jAfG+MEpStVJsFT9RltcxYDqen9r6tOpBysJhsLHwBqkw?=
 =?us-ascii?Q?htU7iWUpF1CNG5LRM0XJCKPi6H2ktdBWN5wTzMxZQ2DZWUZcEPWAspzsCxFe?=
 =?us-ascii?Q?CccN80VEoyQXgj54XK40hwmNaQojMzIvUIv2JaVm6Xmup5yFjzqZW/TlC3Yv?=
 =?us-ascii?Q?zMJk8glGxzZFI3WgZKwPLnt5/eyulMfLX/lFsJ1hQstZwubmokcbPEEExBpa?=
 =?us-ascii?Q?+NKXp50OvRET61/8dqr8s1ybhsqPPNIwXyP0YKxfm7XZ3c/8QIhvUY+M77Rq?=
 =?us-ascii?Q?Q6b5lTmf3qhiZLSJ2TdUeojWL5ewkLI4jx2VQz3XSuEaqPx40TtdjRGjkUiO?=
 =?us-ascii?Q?3duZbwxzWKxp/BSGl9ubNZ5bRGKPOYSuUeJ7dPe/HyPbLYDXXQZ8pq2y+TR3?=
 =?us-ascii?Q?SheLqM0ll8emsrZ9zvDMv2CDt6KIMEMwJYIyY1I+UXzmsRGikq/UhuOyNwza?=
 =?us-ascii?Q?5I20I2X+yC0cvsJnKLWI5gq6WVcX7/uVjoDPCHRmN/1Rcac48pjWq+yqFXVN?=
 =?us-ascii?Q?rS+8oB5mxXvmFQLlDqW/ly1A+3CEfWPwLuisZoR5BlDfmRA+DnhLx13gkMEq?=
 =?us-ascii?Q?Q136EsXBmUDMF4Iw/ohGwDTq732TOepChBEOU7ockG1pfNqHoszZ4mejYXo+?=
 =?us-ascii?Q?uEgmk60LCHEiDGSJfK8xIETGGg+2DRiwe7scUe+AkZEDnfb1qDHJFGVMIi6k?=
 =?us-ascii?Q?dAJPLoE/NRzYFkPokNteVvUc10O9Ys5FguzyDtS1pnvkmCLslGKiJ0ezkuWi?=
 =?us-ascii?Q?WfYh/7TEe8xFxTvlJ6sK5w0tkEvf3decZqIZrNGg1tdUFtVOAggZWQ64hX/6?=
 =?us-ascii?Q?b6yElWONwCC3o0m3rk5LDRKY299pmnDW//alolZMI3x06BAzgyA+Qwhzf7uS?=
 =?us-ascii?Q?NtZOwUOubWFT3C4QaIkn/ZUXp5WfxF1c0w3AMrWDXGkbR8FlC+S4Wu4A0A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 10:09:38.3467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 150b6b6c-9ace-4ae0-63a4-08ddf11b511f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7728

Isp video implements v4l2 video interface and supports NV12 and YUYV. It
manages buffers, pipeline power and state. Cherry-picked Sultan's DMA
buffer related fix from branch v6.16-drm-tip-isp4-for-amd on
https://github.com/kerneltoast/kernel_x86_laptop.git

Co-developed-by: Sultan Alsawaf <sultan@kerneltoast.com>
Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Bin Du <Bin.Du@amd.com>
Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
---
 MAINTAINERS                                   |    2 +
 drivers/media/platform/amd/isp4/Makefile      |    1 +
 drivers/media/platform/amd/isp4/isp4.c        |   10 +
 drivers/media/platform/amd/isp4/isp4_subdev.c |   95 +-
 drivers/media/platform/amd/isp4/isp4_subdev.h |    2 +
 drivers/media/platform/amd/isp4/isp4_video.c  | 1207 +++++++++++++++++
 drivers/media/platform/amd/isp4/isp4_video.h  |   87 ++
 7 files changed, 1400 insertions(+), 4 deletions(-)
 create mode 100644 drivers/media/platform/amd/isp4/isp4_video.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_video.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 48ffc8bbdcee..80c966fde0b4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1151,6 +1151,8 @@ F:	drivers/media/platform/amd/isp4/isp4_interface.c
 F:	drivers/media/platform/amd/isp4/isp4_interface.h
 F:	drivers/media/platform/amd/isp4/isp4_subdev.c
 F:	drivers/media/platform/amd/isp4/isp4_subdev.h
+F:	drivers/media/platform/amd/isp4/isp4_video.c
+F:	drivers/media/platform/amd/isp4/isp4_video.h
 
 AMD KFD
 M:	Felix Kuehling <Felix.Kuehling@amd.com>
diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
index 905788bc6a1e..33589091ca96 100644
--- a/drivers/media/platform/amd/isp4/Makefile
+++ b/drivers/media/platform/amd/isp4/Makefile
@@ -6,3 +6,4 @@ obj-$(CONFIG_AMD_ISP4) += amd_capture.o
 amd_capture-objs := isp4_subdev.o \
 			isp4_interface.o \
 			isp4.o	\
+			isp4_video.o
\ No newline at end of file
diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
index 8cec27228710..a46e110a396f 100644
--- a/drivers/media/platform/amd/isp4/isp4.c
+++ b/drivers/media/platform/amd/isp4/isp4.c
@@ -178,6 +178,16 @@ static int isp4_capture_probe(struct platform_device *pdev)
 		goto err_isp4_deinit;
 	}
 
+	ret = media_create_pad_link(&isp_dev->isp_sdev.sdev.entity,
+				    0, &isp_dev->isp_sdev.isp_vdev.vdev.entity,
+				    0,
+				    MEDIA_LNK_FL_ENABLED |
+				    MEDIA_LNK_FL_IMMUTABLE);
+	if (ret) {
+		dev_err(dev, "fail to create pad link %d\n", ret);
+		goto err_isp4_deinit;
+	}
+
 	platform_set_drvdata(pdev, isp_dev);
 
 	return 0;
diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
index a9cb14de04ca..7d3339c915eb 100644
--- a/drivers/media/platform/amd/isp4/isp4_subdev.c
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
@@ -466,20 +466,25 @@ isp4sd_get_meta_by_mc(struct isp4_subdev *isp_subdev,
 
 static struct isp4if_img_buf_node *
 isp4sd_preview_done(struct isp4_subdev *isp_subdev,
-		    struct isp4fw_meta_info *meta)
+		    struct isp4fw_meta_info *meta,
+		    struct isp4vid_framedone_param *pcb)
 {
 	struct isp4_interface *ispif = &isp_subdev->ispif;
 	struct isp4if_img_buf_node *prev = NULL;
 	struct device *dev = isp_subdev->dev;
 
+	pcb->preview.status = ISP4VID_BUF_DONE_STATUS_ABSENT;
 	if (meta->preview.enabled &&
 	    (meta->preview.status == BUFFER_STATUS_SKIPPED ||
 	     meta->preview.status == BUFFER_STATUS_DONE ||
 	     meta->preview.status == BUFFER_STATUS_DIRTY)) {
 		prev = isp4if_dequeue_buffer(ispif);
-		if (!prev)
+		if (!prev) {
 			dev_err(dev, "fail null prev buf\n");
-
+		} else {
+			pcb->preview.buf = prev->buf_info;
+			pcb->preview.status = ISP4VID_BUF_DONE_STATUS_SUCCESS;
+		}
 	} else if (meta->preview.enabled) {
 		dev_err(dev, "fail bad preview status %u\n",
 			meta->preview.status);
@@ -525,6 +530,7 @@ static void isp4sd_fw_resp_frame_done(struct isp4_subdev *isp_subdev,
 				      enum isp4if_stream_id stream_id,
 				      struct isp4fw_resp_param_package *para)
 {
+	struct isp4vid_framedone_param pcb = {};
 	struct isp4if_img_buf_node *prev = NULL;
 	struct device *dev = isp_subdev->dev;
 	struct isp4fw_meta_info *meta;
@@ -537,12 +543,17 @@ static void isp4sd_fw_resp_frame_done(struct isp4_subdev *isp_subdev,
 		return;
 	}
 
+	pcb.poc = meta->poc;
+	pcb.cam_id = 0;
+
 	dev_dbg(dev, "ts:%llu,streamId:%d,poc:%u,preview_en:%u,(%i)\n",
 		ktime_get_ns(), stream_id, meta->poc,
 		meta->preview.enabled,
 		meta->preview.status);
 
-	prev = isp4sd_preview_done(isp_subdev, meta);
+	prev = isp4sd_preview_done(isp_subdev, meta, &pcb);
+	if (pcb.preview.status != ISP4VID_BUF_DONE_STATUS_ABSENT)
+		isp4vid_notify(&isp_subdev->isp_vdev, &pcb);
 
 	isp4if_dealloc_buffer_node(prev);
 
@@ -917,6 +928,75 @@ static int isp4sd_start_stream(struct isp4_subdev *isp_subdev,
 	return ret;
 }
 
+static int isp4sd_ioc_send_img_buf(struct v4l2_subdev *sd,
+				   struct isp4if_img_buf_info *buf_info)
+{
+	struct isp4_subdev *isp_subdev = to_isp4_subdev(sd);
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct isp4if_img_buf_node *buf_node = NULL;
+	struct device *dev = isp_subdev->dev;
+	int ret = -EINVAL;
+
+	mutex_lock(&isp_subdev->ops_mutex);
+	/* TODO: remove isp_status */
+	if (ispif->status != ISP4IF_STATUS_FW_RUNNING) {
+		dev_err(dev, "fail send img buf for bad fsm %d\n",
+			ispif->status);
+		mutex_unlock(&isp_subdev->ops_mutex);
+		return -EINVAL;
+	}
+
+	buf_node = isp4if_alloc_buffer_node(buf_info);
+	if (!buf_node) {
+		dev_err(dev, "fail alloc sys img buf info node\n");
+		ret = -ENOMEM;
+		goto unlock_and_return;
+	}
+
+	ret = isp4if_queue_buffer(ispif, buf_node);
+	if (ret) {
+		dev_err(dev, "fail to queue image buf, %d\n", ret);
+		goto error_release_buf_node;
+	}
+
+	if (!isp_subdev->sensor_info.start_stream_cmd_sent) {
+		isp_subdev->sensor_info.buf_sent_cnt++;
+
+		if (isp_subdev->sensor_info.buf_sent_cnt >=
+		    ISP4SD_MIN_BUF_CNT_BEF_START_STREAM) {
+			ret = isp4if_send_command(ispif, CMD_ID_START_STREAM,
+						  NULL, 0);
+
+			if (ret) {
+				dev_err(dev, "fail to START_STREAM");
+				goto error_release_buf_node;
+			}
+			isp_subdev->sensor_info.start_stream_cmd_sent = true;
+			isp_subdev->sensor_info.output_info.start_status =
+				ISP4SD_START_STATUS_STARTED;
+			isp_subdev->sensor_info.status =
+				ISP4SD_START_STATUS_STARTED;
+		} else {
+			dev_dbg(dev,
+				"no send start,required %u,buf sent %u\n",
+				ISP4SD_MIN_BUF_CNT_BEF_START_STREAM,
+				isp_subdev->sensor_info.buf_sent_cnt);
+		}
+	}
+
+	mutex_unlock(&isp_subdev->ops_mutex);
+
+	return 0;
+
+error_release_buf_node:
+	isp4if_dealloc_buffer_node(buf_node);
+
+unlock_and_return:
+	mutex_unlock(&isp_subdev->ops_mutex);
+
+	return ret;
+}
+
 static int isp4sd_set_power(struct v4l2_subdev *sd, int on)
 {
 	struct isp4_subdev *ispsd = to_isp4_subdev(sd);
@@ -1015,6 +1095,10 @@ static const struct media_entity_operations isp4sd_sdev_ent_ops = {
 	.link_validate = isp4sd_sdev_link_validate,
 };
 
+static const struct isp4vid_ops isp4sd_isp4vid_ops = {
+	.send_buffer = isp4sd_ioc_send_img_buf,
+};
+
 int isp4sd_init(struct isp4_subdev *isp_subdev,
 		struct v4l2_device *v4l2_dev)
 {
@@ -1074,6 +1158,8 @@ int isp4sd_init(struct isp4_subdev *isp_subdev,
 	isp_subdev->host2fw_seq_num = 1;
 	ispif->status = ISP4IF_STATUS_PWR_OFF;
 
+	ret = isp4vid_dev_init(&isp_subdev->isp_vdev, &isp_subdev->sdev,
+			       &isp4sd_isp4vid_ops);
 	if (ret)
 		goto err_media_clean_up;
 	return ret;
@@ -1087,6 +1173,7 @@ void isp4sd_deinit(struct isp4_subdev *isp_subdev)
 {
 	struct isp4_interface *ispif = &isp_subdev->ispif;
 
+	isp4vid_dev_deinit(&isp_subdev->isp_vdev);
 	media_entity_cleanup(&isp_subdev->sdev.entity);
 	isp4if_deinit(ispif);
 	isp4sd_module_enable(isp_subdev, false);
diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.h b/drivers/media/platform/amd/isp4/isp4_subdev.h
index 524a8de5e18d..322bd990bbaa 100644
--- a/drivers/media/platform/amd/isp4/isp4_subdev.h
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.h
@@ -17,6 +17,7 @@
 #include "isp4_fw_cmd_resp.h"
 #include "isp4_hw_reg.h"
 #include "isp4_interface.h"
+#include "isp4_video.h"
 
 /*
  * one is for none sesnor specefic response which is not used now
@@ -97,6 +98,7 @@ struct isp4_subdev_thread_param {
 struct isp4_subdev {
 	struct v4l2_subdev sdev;
 	struct isp4_interface ispif;
+	struct isp4vid_dev isp_vdev;
 
 	struct media_pad sdev_pad;
 
diff --git a/drivers/media/platform/amd/isp4/isp4_video.c b/drivers/media/platform/amd/isp4/isp4_video.c
new file mode 100644
index 000000000000..38252854012e
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_video.c
@@ -0,0 +1,1207 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#include <drm/amd/isp.h>
+#include <linux/pm_runtime.h>
+#include <linux/vmalloc.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mc.h>
+
+#include "isp4_interface.h"
+#include "isp4_subdev.h"
+#include "isp4_video.h"
+
+#define ISP4VID_ISP_DRV_NAME "amd_isp_capture"
+#define ISP4VID_MAX_PREVIEW_FPS 30
+#define ISP4VID_DEFAULT_FMT isp4vid_formats[0]
+
+#define ISP4VID_PAD_VIDEO_OUTPUT 0
+
+/* timeperframe default */
+#define ISP4VID_ISP_TPF_DEFAULT isp4vid_tpfs[0]
+
+/* amdisp buffer for vb2 operations */
+struct isp4vid_vb2_buf {
+	struct device			*dev;
+	void				*vaddr;
+	unsigned long			size;
+	refcount_t			refcount;
+	struct dma_buf			*dbuf;
+	void				*bo;
+	u64				gpu_addr;
+	struct vb2_vmarea_handler	handler;
+};
+
+static int isp4vid_vb2_mmap(void *buf_priv, struct vm_area_struct *vma);
+
+static void isp4vid_vb2_put(void *buf_priv);
+
+static const char *isp4vid_video_dev_name = "Preview";
+
+/* Sizes must be in increasing order */
+static const struct v4l2_frmsize_discrete isp4vid_frmsize[] = {
+	{640, 360},
+	{640, 480},
+	{1280, 720},
+	{1280, 960},
+	{1920, 1080},
+	{1920, 1440},
+	{2560, 1440},
+	{2880, 1620},
+	{2880, 1624},
+	{2888, 1808},
+};
+
+static const u32 isp4vid_formats[] = {
+	V4L2_PIX_FMT_NV12,
+	V4L2_PIX_FMT_YUYV
+};
+
+/* timeperframe list */
+static const struct v4l2_fract isp4vid_tpfs[] = {
+	{.numerator = 1, .denominator = ISP4VID_MAX_PREVIEW_FPS}
+};
+
+static void isp4vid_handle_frame_done(struct isp4vid_dev *isp_vdev,
+				      const struct isp4if_img_buf_info *img_buf,
+				      bool done_suc)
+{
+	struct isp4vid_capture_buffer *isp4vid_buf;
+	enum vb2_buffer_state state;
+	void *vbuf;
+
+	mutex_lock(&isp_vdev->buf_list_lock);
+
+	/* Get the first entry of the list */
+	isp4vid_buf = list_first_entry_or_null(&isp_vdev->buf_list, typeof(*isp4vid_buf), list);
+	if (!isp4vid_buf) {
+		mutex_unlock(&isp_vdev->buf_list_lock);
+		return;
+	}
+
+	vbuf = vb2_plane_vaddr(&isp4vid_buf->vb2.vb2_buf, 0);
+
+	if (vbuf != img_buf->planes[0].sys_addr) {
+		dev_err(isp_vdev->dev, "Invalid vbuf");
+		mutex_unlock(&isp_vdev->buf_list_lock);
+		return;
+	}
+
+	/* Remove this entry from the list */
+	list_del(&isp4vid_buf->list);
+
+	mutex_unlock(&isp_vdev->buf_list_lock);
+
+	/* Fill the buffer */
+	isp4vid_buf->vb2.vb2_buf.timestamp = ktime_get_ns();
+	isp4vid_buf->vb2.sequence = isp_vdev->sequence++;
+	isp4vid_buf->vb2.field = V4L2_FIELD_ANY;
+
+	/* at most 2 planes */
+	vb2_set_plane_payload(&isp4vid_buf->vb2.vb2_buf,
+			      0, isp_vdev->format.sizeimage);
+
+	state = done_suc ? VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
+	vb2_buffer_done(&isp4vid_buf->vb2.vb2_buf, state);
+
+	dev_dbg(isp_vdev->dev, "call vb2_buffer_done(size=%u)\n",
+		isp_vdev->format.sizeimage);
+}
+
+s32 isp4vid_notify(void *cb_ctx, struct isp4vid_framedone_param *evt_param)
+{
+	struct isp4vid_dev *isp4vid_vdev = cb_ctx;
+
+	if (evt_param->preview.status != ISP4VID_BUF_DONE_STATUS_ABSENT) {
+		bool suc;
+
+		suc = (evt_param->preview.status ==
+		       ISP4VID_BUF_DONE_STATUS_SUCCESS);
+		isp4vid_handle_frame_done(isp4vid_vdev,
+					  &evt_param->preview.buf,
+					  suc);
+	}
+
+	return 0;
+}
+
+static unsigned int isp4vid_vb2_num_users(void *buf_priv)
+{
+	struct isp4vid_vb2_buf *buf = buf_priv;
+
+	return refcount_read(&buf->refcount);
+}
+
+static int isp4vid_vb2_mmap(void *buf_priv, struct vm_area_struct *vma)
+{
+	struct isp4vid_vb2_buf *buf = buf_priv;
+	int ret;
+
+	if (!buf) {
+		pr_err("fail no memory to map\n");
+		return -EINVAL;
+	}
+
+	ret = remap_vmalloc_range(vma, buf->vaddr, 0);
+	if (ret) {
+		dev_err(buf->dev, "fail remap vmalloc mem, %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * Make sure that vm_areas for 2 buffers won't be merged together
+	 */
+	vm_flags_set(vma, VM_DONTEXPAND);
+
+	/*
+	 * Use common vm_area operations to track buffer refcount.
+	 */
+	vma->vm_private_data	= &buf->handler;
+	vma->vm_ops		= &vb2_common_vm_ops;
+
+	vma->vm_ops->open(vma);
+
+	dev_dbg(buf->dev, "mmap isp user bo 0x%llx size %ld refcount %d\n",
+		buf->gpu_addr, buf->size, refcount_read(&buf->refcount));
+
+	return 0;
+}
+
+static void *isp4vid_vb2_vaddr(struct vb2_buffer *vb, void *buf_priv)
+{
+	struct isp4vid_vb2_buf *buf = buf_priv;
+
+	if (!buf->vaddr) {
+		dev_err(buf->dev,
+			"fail for buf vaddr is null\n");
+		return NULL;
+	}
+	return buf->vaddr;
+}
+
+static void isp4vid_vb2_detach_dmabuf(void *mem_priv)
+{
+	struct isp4vid_vb2_buf *buf = mem_priv;
+
+	dev_dbg(buf->dev, "detach dmabuf of isp user bo 0x%llx size %ld",
+		buf->gpu_addr, buf->size);
+
+	kfree(buf);
+}
+
+static void *isp4vid_vb2_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
+				       struct dma_buf *dbuf,
+				       unsigned long size)
+{
+	struct isp4vid_vb2_buf *buf;
+
+	if (dbuf->size < size) {
+		dev_err(dev, "Invalid dmabuf size %zu %lu", dbuf->size, size);
+		return ERR_PTR(-EFAULT);
+	}
+
+	buf = kzalloc(sizeof(*buf), GFP_KERNEL);
+	if (!buf)
+		return ERR_PTR(-ENOMEM);
+
+	struct isp4vid_vb2_buf *dbg_buf = dbuf->priv;
+
+	buf->dev = dev;
+	buf->dbuf = dbuf;
+	buf->size = size;
+
+	dev_dbg(dev, "attach dmabuf of isp user bo 0x%llx size %ld",
+		dbg_buf->gpu_addr, dbg_buf->size);
+
+	return buf;
+}
+
+static void isp4vid_vb2_unmap_dmabuf(void *mem_priv)
+{
+	struct isp4vid_vb2_buf *buf = mem_priv;
+	struct iosys_map map = IOSYS_MAP_INIT_VADDR(buf->vaddr);
+
+	dev_dbg(buf->dev, "unmap dmabuf of isp user bo 0x%llx size %ld",
+		buf->gpu_addr, buf->size);
+
+	dma_buf_vunmap_unlocked(buf->dbuf, &map);
+	buf->vaddr = NULL;
+}
+
+static int isp4vid_vb2_map_dmabuf(void *mem_priv)
+{
+	struct isp4vid_vb2_buf *mmap_buf = NULL;
+	struct isp4vid_vb2_buf *buf = mem_priv;
+	struct iosys_map map = {};
+	int ret;
+
+	ret = dma_buf_vmap_unlocked(buf->dbuf, &map);
+	if (ret) {
+		dev_err(buf->dev, "vmap_unlocked fail");
+		return -EFAULT;
+	}
+	buf->vaddr = map.vaddr;
+
+	mmap_buf = buf->dbuf->priv;
+	buf->gpu_addr = mmap_buf->gpu_addr;
+
+	dev_dbg(buf->dev, "map dmabuf of isp user bo 0x%llx size %ld",
+		buf->gpu_addr, buf->size);
+
+	return 0;
+}
+
+#ifdef CONFIG_HAS_DMA
+struct isp4vid_vb2_amdgpu_attachment {
+	struct sg_table sgt;
+	enum dma_data_direction dma_dir;
+};
+
+static int isp4vid_dmabuf_ops_attach(struct dma_buf *dbuf,
+				     struct dma_buf_attachment *dbuf_attach)
+{
+	struct isp4vid_vb2_buf *buf = dbuf->priv;
+	int num_pages = PAGE_ALIGN(buf->size) / PAGE_SIZE;
+	struct isp4vid_vb2_amdgpu_attachment *attach;
+	void *vaddr = buf->vaddr;
+	struct scatterlist *sg;
+	struct sg_table *sgt;
+	int ret;
+	int i;
+
+	attach = kzalloc(sizeof(*attach), GFP_KERNEL);
+	if (!attach)
+		return -ENOMEM;
+
+	sgt = &attach->sgt;
+	ret = sg_alloc_table(sgt, num_pages, GFP_KERNEL);
+	if (ret) {
+		kfree(attach);
+		return ret;
+	}
+	for_each_sgtable_sg(sgt, sg, i) {
+		struct page *page = vmalloc_to_page(vaddr);
+
+		if (!page) {
+			sg_free_table(sgt);
+			kfree(attach);
+			return -ENOMEM;
+		}
+		sg_set_page(sg, page, PAGE_SIZE, 0);
+		vaddr = ((char *)vaddr) + PAGE_SIZE;
+	}
+
+	attach->dma_dir = DMA_NONE;
+	dbuf_attach->priv = attach;
+
+	return 0;
+}
+
+static void isp4vid_dmabuf_ops_detach(struct dma_buf *dbuf,
+				      struct dma_buf_attachment *dbuf_attach)
+{
+	struct isp4vid_vb2_amdgpu_attachment *attach = dbuf_attach->priv;
+	struct sg_table *sgt;
+
+	if (!attach) {
+		pr_err("fail invalid attach handler\n");
+		return;
+	}
+
+	sgt = &attach->sgt;
+
+	/* release the scatterlist cache */
+	if (attach->dma_dir != DMA_NONE)
+		dma_unmap_sgtable(dbuf_attach->dev, sgt, attach->dma_dir, 0);
+	sg_free_table(sgt);
+	kfree(attach);
+	dbuf_attach->priv = NULL;
+}
+
+static struct sg_table *isp4vid_dmabuf_ops_map(struct dma_buf_attachment *dbuf_attach,
+					       enum dma_data_direction dma_dir)
+{
+	struct isp4vid_vb2_amdgpu_attachment *attach = dbuf_attach->priv;
+	struct sg_table *sgt;
+
+	sgt = &attach->sgt;
+	/* return previously mapped sg table */
+	if (attach->dma_dir == dma_dir)
+		return sgt;
+
+	/* release any previous cache */
+	if (attach->dma_dir != DMA_NONE) {
+		dma_unmap_sgtable(dbuf_attach->dev, sgt, attach->dma_dir, 0);
+		attach->dma_dir = DMA_NONE;
+	}
+
+	/* mapping to the client with new direction */
+	if (dma_map_sgtable(dbuf_attach->dev, sgt, dma_dir, 0)) {
+		dev_err(dbuf_attach->dev, "fail to map scatterlist");
+		return ERR_PTR(-EIO);
+	}
+
+	attach->dma_dir = dma_dir;
+
+	return sgt;
+}
+
+static void isp4vid_dmabuf_ops_unmap(struct dma_buf_attachment *dbuf_attach,
+				     struct sg_table *sgt,
+				     enum dma_data_direction dma_dir)
+{
+	/* nothing to be done here */
+}
+
+static int isp4vid_dmabuf_ops_vmap(struct dma_buf *dbuf,
+				   struct iosys_map *map)
+{
+	struct isp4vid_vb2_buf *buf = dbuf->priv;
+
+	iosys_map_set_vaddr(map, buf->vaddr);
+
+	return 0;
+}
+
+static void isp4vid_dmabuf_ops_release(struct dma_buf *dbuf)
+{
+	struct isp4vid_vb2_buf *buf = dbuf->priv;
+
+	/* drop reference obtained in isp4vid_vb2_get_dmabuf */
+	if (dbuf != buf->dbuf)
+		isp4vid_vb2_put(buf);
+	else
+		kfree(buf);
+}
+
+static int isp4vid_dmabuf_ops_mmap(struct dma_buf *dbuf, struct vm_area_struct *vma)
+{
+	return isp4vid_vb2_mmap(dbuf->priv, vma);
+}
+
+static const struct dma_buf_ops isp4vid_dmabuf_ops = {
+	.attach = isp4vid_dmabuf_ops_attach,
+	.detach = isp4vid_dmabuf_ops_detach,
+	.map_dma_buf = isp4vid_dmabuf_ops_map,
+	.unmap_dma_buf = isp4vid_dmabuf_ops_unmap,
+	.vmap = isp4vid_dmabuf_ops_vmap,
+	.mmap = isp4vid_dmabuf_ops_mmap,
+	.release = isp4vid_dmabuf_ops_release,
+};
+
+static struct dma_buf *isp4vid_get_dmabuf(struct isp4vid_vb2_buf *buf, unsigned long flags)
+{
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	struct dma_buf *dbuf;
+
+	if (WARN_ON(!buf->vaddr))
+		return NULL;
+
+	exp_info.ops = &isp4vid_dmabuf_ops;
+	exp_info.size = buf->size;
+	exp_info.flags = flags;
+	exp_info.priv = buf;
+
+	dbuf = dma_buf_export(&exp_info);
+	if (IS_ERR(dbuf))
+		return NULL;
+
+	return dbuf;
+}
+
+static struct dma_buf *isp4vid_vb2_get_dmabuf(struct vb2_buffer *vb, void *buf_priv,
+					      unsigned long flags)
+{
+	struct isp4vid_vb2_buf *buf = buf_priv;
+	struct dma_buf *dbuf;
+
+	dbuf = isp4vid_get_dmabuf(buf, flags);
+	if (!dbuf) {
+		dev_err(buf->dev, "fail to get isp dma buffer\n");
+		return NULL;
+	}
+
+	refcount_inc(&buf->refcount);
+
+	dev_dbg(buf->dev, "buf exported, refcount %d\n",
+		refcount_read(&buf->refcount));
+
+	return dbuf;
+}
+#endif /* CONFIG_HAS_DMA */
+
+static void isp4vid_vb2_put(void *buf_priv)
+{
+	struct isp4vid_vb2_buf *buf = buf_priv;
+
+	dev_dbg(buf->dev,
+		"release isp user bo 0x%llx size %ld refcount %d",
+		buf->gpu_addr, buf->size,
+		refcount_read(&buf->refcount));
+
+	if (refcount_dec_and_test(&buf->refcount)) {
+		isp_user_buffer_free(buf->bo);
+		vfree(buf->vaddr);
+		/*
+		 * Putting the implicit dmabuf frees `buf`. Freeing `buf` must
+		 * be done from the dmabuf release callback since dma_buf_put()
+		 * isn't always synchronous; it's just an fput(), which may be
+		 * deferred. Since the dmabuf release callback needs to access
+		 * `buf`, this means `buf` cannot be freed until then.
+		 */
+		dma_buf_put(buf->dbuf);
+	}
+}
+
+static void *isp4vid_vb2_alloc(struct vb2_buffer *vb, struct device *dev, unsigned long size)
+{
+	struct isp4vid_vb2_buf *buf;
+	u64 gpu_addr;
+	void *bo;
+	int ret;
+
+	buf = kzalloc(sizeof(*buf), GFP_KERNEL | vb->vb2_queue->gfp_flags);
+	if (!buf)
+		return ERR_PTR(-ENOMEM);
+
+	buf->dev = dev;
+	buf->size = size;
+	buf->vaddr = vmalloc_user(buf->size);
+	if (!buf->vaddr) {
+		dev_err(dev, "fail to vmalloc buffer\n");
+		goto free_buf;
+	}
+
+	buf->handler.refcount = &buf->refcount;
+	buf->handler.put = isp4vid_vb2_put;
+	buf->handler.arg = buf;
+
+	/* get implicit dmabuf */
+	buf->dbuf = isp4vid_get_dmabuf(buf, 0);
+	if (!buf->dbuf) {
+		dev_err(dev, "fail to get implicit dmabuf\n");
+		goto free_user_vmem;
+	}
+
+	/* create isp user BO and obtain gpu_addr */
+	ret = isp_user_buffer_alloc(dev, buf->dbuf, &bo, &gpu_addr);
+	if (ret) {
+		dev_err(dev, "fail to create isp user BO\n");
+		goto put_dmabuf;
+	}
+
+	buf->bo = bo;
+	buf->gpu_addr = gpu_addr;
+
+	refcount_set(&buf->refcount, 1);
+
+	dev_dbg(dev, "allocated isp user bo 0x%llx size %ld refcount %d\n",
+		buf->gpu_addr, buf->size, refcount_read(&buf->refcount));
+
+	return buf;
+
+put_dmabuf:
+	dma_buf_put(buf->dbuf);
+free_user_vmem:
+	vfree(buf->vaddr);
+free_buf:
+	ret = buf->vaddr ? -EINVAL : -ENOMEM;
+	kfree(buf);
+	return ERR_PTR(ret);
+}
+
+static const struct vb2_mem_ops isp4vid_vb2_memops = {
+	.alloc		= isp4vid_vb2_alloc,
+	.put		= isp4vid_vb2_put,
+#ifdef CONFIG_HAS_DMA
+	.get_dmabuf	= isp4vid_vb2_get_dmabuf,
+#endif
+	.map_dmabuf	= isp4vid_vb2_map_dmabuf,
+	.unmap_dmabuf	= isp4vid_vb2_unmap_dmabuf,
+	.attach_dmabuf	= isp4vid_vb2_attach_dmabuf,
+	.detach_dmabuf	= isp4vid_vb2_detach_dmabuf,
+	.vaddr		= isp4vid_vb2_vaddr,
+	.mmap		= isp4vid_vb2_mmap,
+	.num_users	= isp4vid_vb2_num_users,
+};
+
+static const struct v4l2_pix_format isp4vid_fmt_default = {
+	.width = 1920,
+	.height = 1080,
+	.pixelformat = V4L2_PIX_FMT_NV12,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_SRGB,
+};
+
+static void isp4vid_capture_return_all_buffers(struct isp4vid_dev *isp_vdev,
+					       enum vb2_buffer_state state)
+{
+	struct isp4vid_capture_buffer *vbuf, *node;
+
+	mutex_lock(&isp_vdev->buf_list_lock);
+
+	list_for_each_entry_safe(vbuf, node, &isp_vdev->buf_list, list) {
+		list_del(&vbuf->list);
+		vb2_buffer_done(&vbuf->vb2.vb2_buf, state);
+	}
+	mutex_unlock(&isp_vdev->buf_list_lock);
+
+	dev_dbg(isp_vdev->dev, "call vb2_buffer_done(%d)\n", state);
+}
+
+static int isp4vid_vdev_link_validate(struct media_link *link)
+{
+	return 0;
+}
+
+static const struct media_entity_operations isp4vid_vdev_ent_ops = {
+	.link_validate = isp4vid_vdev_link_validate,
+};
+
+static const struct v4l2_file_operations isp4vid_vdev_fops = {
+	.owner = THIS_MODULE,
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+	.read = vb2_fop_read,
+	.poll = vb2_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap = vb2_fop_mmap,
+};
+
+static int isp4vid_ioctl_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
+{
+	struct isp4vid_dev *isp_vdev = video_drvdata(file);
+
+	strscpy(cap->driver, ISP4VID_ISP_DRV_NAME, sizeof(cap->driver));
+	snprintf(cap->card, sizeof(cap->card), "%s", ISP4VID_ISP_DRV_NAME);
+	cap->capabilities |= V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_CAPTURE;
+
+	dev_dbg(isp_vdev->dev, "%s|capabilities=0x%X", isp_vdev->vdev.name, cap->capabilities);
+
+	return 0;
+}
+
+static int isp4vid_g_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct isp4vid_dev *isp_vdev = video_drvdata(file);
+
+	f->fmt.pix = isp_vdev->format;
+
+	return 0;
+}
+
+static int isp4vid_try_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct isp4vid_dev *isp_vdev = video_drvdata(file);
+	struct v4l2_pix_format *format = &f->fmt.pix;
+	unsigned int i;
+
+	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	/*
+	 * Check if the hardware supports the requested format, use the default
+	 * format otherwise.
+	 */
+	for (i = 0; i < ARRAY_SIZE(isp4vid_formats); i++)
+		if (isp4vid_formats[i] == format->pixelformat)
+			break;
+
+	if (i == ARRAY_SIZE(isp4vid_formats))
+		format->pixelformat = ISP4VID_DEFAULT_FMT;
+
+	switch (format->pixelformat) {
+	case V4L2_PIX_FMT_NV12: {
+		const struct v4l2_frmsize_discrete *fsz =
+			v4l2_find_nearest_size(isp4vid_frmsize,
+					       ARRAY_SIZE(isp4vid_frmsize),
+					       width, height,
+					       format->width, format->height);
+
+		format->width = fsz->width;
+		format->height = fsz->height;
+
+		format->bytesperline = format->width;
+		format->sizeimage = format->bytesperline *
+				    format->height * 3 / 2;
+	}
+	break;
+	case V4L2_PIX_FMT_YUYV: {
+		const struct v4l2_frmsize_discrete *fsz =
+			v4l2_find_nearest_size(isp4vid_frmsize,
+					       ARRAY_SIZE(isp4vid_frmsize),
+					       width, height,
+					       format->width, format->height);
+
+		format->width = fsz->width;
+		format->height = fsz->height;
+
+		format->bytesperline = format->width * 2;
+		format->sizeimage = format->bytesperline * format->height;
+	}
+	break;
+	default:
+		dev_err(isp_vdev->dev, "%s|unsupported fmt=%u",
+			isp_vdev->vdev.name, format->pixelformat);
+		return -EINVAL;
+	}
+
+	if (format->field == V4L2_FIELD_ANY)
+		format->field = isp4vid_fmt_default.field;
+
+	if (format->colorspace == V4L2_COLORSPACE_DEFAULT)
+		format->colorspace = isp4vid_fmt_default.colorspace;
+
+	return 0;
+}
+
+static int isp4vid_set_fmt_2_isp(struct v4l2_subdev *sdev, struct v4l2_pix_format *pix_fmt)
+{
+	struct v4l2_subdev_format fmt = {};
+
+	switch (pix_fmt->pixelformat) {
+	case V4L2_PIX_FMT_NV12:
+		fmt.format.code = MEDIA_BUS_FMT_YUYV8_1_5X8;
+		break;
+	case V4L2_PIX_FMT_YUYV:
+		fmt.format.code = MEDIA_BUS_FMT_YUYV8_1X16;
+		break;
+	default:
+		return -EINVAL;
+	};
+	fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	fmt.pad = ISP4VID_PAD_VIDEO_OUTPUT;
+	fmt.format.width = pix_fmt->width;
+	fmt.format.height = pix_fmt->height;
+	return v4l2_subdev_call(sdev, pad, set_fmt, NULL, &fmt);
+}
+
+static int isp4vid_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct isp4vid_dev *isp_vdev = video_drvdata(file);
+	int ret;
+
+	/* Do not change the format while stream is on */
+	if (vb2_is_busy(&isp_vdev->vbq))
+		return -EBUSY;
+
+	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	ret = isp4vid_try_fmt_vid_cap(file, priv, f);
+	if (ret)
+		return ret;
+
+	dev_dbg(isp_vdev->dev, "%s|width height:%ux%u->%ux%u",
+		isp_vdev->vdev.name,
+		isp_vdev->format.width, isp_vdev->format.height,
+		f->fmt.pix.width, f->fmt.pix.height);
+	dev_dbg(isp_vdev->dev, "%s|pixelformat:0x%x-0x%x",
+		isp_vdev->vdev.name, isp_vdev->format.pixelformat,
+		f->fmt.pix.pixelformat);
+	dev_dbg(isp_vdev->dev, "%s|bytesperline:%u->%u",
+		isp_vdev->vdev.name, isp_vdev->format.bytesperline,
+		f->fmt.pix.bytesperline);
+	dev_dbg(isp_vdev->dev, "%s|sizeimage:%u->%u",
+		isp_vdev->vdev.name, isp_vdev->format.sizeimage,
+		f->fmt.pix.sizeimage);
+
+	isp_vdev->format = f->fmt.pix;
+	ret = isp4vid_set_fmt_2_isp(isp_vdev->isp_sdev, &isp_vdev->format);
+
+	return ret;
+}
+
+static int isp4vid_enum_fmt_vid_cap(struct file *file, void *priv, struct v4l2_fmtdesc *f)
+{
+	struct isp4vid_dev *isp_vdev = video_drvdata(file);
+
+	switch (f->index) {
+	case 0:
+		f->pixelformat = V4L2_PIX_FMT_NV12;
+		break;
+	case 1:
+		f->pixelformat = V4L2_PIX_FMT_YUYV;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	dev_dbg(isp_vdev->dev, "%s|index=%d, pixelformat=0x%X",
+		isp_vdev->vdev.name, f->index, f->pixelformat);
+
+	return 0;
+}
+
+static int isp4vid_enum_framesizes(struct file *file, void *fh, struct v4l2_frmsizeenum *fsize)
+{
+	struct isp4vid_dev *isp_vdev = video_drvdata(file);
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(isp4vid_formats); i++) {
+		if (isp4vid_formats[i] == fsize->pixel_format)
+			break;
+	}
+	if (i == ARRAY_SIZE(isp4vid_formats))
+		return -EINVAL;
+
+	if (fsize->index < ARRAY_SIZE(isp4vid_frmsize)) {
+		fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
+		fsize->discrete = isp4vid_frmsize[fsize->index];
+		dev_dbg(isp_vdev->dev, "%s|size[%d]=%dx%d",
+			isp_vdev->vdev.name, fsize->index,
+			fsize->discrete.width, fsize->discrete.height);
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int isp4vid_ioctl_enum_frameintervals(struct file *file, void *priv,
+					     struct v4l2_frmivalenum *fival)
+{
+	struct isp4vid_dev *isp_vdev = video_drvdata(file);
+	int i;
+
+	if (fival->index >= ARRAY_SIZE(isp4vid_tpfs))
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(isp4vid_formats); i++)
+		if (isp4vid_formats[i] == fival->pixel_format)
+			break;
+	if (i == ARRAY_SIZE(isp4vid_formats))
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(isp4vid_frmsize); i++)
+		if (isp4vid_frmsize[i].width == fival->width &&
+		    isp4vid_frmsize[i].height == fival->height)
+			break;
+	if (i == ARRAY_SIZE(isp4vid_frmsize))
+		return -EINVAL;
+
+	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
+	fival->discrete = isp4vid_tpfs[fival->index];
+	v4l2_simplify_fraction(&fival->discrete.numerator,
+			       &fival->discrete.denominator, 8, 333);
+
+	dev_dbg(isp_vdev->dev, "%s|interval[%d]=%d/%d",
+		isp_vdev->vdev.name, fival->index,
+		fival->discrete.numerator,
+		fival->discrete.denominator);
+
+	return 0;
+}
+
+static int isp4vid_ioctl_g_param(struct file *file, void *priv, struct v4l2_streamparm *param)
+{
+	struct v4l2_captureparm *capture = &param->parm.capture;
+	struct isp4vid_dev *isp_vdev = video_drvdata(file);
+
+	if (param->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	capture->capability   = V4L2_CAP_TIMEPERFRAME;
+	capture->timeperframe = isp_vdev->timeperframe;
+	capture->readbuffers  = 0;
+
+	dev_dbg(isp_vdev->dev, "%s|timeperframe=%d/%d", isp_vdev->vdev.name,
+		capture->timeperframe.numerator,
+		capture->timeperframe.denominator);
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops isp4vid_vdev_ioctl_ops = {
+	/* VIDIOC_QUERYCAP handler */
+	.vidioc_querycap = isp4vid_ioctl_querycap,
+
+	/* VIDIOC_ENUM_FMT handlers */
+	.vidioc_enum_fmt_vid_cap = isp4vid_enum_fmt_vid_cap,
+
+	/* VIDIOC_G_FMT handlers */
+	.vidioc_g_fmt_vid_cap = isp4vid_g_fmt_vid_cap,
+
+	/* VIDIOC_S_FMT handlers */
+	.vidioc_s_fmt_vid_cap = isp4vid_s_fmt_vid_cap,
+
+	/* VIDIOC_TRY_FMT handlers */
+	.vidioc_try_fmt_vid_cap = isp4vid_try_fmt_vid_cap,
+
+	/* Buffer handlers */
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+
+	/* Stream on/off */
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+
+	/* Stream type-dependent parameter ioctls */
+	.vidioc_g_parm        = isp4vid_ioctl_g_param,
+	.vidioc_s_parm        = isp4vid_ioctl_g_param,
+
+	.vidioc_enum_framesizes = isp4vid_enum_framesizes,
+	.vidioc_enum_frameintervals = isp4vid_ioctl_enum_frameintervals,
+
+};
+
+static unsigned int isp4vid_get_image_size(struct v4l2_pix_format *fmt)
+{
+	switch (fmt->pixelformat) {
+	case V4L2_PIX_FMT_NV12:
+		return fmt->width * fmt->height * 3 / 2;
+	case V4L2_PIX_FMT_YUYV:
+		return fmt->width * fmt->height * 2;
+	default:
+		return 0;
+	}
+};
+
+static int isp4vid_qops_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
+				    unsigned int *nplanes, unsigned int sizes[],
+				    struct device *alloc_devs[])
+{
+	struct isp4vid_dev *isp_vdev = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
+
+	if (*nplanes > 1) {
+		dev_err(isp_vdev->dev,
+			"fail to setup queue, no mplane supported %u\n",
+			*nplanes);
+		return -EINVAL;
+	};
+
+	if (*nplanes == 1) {
+		unsigned int size;
+
+		size = isp4vid_get_image_size(&isp_vdev->format);
+		if (sizes[0] < size) {
+			dev_err(isp_vdev->dev,
+				"fail for small plane size %u, %u expected\n",
+				sizes[0], size);
+			return -EINVAL;
+		}
+	}
+
+	if (q_num_bufs + *nbuffers < ISP4IF_MAX_STREAM_BUF_COUNT)
+		*nbuffers = ISP4IF_MAX_STREAM_BUF_COUNT - q_num_bufs;
+
+	switch (isp_vdev->format.pixelformat) {
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_YUYV: {
+		*nplanes = 1;
+		sizes[0] = max(sizes[0], isp_vdev->format.sizeimage);
+		isp_vdev->format.sizeimage = sizes[0];
+	}
+	break;
+	default:
+		dev_err(isp_vdev->dev, "%s|unsupported fmt=%u\n",
+			isp_vdev->vdev.name, isp_vdev->format.pixelformat);
+		return -EINVAL;
+	}
+
+	dev_dbg(isp_vdev->dev, "%s|*nbuffers=%u *nplanes=%u sizes[0]=%u\n",
+		isp_vdev->vdev.name,
+		*nbuffers, *nplanes, sizes[0]);
+
+	return 0;
+}
+
+static void isp4vid_qops_buffer_queue(struct vb2_buffer *vb)
+{
+	struct isp4vid_capture_buffer *buf =
+		container_of(vb, struct isp4vid_capture_buffer, vb2.vb2_buf);
+	struct isp4vid_dev *isp_vdev = vb2_get_drv_priv(vb->vb2_queue);
+
+	struct isp4vid_vb2_buf *priv_buf = vb->planes[0].mem_priv;
+	struct isp4if_img_buf_info *img_buf = &buf->img_buf;
+
+	dev_dbg(isp_vdev->dev, "%s|index=%u", isp_vdev->vdev.name, vb->index);
+
+	dev_dbg(isp_vdev->dev, "queue isp user bo 0x%llx size=%lu",
+		priv_buf->gpu_addr,
+		priv_buf->size);
+
+	switch (isp_vdev->format.pixelformat) {
+	case V4L2_PIX_FMT_NV12: {
+		u32 y_size = isp_vdev->format.sizeimage / 3 * 2;
+		u32 uv_size = isp_vdev->format.sizeimage / 3;
+
+		img_buf->planes[0].len = y_size;
+		img_buf->planes[0].sys_addr = priv_buf->vaddr;
+		img_buf->planes[0].mc_addr = priv_buf->gpu_addr;
+
+		dev_dbg(isp_vdev->dev, "img_buf[0]: mc=0x%llx size=%u",
+			img_buf->planes[0].mc_addr,
+			img_buf->planes[0].len);
+
+		img_buf->planes[1].len = uv_size;
+		img_buf->planes[1].sys_addr = ((u8 *)priv_buf->vaddr + y_size);
+		img_buf->planes[1].mc_addr = priv_buf->gpu_addr + y_size;
+
+		dev_dbg(isp_vdev->dev, "img_buf[1]: mc=0x%llx size=%u",
+			img_buf->planes[1].mc_addr,
+			img_buf->planes[1].len);
+
+		img_buf->planes[2].len = 0;
+	}
+	break;
+	case V4L2_PIX_FMT_YUYV: {
+		img_buf->planes[0].len = isp_vdev->format.sizeimage;
+		img_buf->planes[0].sys_addr = priv_buf->vaddr;
+		img_buf->planes[0].mc_addr = priv_buf->gpu_addr;
+
+		dev_dbg(isp_vdev->dev, "img_buf[0]: mc=0x%llx size=%u",
+			img_buf->planes[0].mc_addr,
+			img_buf->planes[0].len);
+
+		img_buf->planes[1].len = 0;
+		img_buf->planes[2].len = 0;
+	}
+	break;
+	default:
+		dev_err(isp_vdev->dev, "%s|unsupported fmt=%u",
+			isp_vdev->vdev.name, isp_vdev->format.pixelformat);
+		return;
+	}
+
+	if (isp_vdev->stream_started)
+		isp_vdev->ops->send_buffer(isp_vdev->isp_sdev, img_buf);
+
+	mutex_lock(&isp_vdev->buf_list_lock);
+	list_add_tail(&buf->list, &isp_vdev->buf_list);
+	mutex_unlock(&isp_vdev->buf_list_lock);
+}
+
+static int isp4vid_qops_start_streaming(struct vb2_queue *vq, unsigned int count)
+{
+	struct isp4vid_dev *isp_vdev = vb2_get_drv_priv(vq);
+	struct isp4vid_capture_buffer *isp_buf;
+	struct media_entity *entity;
+	struct v4l2_subdev *subdev;
+	struct media_pad *pad;
+	int ret = 0;
+
+	isp_vdev->sequence = 0;
+	ret = v4l2_pipeline_pm_get(&isp_vdev->vdev.entity);
+	if (ret) {
+		dev_err(isp_vdev->dev, "power up isp fail %d\n", ret);
+		goto release_buffers;
+	}
+
+	entity = &isp_vdev->vdev.entity;
+	while (1) {
+		pad = &entity->pads[0];
+		if (!(pad->flags & MEDIA_PAD_FL_SINK))
+			break;
+
+		pad = media_pad_remote_pad_first(pad);
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			break;
+
+		entity = pad->entity;
+		subdev = media_entity_to_v4l2_subdev(entity);
+
+		ret = v4l2_subdev_call(subdev, video, s_stream, 1);
+		if (ret < 0 && ret != -ENOIOCTLCMD) {
+			dev_dbg(isp_vdev->dev, "fail start streaming: %s %d\n",
+				subdev->name, ret);
+			goto release_buffers;
+		}
+	}
+
+	list_for_each_entry(isp_buf, &isp_vdev->buf_list, list) {
+		isp_vdev->ops->send_buffer(isp_vdev->isp_sdev,
+					   &isp_buf->img_buf);
+	}
+
+	/* Start the media pipeline */
+	ret = video_device_pipeline_start(&isp_vdev->vdev, &isp_vdev->pipe);
+	if (ret) {
+		dev_err(isp_vdev->dev, "video_device_pipeline_start fail:%d",
+			ret);
+		goto release_buffers;
+	}
+	isp_vdev->stream_started = true;
+
+	return 0;
+
+release_buffers:
+	isp4vid_capture_return_all_buffers(isp_vdev, VB2_BUF_STATE_QUEUED);
+	return ret;
+}
+
+static void isp4vid_qops_stop_streaming(struct vb2_queue *vq)
+{
+	struct isp4vid_dev *isp_vdev = vb2_get_drv_priv(vq);
+	struct v4l2_subdev *subdev;
+	struct media_entity *entity;
+	struct media_pad *pad;
+	int ret;
+
+	entity = &isp_vdev->vdev.entity;
+	while (1) {
+		pad = &entity->pads[0];
+		if (!(pad->flags & MEDIA_PAD_FL_SINK))
+			break;
+
+		pad = media_pad_remote_pad_first(pad);
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			break;
+
+		entity = pad->entity;
+		subdev = media_entity_to_v4l2_subdev(entity);
+
+		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
+
+		if (ret < 0 && ret != -ENOIOCTLCMD)
+			dev_dbg(isp_vdev->dev, "fail stop streaming: %s %d\n",
+				subdev->name, ret);
+	}
+
+	isp_vdev->stream_started = false;
+	v4l2_pipeline_pm_put(&isp_vdev->vdev.entity);
+
+	/* Stop the media pipeline */
+	video_device_pipeline_stop(&isp_vdev->vdev);
+
+	/* Release all active buffers */
+	isp4vid_capture_return_all_buffers(isp_vdev, VB2_BUF_STATE_ERROR);
+}
+
+static int isp4vid_fill_buffer_size(struct isp4vid_dev *isp_vdev)
+{
+	int ret = 0;
+
+	switch (isp_vdev->format.pixelformat) {
+	case V4L2_PIX_FMT_NV12:
+		isp_vdev->format.bytesperline = isp_vdev->format.width;
+		isp_vdev->format.sizeimage = isp_vdev->format.bytesperline *
+					     isp_vdev->format.height * 3 / 2;
+		break;
+	case V4L2_PIX_FMT_YUYV:
+		isp_vdev->format.bytesperline = isp_vdev->format.width;
+		isp_vdev->format.sizeimage = isp_vdev->format.bytesperline *
+					     isp_vdev->format.height * 2;
+		break;
+	default:
+		dev_err(isp_vdev->dev, "fail for invalid default format 0x%x",
+			isp_vdev->format.pixelformat);
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static const struct vb2_ops isp4vid_qops = {
+	.queue_setup = isp4vid_qops_queue_setup,
+	.buf_queue = isp4vid_qops_buffer_queue,
+	.start_streaming = isp4vid_qops_start_streaming,
+	.stop_streaming = isp4vid_qops_stop_streaming,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+};
+
+int isp4vid_dev_init(struct isp4vid_dev *isp_vdev, struct v4l2_subdev *isp_sdev,
+		     const struct isp4vid_ops *ops)
+{
+	const char *vdev_name = isp4vid_video_dev_name;
+	struct v4l2_device *v4l2_dev;
+	struct video_device *vdev;
+	struct vb2_queue *q;
+	int ret;
+
+	if (!isp_vdev || !isp_sdev || !isp_sdev->v4l2_dev)
+		return -EINVAL;
+
+	v4l2_dev = isp_sdev->v4l2_dev;
+	vdev = &isp_vdev->vdev;
+
+	isp_vdev->isp_sdev = isp_sdev;
+	isp_vdev->dev = v4l2_dev->dev;
+	isp_vdev->ops = ops;
+
+	/* Initialize the vb2_queue struct */
+	mutex_init(&isp_vdev->vbq_lock);
+	q = &isp_vdev->vbq;
+	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	q->io_modes = VB2_MMAP | VB2_DMABUF;
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->buf_struct_size = sizeof(struct isp4vid_capture_buffer);
+	q->min_queued_buffers = 2;
+	q->ops = &isp4vid_qops;
+	q->drv_priv = isp_vdev;
+	q->mem_ops = &isp4vid_vb2_memops;
+	q->lock = &isp_vdev->vbq_lock;
+	q->dev = v4l2_dev->dev;
+	ret = vb2_queue_init(q);
+	if (ret) {
+		dev_err(v4l2_dev->dev, "vb2_queue_init error:%d", ret);
+		return ret;
+	}
+	/* Initialize buffer list and its lock */
+	mutex_init(&isp_vdev->buf_list_lock);
+	INIT_LIST_HEAD(&isp_vdev->buf_list);
+
+	/* Set default frame format */
+	isp_vdev->format = isp4vid_fmt_default;
+	isp_vdev->timeperframe = ISP4VID_ISP_TPF_DEFAULT;
+	v4l2_simplify_fraction(&isp_vdev->timeperframe.numerator,
+			       &isp_vdev->timeperframe.denominator, 8, 333);
+
+	ret = isp4vid_fill_buffer_size(isp_vdev);
+	if (ret) {
+		dev_err(v4l2_dev->dev, "fail to fill buffer size: %d\n", ret);
+		return ret;
+	}
+
+	ret = isp4vid_set_fmt_2_isp(isp_sdev, &isp_vdev->format);
+	if (ret) {
+		dev_err(v4l2_dev->dev, "fail init format :%d\n", ret);
+		return ret;
+	}
+
+	/* Initialize the video_device struct */
+	isp_vdev->vdev.entity.name = vdev_name;
+	isp_vdev->vdev.entity.function = MEDIA_ENT_F_IO_V4L;
+	isp_vdev->vdev_pad.flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&isp_vdev->vdev.entity, 1,
+				     &isp_vdev->vdev_pad);
+
+	if (ret) {
+		dev_err(v4l2_dev->dev, "init media entity pad fail:%d\n", ret);
+		return ret;
+	}
+
+	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE |
+			    V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
+	vdev->entity.ops = &isp4vid_vdev_ent_ops;
+	vdev->release = video_device_release_empty;
+	vdev->fops = &isp4vid_vdev_fops;
+	vdev->ioctl_ops = &isp4vid_vdev_ioctl_ops;
+	vdev->lock = NULL;
+	vdev->queue = q;
+	vdev->v4l2_dev = v4l2_dev;
+	vdev->vfl_dir = VFL_DIR_RX;
+	strscpy(vdev->name, vdev_name, sizeof(vdev->name));
+	video_set_drvdata(vdev, isp_vdev);
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret)
+		dev_err(v4l2_dev->dev, "register video device fail:%d\n", ret);
+
+	return ret;
+}
+
+void isp4vid_dev_deinit(struct isp4vid_dev *isp_vdev)
+{
+	video_unregister_device(&isp_vdev->vdev);
+}
diff --git a/drivers/media/platform/amd/isp4/isp4_video.h b/drivers/media/platform/amd/isp4/isp4_video.h
new file mode 100644
index 000000000000..fae7dbdedd18
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_video.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _ISP4_VIDEO_H_
+#define _ISP4_VIDEO_H_
+
+#include <linux/mutex.h>
+#include <media/videobuf2-memops.h>
+#include <media/v4l2-dev.h>
+#include "isp4_interface.h"
+
+enum isp4vid_buf_done_status {
+	/* It means no corresponding image buf in fw response */
+	ISP4VID_BUF_DONE_STATUS_ABSENT,
+	ISP4VID_BUF_DONE_STATUS_SUCCESS,
+	ISP4VID_BUF_DONE_STATUS_FAILED
+};
+
+struct isp4vid_buf_done_info {
+	enum isp4vid_buf_done_status status;
+	struct isp4if_img_buf_info buf;
+};
+
+/* call back parameter for CB_EVT_ID_FRAME_DONE */
+struct isp4vid_framedone_param {
+	s32 poc;
+	s32 cam_id;
+	s64 time_stamp;
+	struct isp4vid_buf_done_info preview;
+};
+
+struct isp4vid_capture_buffer {
+	/*
+	 * struct vb2_v4l2_buffer must be the first element
+	 * the videobuf2 framework will allocate this struct based on
+	 * buf_struct_size and use the first sizeof(struct vb2_buffer) bytes of
+	 * memory as a vb2_buffer
+	 */
+	struct vb2_v4l2_buffer vb2;
+	struct isp4if_img_buf_info img_buf;
+	struct list_head list;
+};
+
+struct isp4vid_dev;
+
+struct isp4vid_ops {
+	int (*send_buffer)(struct v4l2_subdev *sd,
+			   struct isp4if_img_buf_info *img_buf);
+};
+
+struct isp4vid_dev {
+	struct video_device vdev;
+	struct media_pad vdev_pad;
+	struct v4l2_pix_format format;
+
+	/* mutex that protects vbq */
+	struct mutex vbq_lock;
+	struct vb2_queue vbq;
+
+	/* mutex that protects buf_list */
+	struct mutex buf_list_lock;
+	struct list_head buf_list;
+
+	u32 sequence;
+	bool stream_started;
+	struct task_struct *kthread;
+
+	struct media_pipeline pipe;
+	struct device *dev;
+	struct v4l2_subdev *isp_sdev;
+	struct v4l2_fract timeperframe;
+
+	/* Callback operations */
+	const struct isp4vid_ops *ops;
+};
+
+int isp4vid_dev_init(struct isp4vid_dev *isp_vdev,
+		     struct v4l2_subdev *isp_sdev,
+		     const struct isp4vid_ops *ops);
+
+void isp4vid_dev_deinit(struct isp4vid_dev *isp_vdev);
+
+s32 isp4vid_notify(void *cb_ctx, struct isp4vid_framedone_param *evt_param);
+
+#endif
-- 
2.34.1


