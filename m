Return-Path: <linux-media+bounces-18439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C1297E4F8
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 05:31:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AE1CB20D2D
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 03:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C10D8F66;
	Mon, 23 Sep 2024 03:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="JZRveaak"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2043.outbound.protection.outlook.com [40.107.255.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F44B2CA9;
	Mon, 23 Sep 2024 03:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727062275; cv=fail; b=KojcpgcFvui5JaNUlXNz8Xvv6MFtepjTd8XuxmMMlFhXelrc8RfRyACWFuGf0Hg/0nO5RIR+QElnhmPCjQi/LjajjBiVOgrtDfWv+NZK6DmHns3CkgfkpxXXKD7Zek+2Srp2off9rx8SBwxBeTdJnT+IHwK2GRt/iDaCGSbOhKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727062275; c=relaxed/simple;
	bh=pAFnKutodTHOBlrSS3vUnEH1gRyjqOcP1AMctq8FMTM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=cdDcRXMsKwotQoIlEtJE4Mlm9qlM60hpFIup10AMVkKvrWzyG2M/CkJg0X+sh2XKdtFubXMB7B1vTUeHbd6Rk10GR800AvNksYpeHSG1T75/tI2mH7evNiCI9n9GNXzRzKtmonDt/P3QTIgM96a3KaS5TStqaIV1OF2Ge1A/p5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=JZRveaak; arc=fail smtp.client-ip=40.107.255.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKKWHglDnUKHYSOA+ch4JlVNGdTw2os8l3itnMalwZjDrz3JA4IEKKK+/RYgdYm8uKh9F4QLPecDfVVdJtzQEb+d0fKQDJd7UGAF4M9SVMrAVoxzE4m2i9bAwxG6dXOIwZrMN3nFP9ZuKG9uxoG5Q+2gFmpml0qvrbyO9CkIY+LKXezUeiNvbL1QHolME2Tzezjq/qmSeOCD9w9/FDRx42zzFFDbSnQBLfWghlemk43TDnH8yucqIzcfUnpMFr2tisSL50jtPm6aINezu0rsN4RmtDkt2AGffOViKFqjPltSZlRnjo8g7xMll7mBY/NjtnV0EfKX0yr6rNcazA30/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qClbOeUqYq+9PFik33ZoC36BMjVyxI5QCfSNXODNoHQ=;
 b=hZcC4VFozfC7FzP3ZCmG7rdxA8j62NVhQfDpUu+RaLnjj0SH5y2mDAiAEAy8Ak53mPWdDkVCAvhIZ2TN6GpLUwTL0LkEgIyVPqYWhrkq17CFbR0w9rkrpIWpXyjh/AT2sHINXwlWp1DO4/s/0SVf11vMFCyFs/Awvh5xU04JhK39kd7FV3ui5XWzMKfwmQXRpsFUe2QRekXZDvSYT2fV6xBf9IGP3tuLxfowjCYmCj2xMUz7/T7GIz1D/BmJVcU+UYHawDCfs6qW9gy9t1tGkn+Img7p/AwQ2AmSL5vLRDwoC7gLPy2sDkGxvX4AFxDaB6LZccoTaPLsYbyW3xhBaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qClbOeUqYq+9PFik33ZoC36BMjVyxI5QCfSNXODNoHQ=;
 b=JZRveaakgAt/4DA4J0XD2V4ZD6b+o8XWy4IWuDzI5lQnez1sC4BazzYXQxO4QRW8FMLGnsLODFjFA/jQdbj/+7T/r5f441o90zeWdrHttrhc0RdCRdmIILgVfpZPbQ794NujsGQksvsA8Ry8Nj1kF00Rxdnu3L5+sQGY56jWRqqyHbY2q96xf0KHcos/OQXviCMkM0NetBRxZxWkt7RQZlWAY31e2IE2Wv/CSw7c1RBQBoZ32Yj0+yUPtq9Pm3CEUOan7UxLVjFQ+dBKMhYKfDz+rt5hCPzkiKS4h/GxDssbfqfslCxrY33S0R2VYyWtG6QQ29iStkgMTgng7yWJaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by SEZPR06MB7238.apcprd06.prod.outlook.com (2603:1096:101:226::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.23; Mon, 23 Sep
 2024 03:31:05 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%5]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 03:31:05 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jonathan Bergh <bergh.jonathan@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1] media: atomisp: Fix typos in comment
