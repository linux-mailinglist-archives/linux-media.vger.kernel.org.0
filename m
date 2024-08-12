Return-Path: <linux-media+bounces-16100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2516894E696
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 08:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 642A7B21BAD
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 06:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6401509A0;
	Mon, 12 Aug 2024 06:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="TZVJBcmG"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020119.outbound.protection.outlook.com [52.101.156.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6398714EC4C;
	Mon, 12 Aug 2024 06:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723444177; cv=fail; b=L6ZYnAN4c39a2vzaloVwUH/AL13/0ZboOleX45iPrqSFE046VvqkJ89GsxojhcLM5kXy9y85Kjr/4JN+5pDICBgCwGv0RVyvhqyvxISfvc/3zkLxZiEmUjSFCTnL77qu0FzCMuHI9B1UUwxIYVXKlSjS3aXYjERk/95t2Moi5JU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723444177; c=relaxed/simple;
	bh=UiTOsuIPdnjFiy25DGycvOoGT0s1iFeQjnnlxcQCqy0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LRo/tAezfMNIF43410TxDcHK9RxeRbgRz/Jw3YFwv1DJlQ2jdlotpjtutIgoRYN8mPbsUQy1f/ahtW7FgcjU+6J8lvsa6lzo4XWO83HCK89HlQf1FEcNEXER7RB8O768X+KZ3WpjpvyI8aizoztJePiGGugoVH/1F3XxmTjvNlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=TZVJBcmG; arc=fail smtp.client-ip=52.101.156.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D1q59LUIwziAYptdqRhrM60CFmGnXrv5iUXlAH1hSEOTpnMQMNPLbmCQYLGAdGy97D/mBqPef8N4r2hhjU0W6JQCdcNwlsbKrUWZIgdqQbJkKdMqPncKZFBxsCqftxiLRfOMS1Az0/lGd9NPPEFXQl+7XZry7iz4okWnOye7sSDD4nrMfItm/kYbYpeTKpqxKaXtb8Px8HVUdQgR6N0b47SUm9NH8yfXCQy0LaSBnNUqq3tQH4ivQYKqXPvaE4umuzBzVx4QYS69AkMp4KCf4s5u0+gOOANMHKX9cPpyQ3VpFGgHkEYhZ4VyWSf3qzZ+l2TbwqK6D/YCcBtWcsEfHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jo09o0f7cArhs9nmYI/Ipzy2U9tnqhbP6xrDVuSq5UU=;
 b=l977/YEY4SJ5SKFb7YHtq+WivAIsFXbGvT6keaDkpOjt3KJ6OHzbapxBjq5M7pU2iuJbazGuqeZbjo9jAu/dLxul7ZjuKipVv1EqAY9ea5aRMyHgrVlyjpV058VwFtfXOwejB644NRaJgeB3PnUGc7HnhqM6k1lgBNTww2tUWdchugX1v3IFsoEIRP7PtKOghGe91ohvHH7vp9Kq9u/ASkVmS1B0j3UzgE2eUBmHcK8CKkbR6N1Bggz0+1XS0T/F0BZJyyxbcfdaaU0tDjAIBey7LmYBKcECq2CiiPc90P/Rtqyod+SBeHij0CPWS3Khpb+nep2Mx/iF5CQBF8CHyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jo09o0f7cArhs9nmYI/Ipzy2U9tnqhbP6xrDVuSq5UU=;
 b=TZVJBcmGtysyePzS9+vmhdmwjeQxEDwBP4Y6oNIO53ze7udvaZm4izlZCAQ5e7QFMf7Lj4TerMpWOfviaDsPsBnD1GhtS1uXZpQG8D2xTdosKhk5XfLld0GmY4DVP8faCV/0RBRjeGFBUdGSi4Tsopv6khvpFAMPfLAdKxpNOtA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PU4P216MB1820.KORP216.PROD.OUTLOOK.COM (2603:1096:301:10a::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.20; Mon, 12 Aug 2024 06:29:30 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%7]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 06:29:30 +0000
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
Subject: [PATCH v7 4/4] media: chips-media: wave5: Support YUV422 raw pixel-formats on the encoder.
Date: Mon, 12 Aug 2024 15:29:19 +0900
Message-Id: <20240812062919.78-5-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812062919.78-1-jackson.lee@chipsnmedia.com>
References: <20240812062919.78-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0044.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::11) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|PU4P216MB1820:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ecd6be-7308-4a18-e2eb-08dcba981f5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ezaOQYpAA0kGWgIQsS2fUrTDH5J1aZafntAr+cyF6KATs330GcQU1AYXJF3h?=
 =?us-ascii?Q?362gp+3ZEZGR1DWSM7d+/6OkvmD/BWCryQ3kxXinEXnMaUYY9/my9M5TShkW?=
 =?us-ascii?Q?VUTEK5nfKiMipHROPrRMAqgsQXtEnPA09bXI9ia51V1fZANx0tqOuKuVpaBc?=
 =?us-ascii?Q?3hK34NXOaF5gei6vZFNhz1i/OGnmeUs63yZu+PDv6ZaDgkRUTaWxQCZmJiHL?=
 =?us-ascii?Q?U8fsMR6WTs8WGbOt6N0/1W9WSmwO+AM28AtfE91gASqYwS5KeULADoQ6Xv4K?=
 =?us-ascii?Q?GtG733R4rI+I77ogH26n5sh5brGtJ2R5vpM62UrPd1xRkBQx/3MNTPHxvdmZ?=
 =?us-ascii?Q?sqaWlZa4XHCN3y9CicuYEkx5LrpJ/yE2Lou45nQCZVFIf0WAU2IR+kODl2yj?=
 =?us-ascii?Q?RK0o8qwTW7vbXga8RGWJCf1zm770N8syjWtc37no3R4rtusd1ak0bxWYMyen?=
 =?us-ascii?Q?SLIxadUy7AU1CrGXlP6BmWodh8z7+Ep6hdRgePFJw6y/KM6ont4CeUQIoVO8?=
 =?us-ascii?Q?kfLg14ZuFjRq3/tmCY0PMOkksUuHDLAiit+Uj4mA1PzebModB1SxVs8ZUug3?=
 =?us-ascii?Q?IfIzyW0PWIQHIn0jpsEx4F1096aMKlZX0nBs8xSNCG3+TTwPfKvAw0y8EABZ?=
 =?us-ascii?Q?FZo53XW2Jj+IbbwKtlK5rDldS0l2SvS2SJu9U05hE1qvHZtC9gIrjt+xwpBA?=
 =?us-ascii?Q?ptScMVkIEWc0PrCt2ICYji0lnuiCLPJhGZaHPMVywV4iDa+hwbdNuTlA19xi?=
 =?us-ascii?Q?JcE4S95SpmLNB0QsQpLSoi4LNqePCUeph7dP865/+m+b95bFDgrXEct4ECLt?=
 =?us-ascii?Q?WyY0CG9aosbPzPZEbVFXyxrRGu5fheK5MWdV1sKYaJDAfB1vNwYTwM3l/flG?=
 =?us-ascii?Q?1ckiHHpnmzy3iRoNCe1pAR/kGZ7b3mc+cqeH8dcXHiSbNZE3c+kdrx5IJHYA?=
 =?us-ascii?Q?QbgDzdXICrkfeXtG+QHyiVj0XnyTmfe9samOmgvWxfn1/ozAIHjGXWSlajPf?=
 =?us-ascii?Q?yF77arVtg13UeQRwI1WRqPuoVVKooA/B0yAUPqAN84yZlqX9tvUkPoOUC0SA?=
 =?us-ascii?Q?7b1ljwfVwBJvTKmi0suR6S5GPmgrXST2eIHPjbcCFnOocpklr1xOiji2wnJc?=
 =?us-ascii?Q?NLYaC8nwm2XA7iAnNqcq1DkJl8TvBtnC2sltJeg5435czAblh5w8ctl45Y/s?=
 =?us-ascii?Q?ZGBrdkiRV0KZ8KigVLSTTrPTfYYA7gBAt/uNFvorQerYp5CQu4DtiGzabZU6?=
 =?us-ascii?Q?40U3n4YHQ+7Vy0i68oiV0ISEJiyV5fO5YSGrrPf0oLgKWagdDrIYPmbxuxiP?=
 =?us-ascii?Q?mnK2vL5GVxktqGaEuBgT5LSXf61Y/7JGgxl+g5OTtp6Ry9yTI9GZmKuI8JPk?=
 =?us-ascii?Q?+q5Z3UIoZF5bO2T6SSBLymfSpONCSmalF/lIc8cLUx95yoT1ag=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VAETeMK1vkV1wwwdAUP3WUmISaeKOXF5hl+EI4+2Q0ek68ctmjJey1e7/xYl?=
 =?us-ascii?Q?hdrvIp6fVlStKq1wJDCEAd728ApW1eeE53VNkeY9DYuokw/Qv4xHWM3fHB4u?=
 =?us-ascii?Q?x0KZRaZFTK6VxBpkloccqLSmJdAQncRcWKL1dcOzplZ9CxKtk8WQbEz7isUG?=
 =?us-ascii?Q?n6pP5C01Gh8ua2K33r4W1k6eakAP21yM6R/QXS+EjNO9NmJv/G8mz6f62IBE?=
 =?us-ascii?Q?vN2F97mVUOirFXIvqq6TVfVALd8uxSbU5StZDWu+OGrC3siC/TGoVEXzTao9?=
 =?us-ascii?Q?MN8njvRzfqNn6lcsB70fquOFpTpAxvNx47GxcmdTRUwgl29Qh8LDL8DTGrSp?=
 =?us-ascii?Q?+1GcTwZ14IHS+pZj18rBtm9txWeG4M9IAr/9iI8jV3w07TbPnYLX+9QImCyD?=
 =?us-ascii?Q?h/vsQ1gmUfVy4UtUYGi+Zl5qm33Ctoqga6RNUt2yWja0RSpdTPuXLR/A8yhv?=
 =?us-ascii?Q?vhqEESrd9ESiK5Xg3yrlsvpRMkx3i+BtuzT8XHSS9wptJov3SlqLGQ4DFEBw?=
 =?us-ascii?Q?n4RoNkRuqO8/le3rSKuOClPA2x3tXAohZZrB7O/ik0Knt3xl+aRZTjCgbgBb?=
 =?us-ascii?Q?Q5njJ5BNaKrOV2pZy8R0qFObXcVB1+kc3Wq6xv5kyJH/jbKej8yEXc952zI8?=
 =?us-ascii?Q?p19mgPYSy5ETxSiUPs37t2EzFqtj7KOCR0pOFu31Ba5uajsQ3VlzeH+33v4f?=
 =?us-ascii?Q?GlTqRLru7qodRQN/WOKKHBWATmfcvSZQHFlwCcEwP+yv7C0HKDn93bxn70kh?=
 =?us-ascii?Q?v2e9uVqasxRrB6bgcv7UfQmT9xtbimE/5WvzZKxCooRDxgLNMM7f0b6kpDQ1?=
 =?us-ascii?Q?5/8XQequxmIVue7V0BAjxBUVCJF2y9Rl2JK0wQFmKW5+y7hvsrJLs/WYrtFM?=
 =?us-ascii?Q?wGicG8UcdThUDIdrSGEiBE9LVpBjfAdnpSZnP4Xv20NXFUq0stTDBT+7P+bK?=
 =?us-ascii?Q?8jG6Dn5OYfJ7VI1v0HDK4Ligebjymt0ZwAcjBBe2jnJn68iwNsp1ODt4KfkP?=
 =?us-ascii?Q?Ddv7dEC/C35zC84LlQ4s6t7lRVzLcjGH6U7cbqjLBpURrxf4ebA9SMbXt5aN?=
 =?us-ascii?Q?sK8v4jTjEP9dgqFs4JNmi539O2JzrcF2hsqT5AIq/8fyRoH6BTWCArmhgs1O?=
 =?us-ascii?Q?eDO9BCD5s7l3cv65wHbMEcqFCzkI0GJTLTF+o7EI7tcrQh3WbPAgdjvmvdAl?=
 =?us-ascii?Q?s4Vkl9IhCb36shAsSnTPLFpLvtuzUTDmPvTm8IJIdv2m28m1YhVMDciGpp60?=
 =?us-ascii?Q?jM7VRTsEbybu39J/fpkYMCer5HeEbRCI5+jL8mecUstIzy1IpfeHgCxqO/b+?=
 =?us-ascii?Q?0B4AkxAW35H9y+7lgaJ/7TMrkSYJHB4I1PquzajUilI3OlAHmpmnmCwA2kc4?=
 =?us-ascii?Q?DG4+0ojaC1GL4p05rv9e0uRsDu2a77ZdkM4z7ri1QsoT64xZE9moZCH+ezKE?=
 =?us-ascii?Q?FAAavPVfRQDDVHvAjf/vbBj6lXJqduPkPYnTA3MFleS+Wtf8N+0S4f6l5H/I?=
 =?us-ascii?Q?joXVGlWLGvdwy0trynYQtylMeMB7MY3gxBEqMzkoXOK5rRPXIqriJrW6xcND?=
 =?us-ascii?Q?FBN5lyVncmZ/SixJ/dD3WQPkKb0hnjc1uOea9M/DMDFsyYybp2gUy76+Lk4W?=
 =?us-ascii?Q?Ww=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ecd6be-7308-4a18-e2eb-08dcba981f5c
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 06:29:30.4611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vDAXNhe058SEoIlARkU7Fc5hsG2gadU21D2Z0xVUbsiVU3Vmn9Un/zjsNQzlYjLdkvEX/yfrWtC4yvZ6JX1718yAIgrvTd9AWFPMWnRuH3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1820

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
index ef9aa1562346..4e1c8a4e7272 100644
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


