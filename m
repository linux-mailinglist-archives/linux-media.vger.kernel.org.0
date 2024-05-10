Return-Path: <linux-media+bounces-11285-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B918C1E90
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 08:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2200E1F21FCA
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 06:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279131607AC;
	Fri, 10 May 2024 06:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="FNAE3BtC"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022018.outbound.protection.outlook.com [52.101.154.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1872A15F41D;
	Fri, 10 May 2024 06:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715324321; cv=fail; b=fvx9CgpCR3uY6K5PunxrihKlaSKvfz4DjiYrKUSBzdOFrDnUI5FejtZc9mXzWAyCzugxrm0JPLcSXn22PVLFFPGMoE1o+EALJqZKb32aIsFLFPo/0OqmrR4JeE5s70DYk2jxDLYRYEJykx+3qKYjQBTEposCPVGkh53fNABMYYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715324321; c=relaxed/simple;
	bh=iLlXNG2PIIx+T+C2n+6SEH1YJri7KU76SWyIbHTJfGY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WvoMHT3GXcviGrU5/Jdk16/KEESJpAZVQ79XPOG1tQgzfmyhgrJxYgUxSIOgZ4ZRQp9oSE4r4DLTARQZfpnvyC1gA5yP4Gv5uYvU3+gzF+dIQ0EtvTTbSIo1f97EukPgIsoQimETRJmMGRMhgS5ObO5BTcm1wL6fNaTNCAWXvuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=FNAE3BtC; arc=fail smtp.client-ip=52.101.154.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZtp8oRM9KpGvs+RdGjzueDQzw8EOEtlddTFuXIhfsoL2RHYQFL8ozdZhJ8XhcuKdT+Nav6NRp7YOMswiholrVhl5pl35Rzef4a4FOgkYp7E6bgHadAh/OtiuAuittqFkU0SMKpPBu+iEzcB6+6xmOamJcNe9Q9Vg8ZuLTQvL2TXOxGF1FnsVw3vadJeSkUGPW3IV4BcEu5YX6tMXHHx/lg1W4A5xtqpeJpZBVVdooz4U4Pqg0usGX1JtTDdU8RhU7gc/kGt6WGxzVv+P8YeAVAsKQqhhXeHEId5ZuWy6CONLm+mWyjeLzWiJOTDtNDfqMrlLEveJ3CLXYwLGav6Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wN3e1j6LQP7KFaGLTrEhzYsm/r+C6mDQ+1o2ezW5wGQ=;
 b=oMiNmTlF/rH69bVd0zhiwgzk/L7rSfRJKMD8a2OpvQyjEjNQgiM0yuzmpsDhQLF7zfObCCXziuvidkt0TUdhfb1R9259FLWG88EfME3d+Wej82Xa3jWWOI57Kw7AdhV1kmTniY5kt0uCd9E49AGL3/dLmWOnIcO74EspawAGWXaX2cCbmd9gBhaq5jD5cwROhkydI1jmRaEV3SWYzmW62oaxgLuJKw3peFdHkFow/z8ZD28heKJfLJtrJy0LBipdjIhEVG963pOx0ydBxhRs0CI+dd84V49kTWxZUhSaTrK5XrA0Z9Ew7f5N62hPJ9IYcs75XdPlk7RRwBXCpD9n2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wN3e1j6LQP7KFaGLTrEhzYsm/r+C6mDQ+1o2ezW5wGQ=;
 b=FNAE3BtCHhHNvRIMaQQxQQiuU+OakxNB6rI3EYMP+d8U0Ljcl45zYmzHMVeIOlHYaoV/2Z33JNld9oW9ZncW8L43j6UqpVxsN8blk8A+Y6AVsZN1DSR1WphtrNi5N3Zl2Tiyt7tM520MJioSAo97ltV4KZzK4nn5BDzc8CriFrc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PU4P216MB2247.KORP216.PROD.OUTLOOK.COM (2603:1096:301:12c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.49; Fri, 10 May 2024 06:58:28 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.7544.048; Fri, 10 May 2024
 06:58:28 +0000
From: Jackson Lee <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	jackson.lee@chipsnmedia.com
Subject: [PATCH v4 3/4] media: chips-media: wave5: Use helpers to calculate bytesperline and sizeimage.
Date: Fri, 10 May 2024 15:58:16 +0900
Message-Id: <20240510065817.743-4-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240510065817.743-1-jackson.lee@chipsnmedia.com>
References: <20240510065817.743-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0033.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::19) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|PU4P216MB2247:EE_
X-MS-Office365-Filtering-Correlation-Id: 66767795-6915-426d-c506-08dc70be9811
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|1800799015|376005|366007|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kEM5lpPYpJqHKMVcNAxbtKkq+iopP8ag821xutZatqrs3QuhlEJ+Vp0eFOIT?=
 =?us-ascii?Q?uYVDBaZLNGBkoMeivTh82u+QQzsb4ElH43Vq/jzsnoylBaHSBxeDl1MjVjLr?=
 =?us-ascii?Q?xvIfRwktBZ3OfYe7iRsEXRNqvRc1UVQsSIPvkEZdXNC7lNorf/15SUOxCXrq?=
 =?us-ascii?Q?QcwihiFlatQQ5o5houS4sAtm+ZFmcoXkjQs0ALQIGqFojPD3NbcVwgYeRUqA?=
 =?us-ascii?Q?QtwacMrMDk9mb+7amJrkMs7Wa7w8RPKLyJfdzZyvbnzoUBcL9Qvd2QVDzO+y?=
 =?us-ascii?Q?zeUaGLktqmvE9q+4krHt0FJ6rttBaFlBo+UnUH+1z3wK3nzD8xSRTvrzF18o?=
 =?us-ascii?Q?Dno7dP/yVhQnYeHx7rKk9CIv39yNS8qo2mCCu0HdqZfW204Esek4EU/whhXz?=
 =?us-ascii?Q?pfe+hJ6ODj8JPAeGa6lR8MBr4gkC4H1rL2a+gdyoKJz6SuaWL8DDkiELaxsr?=
 =?us-ascii?Q?f33mcoexhE2qJokYG5Y6yQsrYfJPs6f/FmO4Z5WD/dUCEt4AR1utIjjLC2CJ?=
 =?us-ascii?Q?JzImyJJ0w3OX2NbbZpb3KTVZocnGwX4u5jSTFXQZsMim4YtuAXWDDJ5+Wckd?=
 =?us-ascii?Q?agreCBF7vJk2gJuBqlnVtwAvEEKMDQOC81MSbg2HhHpEEVrIU74QlIZK4FAN?=
 =?us-ascii?Q?pXyEUMwoVzSkxOCR962+FVUc8CcbjnbUM8CZjiCc/yyP8NsAB5DwgI+mV31B?=
 =?us-ascii?Q?Aq7dpYajOhSmtvmK0HSok9zJ3LeaRoRhhATahnKBjAuU/WN730XnrOC1IZCT?=
 =?us-ascii?Q?h1qLgIQmmCM+WxgjhXlMtN9GQnZE6LLBgpX6yYeXYoCG5Ksu6CnRtLVBwzUy?=
 =?us-ascii?Q?dtcyyPerHb8Cb448+q7Lx+/NtXTWQnzhPjavS14n4DyqHkOYIE27cfq8M5mO?=
 =?us-ascii?Q?ClEo0mpGGAWo2Xzqpofk/vFL2imr1uamWuqLEKoA2VGf1sRJ1rYKzsHCZcS1?=
 =?us-ascii?Q?XrCdMebwytfwgwtQO+GMsonkTyEP1J2X2KiO9SlI6TMHTsIKarFG6hBuY3D0?=
 =?us-ascii?Q?BZV7KgFlpO/WMS+EnBR3Yud7EKcCbTlaEo8VBBG80zYPZEYYuqgdbgzJu+j+?=
 =?us-ascii?Q?V7u35AHB/BmcvxkVgD+tJhaHiPfHBmk7zfAqvkrkeakNa9TqC7tmW1D/gqEi?=
 =?us-ascii?Q?gTynQGmyjEbxWOyvN6FGLVCqt29+xh1bWiiXXRNh3DezaVvKvnlMR3PVXktk?=
 =?us-ascii?Q?/SgDvZLL9G9EckuZco46wRT3EegfCI01o9Nng/OeD8Ql1voPivauwTgi601z?=
 =?us-ascii?Q?wm/A/XC2OnF46y375kllxGzSk2E2eRk2zwRPCyzR3BX6n6D021pZKEUB9+QZ?=
 =?us-ascii?Q?Q/iwn5WZ3lnAgOwxf6Fz7XWARfcyMT4SNDZTNDoUbCM69A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(376005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TEErrFZL1H3btSO14gPkvemCeb74J5fzaxCGT69eP13+nTjheH7S4wOnI4ZE?=
 =?us-ascii?Q?RuHKxClY+53ZwkAny3oFei36NIV7nDNA7/azaT/lCfjzpD7JNuEP07Vi9aYH?=
 =?us-ascii?Q?FEBOWmHUffqy7MYIpruSEQbiYAbrblA5vuTC8IcsdxsLYOSnhDvKHWdT9wDZ?=
 =?us-ascii?Q?lu1l/U2eAOWcDAkTebToNKGxZqrCACtUVintL/DrT3Gm4wT17LR1l3DIOq1h?=
 =?us-ascii?Q?7Kj3qJXeyohN5KQAYmJbq1fPv5GnWqLkEtyEMZnBv8HkGEQfxFwMTpgcIzss?=
 =?us-ascii?Q?t2htSF1npUKoQxN7IdcZ9yBxuC12nfWKIBnzrA/pFgxvrcbEaZd9SssYHrC/?=
 =?us-ascii?Q?3eTH1DhBlTH70gDYjmK4FIYhB5i7dunEsl/qLGyY/GH2c2sucOFV7wMJ/zXh?=
 =?us-ascii?Q?whkYkZ3i7gJZ22xNBI9h49MERs27wGRdGTjmXOMl6EFilbtBqfeyAhAljabE?=
 =?us-ascii?Q?3ZbpFfmjRRjrTY13kspH9tXTUcqUhD2H8rFBFo9qjN5Lk287LQH0f1ScxQbY?=
 =?us-ascii?Q?idSqXxtOjg0xk2nvYDwOzLujaGILYZrLO4eEA+MfG+NPt73GSrbSsZ3LV11V?=
 =?us-ascii?Q?9rG+Q1/InQG4qmsLpk3ThF15qigRy5rtQKWZ0dS/3d/OLH4dcG6B6lp46zjw?=
 =?us-ascii?Q?5ZVVySBmlq7Ro8awe9njgffkfjJKKcvcFadxbEmRtZd7VU52hQxDWPzHTeal?=
 =?us-ascii?Q?PJfmyY9fN+8ybZcfgmYw9HCH60B8JUP0ITeV/E8IQnFRcVJvwluaP8a4vTby?=
 =?us-ascii?Q?hQaCJR2jaiesXwj/EXfylmpz5oBrlaGZh+GJW2SFOm7R6ZjSW2KtZChSuEko?=
 =?us-ascii?Q?ZEUoXHIIDLrGhv9Qe2Z661ZbmkPTE/qwpA0glqUFjEX3ESiOeheoH7sWHRq7?=
 =?us-ascii?Q?jdrMrmYlWlu91vhJfVISs6irtWgVWJDTxHgWMGGviifzFwVkD59DLwlxyZWD?=
 =?us-ascii?Q?gseAeNJtq27e6B9C+LK8RaByeh0Avvdj0xINRNMnDzt1WR/LSvCO3EfN/r0G?=
 =?us-ascii?Q?kJP2D/W4Q3Dn2yby+znr/qOxkkxjnUf1eBOxS0Wty6gQ4Vn5gl7NZ4uu3j93?=
 =?us-ascii?Q?R7Jxkrf3k7csSrMCqgkwcj/bQiwaOa0o41UENg4OvLu3v43jnvS9GZ31j9a7?=
 =?us-ascii?Q?gF6ZizJF+xsMvFyOzvGuREp7HQyCAlwB0iPV/NArxvjztEvPcwKw8Aj2rsPL?=
 =?us-ascii?Q?eIUEbIQzGVBdnZAYttvXNHX8qppPHd2Uqqv8FzsqKpFHIs9S8OypS7QuHOxT?=
 =?us-ascii?Q?9DEDFxjngtjfTGI5PjrJLvS8hLH+6BHQsn5B2KszZ7F0P6sBMqjxZjJtKYcD?=
 =?us-ascii?Q?Sm3UmKRogImNA+mL3IjYJAsyDG/KMHUp/gBzXmGLi4boOBXHS6C++kxu1ZNl?=
 =?us-ascii?Q?SbvIzHS7UCt0Obct4t57vgeE8aOKY7A8Po6w0MA1jf77MEqWIAyWAKGohfm8?=
 =?us-ascii?Q?VnuDucZlk5pwhKx3rkhIHyFzXVCWbEsPNo71TVEyJgbxoKLgJ1nOdmvYf8li?=
 =?us-ascii?Q?2H3d2VpAmRnZXF7CYgXeZUn1wrQknQiX3vBmkqgbiBu4VqiuZ4/dbgWcCVjE?=
 =?us-ascii?Q?OBBp0Wa4OqrR3GYXAthYc0KtfcdFNIir9PlhffTA+NlqHwhd2CMiAfi034Kq?=
 =?us-ascii?Q?dg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66767795-6915-426d-c506-08dc70be9811
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 06:58:27.8225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qtvnSQuX/tle3sxdFxJQFy+KigL/S+a4V5XRTZyVh3o/2WvnoWtq8HnhWL1c2OEdbl6MmdFQR06MeoLSOKE0jh7Jwjt1Xt+5LA38HlVpR9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB2247

From: "Jackson.lee" <jackson.lee@chipsnmedia.com>

Use v4l2-common helper functions to calculate bytesperline and sizeimage,
instead of calculating in a wave5 driver directly.

In case of raw(YUV) v4l2_pix_format, the wave5 driver updates
v4l2_pix_format_mplane struct through v4l2_fill_pixfmt_mp() function.

Encoder and Decoder need same bytesperline and sizeimage values
for same v4l2_pix_format.
So, a wave5_update_pix_fmt is refactored to support both together.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../platform/chips-media/wave5/wave5-helper.c |  24 ++
 .../platform/chips-media/wave5/wave5-helper.h |   5 +
 .../chips-media/wave5/wave5-vpu-dec.c         | 296 ++++++------------
 .../chips-media/wave5/wave5-vpu-enc.c         | 197 +++++-------
 .../platform/chips-media/wave5/wave5-vpu.h    |   5 +-
 .../chips-media/wave5/wave5-vpuconfig.h       |  27 +-
 6 files changed, 236 insertions(+), 318 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-helper.c
index 7e0f34bfa5be..b20ab69cd341 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
@@ -7,6 +7,8 @@
 
 #include "wave5-helper.h"
 
+#define DEFAULT_BS_SIZE(width, height) ((width) * (height) / 8 * 3)
+
 const char *state_to_str(enum vpu_instance_state state)
 {
 	switch (state) {
@@ -224,3 +226,25 @@ void wave5_return_bufs(struct vb2_queue *q, u32 state)
 		v4l2_m2m_buf_done(vbuf, state);
 	}
 }
+
+void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
+			  int pix_fmt_type,
+			  unsigned int width,
+			  unsigned int height,
+			  const struct v4l2_frmsize_stepwise *frmsize)
+{
+	v4l2_apply_frmsize_constraints(&width, &height, frmsize);
+
+	if (pix_fmt_type == VPU_FMT_TYPE_CODEC) {
+		pix_mp->width = width;
+		pix_mp->height = height;
+		pix_mp->num_planes = 1;
+		pix_mp->plane_fmt[0].bytesperline = 0;
+		pix_mp->plane_fmt[0].sizeimage = max(DEFAULT_BS_SIZE(width, height),
+						     pix_mp->plane_fmt[0].sizeimage);
+	} else {
+		v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat, width, height);
+	}
+	pix_mp->flags = 0;
+	pix_mp->field = V4L2_FIELD_NONE;
+}
diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.h b/drivers/media/platform/chips-media/wave5/wave5-helper.h
index 6cee1c14d3ce..9937fce553fc 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.h
@@ -28,4 +28,9 @@ const struct vpu_format *wave5_find_vpu_fmt_by_idx(unsigned int idx,
 						   const struct vpu_format fmt_list[MAX_FMTS]);
 enum wave_std wave5_to_vpu_std(unsigned int v4l2_pix_fmt, enum vpu_instance_type type);
 void wave5_return_bufs(struct vb2_queue *q, u32 state);
