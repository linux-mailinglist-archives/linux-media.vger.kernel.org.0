Return-Path: <linux-media+bounces-47535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7B8C77070
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 03:41:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 68D9A4E6FF4
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 02:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7616C280A52;
	Fri, 21 Nov 2025 02:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="X4Pjjuoi"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011020.outbound.protection.outlook.com [52.101.70.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDF720E702;
	Fri, 21 Nov 2025 02:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763692880; cv=fail; b=pBNO5MAV3C7t3mJLHIzO0NqBM9vNlDpykWmJlL7fghVMmA1SuBeNe/ZuMjzKEfK1C6HQLb/PaeP6CJ26sc9YfCzYRJS1SU7EIJf+KVlvOi8XMMd2mim5HC3V2NRPWc+VjxDe1CMpZ3IRLUJXQxY1Vq5Hu7eqJ2xe9JHIcTZFaB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763692880; c=relaxed/simple;
	bh=qc6C/0B2dKVlMMiskz6v4a2VoR76Jj7iVboVgoKGcZY=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=teWfjSGdneqPt4RCFDR2q5lU/LMOb2b1uaXtthvyv8Plo8EJbiBD8bHNaY0WG9SYLbg5hqWaw650jp38FKP2stjDN+VStKaK6PxbZ2gmwfrh2VdoZWtusBquqkxVxHmn8lJfqLPzJ8BvPL77OGnyGWU95bsX835emkr1VMtI3co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=X4Pjjuoi; arc=fail smtp.client-ip=52.101.70.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBTiIhioDpoGZkfl5PX7ZIv/FWuACH6hh1WsB9gM7DJyiqA3ZI1Avb9qe6OjMLQ4B7PvBPi1d46lKlFeqlmiWgfEI8hpT6SITYMNojx+ULUDxCP/XNFky718NI0DiNFL+1kg5mG5Fhe3lorAAg4XnSxVuic0pyVI/jarRzb3+QpXHiTsNliFhNXSfwGom9pEI/GK8cWKgjrNa//KqKfu7wTfCabJzr7eO2hAqpvc1Mb3buC3qz4UOJi6aFps7zxrJbIvQTP+MspgbOSNC2nZT9PJL9tTuEeqpgqsOMVyxbrIjy98DG866B8ZSTNI69unNQdwFfPNxVHcj2Cb3tTPlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aze/PK/AWY2m+XQk41nKBQBEF/tapEMHBL+15W2JJvM=;
 b=BZff/xdCcttYabEGrKGOJsouxhcWttGF1gVDGAZ2BwnFFevCNSpUFQYVMzp+8A9Jwy2WneTXNY8sB4aNp17qUDtl+IPc92ttMPCglBS3fM9y2pKe4ZuwNZCAXgIQyBipUV7xGDsE90X8Q3/wcg6DjjZuVpRDN9e6DriTTHfi67ihWzwjRtXrXK+O4B420iK5v/6vJNp5mrAKJrZzmE6N4feT5QvGml/dv869XJmcpSpQTHEmomSWWp/5HUGltQMb1w9ljmH4LcU55pUto3xZAuvaSka7CqVVpkTI88PwxnZF1oVuzN7H4yNXNwPq1dZ8qWqrDxK9cEZO7zNADmc9fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aze/PK/AWY2m+XQk41nKBQBEF/tapEMHBL+15W2JJvM=;
 b=X4Pjjuoiq+3B4yu3DBfo/Ti1D9Gb1kPTs438BSiGXRiikErz53vNr/FjNNW/Oobu4ST4U253grqOeHVF8MZGe32rRrUG2GyGHLzT1/pqSTbpnSKQcSdkYAzYWSfihnKAIHmG5ajZz7ezvUBf+eixKlfkcdJc6jUzBqRV1nqEJ9xVQBUI43j+EQPm5+ko7wZnevNWPWuxID6yUBXaOpxcUqg3274e57fYiwQvkvgtrJuPGqXGyf7L+xjF/CMsLsc8wunUm5fqk8G54eNr0G7wV+UdcEvgdAJS3Ud4MXnnisaLNqrbXJQp4uo5iX48QcgzId5bUwg9LfuGqVW5nkZlhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com (2603:10a6:102:225::22)
 by GV1PR04MB10306.eurprd04.prod.outlook.com (2603:10a6:150:1c9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 21 Nov
 2025 02:41:13 +0000
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::7bfd:652a:2f5b:e488]) by PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::7bfd:652a:2f5b:e488%4]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 02:41:13 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v9 0/5] Add MIPI CSI-2 support for i.MX8ULP
Date: Fri, 21 Nov 2025 10:41:51 +0800
Message-Id: <20251121-csi2_imx8ulp-v9-0-05b41b897e50@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG/RH2kC/13R226EIBCA4VfZeF2MDOde7Xs0TQMKK0kVA6ux3
 fjuxU1bD5cT8v0M4VEkG71NxevlUUQ7+eRDnwf1cinqVvc3i3yT5wIqYJXECtXJw4fvZjl+Dkg
 1hkjeNNw0rshkiNb5+Zl7e8+zi6FD9zZavY/AGgJS4gorQhnC6DaG3o/ldxvGa0ip7OehrEO3J
 luf7iF+PRecYA3/ZgCOu0yAKgRcU0qJooqz619l3WQie8pOlGRKmJRMG83B1EdK91SeKM1Ug1P
 CYGaMkkfKNqoqfKIsUy4Upw2mAjtypHxHsThRvr6VaMKYkmCdO1LxT3EF5ERFpszWJn9CbYUyR
 yo3ivGZyvVWaywR0ol8vtFlWX4AE+MEOEsCAAA=
