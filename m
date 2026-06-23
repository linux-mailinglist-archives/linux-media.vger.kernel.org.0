Return-Path: <linux-media+bounces-65431-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SlHmCEEDOmo40AcAu9opvQ
	(envelope-from <linux-media+bounces-65431-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 05:53:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 708F86B3E39
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 05:53:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=s1HeNlBj;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65431-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65431-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EBC9303FAD4
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 03:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17D838D3F6;
	Tue, 23 Jun 2026 03:53:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013023.outbound.protection.outlook.com [40.107.162.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CFB329C60;
	Tue, 23 Jun 2026 03:53:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782186803; cv=fail; b=a3HDcdQeAKtGmQrQHN6EfMoVqDGw5IE0ILyqDr5YpZ04Ym7iumrxcQ5aff09qy3Rd/2qLzd9Hz+kkZaodqMYJyhVXjErSMWEBKMCzqUOZWxVcHgyaBfJ7bOwMhYkHy6Sq8QQSTVy5JB1m+XLyxM2ZiioFNlae3oa0B31wRGYcBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782186803; c=relaxed/simple;
	bh=hazXwL2Bz0wvrZJiNXm/G5Pxy6FwNk2hQgOO4fFegYw=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=AX6fUXDmaGOd/3hGCPUN3Xu+VA9bpOyXXHRw/8BKW1IRbgR7MYDAdv8XTjWiTeNyqZwW1r7wcjFghSp+dyi31T6hWlFzJVC+x7qvWw10AO7Azql04wESc72gv/7AY6Ecgrej3b/cNXTzKJn139aFaWD1fp5XmvKFmE+GHguzjdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=s1HeNlBj; arc=fail smtp.client-ip=40.107.162.23
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SegaQyiZwsSzpAdPJzGovsxyLRV/v79x+Uqq1DH17/KyXAuBITfLmjZwk7x0RgPgSro7MOHq18zvlZya0VStdviBteHDhTzcItYkrKs1rpucPFiI5IeqeIvGMXIA+H7AbiCAOFuUPz8rea62QqnMNYOtVRuGtJDagfls8Yy2f17UZ8rYnTT421lCrKmqGm6YdPR17JFbT3PeI/5gWB8nFRCaCf6jeu7fHfef0ytB7Th74tYv46E4t5GXYosHdZ6/ztDDjPvKaYzpmLlAvQHHmjPu48ttHeAzBgMTYSwjgEHm1SUNt4CcUTbGuPxyTTi/YHTq9JkyzDZVV7QB47SVgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMGykOE8k130SduHjrUHDkhttXtkCXQP7gGyHRkgY0g=;
 b=xUL9b2oyRQmBcqhlJJEzbUZihXHPJl7l0Gju9yHKcrrTqTUspUnpQaIF8nCB9PokTEHsYYkhYIc8T3S0SuUek/9hUU6YDtRpqsazOXeN6a6qR03sKKzA2qtHxmLZJAMyfaTNGw81s1SQ/2f126XsVYar8IdTjqMOhNBZKDD1hedAiuI65KW/aeECTVB2c5Ge7P9HJ60O50VSrSzYwx/7G0DrZQNkJGjcSoBV7C1Ed6x/ME/vwxixAJpYVk8w3p6fOyz3ToTM2HxvkUeUxJWaPpsOfVj5O6mSVzXD+x7fNpGlVESDrEuSa+7q947l3rlDnnpX6Y4c0iRfFWFNM+7w5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMGykOE8k130SduHjrUHDkhttXtkCXQP7gGyHRkgY0g=;
 b=s1HeNlBjdsihUvBOpGGBj826OSuYmkA4pi2A/f8WMZaOAhcV4jGEFbKgjc0UFfHvJeRZ3Gnlphe4vhy76IwjZkfynzaoh4B/bBKCprjqLz7uOxRv8mU7HUKUmtewohJ1qnkfrnIrSUTMZtBGghOSKnF20u27GIwudFHje2SarZwL8wUrN16HvvZ5z309C/Lq9Q64gkH5Ca2Xcsh46Cvv4QZDwj+8ilasv0R4ZFzpBbyzbqX+68HCdJvnTXRlwowDCnVNMsU5i9jEvQ+9dr2E07fIREM95gNGJjjtRjn8yAxwVLsow6PYz5xqHRKMKawFEdkv78NOt6grRpVSZ+78cQ==
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by GV2PR04MB12270.eurprd04.prod.outlook.com (2603:10a6:150:321::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 03:53:17 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 03:53:17 +0000
From: guoniu.zhou@oss.nxp.com
Subject: [PATCH v11 0/3] media: nxp: Add CSI Pixel Formatter support
Date: Tue, 23 Jun 2026 11:56:30 +0800
Message-Id: <20260623-csi_formatter-v11-0-a792fe9c1502@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO4DOmoC/23R22rDMAwG4Fcpvl6KJduyvau+xxgjPq25WFPiE
 jpK331Kx2gOu5Tg+2XJN1Hz0OUqXnc3MeSxq11/4gLgZSfisT195qZL3BAo0QCgaWLtPko/fLW
 XSx6aTAm9Akoxk2BzHnLpro/At3euj1299MP3I3+EqfubhFKtkkZoZJODzwDaBu3z4XQ972P/J
 aacEWcW7NoiW0Ig1xYnEeTSqrn1a6vYOnIyUXJWelha/WdJAuLa6mluoRLbBFGpdmnN3G72NWy
 TCU6q4siGsrT0tHz3tSW2EiS6rAAzhkNf637h7dy7tbfsDWGwRhpjs9p6N/ObXx/dtHcgTcjzU
 f8z3889rb1nH1uVHB9NR+W3HuQzgLYLAO/fFFROSX5BaM0y4X6//wAWNDKG2wIAAA==
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782186996; l=11387;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=hazXwL2Bz0wvrZJiNXm/G5Pxy6FwNk2hQgOO4fFegYw=;
 b=64FmBWe6F/30m6qOl4C3T2W7sGYyi+CfcAqxQSVY/s8PCF7FNd8cvLf0VoK76RN0mvCqMVTfF
 yv5tqsZfc+kBHHdoqjAhjxaCY7y+gqLBp145kxWBVDc9A+k7/TU88Zk
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI3PR03CA0009.apcprd03.prod.outlook.com
 (2603:1096:4:297::17) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|GV2PR04MB12270:EE_
X-MS-Office365-Filtering-Correlation-Id: b78b0173-72b3-4f4f-4fd4-08ded0daf546
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|19092799006|18002099003|5023799004|56012099006|11063799006|7136999003|921020|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
 VoGz07A1RTwitPt7EQDKlixTglWKS5bpLgHvuB+boa+Q3kRPGWvE8YLNMWUeJMHg0dHjRhljbOMqIP4Rimqh+/qynEJt7NwjkYYKc2MaY5/yjfRPehtLtpJ6ob3pETGR3tTPH5aJNN1wl0rz0ALRbIrQdFk4kMUPZbzmjJdwGhU5cK5AdhqfHnnSgZXZ+mt1CJawcsMFWlm9HN7dsPVajWqjuCJVK1xgoI2yEYjDj6/a6X81ZB+8wY+EynNQPVTwXsU8k+zgs9e+LSc74TXrB8fjOzd4VO/ZxqQMpwUNprDdeHqrCLpcFdy3UDWexmHy64w+RHrK3BYVTH2giMz5pWYbYZFlJr6uSA6k8mTHH/nv2fYkM6RPUhy4AsxIC3uXG8yYbEaHLAhAjXazBZ3nbmyqBNQP2GmBRfmu7JUiMnUfMBK5mu8k9knnNbON7DRPpXZ8xa8769F8QBvh8PZ6lBFUu1P/3WrX6PNWzQI2q49bVdyuHmp6mml8VfuM2AbAhGmkgZAcLivwIh7lcsQPuJKXLivkJq/JP+0Cans7pIHr3PCf2n2goKPQdxbI7Ez+ZBFmMB1nWL1dYghduD3SGDnPTyc7ANfl1rQaHw0p5N5ZK6TVESdfDnAGKUl6P8CbLIIwTZQkYmr96Npqnnm/vUwDO3DhyPt6I8RxtFx2q7PXNLipP2nCvNbvNDO6MDoJfDhPNf8hNOwFQYqHPUQrdg==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(19092799006)(18002099003)(5023799004)(56012099006)(11063799006)(7136999003)(921020)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?THFWL1ZwVWRWdkQ0eDlTMUlIM2NzMjVDaS9Pa2FJOTRhbG43bGFiRTN4VUQ0?=
 =?utf-8?B?R2Fxd3dwcnh3WDk2KzNPbmxuRjNkMXJGNWJDc3lPOGhvRGlvSW5iNU5BUkVu?=
 =?utf-8?B?ZmpFUjJwZndQYjNtaWI4YzY3SFJXT0p3L0d6UUFVNlZqTGFOTXlBRU1qdnRN?=
 =?utf-8?B?Z1MycjdGVHFSNUE5M003R0tVTVNXYVI2U284ZXhVTDdpbENqdGowUVhZbEV6?=
 =?utf-8?B?V2JhWEFoVDFMd3RNeGZQZld5K2hTUjJDQ1pWU0RWb3AvRVFCZ0lVcWsvQUhu?=
 =?utf-8?B?M0NYWDlvVFV3RjFJS3NaY1FjM3hRSEh0NHV4TmYrM0J2TThjZ2lRc0NzaTNn?=
 =?utf-8?B?eVRZWW9GdjJGdGZndG9BdTBNQXdEL2FSM3lyb3pDTEJ5TVlvRjQvbHZJc0J5?=
 =?utf-8?B?cTlmQzd2clZLMExidjU3S3RNR2h4bTJUOTYzbkhPaFJUWXc3cUJpTU9tanRU?=
 =?utf-8?B?R3lGU3dpUEdVMlNFZXkydTZoeGpkWlZ5ZHpNNXZBQXVZNGdKa2xJMzEvM1BY?=
 =?utf-8?B?ZG8xbmtOSFR4VTViVlVxd1BVUXNVSXB6TzFSc0l6SHk1cG1RUldTekNPZzlX?=
 =?utf-8?B?Ym5JS3BybU8raVFjMTVRVXlCcVgwZVQ1Mkd2b0M1STYrdXBXRjlIMUw4T293?=
 =?utf-8?B?MXNWeWFwK2w4REN4OHdNU2RDOG1NTWUzYjdkSm05Y3hZN3lVOUNZTjgxRjlu?=
 =?utf-8?B?SVhSekFoQWc3Z0RVamNINWRhdHg5NEJyV1hVZmpITUE1ZXoxRTc2UjB6TjAv?=
 =?utf-8?B?Y2lURkJ6YjBzSHArUFZhZXJaTUE4WnZwTG5yK0piQ0h1dDhzV3BUM2ZscXgy?=
 =?utf-8?B?aGd0eXVKdFYySHo0MVdtMFdYYzY0TVBkaVNVVkNYSTRMZVFndDc1ajU4djNj?=
 =?utf-8?B?amo3b1JObEFCbGt5Q2liTm8zMkFmTzQrTmtqS3hzVHVqRWUrdldXUDRiNEpk?=
 =?utf-8?B?MWVEemtFM1VuenpOMHdtTzhidFpZNGt3RS9meWdDbDBRODhUNzYycTFPNHF3?=
 =?utf-8?B?QWpSWHIyODBJbVZ0d28xUmZudlltU0xjeFNyL1dxK0s0NVh0eTVmeGNRaldW?=
 =?utf-8?B?T3E3SDdwcVFRUEc2dFc3WjRpaE5XODZUQzhOQVBYWVR0NHFObmFqU3hHYzV1?=
 =?utf-8?B?UkZyOTg4TWdETkJFQlg4SVkvVTJlMFJuZUMyY1BFbm5GSXhHQWlVcEV2UFEx?=
 =?utf-8?B?WWpxQmNSRHo3QnVmeHFZQzAvcnVpNENScnhzMEtnTlJEK25KL1hJSEg3VUtS?=
 =?utf-8?B?dFBUN2lqakhYTENwYkUvL0p0ZDFYK0lnU1NwcUttZUgvQnJIeUNwbXU5Q1Vh?=
 =?utf-8?B?dlZzUEFKdXloSC9kZ2xwK3lSNzNrSlVzQVdRRWl2Q3V0d2RrNmNLa3J2d0RF?=
 =?utf-8?B?K2hHNTBXaUJFTVJUbC81SWNlbXA4ak5KTDEwS3hiY2g2anJ6WEE4Tm9JTENJ?=
 =?utf-8?B?WnI5eWRhbUdlRE1uT2h4ZVB3UnhvRkR5VXhPaHh6NGZiemdYY0J2YldrVmZ1?=
 =?utf-8?B?MjlQUFljajZEWEdCZW9IN1NhREpjbzRlR2UvWnAzUlp6bkJJcnRSYUphamlH?=
 =?utf-8?B?cEhkV3VMdVdCS2RBQTN4WmlFelYxeGhGTkkxUEpBd3FDYmZqUjZEOGZMUEZt?=
 =?utf-8?B?NVNuN2pMY0cwOVZvQ0lJWXRscEIzWElYenJjZ1h3cnp6OS9KenVpRjNqalVh?=
 =?utf-8?B?ZHBQTm81SFg3VFpGNlVleHdIc3ZPQ213V3k0YWxLR0xKL3Y3c25rb2tyQlow?=
 =?utf-8?B?aGJnYU4razZTNUVISitZUkpabXNTY29TaThLR2Eyc21BdUluZTVka09ObWxn?=
 =?utf-8?B?NTErcnlNT3NvemdBeGJkVFNSVkRGM2lTbDFLQUw5YUJISHFiMFBsSkEvV0lQ?=
 =?utf-8?B?dUhaamlHczlIemI1K1pxLzhUMjU5V01PUnFYUEIyb1FjYlQ5NGd5My9NUS9h?=
 =?utf-8?B?UkQzc1gwalVkOVhqcndYRUFWWTM0QmJsMmV3RDltSkxObFgzMmpMcUJpa3lY?=
 =?utf-8?B?aFcvQkNZUXdaNDVzYUNIZnBLQkE5NHN0YW5DdS85dWk1K3FYdzB3Qmw1UDRm?=
 =?utf-8?B?ejZTTUZyanJVeFlWeTRCUndZUTk2U0VIM3JPenlKT1B1MzdKcG1na3J5SEov?=
 =?utf-8?B?ZGhTWkJyTmQ0Z0YyYlVoeVE1eWVuVEJ6aVVXNXJrTG9zYWZUdXhjRVlOUE43?=
 =?utf-8?B?ajAwSWszQjdwK3JLcGI2MEhEQTI3Mmcwb05DV2FnZ2d0NFpRVWRNc3NWUkM2?=
 =?utf-8?B?SVZQa25CWExwVU9XYTFVTlBYb3R6Y1B4Zno5NjMyY05rdjZiU2J3bklKU1Bx?=
 =?utf-8?B?NzkyVkVyRDVHKzVMYWcxSllrNk1SUE5QNkNhQWJyZjFoeW95bU1HM0c5V1Zm?=
 =?utf-8?Q?xnCcXjILINWy4EtCepdWwPdpJzRmCiEnSLEYp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b78b0173-72b3-4f4f-4fd4-08ded0daf546
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 03:53:17.1179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLmJNVOgORQms7ScE/JOY64mDiZLwQbBZXV9oDcTSWW6mAhootw4aMulTO6ek4Jt38CjPvVwZ5dLk9MEUM/L/L4oYY1GWm7LVkjoNFcHcICRo7ghNU69h2FyeGx/5sR1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12270
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65431-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:laurent.pinchart@ideasonboard.com,m:frank.li@nxp.com,m:abelvesa@kernel.org,m:peng.fan@nxp.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:imx@lists.linux.dev,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:guoniu.zhou@nxp.com,m:Frank.Li@nxp.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,nxp.com,baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 708F86B3E39

CSI Pixel Formatter is a module found on i.MX95. It could unpack the
pixels received by the formatter and reformat them to meet the pixel
link format requirement.

This patch series adds a new V4L2 driver for CSI Pixel Formatter.

Background
----------
The Camera CSR binding was upstreamed during the pre-silicon phase when
the hardware integration details were not fully finalized. At that time,
the syscon binding focused on the CSR's primary role as a shared register
provider for clock gating, QoS, and error handling across Camera domain IPs.

However, the Camera CSR hardware is actually a mixed-function register
container with varying control levels over different IP blocks:
- ISP/CSI: Clock gating only
- ISI: QoS configuration
- CSI: Buffer overflow handling
- LPCAC: Error handling only
- ISP: Pixel link selection
- Formatter: Complete IP control (full register set)

Why Child Nodes Now
-------------------
The CSI formatter is unique among these IPs - it's an independent hardware
block whose complete control registers reside within the CSR address
space, not just a few configuration bits. This architectural detail was
not reflected in the original binding because:

1. The pre-silicon binding focused on simple register-level controls
2. The syscon pattern for complete IP control was not initially considered

Discussion with original CSR author(Peng Fan) confirmed this reflects the
intended hardware design that wasn't fully captured during pre-silicon
upstreaming.

v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for device /dev/v4l-subdev9:

Driver Info:
	Driver version   : 7.1.0
	Capabilities     : 0x00000002
		Streams Support
	Client Capabilities: 0x0000000000000003
streams interval-uses-which
Required ioctls:
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev9 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device routing ioctls:
	test Try VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
	test Active VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev9: 47, Succeeded: 47, Failed: 0, Warnings: 0

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v11:
- Drop [PATCH v10 1/4] dt-bindings: clock: imx95-blk-ctl: Use single quotes consistently (Krzysztof)
- Move properties to top-level and use if:then:else (Krzysztof/Frank)
- Link to v10: https://lore.kernel.org/r/20260618-csi_formatter-v10-0-f23830312ba5@oss.nxp.com

Changes in v10:
- Rebase to latest media/next
- [NEW PATCH] Use single quotes consistently (Krzysztof Kozlowski)
- Drop syscon parent node from example
- Drop Reviewed-by tags from Frank and Krzysztof due to binding changes,
  requesting re-review
- Add description for reg property
- Add space after formatter@20 before opening brace in example
- Enhance the port description with more detailed information
- Delete the blank line immediately following the endpoint in example
- Use single quotes for regex pattern to be consistent (Krzysztof Kozlowski)
- Add formatter subnode binding and camera-csr syscon example
- Update commit title and message
- Use u8 for vc in csi_formatter_get_vc() and drop vc < 0 check
- Add MFD_SYSCON dependency to Kconfig
- Fix stream/VC mapping potential mismatch in start/stop_stream functions
- Link to v9: https://lore.kernel.org/r/20260526-csi_formatter-v9-0-ca3d8c334c39@oss.nxp.com

Changes in v9:
- [NEW PATCH] Fix formatter as syscon child node issue
- Link to v8: https://lore.kernel.org/r/20260525-csi_formatter-v8-0-6b646231224b@oss.nxp.com

Changes in v8:
- Rebase to latest media/next
- Use standard port reference instead of video-interfaces.yaml
- Add parent syscon node in example to show device integration
- Remove fmt field and look up format from subdev state instead
- Unify function and structure naming to use csi_formatter_ prefix
- Remove misleading alignment comment from set_fmt function
- Optimize get_frame_desc to call once per start_stream
- Replace V4L2_FRAME_DESC_ENTRY_MAX with CSI_FORMATTER_VC_NUM in loops
- Remove redundant debug message in enable_streams
- Use MEDIA_PAD_FL_MUST_CONNECT flag instead of manual link check
- Link to v7: https://lore.kernel.org/r/20260518-csi_formatter-v7-0-562b750557e3@oss.nxp.com

Changes in v7:
- Change compatible to imx95-csi-formatter as IP is i.MX95 specific per Marco's suggestion
  Link: https://lore.kernel.org/linux-media/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com/T/#mcd135b3de179b3cb69daa1fd6e0e8e27c85b3332
- Update references from imx9 to imx95 for consistency with dt-bindings
- Enable PM runtime before async registration
- Link to v6: https://lore.kernel.org/r/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com

Changes in v6:
- Rebase to latest media/next
- Update v4l2-compliace test
- Remove unused header includes
- Unify macro naming: VCx/VCX -> VC and parameter x -> vc
- Remove unused format field from csi_formatter struct
- Use compact initialization for formats array
- Make find_csi_format() return NULL instead of default format
- Use unsigned int for array index in find_csi_format()
- Add err_ prefix to error handling labels
- Add v4l2_subdev_cleanup() and reorder cleanup sequence
- Update enable_streams debug output format
- Rename VC_MAX to VC_NUM and fix boundary check
- Update CSI formatter Kconfig description
- Use v4l2_subdev_get_frame_desc_passthrough() helper
- Fix error paths in async registration and probe
- Add mutex to protect enabled_streams
- Switch to devm_pm_runtime_enable()
- Remove redundant num_routes check in set_routing
- Optimize get_index_by_dt() and add warning for unsupported type
- csi_formatter_start/stop_stream: Process all streams in mask
- Link to v5: https://lore.kernel.org/r/20260123-csi_formatter-v5-0-d5b803f867bf@nxp.com

Changes in v5:
- Remove CSI_FORMATTER_DRV_NAME macro since only use once.
- Remove sd->owner = THIS_MODULE;
- Simplify code by using DEFINE_RUNTIME_DEV_PM_OPS macro.
- Link to v4: https://lore.kernel.org/r/20260122-csi_formatter-v4-0-6f6fcad1c33a@nxp.com

Changes in v4:
- Rebase to latest media/next.
- Add comments to describe the index field in formatter_dt_to_index_map array.
- Link to v3: https://lore.kernel.org/r/20251219-csi_formatter-v3-0-8680d6d87091@nxp.com

Changes in v3:
- Rename nxp,imx9-csi-formatter.yaml to fsl,imx9-csi-formatter.yaml.
- Drop clock-names property.
- Drop macro IMX95_PD_CAMERA definition and use a constant directly.
  [PATCH 1/2] media: dt-bindings: Add CSI Pixel Formatter DT bindings
- Remove the assignment driver.owner = THIS_MODULE.
- Assign struct fwnode_handle *ep __free(fwnode_handle) when definition.
- Update yaml file name for csi formatter in MAINTAINERS.
  [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver
- Link to v2: https://lore.kernel.org/r/20251217-csi_formatter-v2-0-62168af80210@nxp.com

Changes in v2:
- Delete "|" for description key. 
- Add empty line between child node and property.
- Delete labels for endpoint of child nodes.
  [PATCH 1/2] media: dt-bindings: Add CSI Pixel Formatter DT bindings

- Update commit message.
- Use the value defined by bellow macros directly since they are used only once.
  #define CSI_FORMATTER_DEF_MBUS_CODE	MEDIA_BUS_FMT_UYVY8_1X16
  #define CSI_FORMATTER_DEF_PIX_WIDTH	1920U
  #define CSI_FORMATTER_DEF_PIX_HEIGHT	1080U
  #define CSI_FORMATTER_MAX_PIX_WIDTH	0xffff
  #define CSI_FORMATTER_MAX_PIX_HEIGHT	0xffff
- Use macro pm_ptr() to fix build warning when CONFIG_PM is disabled. 
- Finish route loop by break statement, instead of goto.
- Return dev_err_probe() when meet errors in probe() function instead of dev_err().
- Remove MODULE_ALIAS().
- Refine .enable(.dsable)_stream callback implementation, include bellow changes:
  Add stream checking.
  Fix potential pm runtime count unbalance issue.
  Add stop stream error handling when enabling remote subdev stream.
- Use __free(fwnode_handle) to drop reference to a device node automatically.
  [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver

- Link to v1: https://lore.kernel.org/r/20251203-csi_formatter-v1-0-eb9e1147b49e@nxp.com

---
Guoniu Zhou (3):
      media: dt-bindings: Add CSI Pixel Formatter DT bindings
      dt-bindings: clock: imx95-blk-ctl: Define formatter child node schema
      media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver

 .../bindings/clock/nxp,imx95-blk-ctl.yaml          |  71 ++
 .../bindings/media/fsl,imx95-csi-formatter.yaml    |  88 +++
 MAINTAINERS                                        |   8 +
 drivers/media/platform/nxp/Kconfig                 |  15 +
 drivers/media/platform/nxp/Makefile                |   1 +
 drivers/media/platform/nxp/imx95-csi-formatter.c   | 775 +++++++++++++++++++++
 6 files changed, 958 insertions(+)
---
base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
change-id: 20251125-csi_formatter-e6d29316dce6

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>