+void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
+			  int pix_fmt_type,
+			  unsigned int width,
+			  unsigned int height,
+			  const struct v4l2_frmsize_stepwise *frmsize);
 #endif
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 861a0664047c..733c770fb049 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -11,111 +11,92 @@
 #define VPU_DEC_DEV_NAME "C&M Wave5 VPU decoder"
 #define VPU_DEC_DRV_NAME "wave5-dec"
 
-#define DEFAULT_SRC_SIZE(width, height) ({			\
-	(width) * (height) / 8 * 3;					\
-})
+static const struct v4l2_frmsize_stepwise dec_hevc_frmsize = {
+	.min_width = W5_MIN_DEC_PIC_8_WIDTH,
+	.max_width = W5_MAX_DEC_PIC_WIDTH,
+	.step_width = W5_DEC_CODEC_STEP_WIDTH,
+	.min_height = W5_MIN_DEC_PIC_8_HEIGHT,
+	.max_height = W5_MAX_DEC_PIC_HEIGHT,
+	.step_height = W5_DEC_CODEC_STEP_HEIGHT,
+};
+
+static const struct v4l2_frmsize_stepwise dec_h264_frmsize = {
+	.min_width = W5_MIN_DEC_PIC_32_WIDTH,
+	.max_width = W5_MAX_DEC_PIC_WIDTH,
+	.step_width = W5_DEC_CODEC_STEP_WIDTH,
+	.min_height = W5_MIN_DEC_PIC_32_HEIGHT,
+	.max_height = W5_MAX_DEC_PIC_HEIGHT,
+	.step_height = W5_DEC_CODEC_STEP_HEIGHT,
+};
+
+static const struct v4l2_frmsize_stepwise dec_raw_frmsize = {
+	.min_width = W5_MIN_DEC_PIC_8_WIDTH,
+	.max_width = W5_MAX_DEC_PIC_WIDTH,
+	.step_width = W5_DEC_RAW_STEP_WIDTH,
+	.min_height = W5_MIN_DEC_PIC_8_HEIGHT,
+	.max_height = W5_MAX_DEC_PIC_HEIGHT,
+	.step_height = W5_DEC_RAW_STEP_HEIGHT,
+};
 
 static const struct vpu_format dec_fmt_list[FMT_TYPES][MAX_FMTS] = {
 	[VPU_FMT_TYPE_CODEC] = {
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_HEVC,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_hevc_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_H264,
-			.max_width = 8192,
-			.min_width = 32,
-			.max_height = 4320,
-			.min_height = 32,
+			.v4l2_frmsize = &dec_h264_frmsize,
 		},
 	},
 	[VPU_FMT_TYPE_RAW] = {
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422P,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420M,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12M,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21M,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422M,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16M,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61M,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 	}
 };
