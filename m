Return-Path: <linux-media+bounces-13419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F84390AC29
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 12:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17F9FB230A2
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 10:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90AED1953A9;
	Mon, 17 Jun 2024 10:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Tj03ky4x"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11020003.outbound.protection.outlook.com [52.101.154.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F95194C95;
	Mon, 17 Jun 2024 10:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718620937; cv=fail; b=VbnIQ9MKwcF7I+oGdCs4GEUQxh7oyzwXy06wh/Bf5XHqXFSgWL8Z8ZVuUX6jxqh+slyDx/TIkiy/rHzSK8Epj8kcbVyfC5kmBfHGmOkFdk2tE6bMAQZUGZb84C0Ok0K7pOfiKsqelIiL3Su23VtCgzmMDZ+6UtMfXV1X83bybRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718620937; c=relaxed/simple;
	bh=VMtPjfoOC0XTH+riNVMx8QR0jvlY6HzL+4rikDpX08E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ra024k2qaFPYsVN982gUvPNkgecQ3GRw8vgnKt2k55FbL7uB6E0M0Pa9kxnis9bNSiookf4Hq0uyHuZZH8kyeFkD5oV18fqQnj6QFGEQK964HdqDBetHZbfG1CSnHEpiobOuiYxVlPirCVPfspkCf8V+iNXiv/moP12Cc1sTjcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Tj03ky4x; arc=fail smtp.client-ip=52.101.154.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+Wx5oo9geXLYdfo5cmemMWARPk3dHE5lm4wgQs0mAOpPCT0ZFXfWBxIsgat9jpxCJAzYdN1gtT3ekbQm3Ep/Yeqin/TZCKH77xzThcnCkGbs6WHPjd/9niam9IBDiJWb/+obsmN4Q07khhZbsez5omPGmNCAXJPYdNV9EJEqbO6kwtcKsy2fJ5NSkx5j+k0eeczBd9xNYmKpauTeh4bHRuk4dCffuveE+T7uW67S/IAm43cdC1Jr4fEeyUcinoQ0I9ZEHJ+/8NvSPBPUKhztyjJOD0vFKsyjH3HmxKf7mMjsIaM7uZ3VVNUV7Z9wwwX2fxtN5VCHTlejDmgLMqsjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0rAwfhgGXe8i8mWUYHlL3qQfx2HZL4rsIULoSdXt5Y=;
 b=hmZyle6/DlgMDtj7DTURU2Cpo9Flp8JPvboLvfZnvVMSchlXFCjki7FmbLUTENpvwWB+15dMB5hF8VQAX2TefoIDFQSB2U0EKIuBoSmC1TyZh8QHhLJ/41OmB+zGXRJ7I5YtKCSskMd1wxERmEYN+bLV+jzgOErfdVZIsFJ2fSXu3TptUZ0peSELfkzgXKzDW6P9vQNHm1ISznPG2zLx+PccIb9yX3xe4RPSahmH8AzXRTWRNamkt2o2L1VrTQFV51DG/vO859HsS/J0UdvQ+ALDWE51qanDFwvZAvQt0VNQE22krJ5E4S8IelyywQNf+fSJCh9fdJf2k4v4+JOzaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0rAwfhgGXe8i8mWUYHlL3qQfx2HZL4rsIULoSdXt5Y=;
 b=Tj03ky4xoVyPv6+7O+SgV+Q6WS28O/yDsMZTqa8flm9RPy71BVzp5W7urhFwhOjTjWexrHXksOYLxKya56IUkEW9CymLrL+dy9G1EJDzgAhp/r363AC+gBcOlX9l98XEJ/ZcDXQITBKx5kUFXX2jRQG1co0qm/D+YUr7yU+80QI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB3099.KORP216.PROD.OUTLOOK.COM (2603:1096:101:282::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.30; Mon, 17 Jun 2024 10:42:04 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 10:42:04 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	jackson.lee@chipsnmedia.com,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v6 4/4] media: chips-media: wave5: Support YUV422 raw pixel-formats on the encoder.
