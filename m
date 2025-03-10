Return-Path: <linux-media+bounces-27923-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D7DA58CAB
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 08:20:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49D78169E2F
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 07:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E441DE2A4;
	Mon, 10 Mar 2025 07:20:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021092.outbound.protection.outlook.com [40.107.51.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A3E1D79B8;
	Mon, 10 Mar 2025 07:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741591220; cv=fail; b=Y/AyccwIBYhscS8A5qJA9rAiNZjo4BTy48P2m2YMcnwbARg8KLFOr4AoaQOwWqYq2dLLMgmFG+mK1v/5yEWdGDe7E+oBixObQEH0u4HfxozjSYHLEvZrSJnb/ORJdE0FkS78C1hM7o6rdQneupsh4vkuQaHN4bXa2qEE7dEbGXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741591220; c=relaxed/simple;
	bh=qxSDoGR4K65y3pSaLQihAzYHsJTCKMzw5SUuG85A0Aw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s2grXUD5pNwQ/OjO5Y3bFiQbMHppoTrcEhyA+7P228TeG6Kb0fcrhJrUadL1YjzBFCj3RjatBYuEzy5ttzz65lKcvFz1w2CG2/CEALCO69X19ufHpJDReGoPBBlV94HM6/Sjb4ojsG8X7QVU+k9+DvawOm+G5QaD5fZDIZyA3CM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nKf0g/CWhzmKWhyFCqw6vjGwvyB/G1YyTzP1sRCRc4Yj2N0OJYMBVAIlIezK3dwdD63qRSzz02HXyhNDcJdD68aNYl9BKx6RM7MspyQMZ1r6fqKLw9D/de85FWNtc+rk+DhH2djCDs9ouDp6ry02DtdSdRMtPT/aIJT0p8FeY0MCc+nEigGx/6v3xy5Ci+fiPTX6KovrpH0UivsiaXQh2z0Tg4zEsew270N/k/VSA7BPTQokCmdXmc0rcdhaHo4fFGBHDPHZwcWP+/cLg+FZoRb+BK90yhlxrMqQyrWV1OgGrasx4WsFCRnDGrRntrwuVZyofVGkOsgBaCaEbV5qBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWxONxZB8oT3Ra4WOOOcRYTtxnxRR6sDGO+cu+Kk8mM=;
 b=qw7lmr4ZzEtRGZ9+kGor87cNpVi+0R6axF7l+2XugSbHknEO5plr2UPH44+au/5RgLybz4Sf/9vNu0aHAF2qGYMl8ktfyLHmvbeaLXCHnakY7QhsmOb93rstdkSC8J4glKMnCtaF3+XhjY1A8STCMZuRu3FLO9emUbUhsQRyhZB9GjTubLV2WIg6YdAZbdLtvaBevXh+LOZ7ciOmZdmLp4HrhH0A3oO0wddSSr9Zh/5CwoXsMjXS9TtQRjTxKSVriemQW8R29HkQpDV7qKl4rJhhyG/wRdavgwxYa1YtjFnga1PsWSYtE0ngFWCUoPBA6Ph6YgHCVouRvC4mbjJ1Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1311.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1ad::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 07:20:10 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%3]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 07:20:10 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	kieran.bingham@ideasonboard.com
