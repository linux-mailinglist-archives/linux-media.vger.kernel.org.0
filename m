Return-Path: <linux-media+bounces-45196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A42A0BFAA90
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 09:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33FFE421C7C
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 07:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5456E2FD678;
	Wed, 22 Oct 2025 07:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="G+Pq657s"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020102.outbound.protection.outlook.com [52.101.156.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8202FCBF0;
	Wed, 22 Oct 2025 07:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761119249; cv=fail; b=eqejVI+fK8HkB9e1pvHWD/U7U8rPzh2s7j1RF38wmpBeWHMFRUwrmaz7syoMsohAz+2RqcGejVILbA0YYuLaOoV9C/vcI+2TaxSSP2tbN19MYX0uQS8qAKWynVzEddXH4BzmbaUnXhMAzYwwuXkqxKxzWEsniq9utMVypaFryrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761119249; c=relaxed/simple;
	bh=KVqulRP9bSxsFkm/ZvU6MXv8jbeaVeeKlz0gnUy3F5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f05StTy0EyN7PNzqR3/ue9zt7DYRuvtRkoRF+HlnliLZUzutJGOu7MQrI1icEQ5OhtyDwwdvFvqsaHrXyTKUKofz3BYUV+b2jh1HzZJVgXsPIH6i+F+XNqBQYmG7DkR4FEaP3QFdqQY3xcNh9wAPQOx0KgCKkLRp5vOQAopG5kA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=G+Pq657s; arc=fail smtp.client-ip=52.101.156.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LeUrJcB2+3IBeE+1HzXmAdiULiS+7XS3qEJyNKSrlRZbQxrZmlZKeVZrldj7oLHLeeF5KQnnn/HDmEtxERQoUQ5TWKlxt/VtBkqAYTp220C3LcMLuuAIaV1w4byKgqEzez711ychKoN+et0Ejv6AQqUcTwIuNR/ICcej0ZeWZ44zyDeWfPFYEYLRVrvCSTnTiapEXhmTqvRj3cPzb6bKSDaYuQ+NbB0bwKgnY7vHtZW49w7zQiHgEB/GXLo6plVYmx+ClnM49NPnSS7LwJ9XQ93HrqmKHzobZtnRU6osMNUdB/tokEQpJcPvRyCbdSpl9tainyzBVw3QjidWMpDPzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/DKkG90BbQkouaMP/Jd+T8itnSg3CONqwfyjq6p7D4=;
 b=VeJiLgItONc3KwiOeFP/ONhSqFhurC3XHPap1XneI46GnaCDk5tIBDyuT01m5mAFS5L21OXYTiDgvd+ulCzlKKEsLPjOjmhmkKP20K6+BeMScL2MPsLAs8haa0y4zV9jlE6lIdmba5dDgu7cSUrnT0QjL8xQyj7YSd41UileeUKvt3tvlLVBJTg87v22bStqGMzAUOpLGacxft5xACmiYs6DwkPyc9fUsPovton9wCWydhVzaU/KdHmrRTvsfYYyMA3Vfk8AFq7fO8eEGfzsTbzMUOYzVSBGXYd88k6tqbMXNCcVrYwUciNOWYEn+pwdJdk2DCksOG4HHwVyw9UmAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/DKkG90BbQkouaMP/Jd+T8itnSg3CONqwfyjq6p7D4=;
 b=G+Pq657sveE58MbzM91u3qYxAn2Flo34W9Jrr5koazqqQdZs8fOthk4CpFb31AuM5qMkYdZ9LLf4/Zsg3KjINTcIxBXhYACAP5qZQ1mlU9ndOb5xRjAImQwfjuN9x20GYPei45dJLaZbih1ImSGaTOVrZjRA5JeapRMwueEFPho=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SE2P216MB3135.KORP216.PROD.OUTLOOK.COM (2603:1096:101:28c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.12; Wed, 22 Oct 2025 07:47:24 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9228.009; Wed, 22 Oct 2025
 07:47:24 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v4 1/9] media: v4l2-common: Add YUV24 format info
Date: Wed, 22 Oct 2025 16:47:02 +0900
Message-Id: <20251022074710.575-2-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251022074710.575-1-nas.chung@chipsnmedia.com>
References: <20251022074710.575-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0122.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::6) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|SE2P216MB3135:EE_
X-MS-Office365-Filtering-Correlation-Id: 239fbdfb-2696-4efe-8823-08de113f3d53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lehLUspaWJdHfh6FlDJ6VNZfnNqYSd/teFJDkMvLtp/BvUCQjEzhzY6Uix1x?=
 =?us-ascii?Q?IcGnPLtpABTS2oWWQNOckQvHi3dBikBd/TxGVo7AHk7LQvsxbBob700JPvde?=
 =?us-ascii?Q?LWKn9KpoorKBbr/F63d7Outq2i+90wHo9bI8wEvSexD24R8secSSeQel9nfT?=
 =?us-ascii?Q?2GHTnefCR8ZtZkQTUjpBmQTT8faDBwtBUsCw8JyLejqaIblYKc7P4sWhdpXN?=
 =?us-ascii?Q?pKRTpLiPmjn08czX3YLtCgBSFPFm9SCJBdOZdyuWPv1/YfDmf7c8YLOSkd6A?=
 =?us-ascii?Q?y4W6ilMzASNa7zNoBAR/x+fBSpXqDYDJuVxDpGB/rjLekWxb/6mbGq/lX5eg?=
 =?us-ascii?Q?W0iHCztfJxWNPs3BhhjzxnUsCTDHAsj39qVy/Iigbf5JWszOrR9BsCD9/eOR?=
 =?us-ascii?Q?x1UcjilTPWQPW3GoaYmt6ToJ9pEJedeEFc/zQKSSo0RYcqiq0/Sbh9TQnZgX?=
 =?us-ascii?Q?8wwxmpG7vQ1R90wRY4iLrOz/cB9zZGXKwfdFKKcBtCZ7ORBxk5k/2VWZm30A?=
 =?us-ascii?Q?lSmToeVBam8nJmJkKsCHQOJvfO02mc5UfvAbOa6RR0o6JU+8iRE3IQa+CHoR?=
 =?us-ascii?Q?4fDOWQvpDhegY/JI7d7fcogTM3lo+iP6F7Pt0/F9Ty5DTbMFtSWmPTvTEW1l?=
 =?us-ascii?Q?UL0cz2MHhpGIRWqctvQ2AJr9xlSZ87dceCWNq0YpUMQLVxdorL7iWEWAegDb?=
 =?us-ascii?Q?v53Q17dBtu3NjoOacmNqOvB3++ssQUstPstX2irIezwQDUBxizkUG1xm4XYL?=
 =?us-ascii?Q?bwDbMrvkFT60xvS4k7qzVMK9Z0TMr91xHsopihLRU/zzfrI4xy3BhizV9tne?=
 =?us-ascii?Q?hypO1fDreiyZp2guOB6LS+jQ4fZQ8nFKIizyQP+eX58r9oFpDZ2wIGKm5o6q?=
 =?us-ascii?Q?QFhSGP0UQSXBaX/uBGV3P6yDs4mk3Gvt1gnNF5MC79yGec9XjVW3WXKVUbUS?=
 =?us-ascii?Q?2Y+xBRyPsOjqL4QdFE87zU+3p6WULCAAianIa+N+Y4kLA8cC2iHXIi7agVPy?=
 =?us-ascii?Q?J1m+ZT4vgbNo43+fotdRQX1DkXGLybqjErS7FIyjLli3KLnrH8mRCz2ulnTG?=
 =?us-ascii?Q?Nn8kyAtga2voAnQ6btM2VNrCW1HWV2vXQ70y5iuJ0gk4pVM9C6Qlb4IJpPyb?=
 =?us-ascii?Q?J1Xg6P4EkjufTsUFmNQt+JtzvmgxvEjBD0AUTGGx/16Ho61i0ky0XMM5bd5d?=
 =?us-ascii?Q?n8RdVHek7ZyV1E1QcBn99jF+TxdRhKcO5jwUjDw3tbuZYPCQ2MzLeL6PxdTm?=
 =?us-ascii?Q?RPlkcJheGEUE9P0nO7eTSAuQHdAEJzo8RulR6fnTNHp66a5JbgwWk5mn7QJC?=
 =?us-ascii?Q?UXmJS8vLBEKNbZyLbHBvWgojAKeB+f8a7zBkky+I5xggoqfxYweb8QbG6MlL?=
 =?us-ascii?Q?qc8SS/BDwZU91BzQpAVh61IpfvjOKBa6XwKZQqzwSISGNuMZ33Sdy62x1vUE?=
 =?us-ascii?Q?yqPxaOKb2ff8unROIqeSR3OLTLzc1FEMC+3XmNEYRNZUVJbiR9VqbEklXrzM?=
 =?us-ascii?Q?9YKzEDbz4phOGkwqDjyuKQ3B4Xa0tQ2iTiyl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PhEdrlOh6Rmx2TX3Zf2peArrdoFBFM/e9jszRks43XARYjwMzG46EL+AK9vB?=
 =?us-ascii?Q?ujb3vuNshAgkqUlJHTZifICvbtEpazX3BLAdKG8gG/jxKULCdAuG2g9hac+u?=
 =?us-ascii?Q?UuMtYDDKB9GBaPFPsdBqJzgl5EiBYhnc7q6b4UQ7odziVRjAUZ0GIDEFFN6U?=
 =?us-ascii?Q?Rl233DeDG1/1DAZ+WESpzFLoeFW/lLEec5ULok4C05MkFPHfuNqaBV0Zoh45?=
 =?us-ascii?Q?KnBxv85S5+B9YG6Ib9hjZuzGugNxErMeJpzzTSFXojrZx1pqv9mM3W+12+V8?=
 =?us-ascii?Q?jX1Yci9DkVutdt47h/xAd1vU6xT8ssFue89BTR6GV1mv3IngzIhKO9pxpiKi?=
 =?us-ascii?Q?djvYaiBEH43dul0ZdMzlcDNq9iEflyOefqHbmQDrRNGXfYareZLTIgp7zDs3?=
 =?us-ascii?Q?2Z0wQyhoLnvj/dGx61+OuLrkOwIAt5EHGN5AdeEgwKvuwyo0Oa7Iw8SzhuiF?=
 =?us-ascii?Q?InGjrL8j8rvVb3J3HgxuwSM7mEJCZgm+D80dV27w4lCaucNyXzE9dWxGBbX2?=
 =?us-ascii?Q?+PQaLOuhKL+71g46L3FaKoV7ymjB2l2MUwpbVn0Xwna18kGnBcIir9QBR9aG?=
 =?us-ascii?Q?VqbjiX9HyRuCQsMmMsVbFR6vyN0IClimPHosyb6FcWJaSsQ47yD+62QM41ZB?=
 =?us-ascii?Q?UU0eMhkUNz+e8VM6A4w8/AARZygh3LEVNZ133Ttv0uFYWTt5J684+4r9yK/Y?=
 =?us-ascii?Q?J5OTmlBgyBRB0su8ogAqNaK4a5nmi+GC6aqBCvp/6/42DpJlfomG5CMvh/FC?=
 =?us-ascii?Q?3O/az/M98dDOkiG3vyxiHPU7OfWcgdDsVMUq3n5aHg+8fS6J/i9lOpv8R5F9?=
 =?us-ascii?Q?P+kvcF9BGnfCYPfJqYNmwGJgkK4m9VWSdsM/dELSkK7Uyt8lJoBwGmPkTeRz?=
 =?us-ascii?Q?IUUe2e0rf9HQf5DiVMOlCV++D8jF+3bAzhth/yHo/10PGPesSiY+Hi5DyTHz?=
 =?us-ascii?Q?lXL9WGugXeIJ8g0Arj5rmpgwPORwpOdRxWNvWDwt90REfatdewQ4VYOFCciW?=
 =?us-ascii?Q?WszyeCUeLDrQzUs04KEkw1deML9guQ6JMnosP4GB4se6+LCrTFthT+CQnnD7?=
 =?us-ascii?Q?urOMvwWwcJ86R99lbBRaGoym1sq5R2rRtHLZYirbWHcZsSrDJL96bAQ1RqM2?=
 =?us-ascii?Q?wtiirHNIDigY7p0z6QetGvfWZXW/2GYD/KJU/jKOry2eejaFQ6PcmHV4ZKy/?=
 =?us-ascii?Q?+9y8tBJ9iwibTeneCEozFROHG/m4kUSeNgvkHO7irP+ZXlAr4UDlrahlXH+x?=
 =?us-ascii?Q?No5heeN2HmGtCkaMJP0/RSodo2Q0KV6JNCc86Iui1XqSry5igW0gOoac18eL?=
 =?us-ascii?Q?Zw2U0yl4pEffgx2ED8B9UAF7GlpbDDAPysFgCHpAOqmoI8i79TfNzXSXPFaH?=
 =?us-ascii?Q?5DDRL2zSTTeHjSWeLWLRszkgpfEk2okFHMJqVTX0OhdYtMbLTU8vrcPNjhwq?=
 =?us-ascii?Q?HbNSwduGsJSxT7t5cZXUVzA36bxNy3SfqK+37sFyzK4xYuSQ1B5FS800kjfu?=
 =?us-ascii?Q?mCSlHbTSBeHZxYQW5205WRutfKpSmfbIeBdKWaB0oudNqY+lG09osQorkiPk?=
 =?us-ascii?Q?olxsiXvTDlG6ENMOjM8pg99ptFnsV2SrOER9tdtaAo/f21A+qdrWOxfZC7B+?=
 =?us-ascii?Q?Ug=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 239fbdfb-2696-4efe-8823-08de113f3d53
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 07:47:24.3787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oEk4X1c93mgzM70OyDLGqsPhZuVYDxf20DRFfmJBT1JsBGWhrfaxKwSLzQpQdoAWdjbFA9C5iSyGo8hOKxM8RsKVbtZhCM8F34ga9cQ2lOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB3135

The YUV24 format is missing an entry in the v4l2_format_info().
The YUV24 format is the packed YUV 4:4:4 formats with 8 bits
per component.

Fixes: 0376a51fbe5e ("media: v4l: Add packed YUV444 24bpp pixel format")
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index b367d479d6b3..c1e3bcb4c1c4 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -281,6 +281,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_Y212,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_Y216,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_YUV48_12, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_YUV24,   .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_MT2110T, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2,
 		  .block_w = { 16, 8, 0, 0 }, .block_h = { 32, 16, 0, 0 }},
 		{ .format = V4L2_PIX_FMT_MT2110R, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2,
-- 
2.31.1


