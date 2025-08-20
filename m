Return-Path: <linux-media+bounces-40390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECE9B2DA89
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 13:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D19DD1C470A6
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 11:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F0D2EBBAF;
	Wed, 20 Aug 2025 11:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oOpIj0zz"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010042.outbound.protection.outlook.com [52.101.84.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7732E92B2;
	Wed, 20 Aug 2025 11:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755687948; cv=fail; b=qv/m9Gop2gAkjtgvBz+OzMFPeEnn79xEQznNwj4ibfpS/KbNmFeOqz1e1nIxcoclYoDkq6Lqk8vwFNPgBoZxUZZq8qwTXm71nqUZyVv7548M3qy5+24KmD4Nw6VNz1IrtwMjrOrSvb9pKL4t7WnvunaGwvor0HmL+kgW1mYVfk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755687948; c=relaxed/simple;
	bh=tkSOi5p9pprvGnDNLTo+Nu3n+zO49W9fo7rPQIuv2d4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FTtxGNdofR26VAkmsMqST5vWbzbc9a/bSUk6n1wjTN6jx4Th6FDHqV1VQiHTHMympcGP0gg/cwCPYTmtao4rMYFB7mjbbYC+jZpIV+ua7+bpqUKSZX18v83iyYoTyn4WQPG22jTekNzI69o+QhZ8wioSFuU7SQ+vHhv1B0vJ8P0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oOpIj0zz; arc=fail smtp.client-ip=52.101.84.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HxsKqyJsKy2miZA46DQEup75G9JIfJl6Fm6DzJrXPHu978WZGiFS/BNh3nKFIr+1QW3KBLUlYFcxPC4byLVMWCYh7TEp4BmpSVZjeDvPspqXY/QmPDxxyYets02ijfy/zg47HwO2S7ptnTFz8DmwHaBQJRWcsfNOYGuGV+N1ctBGfzz3RwxIczmgyvmhUx0RbSAV0RGlmuHJPAaVbvu6F5JQ6pNd72gO4wNWNWYLGRJT64X38N6ih4wLQAN7Bb3yZD3lW25ADa9qr2qjlV/NaL9ENAX1bUQSGN4ewSoVNP9XkEyfePPxTiVRs/P7gR7t0muddvopilH3nvuDfZocgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PL//s6YzkT3ukmkecnB6UYD31DwCKAKV4Gf+OCSIYWQ=;
 b=pj0hLWncpINbY1ApeUY9T+1fcAJircqOYulKJfNmMOAwSFqdb/NNTj/oWfCMRde+IiMtivJXA+bsj/4ldonDOsGh8vFa8pk7meC9inyKNUwJv8MykzZ1vEtFHWVe4yuJtrpitj9euuWhokW9d30jPgD8I6nEOAzbK0hDHePwV7VhN8btePi6euXxoG2HHk7KUVebV+Uh9Bw9Our8bD6JTABmLSF3kjRPdRdvhxxiAs8ApG4NzQTWMoqcm963d4S4oFuqom0FGOHB07gBvmXtgen0V+MAg6Zv6jNrarPfhe9VI1HQyo6XjreEGfM9mi1YCpiyiZ4rDiOMY1I7J2wxWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PL//s6YzkT3ukmkecnB6UYD31DwCKAKV4Gf+OCSIYWQ=;
 b=oOpIj0zziaELC+REbKSYiZTj9gVM4BB+MB3x6EB4HKecSsURUDHZM5RQe+RmDIEYoLKPbanKmzKrdg3GLV+RCOY18gEZDJxGhAbxZg0awsMfNQoxi1bzmG7DilQ9LGFUGnNFf4BgIlPXICZcWlE1/1doMnI1j9UUEQog1/9+K0+rdSpJD3WvPNENw8rP4Lzvwu+XEi2oYyQOwSW2p4EtFdWDJp6r3hp9vRutizYC3ZTBD635clEeBKsXEgXB8S7tTMMnlmYVgqHPCWKz8oVedCTB76XsfX13CqypowIh1uQBViQ14veMqFShHIxaVfltYJ06YdfFwUAz9I+ZzjXdcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA1PR04MB10913.eurprd04.prod.outlook.com (2603:10a6:102:484::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 11:05:43 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9052.011; Wed, 20 Aug 2025
 11:05:43 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Wed, 20 Aug 2025 19:04:59 +0800
Subject: [PATCH v5 4/4] media: imx8mq-mipi-csi2: Implement .get_frame_desc
 subdev callback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-csi2_imx8mq-v5-4-e04a6fc593bd@nxp.com>
References: <20250820-csi2_imx8mq-v5-0-e04a6fc593bd@nxp.com>
In-Reply-To: <20250820-csi2_imx8mq-v5-0-e04a6fc593bd@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755687914; l=2047;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=tkSOi5p9pprvGnDNLTo+Nu3n+zO49W9fo7rPQIuv2d4=;
 b=UjArqQUKwzWmC97SKR8fpTe7RUJtL7X/8WAI+lWMUFxGFcZ9YUXQamJL6XsU+5A0zJ2U7c7el
 eQJt2GT+kMaDjnksAQqBGaCf8IwNpZ8tV/hcm8wJs0iZFg8ZznnMob7
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PA1PR04MB10913:EE_
X-MS-Office365-Filtering-Correlation-Id: ad619b85-98ed-4ce8-243f-08dddfd98171
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|19092799006|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cjB4bzhSdndQY09FQ2w5YW85ZXovbVlWZVhrQ0YzcnowVkZmMmJMai9jS05G?=
 =?utf-8?B?V3ZCcm9iYnhrMlgrOXo3MkF1NjlZUStUWGFRckFPTnlDZy9meHJIU0VEN05J?=
 =?utf-8?B?VEEydmRzOXpna09VYmhtQzN3WmJGVjZwYXRYUGZ0L1NpcStrY0RRSnVHNHN0?=
 =?utf-8?B?Y3M4dFc3THJ6MDEyQVVwM1Jic1B5aTNVYkdFVER1bERKSTg2RG5ScjBzR09V?=
 =?utf-8?B?c0J2cytWWlBBczh4bTNzMGx2WTBEWWwrWUdwZ1NsY3NoRkx6UWxkbFNLM2pG?=
 =?utf-8?B?dmh6cHpYTDQySzdBNGJISXhjc3h4UEpZWkJvL3NIc2RKZWI5VkpYUGlpOEFN?=
 =?utf-8?B?TjVkZUNIOUFKUWVrM1QvaXRrL01MV0JSM2VwOU9IZ1lKNFFISVBrbGQxZENT?=
 =?utf-8?B?RFY0VEgrUHl1bjdvQ1Z4YmMwNU5wOEVwU05BeGRTNEF1MzVyMTZoSi96NTM0?=
 =?utf-8?B?ZU5LQ1poajh3Sk56ME1pMXBjbTlTdjBIN25wSlRFeklTRVJ1NVpzT1g0VUNE?=
 =?utf-8?B?dmJ6VVhZS2RYSmxiLy9Xb3BlOGZHREw2ZS9VeTJOdUJVd2ZtVXY2bGFJakxP?=
 =?utf-8?B?djA3cXpRYStOWk9NQ3hDL2djRWg2TEFuRmk1SDg4bWNXUjcxM2RJdjRjQXN2?=
 =?utf-8?B?M1NGU3BtbS9XWTFBamJydzh1aHhDMmltVGFlWFB6aWJWYVN6c0tqU2MxM1VJ?=
 =?utf-8?B?dFZBRGlWVzZnWjJSaS9vaFluaGh5eHFYSTZmNW5ha0ZYZjkzVG02bkRiMjY2?=
 =?utf-8?B?a1dUVFRURnl1Q3ZjUTdLc2s0Smo0UlY0NlBWazVLMWhDSkl0S3J0S0tJaUZT?=
 =?utf-8?B?b2dTOHJzSzRJVlVDMVg1bGNmaUxUWVRTOFczd1ovVEErRVZOVWc3Z2JHUmQw?=
 =?utf-8?B?bGpPYUpZNzZuaWJGUE52djVOTDZwR0JmSkRsZUk1a2J2VTVjT0FSTWNvUmF5?=
 =?utf-8?B?eFR4dW9NL0h3MnVOd0U2emZZMGJrM2tNNngwV201Qll5WXZ3eUlQRTNxZDZW?=
 =?utf-8?B?WnA4RXFQRHdDYXBQVk5SbXNObWlKTFJERkRIbmp4V1FNMnV4TVB3TjFBNUVj?=
 =?utf-8?B?MVNkbU9zZ0NZVE1oeG90ajRMbzVaS1MrVGY4b1pydEFtWEw1bzRtcmxJVnkr?=
 =?utf-8?B?UC85WFZ2ei9Ldy9OR0hoMTl0TGhGQ0RrY0dqRGtsRjVWdmVVdkVSZ0VMVXJL?=
 =?utf-8?B?S2xIT1c1dW5TNnVtVkM5TW40VFJaMHB6RVJLQ0tTMXNYbzNWRjY3N3BFMzdP?=
 =?utf-8?B?dm9ycTBVbHdsaEt4Zm0weTdBQW5SN2d2NDYycGJBbTNPVVJVVVIvRGhBb0Ez?=
 =?utf-8?B?VCtEblNGMkZVVEw2OFg0SUNFNjd6NDJkejVBd2U5UWZBY1ZueFZPNmtoTGdP?=
 =?utf-8?B?aDNNN3RDRnlNL0YwbmRRc3Z5Y2poUWVZTExPNkphYlRXTG53TXpkQ0VFVGln?=
 =?utf-8?B?dkRWL25CRk4zc2dSN045b0VTREgvL3MvQWpybG8zV2VJY25YRVIrZk56TUJE?=
 =?utf-8?B?UWo2NTBUZDlvM2tWaTlqMTZJZExlRjd2Nmx5YXpkODZOZG9HRjljWlgzODRB?=
 =?utf-8?B?ZXQ0d0h5TEdXQzRYWW1SeG9WRU1nT1h1dW16SmxLSG13SWhBVGdFaHpqY2lY?=
 =?utf-8?B?cVI4MGh0VXZ5aTRlVlkwc0VhSEMycGh6bXlaK1BrYkcwTm0walVsZExIRHJT?=
 =?utf-8?B?SnBiV0RRZ2c2Tm9XYXljaGxZc3lvRy9UdXFjWmdNVm50UzZmbkREMjJkL1Qr?=
 =?utf-8?B?RVBpbzk5Q1RDby91TjU4MDFCSSt0Y2ViYzJ0OFZ4TlRvRGdCekZLZHRnYzNl?=
 =?utf-8?B?UkQrd2lHSmwyV0ZzR2UwM1Y0NzJ5cGhKS1ZaaDk3d29oQ29lN1hTa2NESHpB?=
 =?utf-8?B?dGhuS1FQSG96bGhRS3ZJQnNEa2drSHRsWms1MG5WbnFTdG53UDVwVFNFZkZa?=
 =?utf-8?B?ZUtBYmFkeUZFd0hYdlMvbm5wcTNiQVJPRmtCZFpsVWtVVVZmc2RWYmYyUWJ2?=
 =?utf-8?Q?Qh34D43QB0vVScu2WyDnhQILLBAbX8=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(19092799006)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?d3pmSTk1d0p2R3c3bC9tdk1HYnpVaEhYVUFKb2pKbWxSL3gyUjhtZlQ3OUxz?=
 =?utf-8?B?clBTL05LeVU2bnF3V0lkUTFQVHY4MjBhZGxLMlRVVnpWbjFoNkJ2TDNIdEd4?=
 =?utf-8?B?TzY5SEFqd3hERzVyTzNkYmdnNE9abjVrYmpGVjZwREdHdW9sZ1J6QWZCbWRY?=
 =?utf-8?B?RUxVUkxhM0djTEtKcFNmWTNTdlBzeVlhbUc2U1p4ZytlWkF0bmNNVlBKRlA5?=
 =?utf-8?B?STAxRjV5WTRqeTJOaUtPM2dtOCtwRkY1a1JqTlJsek1rRVM5T0M1UTNuTU43?=
 =?utf-8?B?UUdzdzluUXY3VGZyUXJaSmkvOUFYa1dneFg0ODR1SUJRQUhpL1NDL0Y1aGV5?=
 =?utf-8?B?dk9UVHpMUnFUdGdmYm02YkFEeTdGczIySHNwcGVoM3lEOEFkdDFtaGo4OUJk?=
 =?utf-8?B?OHh4cUtrWmszRXJnWmduWDZDcGE2UGFpcUF2U2tPVTY5VUQ0aHZMalAzZVZn?=
 =?utf-8?B?S29HUXVjQk5MbkNXQ1Z6MkFTeG9KeXFLYXc0WmROdDhZajNaUzdoU29QMC9E?=
 =?utf-8?B?ZmZyQ3lLeFpmVHJGUEtoejZFc3JWclUrWW43dzd6UWpYQTBCQmF3aDdVeVBS?=
 =?utf-8?B?emkrbnZHVkNtK1Z5d1E1V28yY0ZUWVZQNGNjT3lwWW5UWlUwdGZlNU5xN1RG?=
 =?utf-8?B?ZzQ3b0FKUGZnRVRZOXIvVGNONDZxc3N2SGpaS1RkRzhJd1NKdk9EOEZLanEw?=
 =?utf-8?B?dGpqUklpalluV2ZUSmRpcjlVMGEvNkFHWW05SW9aTVpwQWppU3R1dlpiNzVG?=
 =?utf-8?B?WC8zMU5ycDhqZTZJYzJram9pWFVvdzRwTmxTZzRPSE8yZGpTNGRmb0ZvSjVJ?=
 =?utf-8?B?bDlkZUJjbHFRWHkrbHliWFZlTXV4U0xTUS9sV0FGL3FUUlY1T3pkRnhRaDhD?=
 =?utf-8?B?L1hYMW5xeVA5eW5sREtZSWYxaHJlTElKWVJqaTRyZkpkc0VyMUI3aVJrQ1hy?=
 =?utf-8?B?cHI1YUxEZTV3d2pBWnYwYW9HS3REVUc0c3VaWjl1QnVSWUViWVFsYVNhUm9V?=
 =?utf-8?B?dmxETjlNNkJTdGM1L2taaEVsTFpWaXpsTXhlTzNXeStmQmF0eTNvUGFqRC9I?=
 =?utf-8?B?b1hpS01aWHFMUHBnSXBqMGcrNmZQOEx6cm92R0NCemNqQS8xTWp4REZhMnR2?=
 =?utf-8?B?R0xCQ2FUdDJraU9TcU1wQnNac3R6Vktybm8wc0pWUFROcTJXZ3ovOFVJd0JM?=
 =?utf-8?B?dTdvSDRRNUgwbEJ2RHlEZmZXVkpOSElqdSsrT09NUUlOM3J5c2h4OFlhSld1?=
 =?utf-8?B?VlZsd0llL0Y5Zld5TldSeXFIWXY4YStTY0M5ZGFoUGdTRjZQR1JiTTArTEV5?=
 =?utf-8?B?MVFRNmxYSkZwZ0puNjFBa1NLQ0htRXVaUjlUQ2dBOXhCWFd4OVJQdDdQR1Bx?=
 =?utf-8?B?V00wczlLSVFzRjBkcnR6WXFrMFp5Nk1JSWpsZVdaVWxlNnZOWHMvakMvVGJr?=
 =?utf-8?B?SStiazROR2l1NG9GWVJZRmtPOHc2NzU2d2x6STlhUXdpU0QyeTM0UHR5MS8x?=
 =?utf-8?B?OVZpOGVBcFBhVlpDbVRLeXg3Q0xvaGo1dkZMOTRpclkzQk5EYThxSVhIUjdV?=
 =?utf-8?B?VGxXcFIrSjdMYzcvNUpCNDd2d3N1bVZaN1p2NDlMeUlvcWR0UkRPeEVqdGFV?=
 =?utf-8?B?QWZwbkJseFVuZ0NiVi82ZUwzampRYXFGR2xUbEdtczB6WkYxY0JZVlNrNjBO?=
 =?utf-8?B?QW0xQkpkY3BWcGl0dnJ5bzBXKzdjMlkyZkFncnI2WnZSRStTeG5MYUJ2N3VT?=
 =?utf-8?B?b3pCK0ZHVWptQllDVzNXMGNhc3NtZlFidkxRbDUwNURhajRIMTl1cmpmQXRm?=
 =?utf-8?B?b1d4TmQxYldoWmNkRjBLUmZPVDc1RG1DTTV6UzZYUUdkbU03bXQ2TS84bjlF?=
 =?utf-8?B?VEw4cVczRTBZNDhqRUFwa1JuRGhqNTZYSU1rdlRFZlZla3F1TWlXbmNPTlk4?=
 =?utf-8?B?MnUzVXhFckJNRCtkM1hZZjJpYTZITjNJaHRpUGNZSXpONHNSdkZnc3UwSXlP?=
 =?utf-8?B?cnFWNjJMOE9hOEFrVm9SRkRtK0poL0F0OFVPaUZOVVgwdEM3ZElXUERnTDZX?=
 =?utf-8?B?YWZZRnJSRytVODZMSGVVRzFlTVJGZkpmZ3lzcUlNQmRiYUo3L1BxVW5RbFZn?=
 =?utf-8?Q?y48ILp/l/BMaLds2vJ56Gs5jz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad619b85-98ed-4ce8-243f-08dddfd98171
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 11:05:43.2036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AUH1t2W33H+he4MveYGKZe9w/72uC/aneZ2VEd7EWxOdSZLfVbIPEXp+UTYaWucyexDm7Y/HWjIL7/K0me3K1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10913

Implement .get_frame_desc subdev callback since downstream subdev
need to get frame description.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 529928b94a193e02177f8773a0e68375b59b0a08..a28ccdeef8521c0e00d13b1860eadef5f2118651 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -648,6 +648,37 @@ static int imx8mq_mipi_csi_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int imx8mq_mipi_csi_get_frame_desc(struct v4l2_subdev *sd,
+					  unsigned int pad,
+					  struct v4l2_mbus_frame_desc *fd)
+{
+	struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[0];
+	const struct csi2_pix_format *csi2_fmt;
+	const struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_subdev_state *state;
+
+	if (pad != MIPI_CSI2_PAD_SOURCE)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	fmt = v4l2_subdev_state_get_format(state, MIPI_CSI2_PAD_SOURCE);
+	csi2_fmt = find_csi2_format(fmt->code);
+	v4l2_subdev_unlock_state(state);
+
+	if (!csi2_fmt)
+		return -EPIPE;
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->num_entries = 1;
+
+	entry->flags = 0;
+	entry->pixelcode = csi2_fmt->code;
+	entry->bus.csi2.vc = 0;
+	entry->bus.csi2.dt = media_bus_fmt_to_csi2_dt(csi2_fmt->code);
+
+	return 0;
+}
+
 static const struct v4l2_subdev_video_ops imx8mq_mipi_csi_video_ops = {
 	.s_stream	= imx8mq_mipi_csi_s_stream,
 };
@@ -656,6 +687,7 @@ static const struct v4l2_subdev_pad_ops imx8mq_mipi_csi_pad_ops = {
 	.enum_mbus_code		= imx8mq_mipi_csi_enum_mbus_code,
 	.get_fmt		= v4l2_subdev_get_fmt,
 	.set_fmt		= imx8mq_mipi_csi_set_fmt,
+	.get_frame_desc		= imx8mq_mipi_csi_get_frame_desc,
 };
 
 static const struct v4l2_subdev_ops imx8mq_mipi_csi_subdev_ops = {

-- 
2.34.1