@@ -234,74 +215,6 @@ static void wave5_handle_src_buffer(struct vpu_instance *inst, dma_addr_t rd_ptr
 	inst->remaining_consumed_bytes = consumed_bytes;
 }
 
-static void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp, unsigned int width,
-				 unsigned int height)
-{
-	switch (pix_mp->pixelformat) {
-	case V4L2_PIX_FMT_YUV420:
-	case V4L2_PIX_FMT_NV12:
-	case V4L2_PIX_FMT_NV21:
-		pix_mp->width = round_up(width, 32);
-		pix_mp->height = round_up(height, 16);
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = width * height * 3 / 2;
-		break;
-	case V4L2_PIX_FMT_YUV422P:
-	case V4L2_PIX_FMT_NV16:
-	case V4L2_PIX_FMT_NV61:
-		pix_mp->width = round_up(width, 32);
-		pix_mp->height = round_up(height, 16);
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = width * height * 2;
-		break;
-	case V4L2_PIX_FMT_YUV420M:
-		pix_mp->width = round_up(width, 32);
-		pix_mp->height = round_up(height, 16);
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = width * height;
-		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32) / 2;
-		pix_mp->plane_fmt[1].sizeimage = width * height / 4;
-		pix_mp->plane_fmt[2].bytesperline = round_up(width, 32) / 2;
-		pix_mp->plane_fmt[2].sizeimage = width * height / 4;
-		break;
-	case V4L2_PIX_FMT_NV12M:
-	case V4L2_PIX_FMT_NV21M:
-		pix_mp->width = round_up(width, 32);
-		pix_mp->height = round_up(height, 16);
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = width * height;
-		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[1].sizeimage = width * height / 2;
-		break;
-	case V4L2_PIX_FMT_YUV422M:
-		pix_mp->width = round_up(width, 32);
-		pix_mp->height = round_up(height, 16);
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = width * height;
-		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32) / 2;
-		pix_mp->plane_fmt[1].sizeimage = width * height / 2;
-		pix_mp->plane_fmt[2].bytesperline = round_up(width, 32) / 2;
-		pix_mp->plane_fmt[2].sizeimage = width * height / 2;
-		break;
-	case V4L2_PIX_FMT_NV16M:
-	case V4L2_PIX_FMT_NV61M:
-		pix_mp->width = round_up(width, 32);
-		pix_mp->height = round_up(height, 16);
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = width * height;
-		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[1].sizeimage = width * height;
-		break;
-	default:
-		pix_mp->width = width;
-		pix_mp->height = height;
-		pix_mp->plane_fmt[0].bytesperline = 0;
-		pix_mp->plane_fmt[0].sizeimage = max(DEFAULT_SRC_SIZE(width, height),
-						     pix_mp->plane_fmt[0].sizeimage);
-		break;
-	}
-}
-
 static int start_decode(struct vpu_instance *inst, u32 *fail_res)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
