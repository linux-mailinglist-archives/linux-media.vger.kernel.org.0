Return-Path: <linux-media+bounces-40998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A23B33C42
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 12:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B212F173048
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 10:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30142DECD8;
	Mon, 25 Aug 2025 10:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JUqbAWR9"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010053.outbound.protection.outlook.com [52.101.84.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6B72DAFBA;
	Mon, 25 Aug 2025 10:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756116654; cv=fail; b=iYNCV2yKKOQ27CpE0HLPykIFmkmPcycAmFoAiemjChZvCTT7BkxgiAfeIDaNsQpdNcYIOZ3HxKzH8z9Be5RR6bEj0I0erlb3T7nfkC0/Rf4K9EA7koUNCZcjx19MCPEsKl2hVE+u6m+Cbq3tYGuoAfpgIQJdKd1wkg/vlKqrMU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756116654; c=relaxed/simple;
	bh=KJ/sPmzIr+v7+lVJwiQ/KsAVMVTwzTynycZSiPF3+qo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GVcXI42o5ESs8Tv2+mGBXHCpSZ/Zo+uEJQ8WfVy05wqrCx9lqXgFod7WpfCW63nn5pNX0Nw3jzrKGgfU3uZ+k2VUSAHrLl8rwIDFo9pkQ9YgkIj7YZKcc5X+6yP+LjqlykXPzjNbRz6eTdG7evlUUEP4Swnn5vtqYrmSTgNzxPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JUqbAWR9; arc=fail smtp.client-ip=52.101.84.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=avUxNNRv0iZ0e1p2n0T0v5uhmW/1a94C18k6lN2/q/6Tq1bXylK9vGvKUgJ+9wAoHQu/v+lY477VW0riihQkJAm6zWJCOavSPlsddWbvFOmXxcfLgMyKCcmK1L7hXcOOdPV3l0UoVQenOlvXDBLjOdgnBAr3JtOqBEiDr0vlba+C6DxPbjBCq35mgFh22nIMiF696P66i8r0lKKwF765wTWqGgtNTWjaosXYB/nrcL1STrHi/0FGcKbhtHXYtcMP8h0cle7RnVy+onXKFPaIjC6iE7Kej9Xwo4rIIo8QSmoRlLmANWsDHaP+JxRr1WBGCwKPoGn+deLa+H7ws5/xjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lb+l/R8zOwRvkT9LYdrq24LjORR7d8woY/BTReeQKQI=;
 b=SQjzwc3Z0MvUHpuGjDgsIX3aKfftgwb0FA5w3Cs5/Z8SkIwdHYiMMN+Bl18p5HPCPCkJHJ9vtJ4P0k1zSk22EJeKuVtBe9StfPz0AGN3q019zdL4ZzuKWkfx1MEcZhqVpaw3O57b33/Xf9lPFVWh32zZAD4WbjU1AE6UeSnFfjL9l5qatsXd5pJjXAPIX5qIFIWRshptYu5JOky+zlANF+MKNByyuWGQsRwS9KfJHLJ9hi1mfwdfufIc6Bqiqq5NPkr4izGufeb8RnfmSE4f3MyHzRty9lL7yzJy27omA7w5cS9w44PuKcBt5PHih2yxRu08DD4CRKW12TVhM0Njsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lb+l/R8zOwRvkT9LYdrq24LjORR7d8woY/BTReeQKQI=;
 b=JUqbAWR9EwfsOD950wCItBezsof/3yXSuYKmRQ3aI1BvpfiQxM4eVxLSfqxS+3BIzK6IC98isA7giqthQ3X7AYiA+wEZ1pPvWq++4lfCM7J9HJBGxdK9LgtEm0IvBMeJb2f4cOLWqECDauPhyXZt/QFU1qj4PV54tDodSnc1L8JK6cl3y1lCsJiQJFyRfk9VgmxJ8YPjj1fyRxB3+6d3xrxaVCMVuDPNGbxqUd6KNQ0XAcyJb09UwHTGD2OThCt3azldb+YAQGZO0JPE3bGwa+mkois71LmThmgn7SILA/z2u/fWzUh986F8leT//8kUJ4bXRhqzTAApROU6jPUkqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI0PR04MB10639.eurprd04.prod.outlook.com (2603:10a6:800:261::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.11; Mon, 25 Aug
 2025 10:10:49 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9073.009; Mon, 25 Aug 2025
 10:10:49 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Mon, 25 Aug 2025 18:10:12 +0800