Cc: Shravan.Chippa@microchip.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Luis Garcia <git@luigi311.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] media: i2c: imx334: Remove redundant register entries
Date: Mon, 10 Mar 2025 12:47:45 +0530
Message-Id: <20250310071751.151382-4-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310071751.151382-1-tarang.raval@siliconsignals.io>
References: <20250310071751.151382-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PEPF00000180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::50) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN2P287MB1311:EE_
X-MS-Office365-Filtering-Correlation-Id: 239a4e1e-b80d-42d5-3f61-08dd5fa3fddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1KjiJ0fYDMou/pfIYXmOCq3dybuaBUIXn/xrV3zfpjqHkhW2nDwUb+IVygGc?=
 =?us-ascii?Q?WdehS9icsNYS0bqhNqBvDk9FSACPX9eAgRtEOuv/4C+wZVP/A5DfIJz8NYZx?=
 =?us-ascii?Q?pxAzLR5Uv8C6seLyL9Qkr2l8N4w/J3Z8v3vR5O/Gxu/XJuyBsTRy9npgmEUo?=
 =?us-ascii?Q?3I5NozKJFxYmqQi1Ag2JOo5xyXFZQ1W8MKdMsUvl2HkE3J0Qow+IZkYetoYH?=
 =?us-ascii?Q?8UphCeVzqXQNkgHl0uXNCY6w6mLVligZ/kqoj6Fvhvcx4o4sRDu/qa308Fik?=
 =?us-ascii?Q?13YWUS8eeA86b/yLRquvhzzrug1v6iPZlSi2TuFDb5N8+PB+wHZ8ar8GrCsY?=
 =?us-ascii?Q?MbX1YCDrzfe6AE9PDFOYJtOwxxz/PMIb7fp7WYnyp+ohXlh1ggqnQr5GYwIK?=
 =?us-ascii?Q?ctZaqjmAKtIUMY6KfrS526wVCICb1iuiaib59lZ1EsFR3ut2aqs72FSIVfVt?=
 =?us-ascii?Q?21Xmif94QGGx1TIxkruX4JDxCWIWCD9sMSD9ZBsAwO7ERPQtFjydcS5bukil?=
 =?us-ascii?Q?uhMzznSSLrKEc0Nw9d3rGuQu3yIv76GVk0NVrLZSpHBwSjxHOGOyV7TD410P?=
 =?us-ascii?Q?Yl/DuwZW8N8Ixyp9gveMLg3H4F7XeZAsJqb4SfIn7GnI0lQmmvfzCROoLFsj?=
 =?us-ascii?Q?2EQszGB8b496mA7qGdduOIHdS03xiCHTMOh54EphnJBX+YHP5ZwgwkxWiYWy?=
 =?us-ascii?Q?D8eT8v7vuVrnA8Q/WVGTjechAVETr2+nFHyMB/smXKaN8EQASeLDpThlqfuo?=
 =?us-ascii?Q?jKPDXq/9NBMsDfnNv55DQ86qwPtUEdZTXcfsFLqTDzW+6G7prA67tw1Fndh2?=
 =?us-ascii?Q?XwemRnetOiHgvTWL7WnfTYgQMtys9KpwBJ5q8aEgy9UFiqnLNA5P9X8qIhCf?=
 =?us-ascii?Q?kzfb5Uu8bcFNrzH0fXRldQro6grJoKOku+jVJ+FU8mzx92CzrGIURxFgsLil?=
 =?us-ascii?Q?e/+TR+M6w6R3MsJwcOYgdLmcoa2uSk0l72AJ6fb5HE+u09A9wwD1RMK1dU4L?=
 =?us-ascii?Q?Vzd3gSDbsxA2LvVTzTzgA+vix6kDr+McNbZSvcW2d5QZ4pT9xwWPckb4qfrX?=
 =?us-ascii?Q?oZuF/ZpYkZiK/SebrHmMtI8W3bs+FQXhVyX1qY7PHh7P2AFYArlUSt5C5yGF?=
 =?us-ascii?Q?uEg6fA1IT7a/gI2B3UWL+xUVAYufaL7+kQJGIrXcZUNkNJVJpXy+o4O3TF+R?=
 =?us-ascii?Q?QUFhcliXns/PP0Kms1P9tyYT3BcFEyC8V6BXW7gHLEn97HKZGVAuJSd3Jrzr?=
 =?us-ascii?Q?690VYZe2xF6lHsqUq7Ro1+qmH/ZaGVwsQMta9lDgQQm0mXCcX4KF3eG63EKq?=
 =?us-ascii?Q?xSIgWxUuC9sNtu53UIlj4b+Rj2WBZT8TskYiszkCX84QDmipSLyvWAU8iKRo?=
 =?us-ascii?Q?++HVq/nalV9y9NU5I+9i97eSu3qRV6o38WJopyNJE57KH8k4DegcI443yzND?=
 =?us-ascii?Q?y+YphU2lDpA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k2nvlXxJgZZKMVZDCUrmygnnOuCvU3tIAMPCrTAT3aSOPz9opTsd5Abmc0E1?=
 =?us-ascii?Q?wOUqE77nbgLSRDXY2w7mHbgXzD6LmCamo//pLt59mNxi/1mRGrkQlXAmi77m?=
 =?us-ascii?Q?Cd9SvucmQnunWYG/rcxWQLnGmWklwj5fAjhUmO74AdNgOMJUahlBlj24sJ3y?=
 =?us-ascii?Q?uPHsYkD/LlxLmjatlxjmRAgDUR/M1lrb//9RUQM//cuXjedU6wAXukqwSIxR?=
 =?us-ascii?Q?Liv7mRD7Snwk4qQwu52/vtKTzzOVWwZC0nMSPWM3/sSIus2pMjuu+DRDU8k8?=
 =?us-ascii?Q?kksF2EqjiUN5R8LaTuAga2aWdZzS0Mjo2hoAnpzWjdLNfwjOduAvUfjjvENL?=
 =?us-ascii?Q?QRhhFkQYlmsyl2d7y+9fJyCQrqQHlL3WeijKPSqwHWDDAWy1Ok2SvNuGH1Y4?=
 =?us-ascii?Q?jR7EQloAwjdRefWT6erp9IPNC/rLYUgAn9RTwRCoa1Ww2kzoGHhCjkTuJGPp?=
 =?us-ascii?Q?UJ4tKsFaPyu8DN4sUO0TaoMzlogN7J8fjzm1BmvH9SXvEEKj0E4l4SdpNZ0U?=
 =?us-ascii?Q?Z3FQT0Y/JuQKJ7jd+SllDvyBu+U5EOI0wm8zlXGpTLSvbFCFNmZlnvoC4ZFR?=
 =?us-ascii?Q?mksDhUleghnLjRiQylyoCM9EFgEHSqdpLJb+7ndP+bRUEXEOk2VOwVipGHXz?=
 =?us-ascii?Q?JqgKTR3T0fX8KbsorDtrIw6Siauu4TeY4+RgY7o634yed20n+ChzVMfKNmiJ?=
 =?us-ascii?Q?Z+633NNahUR0lRmng1HEbajxxfc1ddULDoZEM9vRTD3vvhVVt261QinXDoP8?=
 =?us-ascii?Q?3tQzUPsGRYbG6lAOoJIT+2qnyMhpidUdEH53vDrvZQYNxC3U9jiAGXKdnlXe?=
 =?us-ascii?Q?Uy5SA8pBbi7Pkt2ZGHA2Vw6Q1rO7MCvEhZ9E38sr3IsnJhbnG7WHQjC3AYjB?=
 =?us-ascii?Q?k30mLH73BgTfCaOqVbSBY13CbkABukE0jd0naMRpR8mjWZPcMVRGF44rWK7P?=
 =?us-ascii?Q?/K/qe9jSQK85NCLPcVURXDjuDE2ora+XGVJCvMezfEylIxbNHApw7rtkzzFa?=
 =?us-ascii?Q?M9c3uxjBYCCwFfzqzVa52inJoqKTgraaQV/EWUj0d8VGJx66E/j99pCPEkWG?=
 =?us-ascii?Q?fe6yVdAQe+AzQPsJ7bjF9QUngtv3Zhpw0l9Z+rwg5qZd75CSRi1bIHxSvdMS?=
 =?us-ascii?Q?jsWp10KViOeFH7EYGSUY4LeETRW1KkCykiFsmoAbQ+Ui7chO/kQb9rm2eKUE?=
 =?us-ascii?Q?mozQrKtoUILKbZEof8m0+DGYm3SF+rMKjwE2rWmGUYK+hCCZTNa8IGbDzZyU?=
 =?us-ascii?Q?HTu3U16xxUgbG4KB057BTVJAQ1DZ5h/ek3dO/nTW0ktqzrlKooRsoF9KFthQ?=
 =?us-ascii?Q?61gOG3HFb6VxHVrIWoMqV/oVtXxoLdcVnYwgWSolDKUGuPgQsZdvNcSyaAwp?=
 =?us-ascii?Q?21KvQOoY61Ak8jdLcgg1op65Wh0d+c7xC3cmnblnKL7JmgYMdRLRNkqsbFjT?=
 =?us-ascii?Q?49Pe5Oo0GrqWoIF55Q1iGAIfy5tC6rOVd66y5fk16+0EOn8T+0BbPq55hiFu?=
 =?us-ascii?Q?P4Uw0plAbOugaR5k1wWU449hXz00LKCt9BaHk0Uu8WrvIOB0BRw2hT/WdLGA?=
 =?us-ascii?Q?Eyi7XsR+CpBmNO6P55Pi1qzGysKAoG5Js3UU5L5m16ISUAR9K1AWbiVXqjpe?=
 =?us-ascii?Q?xw=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 239a4e1e-b80d-42d5-3f61-08dd5fa3fddf
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 07:20:10.1092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nzZerQa3kTvuduuS1aJ6DPOPWsUlK8lhW1re81B3dwunKzYsXdDVHFSKWRL26XzAkxP5zntGGlYAwVtEBK/Hu+Qb5EcDcwdlzjVhCH+s69Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1311

