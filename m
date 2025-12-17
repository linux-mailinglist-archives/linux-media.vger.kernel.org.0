Return-Path: <linux-media+bounces-48955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E70FCC6312
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 07:13:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1077030B8B55
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 06:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF472D7DED;
	Wed, 17 Dec 2025 06:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="la/8chF5"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013029.outbound.protection.outlook.com [52.101.83.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC51B2D595D;
	Wed, 17 Dec 2025 06:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765951843; cv=fail; b=KkydREutwR/RzdoxKoW+Xb5+Mj9VKo8voz/cUnB6TgCW+f19/ZUp1Yn0j7pUrrWXJDkpHycZ3r+ScNiGgtX7x/rnP46942nL31lDAL+hoEcE1yC23JzuiTxko/ItNnl2G0shtSeibBl9XCIXnjT9YHs5q0qYoxCVut+YP+m6Ens=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765951843; c=relaxed/simple;
	bh=cCvX5QLnxyeJ7YH1shE2baGoB9qUbe4zFUC25uqomTg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=YJHFUMLyO9NELBrgVxsYWKvV7akjFCg/Qt0SU/zkyUakdfMBfWOwjBz6fp/60G/AUBm/DtH4v9NdHfYvOKV1J8Jvo9ksDlpBqBq12HnXDtbPfwg/eLYEwRxQGcC3nDOglkHPndOuzzWo7v7TjGKV5D2bZJLvl5CVQGJvXNSJR1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=la/8chF5; arc=fail smtp.client-ip=52.101.83.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MCEmTMHCuimrsGI/td6vVZJtHnD32DTHmrJ65oGPj7ByRE6XvBuOwoRPu9qTdKhI5Md7P76f1WEmzdgTwHU2T+ZjKbOTBCup1GrieXP+NW2olGPHwRITYPDRm0VlUWWDBRw2tzKp7Uh2LJiklVBjcj67XQrFGw8Q7vL4WRdqAhoozyEGINmH12qxqPY88H4/0rEWL3LTnn9ClLukvqnHmNi+T5R8bJ1CAOwx46VYDF7HS4vhKeUGLX8ZyZCxevXJfUgj00Lzpe+IQsVVPLWJYeub+lRFnUA+8Jbhlx6IcxgpDGM0W4NZZ9a+AnmKdFmvv3i6djXrDn/9yYZh8Chfmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U76JMwK/TK1R05NhTlvq++zu01U4MHf4eUMCbX6G3m4=;
 b=tL15vGDQJ0ffR1muN0+J3KJQPzsf4ta92oqvZMrfFBBne9I+E8xInYlW37M7mfWVAwD0mWv28XDApkCsQXT/Bs6aRggWDypXD7hR/YTWoqB2tYzwdRyBgDoTu0J53Tb0jnPPlXwo2/6ktdvS/rh7Upvyi4aIVA4Vm8QgGtv/94PUGbv2kHhOXZkkoTCUjlvAsl18OHKP2xhd/ciYvtbAQb0/mzJb2L1nwVureuYCzuenw6ISRTqUiTH6bwDerYTbltDxW+27cuz0DHGbDN8Isf5X7OucExWGLj8sW14/U59oAdwNQP7jjyAmYC0oas5FSpN6C1X/DqTv6jhuJfehZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U76JMwK/TK1R05NhTlvq++zu01U4MHf4eUMCbX6G3m4=;
 b=la/8chF5GiZao/farSp9/MikbYXs+M0EMyu2kjjPBQlhWrigutQ/KN7I12CCTMnP15jYRiwy0IJUc5PbypuEC09oXmnrC+bxRuLcB4pxEWVzTKWE4r0XY1EiRy6Fb299QutiEp5bb1KP32vBeRXVfseXyBMuWpKaiIUPhyX4PxCQWON/5cjual9UXKXlrnacHwMKbMSC5M6Bst7V6RBW+dM2Ym37vLLV5pRrpBcvOVRg+dbQXF4ZbI8ut+X8kizQHCTtptIZ6D3ZrnbxK18k/xhT3n5yHMElSt1EMVKTLEMO5PeVtyAgPLaWoJz10Ayz6u/NPQsiOLyFpoJR4OpAiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB9187.eurprd04.prod.outlook.com (2603:10a6:102:221::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Wed, 17 Dec
 2025 06:10:36 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 06:10:36 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 17 Dec 2025 14:11:25 +0800
Subject: [PATCH v2 1/2] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-csi_formatter-v2-1-62168af80210@nxp.com>
References: <20251217-csi_formatter-v2-0-62168af80210@nxp.com>
In-Reply-To: <20251217-csi_formatter-v2-0-62168af80210@nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765951909; l=3013;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=xz4P2gOHk4Pn9fFRRECQiyAvjmzG/nzXdOcsJ8jwwsQ=;
 b=uXwb0QHxM9OIt7fDA+DNER+vunKLf/kL0UH2yEKZQzU6RmkUAlgJ6BVxj8WmK1SFtFFpXQcQr
 LiZ+RATpB2wB7Fv2RsfRH9yFX51oKUe3EScU5JCmhmp4BfNf+vXmHsI
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:4:197::14) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PAXPR04MB9187:EE_
X-MS-Office365-Filtering-Correlation-Id: 122c84ef-53ba-4df9-e7f8-08de3d32fe88
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?VWNyWkJXK2FPdWh2RVo3anRtaWVQaWk3WnlLWDZoMWRlamdBZG1HS0hsRFph?=
 =?utf-8?B?ZVhIUWdrUzJtSHdCYWdlUmtYVXMyTEl3V2pua3ZoWFJMbU85d2d6WHBzMjEz?=
 =?utf-8?B?ZTJ0SXFNdDVMSzRYK2lZYWYwVXloS0w4cUJJS2NHUjR1eHo2SVZyYUZ3OW9U?=
 =?utf-8?B?bzJRVkhiZW92bjBZbStDRWZna05odGxiZ2syekdGc0M5cXpwdU5XYVpWWCtI?=
 =?utf-8?B?OGVYWmlvanEvWDlGQmhKK0hUdmNEYjF1OS8zZXBjcTdLQTQ3NC9jYWY1Mkt5?=
 =?utf-8?B?bjRxck41aWNjNFEvVXBicm1GaGhiZFc0Y2ErOXdhbzQxU0pVQklySm5EbjRq?=
 =?utf-8?B?TlQxVmQ2YTNITHlEK1RwUjBQVVFBTEpMcFJFakRmN2t6THNoVXlJc1A3YkQr?=
 =?utf-8?B?eHdUdHc2MGRLMVdoMkpZb05ZOFJkSWluWlNpdmZWaThSQjZTZmpoNVdtQWdy?=
 =?utf-8?B?U2d1SldHOS9Gb2greElGLzVFcHJBTkxGczh4eWdoYmVsTVppVXlxYnU0WnBI?=
 =?utf-8?B?azJNaFhrTFNLM0E0SDYwZUkwbjBuWXBkNEJpZUEvOE5OZzBwcGNDb0tuN0ha?=
 =?utf-8?B?czNtbHIyTTlTc3JBcFFrY0JqY1VHTDhaOWZpRCtRcGI1azlyaW5uUVRhZHFx?=
 =?utf-8?B?dTRTY1dwcU9PclFKQ1ZEOE1xMUVKbVBvbG91dVl0bjRoY0dBa3ZNVmcrdG0z?=
 =?utf-8?B?TU9jZ0pwM2xKclFXNnhCdmZ5WG5aMEtxTmtqd3NjSHg5ZVJzUmxodFc5NFh6?=
 =?utf-8?B?L2RtUzZ3QnJIWG9lMllHT1Z2dUtvQi9wdjFJeVk2aUZtcUdkWHJ4MW54UkxM?=
 =?utf-8?B?bHFaQndOUkJTd3IrVlQrUm9TVzBRMmpZN3JzT0xyeG9nMkJLN2Z4S3lZMWNQ?=
 =?utf-8?B?bzVRNWNhcHJxQ0g5L1BpSGZiZTh1eDZBazBQT1VTNFlxcHBzUXk3SzgyL3FP?=
 =?utf-8?B?VmtWQk5JTmhOaVVNT04xZzJoRnErYVA1dVE4K0Jkd09qSUVsTnJzZ2Y3alVD?=
 =?utf-8?B?Nm1ybXpUSWFaZFhVTVM2bFdJVStzNi9xSTgyeGpXeDk2aURKMU9LMk1HZHJl?=
 =?utf-8?B?K3NEblphZy9NQ2U1TTMzNURzYTZwL1owdGwxZStNVWY1RnFnQUFjYlJkYVR5?=
 =?utf-8?B?eDF0WWMxSGRhZzNaL0dmQnkrMCticGJZS3BWTXRXbHhOdE5kWHg3YXpmcmxY?=
 =?utf-8?B?OWozUzlOZE01aS9VV2o2N2VHQ1Q5ZCtuL0didk96VzltTVo4bkE5SUIvNFU1?=
 =?utf-8?B?Yk4xUUNLUjlrZ1V0djE1V3p5czFTbFUrVEpyUzRBakRNeFVidHRUVkxsWXlp?=
 =?utf-8?B?S0hIU0NQWWZBTVRyT2lSbzEyc2JYTnRheWg2TllkUWRzREk2Z3BEY3FaM0pp?=
 =?utf-8?B?RTltYVQ1MUNFMC9vN3FaODB3VkhtM2VjZXYvbUg1bkpYS1VmY3FhL1lUNzc1?=
 =?utf-8?B?VnFERnJiR083UnEzeDJaVlNuTnJxWWpsZUdyVEVmZXZvMkxWSlQ3amxkOTZ4?=
 =?utf-8?B?NzlvQjNyMEVnUU02bUdWSWhXM1FBVEZyR0JhWE5uSnF1TFdaemdFbGJqS0Z0?=
 =?utf-8?B?TGJZOG5NUWZKcUhwMEFzQjNLZFl4R3BCN3hWQ1M2S1R6a0JrVUIrRC9MN3hv?=
 =?utf-8?B?QmNPc2dtb25TSmhucDZ4bks0aU5wUzV3SmkxN0FIYStiSVY4MlhIVTdZdWpC?=
 =?utf-8?B?bDFBYnZEY0dKUWd2TzQ4UEtYcGZnZGhrUktDK2ZZU0tIVThYMzA1djV1ck44?=
 =?utf-8?B?WVNnbGluaG1VTXJiUWNBUisrMDFMMHZ6YlBTSjBPZ1dEemlsNVpybS90b29T?=
 =?utf-8?B?cmErMEszSDBXdVFFWWlkUjZZbUxSOXRCMUtzbk9vRFQxRTV5cGtCUy9RWmR1?=
 =?utf-8?B?UGd4dkNSd3Q1dE1KTjhvbW11eWdXb1JPdmNhTEdaVFZzcWw1bFYyQVJITktv?=
 =?utf-8?B?UzhpZ3dKcVN6NG5BZExnSDlRV2p5SSttNW5zbHdoanlrOEIxUDlUMlFxYXRM?=
 =?utf-8?Q?5CB6sPRpM5/NPTnN0Il2uoRHM1lVek=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?d09GZ3dWVTNKQ1M1dlpORmVXUXp5NExYajVhd0lEZjZmbFFzQ1I2VmRZb0pC?=
 =?utf-8?B?LzVDalZtNFk1NXVVZWpzZGFveUNBSXFBYUM4am54L2JGMHkyTTRJMjl4Wk93?=
 =?utf-8?B?TFlFUnRlUFFSclpJd3BpQjduTGVWVjZvenhJRW9LWmdONk9nVjVoa2dQbkFa?=
 =?utf-8?B?TFdLdWxXbEdndTZiMUxMZ0VwbFdyOC93ei9vN0x3Z0F6MUhVa0laMGpGTW1u?=
 =?utf-8?B?Sktvd3FrVjNhM1hvVGVQdk5rNWhISXFEWE85bGtQek1MSGVvTGNaTnJIUXdR?=
 =?utf-8?B?VUpFTHRxendldG5CMHlzbXpWQURqOXBOcDhLYnNVWTdyeWZ5VTQ2TnJaRkNB?=
 =?utf-8?B?Rnk1bVRPZG9FNTEwbk0yMGdXNmpld3hESTloWFhCRHF5czRxVnpRcnAyNFEy?=
 =?utf-8?B?NTlrYVdqWkpwQnBiejJqN1ZyWG1jTDJkYzhLSWorMFB5Mm1naWF2ZVVsNXpF?=
 =?utf-8?B?eklxSnhhc1N6Snc2V0ZoOVZzODJVZFh5RXhoRjdvTXdEV0N2bElJK25FRVA2?=
 =?utf-8?B?eDI3YlVzcmtXdlF1QUttZWZ1MzltZU4wRnp0RjBRaW5tZlFWNVd4WnFwelli?=
 =?utf-8?B?L0ZEVk9nTy9ublU4NS93SlR3LzFPaEpHSElhVko2TlQ3Y21OQTdqSWFoay9l?=
 =?utf-8?B?dUQ1YXJvZkN0Y1loNVd3NUdFRnprVFJBVmhGRld5K1VEOG5ZRWJ5dHpMK2tQ?=
 =?utf-8?B?cDdHNjJyUDBDSTk3SE96djZZNnNwRGhQajdIdVNnVU9WSmh6N1cyK3FmdzlY?=
 =?utf-8?B?RjJiSTFtM1FmcjYyTkYyNVQ5REZJSElpMUlMUXRoaXZEaC9GaE9ydXdsWC9R?=
 =?utf-8?B?QlN4UTA4a2htdUxVT2grUE91V1lMN3lPeGF0T0E5NTNJZXVQMFN5dzJCWWNH?=
 =?utf-8?B?V0EwcVFoQzZ5ejh0V0QzN2NSb3d4eHYxNTRtOWIvQk0vSnNyeWFnZWg4cWcy?=
 =?utf-8?B?QkFuc0FsY0o0L2lybzBnRlVxOVVwWkFSOWJHMnJydHhRWDhwVDZ1Q1FxalRX?=
 =?utf-8?B?OGZQMGl3N2d6aUdnVFEyQ2xJOGg1Mm1TVUVYb2F1aXV6L21tSzM3WWZSMCtT?=
 =?utf-8?B?MUFjamIyQ0ZpaUg0Rk5ITUU2NzdZRG4wVEZUSjVkU1lZVFdvdlZrZzRKeG9C?=
 =?utf-8?B?RlV2MStWUVpwNFRvUlB6WTVGRWR4MTQxRC9FMTAzVFRzRWtVWTF6RjVEbHlj?=
 =?utf-8?B?NnBXRVBOVDlnVHpuTFhQUno3cXZTUC9PdllnZzJZZnoyeE9GZVNKNnNEaU1u?=
 =?utf-8?B?cGZleUFMcU1ZMTdBTlJFZXlVUTAzTERkdlRBS2JCM2hnUkE5R2VpMjVRVUkz?=
 =?utf-8?B?MlErR2RFUzNwQTZWb005VUpQdll3UGNCL0E3YVpuaEw5am10cFBGUUZnSnlL?=
 =?utf-8?B?dTZiOTBWS282a0xrTkt3NTd3bEs2VHZ5VUFXenNSY2c1QTdsdi8wdlFJWjE0?=
 =?utf-8?B?SGZRQjEweTZzZlRKTmhBWVU0MlNtS3RPQWVNd1phVzNzYS9vbFppeUQwQk9B?=
 =?utf-8?B?RWhIRUE2WGl5VmN1aURmL3hFcjhmMUtveVRIZnd0V2VWQXBWZHRKZk5ndmFl?=
 =?utf-8?B?QVduUVdUbzVuQnRHMWxzWlZaY0hUWFJWRDk5eFN2SFZDbUpZc2FuVXZ4Tkk2?=
 =?utf-8?B?WFJOeVRyZEVvbWNZVkpwRGREK21tdTk1WEhtaWFPL003MFB5ZHUrUzdsZmNM?=
 =?utf-8?B?YXJSZ1R4Yk90eFdlL2U4S3JPcFB3SEg1UnRPcnVlakJUSDhaSGluVjAvSWZL?=
 =?utf-8?B?TFpocXdiVEJQTDlzekx0SUMzVCtLSkpZMXdldGtSdU45QitiSDd2Rlo2T1E2?=
 =?utf-8?B?WC91OXZ2ZnN4aGFIOU1qa2toQUNwM29OeVAzTEI3TENacmo5c1l3SmxXSjhE?=
 =?utf-8?B?RFNENVJsdlo5bEJkQk9CbGtGZVYyM3hWVWEvdUgyRkVxUlkxWkNuZURtcVdk?=
 =?utf-8?B?bmtqSjQrS1BpN1RkRHJ5QnZ4dFNjbm5HRGFyazFETWpQTzBxcDZ4RHBJcDVW?=
 =?utf-8?B?bFZsYk1KZjNPVW9weW1pN1ZJSmU4K010cnc5M0pyZlJIc0d0ZjJjSkJ4RnN2?=
 =?utf-8?B?MFFDRS8vZTBDVnNDVmNQb2w0YURsbVlLTTk1T1hLWUtEVkZ6QXp1VUN2UUox?=
 =?utf-8?Q?EokydLPu4bghZeTSNvRq0wTmv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 122c84ef-53ba-4df9-e7f8-08de3d32fe88
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 06:10:36.4380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q9SRmgTiV1RVEirlIf4DAPpyrbtBXhpbbGiuunbxlNWj4mKByv/RPQsFrgxUxy+SRyLR/pqTca8ipO/qY1XbMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9187

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The i.MX9 CSI pixel formatting module uses packet info, pixel and
non-pixel data from the CSI-2 host controller and reformat them to
match Pixel Link(PL) definition.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 .../bindings/media/nxp,imx9-csi-formatter.yaml     | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx9-csi-formatter.yaml b/Documentation/devicetree/bindings/media/nxp,imx9-csi-formatter.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a4ad4a0841d71646dacf5e564735dfe0a27cc1dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,imx9-csi-formatter.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nxp,imx9-csi-formatter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX9 CSI Pixel Formatter
+
+maintainers:
+  - Guoniu Zhou <guoniu.zhou@nxp.com>
+
+description:
+  The CSI pixel formatting module uses packet info, pixel and non-pixel
+  data from the CSI-2 host controller and reformat them to match Pixel
+  Link(PL) definition.
+
+properties:
+  compatible:
+    const: fsl,imx9-csi-formatter
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: MIPI CSI-2 RX IDI interface
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Pixel Link Interface
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nxp,imx95-clock.h>
+
+    /*
+     * Power domain definitions from arch/arm64/boot/dts/freescale/imx95-power.h
+     */
+
+    #define IMX95_PD_CAMERA		3
+
+    formatter@20 {
+        compatible = "fsl,imx9-csi-formatter";
+        reg = <0x20 0x100>;
+        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
+        clock-names = "pixel";
+        power-domains = <&scmi_devpd IMX95_PD_CAMERA>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&mipi_csi_0_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                endpoint {
+                    remote-endpoint = <&isi_in_2>;
+                };
+            };
+        };
+    };

-- 
2.34.1


