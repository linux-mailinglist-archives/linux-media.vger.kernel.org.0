Return-Path: <linux-media+bounces-14734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBB092B255
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 10:41:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85A121F230BE
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 08:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F409B15574E;
	Tue,  9 Jul 2024 08:40:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2111.outbound.protection.partner.outlook.cn [139.219.146.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C477155345;
	Tue,  9 Jul 2024 08:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720514407; cv=fail; b=JAOIy5/SjTwa77Bb42KhdfSFVIZElvlFhsdfz9KF+SblIYHN9NGKoM4uNuJaiWKgzWtjGq12PyZljX0q179JiYxGa101q6HD8R9v/m6aemQqPZUOB5MYSKC/vaOJZ9vc2l1VkyeVCxmlC6/NvremDqYZdTG4sIwb/d7yZWeerfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720514407; c=relaxed/simple;
	bh=NTxVxwz2g4JQC9C6loXZIUi8h4JIBZUJTXKzu97cKb0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nKXkdIGKD79yxILouO/Nyj33YwIOqh7JfDrxEK2KDq8jZclzNF8i/a07gSz6lgpWHORmBoMTO+HN0QGvnI0RyW0xWV5kXUBlzjMkosLKmV8E8sSMvYiOIAGjK77vAHooP0XjZkbpKpds1z0YDJ6JAkNVQ4H9TIMEeGHEKlB/ytk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vv/1hH7KuwQ7OVgbuWjT86sKY0FVH6kr2/cG4VeqtjIDP5G/fsTOjRLrNs14vfnmmqiZtK3fQZ5I3caO1nQdhw0vaXRru3fAzvKyYL1n/lRt+zkxX2DQ6k6ehwNMoec+sqt5k1tS0wRjdvxAZ0U10Qic3Xjf9HMoUVl+sXiKcPUnWK0OurIX+EwjP2dkyKx24ZcJv0uFkM+PCUSvN5HMOkHUoyuBq3W2Q86jv1jgKjDf4NKb8UxyNWObyoLyO6W2OS4QJ+VQsP7D8qneMGysi2y7E/EaZyHadp9JxGv+b1DcavyjToiQpd7mj3y7gQDHFMEEp1EJrbbQ2hgUGPa+LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPMStqwazjedOtqNt0Nty1QEoyzkAh86Bo3z5i/GBwQ=;
 b=kEfVvFqezkYyVENtRqSNQovKM4YvnQmmvJK/5KZKCOdxPhQ96lISnFdCkoqfvr8M7Jj6/j/Qhd6uj5k1vywLLX0NSRJX8ztDmyLqTJus2lNe2Xg4kdGXJUeTl0RGZ2Q8OVSDP+PFHwvTVdLPQCMP0/Y0u6ICBwGv/0yTIyTYgUB+bnEFrt10NyWDKq0rsEt6VliYo4+DHoeznHGzMJbzyDbCSLL9tOyUAtshXcasx2s6rqtmtrCRx61+ZDXfY8Luvc0AstMyiWu0GIfw13vexnsDMzkFUJveov9V22Z0cTc0MkO08CtJA8RPh1SBe9hJd0C699Ajzxdpwwx43dJ8Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1271.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:18::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.37; Tue, 9 Jul
 2024 08:38:45 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7741.033; Tue, 9 Jul 2024 08:38:45 +0000
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
Subject: [PATCH v5 11/14] staging: media: starfive: Add ISP params video device
Date: Tue,  9 Jul 2024 01:38:21 -0700
Message-Id: <20240709083824.430473-12-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8b2b63ab-fed9-40f3-9a3d-08dc9ff28b57
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|41320700013|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	pVJPuOUPWlM63msAhsxeSUp6F7qfNmkUY+HUOh5vQzVE6KHvrNrwYwOMf29gTMK6e9lnpWMTyQiMXah3uq+pO3Y2ulxkmCs1ZIVztoRlBPutEoVIY8ZM3wLN3UI8/q3+i0Xv+wPmv1pWjvOCerNQ4QMXNDC1mzvfQr8v1/ZNRWee3BlVdlC9SSLzVYb20ezNheoUemQrme0IxvQnifKW14dC7I9UjTZRZGQ5uIkJ4bkgOFlOyT6OZh3KgoWQufsJ2alh0rG+69hkFqgpPqWx+JVM7KeB+WKAKpH3H3O0V7cA03TczmPcp3GcFyebIJzEtFtqc26zsdT62lU+gYhInh/9K5nkmYDRBVVolzY2uhWb8jj1cYXJOQLeqatz27jHX9BwH5wVFl3tXFK+WqGP/SYcQQlhATXhHCG7/K9mzKy+on3aLvU2ymkDPDsp/ZNVQ+4ueGFU0D1Ytshuw44YyI41tYI4NZ000Jg4XikWLlvtN4rYp7y6+IT94QFH8EM0fAB6nD7cGrCnCExYR1FDFi0htU3CTJp9v/iiONxKjfnabLDSN483Pm0P/JsFrQsMDhKbyRX5kQpDfYNUQfBiLyTUEJmIFLRlBmGwMA4sVAm2k/mgP2b76RW+d3GDGA1N
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yREPdw56cPSzqlzIdH7ZgVYcGj7i/3sfbb6VddVLnF6TTnccSozvdui8cxhr?=
 =?us-ascii?Q?5DoQjU3DwOsn7D0CPZOEfVgdAkPXwpDQrn3cDKkAsqQBj0ElXpDuQovIfSUM?=
 =?us-ascii?Q?VVpHyJXK+yV3gFDXTYUaxSuy/TPOGN2ZMGkg3vC7lMM05H/j4QxI2KcsFFgn?=
 =?us-ascii?Q?VOM/sIbXdAMEbDpGNkioQlKNrPMODVBwWe7A6pPo9b3MY+t60l/nKWaNKkoK?=
 =?us-ascii?Q?Y6HTkKvvTQuvK/wMQ8Fau4ua9U1u5vDpwaUaPb8fynT9FQ3CkouGv/bQ8f2z?=
 =?us-ascii?Q?kqpf2gWCvNu+IZDkXGRXKOk8fK6CWkyoX39kjngJ/DjIATgEJ0O+C6h45oWU?=
 =?us-ascii?Q?4W5YSi1642Mi7eyI+mdFKipRMmLCtmFexxhXUhftRX0rUsy2UY/zPunNrB8Q?=
 =?us-ascii?Q?EZEBkZMzi9IvXKO6QuPmBocYWEfwtTzneqVFO3zrBz6HSc+ToW2XmgbBWKaV?=
 =?us-ascii?Q?dFX4t8x1AxDTGs/qsonMDRpu7mQw+MTn9GT6sKBdaZT2VXJP41rYLh0BAPvu?=
 =?us-ascii?Q?y0wDTg1DN6nxaaFRogtbHkZAU1p6cbzkFdmqkVPL+ncGxkaW8TeUAHg9jI4M?=
 =?us-ascii?Q?2Q+Ce/VLujusxdXv6vu2C13myVJhP5z14ZHVQIfkEwXTVNSbJ35fpYMnbviz?=
 =?us-ascii?Q?1Nq9HOGLl3NdFWyxECl7D5d2BqVyDJxDgB+d2xjI9hAa9hhv4Szd5xmq+zki?=
 =?us-ascii?Q?/y6mIJJlZI/Nr3bzDBuT7g4EUgi08Fl9+D/4Xns4kHpYEwlsatguyFCc0KWT?=
 =?us-ascii?Q?A1du0thRYO1anpkWOTtjH3JTVWLeCbs3Hwmxm+GNPcgsT0ScQzAyM4K7/wCJ?=
 =?us-ascii?Q?wIReAKvlA3uiyhvwie6ONdDa++S7uO/sP5GGGY8SMt/o6ZLJozJ6kT+99yq+?=
 =?us-ascii?Q?5cK3qUJ+rmh2DipyQWlRsyV2FpB8IeQWG4VJsPKhv7onGCP6q6HEOTdCZQc+?=
 =?us-ascii?Q?fHsF4whJaSl6tXcJI5xrD/sNO6jK6Yf1Ls5BKe9e04r0BAYZh/O8OwB+7dgF?=
 =?us-ascii?Q?7K7585dCSGfUyDwr6wB+pp9spz4GOyll6sMeohdufbfXP1/pFbj90xhMPTNs?=
 =?us-ascii?Q?+KrnhzpFDzMIWDbv084JI4Kt2NU/vofNjfihjNd1cSQcWvz3Nm3esRhfwe/C?=
 =?us-ascii?Q?390QExDhkppDu+HHwFEFPF4BxI4G/jyJHvTMfnETglXl4py15ADcF5cCYRgI?=
 =?us-ascii?Q?TqC4yr1cvNY0ZQlUnO/F1AtGSJ+lN5PXEWEqRlpEfDMuda9HudIl7LXjW3hx?=
 =?us-ascii?Q?jmv9lQ11jR7YnCmcF80+fmq+33WGyn20FJgakCLtNi39YfWKivKrDcu1uZh5?=
 =?us-ascii?Q?0Ha0UVxgtllWGf+apGwnWpo91rCnrny8yoxChG5yRPIKWhZCK8uF1A/c/KPu?=
 =?us-ascii?Q?IMLrDRb3vH9uylHi1M+3gldB4CJc/5vaeqCLScNlNB0tZn3uyU+ofPfWgwas?=
 =?us-ascii?Q?RXl+r3H5pp3KoLmJ7gDXA19Uw2Xvg0cFPmBkR7iPMastQqLAs8o4Eh7VOyA0?=
 =?us-ascii?Q?qf42MtF/TDYwRG5xRGHvTHbrhARjQ8oXzHf+bAo7ohcFLOP5dLw4rkB/fCQi?=
 =?us-ascii?Q?oJ5jcAD3yqc9PaTKC6zGiDLr0y6nvrmXJ69gGERX3YST70xJqF/Ixy3+BMCK?=
 =?us-ascii?Q?x+jN447ytckedKBXaK+xyDY=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b2b63ab-fed9-40f3-9a3d-08dc9ff28b57
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 08:38:44.9805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DANyWu8TerDCeGjBIPBPsgZnDiyfw9MDR0qUF0IUZksr13O2T60PRNpfNYr1xKPcyHfmJzs+3OI2Wn6pKvDNAexbeIsC0SjkyLJLXmy/UpUiqAiCrroGVL3Bn3R5PeRx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1271

Add ISP params video device to write ISP parameters for 3A.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/staging/media/starfive/camss/Makefile |   2 +
 .../staging/media/starfive/camss/stf-camss.c  |  23 +-
 .../staging/media/starfive/camss/stf-camss.h  |   3 +
 .../media/starfive/camss/stf-isp-params.c     | 240 ++++++++++++++++++
 .../staging/media/starfive/camss/stf-isp.h    |   4 +
 .../staging/media/starfive/camss/stf-output.c |  83 ++++++
 .../staging/media/starfive/camss/stf-output.h |  22 ++
 7 files changed, 376 insertions(+), 1 deletion(-)
 create mode 100644 drivers/staging/media/starfive/camss/stf-isp-params.c
 create mode 100644 drivers/staging/media/starfive/camss/stf-output.c
 create mode 100644 drivers/staging/media/starfive/camss/stf-output.h

diff --git a/drivers/staging/media/starfive/camss/Makefile b/drivers/staging/media/starfive/camss/Makefile
index 411b45f3fb52..077165cbba7a 100644
--- a/drivers/staging/media/starfive/camss/Makefile
+++ b/drivers/staging/media/starfive/camss/Makefile
@@ -9,6 +9,8 @@ starfive-camss-objs += \
 		stf-capture.o \
 		stf-isp.o \
 		stf-isp-hw-ops.o \
+		stf-isp-params.o \
+		stf-output.o \
 		stf-video.o
 
 obj-$(CONFIG_VIDEO_STARFIVE_CAMSS) += starfive-camss.o
diff --git a/drivers/staging/media/starfive/camss/stf-camss.c b/drivers/staging/media/starfive/camss/stf-camss.c
index fafa3ce2f6da..4b2288c3199c 100644
--- a/drivers/staging/media/starfive/camss/stf-camss.c
+++ b/drivers/staging/media/starfive/camss/stf-camss.c
@@ -128,6 +128,7 @@ static int stfcamss_register_devs(struct stfcamss *stfcamss)
 {
 	struct stf_capture *cap_yuv = &stfcamss->captures[STF_CAPTURE_YUV];
 	struct stf_capture *cap_scd = &stfcamss->captures[STF_CAPTURE_SCD];
+	struct stf_output *output = &stfcamss->output;
 	struct stf_isp_dev *isp_dev = &stfcamss->isp_dev;
 	int ret;
 
@@ -138,13 +139,20 @@ static int stfcamss_register_devs(struct stfcamss *stfcamss)
 		return ret;
 	}
 
-	ret = stf_capture_register(stfcamss, &stfcamss->v4l2_dev);
+	ret = stf_output_register(stfcamss, &stfcamss->v4l2_dev);
 	if (ret < 0) {
 		dev_err(stfcamss->dev,
 			"failed to register capture: %d\n", ret);
 		goto err_isp_unregister;
 	}
 
+	ret = stf_capture_register(stfcamss, &stfcamss->v4l2_dev);
+	if (ret < 0) {
+		dev_err(stfcamss->dev,
+			"failed to register capture: %d\n", ret);
+		goto err_out_unregister;
+	}
+
 	ret = media_create_pad_link(&isp_dev->subdev.entity, STF_ISP_PAD_SRC,
 				    &cap_yuv->video.vdev.entity, 0, 0);
 	if (ret)
@@ -159,13 +167,23 @@ static int stfcamss_register_devs(struct stfcamss *stfcamss)
 
 	cap_scd->video.source_subdev = &isp_dev->subdev;
 
+	ret = media_create_pad_link(&output->video.vdev.entity, 0,
+				    &isp_dev->subdev.entity, STF_ISP_PAD_SINK_PARAMS,
+				    0);
+	if (ret)
+		goto err_rm_links1;
+
 	return ret;
 
+err_rm_links1:
+	media_entity_remove_links(&cap_scd->video.vdev.entity);
 err_rm_links0:
 	media_entity_remove_links(&isp_dev->subdev.entity);
 	media_entity_remove_links(&cap_yuv->video.vdev.entity);
 err_cap_unregister:
 	stf_capture_unregister(stfcamss);
+err_out_unregister:
+	stf_output_unregister(stfcamss);
 err_isp_unregister:
 	stf_isp_unregister(&stfcamss->isp_dev);
 
@@ -176,14 +194,17 @@ static void stfcamss_unregister_devs(struct stfcamss *stfcamss)
 {
 	struct stf_capture *cap_yuv = &stfcamss->captures[STF_CAPTURE_YUV];
 	struct stf_capture *cap_scd = &stfcamss->captures[STF_CAPTURE_SCD];
+	struct stf_output *output = &stfcamss->output;
 	struct stf_isp_dev *isp_dev = &stfcamss->isp_dev;
 
+	media_entity_remove_links(&output->video.vdev.entity);
 	media_entity_remove_links(&isp_dev->subdev.entity);
 	media_entity_remove_links(&cap_yuv->video.vdev.entity);
 	media_entity_remove_links(&cap_scd->video.vdev.entity);
 
 	stf_isp_unregister(&stfcamss->isp_dev);
 	stf_capture_unregister(stfcamss);
+	stf_output_unregister(stfcamss);
 }
 
 static int stfcamss_subdev_notifier_bound(struct v4l2_async_notifier *async,
diff --git a/drivers/staging/media/starfive/camss/stf-camss.h b/drivers/staging/media/starfive/camss/stf-camss.h
index ae49c7031ab7..3f84f1a1e997 100644
--- a/drivers/staging/media/starfive/camss/stf-camss.h
+++ b/drivers/staging/media/starfive/camss/stf-camss.h
@@ -21,6 +21,7 @@
 #include "stf-buffer.h"
 #include "stf-isp.h"
 #include "stf-capture.h"
+#include "stf-output.h"
 
 enum stf_port_num {
 	STF_PORT_DVP = 0,
@@ -55,6 +56,7 @@ struct stfcamss {
 	struct device *dev;
 	struct stf_isp_dev isp_dev;
 	struct stf_capture captures[STF_CAPTURE_NUM];
+	struct stf_output output;
 	struct v4l2_async_notifier notifier;
 	void __iomem *syscon_base;
 	void __iomem *isp_base;
@@ -132,4 +134,5 @@ static inline void stf_syscon_reg_clear_bit(struct stfcamss *stfcamss,
 	value = ioread32(stfcamss->syscon_base + reg);
 	iowrite32(value & ~bit_mask, stfcamss->syscon_base + reg);
 }
+
 #endif /* STF_CAMSS_H */
diff --git a/drivers/staging/media/starfive/camss/stf-isp-params.c b/drivers/staging/media/starfive/camss/stf-isp-params.c
new file mode 100644
index 000000000000..e015857815f0
--- /dev/null
+++ b/drivers/staging/media/starfive/camss/stf-isp-params.c
@@ -0,0 +1,240 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * stf-isp-params.c
+ *
+ * StarFive Camera Subsystem - V4L2 device node
+ *
+ * Copyright (C) 2021-2023 StarFive Technology Co., Ltd.
+ */
+
+#include <media/videobuf2-dma-contig.h>
+
+#include "stf-camss.h"
+#include "stf-video.h"
+
+static inline struct stfcamss_buffer *
+to_stfcamss_buffer(struct vb2_v4l2_buffer *vbuf)
+{
+	return container_of(vbuf, struct stfcamss_buffer, vb);
+}
+
+static int stf_isp_params_queue_setup(struct vb2_queue *q,
+				      unsigned int *num_buffers,
+				      unsigned int *num_planes,
+				      unsigned int sizes[],
+				      struct device *alloc_devs[])
+{
+	if (*num_planes)
+		return sizes[0] < sizeof(struct jh7110_isp_params_buffer) ? -EINVAL : 0;
+
+	*num_planes = 1;
+	sizes[0] = sizeof(struct jh7110_isp_params_buffer);
+
+	return 0;
+}
+
+static int stf_isp_params_buf_init(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct stfcamss_buffer *buffer = to_stfcamss_buffer(vbuf);
+	dma_addr_t *paddr;
+
+	paddr = vb2_plane_cookie(vb, 0);
+	buffer->addr[0] = *paddr;
+	buffer->vaddr = vb2_plane_vaddr(vb, 0);
+
+	return 0;
+}
+
+static int stf_isp_params_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	if (sizeof(struct jh7110_isp_params_buffer) > vb2_plane_size(vb, 0))
+		return -EINVAL;
+
+	vb2_set_plane_payload(vb, 0, sizeof(struct jh7110_isp_params_buffer));
+
+	vbuf->field = V4L2_FIELD_NONE;
+
+	return 0;
+}
+
+static void stf_isp_params_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct stfcamss_video *video = vb2_get_drv_priv(vb->vb2_queue);
+	struct stfcamss_buffer *buffer = to_stfcamss_buffer(vbuf);
+
+	video->ops->queue_buffer(video, buffer);
+}
+
+static void stf_isp_params_stop_streaming(struct vb2_queue *q)
+{
+	struct stfcamss_video *video = vb2_get_drv_priv(q);
+
+	video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
+}
+
+static const struct vb2_ops stf_isp_params_vb2_q_ops = {
+	.queue_setup     = stf_isp_params_queue_setup,
+	.wait_prepare    = vb2_ops_wait_prepare,
+	.wait_finish     = vb2_ops_wait_finish,
+	.buf_init        = stf_isp_params_buf_init,
+	.buf_prepare     = stf_isp_params_buf_prepare,
+	.buf_queue       = stf_isp_params_buf_queue,
+	.stop_streaming  = stf_isp_params_stop_streaming,
+};
+
+static int stf_isp_params_init_format(struct stfcamss_video *video)
+{
+	video->active_fmt.fmt.meta.dataformat = V4L2_META_FMT_STF_ISP_PARAMS;
+	video->active_fmt.fmt.meta.buffersize = sizeof(struct jh7110_isp_params_buffer);
+
+	return 0;
+}
+
+static int stf_isp_params_querycap(struct file *file, void *fh,
+				   struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, "starfive-camss", sizeof(cap->driver));
+	strscpy(cap->card, "Starfive Camera Subsystem", sizeof(cap->card));
+
+	return 0;
+}
+
+static int stf_isp_params_enum_fmt(struct file *file, void *priv,
+				   struct v4l2_fmtdesc *f)
+{
+	struct stfcamss_video *video = video_drvdata(file);
+
+	if (f->index > 0 || f->type != video->type)
+		return -EINVAL;
+
+	f->pixelformat = video->active_fmt.fmt.meta.dataformat;
+	return 0;
+}
+
+static int stf_isp_params_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
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
+static const struct v4l2_ioctl_ops stf_isp_params_ioctl_ops = {
+	.vidioc_querycap                = stf_isp_params_querycap,
+	.vidioc_enum_fmt_meta_out	= stf_isp_params_enum_fmt,
+	.vidioc_g_fmt_meta_out          = stf_isp_params_g_fmt,
+	.vidioc_s_fmt_meta_out          = stf_isp_params_g_fmt,
+	.vidioc_try_fmt_meta_out        = stf_isp_params_g_fmt,
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
+static const struct v4l2_file_operations stf_isp_params_fops = {
+	.owner          = THIS_MODULE,
+	.unlocked_ioctl = video_ioctl2,
+	.open           = v4l2_fh_open,
+	.release        = vb2_fop_release,
+	.poll           = vb2_fop_poll,
+	.mmap           = vb2_fop_mmap,
+};
+
+static void stf_isp_params_release(struct video_device *vdev)
+{
+	struct stfcamss_video *video = video_get_drvdata(vdev);
+
+	media_entity_cleanup(&vdev->entity);
+
+	mutex_destroy(&video->q_lock);
+	mutex_destroy(&video->lock);
+}
+
+int stf_isp_params_register(struct stfcamss_video *video,
+			    struct v4l2_device *v4l2_dev,
+			    const char *name)
+{
+	struct video_device *vdev = &video->vdev;
+	struct vb2_queue *q;
+	struct media_pad *pad = &video->pad;
+	int ret;
+
+	mutex_init(&video->q_lock);
+	mutex_init(&video->lock);
+
+	q = &video->vb2_q;
+	q->drv_priv = video;
+	q->mem_ops = &vb2_dma_contig_memops;
+	q->ops = &stf_isp_params_vb2_q_ops;
+	q->type = video->type;
+	q->io_modes = VB2_DMABUF | VB2_MMAP;
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->buf_struct_size = sizeof(struct stfcamss_buffer);
+	q->dev = video->stfcamss->dev;
+	q->lock = &video->q_lock;
+	q->min_queued_buffers = STFCAMSS_MIN_BUFFERS;
+	ret = vb2_queue_init(q);
+	if (ret < 0) {
+		dev_err(video->stfcamss->dev,
+			"Failed to init vb2 queue: %d\n", ret);
+		goto err_mutex_destroy;
+	}
+
+	pad->flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&vdev->entity, 1, pad);
+	if (ret < 0) {
+		dev_err(video->stfcamss->dev,
+			"Failed to init video entity: %d\n", ret);
+		goto err_mutex_destroy;
+	}
+
+	ret = stf_isp_params_init_format(video);
+	if (ret < 0) {
+		dev_err(video->stfcamss->dev,
+			"Failed to init format: %d\n", ret);
+		goto err_media_cleanup;
+	}
+	vdev->ioctl_ops = &stf_isp_params_ioctl_ops;
+	vdev->device_caps = V4L2_CAP_META_OUTPUT;
+	vdev->fops = &stf_isp_params_fops;
+	vdev->device_caps |= V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
+	vdev->vfl_dir = VFL_DIR_TX;
+	vdev->release = stf_isp_params_release;
+	vdev->v4l2_dev = v4l2_dev;
+	vdev->queue = &video->vb2_q;
+	vdev->lock = &video->lock;
+	strscpy(vdev->name, name, sizeof(vdev->name));
+
+	video_set_drvdata(vdev, video);
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret < 0) {
+		dev_err(video->stfcamss->dev,
+			"Failed to register video device: %d\n", ret);
+		goto err_media_cleanup;
+	}
+
+	return 0;
+
+err_media_cleanup:
+	media_entity_cleanup(&vdev->entity);
+err_mutex_destroy:
+	mutex_destroy(&video->lock);
+	mutex_destroy(&video->q_lock);
+	return ret;
+}
diff --git a/drivers/staging/media/starfive/camss/stf-isp.h b/drivers/staging/media/starfive/camss/stf-isp.h
index eca3ba1ade75..76ea943bfe98 100644
--- a/drivers/staging/media/starfive/camss/stf-isp.h
+++ b/drivers/staging/media/starfive/camss/stf-isp.h
@@ -474,4 +474,8 @@ void stf_set_scd_addr(struct stfcamss *stfcamss,
 		      dma_addr_t yhist_addr, dma_addr_t scd_addr,
 		      enum stf_isp_type_scd type_scd);
 