X-Change-ID: 20250819-csi2_imx8ulp-9db386dd6bdf
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
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763692932; l=3578;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=qc6C/0B2dKVlMMiskz6v4a2VoR76Jj7iVboVgoKGcZY=;
 b=O4VEzaFUR+/ynkpQ3d7gr2GSnc6I5nZpEk5Rg4ROz6oakAKzCWYD6eE4Mi2Ph0gw8SzQn5hlk
 gWhw17MkwElA3keRP96FyttJoknnBmqDLSlJoxPyhDy0ZU2nPAXowOg
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::7) To PAXPR04MB9089.eurprd04.prod.outlook.com
 (2603:10a6:102:225::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9089:EE_|GV1PR04MB10306:EE_
X-MS-Office365-Filtering-Correlation-Id: 65c26603-acb7-443c-93a1-08de28a76fbd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Ri9Mc091NW9Ma1JLNzREemliamlJbmxpdkdsYzErZjVSVGtoRUs2UzBtMGtx?=
 =?utf-8?B?bE1ZWGxhN0o1UFNyOVBhOWhtNXAzd205T0YvaTZEbzVGUVNPOHduS3RwWVRR?=
 =?utf-8?B?bTNKVmd3UEV0a08yTlk2bGdnMHh3Ym1QZ0ZicU9TM2JiT3lhdVE0L2FCN1pm?=
 =?utf-8?B?TnpBV0ZldG5pS2hyWGc3VEl5MFNWZ2dtaG1vaGFOSzBiWnBMOUhNOU5vaHpD?=
 =?utf-8?B?K1dvQVdvYXBtaTQvWjVWY2ZCRXlZSTJJYWxCODBMUzIrakRqRzFTNkM4c0NN?=
 =?utf-8?B?cG9NeEIzTVRNbnE5VjhrUlRkczI5MjVUbzVRRkgxdmJMSTdkTDFCMDNHRUwz?=
 =?utf-8?B?YjRUanJKNTVGSFREaXVpY3RNVzNTSzQ2UHNGRXBoalg4RDRncHhyQVg2TUZw?=
 =?utf-8?B?OG1CY0ZDRzZuOXFoajlqa2Rac3BXSisra1lpOVdQdWVEMk52c3BwQW81T2Vu?=
 =?utf-8?B?aXErVCtKTExmeno0c2lEdTNoWDdxNHNwY0duRVFOUDdKVzk1TWVYQUJDc3BD?=
 =?utf-8?B?U0Nldm1tMVJSdjk5VUVWQ0NnK1V6cENJZit3Q2djUlF2cEJxQ3FJSWVwandw?=
 =?utf-8?B?Lzc2VUxlT0hWQm5IS2ZhamxBYUNxT2lnVUYzZmI4cm02cDV0TXM3SFpFczJK?=
 =?utf-8?B?NTFnY1hkNkQxQjVPeWFPNHVlUGFDcDFSK1FzTmhwTDZjV2pDaWRPTjFHVVp1?=
 =?utf-8?B?TlB3bmZWOGlnMDdXUG9ub3ZHc3hrN2dnUFhjZEZDeTJRMDRZWkZ0SisyajAw?=
 =?utf-8?B?OS81dWt6MmVGME1IS1Z1SElsZ2pIdUpEWmhocm1iMWVTdDgwMmkwTjBlTThT?=
 =?utf-8?B?Snl5TWNaOU5lbmNxTHIyYnVoaHpzMTRvcml6K1lveE1xdW5ORHorU1JRK1Y0?=
 =?utf-8?B?MGowalN5TjNOeVNxU3cyM2t6cVhCWE5uekE4RnR4YkFxMUdGTktpbWNMeFVP?=
 =?utf-8?B?aWRLQ1RlUFBMQ2pVMVQxcmNUSDU4cVBaTUViWkxqQzY0TUFUbng2OHFoeGVK?=
 =?utf-8?B?MnNCcnh1dGdMZkRYNkptMFlDMkFhbGMzUFpPaEkvUzZsdHd1V005OW1BNHNv?=
 =?utf-8?B?ZDJyb2xRMVZxNkUvb2ZEUXhLVHdqbUg4SExKTXB0VmY1YWRkSXdJblkrZm1t?=
 =?utf-8?B?NTVONENnbndSdWh6VC8xd0JncXBCNWQwM1Y1b3d2L0poclRpZzZseU1jMFlo?=
 =?utf-8?B?bW9CTjZMK2p2b01ES3o2WTk5cE12RXRMVk5NSkdhdEZxSHVPM0FKcHFzckc5?=
 =?utf-8?B?eDlodHIva1JjS1BGNityMGF0bWJ5VVBwdDNPWE83U3dxOHAvZVRWdUF2K090?=
 =?utf-8?B?V3J4NVhkaElId3NaS3BtMjM1ZXBPRWNJc0RxL2tseFBkOThlYTZLajM3OHNu?=
 =?utf-8?B?SHJzbWthMnBrMGtkUjllTWhkYXF1VTRBTktUNzdQVHVYM21abUxrNm5xVElx?=
 =?utf-8?B?RW5XdzUrSDFxeHNRbEZtWHpFbVl6KzgyTjBML2VDd05hUi9iMWtIRFhBYyti?=
 =?utf-8?B?dHk0VU4vV0lCT1VRbTJPNVFrQzgzQUFTY0Q2TkZ0TkNYWTBsZTAvR09JanVz?=
 =?utf-8?B?b3dsWnY0YXM3YzZUZ00wMjdOZE96dTRCSjdlT1N3bUFvRk5KYlpPK1ZDUlZo?=
 =?utf-8?B?czVoWENkOVI3TEFEQWYyKzdKUFMwYTRJeG5ReXFVSkc3NndTS1QxTEhFU2ly?=
 =?utf-8?B?NnFGSHlyZUdnNkVXMDBvdEpObnlUUGc2eDZtUlJGTHZLa2QySHVHVjIrZTBC?=
 =?utf-8?B?aVA2QjZRbXhOazVUM0RrTFNQSDBwQ1V4UWY3N25PcnVlV0JVVEdNWHJ1ODVD?=
 =?utf-8?B?cjQrTC82S3BwOHdMbkw1SWdXa3lYQTZIS2hFYlRZaXBWRlZlUWh2NHFWbjRM?=
 =?utf-8?B?aVd5QXZCdFovRmd4M1J4WlJ3WmxWQUROaTR4dlRlWUtLd3V0YlZOMVZ1eXk0?=
 =?utf-8?B?TVRrVTkwaWZSTkJxQ0I3ckk5U1JJMTRUamd2TGVid0FqZU16aUhxWDZSSEVU?=
 =?utf-8?B?TDAwc2FTRVowbEJPcFpYalU3cDdQU2lLa3VlKzhKRkUrdzFvandIczgwTy9w?=
 =?utf-8?B?UjdxWUtybHJzOHpweU5SZ2xZOG1ITU1iQytQZz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9089.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?d28xdHpEdHBGL1RMSVlOVk8zRU80Szh5V3pHZXVrdmxTUHhLN1Y4NWd2dUxN?=
 =?utf-8?B?a25PelZhT3FhOUFTY0FHZ2hXaTFPTHVrd0JaOFlQSXBjRFRWS1FOOVNFaXNM?=
 =?utf-8?B?aW9mNDFXSGcwMUlIYlBzajVTK3hZd1lBMnl4aVdYalpHR0JEdll6R2N3ZERo?=
 =?utf-8?B?WGdkYTN5TnlxeHRpaFkwNHZJVHJSV2tWbnFoaWhpcXlZNGQrUWFtSVJIVU5a?=
 =?utf-8?B?aU9FdTh1dGtwSk1UOG42ckE4TzVRb3RSRjhkNEdxK09ybFJuSk16b05nMUVr?=
 =?utf-8?B?c2dZUVl6RU5oNGFWK09nbDFudTZCaWNwOG5MS1c5Q1lHMW9sMUs0U3VwdGRq?=
 =?utf-8?B?dXZmWnU5TUFBTWU3b1Fnbm85dHJLMWozVUtXL05hRXowdVRwR01oNGNsUzh6?=
 =?utf-8?B?VU51Q05EcG4rNWdFTDFwZWdGY3N2RVViNTNWWlN5Q3hDV0VSaEhUS3BhUkdK?=
 =?utf-8?B?RzB3NFFpeGFvT1dXZWNtVSsxeUY5em1jZ2dQeWVsUTlDajJtcUJ3MHJtMXhN?=
 =?utf-8?B?cDY2RmhROXB3VWwrVTBTcnNQR2VubkNLa3NSNTlaempnaFl1NG5ld2tDTGZE?=
 =?utf-8?B?OFdvdEMyNy9QcFl1RVg1UXNWVk1Eelg4RklBbDVOanNkWE9WM2RGZkkzd2FS?=
 =?utf-8?B?aXJIN3NNMC8yS1gvU1dFUVdiN2JvWko4OS9ibE5YZWRLWGtxRzZycHhUVkRF?=
 =?utf-8?B?cE5BaVhTTzJjcmkzRi95RlhJL3dSNUtWdUJWS0FLQlc1cmp6UUVSaHdtYkRV?=
 =?utf-8?B?amJmM3hpU1JjMk1EdzQvL2tuWlh5aHRCaTdtV3cvaGxQNHZvdERxcURkNytn?=
 =?utf-8?B?VEo1UFd2Q0ttUEVid1U0ME1vVFkxMW4waVhpTHJWcHBCb0syRG5vS3U5UHBx?=
 =?utf-8?B?TVFrZ3VFMTF2MWdPOWNycTBCMjdQZ3MxSUZZbysxQXRhZ2FxVjFySlpMalAz?=
 =?utf-8?B?T2xQZERUWmZiVjRGbE9QdlFxUmhHUGQzaFNpZ1dJVzNsSHFXWTZxZmNSR3Vv?=
 =?utf-8?B?Um1BbHFuR0txQnNqU2tVZ25DYmZJRmxMR2xPSXhLSUJKY3FjNERnTDA0OVN5?=
 =?utf-8?B?Y1JPODhIZkJibkt1SU9HazcxSVFER05nNWs4am85WGthTUlNV1ZIS3MvdFJ6?=
 =?utf-8?B?WnJMVi95T1F0YjFJNDBrdTZKdVZmZXR4L1BySG5RRXJKdEdVbFNkUlpFRndo?=
 =?utf-8?B?RDVYazJlRFFHVmtiTFRsc1IxUUZuejgzejh2aExBVmRncVkvaTlvemJ0V0Qw?=
 =?utf-8?B?V21FYXlnUE16NFpqeUdnT0U1T2paTGlxVFRwUTRyeUVOa05EMnBTQXkxRkdE?=
 =?utf-8?B?MmZjY1ByUVBLMEJaYlloVHhsSU40Q3o1cGUzSUVjcXFkR3dLemZTaTFEbEZz?=
 =?utf-8?B?ODlLUTZxaXF5RG1JRkRhd2d2SHU0SEQzSEVPTnZTWUxGcEkvMllRa1IrVXRN?=
 =?utf-8?B?TEpMUit3WGF1c1dQRHIwNHdlY250eGNEelQ1b05TZHBrUFdjMkF1MmYrd0dS?=
 =?utf-8?B?Q2FqVzRPNkpwOWgwWCtIZmR4VGVWMXJaOWZrcTZDdmZOWi92TTIzQVBpcFpP?=
 =?utf-8?B?TTNvU0FQT3NyVlRTUmk3dTRMVzFLaXFNaU93QzZDS1hzSmdvUTVTQ3BZMVlr?=
 =?utf-8?B?QncxVmxOVmpRTFdxZDZmY0Y4ek9JU1VWSGRhMm1BbnVXOTJJOXdib0xoenBG?=
 =?utf-8?B?dC9zcmk4VTNSck1zMlhaS0JaUFJXNWdpbVlsYitrZkM2WjQvdkNFRXoyUDll?=
 =?utf-8?B?ZldvblU3WEhiLzlsd2tQeWhHVjdsZkxjU0UwbDJjQkNra1hoQ2FxOExvRE1N?=
 =?utf-8?B?aG02RzZYUERtZjB2TkFqMGpjMEhGTkRGZGR3RTQwSEUzQktkUkNGYnVRTVNa?=
 =?utf-8?B?WklLRUpvSnVKNmdDQkNZRmNHNUh2ckJhQWtoQlZwZTFrL1Vpai9RYXJmb2Rw?=
 =?utf-8?B?bXRpdnJmSFRzZ1pGblNIMkFtMTBnSHVJendoUUhrRjljbGlHLy9pOGtmTjZR?=
 =?utf-8?B?ZVN0OW85bERVUWpuMzkyUGRkY1NFdlY4bFlKc3FOY3B3YTJMTDNJME1uc3pv?=
 =?utf-8?B?eklEQ1pldlVHNFk0dTkzNjBQZ2lqQ1MwWlZDb2Y4T0VCY0VFejFJTlQzcUZQ?=
 =?utf-8?Q?vUWcrgssN5NX5B4wjUyihyUZf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c26603-acb7-443c-93a1-08de28a76fbd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9089.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 02:41:13.4341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j+lcKqM3mekgCIKD5oZ2f5oThJ5qOe7y8um+mPXwMxhwkfQGT4XmuOAolL4scbNTrHSg4LZxnpqAhKy3Dy1NnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10306

The serial adds MIPI CSI-2 support for i.MX8ULP.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v9:
- Make state->num_clks signed int.
- Link to v8: https://lore.kernel.org/r/20251113-csi2_imx8ulp-v8-0-2ebe378f7111@nxp.com

Changes in v8:
- Rebased on latest media/next.
- Sort the conditional blocks by alphabetical order of the compatible strings
- Get esc_clk when probe and cache it in csi_state structure to avoid looking
  it up multiple times at runtime.
- Make state->num_clks unsigned.
- Return error when failed to get esc_clk.
- Link to v7: https://lore.kernel.org/r/20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@nxp.com

Changes in v7:
- No functional changes, only move patch 2 after patch 4 to avoid dependency issues.
- Rebased on latest media/next
- Link to v6: https://lore.kernel.org/r/20250917-csi2_imx8ulp-v6-0-23a355982eff@nxp.com

Changes in v6:
- s/existed/existing/ in patch 1 commit log.
- Delete the compatible between 8ulp and 8qxp since 8ulp need one more clock.
- Update compatible string in dts for csi node.
- Add one new patch to handle 8ulp in driver.
    media: imx8mq-mipi-csi2: Add support for i.MX8ULP
- Link to v5: https://lore.kernel.org/r/20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com

Changes in v5:
- Delete else: block and move clock constrains to each case.
- List exact cases, but put imx8qxp/qm in one if:then: block to avoid
  repetitive code since they are same.
- Link to v4: https://lore.kernel.org/all/20250828-csi2_imx8ulp-v4-0-a2f97b15bb98@nxp.com

Changes in v4:
- Change csr clock name to pclk which is more readability.
- Add restriction to i.MX8ULP and the other variants remain the same as previous versions.
- Update commit log in patch 1 to describe why add new compatible string for i.MX8ULP.
- Link to v3: https://lore.kernel.org/all/20250825-csi2_imx8ulp-v3-0-35885aba62bc@nxp.com

Changes in v3:
- Correct the order of "fsl,imx8qm-mipi-csi2","fsl,imx8qm-mipi-csi2".
- Correct the order of minItems and maxItems.
- Restict all variants.
- Change pclk clock name to csr to match IP port name.
- Align description about csr clock with IP datasheet.
- Add reasons for adding a fourth clock(csr) in patch 1 commit log.
- Link to v2: https://lore.kernel.org/all/20250822-csi2_imx8ulp-v2-0-26a444394965@nxp.com

Changes in v2:
- Add more description about pclk clock.
- Change minItems/maxItems to 2 for resets property.
- Better to handle "fsl,imx8ulp-mipi-csi2" variant.
- Move comment to the top of reset_control_deassert().
- Move dts patch as the last one.
- Add "fsl,imx8qxp-mipi-csi2" to compatible string list of csi node.
- Remove patch 5 in v1.
- Link to v1: https://lore.kernel.org/all/20250812081923.1019345-1-guoniu.zhou@oss.nxp.com

---
Guoniu Zhou (5):
      media: dt-bindings: nxp,imx8mq-mipi-csi2: Add i.MX8ULP compatible string
      media: imx8mq-mipi-csi2: Use devm_clk_bulk_get_all() to fetch clocks
      media: imx8mq-mipi-csi2: Explicitly release reset
      media: imx8mq-mipi-csi2: Add support for i.MX8ULP
      arm64: dts: imx8ulp: Add CSI and ISI Nodes

 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 49 ++++++++++++++--
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         | 67 ++++++++++++++++++++++
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      | 66 ++++++++-------------
 3 files changed, 133 insertions(+), 49 deletions(-)
---
base-commit: b4fbb13db86adb0bae1d7f968b61ea8dc9635e33
change-id: 20250819-csi2_imx8ulp-9db386dd6bdf

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