@@ -389,6 +302,8 @@ static int handle_dynamic_resolution_change(struct vpu_instance *inst)
 	}
 
 	if (p_dec_info->initial_info_obtained) {
+		const struct vpu_format *vpu_fmt;
+
 		inst->conf_win.left = initial_info->pic_crop_rect.left;
 		inst->conf_win.top = initial_info->pic_crop_rect.top;
 		inst->conf_win.width = initial_info->pic_width -
@@ -396,10 +311,27 @@ static int handle_dynamic_resolution_change(struct vpu_instance *inst)
 		inst->conf_win.height = initial_info->pic_height -
 			initial_info->pic_crop_rect.top - initial_info->pic_crop_rect.bottom;
 
-		wave5_update_pix_fmt(&inst->src_fmt, initial_info->pic_width,
-				     initial_info->pic_height);
-		wave5_update_pix_fmt(&inst->dst_fmt, initial_info->pic_width,
-				     initial_info->pic_height);
+		vpu_fmt = wave5_find_vpu_fmt(inst->src_fmt.pixelformat,
+				dec_fmt_list[VPU_FMT_TYPE_CODEC]);
+		if (!vpu_fmt)
+			return -EINVAL;
+
+		wave5_update_pix_fmt(&inst->src_fmt,
+					VPU_FMT_TYPE_CODEC,
+					initial_info->pic_width,
+					initial_info->pic_height,
+					vpu_fmt->v4l2_frmsize);
+
+		vpu_fmt = wave5_find_vpu_fmt(inst->dst_fmt.pixelformat,
+				dec_fmt_list[VPU_FMT_TYPE_RAW]);
+		if (!vpu_fmt)
+			return -EINVAL;
+
+		wave5_update_pix_fmt(&inst->dst_fmt,
+					VPU_FMT_TYPE_RAW,
+					initial_info->pic_width,
+					initial_info->pic_height,
+					vpu_fmt->v4l2_frmsize);
 	}
 
 	v4l2_event_queue_fh(fh, &vpu_event_src_ch);
@@ -548,12 +480,7 @@ static int wave5_vpu_dec_enum_framesizes(struct file *f, void *fh, struct v4l2_f
 	}
 
 	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
-	fsize->stepwise.min_width = vpu_fmt->min_width;
-	fsize->stepwise.max_width = vpu_fmt->max_width;
-	fsize->stepwise.step_width = 1;
-	fsize->stepwise.min_height = vpu_fmt->min_height;
-	fsize->stepwise.max_height = vpu_fmt->max_height;
-	fsize->stepwise.step_height = 1;
+	fsize->stepwise = *vpu_fmt->v4l2_frmsize;
 
 	return 0;
 }