Date: Mon, 17 Jun 2024 19:41:55 +0900
Message-Id: <20240617104155.153-5-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617104155.153-1-jackson.lee@chipsnmedia.com>
References: <20240617104155.153-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0185.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::9) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SL2P216MB3099:EE_
X-MS-Office365-Filtering-Correlation-Id: 85e7ccff-13c7-4fcb-465e-08dc8eba20f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|52116011|376011|1800799021|366013|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dHMkfMTZPB1tHkAkBM/VHv9+CYTrmoJ66u/IeS4gLBO+OFQzMS9UZZJyNoIj?=
 =?us-ascii?Q?XH67YfVNVliBb3gd1ey9ipAgrAOmZAIGrfhfmAjmf97AnftFyWSXvm4khndm?=
 =?us-ascii?Q?REjazUmqeLxeReAn3WqaCbnCsjjm/QrvrfnS4C2CQIO+coWNBfN6UE+27Ozn?=
 =?us-ascii?Q?9gE67LfHCBxcrgiwPUJuliIHMUskgOI4f6tLA/T7coDqFyVIM4SiIdxhbY5i?=
 =?us-ascii?Q?0TCQERGqwvlDR1/DO0/G8VPYZvrd2iVWAbXFSp1XkKZ9HokQlKs/ntcvvIlG?=
 =?us-ascii?Q?DLiwGMwGXrs+Leb5nH3zbLccOOOhmQrrZAJdQtotMzbMSwK79zRvNNulcux8?=
 =?us-ascii?Q?XgAYQfoPjpd3Hhb0ZKq9DarBIkKRTqYl+Uu4fDzfL/1OyN5i13+GzqPleD+H?=
 =?us-ascii?Q?jDvftDrnmiOjBug0aQAcXhblMBtIYIZlgpjykDfGjajxdSCGqvhM9Grs41Ya?=
 =?us-ascii?Q?NPvmRpJcdTgLPhrupCIZLTUIJsdkm2oD0lBXqEmSDBCwblzonOK4QJJwps39?=
 =?us-ascii?Q?p+nBPFyovzqGLgI7KWHPPk8nEOGlbmu8jMNbTqJLr1AqYaRVdynHOrYLs3Ot?=
 =?us-ascii?Q?OwLwUB3ogX5NustPcT2V9kviTzXPTZLl/cRsi7GVMFdY3tCok8Vrm2CLsWJe?=
 =?us-ascii?Q?Kl5Bm48IMeg0yYQVqnTN8rIijnENdSAQTLaw5opAFDx5KlkGUduHgKV0STUn?=
 =?us-ascii?Q?I13WLnGbApN8Fez23ExwS2ffQgoiBriK5WaJMJ3+sIh0E1w/zWK1K7VM0lp9?=
 =?us-ascii?Q?9yfo2WLUUQ/P04dkKeJkSaoQfSIMiK0ipKLG0cAQ8xbFXcGARlqSmbC+IC2X?=
 =?us-ascii?Q?BXJ+JLV7/fY53SC+xrM+os6WivRuI6vlj4MgMx75STrIvbE2J47NAsDZUhQk?=
 =?us-ascii?Q?Np40YFlz58AttDO1o/Sza24PHFWn2YL9jNt+3jq8+mckOWVy+jyzN/UD7bjy?=
 =?us-ascii?Q?pTvgWisGfNHmOAoPyZTkfQ/SXmoDwm7XBPHxsdbaC374lQQOtKMy6dOgQpMj?=
 =?us-ascii?Q?KxNkGy/5AoynzaTFH8O38Y/IeJQ7LUMojrLYBoyWSN86jKQtMTW0E09X1BWC?=
 =?us-ascii?Q?34mBYGAu/8MMY/QVIVSyZgH8TXqcTpMSs+aXyuPzM7xDBkSue582cOm6j0v6?=
 =?us-ascii?Q?w2l42ujPj0pSVVlUFLa1zHqbLTrZmMAFom7JshQcxtDzhv4Ojy2Nl/oX35r/?=
 =?us-ascii?Q?h5t9yFehbzBAGX65MkQetu1X6r180hS3t+gm/sr1R+W8i3Oad/pnslg3Xk8W?=
 =?us-ascii?Q?PuuL1PLpDDo+cnQIoTu6XWX987asqY4vvHCuaM8YgHFggWTPLroYoStFvGkQ?=
 =?us-ascii?Q?lO25qDDuBHTPp6xDcO4DjyGl/C+euwHdD/jJU6ZRVpOAZ/VTdfQasUHzMdAb?=
 =?us-ascii?Q?tSG4R5k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(52116011)(376011)(1800799021)(366013)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hOx74GEzbKd5r2QNSOJBB4vtZdNd0pGO7EV+F3tJHhJ2qyl13gV4RnnpHJpO?=
 =?us-ascii?Q?mJkEO9Ja69Itz/j8yk0Svuj6lvawigucT+2fWxozJpE8TYdiuMq0T1Eqgoo2?=
 =?us-ascii?Q?dhGW1Liqm1PbzmE67x0ouu/4RlhvpSSmaqpC5t0soFvhsKMrB6+KgMGfIEG2?=
 =?us-ascii?Q?PZ7651S1I9tQ3vg3Hb0CXv0SbbYVGI08Fc1w2OvMB1mY4klDIdo55BeAv5Kb?=
 =?us-ascii?Q?1ko5yxFVEfuMigyRQAxpdfWiFCJSiV9LvVthJaBW7C8pHMZyFvHCp71YDFM1?=
 =?us-ascii?Q?CS2s518nNrPp5giM9wJzAx3MK0N1UwdfrxVRjQuAOIvL1xBFf7mEks6ZGZNn?=
 =?us-ascii?Q?vCbx8LrpsOLqKzBXMidmMG9ezpupmjvN8sU981Fh3oOKwnANbUR10TOic7Zq?=
 =?us-ascii?Q?UKfigI8sWhfWk7NEum0oVOtzEpFGRbxGx49MJ2a2cdJhfkLEeEqYmaKvJyvc?=
 =?us-ascii?Q?VLdfZXK4UwEuiYsOteIJpRk0/6jnkodIo4qP/THDfxu0NLfWL4mAtlmdsxJz?=
 =?us-ascii?Q?uQ1TKtzLzty8qLP+obmxeyZS4FAVOHsBLIz1m1xF+ExkYJwfuTfP8WKuMwPY?=
 =?us-ascii?Q?nUlSZHxQ1K5z5dPtUIDWRbCkwBo5BWbAfu5Avm3pFf67dQEGJSnCqPgDdxBX?=
 =?us-ascii?Q?kvl1I0CXUB70200S4/ww0SSAaLyGBCtCuqPX9mhhGB8sL0Dog7zK9fpCxAQ+?=
 =?us-ascii?Q?GuOnadyIdqrT2IptSepkjMPcsXVY+BRFDi0sYs18vshBgnuqRH2f2xcCzqaS?=
 =?us-ascii?Q?MXYMgQoetVcf+Bwz/3oTvoBKr8YGfSMv5skxjFvBN2iXt8nN4SbOInGeHt0J?=
 =?us-ascii?Q?eVrdOrnuyqf8RBfuFgSybYfwMHrBN4tCOwZJIDEo0xkm8yRTaG+zv5atFDWa?=
 =?us-ascii?Q?99HchaSW8lgiLrAw+6/GhoOhlag8pCnZiqEDGaA3ApG0NL1G/+ZT2NmpLReX?=
 =?us-ascii?Q?LqoRPOel7Ig9o2Q5UyqKY1V5cBP5cvNk1U2tQ1191H5Xu4JDHmfMGNPFbBpu?=
 =?us-ascii?Q?RYB5AkcNNLXnzii0WjKjlnpDCZigrzYKjmpjVadmiPoE01deXlS9pyAh/Tz5?=
 =?us-ascii?Q?pBro114KK0FynNL+Z0sMD+mV4a83qoF8CgfixDb2rURzUlhVcNgKwuR5kMc+?=
 =?us-ascii?Q?PSaGaF4sAlJTlagQA5HLAVKBpE1v7a5HEC8MFpTe8qBROHxTkvnj3NWbC9qV?=
 =?us-ascii?Q?/cNTGzFJouHW9H/eVMF3U9tz3Xl1MpF7Ni64MxMdaVjLqw2jMOQtX1IEU7J6?=
 =?us-ascii?Q?Ihu5PGQTrUKBNjVH9B0zROa/ubemlXR5WeN6Orq69TF6EC4AjipJXTamuRF0?=
 =?us-ascii?Q?tBvB6Wx4IoKbJHFetro4VGWKe+QcIILHQazKlhI7f/XE6Brq3z5KVwW5UNF/?=
 =?us-ascii?Q?j9VyPWngFGDmEmQ1kFfho+DZE8/cstWrnu66zZcF5938mi3nflbqMT6i+As0?=
 =?us-ascii?Q?BO69KqT4N8w2TsO91rCfLSc6LFcdgowT1RhLSVsw9MLe8IJaE4jd+NeKvQLs?=
 =?us-ascii?Q?sDtiZc8Uk8uNK/MdvK23YGFOvJyRmuiEEIrRleOTVfZpC2WrMVX8fueHcto5?=
 =?us-ascii?Q?Drn9fpcojBf2wuV10K8NLOoZSINXoXe0Ys6bXpdW+fnZlqXsyg//EkMWu0/s?=
 =?us-ascii?Q?uA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e7ccff-13c7-4fcb-465e-08dc8eba20f0
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 10:42:04.8461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: leuwoIaEoegNJZi6iD44A3BQdNCZ+BI6rEuiZLQrQDtwgiS+n+qROp2QjeB7iVrFKgxlrd6Nt6f5ObengUenN80w/EXKJ2ybXGG2oTWaIfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB3099

