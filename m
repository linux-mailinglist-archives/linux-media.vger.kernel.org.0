Return-Path: <linux-media+bounces-3518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 961A982A93D
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 09:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FD701F23154
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 08:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75552F9EF;
	Thu, 11 Jan 2024 08:42:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2051.outbound.protection.partner.outlook.cn [139.219.17.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365C1539D;
	Thu, 11 Jan 2024 08:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOb1cHfPWjvOxFyaT5TBCGBe3k0ThQXAa5GLWCcz5yucSHl0ujenhN/OyrpyGfUqsi7rFK5im3sRZW6uGWRHhSjoAjCE4OtN2wL4z+tpwO5+xyhrgLsRQTdGLFDnlmUS/S71dnRW5nDYdRx+sfqjjHOdSUZeYqvK3ZdINiwZqXdWX3PvDESZi+l2zoykxIPjCQ6F2/yMyENN1nKSNxHVMGrFsFPgbA7SFdSEbkpSbmQSVnc8oOgvZKg3iIH59Np19CwPlHmWQWRxLjVtRkxP3lVviYLSUphid4CbZ3mU+zd6c3yyMgnuqPpipDofnRL/BgjfqcJpV5lQO4jd5rtrJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4U6+ikpuz7rFujJvskzhli0ghId/vav0Hwf6+7Ssm+U=;
 b=gpS7fQ7IbTzIxy//cdNtLA2s981d6cH8KtppT4/JtAx0Z9EJ3LXr4WX9kKgFV1+RgZO/GkkFyk/lnGWtstoc9F+cpM7oev91KL+PvEsaVMd6Q8KZIOwE2bxj4jbpTrpDMR+4sdwzzjzSEnayuEJ3+7NgJzb0vZ7mRZL+u3dzR8Oh5x48vZo1d69w55XfRQdcFJluZMu8m3pGp2Q2ehGvmBvaEkNbyFBpldp9GlKqpGdxcA29gxGyZST/V9imgcDD32zPeJ8qdkgshPDoTH7ZmP5rq47kHAv74mpifP410TBsbiwaiEM6e/095Xw9pXhXoCMnnEBNaJQcQcwWe+E+aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SH0PR01MB0667.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::21) by SH0PR01MB0747.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:21::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.33; Thu, 11 Jan
 2024 08:41:34 +0000
Received: from SH0PR01MB0667.CHNPR01.prod.partner.outlook.cn
 ([fe80::e255:98f3:ba27:8c7d]) by
 SH0PR01MB0667.CHNPR01.prod.partner.outlook.cn ([fe80::e255:98f3:ba27:8c7d%3])
 with mapi id 15.20.7135.033; Thu, 11 Jan 2024 08:41:34 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Ming Qian <ming.qian@nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mingjia Zhang <mingjia.zhang@mediatek.com>
Cc: Jack Zhu <jack.zhu@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 08/13] staging: media: starfive: Add for StarFive ISP 3A SC
Date: Thu, 11 Jan 2024 00:41:15 -0800
Message-Id: <20240111084120.16685-9-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240111084120.16685-1-changhuang.liang@starfivetech.com>
References: <20240111084120.16685-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0009.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::19) To SH0PR01MB0667.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SH0PR01MB0667:EE_|SH0PR01MB0747:EE_
X-MS-Office365-Filtering-Correlation-Id: 286c869d-c0ee-4e1e-9e2e-08dc12811dfb
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qs0h0L4GoEQSwBv+F2JsXDadiKXDB+Hon6R/rA+q1ILogwx1umUnh1ckgFl3QAXXvQfqHv1e+2VujhN27RP7xLrjeJHfndfzk7ZyOhSktCtfucbfs2mFL8d0drLTEgkUG9QSXDDFQTvtZtLYWuOTYrbgWqACnZV1Q+gf0mKZlJKSJ6Mp70TDDCcxBK5bCW1+stVpo6jmkRf52a0zbREGAqEtFjqn7Es7v2BxjmWfOkBk0mvG9Df4jkKYnGpMSA4hgVui1pxe8VP6pTWxId3xljy/FvyjWVUCQrTs4FtOdkNykmtYMxRZzOCCEx8HigTDMURRRCih4m5VkVKICNUf3xHI3OX0hB0tIy5NMeBKaYTcEuohrqNS4cfrZ8CqRpH90cKI+GFPTk8JeoUrXvY2lILZ5Q7SdSWUAw7xDnIsN84O8ZHIS3cn7WHoh6wks3YiV+5IdroiPLFMYN5FALCF7JlmR3J+h32AvUUrE9Pt0XN1TxMvEBU9jRcWpx13W/LgmV5QtDNi0QuXHJChedTRiCMVaPPogR+5ZQ2ydXyXKW2lj5OB6O4NKcbomDaBfvWtYPEbPl2i3JfuqknkO/haqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0667.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(136003)(39830400003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(6666004)(52116002)(41300700001)(2616005)(508600001)(38100700002)(40160700002)(1076003)(26005)(86362001)(36756003)(921011)(38350700005)(83380400001)(110136005)(54906003)(66556008)(66946007)(66476007)(8676002)(8936002)(41320700001)(4326008)(44832011)(2906002)(40180700001)(5660300002)(30864003)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7/Dx3aks2QVL7GUOixScZnXOFRCLfezocNj2xDRJ7tY3Dst/QQFyeJ2bK80d?=
 =?us-ascii?Q?5MppGtCqb2CV8VDKTyHnWMMdzg5scbuHaw/jBOCcAtW3lTioVhZBHRx9jgU0?=
 =?us-ascii?Q?mRVIRBb76dsGea/plLvps8I8+4yDiZ282o8cL8mTMaY7Kesg05NvMi1ORyth?=
 =?us-ascii?Q?//jGfKptsBrr6JksqVejlGhmL14FGE5x2LoOMRtmz2icVuSvrnrV9SOMd/HJ?=
 =?us-ascii?Q?LBFcd6FdJHHnk4PA4676Url+O0FkrV6AxHmEJPi6tajRNf5JtDYc/R4x1E4d?=
 =?us-ascii?Q?ShGEZiqQdL5WFC29T118IDqR3JaHrbPygxkcDc1GRALm+rzdCXq/6kKo/l09?=
 =?us-ascii?Q?wZeenbMe7BgRAy4N6WyXVNVyQrXkJ+9NeuCo84DZkdGTbJ1wu9387XMWmGuW?=
 =?us-ascii?Q?UK8I0RYJH7lLqnzHRLRJnpRT9OSv0nOf1XU7M90ishzOKwohdGXswoblT1jn?=
 =?us-ascii?Q?68supfaMfBOvQcs2GuvTxcbAAjcVcBBZEJmpFyrphO3FaO38jWfaSsfNeilj?=
 =?us-ascii?Q?PdOiN817mf9kit9oZjIxxYagKgCXQO/1Zo6HYtxJlqXDxY18eKkidR3lax6E?=
 =?us-ascii?Q?Iv3o4rJJqzWZ7txpA6l9Iwk2r7/+Yt2hP8FWxx5z1vJ+VzmydYYp9z6YIrpe?=
 =?us-ascii?Q?XDJ3PSWAd/e8od30T+74/CdcxSvHrBJlQr6s/gnwvR/9AjjVFCSKlhuzQhzI?=
 =?us-ascii?Q?xwQGgIb38JmlcrG/RP3ds5kUaoINiuDVgonRKyhwwZkmG/Mll0F5qHWLtDXk?=
 =?us-ascii?Q?tVAA33TUgdpfPgz3u4xzaWfSypkBbJ53dILnesR90jZ6wpG0vC7yg69PmTuU?=
 =?us-ascii?Q?A3ZIyJbUo5p9ASFPokbuX+UbwG12ai0tJEB+kXNjnCHrj9VHCOarhajnQ/U7?=
 =?us-ascii?Q?Ic4YoW8jjwRkDKhFwnkS/qg5z4aduyE5undqhC062WG3hh8esuKeYPpl3RWb?=
 =?us-ascii?Q?NKXX6h8HX4tylKcuduLuFCoiWKcsgSJrbmqT83rIWOTfz4DPV4ddB/Zy3ORQ?=
 =?us-ascii?Q?0PDqiPzu4GJG0jz6tsP8In5ZmN19KGf0VI2Vp58LD1/TZfFExXibZ+INbdNu?=
 =?us-ascii?Q?SMBUHeTOMM5R15kXoBjAK/Vachd8qsteKx4lfF6aQoLNvSQiePhM12/vl8X4?=
 =?us-ascii?Q?GMxuhheVbi0INrxQ0RrLDJkh2Zz08OBA+fQ2F5UdCJc+HO7wUOUaDr6UrsbX?=
 =?us-ascii?Q?smFpC/iVwsCvRnC/POfVy6aE2TbQYCp8gh5dLP9zTPDDQMrZgCRKuj8Len/u?=
 =?us-ascii?Q?e0eG88vpXI7cxpY6wBeIPWkRek4FM01tmnR1fImLdSuN+23EO/qE0lwGmJPA?=
 =?us-ascii?Q?COE1Dt6uHn1cy1n3/3REi/FZEo2RmiV9n5AJjOJ6SH1ZSOD0su152gAcgE8/?=
 =?us-ascii?Q?SUXcVYDAGCIGHvFkSt+jwLYOkFaPHry8fNjn2e6xOnV/HkpAzwHXsydqf7/d?=
 =?us-ascii?Q?lV0w0GmLXx7BAKZ+t7AN5PLlmNyLnr3E1wAaQZXOjIfeU0zF0AZ66K8EOzFC?=
 =?us-ascii?Q?BOX7gzhhC4m8fT6NVh+zmJZLiKXtGMHHTQsf9cq/BkF/hgWcWNOj9L2+1r3V?=
 =?us-ascii?Q?F5+xf/KARhpHT6dvQBo6r9FKH248P7r9JQC9LRNfrRB92NG9mjciB27v517u?=
 =?us-ascii?Q?/aoADBDfEnKNwrDAZSxu91Q=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 286c869d-c0ee-4e1e-9e2e-08dc12811dfb
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0667.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 08:41:34.4163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NB466K5X7idgfLEt3Rqvfc/HazA4uJGrVQCPZaVzb4rYwALCq7CNIL7g631tZaX2CG/vCd46dWzs0VD5JGJVvlN3eRrQEVjptiJ3VwjjBzFDitCPeuA0SCvBPEJHXLD7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0747

Register ISP 3A "capture_scd" video device to receive statistics
collection data.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../staging/media/starfive/camss/stf-buffer.h |   1 +
 .../staging/media/starfive/camss/stf-camss.c  |   8 +
 .../media/starfive/camss/stf-capture.c        |  21 ++-
 .../media/starfive/camss/stf-isp-hw-ops.c     |  66 ++++++++
 .../staging/media/starfive/camss/stf-isp.h    |  23 +++
 .../staging/media/starfive/camss/stf-video.c  | 143 +++++++++++++++++-
 .../staging/media/starfive/camss/stf-video.h  |   1 +
 7 files changed, 254 insertions(+), 9 deletions(-)

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
index a587f860101a..3175d0d9a05c 100644
--- a/drivers/staging/media/starfive/camss/stf-camss.c
+++ b/drivers/staging/media/starfive/camss/stf-camss.c
@@ -126,6 +126,7 @@ static int stfcamss_of_parse_ports(struct stfcamss *stfcamss)
 static int stfcamss_register_devs(struct stfcamss *stfcamss)
 {
 	struct stf_capture *cap_yuv = &stfcamss->captures[STF_CAPTURE_YUV];
+	struct stf_capture *cap_scd = &stfcamss->captures[STF_CAPTURE_SCD];
 	struct stf_isp_dev *isp_dev = &stfcamss->isp_dev;
 	int ret;
 
@@ -150,6 +151,13 @@ static int stfcamss_register_devs(struct stfcamss *stfcamss)
 
 	cap_yuv->video.source_subdev = &isp_dev->subdev;
 
+	ret = media_create_pad_link(&isp_dev->subdev.entity, STF_ISP_PAD_SRC_SCD,
+				    &cap_scd->video.vdev.entity, 0, 0);
+	if (ret)
+		goto err_cap_unregister;
+
+	cap_scd->video.source_subdev = &isp_dev->subdev;
+
 	return ret;
 
 err_cap_unregister:
diff --git a/drivers/staging/media/starfive/camss/stf-capture.c b/drivers/staging/media/starfive/camss/stf-capture.c
index e91e726a1462..20c43e3f9b08 100644
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
index 6b3966ca18bf..ae88668e5798 100644
--- a/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c
+++ b/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c
@@ -451,11 +451,57 @@ void stf_set_yuv_addr(struct stfcamss *stfcamss,
 	stf_isp_reg_write(stfcamss, ISP_REG_UV_PLANE_START_ADDR, uv_addr);
 }
 
+static enum stf_isp_type_scd stf_get_isp_scd_type(struct stfcamss *stfcamss)
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
+	*type_scd = stf_get_isp_scd_type(stfcamss);
+	if (*type_scd == TYPE_AWB) {
+		sc->flag = JH7110_ISP_SC_FALG_AWB;
+		*type_scd = TYPE_OECF;
+	} else {
+		sc->flag = JH7110_ISP_SC_FALG_AE_AF;
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
index 989b5e82bae9..d9e51d4e2004 100644
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
@@ -330,6 +338,75 @@ static const struct vb2_ops stf_video_vb2_q_ops = {
 	.stop_streaming  = video_stop_streaming,
 };
 
+static int video_scd_queue_setup(struct vb2_queue *q,
+				 unsigned int *num_buffers,
+				 unsigned int *num_planes,
+				 unsigned int sizes[],
+				 struct device *alloc_devs[])
+{
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
@@ -448,6 +525,37 @@ static const struct v4l2_ioctl_ops stf_vid_ioctl_ops = {
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
@@ -473,6 +581,9 @@ static int stf_link_validate(struct media_link *link)
 	struct stfcamss_video *video = video_get_drvdata(vdev);
 	int ret;
 
+	if (video->type == V4L2_BUF_TYPE_META_CAPTURE)
+		return 0;
+
 	ret = stf_video_check_format(video);
 
 	return ret;
@@ -506,7 +617,11 @@ int stf_video_register(struct stfcamss_video *video,
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
@@ -529,16 +644,28 @@ int stf_video_register(struct stfcamss_video *video,
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