@@ -589,14 +516,10 @@ static int wave5_vpu_dec_try_fmt_cap(struct file *file, void *fh, struct v4l2_fo
 		width = inst->dst_fmt.width;
 		height = inst->dst_fmt.height;
 		f->fmt.pix_mp.pixelformat = inst->dst_fmt.pixelformat;
-		f->fmt.pix_mp.num_planes = inst->dst_fmt.num_planes;
 	} else {
-		const struct v4l2_format_info *info = v4l2_format_info(vpu_fmt->v4l2_pix_fmt);
-
-		width = clamp(f->fmt.pix_mp.width, vpu_fmt->min_width, vpu_fmt->max_width);
-		height = clamp(f->fmt.pix_mp.height, vpu_fmt->min_height, vpu_fmt->max_height);
+		width = f->fmt.pix_mp.width;
+		height = f->fmt.pix_mp.height;
 		f->fmt.pix_mp.pixelformat = vpu_fmt->v4l2_pix_fmt;
-		f->fmt.pix_mp.num_planes = info->mem_planes;
 	}
 
 	if (p_dec_info->initial_info_obtained) {
@@ -604,9 +527,10 @@ static int wave5_vpu_dec_try_fmt_cap(struct file *file, void *fh, struct v4l2_fo
 		height = inst->dst_fmt.height;
 	}
 
-	wave5_update_pix_fmt(&f->fmt.pix_mp, width, height);
-	f->fmt.pix_mp.flags = 0;
-	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	wave5_update_pix_fmt(&f->fmt.pix_mp, VPU_FMT_TYPE_RAW,
+					     width,
+					     height,
+					     vpu_fmt->v4l2_frmsize);
 	f->fmt.pix_mp.colorspace = inst->colorspace;
 	f->fmt.pix_mp.ycbcr_enc = inst->ycbcr_enc;
 	f->fmt.pix_mp.quantization = inst->quantization;
@@ -719,6 +643,7 @@ static int wave5_vpu_dec_try_fmt_out(struct file *file, void *fh, struct v4l2_fo
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
 	const struct vpu_format *vpu_fmt;
+	int width, height;
 
 	dev_dbg(inst->dev->dev,
 		"%s: fourcc: %u width: %u height: %u num_planes: %u colorspace: %u field: %u\n",
@@ -727,20 +652,19 @@ static int wave5_vpu_dec_try_fmt_out(struct file *file, void *fh, struct v4l2_fo
 
 	vpu_fmt = wave5_find_vpu_fmt(f->fmt.pix_mp.pixelformat, dec_fmt_list[VPU_FMT_TYPE_CODEC]);
 	if (!vpu_fmt) {
+		width = inst->src_fmt.width;
+		height = inst->src_fmt.height;
 		f->fmt.pix_mp.pixelformat = inst->src_fmt.pixelformat;
-		f->fmt.pix_mp.num_planes = inst->src_fmt.num_planes;
-		wave5_update_pix_fmt(&f->fmt.pix_mp, inst->src_fmt.width, inst->src_fmt.height);
 	} else {
-		int width = clamp(f->fmt.pix_mp.width, vpu_fmt->min_width, vpu_fmt->max_width);
-		int height = clamp(f->fmt.pix_mp.height, vpu_fmt->min_height, vpu_fmt->max_height);
-
+		width = f->fmt.pix_mp.width;
+		height = f->fmt.pix_mp.height;
 		f->fmt.pix_mp.pixelformat = vpu_fmt->v4l2_pix_fmt;
-		f->fmt.pix_mp.num_planes = 1;
-		wave5_update_pix_fmt(&f->fmt.pix_mp, width, height);
 	}
 
-	f->fmt.pix_mp.flags = 0;
-	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	wave5_update_pix_fmt(&f->fmt.pix_mp, VPU_FMT_TYPE_CODEC,
+					     width,
+					     height,
+					     vpu_fmt->v4l2_frmsize);
 
 	return 0;
 }
@@ -748,6 +672,7 @@ static int wave5_vpu_dec_try_fmt_out(struct file *file, void *fh, struct v4l2_fo
 static int wave5_vpu_dec_s_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	const struct vpu_format *vpu_fmt;
 	int i, ret;
 
 	dev_dbg(inst->dev->dev,
@@ -782,7 +707,14 @@ static int wave5_vpu_dec_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 	inst->quantization = f->fmt.pix_mp.quantization;
 	inst->xfer_func = f->fmt.pix_mp.xfer_func;
 
-	wave5_update_pix_fmt(&inst->dst_fmt, f->fmt.pix_mp.width, f->fmt.pix_mp.height);
+	vpu_fmt = wave5_find_vpu_fmt(inst->dst_fmt.pixelformat, dec_fmt_list[VPU_FMT_TYPE_RAW]);
+	if (!vpu_fmt)
+		return -EINVAL;
+
+	wave5_update_pix_fmt(&inst->dst_fmt, VPU_FMT_TYPE_RAW,
+					     f->fmt.pix_mp.width,
+					     f->fmt.pix_mp.height,
+					     vpu_fmt->v4l2_frmsize);
 
 	return 0;
 }
@@ -1005,6 +937,7 @@ static int wave5_vpu_dec_queue_setup(struct vb2_queue *q, unsigned int *num_buff
 	struct vpu_instance *inst = vb2_get_drv_priv(q);
 	struct v4l2_pix_format_mplane inst_format =
 		(q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) ? inst->src_fmt : inst->dst_fmt;
+	unsigned int i;
 
 	dev_dbg(inst->dev->dev, "%s: num_buffers: %u | num_planes: %u | type: %u\n", __func__,
 		*num_buffers, *num_planes, q->type);
@@ -1018,31 +951,9 @@ static int wave5_vpu_dec_queue_setup(struct vb2_queue *q, unsigned int *num_buff
 		if (*num_buffers < inst->fbc_buf_count)
 			*num_buffers = inst->fbc_buf_count;
 
-		if (*num_planes == 1) {
-			if (inst->output_format == FORMAT_422)
-				sizes[0] = inst_format.width * inst_format.height * 2;
-			else
-				sizes[0] = inst_format.width * inst_format.height * 3 / 2;
-			dev_dbg(inst->dev->dev, "%s: size[0]: %u\n", __func__, sizes[0]);
-		} else if (*num_planes == 2) {
-			sizes[0] = inst_format.width * inst_format.height;
-			if (inst->output_format == FORMAT_422)
-				sizes[1] = inst_format.width * inst_format.height;
-			else
-				sizes[1] = inst_format.width * inst_format.height / 2;
-			dev_dbg(inst->dev->dev, "%s: size[0]: %u | size[1]: %u\n",
-				__func__, sizes[0], sizes[1]);
-		} else if (*num_planes == 3) {
-			sizes[0] = inst_format.width * inst_format.height;
-			if (inst->output_format == FORMAT_422) {
-				sizes[1] = inst_format.width * inst_format.height / 2;
-				sizes[2] = inst_format.width * inst_format.height / 2;
-			} else {
-				sizes[1] = inst_format.width * inst_format.height / 4;
-				sizes[2] = inst_format.width * inst_format.height / 4;
-			}
-			dev_dbg(inst->dev->dev, "%s: size[0]: %u | size[1]: %u | size[2]: %u\n",
-				__func__, sizes[0], sizes[1], sizes[2]);
+		for (i = 0; i < *num_planes; i++) {
+			sizes[i] = inst_format.plane_fmt[i].sizeimage;
+			dev_dbg(inst->dev->dev, "%s: size[%u]: %u\n", __func__, i, sizes[i]);
 		}
 	}
 
@@ -1564,20 +1475,17 @@ static const struct vb2_ops wave5_vpu_dec_vb2_ops = {
 static void wave5_set_default_format(struct v4l2_pix_format_mplane *src_fmt,
 				     struct v4l2_pix_format_mplane *dst_fmt)
 {
-	unsigned int dst_pix_fmt = dec_fmt_list[VPU_FMT_TYPE_RAW][0].v4l2_pix_fmt;
-	const struct v4l2_format_info *dst_fmt_info = v4l2_format_info(dst_pix_fmt);
-
 	src_fmt->pixelformat = dec_fmt_list[VPU_FMT_TYPE_CODEC][0].v4l2_pix_fmt;
-	src_fmt->field = V4L2_FIELD_NONE;
-	src_fmt->flags = 0;
-	src_fmt->num_planes = 1;
-	wave5_update_pix_fmt(src_fmt, 720, 480);
-
-	dst_fmt->pixelformat = dst_pix_fmt;
-	dst_fmt->field = V4L2_FIELD_NONE;
-	dst_fmt->flags = 0;
-	dst_fmt->num_planes = dst_fmt_info->mem_planes;
-	wave5_update_pix_fmt(dst_fmt, 736, 480);
+	wave5_update_pix_fmt(src_fmt, VPU_FMT_TYPE_CODEC,
+				      W5_DEF_DEC_PIC_WIDTH,
+				      W5_DEF_DEC_PIC_HEIGHT,
+				      &dec_hevc_frmsize);
+
+	dst_fmt->pixelformat = dec_fmt_list[VPU_FMT_TYPE_RAW][0].v4l2_pix_fmt;
+	wave5_update_pix_fmt(dst_fmt, VPU_FMT_TYPE_RAW,
+				      W5_DEF_DEC_PIC_WIDTH,
+				      W5_DEF_DEC_PIC_HEIGHT,
+				      &dec_raw_frmsize);
 }
 
 static int wave5_vpu_dec_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 703fd8d1c7da..75d230df45f6 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -11,65 +11,60 @@
 #define VPU_ENC_DEV_NAME "C&M Wave5 VPU encoder"
 #define VPU_ENC_DRV_NAME "wave5-enc"
 
+static const struct v4l2_frmsize_stepwise enc_frmsize[FMT_TYPES] = {
+	[VPU_FMT_TYPE_CODEC] = {
+		.min_width = W5_MIN_ENC_PIC_WIDTH,
+		.max_width = W5_MAX_ENC_PIC_WIDTH,
+		.step_width = W5_ENC_CODEC_STEP_WIDTH,
+		.min_height = W5_MIN_ENC_PIC_HEIGHT,
+		.max_height = W5_MAX_ENC_PIC_HEIGHT,
+		.step_height = W5_ENC_CODEC_STEP_HEIGHT,
+	},
+	[VPU_FMT_TYPE_RAW] = {
+		.min_width = W5_MIN_ENC_PIC_WIDTH,
+		.max_width = W5_MAX_ENC_PIC_WIDTH,
+		.step_width = W5_ENC_RAW_STEP_WIDTH,
+		.min_height = W5_MIN_ENC_PIC_HEIGHT,
+		.max_height = W5_MAX_ENC_PIC_HEIGHT,
+		.step_height = W5_ENC_RAW_STEP_HEIGHT,
+	},
+};
+
 static const struct vpu_format enc_fmt_list[FMT_TYPES][MAX_FMTS] = {
 	[VPU_FMT_TYPE_CODEC] = {
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_HEVC,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_CODEC],
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_H264,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_CODEC],
 		},
 	},
 	[VPU_FMT_TYPE_RAW] = {
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420M,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12M,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21M,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
 	}
 };
@@ -106,46 +101,6 @@ static int switch_state(struct vpu_instance *inst, enum vpu_instance_state state
 	return -EINVAL;
 }
 
-static void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp, unsigned int width,
-				 unsigned int height)
-{
-	switch (pix_mp->pixelformat) {
-	case V4L2_PIX_FMT_YUV420:
-	case V4L2_PIX_FMT_NV12:
-	case V4L2_PIX_FMT_NV21:
-		pix_mp->width = width;
-		pix_mp->height = height;
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = round_up(width, 32) * height * 3 / 2;
-		break;
-	case V4L2_PIX_FMT_YUV420M:
-		pix_mp->width = width;
-		pix_mp->height = height;
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = round_up(width, 32) * height;
-		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32) / 2;
-		pix_mp->plane_fmt[1].sizeimage = round_up(width, 32) * height / 4;
-		pix_mp->plane_fmt[2].bytesperline = round_up(width, 32) / 2;
-		pix_mp->plane_fmt[2].sizeimage = round_up(width, 32) * height / 4;
-		break;
-	case V4L2_PIX_FMT_NV12M:
-	case V4L2_PIX_FMT_NV21M:
-		pix_mp->width = width;
-		pix_mp->height = height;
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = round_up(width, 32) * height;
-		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[1].sizeimage = round_up(width, 32) * height / 2;
-		break;
-	default:
-		pix_mp->width = width;
-		pix_mp->height = height;
-		pix_mp->plane_fmt[0].bytesperline = 0;
-		pix_mp->plane_fmt[0].sizeimage = width * height / 8 * 3;
-		break;
-	}
-}
-
 static int start_encode(struct vpu_instance *inst, u32 *fail_res)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
@@ -360,13 +315,8 @@ static int wave5_vpu_enc_enum_framesizes(struct file *f, void *fh, struct v4l2_f
 			return -EINVAL;
 	}
 
-	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
-	fsize->stepwise.min_width = vpu_fmt->min_width;
-	fsize->stepwise.max_width = vpu_fmt->max_width;
-	fsize->stepwise.step_width = 1;
-	fsize->stepwise.min_height = vpu_fmt->min_height;
-	fsize->stepwise.max_height = vpu_fmt->max_height;
-	fsize->stepwise.step_height = 1;
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise = enc_frmsize[VPU_FMT_TYPE_CODEC];
 
 	return 0;
 }
@@ -392,6 +342,7 @@ static int wave5_vpu_enc_try_fmt_cap(struct file *file, void *fh, struct v4l2_fo
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
 	const struct vpu_format *vpu_fmt;
+	int width, height;
 
 	dev_dbg(inst->dev->dev, "%s: fourcc: %u width: %u height: %u num_planes: %u field: %u\n",
 		__func__, f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pix_mp.height,
@@ -399,20 +350,19 @@ static int wave5_vpu_enc_try_fmt_cap(struct file *file, void *fh, struct v4l2_fo
 
 	vpu_fmt = wave5_find_vpu_fmt(f->fmt.pix_mp.pixelformat, enc_fmt_list[VPU_FMT_TYPE_CODEC]);
 	if (!vpu_fmt) {
+		width = inst->dst_fmt.width;
+		height = inst->dst_fmt.height;
 		f->fmt.pix_mp.pixelformat = inst->dst_fmt.pixelformat;
-		f->fmt.pix_mp.num_planes = inst->dst_fmt.num_planes;
-		wave5_update_pix_fmt(&f->fmt.pix_mp, inst->dst_fmt.width, inst->dst_fmt.height);
 	} else {
-		int width = clamp(f->fmt.pix_mp.width, vpu_fmt->min_width, vpu_fmt->max_width);
-		int height = clamp(f->fmt.pix_mp.height, vpu_fmt->min_height, vpu_fmt->max_height);
-
+		width = f->fmt.pix_mp.width;
+		height = f->fmt.pix_mp.height;
 		f->fmt.pix_mp.pixelformat = vpu_fmt->v4l2_pix_fmt;
-		f->fmt.pix_mp.num_planes = 1;
-		wave5_update_pix_fmt(&f->fmt.pix_mp, width, height);
 	}
 
-	f->fmt.pix_mp.flags = 0;
-	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	wave5_update_pix_fmt(&f->fmt.pix_mp, VPU_FMT_TYPE_CODEC,
+					     width,
+					     height,
+					     vpu_fmt->v4l2_frmsize);
 	f->fmt.pix_mp.colorspace = inst->colorspace;
 	f->fmt.pix_mp.ycbcr_enc = inst->ycbcr_enc;
 	f->fmt.pix_mp.quantization = inst->quantization;
@@ -500,6 +450,7 @@ static int wave5_vpu_enc_try_fmt_out(struct file *file, void *fh, struct v4l2_fo
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
 	const struct vpu_format *vpu_fmt;
+	int width, height;
 
 	dev_dbg(inst->dev->dev, "%s: fourcc: %u width: %u height: %u num_planes: %u field: %u\n",
 		__func__, f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pix_mp.height,
@@ -507,21 +458,19 @@ static int wave5_vpu_enc_try_fmt_out(struct file *file, void *fh, struct v4l2_fo
 
 	vpu_fmt = wave5_find_vpu_fmt(f->fmt.pix_mp.pixelformat, enc_fmt_list[VPU_FMT_TYPE_RAW]);
 	if (!vpu_fmt) {
+		width = inst->src_fmt.width;
+		height = inst->src_fmt.height;
 		f->fmt.pix_mp.pixelformat = inst->src_fmt.pixelformat;
-		f->fmt.pix_mp.num_planes = inst->src_fmt.num_planes;
-		wave5_update_pix_fmt(&f->fmt.pix_mp, inst->src_fmt.width, inst->src_fmt.height);
 	} else {
-		int width = clamp(f->fmt.pix_mp.width, vpu_fmt->min_width, vpu_fmt->max_width);
-		int height = clamp(f->fmt.pix_mp.height, vpu_fmt->min_height, vpu_fmt->max_height);
-		const struct v4l2_format_info *info = v4l2_format_info(vpu_fmt->v4l2_pix_fmt);
-
+		width = f->fmt.pix_mp.width;
+		height = f->fmt.pix_mp.height;
 		f->fmt.pix_mp.pixelformat = vpu_fmt->v4l2_pix_fmt;
-		f->fmt.pix_mp.num_planes = info->mem_planes;
-		wave5_update_pix_fmt(&f->fmt.pix_mp, width, height);
 	}
 
-	f->fmt.pix_mp.flags = 0;
-	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	wave5_update_pix_fmt(&f->fmt.pix_mp, VPU_FMT_TYPE_RAW,
+					     width,
+					     height,
+					     vpu_fmt->v4l2_frmsize);
 
 	return 0;
 }
@@ -529,6 +478,7 @@ static int wave5_vpu_enc_try_fmt_out(struct file *file, void *fh, struct v4l2_fo
 static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	const struct vpu_format *vpu_fmt;
 	int i, ret;
 
 	dev_dbg(inst->dev->dev, "%s: fourcc: %u width: %u height: %u num_planes: %u field: %u\n",
@@ -568,7 +518,16 @@ static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 	inst->quantization = f->fmt.pix_mp.quantization;
 	inst->xfer_func = f->fmt.pix_mp.xfer_func;
 
-	wave5_update_pix_fmt(&inst->dst_fmt, f->fmt.pix_mp.width, f->fmt.pix_mp.height);
+	vpu_fmt = wave5_find_vpu_fmt(inst->dst_fmt.pixelformat, enc_fmt_list[VPU_FMT_TYPE_CODEC]);
+	if (!vpu_fmt)
+		return -EINVAL;
+
+	wave5_update_pix_fmt(&inst->dst_fmt, VPU_FMT_TYPE_CODEC,
+					     f->fmt.pix_mp.width,
+					     f->fmt.pix_mp.height,
+					     vpu_fmt->v4l2_frmsize);
+	inst->conf_win.width = inst->dst_fmt.width;
+	inst->conf_win.height = inst->dst_fmt.height;
 
 	return 0;
 }
@@ -584,12 +543,17 @@ static int wave5_vpu_enc_g_selection(struct file *file, void *fh, struct v4l2_se
 	switch (s->target) {
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 	case V4L2_SEL_TGT_CROP_BOUNDS:
-	case V4L2_SEL_TGT_CROP:
 		s->r.left = 0;
 		s->r.top = 0;
 		s->r.width = inst->dst_fmt.width;
 		s->r.height = inst->dst_fmt.height;
 		break;
+	case V4L2_SEL_TGT_CROP:
+		s->r.left = 0;
+		s->r.top = 0;
+		s->r.width = inst->conf_win.width;
+		s->r.height = inst->conf_win.height;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -612,8 +576,10 @@ static int wave5_vpu_enc_s_selection(struct file *file, void *fh, struct v4l2_se
 
 	s->r.left = 0;
 	s->r.top = 0;
-	s->r.width = inst->src_fmt.width;
-	s->r.height = inst->src_fmt.height;
+	s->r.width = min(s->r.width, inst->dst_fmt.width);
+	s->r.height = min(s->r.height, inst->dst_fmt.height);
+
+	inst->conf_win = s->r;
 
 	return 0;
 }
@@ -1151,8 +1117,8 @@ static void wave5_set_enc_openparam(struct enc_open_param *open_param,
 	open_param->wave_param.lambda_scaling_enable = 1;
 
 	open_param->line_buf_int_en = true;
-	open_param->pic_width = inst->dst_fmt.width;
-	open_param->pic_height = inst->dst_fmt.height;
+	open_param->pic_width = inst->conf_win.width;
+	open_param->pic_height = inst->conf_win.height;
 	open_param->frame_rate_info = inst->frame_rate;
 	open_param->rc_enable = inst->rc_enable;
 	if (inst->rc_enable) {
@@ -1456,20 +1422,17 @@ static const struct vb2_ops wave5_vpu_enc_vb2_ops = {
 static void wave5_set_default_format(struct v4l2_pix_format_mplane *src_fmt,
 				     struct v4l2_pix_format_mplane *dst_fmt)
 {
-	unsigned int src_pix_fmt = enc_fmt_list[VPU_FMT_TYPE_RAW][0].v4l2_pix_fmt;
-	const struct v4l2_format_info *src_fmt_info = v4l2_format_info(src_pix_fmt);
-
-	src_fmt->pixelformat = src_pix_fmt;
-	src_fmt->field = V4L2_FIELD_NONE;
-	src_fmt->flags = 0;
-	src_fmt->num_planes = src_fmt_info->mem_planes;
-	wave5_update_pix_fmt(src_fmt, 416, 240);
+	src_fmt->pixelformat = enc_fmt_list[VPU_FMT_TYPE_RAW][0].v4l2_pix_fmt;
+	wave5_update_pix_fmt(src_fmt, VPU_FMT_TYPE_RAW,
+				      W5_DEF_ENC_PIC_WIDTH,
+				      W5_DEF_ENC_PIC_HEIGHT,
+				      &enc_frmsize[VPU_FMT_TYPE_RAW]);
 
 	dst_fmt->pixelformat = enc_fmt_list[VPU_FMT_TYPE_CODEC][0].v4l2_pix_fmt;
-	dst_fmt->field = V4L2_FIELD_NONE;
-	dst_fmt->flags = 0;
-	dst_fmt->num_planes = 1;
-	wave5_update_pix_fmt(dst_fmt, 416, 240);
+	wave5_update_pix_fmt(dst_fmt, VPU_FMT_TYPE_CODEC,
+				      W5_DEF_ENC_PIC_WIDTH,
+				      W5_DEF_ENC_PIC_HEIGHT,
+				      &enc_frmsize[VPU_FMT_TYPE_CODEC]);
 }
 
 static int wave5_vpu_enc_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
@@ -1733,6 +1696,8 @@ static int wave5_vpu_open_enc(struct file *filp)
 	v4l2_ctrl_handler_setup(v4l2_ctrl_hdl);
 
 	wave5_set_default_format(&inst->src_fmt, &inst->dst_fmt);
+	inst->conf_win.width = inst->dst_fmt.width;
+	inst->conf_win.height = inst->dst_fmt.height;
 	inst->colorspace = V4L2_COLORSPACE_REC709;
 	inst->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
 	inst->quantization = V4L2_QUANTIZATION_DEFAULT;
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.h b/drivers/media/platform/chips-media/wave5/wave5-vpu.h
index 32b7fd3730b5..3847332551fc 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.h
@@ -38,10 +38,7 @@ enum vpu_fmt_type {
 
 struct vpu_format {
 	unsigned int v4l2_pix_fmt;
-	unsigned int max_width;
-	unsigned int min_width;
-	unsigned int max_height;
-	unsigned int min_height;
+	const struct v4l2_frmsize_stepwise *v4l2_frmsize;
 };
 
 static inline struct vpu_instance *wave5_to_vpu_inst(struct v4l2_fh *vfh)
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h b/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
index d9751eedb0f9..8e11d93ca38f 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
@@ -30,10 +30,29 @@
 
 #define MAX_NUM_INSTANCE                32
 
-#define W5_MIN_ENC_PIC_WIDTH            256
-#define W5_MIN_ENC_PIC_HEIGHT           128
-#define W5_MAX_ENC_PIC_WIDTH            8192
-#define W5_MAX_ENC_PIC_HEIGHT           8192
+#define W5_DEF_DEC_PIC_WIDTH            720U
+#define W5_DEF_DEC_PIC_HEIGHT           480U
+#define W5_MIN_DEC_PIC_8_WIDTH          8U
+#define W5_MIN_DEC_PIC_8_HEIGHT         8U
+#define W5_MIN_DEC_PIC_32_WIDTH         32U
+#define W5_MIN_DEC_PIC_32_HEIGHT        32U
+#define W5_MAX_DEC_PIC_WIDTH            8192U
+#define W5_MAX_DEC_PIC_HEIGHT           4320U
+#define W5_DEC_CODEC_STEP_WIDTH         1U
+#define W5_DEC_CODEC_STEP_HEIGHT        1U
+#define W5_DEC_RAW_STEP_WIDTH           32U
+#define W5_DEC_RAW_STEP_HEIGHT          16U
+
+#define W5_DEF_ENC_PIC_WIDTH            416U
+#define W5_DEF_ENC_PIC_HEIGHT           240U
+#define W5_MIN_ENC_PIC_WIDTH            256U
+#define W5_MIN_ENC_PIC_HEIGHT           128U
+#define W5_MAX_ENC_PIC_WIDTH            8192U
+#define W5_MAX_ENC_PIC_HEIGHT           8192U
+#define W5_ENC_CODEC_STEP_WIDTH         8U
+#define W5_ENC_CODEC_STEP_HEIGHT        8U
+#define W5_ENC_RAW_STEP_WIDTH           32U
+#define W5_ENC_RAW_STEP_HEIGHT          16U
 
 //  application specific configuration
 #define VPU_ENC_TIMEOUT                 60000
-- 
2.43.0


