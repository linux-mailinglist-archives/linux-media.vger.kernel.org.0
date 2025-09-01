Return-Path: <linux-media+bounces-41390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D214B3D9E5
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 08:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8538189A62A
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 06:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC08F25F7A5;
	Mon,  1 Sep 2025 06:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VFHlx2Gy"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010006.outbound.protection.outlook.com [52.101.69.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B7925C809;
	Mon,  1 Sep 2025 06:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756707965; cv=fail; b=J2u+BVqFa1VDtRY2g48B+xvl1QI5rvx+QnHi8idrat/jwTNq/9cDA0iir3C9eE5nqJGW/L5JEEiYK/mZ4jSIy+vcOsr7r1vn+I4vh33DVdFA6oBnhb59FQ2VPMGBb3CucfEHGCUm1XNCmmWLvH0Og6LjThGyEY/v/mEmKae5E9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756707965; c=relaxed/simple;
	bh=0AVVXE+OjkLsObQx7EyYcQBVkLrBIL95byUmMC9N880=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hS0kh/Ap0if6HheX2soCHgfzmoEEWzZ20MY3M9SsVunbVwTmMAN134Eyoae8e8gg22MLWfeNjNNhWf9HP8RtxVh+3d1q2Y4+Ag7f7TBlDD9DZoBodI1fO80oOUDO8OVmOr/3ZLQaz9n22jjstXRJ80ZCudildgOH2iXFtlCTY0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VFHlx2Gy; arc=fail smtp.client-ip=52.101.69.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JxhzDKIx9mtbZCMYuDOAMXbBDojMasnNd2BJMq7aVgT14Ui1yi/uxKQkE0jjBCjdVkqvn8gOAFdcVrcIroGJl2f6ECitMjXU35D1EnIT1CdXdcngFXZILAYgmNI/uSUv/doPked6cfc6HJsJDL/g3jB1P4sWjy6GWTdc0fkmCnQsovpn4gZ3Y0OFpfst7mjGxTq4rQwhjQ7k/Jhn0Uea+MO2AApjFSjMBZJueck2Dzn7OQ6j9D0P/dmOqH7jjEjVo9eFbLpDvL9jRfNHgJnDX0hIicd83AvcG0CV7y4d5pQWMmhdlKzry8Yv4vjOpSj2JSsNWTIqPerHQPOoJSsqlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqW3lbwFPdW7MMz6SF+YFhWAktKZtv7wW9Sr40tBYeU=;
 b=WKiSw7FKHtTpNH3EedD7EIwr3WDQzDpp8F07f5VWbAcRkIZRowZUNMeEqpaM6azXLwcq1Cw/5kqI0ITx6XfDmqxROtq41FrME7izLwvFD1sqLSdycT2RB9FeqR7H1C1n+HCVuVdO8zn/kHDall1LsdYsif0y1Tgfu4Nv3//F63GvNmqdW/comJJ63TVymDtBRxdLp1Ivc/lw8FFqIA9gjTAx/GwVqXiVF5VvEdtWGxY9/ym8q0em3v1tkU3o0rTNhp1Se6a3SImzM3RVFp21NlDwcrv5ZcCewYLuf/Q1ICwYbyxN+Wdg+WRaYN4eTGsQZoitIT7O/mbaTEm6LznauA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqW3lbwFPdW7MMz6SF+YFhWAktKZtv7wW9Sr40tBYeU=;
 b=VFHlx2Gy5RyT2pgGya7o63+xv488WFqVCWIuvgErrhB3uobD5XO9Uuwm40+4ZoUP8piocqy3TGcAv76djbiFd5P47EKIJuiBQ7bKop2qER/TJ0RIFIrF2reeTrNbb9rZU0NRLz/PE7exA5NwTqup8PiKBxBUq22j3MLEVvhPu917oUvISpvO0DsXUeQRRnCkQHSUKfhBxWiqPuziAEISwguw45SxQQ3fF9yKZTYLdgiqlQYsBL+PX/p9PqTqNvHCJsayAID0qMHzlW3Z0UEqd7NNqn59n0vWTu8YSzAC8keJVs8XzlUAvBet63mxnvUAutliDqYlB1lc6UV7QYO9JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com (2603:10a6:10:2f0::13)
 by AM8PR04MB8018.eurprd04.prod.outlook.com (2603:10a6:20b:236::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Mon, 1 Sep
 2025 06:25:59 +0000
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::473a:e4c3:5682:7765]) by DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::473a:e4c3:5682:7765%2]) with mapi id 15.20.9073.010; Mon, 1 Sep 2025
 06:25:59 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Mon, 01 Sep 2025 14:25:30 +0800
