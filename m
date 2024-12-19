Return-Path: <linux-media+bounces-23802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A189F7DA6
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 16:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5EAC16F7B2
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 15:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C99226870;
	Thu, 19 Dec 2024 15:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Z0xUPMHq"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2066.outbound.protection.outlook.com [40.107.20.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F500226864;
	Thu, 19 Dec 2024 15:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734620842; cv=fail; b=agTqgR8hcKwGMnLC7nDLYmHaUbW+vIMO232LNhdxr6+8Yy/PtFW+YYLLgyOvcQGtLMTIyXiLE+5MhPx8O0OAJJb3bRKeKCTJDXElbvedAT9pr4iMU/l0E75vXewg3hvfqb2QtIZH2oiLHEmUiV4WgHFX1mCF4lyUvXq73IFAExE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734620842; c=relaxed/simple;
	bh=i+pWi8RF9ePxwkHNKtUZJCoCg6TA5kY53Qpkw5jlKlY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QMzAEMtM2h9HmxXKoHXoNjmOw/7BrU/GdQvfnUBPsAU7puY0xGdDUx0f94qRLJXGIEaq9NJwng6ya3xkxXr+07/yvWzV3xc07URac703GY1lHb1E7fb2mnuOAwDSWLRsjkeRpQFtFU7tAB4LuhYpAxJ/SDz3UtJ2/NpcwsjAgtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Z0xUPMHq; arc=fail smtp.client-ip=40.107.20.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i/5UipB3+ECC9C+sMWzfNOMp/jwk4EI1GUS0wqjyzBokY0rQiBfM/3ujMUVsLHuDMBnbo+N5w19PmzS7QyexT7tjv2pKwn9bf9SN1Y7F61Y+31b3VSM8uEfvcCdfJkvXXCVcw1AYMwvPNJMylIg9ZhAkRnXCzbaWeaJVlSRsvzoNp19AdN2nsd8Sxxidd70EGp4TOx15gSPEsWBO53xD4il5MQ9KP8c6Qe7MsfwyIUJWCbLeyySYIiJnw+nuSTDUgVJ3ZwaNCjpB0Bm4J+rKoQew7CK8fO72pAlodQAz3ZeX72dC90r8n8dguu8ZAZEy43P9g4+jeAO40BAOaxu1Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwJZBmg0JrantEFQ2aoelD2q1VWlJxhcT4bFCLz/Tgo=;
 b=QnMbApxIBMWBWy2BnWW+nn1WMf9O76rTzMlCo/b3q6go3V/6jQyVw/b6PEgPsTa6Gm8XIq3RwxgGvj0P8AuETnipX6jZTchkvhloc0PFYd9JCIRiSwZ5rGDNh93HxcBdzJ28Cg9sc9bkGaCPkan0ocEUn4g9vdk/BxMIUcUTZH40eeu7sZ5OzwRqIVgR59/+bIdriNQL72IOqsi9a0T3JsWqPNaiKmJFzDjatawkSxfljjJR1Xkis05s4qKEXkUnDsR2aqbmvycsOAzrh4b0B7jNszuCjjIdbnF2T3RMp0I6sVcQU+e+tTMz/5PhMbISLSk0AARKhfxI3SmTuupaZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwJZBmg0JrantEFQ2aoelD2q1VWlJxhcT4bFCLz/Tgo=;
 b=Z0xUPMHqmxE4I+wUW1H3ApYiV4A/4LYyernAdGXmn+XCy7/P2WhXgEn+mu+YG7IbRFWhpN+/8myJ61qJlPZW5DD/5MJsyoKPI/73M1vPc6ETVviGE14FwJEYtR122UlKz+2yZiLQSHG3+PhIiNsYfIZdTcXl3riuZSsSH7IXNS6Cu4YOTJiq19rPvOSXGUiqMBvTDDg81R8ORV7XFa+8Fa3u446MCoi0OZvf4rSmBKgb32QthPN7p8qVCyrpD1U8JSVa20nsaV7sZ0mcN5VQFrOkswt2LkF8v3VODwVkFHEDwqJFQfEg2HkMdF2fuxOdm2Zeg/vAvaU3dEYiAL/1Kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB9578.eurprd04.prod.outlook.com (2603:10a6:10:305::16)
 by DU2PR04MB9146.eurprd04.prod.outlook.com (2603:10a6:10:2f5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 15:07:17 +0000
Received: from DB9PR04MB9578.eurprd04.prod.outlook.com
 ([fe80::4d55:dbf6:a33f:8d4e]) by DB9PR04MB9578.eurprd04.prod.outlook.com
 ([fe80::4d55:dbf6:a33f:8d4e%3]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 15:07:17 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 2/3] staging: media: max96712: enable extra debug register for max96724
Date: Thu, 19 Dec 2024 17:06:42 +0200
Message-Id: <20241219150644.64507-3-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219150644.64507-1-laurentiu.palcu@oss.nxp.com>
References: <20241219150644.64507-1-laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM4PR0302CA0013.eurprd03.prod.outlook.com
 (2603:10a6:205:2::26) To DB9PR04MB9578.eurprd04.prod.outlook.com
 (2603:10a6:10:305::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9578:EE_|DU2PR04MB9146:EE_
X-MS-Office365-Filtering-Correlation-Id: e7f5cde4-ff28-496d-42ad-08dd203ed40e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7WegD5QEmNdj1onF+Nk6vzH0xjvh5++RnKfwsdXssQ3m0AwowteYflZEAWAc?=
 =?us-ascii?Q?MKKCPj/DTbWvg1GE7Rd0tlDuq/5krApgjeP9G2qMXeCk39h8EuQk9QtDxKyQ?=
 =?us-ascii?Q?fC28feSTzDCHWfX6M16Qp3FX/Ksq6RFFvQb5piVpYd2liZQC7xugaY/XuE4u?=
 =?us-ascii?Q?Vw5L6qx1hFlipo9tKk3zJEzqApGvyO/uASlQMejQ95lPiC+BYiB7dfQrnBpt?=
 =?us-ascii?Q?Sx6IKFb1g5GViI0g2RNuvC5/9b3JmQz74Oac9vGO8Wl2S9UwcQYe6HjRbliw?=
 =?us-ascii?Q?APYrFyOHOhw8DcrqkjqgLI64noTdA/KHRGzxLkU4vGisMkeHRzcGms2OMdZz?=
 =?us-ascii?Q?t9B73dTYFDnYAWVVpGSkayLdXn7UcCntpSf3goGnDpOKqyNMR6cIO1QJOuns?=
 =?us-ascii?Q?iiAifXt47wcC38Kl+MrKXb3cR0zktjZVWay4XteQSWlpCBgp6mU94uwDFsUc?=
 =?us-ascii?Q?FgiIcsLrmih5Bgmtyf8SkIe6lL7VmhTsdM6vxfgo+SZZ15NDyz0WhvKHpbON?=
 =?us-ascii?Q?FaNTMCm/AE1MA4phZNiT3ryXZ9B9pni8boDDbQgFqTwEjQc34DwvkaR/fgaU?=
 =?us-ascii?Q?EnG+18GgccEvwCorY8pp12oRjxC9vPyJ/qmPHLxEnL8uddYdheUC0JYZIUSe?=
 =?us-ascii?Q?/9Q4RIwTVkbOYu98wjkgICiWpbcY8tXyGJmaodAIK5Jy0FUs//qs5Gr1BiNG?=
 =?us-ascii?Q?FKhvLSMIrdWsXwHl76XMY6NOPa7InES3KOjGO+bhZBZoRnTYmUA/pKWBezz4?=
 =?us-ascii?Q?ONhMogum1fb7vu2FjQLNbp2oxKoQuEyQM0nJ1CIkeS9uNJ0pEcFidilP2NdS?=
 =?us-ascii?Q?UFdsiAmAUQUCzIKUp/1ummXCHGCPC8eU/Rf77N5X3yfGiDPWCy9+AHswRUx9?=
 =?us-ascii?Q?EpHSsTMkPBP8u/h7ghtmmApqSTxZinoisj7EghVP1HX7Gc8ILFweDuGMNdfF?=
 =?us-ascii?Q?hIydJZcfCgVEDIUiUEC0y08k7+zmqxtiRgJmOYIpmOQeaLFLF6It3XabA5XW?=
 =?us-ascii?Q?TlXGTExyl+RGx+m8sHK9x1WbRCzJfR3SEMHjqGxARJxJ0UV5bhNkBh1aFao0?=
 =?us-ascii?Q?l7FoIqZdzJVUZ+MFIImPbpISG4T8vD8OSCqX6nq5dUoIx/3J67WLS7c/3gxP?=
 =?us-ascii?Q?3HQ4nHdcN5JRAvjIruUFsYQ/71BOGBPlC5OFsjZE5Oxq3Ub8Enoof/IvsWKH?=
 =?us-ascii?Q?ABKI5gG7tM9jPasX3C/Pd3893AgnCwHTdcgScNLHW+v4DMyeoADD4XTHIUOy?=
 =?us-ascii?Q?cJFjjUm32R3BIuKoE8SHoSx24RCcupGt5fpRBseF1mDHatQoQlKI/jx8PAiP?=
 =?us-ascii?Q?oaNQBmNdLUYL6wegIWaabSfdi2yFLIDwT2orx/6fodvQi2OyHKBrPRvI4kWM?=
 =?us-ascii?Q?zMH03wDDgPCduqF5CBtZYpglEACc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9578.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q2zQ/mxfSK4WY1wBU+y6G96CAHAqelJtYYabsgTftQMdOg1GjXUap6lgX5Fp?=
 =?us-ascii?Q?FppskqZ2f8wZvzNHSrRaw07YhDNTfNnhNBxxaP5StHHBFvcjzHK4fhXmKtFh?=
 =?us-ascii?Q?InOxpp1Ffx9IAsOwE8+R+V5M3kRG3kc5xAJgHauA11Dx0/5QrLZFeMdY5BID?=
 =?us-ascii?Q?IZOaNC9+zNAaa5MV294/Ku7ijEr6yqPF1hrP+psltDJCQkjV60HXzLZf27qF?=
 =?us-ascii?Q?fN34aF3K87FUkvt0pOM4qlU5QrOQI47AeEGY1NZQMD/VesHj+M06oL0oo9mU?=
 =?us-ascii?Q?QpBXInjTN6MSS01+yEK0BhCKeRgiGHNqD7Q5jSKLK1/Vljb04K6lpQs+3uaD?=
 =?us-ascii?Q?UkvvXwIAvxVTJK8Q4Htcg5bTaZIK55fpKresOBcMfef1H6MzLApI0n5mASju?=
 =?us-ascii?Q?fC+kKf/SqEXNwUpByvrm0WlZH8+QwlMU9MGyy5SjBzc1stJwSc2+OZbp7mUG?=
 =?us-ascii?Q?f/PjwjAkWPgD25TvTkTf21q3mPX/UBeARkOnbS6YmmDdkTDgaEdxWGEwNsib?=
 =?us-ascii?Q?plNFqlOvSBX5kRic2eg7eHFPX59MJe3zzxmvPEe/S9OfuvjTWWVqTTSRuTfq?=
 =?us-ascii?Q?MlLgkZRj08ljluYbKmuVjJIZDlUxgo73sVmFRR6Gw8vmklA2AWyJ1eNxTAGq?=
 =?us-ascii?Q?WUS2T/g7qXIqeThehtxV0G3KXYVLampdPeK1ylREukxiFe0jHI8Ok1s+cd/u?=
 =?us-ascii?Q?/dIz32vqbyEybWYhb791u5FFhBr9VUqC/wbPMqx5Zt/3zFKHtPWmHem+/jun?=
 =?us-ascii?Q?N790Y4/rvOhd0nTRc8jJW2B+TtD9QOkMwuGf7wgebkeAbsYQTkvvW0DNuFPp?=
 =?us-ascii?Q?x/ApdJXkiVYnleoaNf2ozqU2Yw+4mX1MKsuiwQR/EbnXi2bufBshmisBkmF1?=
 =?us-ascii?Q?L9pfiWwacKPJ89uasz5315lTIW9NBhCNk2h8+ummxYL5waBQPBp+13tZPm6q?=
 =?us-ascii?Q?XkDZXdSCyE6UeRqtS9Ms/UF2Ep0mpaZCVgQlxcPgigRfIREP5/wywgWgKRjd?=
 =?us-ascii?Q?blTiZqITf9tX7FbHLAJTGBa/KF0wzDx/yGGSJ1U+aAdK40sA5XwNe+LLae0Z?=
 =?us-ascii?Q?NZry5IaPa7QjAg0I4GQUexTDRBoM0yD/zICb1EvGjd7vGCp7YgiXqU4he6Sa?=
 =?us-ascii?Q?yZ5gx2OuHOvtJmSQsltbOdabYGI+ytm1rgWIC+0uNQwdSyl9qweHkZJKJBn3?=
 =?us-ascii?Q?x+rao6yNw+DpqUiqpcd62N9YRN7LhJHDDyoW11j9h5ikJMGaNHL4j3fI0wJf?=
 =?us-ascii?Q?TIPUlemozoRvG+6anFnH8BRU/pwXcy4TDEEQR34y3jh8FmIR1QyddvLSz2Q1?=
 =?us-ascii?Q?nWRgjIhwzN8Uv4RgHx0NePs7VXvShKg5fDnVkKcAR+3biEQkXv9FHKut8OIb?=
 =?us-ascii?Q?uWomOAy/4D20Aox4fly1f5Qo90Oqqiz2vcbq+ebe0G5BPevWTvgycPoA9fvW?=
 =?us-ascii?Q?kc7WlbTC/q3M9ota1O6NqUDFJbAiO+6JxYt5F69Yn+nRWuNVlgb1tNNIvKLf?=
 =?us-ascii?Q?KZyLRxQkkpOTs2BD81qk7tDkL5opxcrV9H1h3+zYcWMGUbPlUXD+Gq9tiTsJ?=
 =?us-ascii?Q?cwV8f2OllTINK6KkHa7evk8MZKM89geMxiz1Niw7+QWpfUlLHjBQt/RwGNlP?=
 =?us-ascii?Q?KQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f5cde4-ff28-496d-42ad-08dd203ed40e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9578.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 15:07:17.5211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLpfbwR96sUIByfdWw8Upnr/9W8TYrmC1CxiPanAsUNfB27GEp1NbTsk2XooU6wNJeTmtdwNvRxPcy5SBgFxZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9146

The current implementation has the register disabled since it is not
documented in the MAX96724 RM. However, in the chip's user's guide [1],
in the Video Pattern Generator section, the register is documented and
it appears to work just fine. Before the change I was experiencing
approx 10fps when streaming, after: 30.3fps.

[1] https://www.analog.com/media/en/technical-documentation/user-guides/max96724fr-user-guide.pdf

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/staging/media/max96712/max96712.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 5228f9ec60859..682ebd20851f7 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -462,6 +462,7 @@ static const struct max96712_info max96712_info_max96712 = {
 
 static const struct max96712_info max96712_info_max96724 = {
 	.dpllfreq = 1200,
+	.have_debug_extra = true,
 };
 
 static const struct of_device_id max96712_of_table[] = {
-- 
2.44.1