Date: Mon, 23 Sep 2024 11:30:23 +0800
Message-Id: <20240923033032.2420839-1-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0359.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::13) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|SEZPR06MB7238:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f835bf5-a8e5-4aad-5e91-08dcdb80280e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dzXrfCTejRziGflc/Ob6b9Ki0LjBq9hBr+WSllKajz1E7TGzd2nIC10ypMuq?=
 =?us-ascii?Q?NCZFMH6df/KetmnsAsRSTH89yYjJrfQcDoHYPj+SNeawS0rK6GF8X1X5K1xo?=
 =?us-ascii?Q?Mls2xn24jtjNbrtNJtYzWW5/F5rghrx5NW0aU1re3Wb71jopkzUnHJ89hdTm?=
 =?us-ascii?Q?9+YHZ/pGc0fs20UI+VSneHIy3QK4PLESux9GU6GoBkPYH4B+o9bO1MIqYldl?=
 =?us-ascii?Q?PrMoojCsCqKf+IwO7g7VLbJ9C68IE1aeGcZo63jb5YrWw1uBx2vIzwe6j1eB?=
 =?us-ascii?Q?5z90G7c/ekOtONUTl5wi8dcKU1guZxDNLjvzGsCKuJqaUDyrs5YguS+Z7J6f?=
 =?us-ascii?Q?unyIz0H66XZQ4oZAICS2xpqHXBbaFBA9zF5QMfppIYIbIDOs+W4ZaHXqeaJC?=
 =?us-ascii?Q?0Zh3qFJixSFNE6QxkvHjQBobek4ZMEUepVJf29oyyaWKKoe0EhKoZ+Adf4EW?=
 =?us-ascii?Q?4YsnH1s2ug1a7TUaguk12IV+Vat9GAaHcRYkEg8FDeGvYmDB8e9zJXHBbbDG?=
 =?us-ascii?Q?TD3sC/YnGo1ttDrK5PXy4i6csS+ZNmzq80ftWfQPlBt3rbzwBTI+WVHi8ZfZ?=
 =?us-ascii?Q?9f15q+Tf3XxW54zH+biqQBg0CwWa9vpwQ4VVGg/iFydv0fX5w6BYRkjTIjJR?=
 =?us-ascii?Q?rWY09knBrBiVyb8+TsFN/Hn36yUcFCq3OGp+Na4OpZ5JyJqS+I4h+hq7ElCP?=
 =?us-ascii?Q?vFmC6CNonU2z/iI/7VB5e1jmCivJem9HizH4orneh6KI2W0CE9K9BvoDMFgL?=
 =?us-ascii?Q?VVHUquxhjhkiPnGVuekDz1rk23dC2eOS1BxLC4qDccuMOzE+I5me1DNYyfel?=
 =?us-ascii?Q?JBv4l0Ja6jiETidQQgw9vpqUv3/OstO0NZ5sptHuli+CtGZI5HJ/NcY6ttjD?=
 =?us-ascii?Q?pKzZ32Gz74Urs+99vel9AA+r5pcVYnUWQhXt3/QgvLqUCOgsWMfRZw30sSGj?=
 =?us-ascii?Q?JMQ9omyS/tMpnN8ghBLTE3QZWVW4vc1JwL1jsSFmNXDqes4600M34TyGkDZK?=
 =?us-ascii?Q?C4diSHZEHJpzoKnUwry9CxhYOeOJFhjzVosHL4wb/NteMHlSBpRJC9nZG0Fx?=
 =?us-ascii?Q?fin2VWFYSgswAK1sHchx3KxLMbSWkVBxbsh6EDAaTSe4vxkTl1pPRcndzfgD?=
 =?us-ascii?Q?VEVB90vv3eyAeLmSpX4lCJSB/T3O9ZbxJjyK6Nok5CUJAeb5FInk/dVzw0gG?=
 =?us-ascii?Q?KmRcSWx9JdZ3BqI90D4utUOo/p7Z51uAiovi5r8yOGU9W7VTXUAyPQiN8XPt?=
 =?us-ascii?Q?Vn6rii+Zxa493Nej2vTMXPHizXcYLp0KBNN2RBsre/o2YEn4SUL4v1PvgKBT?=
 =?us-ascii?Q?y+vDp6CivHrlCBHIEoi4v2eUcVyq+DtKY9r+2qTu4JJb638f/VbTZnYfyQ70?=
 =?us-ascii?Q?F+LCaPAQw5TVYpV8f1JVVhHkgXTrglIXZUjqmi3+QLZCJfnzu1HSd5oLqBhM?=
 =?us-ascii?Q?dzydXbruxbs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4461.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HJEQoud0QRPKN1hvNY/CHiE4rQZqxJHfF903H/dYm0LNiSmoOMdHpUVRP+sO?=
 =?us-ascii?Q?4uoaNjpxVqtnoY0/nJBYxw2zQkqMt2yTyTNDYddCH1a/Ghwi6g2MIlYAvLYC?=
 =?us-ascii?Q?zB1ALRlD5SFaHb/kxRiTyuJWpf3WQw2lCEP/366E2hVIqmC0FJQzNptxf+sP?=
 =?us-ascii?Q?f/22sOco79ynkwCVshczRR128ZHUBNJ2BSWkyoD/MQRTifIk2IL5OpBTXYlq?=
 =?us-ascii?Q?AWEHxDnKwCMSnSnqQd0AL4GLhB/TC/hAnlo31e1pyL1WXaHeh+gmCEMFWLpV?=
 =?us-ascii?Q?nYfn4modPh5gU7AMuGWpbv6dfuVLwZVJJ9NpI26H8UNOuTejU9ULT8izy93e?=
 =?us-ascii?Q?VeojWw5yV5hSPrv2enGNmeTzuJnjtlN1Sy44YzzonhV6cvhOIgtcqdmQS9SK?=
 =?us-ascii?Q?rDp3XZQAVOySq5r7G2fzVVKxg1AWsNN4gtH02G9OXn6wijpNO/YRj8N3UD6y?=
 =?us-ascii?Q?IFIYFR5VWI5kZJNNCgREjB8LYbeva7uVFDZrCi675EiZuXP7KLf3OxRdeD+s?=
 =?us-ascii?Q?HqYc22lGan+vy8PSPSX4vOfBD7b4Ie1qnGxa4zbebb2/6h8umWYMjcctb0+7?=
 =?us-ascii?Q?sF+AkUUd2iYhvUPApkSRpt6+WZOgHF1dciE0RlT4GyrgEHOB1WG0GADwx9Z8?=
 =?us-ascii?Q?w6bfTGovWtPOxjTbQK2/FlfCWsM5r9+hs32RDW9NDMW/obyJSO7B0lvdeSSk?=
 =?us-ascii?Q?aRE2AW5bwj0tGuXsLhPoIX494+pekAPGuB5FLcXgVoaE76bhUjUTQh2tUwq9?=
 =?us-ascii?Q?ShP4lnkJX1ehwRIPlnjTpmL9UBGnB0n8k4M5lsjFu11nzw8vbxf4K1DxGgft?=
 =?us-ascii?Q?Yyv99v5b35kUhwie+1JmNkIHhu3NAk18DnZXo3s0ZOiSm8EP217vgCLXsmf3?=
 =?us-ascii?Q?sCj+pP+uPkv4iTmxt8aplg+Yd/kXlu477rNUJiZ6eGlaY8tDuL4pqpEhzyIR?=
 =?us-ascii?Q?0BgZFsHv3SZo4eKd3rg40bFvND+k46sZfEbzElEXl+oRLTwXkpsJN5MIynVc?=
 =?us-ascii?Q?VdjhQTWNs2JXXmmSGyopDQzGyFMB7AT+mG9/8Qzg5IGbNQJFDyDl6e3Ehu83?=
 =?us-ascii?Q?wqEzMiDbBg3Adl+k9BnqLmR4G7DyN/DzqsZqvrgedUoGG7sCIPGrmIlJexvU?=
 =?us-ascii?Q?7DVH+q0qvh311fSns7ePar402yc0x8e+lmp7csKfme9t8+OyKG62k76wETYr?=
 =?us-ascii?Q?Js7urEIW2ROPc5FjUGattlQzpvUcDY+Hw6QYaHhiMfdHSByOjImtIYM9QTQC?=
 =?us-ascii?Q?Ki1SHghcb9bIx0hQVoRwHBggpOokMw4Ew83ZtidaSQE7wrd/XTIYi2ni7GlF?=
 =?us-ascii?Q?oYODbGZFLqWUZ0MlCKmkmer6IsajV3A4XhKGA/7HZ5F4K7qm+HGJkH188m2C?=
 =?us-ascii?Q?odsBAMvBbmOkuUkCYfT02nidwUhXmJugqgMvwAXuPoh9Cz1GEZnStt895TQl?=
 =?us-ascii?Q?xypsJN2GCVgyqljF+JbmBozcXuoSX/aBiLbKxFhD3A/ZTNu888NN4YiW9X0m?=
 =?us-ascii?Q?FwCMwaEl5EHykPIf+CszADM66jYp1DAQbsF7WAg+E774F8B616Yv0S43LVKD?=
 =?us-ascii?Q?EJEsRaFZIAsmC+NvXi06BxiLcShidceAaERuDfc9?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f835bf5-a8e5-4aad-5e91-08dcdb80280e
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 03:31:05.6085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jFkiagNzpIEYJ05P4PencMd9EOJFNC/iZ9Mjl2MYnJatJhw4RQIuB84yu2EyvzytrQngxoTELLTfDVImYJCkKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7238