Subject: [PATCH v5 2/4] media: imx8mq-mipi-csi2: Use
 devm_clk_bulk_get_all() to fetch clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-csi2_imx8ulp-v5-2-67964d1471f3@nxp.com>
References: <20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com>
In-Reply-To: <20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756707946; l=3924;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=0AVVXE+OjkLsObQx7EyYcQBVkLrBIL95byUmMC9N880=;
 b=HfnYEEzLC6mcek9uX8FYYLv6bQRiQ9OTWdPnkEdlK5CeTpJWSZTJ3TKbFXreoxtNzbyBowsuf
 Rb/u5xR7eTKApWqjoG2uyp+9DLNMQWM0kg6dyspIEQuwUdDlfU4EHpR
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To DU2PR04MB9081.eurprd04.prod.outlook.com
 (2603:10a6:10:2f0::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB9081:EE_|AM8PR04MB8018:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d39d2dd-fad9-4bcf-e83d-08dde9206a8c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?WkJMS0xrbzlHTWVGelcwQmo5dWZLY1ZhY0JYSnpBbGw3WGRPMi9UbmZhV2FU?=
 =?utf-8?B?TTJUYkxKZW9WYlFQMWVBQnJZT1A1QldXa1ZMRDgwWlczdEFmc3R5U3FDbER3?=
 =?utf-8?B?MTdYTm11bWpXQkhGSDl4U083a3RrQWlVZi9jM3NkN0xMNUtCQ25yckl5VGMy?=
 =?utf-8?B?YjEyQjZrS3BjUnpRaWZUVS9vTjFZV0VGS0cvVHQyOHBMNXdpUkM3RmJZUGhz?=
 =?utf-8?B?NENjV3JxdDFZbzhEa25IeTR5amVpWUtydnl4MTNSbThEZFZoUitoMVhRSDh0?=
 =?utf-8?B?cFRab0JVMVkwVlpicldCVE1BcVJ2dmxvU0FDYlg3c05YN2Yra2RraHRwRlJZ?=
 =?utf-8?B?aHJ5M3gwVnhZUEtpYkJITGxidlRkTkZ1VWdvb0N4d2dYN3V1RXNMeVRYSDFO?=
 =?utf-8?B?Q284VS83SWM5T3pER0pZbFU1enB5MjZHNkR0ME9oTmQ4RVV0OWpRbGxubm1G?=
 =?utf-8?B?REJaTHJtQnQ0OHpDZ0RmeXZhMlA3K3FXSXNkU1JwdXpwazMzUkZoZFplYSt0?=
 =?utf-8?B?TFN1dXYxeENHemFmejV3cXhIUlEvM1c1WTZTLy80ZnFMTlhFOWZqYjBDVVJ3?=
 =?utf-8?B?NUJ5OGR5dytoOFM3RzdWVDA5ZXVOUDREckV5UHZCVy9FTFJUU2dkazROb2lw?=
 =?utf-8?B?cDJCN0Z4bGwxTTdkUkNNNlNzbEdOMHhpYTh3dXc2ZFpVb1FCWll5YVB1RjRE?=
 =?utf-8?B?Rm1HYWhWanMyL1ZMNGloazg1OU83SWphN2V1R1BGOGVEWUdJODdObk8zU1hQ?=
 =?utf-8?B?bXBTTHhDc3FEZ2U5YkJFZGpJaTQvdndiK3VWZklZUkRjWGtSOWM4dXZodHow?=
 =?utf-8?B?N1hpU00xM0daam9hazNRa3Y3ZllNZ3dGYjRFVU1jL2c4MDZva1pCell5L29K?=
 =?utf-8?B?R2R1d016a1BncCtmZGlLUHFZNzlRSE0xMFdBYzhKVUhkRDBKcGdYTk5WL0RB?=
 =?utf-8?B?MFdJY05qL3dtN0JUYU1yQkdpbWsyVDd1UE9mdW9VV1BDLy85NEFBcVJ2MktD?=
 =?utf-8?B?ZW0rR0lKZzNud0FwTUluYjVaNnFiMUlHZFl3UzBqYWdiRnU3UzdkSExYQUUr?=
 =?utf-8?B?N3pvKytwaUdtK21vWWlwbDcreDZ6WTdwL09DNGRpOU5EZjdYWXNvUWd2b2Fa?=
 =?utf-8?B?NG9iWkUvcGJyTXZJTVNaa2M1TlBWRldMSWI5ZjcwWCsramhyM1ZpVGpQbEFy?=
 =?utf-8?B?LzRKQjhKT3dyU0Q1QW9qUGYwQ0tXMlpERUljWFE2Sm5tdUtRTzdNcHJlcXhG?=
 =?utf-8?B?Y2hweVFCRzkxM2pLVlNQb29GcGVQM3JuMkxmZTZxVlhjQTFHTC96T0RLVkxD?=
 =?utf-8?B?T2cwQ0FCb3FRMGxPRUIybllXU2VDaDB6NUJwV3BjbVJRSWxrTlkvQW53ZVJo?=
 =?utf-8?B?cFowUDlQSU94dVQ5Z1FiUEZ6NFcxc20wQTVaZ2EzdzBManRPS24vU04vVWY4?=
 =?utf-8?B?MUJoTjhYa2ZHNHN1M3pRd3Y2cjdSRktIeE1JNlZMWUZyekNXcWdSZURoc0dG?=
 =?utf-8?B?RmEyWUhsUkVTZElNYi9MKzJwYzRnOUFXVkhsSDhFcTFmWE5lNjhuTXRyUjBr?=
 =?utf-8?B?MkNhb05TM1k1ZkRESi9hbHZRV2ZwbjJFUkJ6M0t6Y2c1U0pKemZyNTV4M3Fi?=
 =?utf-8?B?RkF4RjhxM1REQTdMRk1KN1Myc0hoVE9WSlRyQWRVSlJVdHM5UmJrZ0E4bitH?=
 =?utf-8?B?RzNPcFZoSXpYVzlhZHNqcnVqR1crcFRlSjcxSnhoLzNnNEdUT29ycTV3aDFN?=
 =?utf-8?B?bHlRdEhBMXhDaStSUjh6dEtCTFNQNWJ3WkZESkhHdlhDaFcyL3QrcGNvazNy?=
 =?utf-8?B?VkJrYTMzaFdzWllpZDhZbWlaaDU0S1U0MWMvOFl6NW9QaHRlRFAzdkRzOTNB?=
 =?utf-8?B?QU8yd2ZQbnNZTUxuQ3hrazV2NUpzVDRQZFJTd0pBdTJvTHlmMzhkbkRBSEk3?=
 =?utf-8?B?WUlDM3JhYlFQbGtwVG4xTXNBYUJ6bEkrRUVYbVB4M2dwckthdzBNUWRaSUUr?=
 =?utf-8?Q?WHV37ACflD+yogV7MyeK5LDju88Jgw=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9081.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZEw2N1hXa0JDYU1PaVJ6dThFTzRJd0U5Uy9pbXo2amtDdDh5cjdGSmlPOGpL?=
 =?utf-8?B?elE0RENwUXVaelVoUUhYNkZiaEppRTlSR3VWbmpXSXc4cWRucFhiMi9qRm91?=
 =?utf-8?B?TElmdTRnUHFYTmVodVhJUkd3Q3h0T09KK1NOVzBuNjQxaW9Ub0l2TUJZSE43?=
 =?utf-8?B?UTkwK21WYTdBcERHVFV6am5mUXFuTVZpWElsUEhvY2pHbTVYMjVndkppSTh6?=
 =?utf-8?B?eWZicDJzSHRDYy9wOHRpODRaaXJySW0vYVNxWFFSWkI0ZFhBY1cvYndwSmE4?=
 =?utf-8?B?NDgvVkVtSW9tUWgvalBnUm5ka2ZKWlZJSGIzR3dwbGFqYWZMV2NLSkt6VXhZ?=
 =?utf-8?B?Y0k1RmRpbTVyL2pjM3l6dTdDSDVWQXVHZUxRNzBMZEZaeUtydWVGTk0wOEg1?=
 =?utf-8?B?THU5YXJnNm9majBBYTd1RzVkWWpVU2l5RUZ5Znp0RXpWb3A4VS9ZeTBTRzc5?=
 =?utf-8?B?cm1YZ1dnZElFWktra2tmR1Y3L1VpZHZyclA1emFSQ3FvQjZ6dXkxWXI2Qnp0?=
 =?utf-8?B?YTR4MUNVUkJTaVNQeHpNcEcySWZyVURDRFZmcDBHYnB6Z0R5bDFoQUJhWG8z?=
 =?utf-8?B?U3YvYVJkd2RCTkZuSnRzMVNST2dObmU5c2tqQktYaHlJU0wrREVVajZIaXJo?=
 =?utf-8?B?ZnlYWEtueVZyckVRaU9NUFNySlpXVEIyUVhEMUxyVndhUW1SclhCck9JSnFo?=
 =?utf-8?B?eHBKRUM4cXJDMko1UmNZazkwNFdLbU94N28rUGJOR3BuQ1RoeVdabFYrcHEv?=
 =?utf-8?B?NDQ2bEY4WWtQTkMrWFQzZFB2VVFQNnJaWTRYNnVGTDVndU8vcnMrMUs4UXR1?=
 =?utf-8?B?OTNMQXhRTFN2bmlxY3A0cDNvVk1XbTRUaE5paktHVW1OSG14TklMZWZaUk9U?=
 =?utf-8?B?QzJCaVZ5TmdmWTZZYnNobkVOcEFmM205d0FVaHdiaU1ZZzRzOUVVT21xU0l2?=
 =?utf-8?B?VW5TdkhGaHpVMDBzTkpja21kM1VOVUR5NHZuOEtPZ3pDV2lwaTJQMHY3TGtq?=
 =?utf-8?B?L1c4QWNpTGNOU2FwcXVjSVdHbWdMcDVHYytMNS92Z3dMdVl5U2kzMUlyRnNO?=
 =?utf-8?B?c3N1dlo2anBEOFo5aWVidnVSc1g3UFdSOE5BTWJ6bmEvOTZQZ1MzL1lCNmJJ?=
 =?utf-8?B?aWNDU0wrUy9KcmMzOXE5SXBXdmJJeUphNnNVaUthMEZVQWpLek8zYjFHeWk4?=
 =?utf-8?B?SFlqYk93d2xaWXU5eEJzMzRJVVRlUHJGSGZLTyt4cU9QTHV0Y1pGUU1BRHdS?=
 =?utf-8?B?dnBIbmEyQzhnTlVHazEyRDJGcXc1RHAyWFZtQk1NL0UvL2hEd09hOHVDWDFq?=
 =?utf-8?B?c2VueWNqTHgrd1VxeGFUVTNtYVVVVG55YkpmOXVlRzdLR2luMU1QOW1Ick9L?=
 =?utf-8?B?cW9mbjI3WkVrS0J3dG0yZkJNQW9hZXNmSU1scnA3QnRJRzE1SjhoT0hDMHBH?=
 =?utf-8?B?MWpDRGVnQnZpR3QvaGlrRTJ2MWRWVHFxbnlneTJjSG9oODVIUDVBU1dzNW5t?=
 =?utf-8?B?Um5iMXcrTE1sVjBxYmZFZS9CQ2dYcU5xTGlUdUEvWTRTak1uQU5hTGlDRFNE?=
 =?utf-8?B?VlA2NXl2MmtYR1IrVVR5cVo5cXlxdHArckxsSGlRY2NtbHhXMWpwRVJXTlJk?=
 =?utf-8?B?bU56OXlpNTU2WWpVWmczOTJFK3c0QVk1S1RmNUZRYnN1WGVsRGxielBnaC8v?=
 =?utf-8?B?R3crM2pyWkNUMVhsd3hxSzlmTXF5ZkZLdVl1QmdXU1FKYnF4OVUxNXJnR2VM?=
 =?utf-8?B?MGhCTDNYbGhOWkNadk82U05JelNSRWswSzNQNFV5VXVZQVRqUTdHSmM2RE9R?=
 =?utf-8?B?MmlRaGJHU2VXaGNYU3hxcC9uVUJTcDUyMjQyNThnbEdobUJTT01wRzd6OWdM?=
 =?utf-8?B?dXBaSHdCbmZXMkkvaE9zSitkZkpCZk4yVDFJOG1qcW9IeXgxSzNTTjd1M2NU?=
 =?utf-8?B?VGRXaW92bzFSNEhIZjhzMlBkam9Db2hLTmpVeUtEbDV5eGhMZFV1aFkrc3lP?=
 =?utf-8?B?eGV3ZGVtdytBVGFwUkQwRXdjSUU5WHJ1NWRTYVVFWGZ0K1Q2WWRsU2xNbG9X?=
 =?utf-8?B?YlV6dnZ2aUszMkhnT1NrOXBVSEQ2cDRtUkt2N3JXQXBTM3NPTlpZdGhyR2Za?=
 =?utf-8?Q?kxNCdbJbmqTgRtyF/hVQ3v4Qn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d39d2dd-fad9-4bcf-e83d-08dde9206a8c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9081.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 06:25:59.4439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Ouj7O5TyWVOfuO8Qds8stJ5dDxYgTI/NqF0XAbL76HaWJdOASWFkYqm80SnkpGc7Ci2sq5yIS5Tx7AG14tclw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8018

Use devm_clk_bulk_get_all() helper to simplify clock handle code.

No functional changes intended.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 52 ++++++++-------------------
 1 file changed, 15 insertions(+), 37 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 3a4645f59a44028fdca82a4d8393e1a0a6ba88f0..2bf11984690af2e687a3217e465697333d9d995d 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -71,21 +71,6 @@ enum {
 	ST_SUSPENDED	= 4,
 };
 
-enum imx8mq_mipi_csi_clk {
-	CSI2_CLK_CORE,
-	CSI2_CLK_ESC,
-	CSI2_CLK_UI,
-	CSI2_NUM_CLKS,
-};
-
-static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
-	[CSI2_CLK_CORE] = "core",
-	[CSI2_CLK_ESC] = "esc",
-	[CSI2_CLK_UI] = "ui",
-};
-
-#define CSI2_NUM_CLKS	ARRAY_SIZE(imx8mq_mipi_csi_clk_id)
-
 struct imx8mq_plat_data {
 	int (*enable)(struct csi_state *state, u32 hs_settle);
 	void (*disable)(struct csi_state *state);
@@ -111,7 +96,8 @@ struct csi_state {
 	struct device *dev;
 	const struct imx8mq_plat_data *pdata;
 	void __iomem *regs;
-	struct clk_bulk_data clks[CSI2_NUM_CLKS];
+	struct clk_bulk_data *clks;
+	int num_clks;
 	struct reset_control *rst;
 	struct regulator *mipi_phy_regulator;
 
@@ -384,24 +370,16 @@ static void imx8mq_mipi_csi_set_params(struct csi_state *state)
 			      CSI2RX_SEND_LEVEL);
 }
 
