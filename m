Return-Path: <linux-media+bounces-62765-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNeyAshgFWoiUwcAu9opvQ
	(envelope-from <linux-media+bounces-62765-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 10:58:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD0E5D2D49
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 10:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6BAF4302932A
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 08:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5653CF694;
	Tue, 26 May 2026 08:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lWj22BFa"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013004.outbound.protection.outlook.com [52.101.72.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14323CEBA7;
	Tue, 26 May 2026 08:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779785693; cv=fail; b=HM4vwzaNiZyCZqDgs+6DtXirL+9BZRjdZRAMFTC+2Y3VsEzZlz50DTfNWl2BimvoKtzU25p7SDXoPH4plEfcMlRhTx+ozfn3YBt3sW8jPFFr8a+AmB+dgCsKfVco2ZWhJT7s0jfYMhYWyE2QgtzehMAhpHS/NEWnXqfH99oW97A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779785693; c=relaxed/simple;
	bh=daHh1IHdP4uSEn146Z+pNoZWapBMLUzMwanl/y0xnUE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=mxQXGLWlVI8ruj6VU9MPwDxL49nUexPP0iig+3KMlc3c+ZKpdvd6BWsll0SRWdn0ZzdnxPYwKXXHjWvKlRi7s9fHhVbItg28mIuIPvU9RPeoTvQrWIWuzPGWemBGFf7iYw0kkhhYuKaNoCkFhZhu6z1SA7uLhmPb9jUcgyNjMn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lWj22BFa; arc=fail smtp.client-ip=52.101.72.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ozz3dZ8E2PZZvtQv2AYHC5IulBCo80znjVogG4pQHAhgCPKTlhonkB6LBCjDsXf88Gc2X0/BXZDyi6fBa5NW4TEBKlOch1iUQImWmhu4XDSZYxotey54eMRx2ZlfRBb4oj5CU9PTcUXPGRbuMUQGXrQzM+vyaklmuO3Lec8RnU0fp2E9wRS9BGWiKloLin7p2FFS3Mb4P+ClDMgH1Jo5v6Kmle5LDsokJy8gtm7sd9v+3lxnpH2uKw8rMKChxKXweHXWaQoLdI+BXSB3eDmcwnan2hOLGP6XDUj2Jb6RJ2suDWOvchgDpscWbTBIXHh3wuezUBJzCkAIhpeb5Is2WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUStKjuXHOy098vpqkcSZlKGDLeUo8uX82Uec8AqiuM=;
 b=KXEd3Dx2h8RXSSw6V+SUq9EOXOIKk0Xv9jhsmnXpAmjLGO9rDPKKNs8p09eNEPrASAVdOXu1impp49EswzEyryH7BKJV9PBMO9XFMjTRbFQ1WWtrXsgYMzRcRCwrP+2jkHkB82pcANL5EprH1+0EsxTK+j1PbR34XhIcgS+JLXktwl5zSPv5INJfLv2qYgUbP32J3F/+8zk+72Jeu1oq6M1he/EHO4C8CPb5G5C57bLccCWeQfl+NTNLDX2AUNnWd6euI+/mPgiX6r3+Hcw19yWRS786X8PCGudrTv8DTHlgf7k2eb0EDAtAV1q39GLNtHJMmiPshAgWEE2tb71BpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUStKjuXHOy098vpqkcSZlKGDLeUo8uX82Uec8AqiuM=;
 b=lWj22BFaKQxASs9Zn6P7KENu46gkCmguMRFM8HIP/nOAmpSjxGhD06xL/86OQp5a2Jjy36tnd+QkpKBEIdcBjSL3f/m98K0NCslcX+bSS+qzkv0VA0LrXUgP9aSrrQJ5XuFo8kIZLaMpatXG+7LW7x//8nW0ZuxtfctTNDi9Rmcqi4Qkr7C7fYJznB+RTh4nU6rQ6sp0vMLRNpFZGSeXMm9b6rIVsqN/n+OMLZixEqClIgn/5qNaD2v9BH+cf+JUrOpmfkE03TjsKMBTEy8WjgJj58vEw6u/PUx9uiCWJW+5LDdEMuih5R76f2/i1c4O8wEcsOkTyDBpNcEFRCkblA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA2PR04MB10446.eurprd04.prod.outlook.com (2603:10a6:102:415::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 08:54:44 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 08:54:44 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v9 0/3] media: nxp: Add CSI Pixel Formatter support
Date: Tue, 26 May 2026 16:57:19 +0800
Message-Id: <20260526-csi_formatter-v9-0-ca3d8c334c39@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG9gFWoC/2XRwW7DIAwG4FepOC8VNsGQnvoe0zSFYFYObaoQR
 Z2qvPtIp2kJORrp+38ZP0XiIXISp8NTDDzFFPtbHpq3g+gu7e2Lq+jzLFCiBkBddSl+hn64tuP
 IQ8XksVFAvmMS2dwHDvHxynv/yPMlprEfvl/xEyyvv0koVZE0QSUrdg0D1MbVDZ9vj/ux669iy
 ZlwZcGUFrMlBLJtsBJBbq1a26a0KltLVnry1sgGtrb+syQBsbT10hsodK2HTql2a/Xa7vbV2Xr
 trFTBknFha+nf5n8vLWUrQaJlBcjozn1Kx403a29Lb7LXhM5oqbVhtfd25XdXn+yyt6OaMPdjX
 fTP8/wDVcMemlgCAAA=
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
 Guoniu Zhou <guoniu.zhou@nxp.com>, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779785861; l=8852;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=daHh1IHdP4uSEn146Z+pNoZWapBMLUzMwanl/y0xnUE=;
 b=omkNE3sEQfeT3yrC//EazIszZXrQt1AWJ6MSmukDVz1UhPwZW50qTVH/1MGMQLPQTndfkxw6e
 xcMIAXbTgj+CvC7gPiRdjquzDgrIoHIfq4MfLhVFjl7yuVoy5i7XMCK
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::19) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PA2PR04MB10446:EE_
X-MS-Office365-Filtering-Correlation-Id: 1df3f178-3914-479c-234e-08debb046e58
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|19092799006|1800799024|11063799006|5023799004|3023799007|6133799003|18002099003|56012099003|7136999003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 OfREHMoVPTOixV0w3QIU17Nyz3C+nMl9xGnkz/Nv57d++rlhhfVe40mxpTblZVV/JgfmIDtMQLPntaJxO1PxfGT1EQ+vLbh3j1Tz0cHedDeqp21bl7Q29hbcm1HgkWSRDVq4RZfrY8EUTYgmQ+J2qToj4Ynv6ovl5oJnVhfmXoxnYDp6w/ngU39KDrgqsta8ToeYQaDu+KuAtQovYvoAqB+CDUydwhyI7s7m9n1q1JuarU1HlopyhyxdOYGme/lxlRPeYHPb0rChNSI8QvsE5wm35sfz15HahjokAw+S06shkedD2F8aUEnEYxl/W34Akbx2YMFulXxHmQxP8F4yXh3XfFcer8d7izWUAKlIMpCGLqEcXHfjiPDLXvGITbEjF3BtDj57//yqNmIVRYDZxjFJiX7N49rz5t+xTs2vX2gxzW+wdsCZcbsuc/jnBnaJu2Me2BREEGcj4tt8wAouf1AE+kTFO74ySL7qWLX64ZhvAXw1x4ScT8JTBz35GVIz9m/IjFziodZcMIxiU+OLEn8fNMpc6QZTeTEkhnOnk+vRZuxwkVQYed9KmNIe0uZN5NJOQaNsOme5z5PC2P2KP46fnKALAs1YyLn5LciN3N+RJIi318SHtfY7yuhRiDf4jDtrlro0XmbYAwTFiu+Aii3Ef3+LA39wKR2IkVDKYbjQV83ERQWAseyK5gCWUhaz6YbEtUW16hR26q0r8ejE+Swxabk1tM/8Qmrkb/Epffq09rkPah+ot68wkMeBDyq8rdC/ZBHsHDKEu5On/8qssg==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(19092799006)(1800799024)(11063799006)(5023799004)(3023799007)(6133799003)(18002099003)(56012099003)(7136999003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Rm5pWnVWb3NsYk5DUVRUcUV5RmN5Sm0ySTR0bEVCNTRVYmdVQ2ZRZmZYSkQ1?=
 =?utf-8?B?SjRBZ3JtK05mb0ZBckprclU1SGp2Wmh4MkxtRk4vZng5aGNmc2RYWlF1UE1S?=
 =?utf-8?B?WUxRT0lHLytpb1diSVdBK3ErbGF0L3ZpbytLTDhzVERUMW5kRmw5V3VJU3Fl?=
 =?utf-8?B?b0ZDWUJNYnVDT0pSMytROE1UUWg3MDNIM3dwWkNCenpnc1pPa2ZwUTNVem1C?=
 =?utf-8?B?UDgwQ0dYclBQVUVGeWdxZEowTlJNQ0c4cEZWVnJORkgrNGNKc3p3TFNEWkQv?=
 =?utf-8?B?OUdyVFNaRCs1SE1aQ0RGRiszU1F2OWp6UzRVbFVvMldCY1d4bFFScWFrdklU?=
 =?utf-8?B?ek9ZelBIV2gweEFxUWZRQ2cvckFkK3dRR1R1VnlmQnN1OEZUcTBGS1hhQnU3?=
 =?utf-8?B?ZVEwV2JKNnRzNlVmbmxuSHB5cnNjTFlURVVocDZPM1k2Z3hwTkxIQmlET2dR?=
 =?utf-8?B?UzFXU0NOUmNFcCttcWpsRSt1R0dvM3JzZ0N6MEZqN2pZMS84M05hbXRjK1cw?=
 =?utf-8?B?Zmg4bTYrRlhYQlRMTmcvRWF1eThhdmZnLytabjBrWk1UTjJSbVBQQVhDUzd4?=
 =?utf-8?B?dFJUYVhUVjYrSm83QlM3Y3k1emtpbHBjaDY1aFJxWGxIMTNNbXpzd2wyOHpY?=
 =?utf-8?B?aEpXWFZRcUV4aWRxeGRBeW1uM0ZaWFFtMGtaMFNaYnk5VzNLNEp5NStzaE5x?=
 =?utf-8?B?ajJJR2RST1RYYmlWN2R4Z0VyQ2xSNTllRTFxWGpUUTZEcStCckkxaUhqem1n?=
 =?utf-8?B?ZXpxQXVpeEdwUnJmUVIzZkZjVUZLNkcwWFdFeFdwaVZSOGZKaGdwWjlpaVBJ?=
 =?utf-8?B?d0dpQVJFeGN4bmNSSWtiSTYwVmp1ekNzaWM0b3RNRXg2Q1hVczhoNVFHWElM?=
 =?utf-8?B?WUdpWDR2RTRMS3ZjQWZBOXArWHQ3MlVJbld1b2lPVlgvWlIyT1h3eXVKVk5a?=
 =?utf-8?B?azdrOWhmRzNvdDlWc24vTS96bWdjSC9EMDN1YlBtUGx1NFovNDIxYm5laHlz?=
 =?utf-8?B?Ulhod2VVS1lJaXJ2THU5Myt3Z2VqWU9malg3b2JmUUMwTGFxdThPSXJJMXN0?=
 =?utf-8?B?cjVja3dUUXhjZWdydzZSamYvOTlRUXE0Z3NmWkcxTVNrbkVxMHVaQUVaR2hK?=
 =?utf-8?B?R3R3STVoMENTQ3d0Nmg5d0pQYU9PZnVwVjMvcTNVSU9BTVF1eHpUTXdvQlA3?=
 =?utf-8?B?UW9hR3k1N1FvOG9iOXdzV1dUZldTaDcrZDRwS3dWQUVLaHhMcGJNeG1QQnZT?=
 =?utf-8?B?T2h0N2J5b0Z4aVNXY244ZDFOK05JYWFCNzdHWGJUU3ZwWXlPN0Rhd250VVZB?=
 =?utf-8?B?Wm15RWZmUjc1TC9jcGVwdDJTUkh1WTdCRm9XaTNWQkI4SUVmdGtiRWw2Mnhi?=
 =?utf-8?B?alhDby9xMUdYaXhFZEkyMmdwVzVMYUdjL1RxYVRwbXNJOEkvYXpncVVQcWp1?=
 =?utf-8?B?VkVTSjNWTTNOMHRQY3V0WTFvTWdMUUZkNmhvVHUxL1FnUWV1VXFpWXRCbzM1?=
 =?utf-8?B?Tkl3bmFGMDZZaFB2bWJKWDI5ajMxQXFLZE1HTFV4a3Y5ZzM3TXRxbXFyMGx2?=
 =?utf-8?B?QmVIMUl4emFjQ2NOSzNOSXpUU0RXQy80SmNoeFpJeitvMUFvZFdaWEFUWW9R?=
 =?utf-8?B?a1RKTzNscHJVN0lLdWtvMnQxVFJLUjdsWEgxUUh6MmxiaVlqYVQyWjZKa09z?=
 =?utf-8?B?dmxMOUlkTVZkVVRRUU1ZRVExTlVLUjBrMTNtSnZRanE3MHBPQWRoSHplbTh1?=
 =?utf-8?B?N2JudER4OVNnNk56TkdvaU12R0lKam04Tk42K0hZcXJKTm1qblRYeXpybytt?=
 =?utf-8?B?QXIwMFkzRzl3ZXc0dGk2MXhHOENqbUhtY3JtY2lualNaWkU4N0tka25vL0o0?=
 =?utf-8?B?Yk9kdEhsSHpmMm1UeVVGUS9QZ2Jwb1FKQzZhT204d1R4UHRxbjJKZVl3OGIx?=
 =?utf-8?B?TE5zY2djaHJYcEtsSTQyckxMVkpMNmx1TU1WeXVDblpaRk12OVZzVS9CdFF2?=
 =?utf-8?B?OEozbXRJMXlxdnJ4dFJ0WmUvdHFaTWNJS0cxR28xRHE1ZnVidUx3bStBRUNU?=
 =?utf-8?B?RGFQU2RidTMxd0N6U0kyTk1LNmxQaVFNRVdVNnlXUUI2RjhIWERzYkliVXpQ?=
 =?utf-8?B?Y2VIeTFJQ05hZUpWVC9lY3dqTE9xNDBGNzZOeE1qTHhTVE5vd1h6aU52ZDk0?=
 =?utf-8?B?OXZ0RzNNb3hTZnJuSWhCcGJKbE1CM0xzc2htNnNQUDhjRjRwa2pXVVgvOExC?=
 =?utf-8?B?RGE0VnVvdG0wMkNQTTVOS1VWc1lxZ25lYlVhVkVpZjBrNm1LcllwelRneGZ5?=
 =?utf-8?B?clpUdU55MnJOaHEreW85eXZvSVZ5Z3B0VFg2Z3lQNXNjU3pZb1IrUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df3f178-3914-479c-234e-08debb046e58
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 08:54:44.0591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hYlIaM8e8VFWUK01dnsQjrQkr/9F28/Ma4KASOs1ZlF0YbjceVNWZ5STpKiGfWKWHy9lip5Ez1qkKcBS2cQ/Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10446
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62765-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,nxp.com,baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0FD0E5D2D49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CSI Pixel Formatter is a module found on i.MX95. It could unpack the
pixels received by the formatter and reformat them to meet the pixel
link format requirement.

This patch series adds a new V4L2 driver for CSI Pixel Formatter.

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
      dt-bindings: clock: imx95-blk-ctl: Allow child nodes
      media: dt-bindings: Add CSI Pixel Formatter DT bindings
      media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver

 .../bindings/clock/nxp,imx95-blk-ctl.yaml          |  11 +
 .../bindings/media/fsl,imx95-csi-formatter.yaml    |  96 +++
 MAINTAINERS                                        |   8 +
 drivers/media/platform/nxp/Kconfig                 |  14 +
 drivers/media/platform/nxp/Makefile                |   1 +
 drivers/media/platform/nxp/imx95-csi-formatter.c   | 758 +++++++++++++++++++++
 6 files changed, 888 insertions(+)
---
base-commit: a3d78e74dd3ed04797ea351edb7f0a19b961c063
change-id: 20251125-csi_formatter-e6d29316dce6

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>