From: "jackson.lee" <jackson.lee@chipsnmedia.com>

Add support for the YUV422P, NV16, NV61, YUV422M, NV16M,
NV61M raw pixel-formats to the Wave5 encoder.

All these formats have a chroma subsampling ratio of 4:2:2 and
therefore require a new image size calculation as the driver
previously only handled a ratio of 4:2:0.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../chips-media/wave5/wave5-vpu-enc.c         | 89 +++++++++++++++----
 1 file changed, 74 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index a470f24cbabe..fee24b427fd1 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -66,6 +66,30 @@ static const struct vpu_format enc_fmt_list[FMT_TYPES][MAX_FMTS] = {
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21M,
 			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422P,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422M,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16M,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61M,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
 	}
 };
 
@@ -109,13 +133,26 @@ static int start_encode(struct vpu_instance *inst, u32 *fail_res)
 	struct vb2_v4l2_buffer *dst_buf;
 	struct frame_buffer frame_buf;
 	struct enc_param pic_param;
-	u32 stride = ALIGN(inst->dst_fmt.width, 32);
-	u32 luma_size = (stride * inst->dst_fmt.height);
-	u32 chroma_size = ((stride / 2) * (inst->dst_fmt.height / 2));
+	const struct v4l2_format_info *info;
+	u32 stride = inst->src_fmt.plane_fmt[0].bytesperline;
+	u32 luma_size = 0;
+	u32 chroma_size = 0;
 
 	memset(&pic_param, 0, sizeof(struct enc_param));
 	memset(&frame_buf, 0, sizeof(struct frame_buffer));
 