-static int imx8mq_mipi_csi_clk_enable(struct csi_state *state)
-{
-	return clk_bulk_prepare_enable(CSI2_NUM_CLKS, state->clks);
-}
-
-static void imx8mq_mipi_csi_clk_disable(struct csi_state *state)
+static struct clk *find_esc_clk(struct csi_state *state)
 {
-	clk_bulk_disable_unprepare(CSI2_NUM_CLKS, state->clks);
-}
-
-static int imx8mq_mipi_csi_clk_get(struct csi_state *state)
-{
-	unsigned int i;
+	int i;
 
-	for (i = 0; i < CSI2_NUM_CLKS; i++)
-		state->clks[i].id = imx8mq_mipi_csi_clk_id[i];
+	for (i = 0; i < state->num_clks; i++) {
+		if (!strcmp(state->clks[i].id, "esc"))
+			return state->clks[i].clk;
+	}
 
-	return devm_clk_bulk_get(state->dev, CSI2_NUM_CLKS, state->clks);
+	return NULL;
 }
 
 static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
@@ -456,7 +434,7 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
 	 * documentation recommends picking a value away from the boundaries.
 	 * Let's pick the average.
 	 */
-	esc_clk_rate = clk_get_rate(state->clks[CSI2_CLK_ESC].clk);
+	esc_clk_rate = clk_get_rate(find_esc_clk(state));
 	if (!esc_clk_rate) {
 		dev_err(state->dev, "Could not get esc clock rate.\n");
 		return -EINVAL;
@@ -783,7 +761,7 @@ static void imx8mq_mipi_csi_pm_suspend(struct device *dev)
 
 	if (state->state & ST_POWERED) {
 		imx8mq_mipi_csi_stop_stream(state);
-		imx8mq_mipi_csi_clk_disable(state);
+		clk_bulk_disable_unprepare(state->num_clks, state->clks);
 		state->state &= ~ST_POWERED;
 	}
 
@@ -801,7 +779,7 @@ static int imx8mq_mipi_csi_pm_resume(struct device *dev)
 
 	if (!(state->state & ST_POWERED)) {
 		state->state |= ST_POWERED;
-		ret = imx8mq_mipi_csi_clk_enable(state);
+		ret = clk_bulk_prepare_enable(state->num_clks, state->clks);
 	}
 	if (state->state & ST_STREAMING) {
 		sd_state = v4l2_subdev_lock_and_get_active_state(sd);
@@ -1027,9 +1005,9 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 	if (IS_ERR(state->regs))
 		return PTR_ERR(state->regs);
 
-	ret = imx8mq_mipi_csi_clk_get(state);
-	if (ret < 0)
-		return ret;
+	state->num_clks = devm_clk_bulk_get_all(dev, &state->clks);
+	if (state->num_clks < 0)
+		return dev_err_probe(dev, state->num_clks, "Failed to get clocks\n");
 
 	platform_set_drvdata(pdev, &state->sd);
 

-- 
2.34.1


