Return-Path: <linux-media+bounces-26599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AEDA3FA0D
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 17:05:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CF4F19E0E3E
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 16:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2152A21638B;
	Fri, 21 Feb 2025 15:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="bHYUgCcX"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011054.outbound.protection.outlook.com [52.101.125.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F0E215F4A;
	Fri, 21 Feb 2025 15:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153409; cv=fail; b=axx1iQ6lqWwAy0JLm+FcU7iod5swJ9zqOBMk+zyse4z9j+9nsJJoYjaJtHMlpg+ISRXVmGVYMnJAxbWXgrUn2cz7MlXXaQlicy7uOwloOO78Cai8mVtQzAwyZ7E6oxH6gZGCm2dzZkEPuh+hzzYgvsFTuSaNcRNBnnJl+yunrAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153409; c=relaxed/simple;
	bh=QrZu0X2dwVSo8QpnPrHJf4kLaOZztoTgRcADkqaC8dE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P0CqX4KXjs9CuRtRIFxtzXIj2v5ZtK4TgPoM2RGVKKM/L870HpRJGfS5NHLkmr1MQrW4SVf2ijeNY4aLn3CxI9vW14ugEpNNK0oMOCCtszbqf2d4MY9gr1Ww3eLsa1G2Z/nnbP6TWDibBufqp3qtGoUWkz87RcUzJHByia0xS4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=bHYUgCcX; arc=fail smtp.client-ip=52.101.125.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nNdO2q0kHYM0cg4J6J8R0l4BM6DXh7jGkflhlCQqJMirizvcqYqTJwf4f/5MfKI/z8pUOPa8NgcSf2Hi7YPEzW/HOiskS+8GKQi2YIIP6DlEnlCbTwOBzUiSvo9HfsQDR1CVhsPsg9pb7hbtCFZcReAjYKg8NJaoPUDLCgaZBxE0Zj8Llpu8eeiobF8Z++QDLqH92eLgh5Ew9xQ5m2oTQu8Ejir4LSL1J+umEk2cowfSUo8j88y8KRDFjMWZZ04nTf74XyzGvu1j45HX+0sUCwhD+HgqshLO3QPJUTOrSkMCNBnYUXFFvBl9DoHzqQr7s0SArr02a4CNcKh+c9Gusg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lzue8yDsZvJmoftv0/dkXZytC6UpQW7Gmi8GFsOmbUc=;
 b=QvZttsFkDQQxiE8pK6pDzNhtONBmzHFJR9DbJI4QJNkoDPmbquzulqWL23tBssNMbtMELwEcp6yOsB+M2trIStEsQKkyVV5KjgYP6zw/lZMbIqTcufaPY7WHyv5MMeXibBiHKYUIb32fQD+7hav4ZQR5zHXeg90e1gfx1Au/zcQ2+MpNHxNr12d28sHn4FdiPpfWeaQYN745K/Rn9DRb/XIdrziEKofRZJkh02cLlt4y3wcmQwIDyZAJmJ1JBzONq5ZE3WjoTny4w0InyFjWjXoMxh7SM7GetmskV1tjiVOcvpY4UAZ9PSmpko3s0wk3EjJJqvB23BD6qn2d/X7HbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lzue8yDsZvJmoftv0/dkXZytC6UpQW7Gmi8GFsOmbUc=;
 b=bHYUgCcXNttETaKgIYvT1ObWsHVwItiWCEaVMEs7hn01wxHl9Kd4ogslf3/IWFGxojz8OTHgHblrL/TRWRZfhQT90CC9S/2hRVSSxGw6QFfxqJNuT4cHayNhQdncat06LzsNPxA1jaGKnNnbMvRkCawF2Or3J43J9CbHYrdW29g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB6238.jpnprd01.prod.outlook.com (2603:1096:400:7d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 15:56:44 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 15:56:44 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/18] media: rzg2l-cru: rzg2l-core: Use local variable for struct device in rzg2l_cru_probe()
Date: Fri, 21 Feb 2025 16:55:20 +0100
Message-Id: <20250221155532.576759-7-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::17) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYCPR01MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: 71907617-3df9-4ae8-9220-08dd5290572e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?joyDfya8+UjthAD/24eI765Ja8pDJ/Vi/KtPvZaCqxa/+pNsBiuomma3ZYBV?=
 =?us-ascii?Q?CSM475U3Pemgs27UKf9EM3JJIL+1SPKQ0cKRxgNkvg2dnlP7Tg+X1xgVTP1U?=
 =?us-ascii?Q?ddN8RAw7v12tS/SMUwaLkLtJZiW4pK1BQqaJktMwFiamnIgjdxQ5mzKAP/YW?=
 =?us-ascii?Q?uEmaGB/3l91pojL1HjFbOI8e9UlUkeJA+1ROGXVdxX7QPMEVrlFgis7DF6L8?=
 =?us-ascii?Q?IZF1aRgb5duyCACRBx+/KM/VP3FIRQCY2TN84x7Kpeu/jqd2H48RWQ66Nn/O?=
 =?us-ascii?Q?PpRfFPe67RCXRcNUQ27MeqDihd8wDVURv3BfCtS2AT0RLIzqsDm6tKg1m9Um?=
 =?us-ascii?Q?flEhJr3HUquyB/MUpTUbTVsEC5Mp3qHzDyAEDAXIQNmyIwIoIHZZ9KZoXWzu?=
 =?us-ascii?Q?uJZE7DeeNpvF2AX3hXB9VqM01iBXpd8N9S1723oNwiSMh8pL05062sKZeZLv?=
 =?us-ascii?Q?VM3c+Ryg7x8q/K9YX6ilJLkxDgN1ZmiCur8Ky8MpvF/4fr2WaGLzKIMHf53l?=
 =?us-ascii?Q?foPY8FNy1noYO1iXe9O3m3oJN0Gyx6XPMWoAERuY7HT49WjN6J2sJqhyJHeu?=
 =?us-ascii?Q?LcnZHD/o3LjVvHV+1dBFU8SOVJESoqzsVNWc0jHPgBm2znNBq9223NAxmaZx?=
 =?us-ascii?Q?Xl/ccCcihZz5qdeI45OHoj38fzQtT4CyWByjJqOFXCvUKUO5HPZefnuF6qPO?=
 =?us-ascii?Q?56IOb1A69rxMEBCt6f5XypK2bJrnFQzeL65aegD+VKGTMBI/Wa5cHkb/IK3A?=
 =?us-ascii?Q?7GDZIrCVTXEZtSBSz609B/jNpbaOCw+VE/c8Eo8PlkP7sIdlkC3q2BU94eqk?=
 =?us-ascii?Q?f+m2wszzjjrAATZGQ2UmqzJaq9Zrp6dnj+ygJW7ly0/vWQkqyKO/dv957gEM?=
 =?us-ascii?Q?H1zJDLAFwc5J24OIoK74ccEfkf78PIhKG8RvKWh6jmzWJH+AKIJoivVSvOC7?=
 =?us-ascii?Q?XnI+cimgnaLhy0S4vc15B1N1Tx1rI0TSKkahYNoyl9wjlnYgo/gMNHMig7sN?=
 =?us-ascii?Q?XkqcjiIkXuTVaOY5+uH5LZH9qGaVL2F/UF4y23vWOknI5id/jO9ZSeZpSobw?=
 =?us-ascii?Q?2i+2UsEDOymFFXq84u4g4gc/GhucPVm2t/76948iVqY5tUFDvn2IN8Vp3AU3?=
 =?us-ascii?Q?ai9bOcN15tNxRCj5nOnsP2Ta8efkvWR10+Bq6+INPJ3tNXzyguOzkEyC6bCm?=
 =?us-ascii?Q?W/uTrkAPix9LFs0BZUj79o1CaZtEDRmEnf6DvxrO6lYAnYoJDKw65tJ0/I3u?=
 =?us-ascii?Q?xWwd0rcjWnJoJTWAHNZL5lYs+hyn7GtVP/ght2t63vGvOHkuu/YL32hJQBkk?=
 =?us-ascii?Q?YuaYrMmZ2N3J/COXCtFQho3M0HdCQ3w+R0BUVX2UbqimWtgVJyDLJRUPYtFs?=
 =?us-ascii?Q?zzyMN41AZNLBkDp5u3TOcLsY4KlZgY/SmJPG8hDEyY12CKqM1rXVADbaIfxC?=
 =?us-ascii?Q?p8Kwsz7o2Kd7xbLWtXvLiw5/05zH06d3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UxccKtFd3MKNtJl3RgbSMNiMoBC5NEjNrCepDNF3ZyeI2mdCs4iXwpomgij/?=
 =?us-ascii?Q?w+pm938sGXjbH7gr+QTjCmn8SrahPAhfQQH5ycKE/1rLGGvf+3cX1xgSVmo4?=
 =?us-ascii?Q?SdojVil4lOZkPYym5K4eWUUIKMWwun/ePOYY2lUXY/FYkp0ARxU7Jgd5tLvJ?=
 =?us-ascii?Q?/1JasOtwhfRt5xZXivFZf750gtAOyHLl5/l+unfxtRZ4dSYk06U9xSOX15/D?=
 =?us-ascii?Q?S2IrNsuLfBrjQAXt4GapRFAKuAOV4ct+cKhIoCTkb3Fhn7MPI+X51JIAXlaB?=
 =?us-ascii?Q?xakj6NTqe5OYaY7TuPucSsPYT0UAMnuTlLH4mO8dtPKSdiy2XXr1HkrrBglq?=
 =?us-ascii?Q?GoqO3fhUqJbGF1164Mh02yA1r/PBmY7JSxPc+3RdzGI6NoK3aibFj1dNqlpP?=
 =?us-ascii?Q?yBUvVHn01LxQuhzXNEVxxggRneNt77WlupPRT00NSRgjMXYIEzublzJcKKqn?=
 =?us-ascii?Q?Bmstxga9WB1XdAESsVOceet305igNeBIhZj4ta8CyojAjZjOESR6fE/VqFNq?=
 =?us-ascii?Q?Rqz+eA83T124kvFHpmdovg5SvVewJXI5kb/Uqe9PycWmGx/6aEOyTYB9z3WM?=
 =?us-ascii?Q?SxbbS2J0y+nkWukaFEAy7g9xhrVCsPnRYSOq08Ya8jpaTqD18PNCIYQC2GlP?=
 =?us-ascii?Q?uxD4qBpIYCeIHPWdlbj6lbW0hwYFAR2V2OgWTEiVWNTdA/WCDAfjvqC3ZnXA?=
 =?us-ascii?Q?Pm9bE6AKE9dkRk8q1noAcCR/VCX70khqLp+0pepKyDXaIk85U7KbWAIL4Xip?=
 =?us-ascii?Q?jlYtfYYsfYPpfDp/CNabQtdiY0943dC9rXagovhLlnJC6AF4cEn7M/jQzITs?=
 =?us-ascii?Q?mGq0dzEUjh1aFa/8enEkL4KHkEuD9rm/R9kl4wdvrKNEQ/Iq2G6X89OMYxxT?=
 =?us-ascii?Q?s5o+qatfQnKo30Ks8YRN7HqAhgWWCdSQHi7G5R38ASpUSulecYQX1JILGgEh?=
 =?us-ascii?Q?iO0Q41ASNVCW14jHHY6mUKU1cRU9tsYOUqoh2k+L3r8tmrvaIG/LYJLnI11s?=
 =?us-ascii?Q?d6dBakkcuMF/S0kbdEMXuZJTlKSaBWeuDZ9Bw8n13wmq/+QYp1QBN5QTFNKm?=
 =?us-ascii?Q?z6XSI8QNU4cnpBSWMmzmfcwxGd15y12aXQqjyRrvzZf+5C6+aNfLuNfXPzqW?=
 =?us-ascii?Q?wfyrXBCqxXT8FQQUVK19g6Pae4eKYccknCZBkn/+q/sdgVzlBSNaHw2wY7Pm?=
 =?us-ascii?Q?dRYQJTzipxg/IABCsNSW/WIpq9+2RfT1mYqB/MfKTEpV3hQgQB4L/FTze54p?=
 =?us-ascii?Q?VCitZV/qkqvuWHOaGnc4Loe4eHjd6v4fS9amyLM5ygCbAMQNrHVOd9LS8aTK?=
 =?us-ascii?Q?+mCOwYAJ1wyRRSMCCnnjwObZ+7i5h/TAfccDs3LA8HaHPKOmohF3yZvmcKlY?=
 =?us-ascii?Q?RqbekWAX4mQgjYWL1o7eg8uPGZKQCcDLklFrAo5q9URhLJM5fjfB4L20yhrw?=
 =?us-ascii?Q?3neP/0oYICkJHUHasOdSPKY9ngeesSv2ZLoMUU2ur5fiJodI/a0Lzn3Xoqey?=
 =?us-ascii?Q?Ljaxv/+nIcj/IBkthdDthifzdOQ7KEx2uoIj4nrYelbmR32c2b8aqUIa/uWQ?=
 =?us-ascii?Q?P50xQgE9oVnD2HsuksOx6kxRtUlrMmBLEDGgkYiQbSrIrX7ygVJwv3W5JeY/?=
 =?us-ascii?Q?tOBiCwTZ6YCrvod1/3LXbV0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71907617-3df9-4ae8-9220-08dd5290572e
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 15:56:44.8900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JGMHhMpHF52eb2rwdYOU+eXG2G34FKNY2N8wrCNVqtgLF9EWE1hlxmonQ3pc8GTUUd5jVegSx3K4K5t/iTk8tsxgtO5mBDhAOsmEwq1QMBgemcL6SBpHujbGdQ0n9YrG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6238

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use a local variable for the struct device pointers. This increases code
readability with shortened lines.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Fixed commit msg and commit body as suggested by LPinchart
 - Collected tags

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 29 ++++++++++---------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 89be584a4988..70fed0ce45ea 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -240,10 +240,11 @@ static int rzg2l_cru_media_init(struct rzg2l_cru_dev *cru)
 
 static int rzg2l_cru_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct rzg2l_cru_dev *cru;
 	int irq, ret;
 
