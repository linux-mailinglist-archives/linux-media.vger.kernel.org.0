Return-Path: <linux-media+bounces-52924-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLKcA8Ntk2kd4gEAu9opvQ
	(envelope-from <linux-media+bounces-52924-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 20:19:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB16147408
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 20:19:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 585243042B6C
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 19:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802912EB840;
	Mon, 16 Feb 2026 19:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WF8cRvaf"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013039.outbound.protection.outlook.com [52.101.83.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5152A2E974D;
	Mon, 16 Feb 2026 19:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771269539; cv=fail; b=GaQSOx7pTvp3HpoTps9YczPn4EloisDtlTIrKPPGGRNj8buSfCXpUTHm4KMnq3z5qLMTpN0q5y1+C1U9VUUSlvhpIdlPueUsHJw28GrPGKGfDdMQcmTwMpI6G0YrFE13v7nK9AS78LXK/uIbixCy36bZtagp2Vu61wuNJ+racGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771269539; c=relaxed/simple;
	bh=mpTpZkz6ff450WYAFMIAZ5GLWsamjvGcAffHVqbBnvI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=j8tDt4V7SQUlhioTxvMdhPMo+0NRd14UsnIoFTARcNcjAL0KCIDn1vY0K8tCFNTb+IZuIcCMzUX3SzRJe53KpDjG7LZcesdtfRLXHiFT1psmAzjR38CESPNwarcc0NeJIEr1VoHPMvPNWbiE80HxnoZ4QiPZMx5Y8TN9CCuPAWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WF8cRvaf; arc=fail smtp.client-ip=52.101.83.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jM30NGEXbfKrwhEHx1XXg8vEM7D/x8a5xrnqOnWjgQdeN27TWZ2vOgRDRDFEN/Rs7KHL31WZOkw1I4j/WCOwUDAuB2rF9O54CU6JlgkOs0GCGXOQzoSf5yKIlgb6Y6Q0BX+BMUBUiLAMGucjxYusaKKphqmr+CocqdhHTP0vdj2Q5XAeWPNuktwSww2dDmFcFEx2wD1Yhq/fpxK8j9KmFfI77XzJ503OjkOfpG1V89Jep+zWpJN6jjKhD6mSRfoffw6GQPHmCiHRVzS9QTiWjI0KltUZFe1eP45Hfi2t8Nc7cGdM/+6I4camkrWz9cqIfOL6nTzRkwQwENZ9UyMjWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLBo6A24NghBOFmC4O08Hq5ZpomVjigGGqEkgzk4qrM=;
 b=c0jXnja1uFvnPyRUpX7xc7j2Z59Dol3H4gDBssb9npV6QzUzdrn4ozZ3PZGkaUIlYhyF8tMpRFuIHuo/s8ZQOsaM2Jm8uQ4ZNlZmSDRaI6JALwo+euAYo0XKdZMVHccb7YaaQ1F2AJuMnvUQM7bPavsgdJsCcCz1p+LvLZT1WhtG5E/On5KjRH0/CREk6vTjb7TLZsvjt41jDPw1Wnri6QJtZxqqaOeU5YZUpFCTmiw5S2Bcl4vqRZ1dacQpQ8vajdXnC6Sj5tlaRzjqLaBDkPZBLInv51ojD+NqLRQMLPm5XTpgoFGsDMKzAH/WVDoz5eiyGp33lKZ1zpli3AeDAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLBo6A24NghBOFmC4O08Hq5ZpomVjigGGqEkgzk4qrM=;
 b=WF8cRvaflee4CaI8RWSCoB+RJWePo+/B8WTnHd6H1NKqfzhNf/u73J+s1yIBpEge15Nb1tfhJtRWCFax10KpzaAVPWhcxNHYRk8VHpuAUW2LRIgX982rxTmMFaCA6bFK2fy6BYVNuxeg5ltZ12U+Dz7sXE8gtofscabKsNhl5C538TvYsjRsXj6YZ09M+lau0hPe+ZKYYEp5Arqy+958sRGsszduI2pqItfwjEr7NYDL9Nq8N1zBJlp6uyTi1Tu+POtc3CkyC4dvobr0YoK+HawLGYjh+tyBnXPOmQGLgT8m5NLxGCphZMGrPbs+mttdm9r2BPjAS9/nwd82/22ioQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7599.eurprd04.prod.outlook.com (2603:10a6:102:ea::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Mon, 16 Feb
 2026 19:18:56 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 19:18:56 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 16 Feb 2026 14:18:39 -0500
Subject: [PATCH v3 1/6] media: synopsys: csi2rx: use
 devm_reset_control_get_optional_exclusive()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-imx93-dw-csi2-v3-1-aabafee10923@nxp.com>
References: <20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com>
In-Reply-To: <20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771269529; l=1316;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=mpTpZkz6ff450WYAFMIAZ5GLWsamjvGcAffHVqbBnvI=;
 b=Ptv6saoGG6JF5OxMWOzCqiUrly9A/H+mrI21KG/BMggURnIZ4as7niX0ZYXflKvsu2wTjmdzI
 j+Lqq1OVuRUBAvnPf1/VT2ZQdpWwqGhFxvkiz2PDvQHWQposWVFApKB
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: b3f155a1-7ab1-4843-0404-08de6d903a97
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?d0pwVmVYemVPV1lEZTQ5NVpTNTFCUThZL0h6MFlvelZNT1lYRVJOZDBRTXZC?=
 =?utf-8?B?MFVwL1AwSE1Nbm5lc1VkUFE0SG1rNHRiSjQzQ2N0d1A0Vk5JdU1QVHhIdHNO?=
 =?utf-8?B?N0IrV0FFaW1SV1VnR0sveEo3NzJnbEZsblcxSzhrVWU1VEx2UmpPU05jcHhz?=
 =?utf-8?B?bUN1NTFjbm5mYklNZVlUZ1VqVGV4cEtVL2tteUk3N2pEcHQ3WjhhckxZTGF1?=
 =?utf-8?B?aExqalp6TVRNMTk0Z1FUd2VHS3o4UmVidFdlNDU0QldoMUtIMjk5RHBvZDNE?=
 =?utf-8?B?cW1yS3ppU2JYZFdiUG0reDhwT1o5M2hOVThKU2xVaS83bzMyOXcxUWxaTzVt?=
 =?utf-8?B?WW9xS29JbjZWNkVhU0gxOXdNeEFnU1hyNHNZRlk3ZnRreDZ5TGx0L2owRGJj?=
 =?utf-8?B?ek0vRVJ0aFVGcU01Q1h0Z1dTdndSaDRxZ1FXNDMvRUQxMWJpc0dwTVJZOVpH?=
 =?utf-8?B?cTlHeGxPUmV3d1dHelVLcExYMGJSRmV3Nk9uN3M1Z0Z5Q2g5aWtyRTI0dWUz?=
 =?utf-8?B?YktjcTNEOVdZMEt1QlRDQUQ3NUkwNkpMV3NaaERjZmhCVTFwTmp5K0dzbGtG?=
 =?utf-8?B?amJkYU1WblBuN3RZb1BUdHdwQnVmS3BiKzl2MUJPcFQ3K3ZNd2J5alFmVFNC?=
 =?utf-8?B?WXhtdUlkbmNSamJSN0JaL0NkcktlOEI3VEtTSUg1dGxWTENoMDZsZ1drbWxm?=
 =?utf-8?B?cUg3a2V6V1NiQUthWFcrL2tBaFNGVzdka2Vic2hpNzA5bUk3dTQ0ZFNUNDZD?=
 =?utf-8?B?Q016aFh2NzIxUUtiV09vSXJSR0loYzJYOTFndlhwRGpTSDN0ZDdGclhvb2o4?=
 =?utf-8?B?K0M0WFRSUlp1Zk44QzMwRExDM0FlUFJVeDRwWndBYWxMMytheW96TkREQTR0?=
 =?utf-8?B?dmZxOFo3c3JsRmxRUFBXZlBpd1pNRkJaa3JqUExhS0Y2K0c4eU8wTjMvSmlq?=
 =?utf-8?B?VGswdW14V0tIWDZ6UloybWFYdmVSU3FQMlRmOTNRclRRNm1kKzBrUkVPTEs4?=
 =?utf-8?B?dU5Qc1RkNS9tR1lEazFzYnRHdHVoTVk0MklXRzdNYkV0Nk4xVCtZUHk1dnB5?=
 =?utf-8?B?dXBIbnBNRFBiV2NnZjZwRTFtbkl6bHVvSTltblNmYmJ1UWJCU2J1bWZTYngv?=
 =?utf-8?B?S1NKMC9lQjI5N29QUVRrY1JpNkRaajVHQTdnTklwVlgvcjdmeXhMbkExeUxD?=
 =?utf-8?B?Wk0rRzVBeDlra1BiNmlhRFNWaGR2U0hyM2hHUW5zMHZnZE13Rk5GVUNDQlVG?=
 =?utf-8?B?dUZtNE5uajJYcmNISmZ1QkEzK0lMZEl0Zy9TendnRmg3d0NsV29NUDlocml6?=
 =?utf-8?B?SFMxYmU5Mkl0cnU1UlI0U2NydlgveS8xZExQbmpNTStVSGpZbGRzUVBzYzha?=
 =?utf-8?B?eElhZm1RR0lBbHcxSnVZVGJxRkIyK1pDTWFTeGtzRCtQd2JpaHlId1NLODYy?=
 =?utf-8?B?NU12TFNuc2ozckducVBUMHQ1WUFxQkV3L0poVlA5Z1NXZ2xDVDVRMENvNUZn?=
 =?utf-8?B?MDIzbEg1Y29QbVFiZ3UrVWZlUTlZK3BnTnkxVWxhS3lmK1NweXpxc0FRWjJs?=
 =?utf-8?B?VHpFN2NWb0V2eExiZ2Q3OXl4UWpZWHA5OWQ4cWpXYlhHV0ZkMmh2eS9KeU1j?=
 =?utf-8?B?VkNxYjU4RnY3RU92V3JTcmlmcENVRS83OTBrRVBBaDhnZnJ5UjNxS3UxTDFt?=
 =?utf-8?B?d1lxSjFTQ0hnSTVZMjBSczRXZ1JNTERXNzc4dWpHM3hxQmdTUy9WS3cwMExl?=
 =?utf-8?B?bDRtUFRJNWx5ZHZqVThvaDFxMUdwUGFrL3dXSjl1UWQzQlJCVTVob0FpYkhy?=
 =?utf-8?B?WDlrT0RxTyt6VXBXVVRkT0IzaEc4TzhZYjVEWWxLSm95UkNEeWpwL0NpSks2?=
 =?utf-8?B?S2VyN1BMQVd5M2J6bUFlNXcvNkxHM2dldFRFblUwaTg4OEpZWVI4Snd3eklG?=
 =?utf-8?B?cXVaR0FYSE9MZVBYdEMyK3l0MjFhM2N5akpqMFF3Tk9naFJNdkNjbnl1dmRQ?=
 =?utf-8?B?R28vWGZnSUNFdk0yeEpsK0xnTlFhR0xZcS9QMXhOYWd3blRQV1hFUVRoUGtj?=
 =?utf-8?B?ZnVwS21tRnlUWHZaN2Y4YlZZaEVGNmRRVWIvcDRVS0JyRWVVWkJWWFA5YU13?=
 =?utf-8?B?VURvbEl4Nld4amtnaHNzMnE3aktCTHhmekM5VnF1WmczcC8rd1hDdlBaaDJC?=
 =?utf-8?Q?K3Ky+LxXe9ff8e2Ls/kKfGo=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Y0Ric1d1dHJhWnlQakJLWUVaUUJCTmNTQnRNZmg5NW1yZ0E1Zzh6SkliNUZW?=
 =?utf-8?B?VWszVWN3Q2NiK0ZVKzdqWGVXNVBHU296WmF1Yi9tTDB3a005dThvRi9FVkE5?=
 =?utf-8?B?Smc0S0xEeHpUdTUyV0NxTWRxRjNRMzRteDI3ZTkvdUNZcWhPUWNBYXlGMXIv?=
 =?utf-8?B?RS9sZHlQRmk3SUtKcWxGdWxOQ3V1SVlBZDVaR2pkTndHZjFUYmg5NDh5NnRH?=
 =?utf-8?B?c2tNalg2cFpNa044M0owdE94ZFhKNDArQzlFR1I3MjZjZWxnbUtnRWRoNVha?=
 =?utf-8?B?RVdmREVXSHV5TDFIam1hZlV6L1NLbnJCWHBZREhxTjF1SEdya3NVTWRDTWdr?=
 =?utf-8?B?cHBXaU81d201bzhnazNWN2FOWjR2eHFTcjNoTVVwZURoWU55Tk9kWFJrdWIv?=
 =?utf-8?B?WFFWY3BSRWxObm1kblNaOENQWTBVQ2JpVjRESGd5Z1VJZWFmUmVCaXl1aHB6?=
 =?utf-8?B?V1dXRk9JV1RkNHBKWTFiMjdXeWRiamd4c1E3TUo4QW1Vb2RvOStCZWxBcWEx?=
 =?utf-8?B?T3ptNXpmOWh4SHhZMWlnUGNnclo5TFF2NFE2cStMUUlETG4vTXFOTHB1MTlR?=
 =?utf-8?B?OWhXSkxrTUxLUm0rNTlsMHdSVzJSUEVFT3o4bFZWQ0RjaFJrSkdZNG12K3FK?=
 =?utf-8?B?WHppUlVmRmkxcTkyYSt4anE3TzNMWkRNblRlbXN4bkdvQmFybHZqWnBxRkht?=
 =?utf-8?B?aE1ucTV5L2NYWmwrYWJxdDRhL3VwZUVtazJnd1pKWitRR3FWNVNvaTRaUkh5?=
 =?utf-8?B?eENmeHFLb1ZFZXNwampUY25uWTBvV1BXeGpJUitzendjVGhDM291MDZUQnpS?=
 =?utf-8?B?TXUyQWtQVm5LbzJzZ1ZLUHdvNXdCc05YdlJyMDAzeFIxUFRFdFVtb1NWd29i?=
 =?utf-8?B?bytwVVFkZnpENTdYSkNtZWZ4V0t5VkFQVTB5ajUzSE9JUWx4ZlZjYlV2OEJ6?=
 =?utf-8?B?ZzZUOVE5QjBENlRoYXN1N2JFZkdSVVJNejdPN2hRdzdjTWZ1YWJLYTEzR3Vj?=
 =?utf-8?B?cXBrS0ZGUWtqdFppMFBGTllFbUt5RUtxOVJ2OWpWSXZ1MHE4Mkk2V1B1UUpR?=
 =?utf-8?B?N1l5Nk10ZDA3ZFBGU3Z5dXoweHZ5bjhqMitwYjhqelVad1lMN2dVTVZKTnJH?=
 =?utf-8?B?VkVPNEVyYTVZcHQ4a3NnMDhhYzNWZmtPSDAyY1RNcXZUUzVjcTJtNUhJWEJF?=
 =?utf-8?B?NUNNSWhtaEtUTDRZTGl4TUMvQWJJRDRFYm1tRzVyekg2cTR2TXAvYWxyT1BE?=
 =?utf-8?B?RkYwbUZDNCtGeHZ6aWRFNzNzSWR5NCtTTjFhQWVXRkZPRHh0R0dOOHFrVUs5?=
 =?utf-8?B?WlVkYm1sZ1ppY1FWZjF2L0JDcWZ6VEh6NUdPWXdUc1ZRQWdOK2RQWGs4RDg2?=
 =?utf-8?B?Z096ZVpNRWRwaUw2bkFNUkhHdTFHWmtHSHY3MEtWWlVVeFBPMWNRcm54bjg4?=
 =?utf-8?B?U1NDV1kwd3pwZ1ZiRHJrZjdvWEhRaXYzdHNybHlXbzI2cGt3QmtDRjV5RC9I?=
 =?utf-8?B?cGFMSjBrcCtCM1d2bDdtaW9PKzhWajRGUkpBN0dqMWQxZ1FGY0RVSTRDa2J3?=
 =?utf-8?B?T0FxTmNVcldpSlZ6RUxtQU1FWWVqR0pQU3JPOWJFVEx4NlF3Q1NsWjlZSTlF?=
 =?utf-8?B?Tkl2UjN4QmNvSVVjWGNBaDNpMVhpZWxueXJDNUtCa3VUS3NkbzMzRjZkOEJG?=
 =?utf-8?B?NnBBVnZZeHBQM1llc0JGSTgzQUtYb0Vsb0pLb2ZhM0U0VDBkR3VCZ2d1STla?=
 =?utf-8?B?NFBxVlV0VXZHTG5WY09uRVJuUndVSGs5VU8xMVBNVlBuREp3S1ZoMEovaEhx?=
 =?utf-8?B?WnNwVHNOUDQ2Ullray9aUGQ5YnVmU0VvZC9zRzBOMTk4eHFMYWJ2c2poY2RV?=
 =?utf-8?B?VlZraWtGaDYxdmdibmV2NzF2YmpYQUh3dy9ZblFKZjZrNm9kaG9lcXQraFEz?=
 =?utf-8?B?TXN4cW4xVWwxaWJMUlA0V2dQVHhnMVlHa2lQV3pYY2w5V3N6ajl5Z0ZqclFD?=
 =?utf-8?B?NmhnZFVrM3F5V2hMSUVydzliSVNEOHNSelk3T1ZMWGFwbTJIdllBMjFzdVMy?=
 =?utf-8?B?emc2UkJ5WHRBbnRXcFdObUFGT1lCa1A3a0U0QUFNNHNNaGhrajUzaDBLWjhL?=
 =?utf-8?B?ZHd1dGJzMW5LQlUwWXdleHFJNFpRNXp2Znk2M3VIQ2FqMGFsZkpRZmlJNDQz?=
 =?utf-8?B?RG1aRVR6d3NET25UbmFzWU1zVVhvY3phQ3VsYnF1dlFJbXNBUXhXREErUUxP?=
 =?utf-8?B?V0lBR2Q0ZXM0SC9JMFBEWTZWM0wxZUllODVxYTZHY0h4YXEzZXExMEdxa3dy?=
 =?utf-8?Q?i2B46pFze3AhOtVB+d?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f155a1-7ab1-4843-0404-08de6d903a97
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 19:18:56.0226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ZTLLA91CGggE/IZFmiNs6o+Sva2LWShe0vO7YVa80F1e/H8Vm8mkA/57DyjhnvfKaNsTY5T8szSXDsWu5VTtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7599
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52924-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+]
X-Rspamd-Queue-Id: 6AB16147408
X-Rspamd-Action: no action

The DW MIPI CSI-2 RX is used on different SoCs, not all of which provide a
reset controller. Switch to devm_reset_control_get_optional_exclusive()
to support such platforms.

Reset presence and numbering are validated by the DT binding.

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- add csi2rx tags in subject
- add Michael Riesch review-by tag
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 170346ae1a599e43bba9d19476ee4d65124303bd..0cc892f4a1b3c6ce575a5d4fca7acf7057f7b7f7 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -639,7 +639,7 @@ static int dw_mipi_csi2rx_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(csi2->phy),
 				     "failed to get MIPI CSI-2 PHY\n");
 
-	csi2->reset = devm_reset_control_get_exclusive(dev, NULL);
+	csi2->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(csi2->reset))
 		return dev_err_probe(dev, PTR_ERR(csi2->reset),
 				     "failed to get reset\n");

-- 
2.43.0


