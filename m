Return-Path: <linux-media+bounces-59367-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Po3BoTW6WmglQIAu9opvQ
	(envelope-from <linux-media+bounces-59367-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 10:21:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCC244E744
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 10:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D862F30182BE
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 08:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13C2736493F;
	Thu, 23 Apr 2026 08:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ua5eNNRY"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013013.outbound.protection.outlook.com [40.107.162.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E8336EA99;
	Thu, 23 Apr 2026 08:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776932470; cv=fail; b=degli6OQFrbDjykygKfx7NU5AaaDUpXTgKewNQEUcpQyH8U5vRgsRvqXNitVW1LssUMCOhKRCD7zdz9QMsOcHLAsuo1eOaOT1iyyvjpFk+zhHc0vMuB+HXX82QCnl9IKhCMdtK3KZjcL2BZzX3/gk/iXbAdR4r/PD0gMsoAxGd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776932470; c=relaxed/simple;
	bh=bPmKMu7UKvxPMyB7HBI/qwA+ABvIVHpCvGbGT7rDWSQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sWFOVaAIcoa1FYSMG4BvOJs5PiUXkEcSXizrYIy7V/ddXdL+6V+d3ZvAszTSHcF1BrnJjSUXCBq1hDUcRPvIDOpfBZuDTxkjkNs4Cb+wRW6OcC3SYhDDO59brttbgDOVuSRhKEhbNr8EniW0b+60Ifti9cGvvwTgypw9ReOe+BU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ua5eNNRY; arc=fail smtp.client-ip=40.107.162.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGH86JJ0TcJZ3WX4IjxkmVfW2s0/Zn2VwFe8c+jkg5jgSPVsQvMGC6pymw+dV4obyABRPLVj1H3xRS6Re9xJ6KlERj1zkWVGW278v36R8bHvDeLNs1T8C8R1lM6i5aq84fTT2aX53HqN1sMalNm1TKByTVEYKhODYSoy5UtIBn73YWNSbybd2L5zR4ZXNqe2ckmry/mcmOQm0yDxTbQxcYXLnmq7g5hme0PMhQe2qIhDbhj6JirVpSh2MGd/eFW9uQYUCjfg+XddbgATBVfbSmZvgq4ngCZ7HCmZwJ7d6FQYxk903mGQ7p4nwpAxDyWvcJSYlz4aifqDNrQV6KEkrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8loLj+T8LymLQ+Nl4/gfSpRI+szLPR0kcYuxFCnGG1Q=;
 b=O7ZAAZ3TFRbw+nx3MDar5c0b/oA74Hbul8r7JiB9QdgiRKyKZD22Ux2csWhrGsyhR6+/ZANNimINNKzt0aAv9sA9+5qG12FndLUR5x4BDjHCdUim27Zb6y8rgHRkB6qc2lUwyP31Meru4MwAxWdPHDl3LxXKrJYlyHaZGx2PrakDE6Khjz4SCh/G6nO8kzLbg1EHWn1FbkKqadGFP/9HaLsdutIIPANf3oxApAS4LdMjtI+/FI4SeW/XrB/bWDNagDE5EvFyVSz7DthpfUWMZHG9w9kpuKS/g9a6cdPjd8AwtnO9+GT9uMtlC2YhcGcviFDpbP5ghWL+0QB9LoR1Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8loLj+T8LymLQ+Nl4/gfSpRI+szLPR0kcYuxFCnGG1Q=;
 b=ua5eNNRYOIyjvgHk5aR7NehTBMw1wF8Wj18vMRyVtVGIS6gSQHp/7aJi2840CzRL+TwwTB8OmWN81wbCeB1ubIUY7JnWEeVDPH76wvEBZ3aB/02JTVH/O8pTkuNGgKJx8V8Igyg4xCLQaubwiBYvD2D9cQMIUiCV2EFLWbgoe2iPRMiwuoy+oPdNW04Jwk+JONjLrsrkQo/BZ/n2pFTnVXjCHnvVSWM6u1AZ+AXT3rM6cUD8i780E1nbEJSuVSvZC0MTE0AswEGcg4hvJNwDoRun11XsxBNLWEIPTqsbchsqPiP2PSVu+CDAOL1zN0LbH33yOY4qDix0Dlpv8Jo0WQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM9PR04MB8876.eurprd04.prod.outlook.com (2603:10a6:20b:40b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 08:21:04 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 08:21:04 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Thu, 23 Apr 2026 16:22:57 +0800
Subject: [PATCH v2 2/7] media: synopsys: Fix IPI using hardcoded datatype
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-csi2_imx95-v2-2-934c02f3422a@oss.nxp.com>
References: <20260423-csi2_imx95-v2-0-934c02f3422a@oss.nxp.com>
In-Reply-To: <20260423-csi2_imx95-v2-0-934c02f3422a@oss.nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776932600; l=1477;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=bPmKMu7UKvxPMyB7HBI/qwA+ABvIVHpCvGbGT7rDWSQ=;
 b=APKaWjKbxG34RbXVUEkvNyuupI79Arr/C5YTSa70WSKoU6wPnN+c2LZjgKO/rvE/BuQBuG1jF
 QG4B/3vBvcuDymXRKKJSsvl3nHGSu+poatJQ7C3M6PuS8YHpA8v53dt
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR06CA0252.apcprd06.prod.outlook.com
 (2603:1096:4:ac::36) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM9PR04MB8876:EE_
X-MS-Office365-Filtering-Correlation-Id: c1317035-e868-469a-5817-08dea11142a7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|366016|52116014|1800799024|376014|19092799006|18002099003|921020|38350700014|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 KeH40pmNxlZ+Q2xjKxIECSDNtFQi5p1SlW6fZs9OkK9UofvIm/VrM9LqmcvotPZBCnu47uWVXYOuropDLbKBiV7Li0TCE9qFveam68udCU97jRTdGD8KowhvQ5HLBAjPHV1ZBrczPQ4Jw0RJhfXkVt5vxljZU06lsFYGc1RFfpjOUARdePb505RGDCruDaxjbnJA0pwMeILdc97XviGQD9trUS8I1OZA3xwBRBWi9zBtcBwhlhgjCZdThQ3Om2ylgu/8ekOKDo5MrlYD1v+mvd1LZ8JPDjxDJlSCTCkNHZEdnvyDS/os2ttBaT+EiragzKNkHuPoETKIbH8T6R1MMOmqcJL6YHk5e1T7cyP527FiIeY3wC9SNkxGtglr6ltxtWj50UH/XAerMWHO/kPKSOSm1cO4zLYv15KH3I8h89ilLZWcSE+7NMHQvGtaH4JzXPX3szEQ/6G37LKtOCd+SP+BHKfl4TdZRbgSjwpCgA/saCX0zPYR9kOEALm5phGdp/DOL+q5pHKiluxOM5Gi0j744gIDzwyTmBIhHEg9jwBlf0uRPGnBdTEeJ9ce7ALO/a6hjo6o6U12WChj6er4gFCv+xOLAaMwbDF0lXnSu3m1yXoQUz9+x0IQ+ISwtnF4ht1ZNXpFALwVdDZBqvRVGCpnqAOcU7FFg8Gqp2OcjH3KEGXcBHxNkdueocf5JWdToYoHjxv/LAJtYve1OlDB7da6WqTxoIig0kYDkUo7uqHEwGL4W5fDSiPXvPcR+KzaiDhioLAJriwRds8saoyk6rbIGrqc3c0n76Qr7ipoqsujfJwn4AZH8Eoj9j4T3xqY
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(52116014)(1800799024)(376014)(19092799006)(18002099003)(921020)(38350700014)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?SGJTcGI2cUtsMjhlWlpoM0dhMldkQkxsVUpJbm5xUCtNMGFSK0l0ZzBrNDVW?=
 =?utf-8?B?anlyVitwNHlTMnBzdXYvMW5ETmt5UG5CckF3Nlo5Q1hnNEUxODkwUjRocSt4?=
 =?utf-8?B?Rmg0eUpaY3RYYlFzRDAreGNjR2dJcDMrdHdwZUU1OXEwd25qTno0K2pVWmxo?=
 =?utf-8?B?RDlCSU16b2lxSWVKazkwdkN3SEZGMDM0dlcrbm11dWRMelZOMlFDVGdEakpO?=
 =?utf-8?B?UnJvUU5xbGNrZHYvdGJhZVEyYW9LYVFUdFo5bkRvbkFRMjR4YjJOY3RJSStD?=
 =?utf-8?B?dDJ5S1VsY1J5SmFkWGlWV3kvbGgwenZxUlJrYlZBbEVNRTZsY2lJeEZMbWFm?=
 =?utf-8?B?dXlWbWJDYlRQMHJ1elU4S3ZzUTdkdWxTMWJHaE5ZNUhZaXhQcWFTMG4zalBV?=
 =?utf-8?B?bjlCMkFYZUhUeGVSTWU2bmVadk01TGtPOHIxSmQrelVSZ2htYVZqNUc2Mkdz?=
 =?utf-8?B?cWZrOTNIekpEbTZJUnlQTFBFdENkVDR1YS9CSExyTGVGaitlQkh6R1FZbnYz?=
 =?utf-8?B?SkxIMHlqV1Fad3JUOHRsZzg1NkhKTkszRy83L2FUNitrYU5PMENkbjUydk12?=
 =?utf-8?B?R1E1SGFlZEJrN08yNC9sQXd4NHRNZCthTnNHenM1bUtNTUpMVDRuMlBHUGdB?=
 =?utf-8?B?c2xLemlWRjd5NlI5b0tTYmlrQlFRM3doZ2pTVWtNeFk4V2tVQXNnYStMeWFa?=
 =?utf-8?B?ckJxS1BLYXUxM2pBZUUzWUROcjc3OFVpNk9IbFUxK2xQYU1XbkNWeUYyeW4r?=
 =?utf-8?B?dWd3Kys4anFUdlNOaXo2SXRsYTJaSHNyL1p1WWh2RVpYVHI2OG5GRnFnMlVX?=
 =?utf-8?B?eEo1OE1MeDBncFBVbVhsL1NEaDZxVy9tZ2pzTlUySHJmNTZwMUN6allEVTRQ?=
 =?utf-8?B?ejVhMEtFbURYMWw2L0RwSi9QcFF1b3BwVFhBQ3lJdGc0djF1SHdSQ04xZVh5?=
 =?utf-8?B?d1dnTHZuQ3RuQ25id3dCckkrODlHSVBHZk92TVNucjRvWUQzRmUvanNBQVc4?=
 =?utf-8?B?ckkyRkhiZDdVS1RueHhTZDJjYTB5TEg1RExNYTNtTEw3dHQ2dkxxN3NTRjJz?=
 =?utf-8?B?aStwSnppNzc1RFdvYzZ6TXVUcUxMZGlxNytaUVo4cHc2MS96VVFQUlIrWlQv?=
 =?utf-8?B?ZlF4WmpaekZKWTZEb2I5WG5NdjcreTNiRW0wbjRDUlU2RWFBeVp4TXhmczU3?=
 =?utf-8?B?dEZObFNuM2czUTdGZUUrWEFhaldOV1pmVXVuSlhHTHhiMnUraFpZVmdlRExt?=
 =?utf-8?B?OG0zd2tYUzBraXl6T1pjam0wbkl4VGdveFZST2VuSG90eExyamtXK004amxT?=
 =?utf-8?B?aFVDWWovb3VjQ2RCbFphWllZWUJ4RWJ6TTdCT0JkcExRblYvRENLN2RHRDNJ?=
 =?utf-8?B?RU11YkRPU2dIaFRMSmlZSTBDOFhTRGRCV1pvNHpIODZISzEvbHZqd2xOR3Ja?=
 =?utf-8?B?U0NwWitBdXlYdlJ0SDdOaWg3ZXdIY0tXb3ErajdmOExiVXpidjluSXdWdmNt?=
 =?utf-8?B?ZmtLRG90ZTN3ZGtrMmhZQWtQN0tpanRZb1FPYk9waTNwTHlJc01wNk50M2NG?=
 =?utf-8?B?VnNGcDhETEhNMTlOc3F5TnE1RVVNYlN6VzVRL0pjSUF2M1c3ck11ODQ3MHRv?=
 =?utf-8?B?Rm55RWtoT0VyZ0Vza1E0SE5ESVZ3aGtoWVZWaDZSazZTOEYweDVkU0VPTjRZ?=
 =?utf-8?B?dUExNG84Z2FlMDVEb3o4NWVZUzM1ejI3U296ZGxXOTJOamNrZzllNHdoVkUx?=
 =?utf-8?B?ZURRc0p0cStHbU1RdEdNLy9zWm0wcHo3NlI0aWtnSzlsdUNJMmNjUENTQUly?=
 =?utf-8?B?RWpGOWk5VzIydS9hRHhadURLb05OOWZXWHQ1RWN6eDUzS0p0ZEdxbHVtLytO?=
 =?utf-8?B?Y3B1TVYyaFVtKzFJc1YrRSszZnZFcEg4SkY4VGdweWhWN3k3MVA3dmhkSG1J?=
 =?utf-8?B?YVFWYmZjWXA4SUU4VEpDaTBrYTBXalM2TVZodElDRVlVcGRXa2wrNDVJSzJy?=
 =?utf-8?B?WElFaHhGMjVXa2dUajBjbVRpN0VySGdPeWhReFFVam1HSi81aFlRenpLOGFh?=
 =?utf-8?B?bU1TNVEyamlMa2gxQWt4V2pRekVzSVdxc3FKR3laM2xzN0EvTU1UVkd4MTdI?=
 =?utf-8?B?WUFCcUk2dlRYdC9lMnVqY0Z6ekZhbjE5dmxNSmdVc0RHSmxhcUw5UmtQZFo0?=
 =?utf-8?B?a0JQZm1FSXNESjM5b2FzdDVBWWJyd0hWdnRFcTRFYVpiNHJLdnkxUHZvdzhk?=
 =?utf-8?B?MURIWDlWdk9wajBKNEN3STh5S2w1NjloZmZyUmlBYTh0WkkzS2FhUFYzdXRE?=
 =?utf-8?B?Mi9Bb3RyRzNkNVJqZUtlTEoxMXFCVXBnZ3N5SUNOS21SVmphYkZUQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1317035-e868-469a-5817-08dea11142a7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 08:21:04.0092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZkPAUoHZBVXrq0qCi8jJIQ5J7huywRc6sk1UIGV/RaVSET4WL0pVPF0OxLh3A8bJRhZ7LzuWD1E4nCPucQVbHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8876
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59367-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.nxp.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: DBCC244E744
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The imx93_csi2rx_dphy_ipi_enable() function configures the IPI datatype
using csi2->formats->csi_dt, which is initialized during probe but never
updated in set_fmt(). This causes the IPI to always use the probe-time
default datatype, ignoring the actual media bus format negotiated at
runtime. When userspace requests a different format, the IPI hardware is
configured with the wrong datatype, resulting in incorrect image output.

Fix by updating csi2->formats in the set_fmt callback to reflect the
currently negotiated format, ensuring the IPI configuration matches the
runtime datatype.

Fixes: ec40b431f0ab ("media: synopsys: csi2rx: add i.MX93 support")
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v2:
- New added in v2
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 02eb4a6cafad..b3f90da8b43c 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -470,6 +470,11 @@ static int dw_mipi_csi2rx_set_fmt(struct v4l2_subdev *sd,
 
 	*src = *sink;
 
+	/* Store the CSIS format descriptor for active formats. */
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		csi2->formats = fmt ? :
+			dw_mipi_csi2rx_find_format(csi2, default_format.code);
+
 	return 0;
 }
 

-- 
2.34.1