+int stf_isp_params_register(struct stfcamss_video *video,
+			    struct v4l2_device *v4l2_dev,
+			    const char *name);
+
 #endif /* STF_ISP_H */
diff --git a/drivers/staging/media/starfive/camss/stf-output.c b/drivers/staging/media/starfive/camss/stf-output.c
new file mode 100644
index 000000000000..8eaf4979cafa
--- /dev/null
+++ b/drivers/staging/media/starfive/camss/stf-output.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * StarFive Camera Subsystem - output device
+ *
+ * Copyright (C) 2023 StarFive Technology Co., Ltd.
+ */
+
+#include "stf-camss.h"
+
+static inline struct stf_output *to_stf_output(struct stfcamss_video *video)
+{
+	return container_of(video, struct stf_output, video);
+}
+
+static int stf_output_queue_buffer(struct stfcamss_video *video,
+				   struct stfcamss_buffer *buf)
+{
+	struct stf_output *output = to_stf_output(video);
+	struct stf_v_buf *v_bufs = &output->buffers;
+	unsigned long flags;
+
+	spin_lock_irqsave(&v_bufs->lock, flags);
+	stf_buf_add_ready(v_bufs, buf);
+	spin_unlock_irqrestore(&v_bufs->lock, flags);
+
+	return 0;
+}
+
+static int stf_output_flush_buffers(struct stfcamss_video *video,
+				    enum vb2_buffer_state state)
+{
+	struct stf_output *output = to_stf_output(video);
+	struct stf_v_buf *v_bufs = &output->buffers;
+	unsigned long flags;
+
+	spin_lock_irqsave(&v_bufs->lock, flags);
+	stf_buf_flush(v_bufs, state);
+	spin_unlock_irqrestore(&v_bufs->lock, flags);
+
+	return 0;
+}
+
+static const struct stfcamss_video_ops stf_output_ops = {
+	.queue_buffer = stf_output_queue_buffer,
+	.flush_buffers = stf_output_flush_buffers,
+};
+
+static void stf_output_init(struct stfcamss *stfcamss, struct stf_output *out)
+{
+	out->buffers.state = STF_OUTPUT_OFF;
+	out->buffers.buf[0] = NULL;
+	out->buffers.buf[1] = NULL;
+	out->buffers.active_buf = 0;
+	INIT_LIST_HEAD(&out->buffers.pending_bufs);
+	INIT_LIST_HEAD(&out->buffers.ready_bufs);
+	spin_lock_init(&out->buffers.lock);
+
+	out->video.stfcamss = stfcamss;
+	out->video.type = V4L2_BUF_TYPE_META_OUTPUT;
+}
+
+void stf_output_unregister(struct stfcamss *stfcamss)
+{
+	struct stf_output *output = &stfcamss->output;
+
+	if (!video_is_registered(&output->video.vdev))
+		return;
+
+	media_entity_cleanup(&output->video.vdev.entity);
+	vb2_video_unregister_device(&output->video.vdev);
+}
+
+int stf_output_register(struct stfcamss *stfcamss,
+			struct v4l2_device *v4l2_dev)
+{
+	struct stf_output *output = &stfcamss->output;
+
+	output->video.ops = &stf_output_ops;
+	stf_output_init(stfcamss, output);
+	stf_isp_params_register(&output->video, v4l2_dev, "output_params");
+
+	return 0;
+}
diff --git a/drivers/staging/media/starfive/camss/stf-output.h b/drivers/staging/media/starfive/camss/stf-output.h
new file mode 100644
index 000000000000..d3591a0b609b
--- /dev/null
+++ b/drivers/staging/media/starfive/camss/stf-output.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Starfive Camera Subsystem driver
+ *
+ * Copyright (C) 2023 StarFive Technology Co., Ltd.
+ */
+
+#ifndef STF_OUTPUT_H
+#define STF_OUTPUT_H
+
+#include "stf-video.h"
+
+struct stf_output {
+	struct stfcamss_video video;
+	struct stf_v_buf buffers;
+};
+
+int stf_output_register(struct stfcamss *stfcamss,
+			struct v4l2_device *v4l2_dev);
+void stf_output_unregister(struct stfcamss *stfcamss);
+
+#endif
-- 
2.25.1