-	cru = devm_kzalloc(&pdev->dev, sizeof(*cru), GFP_KERNEL);
+	cru = devm_kzalloc(dev, sizeof(*cru), GFP_KERNEL);
 	if (!cru)
 		return -ENOMEM;
 
@@ -251,32 +252,32 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 	if (IS_ERR(cru->base))
 		return PTR_ERR(cru->base);
 
-	cru->presetn = devm_reset_control_get_shared(&pdev->dev, "presetn");
+	cru->presetn = devm_reset_control_get_shared(dev, "presetn");
 	if (IS_ERR(cru->presetn))
-		return dev_err_probe(&pdev->dev, PTR_ERR(cru->presetn),
+		return dev_err_probe(dev, PTR_ERR(cru->presetn),
 				     "Failed to get cpg presetn\n");
 
-	cru->aresetn = devm_reset_control_get_exclusive(&pdev->dev, "aresetn");
+	cru->aresetn = devm_reset_control_get_exclusive(dev, "aresetn");
 	if (IS_ERR(cru->aresetn))
-		return dev_err_probe(&pdev->dev, PTR_ERR(cru->aresetn),
+		return dev_err_probe(dev, PTR_ERR(cru->aresetn),
 				     "Failed to get cpg aresetn\n");
 
-	cru->vclk = devm_clk_get(&pdev->dev, "video");
+	cru->vclk = devm_clk_get(dev, "video");
 	if (IS_ERR(cru->vclk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(cru->vclk),
+		return dev_err_probe(dev, PTR_ERR(cru->vclk),
 				     "Failed to get video clock\n");
 
-	cru->dev = &pdev->dev;
-	cru->info = of_device_get_match_data(&pdev->dev);
+	cru->dev = dev;
+	cru->info = of_device_get_match_data(dev);
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
 
-	ret = devm_request_irq(&pdev->dev, irq, rzg2l_cru_irq, 0,
+	ret = devm_request_irq(dev, irq, rzg2l_cru_irq, 0,
 			       KBUILD_MODNAME, cru);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "failed to request irq\n");
+		return dev_err_probe(dev, ret, "failed to request irq\n");
 
 	platform_set_drvdata(pdev, cru);
 
@@ -285,8 +286,8 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 		return ret;
 
 	cru->num_buf = RZG2L_CRU_HW_BUFFER_DEFAULT;
-	pm_suspend_ignore_children(&pdev->dev, true);
-	pm_runtime_enable(&pdev->dev);
+	pm_suspend_ignore_children(dev, true);
+	pm_runtime_enable(dev);
 
 	ret = rzg2l_cru_media_init(cru);
 	if (ret)
@@ -296,7 +297,7 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 
 error_dma_unregister:
 	rzg2l_cru_dma_unregister(cru);
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
 
 	return ret;
 }
-- 
2.34.1