+	info = v4l2_format_info(inst->src_fmt.pixelformat);
+	if (!info)
+		return -EINVAL;
+
+	if (info->mem_planes == 1) {
+		luma_size = stride * inst->dst_fmt.height;
+		chroma_size = luma_size / (info->hdiv * info->vdiv);
+	} else {
+		luma_size = inst->src_fmt.plane_fmt[0].sizeimage;
+		chroma_size = inst->src_fmt.plane_fmt[1].sizeimage;
+	}
+
 	dst_buf = v4l2_m2m_next_dst_buf(m2m_ctx);
 	if (!dst_buf) {
 		dev_dbg(inst->dev->dev, "%s: No destination buffer found\n", __func__);
@@ -480,6 +517,7 @@ static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
 	const struct vpu_format *vpu_fmt;
+	const struct v4l2_format_info *info;
 	int i, ret;
 
 	dev_dbg(inst->dev->dev, "%s: fourcc: %u width: %u height: %u num_planes: %u field: %u\n",
@@ -501,16 +539,20 @@ static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 		inst->src_fmt.plane_fmt[i].sizeimage = f->fmt.pix_mp.plane_fmt[i].sizeimage;
 	}
 
-	if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV12 ||
-	    inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV12M) {
-		inst->cbcr_interleave = true;
-		inst->nv21 = false;
-	} else if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV21 ||
-		   inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV21M) {
-		inst->cbcr_interleave = true;
+	info = v4l2_format_info(inst->src_fmt.pixelformat);
+	if (!info)
+		return -EINVAL;
+
+	inst->cbcr_interleave = (info->comp_planes == 2) ? true : false;
+
+	switch (inst->src_fmt.pixelformat) {
+	case V4L2_PIX_FMT_NV21:
+	case V4L2_PIX_FMT_NV21M:
+	case V4L2_PIX_FMT_NV61:
+	case V4L2_PIX_FMT_NV61M:
 		inst->nv21 = true;
-	} else {
-		inst->cbcr_interleave = false;
+		break;
+	default:
 		inst->nv21 = false;
 	}
 
@@ -1095,13 +1137,23 @@ static void wave5_vpu_enc_buf_queue(struct vb2_buffer *vb)
 	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
 }
 