Corrected typos:
componnet->component,
cofiguration->configuration,
doubtfull->doubtful,
consisit->consist,
coppied->copied.

These changes fix the typos in the comment,
without affecting the functionality.

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c                | 2 +-
 .../media/atomisp/pci/hive_isp_css_common/host/input_system.c   | 2 +-
 drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c   | 2 +-
 drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c     | 2 +-
 drivers/staging/media/atomisp/pci/sh_css_mipi.c                 | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index c9984f1557b0..eb46ba4f4f13 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -55,7 +55,7 @@
 /* G-Min addition: pull this in from intel_mid_pm.h */
 #define CSTATE_EXIT_LATENCY_C1  1
 
-/* cross componnet debug message flag */
+/* cross component debug message flag */
 int dbg_level;
 module_param(dbg_level, int, 0644);
 MODULE_PARM_DESC(dbg_level, "debug message level (default:0)");
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 8f2f4e8eddd9..c18f62fe66b3 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -406,7 +406,7 @@ input_system_err_t input_system_configuration_reset(void)
 	config.unallocated_ib_mem_words			 = IB_CAPACITY_IN_WORDS;
 	//config.acq_allocated_ib_mem_words		 = 0;
 
-	// Set the start of the session cofiguration.
+	// Set the start of the session configuration.
 	config.session_flags = INPUT_SYSTEM_CFG_FLAG_REQUIRED;
 
 	return INPUT_SYSTEM_ERR_NO_ERROR;
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index 7ce2b2d6da11..3bfaf52c5cdd 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -951,7 +951,7 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 	unsigned int i;
 
 	assert(descr);
