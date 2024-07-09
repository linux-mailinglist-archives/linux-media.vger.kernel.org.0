Return-Path: <linux-media+bounces-14733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B4092B254
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 10:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6051283ADB
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 08:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B929155725;
	Tue,  9 Jul 2024 08:40:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2104.outbound.protection.partner.outlook.cn [139.219.146.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD16E155315;
	Tue,  9 Jul 2024 08:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720514407; cv=fail; b=AhSTs/x6t/CnOV10D0k1uAdShD7qF63w8jsZNhO5d+uZ8hMezO2ZnmdIs+RE+U5oDgFy3kpVb9VIJocci1kYwWmuHFtWT3kh7AQjfVkVxcqTh1TC0a+QsQDG2vOfyPpSfu0JKnrhR3bkmK+3/LKVAvdgXruGXAt9JUiTeOii9xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720514407; c=relaxed/simple;
	bh=H6CNeJO1utspNcCPfP3iLjZyTMqraVNeYElpi3SWT4s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=egqR/b29eQOvrxV9n1cvw1k/0AFjLRnHd+bLxQ+UD9WiEmh+fe4QlStZWPcUjrZH4vYN22x9Eke+AuBrN5wLtL1jvzpev+aKPg/aNiXyozJzJ15TGPmHd8JHn7lEbRfe1+dmk9RG9/5k65PsyLBu+4GbSj51hGcgyCnQA7h3uEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zu+sfLtuRMTSO9BnbPCN+srpS7lToZHmvZKQp1f3Q1AUYeDYGx77iWjkx4hIvnakarf38Wn6iyLoAJpJZ08EYjyNYHGk5YiYZi3e22TY+Bu4NlGPb3hwxkZleyY3gYNSGJEruxUEeRh7gGh9Tw67mIqLZXL/xFN1Kt8kC5tlAcdsmWs5NG293AxcKqLqJvKUmnLdk66XqsPhCFkwgTsKzXSK019vAhzZMBgjX1sflcRiXT/yr0gTdnn5odhW6SYU84qyOCpqup7A+0WZ5eHM7Fdns7ZtxnrKN2aoatxy05ph+k1weECISJq4rRElxsXbXlPmLDR+V/DPsHjVVUFLzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ca7iM1/02fuJY6GUPY1zS3PTuG6NKQuMjf210FAdnxY=;
 b=KmncWThHEPqQdshF0qSTYRTDDSL/nrJKNpnZ2PW2NHEyHPLo30O1vlSWRZC9GENiQwQHPkF62CYraIGg8cjYb8gAYq0DrSBRwMrpMHtV6wLveRHldE0q2mSo+ElITJ+jn3ID1/PZi7U0j4GJOdZhFrm4pWogCIqxAy0QHjLe019kPlA1EUBHxZdl0JraVAZbiHNnrtUeiDiwDXSW1HH7LBzKoKaaFs5ZrgwcizCGCCIA99kHACCbT8LNzjFZJQRdErwjWLI1Ox+sHONRIN5D+akTE1YwNX/mKAloS6aVm6iJrFJTaA1UmTAoIES24JVb2dZQBJJ42KHMOYH7ljSnYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1271.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:18::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.37; Tue, 9 Jul
 2024 08:38:41 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7741.033; Tue, 9 Jul 2024 08:38:41 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mingjia Zhang <mingjia.zhang@mediatek.com>
Cc: Jack Zhu <jack.zhu@starfivetech.com>,
	Keith Zhao <keith.zhao@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 08/14] staging: media: starfive: Add for StarFive ISP 3A SC