Subject: [PATCH v3 3/4] media: imx8mq-mipi-csi2: Explicitly release reset
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-csi2_imx8ulp-v3-3-35885aba62bc@nxp.com>
References: <20250825-csi2_imx8ulp-v3-0-35885aba62bc@nxp.com>
In-Reply-To: <20250825-csi2_imx8ulp-v3-0-35885aba62bc@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756116629; l=1321;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=KJ/sPmzIr+v7+lVJwiQ/KsAVMVTwzTynycZSiPF3+qo=;
 b=UKNIZXfU8PEM0Nt+9i+wOTxq5/Bm8O2csDCda2eBz3D5CxL3fN6HOgB2WeIfcqpdOQicM6RZA
 0CgmETuuvohCDMAglVT4xORHSc1n+6UkQWPMnbvYbFeWm05+/S8Ow9f
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR02CA0105.apcprd02.prod.outlook.com
 (2603:1096:4:92::21) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI0PR04MB10639:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fc856f6-6b8c-4fa4-ab0f-08dde3bfaa23
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?ZzkreGR1RkM5K1p2TTBrcHV0TWdQYXp2UjFxV3d4YkhIMnp3MG81MkZGYjhJ?=
 =?utf-8?B?bXNJZUtLVGpmTnl6S050bGk3ajhBajNWNFpGL0JGYVRTWUhCOTBHZkFSWGRv?=
 =?utf-8?B?K1ZsYUFnNUM4ZTNNWHVTcHJtSjVyZG16MDdKME01dklnZjN4MmoxcVFZa3FW?=
 =?utf-8?B?MWxmM2YybGVJSjR2VkUzT2FNc01aTW1UdllrWjJJRlBiZHNHZk5YTWJPUnRa?=
 =?utf-8?B?WGp3c3lnL0hxTnA5WDdrNUtMYkpRR0F1eFBmaGxsQVhjSXBYV0hkV1N6UTZl?=
 =?utf-8?B?SDMrOXR5c2o2OFNrdnRrcjZOQWVqVVB0UjVtem5rVlQrd3dwRkplNFRub3BC?=
 =?utf-8?B?aTQrZm9BMUtwY0dPMTZmMHlEUEE1V2h6Sml2bloySzhVSGh1dnpxSzh3UE1p?=
 =?utf-8?B?S2N2azlTanNWTUg2Y0V2ejJrNWh2bFBxZGpyV2pzdHNHUFVDdWtPQUpNbUsx?=
 =?utf-8?B?cGpFa0lvZk0vQmR2bHAyNTRRMnF6ZXNWVHJ0bFB1bUFvVjVrWFdVendnRDg3?=
 =?utf-8?B?REx3QTBjODB0RDhucDZmNnZ0aTkzZkh4Ymc1ak5ta2ZTWktFQ1A1c3Z6YVVU?=
 =?utf-8?B?ZnBuS3BhWitkblN0Z1pmR2d0RHNiZlAxdnNRV3NFU3V6aWZEQU5mUThEL0dk?=
 =?utf-8?B?dVYvRHJvUHF4VnVTbkkwOFpIY1ZpZzRtZmpKVzRKeDVzYXB4Z3F6TVVrWWgx?=
 =?utf-8?B?VlFTd1FUaEp5bWQ0Nm40Zi9GKzlpREhwamttMUpJV0gweFcva1JVa3ZsWkx0?=
 =?utf-8?B?TzZDSG9VQ1RaS0JEU3gwQWUwK29GeHFEb0IxeU1jTjBsNDlJY2ZYcGJZbHlM?=
 =?utf-8?B?Sm96bE1iMGdwc0ZsbDZRbXppbC9Hem1XYTJTcnRKZ1ZzbnBhb2FSdDhDRld5?=
 =?utf-8?B?REdzSVdjU2FxV3hERk5CZWZmQXdEL1ZXUGZpYXZtbjQwaCtpSTdkWDVMYzVx?=
 =?utf-8?B?ZGFTS2JFdGNmRGpKMSt1NStsU2tVUHV4WDZYYnhIQlZVdjdlZXZHaVBMTmth?=
 =?utf-8?B?cmovNHVCZXJNaDROaGVRVlJQcnJYVnZXbXQzSWcwUkQ1WEM1MWt5enJVR3pD?=
 =?utf-8?B?aGRVemVMaHUzMGVlTkFwMC9HR1B0RVU0c1dqZTR1UnhqbGh3SzZ2MTZ2NXM2?=
 =?utf-8?B?WkxYZjF5Ny9uUEdWS0dUQ0lmZ1RRSGVyT0VqZ0tHb0ZjL2liUTd3dzIzVTBn?=
 =?utf-8?B?V3ZXUlVEdWFTY1hnc2s3U1NJajZabkt2L1I5cDdUMUk2ejZXSU54MXpUQlJS?=
 =?utf-8?B?L3RjVEY5S0o5RG9LV0x1QTd0R2NjbmlyOHJxWDdzQXJKdWtGeldOei9sR2oz?=
 =?utf-8?B?ZllEb000ZDBIb1FEQVkrWGVwbFUzc3Q5aERyT25kNlkwcjJOOEltUlFlNVVE?=
 =?utf-8?B?cDN3RjRhMU9wQlhOVldIcUFXZ0lsU3JJMUtJdXoxUFhYNFhNT0hxTlR5QUd4?=
 =?utf-8?B?ZjduQnhCbFFyY29HUVNzMnM0MUxSc2RJYWcvcUNnRWJCOENFeXlQSU42ZGN3?=
 =?utf-8?B?VnBHcWxKNytOYzBqUW9ZSmdsR0JqeDd0MkpRcnR6UHRxMGhlbmdLR2t5VGpx?=
 =?utf-8?B?SUNkU0xpVjhCNFQ3NTVTWkJoaUVDK1dqLy9qNmxlK0VIdG5YWlV5ckRMSzVB?=
 =?utf-8?B?UnBDQVFtb1lqNmo5Q2NGeUk1czFwcThOSndyWWhSSnJnQlVVRXZYMUFEdzNv?=
 =?utf-8?B?SWdQWEFBakprb2hUWCtsbkM5R2I4aHVSVk9BMjl4ZEFMYjgremthSVZVRnRr?=
 =?utf-8?B?NWNmTE81VlkxUVdTVjlVV1JDSGcrdXJvZkdtekNKUnp1SHdGaVdka3QvaHc2?=
 =?utf-8?B?S00zTXBieWVZcFN3Y3JyRDJwTUN6R1B5QlBIWFhGTEhwaW9USGZxcnZPcGc1?=
 =?utf-8?B?a3QyL3RneGhobWo2aUdQNnpFaHBMNDk1OEltZzZQYktWcDJweUwrSU85cUp2?=
 =?utf-8?B?NVpBSjJ0dlliZStyWVhKUkZYazRJZXVpY0NjdjZLUjJ2WXliT3V4OVR0eTFw?=
 =?utf-8?Q?6OFYQA0MDrcL/mZOwTCU5ABKeMr2Tw=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?OTBXbUpPTnJ2dThjVDYrNzdUMWsycElUTUhFTVFBYmc4dXdKQTgxYWZzM2tH?=
 =?utf-8?B?RW5NS2RYZjBhckRQVGh0dGc1bDl1UHpvYkdaWFh4M2REUlJsa2twd25FYndu?=
 =?utf-8?B?cko4RlZTb3VPaWtML24xVkMyMW5sd1pad25Hak5mcXl5bW92YUVhejE1OTNz?=
 =?utf-8?B?bGRQVis2SFZQejRHTURMRmI3YjRiNVUyeDhwYmJtSFZjQmdsTUFIdTBhblNZ?=
 =?utf-8?B?aXpUUEcyUFNJTXN0T0hvRlNSeHZNVWl1MmhWS1I1WVFjUjdzS3RtS2g5WXAz?=
 =?utf-8?B?T1VVSTk3cUJjTWR6cHM0UlBreTdhKzBDcW1VM0xEeE1UeDhILzI2MVdIdW01?=
 =?utf-8?B?Y1p1aXhyK2FSMHRsRTN0Q3ZGZ1B0a28vb2V5cm5sOXRJWk90MWpYb0Nzb05L?=
 =?utf-8?B?RFJ1Sm8rT0xKdDdYeEVwWklaWDBGc0s4b1FQc1VVWjZJM2l6NmFBUlV5QWkr?=
 =?utf-8?B?Rkl2aDJ5bWMzWXREMDlyZGR2U3h1QWY3bkNoWmppU0U4U1BqQUFJRGRLZ2xs?=
 =?utf-8?B?U2h2NUdyUzRpdnRsQ1hWaE9EQ3hXOVpMaVQ4REpzdkc1NHBja2d1S0laNDBP?=
 =?utf-8?B?d3VFZWZnc2loYXJaTmRVK3NHOGlyMjZjNE1LYS9mb1BmdFB5cjdsdnhtVHFx?=
 =?utf-8?B?MTczV3hsNm1WWXZtMXE1V3I0TTV3RStYSjlsWk54elVvMnF6ejd5NWRPYUhL?=
 =?utf-8?B?VHcrSVlpUUlMY1U2cjNFeEZsaXV6ZkR0bldOa0RCYmtyTEZTOEpuUnNDdG5w?=
 =?utf-8?B?NUlMMzN2R2N2L3BKUkptcmpQWXRPRFZKTzBLTnQraVFhM1RJYVRJRHJLUGFt?=
 =?utf-8?B?SmZGSFhTZmF4S1RKMUEvSVZjY3g5ZGd1dlh1U0xaczVCRDU3M0lqRU92UG54?=
 =?utf-8?B?V240VG5oL3JtMVBsRDdsNjVxbmpGZERmU3hZeDZ3VEF2U01xUVNCMDEzZ3hJ?=
 =?utf-8?B?U3BZRGN2a3hFY1ZrdEIxc3JoY2h4YkxoaHVxYm1qQVd6c3k4N0I1Vll1VERq?=
 =?utf-8?B?TWpYVk83THc5Nkh2RmVpVE04V2tPeXhxSnRjaFE3UUY4TnltVVhnOW44clRM?=
 =?utf-8?B?WTJOU01WNzU4dHMrMjR3K2JpVDJxYXphRktsUVk5UVNDZ2tpYkswemFNeSs2?=
 =?utf-8?B?NHV3N0ROUkpvdHlDZjlGemZ5dW9lT3NEREdJektRUnpmT1V2STJEcjZoWFgy?=
 =?utf-8?B?Y0xqSXVVQ1ZieHpCRlpoWkJrSkl1SkszOVkzNENtRUQ5QXFGUTlvUVNaSWN1?=
 =?utf-8?B?U2FadmlJTG9QZXNuT1RaVWNUU0JEZWZsQ0t1bnpNcVpkRGZhL1lyRUp6RXFl?=
 =?utf-8?B?OEhHdzY5dC9WUFJ5Yng1VnhaT3lnR2FERFpGTnNXUjVNaElYdVZrREdWZ1J1?=
 =?utf-8?B?cmlqazNxVG5ycWxzRHA5M01PS0tvZWxUT1B5QSszbGJyZjFzL1E5VDYxK3NU?=
 =?utf-8?B?VDRLemVHOFQ1THdsN3daaitoeFh5WGJ0NEE0YWJDanNZTW5OZFQvTk5iZldy?=
 =?utf-8?B?Ty9rNjZVN00wS29ROUFIVSt1OHR4L0FhVThmT2kwejU3bm5tWDJjUmozT21K?=
 =?utf-8?B?WTQ4ZmMrMWtTN1Zwd1h2WG9QU25VVHE4cWhST3JNMGlkSUJYSzhNQVZ4YmJP?=
 =?utf-8?B?UXo1MnhGQ3BVTU9HZnBQWmpPSVcyY0dnTS9KODdLbm5XdHNSamhPOS96UXVp?=
 =?utf-8?B?QWJqUWZXN2VCRkJjdGJ5c2hVWXBxQmFuWFlGWHg5Nys5MjFrK2loSC9RZ211?=
 =?utf-8?B?OFhYeGRlV3AvdFhKeUx4QzNNZnB1aDE0UkR3MEZzRFhqMFBTR3NtQ0JRb2Fi?=
 =?utf-8?B?bXlLejhSbm9GVldWZGRvUDVSN2pSbi9FaXZjanVKZjk5Zll1bzFVRk5nclBn?=
 =?utf-8?B?ZGhBeWtOS2YxakZNS1Z0VzcyKy9LK1MwMDIycHcyOFh4dE1QbzJBZHdaU1NZ?=
 =?utf-8?B?NVZXLzRsTXRqV3MzS3FvODRQalZlVEw0eU01OFdicThwbXpsQm1sTjZyWE1y?=
 =?utf-8?B?MUlFWXJjVVJTdlNBMkx3T25wQlJHVElqYzN2NU9jdXB6cEdDNTgvcFZaQkpq?=
 =?utf-8?B?bVRjYkRUYlJtNjI2Ly9xbnRLVVA1VXpBNWZVcVRsUTRGSk1kVVZWZWpLN2Qy?=
 =?utf-8?Q?fIkViH1O4Gjgkd3q/Y8gksVTr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fc856f6-6b8c-4fa4-ab0f-08dde3bfaa23
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 10:10:49.1639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLm7c4VoWcHC4ByxNKJvBxCyUDln1X6U1GupcbASr96k3B4K2aQHevBR/BhW1uZYb7mSlpcnk9k5rFhn/4CS+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10639

Call reset_control_deassert() to explicitly release reset to make sure
reset bits are cleared since platform like i.MX8ULP can't clear reset
bits automatically.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 2bf11984690af2e687a3217e465697333d9d995d..6b83aa85af42e1dac25cf29056863680c1f89402 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -337,18 +337,14 @@ static int imx8mq_mipi_csi_sw_reset(struct csi_state *state)
 {
 	int ret;
 
-	/*
-	 * these are most likely self-clearing reset bits. to make it
-	 * more clear, the reset-imx7 driver should implement the
-	 * .reset() operation.
-	 */
 	ret = reset_control_assert(state->rst);
 	if (ret < 0) {
 		dev_err(state->dev, "Failed to assert resets: %d\n", ret);
 		return ret;
 	}
 
-	return 0;
+	/* Explicitly release reset to make sure reset bits are cleared. */
+	return reset_control_deassert(state->rst);
 }
 
 static void imx8mq_mipi_csi_set_params(struct csi_state *state)

-- 
2.34.1