IMX334_REG_{ADBIT, MDBIT, ADBIT1}: Already written in
imx334_set_framefmt function.

IMX334_REG_THSPREPARE: Unnecessary repeated writes removed.

CCI_REG8(0x3e04): Unnecessary repeated writes removed.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/imx334.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 1fed03494813..24ccfd1d0986 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -226,7 +226,6 @@ static const struct cci_reg_sequence common_mode_regs[] = {
 	{ IMX334_REG_OPB_SIZE_V, 0x00},
 	{ IMX334_REG_HREVERSE, 0x00},
 	{ IMX334_REG_VREVERSE, 0x00},
-	{ IMX334_REG_ADBIT, 0x00},
 	{ IMX334_REG_UNREAD_PARAM5, 0x0000},
 	{ IMX334_REG_UNREAD_PARAM6, 0x0008},
 	{ IMX334_REG_XVS_XHS_OUTSEL, 0x20},
@@ -239,19 +238,13 @@ static const struct cci_reg_sequence common_mode_regs[] = {
 	{ IMX334_REG_INCKSEL4, 0x7e},
 	{ IMX334_REG_SYS_MODE, 0x02},
 	{ IMX334_REG_HADD_VADD, 0x00},
-	{ IMX334_REG_MDBIT, 0x00},
 	{ IMX334_REG_VALID_EXPAND, 0x03},
 	{ IMX334_REG_TCYCLE, 0x00},
-	{ IMX334_REG_ADBIT1, 0x01ff},
 	{ IMX334_REG_LANEMODE, 0x03},
 	{ IMX334_REG_TCLKPOST, 0x007f},
 	{ IMX334_REG_TCLKPREPARE, 0x0037},
 	{ IMX334_REG_TCLKTRAIL, 0x0037},
 	{ IMX334_REG_TCLKZERO, 0xf7},
-	{ IMX334_REG_THSPREPARE, 0x003f},
-	{ IMX334_REG_THSPREPARE, 0x006f},
-	{ IMX334_REG_THSPREPARE, 0x003f},
-	{ IMX334_REG_THSPREPARE, 0x005f},
 	{ IMX334_REG_THSPREPARE, 0x002f},
 	{ CCI_REG8(0x3078), 0x02},
 	{ CCI_REG8(0x3079), 0x00},
@@ -339,7 +332,6 @@ static const struct cci_reg_sequence common_mode_regs[] = {
 	{ CCI_REG8(0x37b0), 0x37},
 	{ CCI_REG8(0x3e04), 0x0e},
 	{ IMX334_REG_AGAIN, 0x0050},
-	{ CCI_REG8(0x3e04), 0x0e},
 	{ IMX334_REG_MASTER_MODE, 0x00},
 };
 
-- 
2.34.1