Date: Tue,  9 Jul 2024 01:38:18 -0700
Message-Id: <20240709083824.430473-9-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0031.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::16) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1271:EE_
X-MS-Office365-Filtering-Correlation-Id: 3405a2ea-91f8-4ab5-98a5-08dc9ff2894a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|41320700013|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	WFUA7Vkbn9EHL5F397Gm49QLK2jNGyRk6D6njB2yguc9vL4buFNN4rjZfuguNXMIUITIc6w7D8TbQVaPkrYlpjuqvoM5fr7OvLKw1fpM6yfFPpRgc+vkIw12P+k7kcyQgiqXYPemyT8sIHNZoYFO/P1bGfEFGLXUKA8xtjydFxsplyobc2RKFwihUrVMugCXzM7+spymy0FLfw9l++nj1/6sAUHH3wWKR1hvCKcrZHekbJYfLKvZAz0R1xmXWBt8EwrVv4lrj6OYXe3llWzF2l9eWr3FBxfzsEFEEAPLjTOyZUltNVtaKLqVev2qfmMS07V+RzIRgKuQU4QxVtbagkp4z/8NfY7YXh6k1bzV20xzVUewq+ZL5bS7IYgga8sRoxpYmHMn8ujim0ZCjmrik4TFLv6xxNHcRFwmBMZnL8UHaHoPSUY8nIjyThhkdG4azbGoADWYNHsILoaHyWAxv+RGbj7G1QK4Cdbarrwe1aGH5kir0Zt5fP64Og6SfBsf5vgkdr1WAop3ioZjo7nFZx+oq6dDkiEw8PTjdbLnnQ1IPn1Ocdz0IzBNNRh/U+kQHht6AeAYXFfnMNtGuDonLExSBl4+IMASKJR9XlWLj3HN7UOEzRFz0prbK393y3p/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B/qYHpVo8ozkJEoTVxVPZJEEPMozXxuva3utfGHReEtLEZ2ZoLnIkbfgKUSl?=
 =?us-ascii?Q?QjVDMu2CZRuoXeIO4Q7mGtkHGn1n92nDaUnshuK0QDtxnjJgl97sLd0m41d9?=
 =?us-ascii?Q?UdMn8Vl56yg0/+2obXZmnbhrDXrHLlWwwaBkhxTuqn+qkz/uSVqLGxzoLG5g?=
 =?us-ascii?Q?JL9G97Ada96ad0HOSn3L8JW53WyrcNuKSnK1IGuL1dwkZkCnAFYabeA/eP7z?=
 =?us-ascii?Q?Sw1krWO41MK9b0rvBIw+Y+lXDuzDkEu5BQe0JrslDg4xXTj5TqUdofy6QWFU?=
 =?us-ascii?Q?DIfToRcjD6wFbrEF81VyK8lXev0cvcVm4nyYPRu9+mMPRBWoz+NDn2OK220f?=
 =?us-ascii?Q?c1GHrdJ4cMAjp38/snlI3xhHD3YhPaWPODjdH0pCwsV6oRKyFIu+3uhUAlkc?=
 =?us-ascii?Q?6bxrbUezEuHs6IL4iHHQWalAmI+f7BfV7XTGA7baTJuq2aPq5nstZVrDtY/p?=
 =?us-ascii?Q?xUUfgzLqWcBUp3szvxRHMGXj5XTL5LsNMzxdERYREwotoO3RdybfcvyR6nv/?=
 =?us-ascii?Q?88A+WNKmhntODg2EBOgSWumAnZtBwvsI1qltTKa93Wk89Wf8bLtkuL+EB7XI?=
 =?us-ascii?Q?Opl94bg/veLJMFQGYrwWCLKqiqINu9YWWIyHtva9JCwhfamFEMdmuYWS15OF?=
 =?us-ascii?Q?nOuzi1g5oqKluAZ0XHxRPrp0HiJR9p/6QWQBiA5WAPPN58TP7G9zH5hhrqc3?=
 =?us-ascii?Q?hWFfAdb6/u6Yx4aaTucSEgS9qqtZPzCuRfkk54xqm4Srd+IEube+WeVb9SiJ?=
 =?us-ascii?Q?cJ9lvR/6wpv4ngfHiE8JwPH5a02d6MwC4e5nngqXQjKv8fJwYpjoq57jwKPt?=
 =?us-ascii?Q?q38xmYUWrOxv8VDEHG7G1hMlu+cNHFI4ZwPXKCUbNZDmRRLWbrVSLXYtNMi+?=
 =?us-ascii?Q?nYaG/Ynlf1kXLQRPX2lypBI7AQ8r2u/VVls26kq5/3xR5CDfSmebISAjUi+W?=
 =?us-ascii?Q?ucopjMSetZIzC9tSqR+GeKhM5r+6CC+J3FmpTW3tfy6uG9FPzm7STvXT6trJ?=
 =?us-ascii?Q?ytUJpu17bfpj4G7TREZ8D9lFv7mTMUhCD8kX/TrXhASfMiM8bReu1miVeQhN?=
 =?us-ascii?Q?xglAY8XIrEoT4JDQU2OBXYJyHoBAr3RYashKima++TLvJWOx9TtVicWijcbi?=
 =?us-ascii?Q?TcDUFKmZNJDuIRhtSaJGtjJ79w9Ya74shfV46VCbz+5o46fE9ALziX6GXPsL?=
 =?us-ascii?Q?fQP/4W++3AIev6pL3DBEyZdbwSEf857sVvta5Hf/nS6j2IgVVTjPNOnB+b3k?=
 =?us-ascii?Q?iiCyB659MZVwnVe84r0E7lPalV1FBwwamnuoHRVoi3Sg+f2jEn4NWRZqKS/w?=
 =?us-ascii?Q?eyIYdasI2AOHIiREOWlcdEbI5LYbjAx1FyggtMwuWRr3SO1nJHIJR/wYxT7x?=
 =?us-ascii?Q?WYLQIEcMNbnYqecV+YevNlaZBOJUYVoGY02Pyahz/+azCgEDIOQPgS3iMl/G?=
 =?us-ascii?Q?vRAy0FMFOATFmkPIbFmPnh8i54647+by0PhMO1esRPNyeMyIkWF3ak1UPiTc?=
 =?us-ascii?Q?4rE0/kQmiHa1rZ5t0fnXrcRLP6t+M9GA4xssmgq3efAH8tmq45IzLpFHBCba?=
 =?us-ascii?Q?XiUl6eUBEoJabutCcUzJGmyhDvbKmkGfQZNNzfMpKQFY+72BJ9eFUsjI2/1S?=
 =?us-ascii?Q?IGp+LS9Uir+mO0+9sZ6NMoM=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3405a2ea-91f8-4ab5-98a5-08dc9ff2894a
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 08:38:41.5474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GyJVTCTmivoIIei87PRS/aN/4sw7CcdyG6NuyE0E+QV0ntfqs5ok3RDoflmE1doJnJNyXSELL23khAdUKpPpSEaQkSfBhNUXGeeEFKHTyHDaJmRXTUTStutcqatu6mSQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1271

