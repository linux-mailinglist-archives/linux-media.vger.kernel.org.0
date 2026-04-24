Return-Path: <linux-media+bounces-59482-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFxxDWQS62lsIAAAu9opvQ
	(envelope-from <linux-media+bounces-59482-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 08:49:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B171045A546
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 08:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 038CA30209F4
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 06:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D092B35E936;
	Fri, 24 Apr 2026 06:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Avfi4zjI"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013012.outbound.protection.outlook.com [40.107.162.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0907E3451B3;
	Fri, 24 Apr 2026 06:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777013295; cv=fail; b=A3cPT0u21+y5zC3YuhHbAc0AdsWroEMtmwA0WeuiPeM+j/NsVp+ZJKLD96rk5WyDo8ykuKbC+splpT8AEk3PFTM9GZYoXRWX0TviYTBDOgMDLUb8jC5sbnWB0TG9AYTmRJzjMtji/1UkIprXemxyiW35n6dhLQnkWYpKm78yKhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777013295; c=relaxed/simple;
	bh=viKVB/fNZ1uxQuuAqXVty2M3TiQxa67gdze0wKA74U8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=YMma89Twjre7/HwjhJE8YBXVZNANMWL76fNAAGkQl+RPrSbT4YhHMh5XC1+bPouCC3ndQzebQqO59iyGrJWMa7vjcldbZduVG7KGsjxOZzMrEl+/0yWWxJx3Y0wqnXBXMg57TSq9OVoAbwhCqkDGICCi/o88X1p2u3X2U/t23B0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Avfi4zjI; arc=fail smtp.client-ip=40.107.162.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCjfUsHOTVAqWgkXf+2Pmom1+UxwFvLWdPAxRyAfe1WDt4jQRsYTYJL8ddESjGKtgfBxa21XVRaZbLOKXnoysmkK4IIIhpVS/2bZ7H2BTzRKdf9fA5wkyUfy6kscL1WWNwgNLSgmuiyMhQ3FOPVhY516tT58tOaSfK2uSnjp6LyS0LkKv5WaGg2wpEFym/jk3UTD32Vf1iJfuft60gur6aNdj8tAiKz5ZoGfgmXKIChcF0gFP0baVKZSUySVlGgGQaw2Z8ySiXRTiB5NR2Nb8R2fxQmQmueOkg9lazG4fJdZ7XHa/l1lwDyPVJQzjHt0yyB1TvFtMxOyTtdAaD06oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXOayqcq8M16IWWGothYqRM2Y0+UGb1AqaNSmFWn2DQ=;
 b=Igieq5TUDJm9IJ0ZY2+53mJQGFzqmH5fnYCbCnwUcyUb4hOMPSrWM4mjWs96imo1bPcqLmnsvViyM/UF+57SxQDHU1BEsNbNpT61mS8Q42AyM30B4s3rIGMWKjU9K4cSa+XfSUS4F1X2fPfiMVoXEfqnLJhbolfxMzHFXsc+bLQKswT5UiSi154fx9d4Y3YQk2mkkWtbMQ3BZ/cmjJQnWIrvu0DR7EAZ3szGYYvq9uj4JDA/hYR8Vk8zZ60SYJ/W4T5NP+tJqYPUNTKPnKXQGrVJUaO0UKFINZVJGquMupaadXAmU7sp/ucJyRrFc3+dX7n+tnLIU76wK1VK1sdsDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXOayqcq8M16IWWGothYqRM2Y0+UGb1AqaNSmFWn2DQ=;
 b=Avfi4zjI/fBv/uA/aEHXf36077Gi6KiHZULYgXSS4ilsFQN8BmSReRstmvqi7u8dfi+K/8Q8QSvRXXhJBisuumHe2XQoObZY6HtNJpWar64+1Xmxrz54uULewU6sXQ58WVsg2UDFEukEU3Q9Kicmuqu/w/9EgxhyPUYdrHOvfYMFKfLqfcOtfDOV+M0sy7AjXFKA31qz2aFO+XS9Mjf1uZIMQGykJihY8wK2d1NjfveTBjeFgFnsAHVBRopWDOt/Af1l/fZ2c72Wp7Sb1R45MLw/KfoPDgGj/am17QCfDPeZsZ6VY0+pfh+fpl2wwzlNd5BmVwZhfB8YTnjq2EcR8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA4PR04MB7903.eurprd04.prod.outlook.com (2603:10a6:102:b9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Fri, 24 Apr
 2026 06:48:10 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 06:48:10 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 24 Apr 2026 14:49:50 +0800
Subject: [PATCH v12 1/2] media: dt-bindings: nxp,imx8-isi: Drop
 fsl,blk-ctrl requirement for i.MX8ULP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-csi2_imx8ulp-v12-1-da148eabc035@oss.nxp.com>
References: <20260424-csi2_imx8ulp-v12-0-da148eabc035@oss.nxp.com>
In-Reply-To: <20260424-csi2_imx8ulp-v12-0-da148eabc035@oss.nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777013438; l=1072;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=viKVB/fNZ1uxQuuAqXVty2M3TiQxa67gdze0wKA74U8=;
 b=Bebz3ruH3e4z1H9Bn3y2OHtF9R5tRc5kk2WCTrrtauv6csvBQp1vrwEg8FheoFdDIRuCGQpYa
 y6sGH8hlCeoCEFTGsNO2K2NvJ5AZeEmSp7SNvVzDqSWE/D1tTX5J5Qc
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::8) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PA4PR04MB7903:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fd1928e-f666-49a8-dde0-08dea1cd72b9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|52116014|19092799006|1800799024|56012099003|18002099003|38350700014|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
 f1TTBVnxxjDzG5Vn1PdX9ED2x3/EiuRfi3JuTMJlUsInm8H2UDGjpuI2kal8KHVC7yFSRpHPx4jHTBr+vPCvZi861SCIN547sRbDk1RybsiQ59XWpyU+RtHKVrbkjgOFzKpfb2HkNcQdKzTol3vejPaIJJuJaVghzfHrbDsXTdpsjkYBTrDZfmQZq7j/tmbBkRN16qKMQu03VASpSxG269h2kjbnbMItPNuOWXuh3N5fnh3PYSnAk/cI7nOCPNHZgWl9puoKH9FDOtX0YJ+ClyI62pWsnboyPBw7ii/XAz/6V2t4rEsXfxYR5E4cFCDgYEA5HxwvDYmsjyKZ2jWrPZ9DmVJnPKNtFrtKlcQbV6VoxJWdiPr5PIieEqq2qjr9XY4pNvhTf9DC9KpJGi6MrKqZlWm+/fze8HK/2Gy9ndQ8RckIta5uftywCVb7UJJik0Eg6TdaWBIa07LoiyXgiWFSWPXHw9gH/8QJ1WswSUNdPbtUjHwwMZs9jaj6lP6TDfZtJWpGtGwDUBJbRYm0nczeFNLHo5/M+6rxqvtuQiKuaImLrrav5iVrlZ5XounqTXDnKL/6t4dfAXyExRRrwf/4DCDWJuNjRqQOjwVZ+EO5Fw6qlRN1PW1c9Ta8NM9sY1CZIT3UvOSDWh3FtWFJWA/vofwoJAa4IhF/6UR7t4UlJBKpe7hB7sjHZ9wpBVeATJZvz4IiERxyXFlLuvcPZgtjRMqsjTWagRNHclk+gXOkLcePtZq2BfvX0yysXQ8lL1CPepCAIU14HlHECKp37sV0Xhkz6NlJjB+2eJTEKF/NKPosDJ8XzJ4mo2KHfN3F
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(52116014)(19092799006)(1800799024)(56012099003)(18002099003)(38350700014)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?T1MyWGVldUhuR0Z6U3VaQjYvbFZ0Sjc3TDlLV25JRGRnckIybGlac09yY1Zn?=
 =?utf-8?B?TVlVNDFrRWQxN1BpOGN6d0ZWYThDeXB3MWZFbGZUaXVLZTliZERjektHYWN5?=
 =?utf-8?B?ak1sQ04yMm5zai9wLzBodGN0KzNUZGhuMkc3NnJzUFNqc1E1RzZ1NjNQZTRT?=
 =?utf-8?B?NGRIRng1S1NaTHExREt2bFpORWwwamFmMTRmVXRBSmErUTd0MkUrSzJXR2k1?=
 =?utf-8?B?eElmQU1aL28xQ2puVTU5bFFoWWs0VWVGNXIyTVJGQTBiU0IzT2dncGFqNTd1?=
 =?utf-8?B?SkliUDBqSFpzYWVqVHhQZklEQUlTK0VGRm0zS0lmWFBBYm1XUUVmQ29BbFQ5?=
 =?utf-8?B?bHV0MWJFU1dDMGwrZ1RFaFZqaHBhdVRwd0lsY3JHZ2d1Zlp3UHhBb3hYcFNq?=
 =?utf-8?B?L3BSNTRHdGdMK0tIblNlZkFLUDhjOGhtMTRWZFJOcGF1VlpTNWtDTThRL1RY?=
 =?utf-8?B?SVA2WS9BM3pFWlNGaXFWSjRNaGZjc2FjcXoyUUdkejNCOXFZQXd4MWJnTjFC?=
 =?utf-8?B?MEozeEQ0RVhBWWVCckF5bnZua1M0Y1g0VjM3Z2JjQkV2VFIrbVp4d3BQdmRZ?=
 =?utf-8?B?bTlFU3JkcVc4dWZFMUpUQ1NtYnlsTDNjQVdTZlBHTVBCZ2liU0Q3bUNrU3pY?=
 =?utf-8?B?Y21NTEVqcTU5S0Z0R3NhSVBSdGRaMmRSVXJsY1lPMVFncy9FZCt0SVZVc3RO?=
 =?utf-8?B?MHFFckhHdDcvK1ZUaFM2TWhIOUxBRitZY2JMODdvQm1TWlVTcTdKdEhPbEVN?=
 =?utf-8?B?a2Npa3V2d2lGNldIUCtJcjVLdjBocWd0WVQ2bEZ2a2gvU1dvUExxM1R1RjZu?=
 =?utf-8?B?MHh5UkhjYTZLVXBQQmRyYWRQdGE3TzcralREL3ArK2dGYk1VNE93WkZyL1Ft?=
 =?utf-8?B?M3htN3R5VmN5L1NldWdtL0UycVRwdVU1UmkwMXpWUkpYRHRlVlZwT0RIbGU1?=
 =?utf-8?B?Vm5wdm84bGx6c2Z4NFE1dExPdEhpcTRaQSthUjR1RjZTZUVFeG43TGVXQnBG?=
 =?utf-8?B?TDRpTFl6V1I4KzRZV1hMYUFJdkJPOFNVdFFxbWt4cE9FMEdtWkM2Z1VhT1Fj?=
 =?utf-8?B?NVdnczZxN3RlRmE1dzR5dHlyelF4d2dFSG5BcDMyUHQ3VU12eVRXV20veGtS?=
 =?utf-8?B?ck1HRXFPalI3TFlOQXBob1RzUXJlenRCVkRWZWRteVR3RGd4VEp6cFFWQWhw?=
 =?utf-8?B?eHlhWXh0UG16cUhVYVlpWnM1alczbU5qR1EzM2VwQnd0cGFsRTBXWUFxSTE1?=
 =?utf-8?B?d1ZKd3lPQ1NMNlR2ZUJyZ05TSHo4OEZQajZzTnBTNHhyTjU1TVY3YmhtMGFh?=
 =?utf-8?B?TFRjRzZtZCszOHBTQ2xOR2pGdGZKU2ZIV3Bkb1dHbUlFNHpNMmh1ZE0zMWJ2?=
 =?utf-8?B?WEZhZ0F2ckpoRXVEOVg1WVZla0s1TkJXaUtBejFsblFwa2hhcG9ITWlNVGZD?=
 =?utf-8?B?YlIxNHY1Rkg3emo0a0dGNGF1OEpiaXJsVWs2Z0pBVE1VeW1OeEVNZjFaSG4y?=
 =?utf-8?B?SDFITnViZ3BKY3E2QmtqNzJPN1d2U2hWWUw2RWJRTjV2UTBHU2pmUFd4ZWtX?=
 =?utf-8?B?VFdHRGpHcTdZN1kvbThQTFllOEJ2YWxBTFROa1Q0Z1VSWWhvRzJHNkpoUzZN?=
 =?utf-8?B?Y3V0QWxDeE1sS2xzNjZ5MUZsUndReUpxMG5YRjA1TmV1Sk5GR1ZORHFlWFYx?=
 =?utf-8?B?U2p3ejVDQnoxcFR6RlptNkp0Y29vN1FtUVNlQU4yUGxLWG1QbmJMZGR5QTda?=
 =?utf-8?B?bVlwS3ZuTG9TbzcycUVoNmVGbU1jWVNKWnphUGlIcWZJT1dnUE55NkFlcG9R?=
 =?utf-8?B?UktTN3lNQk1qWTZiRG1lc1o3dHRqRnZNMFprR3c2UFExc09uVTVWeTFXU3Bw?=
 =?utf-8?B?ZFhJZUgySVNsU0JuV3YybkFTV3BVWThvc0xOQnNYelJwdW8xaUpNVkxvRlhG?=
 =?utf-8?B?V0Ywb2l1ZWpqUDhIc3VLREFKWE1jR0RmNS8wdTN2MXd6QUlSTmVvRjBva2hk?=
 =?utf-8?B?d2FLUFhENys3dlNicVNnNmVQbXUveFhVcnBoYWNRc3NMUE1nNHlKVUhiakhG?=
 =?utf-8?B?akt5clpiQjg2Y1FhZzh0eEtSb1BJcFZOM3d6OHlHWWJybW5YdHIxeDg5MWIz?=
 =?utf-8?B?QjJSSHFiVGl4bEs2bzBlenQvbER4NVNNMFlKeWNwWXVQeTlZaHFWS25uS3hx?=
 =?utf-8?B?SXVEbTk5V2FqRTVkcDFsVXFlR2dnenh5NXBSZzVhR3JBMnZ5bWN6ZUw1UXdK?=
 =?utf-8?B?bHNIQVgxZjhhcVBROEg0bHNqeDFCb0pyN3BDTFo1RnBxOFBqdEk1cGp0UmIx?=
 =?utf-8?B?WHdEZWFrWURHUW1TRXRaVUMzakRJcnpLNEJKZUdEbXpKTmVFWUlIUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd1928e-f666-49a8-dde0-08dea1cd72b9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 06:48:09.9426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0DVitSDpWUqOHpy7SviFrUoYBaA6wXl8SFsHFT6tU+6sIJ1yE2480KgNhBuZrC6ej4ZZBuSzPJ6R/gPyx1slOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7903
X-Rspamd-Queue-Id: B171045A546
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59482-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,ideasonboard.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,oss.nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email]

The i.MX8ULP variant does not require the fsl,blk-ctrl property. Add
fsl,imx8ulp-isi to the exception list alongside fsl,imx91-isi.

Fixes: 288517a3c6c9 ("dt-bindings: media: nxp,imx8-isi: Add i.MX8ULP ISI compatible string")
Cc: stable@vger.kernel.org
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v12:
- New added in v12
---
 Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
index b59c4ce30b8b..279c9cd3034a 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
@@ -117,7 +117,9 @@ allOf:
         compatible:
           not:
             contains:
-              const: fsl,imx91-isi
+              enum:
+                - fsl,imx8ulp-isi
+                - fsl,imx91-isi
     then:
       required:
         - fsl,blk-ctrl

-- 
2.34.1


