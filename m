Return-Path: <linux-media+bounces-41178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A800B38292
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 14:39:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B34C3A7593
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 12:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4840F34A301;
	Wed, 27 Aug 2025 12:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="fRHPPHm9"
X-Original-To: linux-media@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012009.outbound.protection.outlook.com [52.101.126.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DFC3176E5;
	Wed, 27 Aug 2025 12:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756298380; cv=fail; b=XntvkvBfWdWkophp0ckUOD3oewqqipOHQJqVVdVQRE736ENOSvYv38dK+H8hy3mxdnJxYDXbsWSB1mjSlWttG6+qV8pgOV+y+ilvRCl/YyFAAWYj2BVNmUBCiZeEqH5R44ZsokqZD/05suX4Dbdqz3tW0nf/ZB0sEW4Hm+RqvTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756298380; c=relaxed/simple;
	bh=dAztA65K0hVQx4pY92tRN/PzoBgDd3gWNUro6Qq4Isk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gRun1TYvcFZxppQA8KyL+ozLFE1o99HsV3AIprR86WHkXVPIKPZACOssJSwtkVMtw3yD5S8YIaycwxmJMfgoxfKtORJm15Ptx3pVvdck5kLUoO7fAV+WJU0ke9AvtqP9sK27aKILAu3FcSGQQQLlr8r88bU+v4SxA7aSX22ffLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=fRHPPHm9; arc=fail smtp.client-ip=52.101.126.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=glkXkrdvKSAuQM6oT8gj3NGyBI5Mscgot7zJOtEExGTUp1kkIMnS9CfVQzA8uUE8i48/rw3YZBqiRTQB+KDpAEHYe90Txx9xb9yfj8zwR8VqMx8MPx9DCUZaHFj5/vu3Ci8ikfd5UMgvwoGy5z6kLjP0IDF4d5r6lutB5H/aRppau/LyJrGrwb8k5TGLVVMGCxxn0IdE2sLHqhVqPP2nOgqfFedQHj1yNGfVZ6U+ur6iGNySOt4atRJ28Df1KBDLOVcq5WytExIr8sKEpHC72wbPOtIkkcBpwCiBMjTo/7jUN0ojTSJD4T71A07aogLEpVCq67aDx3sarnXPV6s1RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuyuslQ7F+S/CuQBz8Y3QCm0JVmoFRYywvsGcfZmS48=;
 b=jsL1753s/R747CiyVM/y6EJChlqiXoyc0KRSvPaKXUYFy1CEtP1opvCbMH27XbvYpzCAYhILVplv7e0XTXvoGzubsx6/WfLeBN9+noTWhlifvudU7U63bzIO7E1ZDlfLozFB9PSMZVCKg2tEJ8TvHv5F7Q66L72GCfLodYBorIgieUUpyLY4f/IxxOKSB4pn0GsVuyoJ3KUWJfO3wVJ5qGbWS54bASuf93N3rLImAhhkQjveaBZkmGAOyycf0b+xum+6zP/fvZWhnNEnXQDlCkCCtaLnK2+KGlpAjJPtEPxeCzZQxnZhzeVbNG+GymtU9y3/OWefjW62YQLEJBAL8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuyuslQ7F+S/CuQBz8Y3QCm0JVmoFRYywvsGcfZmS48=;
 b=fRHPPHm9OeN4y2lKcOlx6DOnKXi7gCZgxQcgovIrKJ6vj+yfd/O7U9Lj51wrAJK81jcMnQ4t2TgeBYMdQra+BFIEoR90sFp+MlEtXpyJHUl6Mhe2T5wh2bWTc95Hgrmqp8vSw8/W5PuPtPBD8Qkj5gKyi4xzzaSp6kyby+NE6lYELqGSRV0flCm6YY3rXOhNsLsCUIq08PDL+n9EsjS+GIZDaOggZ5NIDMN22FHsCVanjCw5qUE4udTzJZOiRgFtO6tuJAMELzxg1oDDDuc4om4Ph7BoA0oCcYZdTyc2QlWiDc8y3QNST9Y+1Gl/MBUNsRrxdoIE8VrVia5/tlC5nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 KL1PR06MB7285.apcprd06.prod.outlook.com (2603:1096:820:145::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Wed, 27 Aug
 2025 12:39:37 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 12:39:37 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Abylay Ospan <aospan@amazon.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-media@vger.kernel.org (open list:MEDIA DRIVERS FOR CXD2841ER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/5] media: dvb: Use int type to store negative error codes
Date: Wed, 27 Aug 2025 20:39:09 +0800
Message-Id: <20250827123916.504189-2-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250827123916.504189-1-rongqianfeng@vivo.com>
References: <20250827123916.504189-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|KL1PR06MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: 375f489c-c1b5-40e7-ec7e-08dde566c882
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+C8py2PaGimZdHl+xd1w9KXzP1fKdTQlqdaPqflT1jjbJmmP75exd2NN7Idn?=
 =?us-ascii?Q?8FWE3wujrWqfPgO5YKcCFUC/ltlZBf/+IPQXdfi4KDKxzAnYuNPoY1IQiFYp?=
 =?us-ascii?Q?fuhLpXnE2WcnFaiX1TNNv9fZwwtQTI4/ZLYaPITn7aBbTemEeDdtwGyqo8nC?=
 =?us-ascii?Q?t8tBOcHKW5DQERQ4LXjCFMde4spD0TONOcMqwcY+iv5FYjbvlUaaBENOERu8?=
 =?us-ascii?Q?XyDua15x/l9h+wDnnqHMGyCmvAgI0sNausnmTvcShV6eXqxkeHfJhkooWW91?=
 =?us-ascii?Q?BJ7atlOqNMKCTZSg7SCGhpJDOVGJf2dyDIASoFvHJvFeo8W2oqBvLJJ6SqwV?=
 =?us-ascii?Q?V8hAXZku+Lm5G5o7gmKYs7plIF77G60UsnAKtB28hfAagh+XRPHDBtoDm+wV?=
 =?us-ascii?Q?bW1NaBKnCdCuAbKI2aPLfMgBlHm8Etgjrw4XyPvNqPM2at8DTwT6mWKQdHwV?=
 =?us-ascii?Q?3Un1VsXd7V4TlLdqWbOqKPZnDh2d7bEfrnP6txSWb/SmnZ8lYA5/dgjSGeT/?=
 =?us-ascii?Q?Wa0woHhgW6NSDjyq9AtFqeMn2JUSElaFMzWirON7//g1966/Ngjyv2VeYqPX?=
 =?us-ascii?Q?fINgZ9n38HvG2ZUTGZzXfxWzU7KjOfj6h+QgHEqNb5cGDG6Y07hEQo6euPc1?=
 =?us-ascii?Q?VVn7/vMeClwrQtULzIFTz94eGKdZwSej6CR0lkzijEkFCb8x3wgRLjIjw75o?=
 =?us-ascii?Q?sVSG7b7bdVsf9hTsBoVW40EjLatNEF0Te3/cM+8oJ7LlWmbB1+k+8+Zy+63p?=
 =?us-ascii?Q?/EUFMtOM7FSU7wE9PVKq24tx7GjDeBLt4Tdm0MHibQZbo33ZjhWMhJIU26jq?=
 =?us-ascii?Q?AUhaJwydAQ80tst7V0+CHSL4nxOjZrbUVBTfBmKBomThb5W6BmMLo/bRt+JR?=
 =?us-ascii?Q?83YJ4PJGDIiMRon1YET3dRrT0Hygj9mS9GfQBrWdQpm8T14brkwb6AuYi7v5?=
 =?us-ascii?Q?hKcelheufAYoAic3mnYDDs+SW7ntCGS2rE/V63LFDQvNWLhvvWKh6j5wg4Z5?=
 =?us-ascii?Q?8AcjVf3Eo1FbeN9gaBMg/mM3D10s/mX2Hx7FUz79oB5PxhhH4h0pOQ/QMC51?=
 =?us-ascii?Q?eNnCDKWDiGJBb3VV3/eIu/wGbOLyrQLlSlWWl+KsYX8lkjcxLp7eEZ9R+t1A?=
 =?us-ascii?Q?xctYJYojvDOs1+tzrr03pg1jS2SaYhgc+L1a1xp28fmX5VbPYVj0t4I4KDn2?=
 =?us-ascii?Q?9h/DA69+ChRbxeR2VT2SNjKhg9YAgvXv7buMAIh3Hi6WzxrlAtWk+eNDB7SJ?=
 =?us-ascii?Q?gApV5OPKAVgiOCVne7UkoZMOAwxHrpeLJloty0Oipk2UUUEbVh9lPCZCMxWD?=
 =?us-ascii?Q?wpNPvgP3CSekMCTQfvaHE5mfg36144MrWIhhXX/HsZ/Fu6awAHV5eXd6ci3G?=
 =?us-ascii?Q?Z8VGgGIhUABV9wB3xUlxbGUyZMxTGTK9ZVwlQ1xPFKjGbiJo1C4hYZhOunt2?=
 =?us-ascii?Q?4aUzxJo7Lq9YdgyCS+5kUubEKUXObvZsusuFPSSJ0Vn0A80CwyqP0g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nnVVaPGY7tAUGD008NAl/WKfjBCDvwvSJU/yYH1LWeDpfamP0ogKk38ssk5Y?=
 =?us-ascii?Q?SGDloJM8w04Ja89pq9qcK7OTcljYz6fRw5xqw1GI4Azx2wri1gviTWB4lf2e?=
 =?us-ascii?Q?o/opD1BEBYy61FPBE90KpBNESP3OpntYEim6KNC+UmWYCTzdBXjbp72jl1z/?=
 =?us-ascii?Q?qHn8lRuftB2hO1keGG4QETvoYWCgtpwE49xXGvhr3KTzrEz0aerkOsGBA16Y?=
 =?us-ascii?Q?9uBhaAO5ANAomd62+N3XAW+d+tLV6afJJbtZTRxoZnlvj+dUW6K+1Ld/05bg?=
 =?us-ascii?Q?RNo7S6lyWkUfBiMQ6zjGLfTutBXCLXlrzfHXSXpBUGAAvDAbJSFkeDZ6lgAD?=
 =?us-ascii?Q?m+4X8OD0zFEsv21L9JuxE73MKIiovB5tyrR4HMSVJQovkaMqGkA2yE2ux0vs?=
 =?us-ascii?Q?bPOogIrbN2AWNe9pl2GSmsgJvpZSHo7VFZTvQyVT/iJEYaEkuUHaMFCrIOgg?=
 =?us-ascii?Q?ElQzlyfa3TiON3PskH5lWt0X7S4gfuQVi5BmY4RnwNuFMVjTQvYR26iCaJBb?=
 =?us-ascii?Q?AR8vNPlWUk2So2NgEv8hANg/XZwJWu127vTmcdmUoRiB/vO8U7dI4HtmRSTD?=
 =?us-ascii?Q?LxKWnM4YskYwWpyTt9IMFWqLliGazvLiqPcdXlDNTDpeg5L9Mp1Gn1gabbYH?=
 =?us-ascii?Q?2tFWb1ZgoLqMI6VyeXxadoZo+o5VFRjvbqtnlpfNzdxfVhMWbHieh56+1GsG?=
 =?us-ascii?Q?zZjjJpmW32kUEZ8asffCCE364i3d+0LEyoBTwa5XBEcCgSrSnoKYNbVHxpdr?=
 =?us-ascii?Q?McdhtHuxJEGuoAM0wjSac76hfkcsxZ1Q/xmLelj3GYxcVd1F8LqRiCOh0WmT?=
 =?us-ascii?Q?01+kBUNCvZK2oWivy0TNHOPQn/BunmiBFZfu26u44kKCjcNgdX/8aBZOhEBQ?=
 =?us-ascii?Q?29yqRdWRxRp6HKKgvCU4Cb/vXHtFj4g8LxksXKsSY01jICcmNvZnC01IXx5O?=
 =?us-ascii?Q?JCZ0K78IO1RwziReB4LBBUJPAf+hppLs2TKag3kFOHDW+rUXgPjuefYXSZli?=
 =?us-ascii?Q?Tp+ztaUfS3MIawiCLwRFhZtCSx+VT7opZR8GnHw+PInAQV38+P1eQ1JktXzp?=
 =?us-ascii?Q?dNUZtAnAIbHkAcBSbbYhVwZhNJDEDxjvwrdivG4YOBmKaKd6AgkBFSOUhRoS?=
 =?us-ascii?Q?rpQ3nAGQUoP/dSVzW7zGzqksv7lgAVH2GqeSW3f33SAcaPo2T+MKWq+fnPoA?=
 =?us-ascii?Q?oMwo1xLlzlx2l6Z1PQizqfPt5NBD82Xutu6vI2t9qinYWj+IoqYc3A7TNGgO?=
 =?us-ascii?Q?3UjO/nKfuKyTjxNM+fAUnoyyxm6Xri3kSfe89LIkcje/1ttT5E26fkGjP6QF?=
 =?us-ascii?Q?RHlhTOpK8l84fxZr3+jbJL5n2GFA0D8SkqQS/0PNIy3nKDjm8X2Arg9MuJ/0?=
 =?us-ascii?Q?NjSDwkZOOCGUWLime2/d27LNvtHEromIFfdg9EqCXZ6kMeBbHJMwnz2mbArg?=
 =?us-ascii?Q?0Rs8ekOpVAGoRDclAbHpWXjOk53oecuaDP8CXq7UnEFDlzZ3QpYyzkpHZ0fj?=
 =?us-ascii?Q?PiFUis3dsiwMqiWKJ6hTqxo4Jx4VOcCQDXGZY9mCxezEdaNGfyaZyexyOSws?=
 =?us-ascii?Q?tVKhfi7uPJFY0egC20O+Eok7CKN5A3VCjX29/oE2?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 375f489c-c1b5-40e7-ec7e-08dde566c882
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 12:39:37.1525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGN+gEk2OxPC5yVpIZeN7Es8J6vSi+bUnzNcTn/78mZBhf9vXmckciqjYKpHtjgCVzCgmSvSG/s3qplr3H62wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB7285

Change the 'ret' variable from u8/u32 to int to store zero or negative
error codes returned by other functions.

Storing the negative error codes in unsigned type, doesn't cause an issue
at runtime but it's ugly as pants.

No effect on runtime.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/media/dvb-frontends/cxd2841er.c | 3 ++-
 drivers/media/dvb-frontends/lgdt330x.c  | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/cxd2841er.c b/drivers/media/dvb-frontends/cxd2841er.c
index 415f1f91cc30..8fcb4417ba22 100644
--- a/drivers/media/dvb-frontends/cxd2841er.c
+++ b/drivers/media/dvb-frontends/cxd2841er.c
@@ -1936,7 +1936,8 @@ static void cxd2841er_read_ber(struct dvb_frontend *fe)
 {
 	struct dtv_frontend_properties *p = &fe->dtv_property_cache;
 	struct cxd2841er_priv *priv = fe->demodulator_priv;
-	u32 ret, bit_error = 0, bit_count = 0;
+	u32 bit_error = 0, bit_count = 0;
+	int ret;
 
 	dev_dbg(&priv->i2c->dev, "%s()\n", __func__);
 	switch (p->delivery_system) {
diff --git a/drivers/media/dvb-frontends/lgdt330x.c b/drivers/media/dvb-frontends/lgdt330x.c
index cab442a350a5..8c34a5b850bc 100644
--- a/drivers/media/dvb-frontends/lgdt330x.c
+++ b/drivers/media/dvb-frontends/lgdt330x.c
@@ -124,7 +124,6 @@ static int i2c_read_demod_bytes(struct lgdt330x_state *state,
 /* Software reset */
 static int lgdt3302_sw_reset(struct lgdt330x_state *state)
 {
-	u8 ret;
 	u8 reset[] = {
 		IRQ_MASK,
 		/*
@@ -133,6 +132,7 @@ static int lgdt3302_sw_reset(struct lgdt330x_state *state)
 		 */
 		0x00
 	};
+	int ret;
 
 	ret = i2c_write_demod_bytes(state,
 				    reset, sizeof(reset));
@@ -147,11 +147,11 @@ static int lgdt3302_sw_reset(struct lgdt330x_state *state)
 
 static int lgdt3303_sw_reset(struct lgdt330x_state *state)
 {
-	u8 ret;
 	u8 reset[] = {
 		0x02,
 		0x00 /* bit 0 is active low software reset */
 	};
+	int ret;
 
 	ret = i2c_write_demod_bytes(state,
 				    reset, sizeof(reset));
-- 
2.34.1