Register ISP 3A "capture_scd" video device to receive statistics
collection data.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../staging/media/starfive/camss/stf-buffer.h |   1 +
 .../staging/media/starfive/camss/stf-camss.c  |  15 ++
 .../media/starfive/camss/stf-capture.c        |  21 ++-
 .../media/starfive/camss/stf-isp-hw-ops.c     |  66 ++++++++
 .../staging/media/starfive/camss/stf-isp.h    |  23 +++
 .../staging/media/starfive/camss/stf-video.c  | 146 +++++++++++++++++-
 .../staging/media/starfive/camss/stf-video.h  |   1 +
 7 files changed, 264 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/starfive/camss/stf-buffer.h b/drivers/staging/media/starfive/camss/stf-buffer.h
index 9d1670fb05ed..727d00617448 100644
--- a/drivers/staging/media/starfive/camss/stf-buffer.h
+++ b/drivers/staging/media/starfive/camss/stf-buffer.h
@@ -23,6 +23,7 @@ enum stf_v_state {
 struct stfcamss_buffer {
 	struct vb2_v4l2_buffer vb;
 	dma_addr_t addr[2];
+	void *vaddr;
 	struct list_head queue;
 };
 
diff --git a/drivers/staging/media/starfive/camss/stf-camss.c b/drivers/staging/media/starfive/camss/stf-camss.c
index fecd3e67c7a1..fafa3ce2f6da 100644
--- a/drivers/staging/media/starfive/camss/stf-camss.c
+++ b/drivers/staging/media/starfive/camss/stf-camss.c
@@ -8,6 +8,7 @@
  *
  * Author: Jack Zhu <jack.zhu@starfivetech.com>
  * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
+ * Author: Keith Zhao <keith.zhao@starfivetech.com>
  *
  */
 #include <linux/module.h>
@@ -126,6 +127,7 @@ static int stfcamss_of_parse_ports(struct stfcamss *stfcamss)
 static int stfcamss_register_devs(struct stfcamss *stfcamss)
 {
 	struct stf_capture *cap_yuv = &stfcamss->captures[STF_CAPTURE_YUV];
+	struct stf_capture *cap_scd = &stfcamss->captures[STF_CAPTURE_SCD];
 	struct stf_isp_dev *isp_dev = &stfcamss->isp_dev;
 	int ret;
 
@@ -150,8 +152,18 @@ static int stfcamss_register_devs(struct stfcamss *stfcamss)
 
 	cap_yuv->video.source_subdev = &isp_dev->subdev;
 
+	ret = media_create_pad_link(&isp_dev->subdev.entity, STF_ISP_PAD_SRC_SCD,
+				    &cap_scd->video.vdev.entity, 0, 0);
+	if (ret)
+		goto err_rm_links0;
+
+	cap_scd->video.source_subdev = &isp_dev->subdev;
+
 	return ret;
 
+err_rm_links0:
+	media_entity_remove_links(&isp_dev->subdev.entity);
+	media_entity_remove_links(&cap_yuv->video.vdev.entity);
 err_cap_unregister:
 	stf_capture_unregister(stfcamss);
 err_isp_unregister:
@@ -163,10 +175,12 @@ static int stfcamss_register_devs(struct stfcamss *stfcamss)
 static void stfcamss_unregister_devs(struct stfcamss *stfcamss)
 {
 	struct stf_capture *cap_yuv = &stfcamss->captures[STF_CAPTURE_YUV];
+	struct stf_capture *cap_scd = &stfcamss->captures[STF_CAPTURE_SCD];
 	struct stf_isp_dev *isp_dev = &stfcamss->isp_dev;
 
 	media_entity_remove_links(&isp_dev->subdev.entity);
 	media_entity_remove_links(&cap_yuv->video.vdev.entity);
+	media_entity_remove_links(&cap_scd->video.vdev.entity);
 
 	stf_isp_unregister(&stfcamss->isp_dev);
 	stf_capture_unregister(stfcamss);
@@ -436,5 +450,6 @@ module_platform_driver(stfcamss_driver);
 
 MODULE_AUTHOR("Jack Zhu <jack.zhu@starfivetech.com>");
 MODULE_AUTHOR("Changhuang Liang <changhuang.liang@starfivetech.com>");
+MODULE_AUTHOR("Keith Zhao <keith.zhao@starfivetech.com>");
 MODULE_DESCRIPTION("StarFive Camera Subsystem driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/staging/media/starfive/camss/stf-capture.c b/drivers/staging/media/starfive/camss/stf-capture.c
index 75f6ef405e61..328b8c6e351d 100644
--- a/drivers/staging/media/starfive/camss/stf-capture.c
+++ b/drivers/staging/media/starfive/camss/stf-capture.c
@@ -12,6 +12,7 @@
 static const char * const stf_cap_names[] = {
 	"capture_raw",
 	"capture_yuv",
+	"capture_scd",
 };
 
 static const struct stfcamss_format_info stf_wr_fmts[] = {
@@ -55,6 +56,14 @@ static const struct stfcamss_format_info stf_isp_fmts[] = {
 	},
 };
 
+/* 3A Statistics Collection Data */
+static const struct stfcamss_format_info stf_isp_scd_fmts[] = {
+	{
+		.code = MEDIA_BUS_FMT_METADATA_FIXED,
+		.pixelformat = V4L2_META_FMT_STF_ISP_STAT_3A,
+	},
+};
+
 static inline struct stf_capture *to_stf_capture(struct stfcamss_video *video)
 {
 	return container_of(video, struct stf_capture, video);
@@ -84,6 +93,8 @@ static void stf_init_addrs(struct stfcamss_video *video)
 		stf_set_raw_addr(video->stfcamss, addr0);
 	else if (cap->type == STF_CAPTURE_YUV)
 		stf_set_yuv_addr(video->stfcamss, addr0, addr1);
+	else
+		stf_set_scd_addr(video->stfcamss, addr0, addr1, TYPE_AWB);
 }
 
 static void stf_cap_s_cfg(struct stfcamss_video *video)
@@ -227,18 +238,24 @@ static void stf_capture_init(struct stfcamss *stfcamss, struct stf_capture *cap)
 	INIT_LIST_HEAD(&cap->buffers.ready_bufs);
 	spin_lock_init(&cap->buffers.lock);
 
-	cap->video.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	cap->video.stfcamss = stfcamss;
 	cap->video.bpl_alignment = 16 * 8;
 
 	if (cap->type == STF_CAPTURE_RAW) {
+		cap->video.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 		cap->video.formats = stf_wr_fmts;
 		cap->video.nformats = ARRAY_SIZE(stf_wr_fmts);
 		cap->video.bpl_alignment = 8;
 	} else if (cap->type == STF_CAPTURE_YUV) {
+		cap->video.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 		cap->video.formats = stf_isp_fmts;
 		cap->video.nformats = ARRAY_SIZE(stf_isp_fmts);
 		cap->video.bpl_alignment = 1;
+	} else {
+		cap->video.type = V4L2_BUF_TYPE_META_CAPTURE;
+		cap->video.formats = stf_isp_scd_fmts;
+		cap->video.nformats = ARRAY_SIZE(stf_isp_scd_fmts);
+		cap->video.bpl_alignment = 16 * 8;
 	}
 }
 
@@ -362,9 +379,11 @@ void stf_capture_unregister(struct stfcamss *stfcamss)
 {
 	struct stf_capture *cap_raw = &stfcamss->captures[STF_CAPTURE_RAW];
 	struct stf_capture *cap_yuv = &stfcamss->captures[STF_CAPTURE_YUV];
+	struct stf_capture *cap_scd = &stfcamss->captures[STF_CAPTURE_SCD];
 
 	stf_capture_unregister_one(cap_raw);
 	stf_capture_unregister_one(cap_yuv);
+	stf_capture_unregister_one(cap_scd);
 }
 
 int stf_capture_register(struct stfcamss *stfcamss,
diff --git a/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c b/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c
index 6b3966ca18bf..3b18d09f2cc6 100644
--- a/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c
+++ b/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c
@@ -451,11 +451,57 @@ void stf_set_yuv_addr(struct stfcamss *stfcamss,
 	stf_isp_reg_write(stfcamss, ISP_REG_UV_PLANE_START_ADDR, uv_addr);
 }
 
+static enum stf_isp_type_scd stf_isp_get_scd_type(struct stfcamss *stfcamss)
+{
+	int val;
+
+	val = stf_isp_reg_read(stfcamss, ISP_REG_SC_CFG_1);
+	return (enum stf_isp_type_scd)(val & ISP_SC_SEL_MASK) >> 30;
+}
+
+void stf_set_scd_addr(struct stfcamss *stfcamss,
+		      dma_addr_t yhist_addr, dma_addr_t scd_addr,
+		      enum stf_isp_type_scd type_scd)
+{
+	stf_isp_reg_set_bit(stfcamss, ISP_REG_SC_CFG_1, ISP_SC_SEL_MASK,
+			    SEL_TYPE(type_scd));
+	stf_isp_reg_write(stfcamss, ISP_REG_SCD_CFG_0, scd_addr);
+	stf_isp_reg_write(stfcamss, ISP_REG_YHIST_CFG_4, yhist_addr);
+}
+
+static void stf_isp_fill_yhist(struct stfcamss *stfcamss, void *vaddr)
+{
+	struct jh7110_isp_sc_buffer *sc = (struct jh7110_isp_sc_buffer *)vaddr;
+	u32 reg_addr = ISP_REG_YHIST_ACC_0;
+	u32 i;
+
+	for (i = 0; i < 64; i++, reg_addr += 4)
+		sc->y_histogram[i] = stf_isp_reg_read(stfcamss, reg_addr);
+}
+
+static void stf_isp_fill_flag(struct stfcamss *stfcamss, void *vaddr,
+			      enum stf_isp_type_scd *type_scd)
+{
+	struct jh7110_isp_sc_buffer *sc = (struct jh7110_isp_sc_buffer *)vaddr;
+
+	*type_scd = stf_isp_get_scd_type(stfcamss);
+	if (*type_scd == TYPE_AWB) {
+		sc->flag = JH7110_ISP_SC_FLAG_AWB;
+		*type_scd = TYPE_OECF;
+	} else {
+		sc->flag = JH7110_ISP_SC_FLAG_AE_AF;
+		*type_scd = TYPE_AWB;
+	}
+}
+
 irqreturn_t stf_line_irq_handler(int irq, void *priv)
 {
 	struct stfcamss *stfcamss = priv;
 	struct stf_capture *cap = &stfcamss->captures[STF_CAPTURE_YUV];
+	struct stf_capture *cap_scd = &stfcamss->captures[STF_CAPTURE_SCD];
 	struct stfcamss_buffer *change_buf;
+	enum stf_isp_type_scd type_scd;
+	u32 value;
 	u32 status;
 
 	status = stf_isp_reg_read(stfcamss, ISP_REG_ISP_CTRL_0);
@@ -467,6 +513,17 @@ irqreturn_t stf_line_irq_handler(int irq, void *priv)
 					stf_set_yuv_addr(stfcamss, change_buf->addr[0],
 							 change_buf->addr[1]);
 			}
+
+			value = stf_isp_reg_read(stfcamss, ISP_REG_CSI_MODULE_CFG);
+			if (value & CSI_SC_EN) {
+				change_buf = stf_change_buffer(&cap_scd->buffers);
+				if (change_buf) {
+					stf_isp_fill_flag(stfcamss, change_buf->vaddr,
+							  &type_scd);
+					stf_set_scd_addr(stfcamss, change_buf->addr[0],
+							 change_buf->addr[1], type_scd);
+				}
+			}
 		}
 
 		stf_isp_reg_set_bit(stfcamss, ISP_REG_CSIINTS,
@@ -485,6 +542,7 @@ irqreturn_t stf_isp_irq_handler(int irq, void *priv)
 {
 	struct stfcamss *stfcamss = priv;
 	struct stf_capture *cap = &stfcamss->captures[STF_CAPTURE_YUV];
+	struct stf_capture *cap_scd = &stfcamss->captures[STF_CAPTURE_SCD];
 	struct stfcamss_buffer *ready_buf;
 	u32 status;
 
@@ -496,6 +554,14 @@ irqreturn_t stf_isp_irq_handler(int irq, void *priv)
 				vb2_buffer_done(&ready_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
 		}
 
+		if (status & ISPC_SC) {
+			ready_buf = stf_buf_done(&cap_scd->buffers);
+			if (ready_buf) {
+				stf_isp_fill_yhist(stfcamss, ready_buf->vaddr);
+				vb2_buffer_done(&ready_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+			}
+		}
+
 		stf_isp_reg_write(stfcamss, ISP_REG_ISP_CTRL_0,
 				  (status & ~ISPC_INT_ALL_MASK) |
 				  ISPC_ISP | ISPC_CSI | ISPC_SC);
diff --git a/drivers/staging/media/starfive/camss/stf-isp.h b/drivers/staging/media/starfive/camss/stf-isp.h
index fcda0502e3b0..0af7b367e57a 100644
--- a/drivers/staging/media/starfive/camss/stf-isp.h
+++ b/drivers/staging/media/starfive/camss/stf-isp.h
@@ -10,6 +10,7 @@
 #ifndef STF_ISP_H
 #define STF_ISP_H
 
+#include <linux/jh7110-isp.h>
 #include <media/v4l2-subdev.h>
 
 #include "stf-video.h"
@@ -107,6 +108,12 @@
 #define Y_COOR(y)				((y) << 16)
 #define X_COOR(x)				((x) << 0)
 
+#define ISP_REG_SCD_CFG_0			0x098
+
+#define ISP_REG_SC_CFG_1			0x0bc
+#define ISP_SC_SEL_MASK				GENMASK(31, 30)
+#define SEL_TYPE(n)				((n) << 30)
+
 #define ISP_REG_LCCF_CFG_2			0x0e0
 #define ISP_REG_LCCF_CFG_3			0x0e4
 #define ISP_REG_LCCF_CFG_4			0x0e8
@@ -305,6 +312,10 @@
 #define DNRM_F(n)				((n) << 16)
 #define CCM_M_DAT(n)				((n) << 0)
 
+#define ISP_REG_YHIST_CFG_4			0xcd8
+
+#define ISP_REG_YHIST_ACC_0			0xd00
+
 #define ISP_REG_GAMMA_VAL0			0xe00
 #define ISP_REG_GAMMA_VAL1			0xe04
 #define ISP_REG_GAMMA_VAL2			0xe08
@@ -389,6 +400,15 @@
 #define IMAGE_MAX_WIDTH				1920
 #define IMAGE_MAX_HEIGH				1080
 
+#define ISP_YHIST_BUFFER_SIZE			(64 * sizeof(__u32))
+
+enum stf_isp_type_scd {
+	TYPE_DEC = 0,
+	TYPE_OBC,
+	TYPE_OECF,
+	TYPE_AWB,
+};
+
 /* pad id for media framework */
 enum stf_isp_pad_id {
 	STF_ISP_PAD_SINK = 0,
@@ -429,5 +449,8 @@ int stf_isp_unregister(struct stf_isp_dev *isp_dev);
 
 void stf_set_yuv_addr(struct stfcamss *stfcamss,
 		      dma_addr_t y_addr, dma_addr_t uv_addr);
+void stf_set_scd_addr(struct stfcamss *stfcamss,
+		      dma_addr_t yhist_addr, dma_addr_t scd_addr,
+		      enum stf_isp_type_scd type_scd);
 
 #endif /* STF_ISP_H */
diff --git a/drivers/staging/media/starfive/camss/stf-video.c b/drivers/staging/media/starfive/camss/stf-video.c
index 989b5e82bae9..2203605ec9c7 100644
--- a/drivers/staging/media/starfive/camss/stf-video.c
+++ b/drivers/staging/media/starfive/camss/stf-video.c
@@ -125,6 +125,14 @@ static int stf_video_init_format(struct stfcamss_video *video)
 	return 0;
 }
 
+static int stf_video_scd_init_format(struct stfcamss_video *video)
+{
+	video->active_fmt.fmt.meta.dataformat = video->formats[0].pixelformat;
+	video->active_fmt.fmt.meta.buffersize = sizeof(struct jh7110_isp_sc_buffer);
+
+	return 0;
+}
+
 /* -----------------------------------------------------------------------------
  * Video queue operations
  */
@@ -330,6 +338,78 @@ static const struct vb2_ops stf_video_vb2_q_ops = {
 	.stop_streaming  = video_stop_streaming,
 };
 
+static int video_scd_queue_setup(struct vb2_queue *q,
+				 unsigned int *num_buffers,
+				 unsigned int *num_planes,
+				 unsigned int sizes[],
+				 struct device *alloc_devs[])
+{
+	if (*num_planes)
+		return sizes[0] < sizeof(struct jh7110_isp_sc_buffer) ? -EINVAL : 0;
+
+	*num_planes = 1;
+	sizes[0] = sizeof(struct jh7110_isp_sc_buffer);
+
+	return 0;
+}
+
+static int video_scd_buf_init(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct stfcamss_buffer *buffer = to_stfcamss_buffer(vbuf);
+	dma_addr_t *paddr;
+
+	paddr = vb2_plane_cookie(vb, 0);
+	buffer->addr[0] = *paddr;
+	buffer->addr[1] = buffer->addr[0] + ISP_YHIST_BUFFER_SIZE;
+	buffer->vaddr = vb2_plane_vaddr(vb, 0);
+
+	return 0;
+}
+
+static int video_scd_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	if (sizeof(struct jh7110_isp_sc_buffer) > vb2_plane_size(vb, 0))
+		return -EINVAL;
+
+	vb2_set_plane_payload(vb, 0, sizeof(struct jh7110_isp_sc_buffer));
+
+	vbuf->field = V4L2_FIELD_NONE;
+
+	return 0;
+}
+
+static int video_scd_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct stfcamss_video *video = vb2_get_drv_priv(q);
+
+	video->ops->start_streaming(video);
+
+	return 0;
+}
+
+static void video_scd_stop_streaming(struct vb2_queue *q)
+{
+	struct stfcamss_video *video = vb2_get_drv_priv(q);
+
+	video->ops->stop_streaming(video);
+
+	video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
+}
+
+static const struct vb2_ops stf_video_scd_vb2_q_ops = {
+	.queue_setup     = video_scd_queue_setup,
+	.wait_prepare    = vb2_ops_wait_prepare,
+	.wait_finish     = vb2_ops_wait_finish,
+	.buf_init        = video_scd_buf_init,
+	.buf_prepare     = video_scd_buf_prepare,
+	.buf_queue       = video_buf_queue,
+	.start_streaming = video_scd_start_streaming,
+	.stop_streaming  = video_scd_stop_streaming,
+};
+
 /* -----------------------------------------------------------------------------
  * V4L2 ioctls
  */
@@ -448,6 +528,37 @@ static const struct v4l2_ioctl_ops stf_vid_ioctl_ops = {
 	.vidioc_streamoff               = vb2_ioctl_streamoff,
 };
 
+static int video_scd_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct stfcamss_video *video = video_drvdata(file);
+	struct v4l2_meta_format *meta = &f->fmt.meta;
+
+	if (f->type != video->type)
+		return -EINVAL;
+
+	meta->dataformat = video->active_fmt.fmt.meta.dataformat;
+	meta->buffersize = video->active_fmt.fmt.meta.buffersize;
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops stf_vid_scd_ioctl_ops = {
+	.vidioc_querycap                = video_querycap,
+	.vidioc_enum_fmt_meta_cap       = video_enum_fmt,
+	.vidioc_g_fmt_meta_cap          = video_scd_g_fmt,
+	.vidioc_s_fmt_meta_cap          = video_scd_g_fmt,
+	.vidioc_try_fmt_meta_cap        = video_scd_g_fmt,
+	.vidioc_reqbufs                 = vb2_ioctl_reqbufs,
+	.vidioc_querybuf                = vb2_ioctl_querybuf,
+	.vidioc_qbuf                    = vb2_ioctl_qbuf,
+	.vidioc_expbuf                  = vb2_ioctl_expbuf,
+	.vidioc_dqbuf                   = vb2_ioctl_dqbuf,
+	.vidioc_create_bufs             = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf             = vb2_ioctl_prepare_buf,
+	.vidioc_streamon                = vb2_ioctl_streamon,
+	.vidioc_streamoff               = vb2_ioctl_streamoff,
+};
+
 /* -----------------------------------------------------------------------------
  * V4L2 file operations
  */
@@ -473,6 +584,9 @@ static int stf_link_validate(struct media_link *link)
 	struct stfcamss_video *video = video_get_drvdata(vdev);
 	int ret;
 
+	if (video->type == V4L2_BUF_TYPE_META_CAPTURE)
+		return 0;
+
 	ret = stf_video_check_format(video);
 
 	return ret;
@@ -506,7 +620,11 @@ int stf_video_register(struct stfcamss_video *video,
 	q = &video->vb2_q;
 	q->drv_priv = video;
 	q->mem_ops = &vb2_dma_contig_memops;
-	q->ops = &stf_video_vb2_q_ops;
+
+	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		q->ops = &stf_video_vb2_q_ops;
+	else
+		q->ops = &stf_video_scd_vb2_q_ops;
 	q->type = video->type;
 	q->io_modes = VB2_DMABUF | VB2_MMAP;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
@@ -529,16 +647,28 @@ int stf_video_register(struct stfcamss_video *video,
 		goto err_mutex_destroy;
 	}
 
-	ret = stf_video_init_format(video);
-	if (ret < 0) {
-		dev_err(video->stfcamss->dev,
-			"Failed to init format: %d\n", ret);
-		goto err_media_cleanup;
+	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
+		ret = stf_video_init_format(video);
+		if (ret < 0) {
+			dev_err(video->stfcamss->dev,
+				"Failed to init format: %d\n", ret);
+			goto err_media_cleanup;
+		}
+		vdev->ioctl_ops = &stf_vid_ioctl_ops;
+		vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE;
+	} else {
+		ret = stf_video_scd_init_format(video);
+		if (ret < 0) {
+			dev_err(video->stfcamss->dev,
+				"Failed to init format: %d\n", ret);
+			goto err_media_cleanup;
+		}
+		vdev->ioctl_ops = &stf_vid_scd_ioctl_ops;
+		vdev->device_caps = V4L2_CAP_META_CAPTURE;
 	}
 
 	vdev->fops = &stf_vid_fops;
-	vdev->ioctl_ops = &stf_vid_ioctl_ops;
-	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	vdev->device_caps |= V4L2_CAP_STREAMING;
 	vdev->entity.ops = &stf_media_ops;
 	vdev->vfl_dir = VFL_DIR_RX;
 	vdev->release = stf_video_release;
diff --git a/drivers/staging/media/starfive/camss/stf-video.h b/drivers/staging/media/starfive/camss/stf-video.h
index 59799b65cbe5..53a1cf4e59b7 100644
--- a/drivers/staging/media/starfive/camss/stf-video.h
+++ b/drivers/staging/media/starfive/camss/stf-video.h
@@ -37,6 +37,7 @@ enum stf_v_line_id {
 enum stf_capture_type {
 	STF_CAPTURE_RAW = 0,
 	STF_CAPTURE_YUV,
+	STF_CAPTURE_SCD,
 	STF_CAPTURE_NUM,
 };
 
-- 
2.25.1


