Return-Path: <linux-media+bounces-39539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAC3B220AA
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 10:24:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E8142A565A
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9D52E2656;
	Tue, 12 Aug 2025 08:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wy/Zppr4"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013065.outbound.protection.outlook.com [40.107.162.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06662E264C;
	Tue, 12 Aug 2025 08:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754986907; cv=fail; b=szblMVEBWhn/X+Dbx/qH/yzZKeu82FTl8KJ8h9bM4RMwBCG0hS2ACM60XIW7CnsPsEC6mZeGmZFIReyjyDDLQITFYKScjGcayfLqk8cC6pBepybY2M5EEcdGb4LntPzu7/VTwqwkc/wZwzrt5VDL/Rv3mdm1/4lllJAu8MResto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754986907; c=relaxed/simple;
	bh=/Tz3CZgVrs+JU5heoyO02QVXmKZtQL4buSJGdYQO6uE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GM1PGohZZ4ReRDNvZOEomLoBSk0y9b8ryKXfFkTxXtgplY5O4d1AVua2v73JKidMt2JBCgnO4NAMxNKywnUGlLgV69SChTJ0peDWmT+B/XZnZ18P/srUFXx6zMRFMS5BAkYnQg34h+LzfNynPhia7undDroPnl9IucOI95tHJP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wy/Zppr4; arc=fail smtp.client-ip=40.107.162.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FeJE5qzvh6AZpqgR021QTsSECJfhEFwAee41c/w1w3skM2Ghdgej2iOoJEiBmHUC+MXIxptVLyeLsY3JaVeNnjB0KlQTyaWEE69nXwf1SOaEj07+YFWouPMju7dRHOXcaF3YpIxa6UJ6grdc5roj9iHokp6GZ52yCTgsp6Sb4TQWH/9FG1pUiJZ8PyLNefV1W2Xl1LIS6/NKEkwLcHe+88pHpx+cvtFDWlLmwgs+lJUWLSmK9sngOorcPDpVXfLKkD2SEcSLG60u22JFt9F6FB86tqrUNJRFNSjCVqbP60o9mqs5XQFYlu5S25YL7AiIqiX3GdyMFTeZA3y02hn1Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KC9lNxb8vwAtiKkX2/RNVU77wp32O7R25M1FhpjakXs=;
 b=DKImrsmLO9NTIRU/zQrxXDRaeXiCmAqs74eAxOyikFZKKs6IlxwRJHvHeh8BSRyIY/RDxvk5AJ0kK0badBmDOpP5DUYsfb9s4JCzs7E2Bg3AmVyWMtHWsxYy4n+zNeIDnsz8XgPkmraLsm9ELFr0T8QahU9jAdlyW/IBthGP0uED80r10gC77RVmF4LEckx80fC2qomTMBTvqwcAeZt/gMFLjCdeyKO8T/H8LWxnIuKpkJcDdiNdWpeVaJniqGGAZ7Va83scCZwfzaeCZz/RNmpnIB8YONqCtcT4AkXgCaGHLWc1oAONy37tJAsDiir7tw+U80PCiZOqrUZ5xBddpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KC9lNxb8vwAtiKkX2/RNVU77wp32O7R25M1FhpjakXs=;
 b=wy/Zppr4a8dktBqyKKAplz51D7fSmoHgGusIQGGggp9iBHN50VVWDoZTPOnDiVj8UAgFGJmqc+qN44CO9wvxLGYZEUOrHnamfyf9h6PfPdZBP8yQ1hJ/uI8XDgwmpWDp0vontsLVfPXwLInJ8LjTX6a3AoClIhf4aORQ+DFi/6zEVnY3S4F6qUlJmfIBevSWdIxunW+3rloazjQcMwtrrN7cjf/TIWjUBSb4P+2AhV7TuzAolUzbx7uqTPIhKiN1gNh6nO7lTOVO0ZJ0DTeZ7k6OC7/mloCE+B47vw0DqH4uMN2bSyOmMomQdJTV3JnG8iQq1LjfrpVPk6I6Huz0tQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI0PR04MB10390.eurprd04.prod.outlook.com (2603:10a6:800:219::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.12; Tue, 12 Aug
 2025 08:21:42 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 08:21:41 +0000
From: guoniu.zhou@oss.nxp.com
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Subject: [PATCH 4/5] media: imx8mq-mipi-csi2: Explicitly release reset
Date: Tue, 12 Aug 2025 16:19:25 +0800
Message-Id: <20250812081923.1019345-5-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812081923.1019345-1-guoniu.zhou@oss.nxp.com>
References: <20250812081923.1019345-1-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI0PR04MB10390:EE_
X-MS-Office365-Filtering-Correlation-Id: de721f89-d140-436b-ba86-08ddd9794433
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?dkh3Mjd0enVMRDhPS3o5L0pPTTIxQ2tFNEFycDJTNzF4d2p5NmNQN0JEeGlr?=
 =?utf-8?B?TUdCOG5BaVpDLzc5d3psZkkzVkhPNVpXZnRDTXlRdFJQTjVrUDRDVWIremY1?=
 =?utf-8?B?VGczVzdzR1liUFNNcEZHNWg1WWd2S3dVK0V3aUtRTmxlNWVUWjc4VmhybTVh?=
 =?utf-8?B?WjRqajJzaWZzV081cC84VXRzbStJV01BQzk0RGtkSlAvU1pyOXlrS2piMmtZ?=
 =?utf-8?B?ZURXVkh1eU04Rmp5THZabUhmeGNNYS9oSGFIc0Q1U2lYVUhSN3B3bHFnVHNZ?=
 =?utf-8?B?SUdJRjdXU2JpTVErTHJDQVZHaWVNUXhoTXdLRU1ORWVLWkZzdmhENnJHQ3d4?=
 =?utf-8?B?S0VYTzd5ZDQwajBuYTJleXdQcHhBUmZmRFJJU1dweGxFL0xINnNUQnd5QkNR?=
 =?utf-8?B?SkJYTWxMSHF1WEJSYnQ1bGxjS1k1T3hmSFIxVyt0TFpScmFYbHFvZlpZZ0gx?=
 =?utf-8?B?T01GOVRMa1U3d0tseWhBaVZ5RVk4L0g4UzByS05YZ2FvSndxSzR4Q0k0ZENj?=
 =?utf-8?B?aGpSNk9ZSU9WKzQ5NDJBbXNXNlJiNllkK29zRG9lZElJU3ZXU1FwcjEzZ1dI?=
 =?utf-8?B?RURsY2RydDVyN1gzeTEzc1YrdGVBVmh1Y3dtMDcwMG9vaktVUWF1WlBSU0Rt?=
 =?utf-8?B?Zzg2Q2dhTVBrTXBUc1J2OU5SWjQxdytheEQ2WHlUZ1B3LzBIdTRpWnphRXpa?=
 =?utf-8?B?UGVROW9VMGczSWRFS2Y5b2Vrd05UeDFVbzc2N0JrWnJGUkZKYzZ3TWc2YmVt?=
 =?utf-8?B?a3lBOFVUblpkai96Q05md1lXdTYrV2JPdmUrbFZZa00xS1RHeFdQK2R6SzEv?=
 =?utf-8?B?LzROUS9KY0IzZzFtMmxQd3krU0xFSm1LUC84ODR2RS9ZTC9Cb0lOSUZXQnNq?=
 =?utf-8?B?RnZETHpodUVJM212UW1Zd2FvY0lPSVBYQWk5aFV6ZmZ0ejYxbXZJSFQ3cmFq?=
 =?utf-8?B?YUV2NnVPL0RZRXJMZERqL09UZUN2U1pudWRJRStwanlVWWdYRlJNaGhkUEpR?=
 =?utf-8?B?SW5EQnVlUnpLRm42NWR2SmpEQ1JSN1BSRlZ2RzdZUnFERUFpZWNjMU9qZ1pD?=
 =?utf-8?B?S3lNY2RzT0pyc2JEZjk4SlN3ZVFsakxVRnhpWE5nSmxtMVJQOUx2dy9nQndD?=
 =?utf-8?B?SHBNaGF5ZVhmNkt6QXhNNW9Ma3c3TUFCOUIzaTVyQXh3TUxZbzVlQ3dONnlH?=
 =?utf-8?B?RUx0eUNvUDlOZ2xtVlJGNllZNHVsV1N2NVF5V1ZRSW12alZ2blU1YXJ1RnFY?=
 =?utf-8?B?Q1R2RGx1WGZGZUpjZmpZNlpobkFXc3FORDdZOHBOd3p5c2FxZXJQejhkMElQ?=
 =?utf-8?B?TC9jamhCdlU0aGhXUHZjaUthMUpRMHFhMytPSXVGUGVKZTlVQ1p3MHdMN25q?=
 =?utf-8?B?OG9UU095UENwMEZoWEtYUEJJRmg3aDduOHNKZjFZZm51dEVTbWRIakVic0Rl?=
 =?utf-8?B?R3FFYjJmT3ExTjBiTUNVOHFqaUpqOURJU1N6cG1ua0JZQ1REMkdweWtXMnlV?=
 =?utf-8?B?U3pUMnp0N3B1VFZVREdkdXhZVXhOV2FBdHExMlRNdUphUHJOS1hIck1mQTdr?=
 =?utf-8?B?KzZHMjdHRDZEWFJzdnFpV0w2WkdvdUVEbVlBQVRwS09iVkNleGVpWENaQzhx?=
 =?utf-8?B?Wit2MEhveXcvbjUzQlhjZ09RUkY0YnBaT0RBVXB4N2RNNm00K1kzcTdNZ29w?=
 =?utf-8?B?Y0hZcmFGcllydUxCSTZRSWFjT2h1L3dnNzdyNzZSNkZLcVJ5d0d0dDFtNG10?=
 =?utf-8?B?R2lFcThodXdmaTd0WlByNmora3JTSFdmay9ocDdYNmtORHBXRHA2QUh1OC81?=
 =?utf-8?B?MU52ZXk0Yk5aK2lNMUQxQ3doMGg0NHBRdkpqTTVzRFZPc2s5ZmM1V01Gb001?=
 =?utf-8?B?VTBTVzNVUTJSVkxuQzZtcDk3RDcyV0VmSWtsZW1KZ1B5Znp6TTU3RFFMQ0w0?=
 =?utf-8?B?RjZxMUNITndtOFF5Z3ZyMWZ6ZXRMZ2wrNUw3OTd1WEZnajZYbUJJaFM1M296?=
 =?utf-8?B?N2VwWW9QZEJBPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UitwVjhCTDlYWENycGVZYkJUMlU0bGkyblJ2ZVdNVXpkL29VVE41RHhuQXJC?=
 =?utf-8?B?Y3RYUXJ5aVFEQVRtaGFrcVhwdzRGYnZKYytjNzhJMmlSeTNKUGcyZlJaVDBS?=
 =?utf-8?B?NzN6d0V4K3JvWUVhQ2s4eTc5dlZBY0ZyUXplZHM5TWpvQlhSeGFVanlnazBN?=
 =?utf-8?B?aFY5eERpekRRTktJQ2I4Y2hCNWNkZktXZ1lrU04zTlkwZFh1azRydWpZamlX?=
 =?utf-8?B?TCtQVTkvMG1FMFFUdGpnTytUS2tzL2FnSkNDbjNzVXZ2anZ4RzN6Z3RIYkJY?=
 =?utf-8?B?bmpYV0UxdUhzWUJOQzFqKy9MRXQwcmhkQ2ZYS3VEMlcwTGtsRDFsRUIwRUVH?=
 =?utf-8?B?aDYra0EyeVVzS1FPd3lVTURWWXFKTzRDSUxqeHpyTW1HSTFWYXIwWVNwM0to?=
 =?utf-8?B?UjVXS2NaYzNRK0hpUk54UlZLVmRpVnBkOEhCRnZFRzFRaURTWG5xcjhXbmpo?=
 =?utf-8?B?L295Z1ZNSVVPTW00TlU4VmxrMU1SandCL1JDc3EwOVY2Z2Exc3ZMYlJWL0Fu?=
 =?utf-8?B?ZVdISExIZ3hKWTAxTlNVR1I2QnVWTSt2bno2MDJ3UlZpWElFQjR5TW92R2ZC?=
 =?utf-8?B?K1VmV1IrNHVPRUpNeUFuRU96aTQwSVhLTFV1amhKcEc4b3pUUGF0aXpJMDNi?=
 =?utf-8?B?bVhPWTdNeExVMEdEODllMHlIV05JMXRYcnlOZU5tOHR1R0dXUEZtL2lCdGxQ?=
 =?utf-8?B?Q05SQjBQeHQ0TGtyWEZMbDhaWG5oUjhmUUJUNnduNFp5anJnZWUzQW1jT0NV?=
 =?utf-8?B?aTRSdTV1ZnJVV3pOZ255VUhTR3NRVis4VDR4WG1GMFZ6R0VpbWY2aWozTGlL?=
 =?utf-8?B?d1lWS0xsa3d4SUg1ei91Y2NwUWJrV0ZiVGpSU0RBUkc3MTF0bXpTcW42TUs3?=
 =?utf-8?B?UWZ5WXFKYUptQm1RV1YwK1hjWUp0djIwWG9zMkVEeHVvR2ZNZGkwbExwTWZa?=
 =?utf-8?B?bmNaYU42S2YzbWpqdit4MlRpYVF3ZkhCcmUxeDVpQXBpSGVibmNKRFBVLzJp?=
 =?utf-8?B?dFZMTEt1TkJRT092MTJYRXVBejlRemhsV2xqbEFnelJzVHZSQ0Zkd091VzFN?=
 =?utf-8?B?d1VhSTdnb3ZOenpMRUVjdkVleWxhMUFhM0JXM0F0ek53ZkRDNnlOOTkzMmlq?=
 =?utf-8?B?RUxTVWUyNEZsdjh4MVcxK0NMdWJHRHYzbnJ4ZXlrbDJhQ05GV3ZMR2ZiZ2dr?=
 =?utf-8?B?dmlYTXUwblBjNGNMOFg0dzZoZVoxT1RHVGdmOW1peWdoWUhSYjNBUmdJM3Fr?=
 =?utf-8?B?K3EwN3hUSFZvRWNtcTg0Z25sK214bWxieGlyam5IbGQ4TjlzOWs2VThIQnVJ?=
 =?utf-8?B?dmM0a3A4YUxBRWxsa29DYVl1V1VWaGlNN1JodzU3TlVtMUJWWWRwUkN2UWlE?=
 =?utf-8?B?NnlRcTQ5R2owMm4yaTRpdzB3dGxhVWhCLzJ6TkFwRGlPU25EaExuTGpTQnM2?=
 =?utf-8?B?QWpjWkx6RXA4d1l3V3RiM3JqVHZMTlo2Z1RKVHM2RGJOWDZYZ0RVNWt2Rkxn?=
 =?utf-8?B?M3hOKzBQMUhib1p5VTJpNUpMS05QUnExWlFTaVAwZkRUMkwwZ0ViV2RxMXYr?=
 =?utf-8?B?VUtPVVR6c3VEaVRIVDBWdDBwa0xoUE1WeDMwdjltTFBDS3ZOUUhnbjVEdXYz?=
 =?utf-8?B?NFBJWVdQNTdWNEpCcVZvazFvVklSemc5TjA1UnhRVFM4WkkwaWdPS3MwNG42?=
 =?utf-8?B?Y0lOWEU2R2N5andhb3c0SWNNTXhCN1l5bFAwbFdLZUVUU2dPZ1Y3TXBRTEtI?=
 =?utf-8?B?V3U5Q2pDeElCUVlzQ1pjVWhDWDRmS3BpOGtUYUdTdkQ4Ymd3MVBkTG5ucEJq?=
 =?utf-8?B?K0NOa2NkSG5HMnRIYm9hL3piK1BMV3gvVzk1L2N4eE5DN0ZrcThFNzhsZWZv?=
 =?utf-8?B?bU5lVk5ySmEzS1dUQmZPOWM1MjUrOHFMZzk0Ujh4Ui9yQUowVVJtSnlwSERL?=
 =?utf-8?B?c09TR2Y0NzY0S1p5VGZsOURRYkRNZkFjeWQvMG9PbjF3bllBMG5QcXJhTVov?=
 =?utf-8?B?VmxmcFY3cHEyaVM5alhVTHd2N3B2L1YyUVNXVHJxeUswM0xXbnEyTHBwRnpu?=
 =?utf-8?B?azQ3ZW1VMFVxdzlMalQrTmFEUVNJbEkxZnRnOThuQlIrYXVPVTRQL25NbkJQ?=
 =?utf-8?Q?hWfzLZXJmcP/zf/1a8BvOWnPP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de721f89-d140-436b-ba86-08ddd9794433
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 08:21:41.8854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYm+IAvtXCAybVEeWHchr+mb4nGvsqPEOQGx8jYj/ldaVz6NbGoehlqr28RbyymYuEnr7mAc7lZAq+zD2537eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10390

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Call reset_control_deassert() to explicitly release reset to
make sure reset bits are cleared since platform like i.MX8ULP
can't clear its reset bits automatically.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index be07ff27071f..071d939d9048 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -371,9 +371,7 @@ static int imx8mq_mipi_csi_sw_reset(struct csi_state *state)
 	int ret;
 
 	/*
-	 * these are most likely self-clearing reset bits. to make it
-	 * more clear, the reset-imx7 driver should implement the
-	 * .reset() operation.
+	 * Explicitly release reset to make sure reset bits are cleared.
 	 */
 	ret = reset_control_assert(state->rst);
 	if (ret < 0) {
@@ -381,7 +379,7 @@ static int imx8mq_mipi_csi_sw_reset(struct csi_state *state)
 		return ret;
 	}
 
-	return 0;
+	return reset_control_deassert(state->rst);
 }
 
 static void imx8mq_mipi_csi_set_params(struct csi_state *state)
-- 
2.34.1