-	/* MW: used after an error check, may accept NULL, but doubtfull */
+	/* MW: used after an error check, may accept NULL, but doubtful */
 	assert(binary);
 
 	dev_dbg(atomisp_dev, "ia_css_binary_find() enter: descr=%p, (mode=%d), binary=%p\n",
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index 2d7fddb114f6..0ab83e1b51b8 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -362,7 +362,7 @@ void ia_css_frame_free_multiple(unsigned int num_frames,
 int ia_css_frame_allocate_with_buffer_size(struct ia_css_frame **frame,
 					   const unsigned int buffer_size_bytes)
 {
-	/* AM: Body coppied from frame_allocate_with_data(). */
+	/* AM: Body copied from frame_allocate_with_data(). */
 	int err;
 	struct ia_css_frame *me = frame_create(0, 0,
 					       IA_CSS_FRAME_FORMAT_NUM,/* Not valid format yet */
diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 80f0395cc560..710744ff0b24 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -169,7 +169,7 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 	/* ceil(words_per_odd_line/8); mem_word = 32 bytes, 8 words */
 	mem_words_for_first_line = (words_for_first_line + 7) >> 3;
 	mem_words_per_even_line  = (words_per_even_line + 7) >> 3;
-	mem_words_for_EOF        = 1; /* last line consisit of the optional (EOL) and EOF */
+	mem_words_for_EOF        = 1; /* last line consist of the optional (EOL) and EOF */
 
 	mem_words = ((embedded_data_size_words + 7) >> 3) +
 	mem_words_for_first_line +
-- 
2.34.1