-static void wave5_set_enc_openparam(struct enc_open_param *open_param,
-				    struct vpu_instance *inst)
+static int wave5_set_enc_openparam(struct enc_open_param *open_param,
+				   struct vpu_instance *inst)
 {
 	struct enc_wave_param input = inst->enc_param;
+	const struct v4l2_format_info *info;
 	u32 num_ctu_row = ALIGN(inst->dst_fmt.height, 64) / 64;
 	u32 num_mb_row = ALIGN(inst->dst_fmt.height, 16) / 16;
 
+	info = v4l2_format_info(inst->src_fmt.pixelformat);
+	if (!info)
+		return -EINVAL;
+
+	if (info->hdiv == 2 && info->vdiv == 1)
+		open_param->src_format = FORMAT_422;
+	else
+		open_param->src_format = FORMAT_420;
+
 	open_param->wave_param.gop_preset_idx = PRESET_IDX_IPP_SINGLE;
 	open_param->wave_param.hvs_qp_scale = 2;
 	open_param->wave_param.hvs_max_delta_qp = 10;
@@ -1190,6 +1242,8 @@ static void wave5_set_enc_openparam(struct enc_open_param *open_param,
 			open_param->wave_param.intra_refresh_arg = num_ctu_row;
 	}
 	open_param->wave_param.forced_idr_header_enable = input.forced_idr_header_enable;
+
+	return 0;
 }
 
 static int initialize_sequence(struct vpu_instance *inst)
@@ -1285,7 +1339,12 @@ static int wave5_vpu_enc_start_streaming(struct vb2_queue *q, unsigned int count
 
 		memset(&open_param, 0, sizeof(struct enc_open_param));
 
-		wave5_set_enc_openparam(&open_param, inst);
+		ret = wave5_set_enc_openparam(&open_param, inst);
+		if (ret) {
+			dev_dbg(inst->dev->dev, "%s: wave5_set_enc_openparam, fail: %d\n",
+				__func__, ret);
+			goto return_buffers;
+		}
 
 		ret = wave5_vpu_enc_open(inst, &open_param);
 		if (ret) {
-- 
2.43.0


