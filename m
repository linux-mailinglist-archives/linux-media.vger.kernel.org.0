Return-Path: <linux-media+bounces-62766-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CqdBOtgFWoiUwcAu9opvQ
	(envelope-from <linux-media+bounces-62766-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 10:59:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B885D2D6F
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 10:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8E3AB3044DC7
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 08:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4953CFF4A;
	Tue, 26 May 2026 08:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KP85wojl"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011042.outbound.protection.outlook.com [52.101.65.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8B93CF960;
	Tue, 26 May 2026 08:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779785697; cv=fail; b=EWM6HrnCxrjqfVEOTzdHd2ZPNMl9AwIKwmO3DkB7sclBnQkBsHAsn3n40ti1OgT5ZbIkaByB5gFXJceRd0xDzV28StBwqcZF5Ts4OLGLIxG+XP9pFHncn9dBGtf4JdMHSHzkt1qdzeASeOTpsNMK/pQrhAQsoy84bPI0hVp0RzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779785697; c=relaxed/simple;
	bh=LKD5WAuk19kkz0vZnXDU8LRLzwBoadoB7N99vmqqq8Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=n8ky2bYpZhPsf664QwAjQ7Gtgiw0w/NMELbUnqmCJbh1rNEpakCxT9PgcgvrXgo9tFtLCZ0lfagDgd532EsQRf+/21yVGeIdc0+aq1VfibQoaUl4BhxRXNVeTWvFQeEaIdgep2UqNpUIXsXl3lXUF9c9KtlORpfG7c2iAO5+zqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KP85wojl; arc=fail smtp.client-ip=52.101.65.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EBEQLdeY/vcS/w3gVAJpsUDVDslUyj6N1VF7IM++zgAq+tShEa6LFCCrVdRsTuQby9wMnb0QpU4AEPXJqC5ozABbPoFHm3+IsFZbuEoreJUcKrJxXk1CB0vTK8JnayX0djs4gIHg3GJ6a6YidOy3YnRcaNBagbOYWqUdJdvvdCbBAf9bfPXMUl/UB8iLzXkDBFvVRdfnIKQZMm5i9nZcf0h3y/9YVBA4NnDU5NZlQkJc6R/RdkDJfGiNcVLIdFnDnAerAMJOPUHdQG6xaTMCZypY9Bi14zZ6T5BCwGYVdihu45/D3atPz06fkaYK9MRe6eLLU3pljRM5EWFGji4Qew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBIOxnhmVP0nqN8eJm0sqQh/ubBALkR0fNmmJxLpcUg=;
 b=K3+upWarX2h5L5gJZof+KQteWedbN7GLO6lY83/KwuQQOyN5ru8mmtT7nsR3fLcYqQmyaenEE6dmsgb+jbRcT5b8L8KkZGaAZn8S88qyflwKWiwGucNSupJNkfSp5LQDWFhYJfVaJf0vRqqxCs2rBCM/Ip8sXHvv3xtzvX7Czk4qSfMFeI+2qU5Jxr8IkXBTmgvAghnuyIJxqngTMdOKrFC3PKvGLBWJyAPZEIsBG5QSLuz1pp0nR628Nv7pW8Z03l2ZxoUxEtFnJyMWBBgnwzJZWLxWtFUgkUeKI4F6SJmS2GAxV/k2hB0pSj94+u86td1LwBU5G9FYtqC+Cf+fAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBIOxnhmVP0nqN8eJm0sqQh/ubBALkR0fNmmJxLpcUg=;
 b=KP85wojlP+JjWjR6MukMGC1TwoJOceG3NRc6l4bYdukjfLidZjRiwM0sLd4eEmk4m8+X10YlqOUmwi9GKDvT7le6CqmOQFIKU43nYcK3AyTyd/hhpjlfrP6bto0UyMGlIzWTN+KZbggaSlXee82S7jlBz3dJNHA4f8cFeIQohCaAPc2Xkm1NvIm0t4I49pGKBg8jFOE+tpmOWJdNqU5qIaVsDo7RtOTp2t3gFl0lbZBDOAQHveUruQZppypoFtLY0lRbZXm/pKUkhVMZHUqFjLa8eOJosWtNYFV/41VHA53K7HL2Wgmmro9f3LF7bH8jE8nOiA9ey/NvGBhKyTidwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA2PR04MB10446.eurprd04.prod.outlook.com (2603:10a6:102:415::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 08:54:52 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 08:54:52 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 26 May 2026 16:57:20 +0800
Subject: [PATCH v9 1/3] dt-bindings: clock: imx95-blk-ctl: Allow child
 nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-csi_formatter-v9-1-ca3d8c334c39@oss.nxp.com>
References: <20260526-csi_formatter-v9-0-ca3d8c334c39@oss.nxp.com>
In-Reply-To: <20260526-csi_formatter-v9-0-ca3d8c334c39@oss.nxp.com>
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
 Guoniu Zhou <guoniu.zhou@nxp.com>, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779785861; l=1243;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=LKD5WAuk19kkz0vZnXDU8LRLzwBoadoB7N99vmqqq8Y=;
 b=RoBgpCXt8DHj/x4of9KUfi3RteiN0f86nTV/8uXYIA7tMPjRwk5Ama3R2WC780r+LwbfFqiFA
 mh2+1UgMv4yBb0GI8tLi6jfJPhWxVAB4jdEUrUwnNDA8u66/DS7EXBm
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
X-MS-Office365-Filtering-Correlation-Id: 2e82f88f-024f-4c17-9d90-08debb04732d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|19092799006|1800799024|11063799006|18002099003|22082099003|56012099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 5jugC2EQI++aXyvJPwDNJA7Ka7aGpfDxvCGFN/qlj/X1Bri7rsbnUyHDpp6MNgxmj9jk71zq5Ah/j/KlEV9MXsm8DnYqSnadK+nohGqjMCbAvdUjJVVZ/ZIbr4FB6USP7l3OZrk57lS6qIeNjPUVc8/x9MZoeR7+sX1a2W4P58uhCYOI3KLu9tb0i4T/1r2qcU04d+iKGTkyz8dMVau6QJFqa15LITWkNDa8AYqU2qxSHRIcO/zsroDvXhqHchmBhSbZB0wKszjvrE0FTDMqgHLo8Qhk8eH6K94BPjTuRRZj7gn8f5L6M9HDwzyP2kU90HhmKoIlAgXN5ezyK5Qy8AeFXgoKFAJ2Jd79qvQ2gi1ZWjik3zcN1t3ofJh5oKtbjoiDa888VGdsykFWJa7I4zJ8dovZaOYcu7fijJ+ZY7EMUT2AnyEwaOuwt6X1Y2P7qlyZT+Plg3yTvhDDGzeSXvlH3/IyGnxWOjNKMV0mCXacIuFyk72v7maIMpNeWzgd+evO7mOCvf93nZjUaw8tOmc4E2ZEynqyOA8ZSSzzIaEKoy/kkR6VOHK5GYDXlFUxE+BIUdrH99CZiF1kkxIsuAvu1oDwW5fboedd85WlcHE1Vzqnib6Pqx7pEW20CEwY1W6TAW9kRHL0Geo50XxnK2l74MMcvKK7+GJOOFFhlkmCyJom7u6zxPrt/wtqq+0wri5HjEWrdrnmUtvnpG4YEuN5rQj9OtVEPJ1I2u5YlmSyN8ghmhlLwx24XkixfcZPQEjxVywRKDoB9TKDrwsvMw==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(19092799006)(1800799024)(11063799006)(18002099003)(22082099003)(56012099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZVdDRHBxM3lYSXV6dFhJMmJNdXhRMmJVSVdtZThvZHlYYVRCdEZlTXpia3Fa?=
 =?utf-8?B?STV2dy9QN1k3eStBdm95OUhNZWdvUW1GMlRaWWZmVXBnRi9VVmVsbjhyM00y?=
 =?utf-8?B?QTBHNzRnL3VRT2Ewb0VOdFkvNnV6LzEybHlpMktOUkxDK2N5MVFyemZBcTZy?=
 =?utf-8?B?Q2d0Z1JrbWIrdnVuZmxWekZrNVNwL01xL0JNZlpmdy9QdDNDRjBuSFB4Z2hP?=
 =?utf-8?B?T3NDbFFVZ0JDK2diQUYyNE5CaExxZDVJNVE1SXYwdTVqWTcvcWRmOC9sN2M5?=
 =?utf-8?B?anptRHRVZ0ZJSGtJWWFYL2ZtMk9jZWx2K3pidmx4L1lKMnIwNGVQWWpCa2NU?=
 =?utf-8?B?SDF3SUhPQmdwSzdGUndlOWttVnRINDNQdDdpa0dURklKYUJmNEIvVXMxMnpQ?=
 =?utf-8?B?c1Y2dWlUQ0VqNGlxODhic0hkRTBSejY1c2xwTlA2Skp4S0F0WkZWOEZ5a3pl?=
 =?utf-8?B?dUVFSmNKcUU1NUYrTzUvaTlzVEk0QzNKc0Y5bi9idE1vUHN2eVh1bFhFNHl2?=
 =?utf-8?B?UHB5M0dTTlJDV1hDMTJGRnNadzN3M3BiUXpENTdkOXVRamJmZnFqOWRXekRp?=
 =?utf-8?B?SnU1Qjh5enFPTmhHd2NSTWJIakVRZkRiYUhEaFM5eTNvVy8va0pKcFhIZUNh?=
 =?utf-8?B?ejdWK2M3bEpIT0xEQURYTis1SWo2cHB4VGNHWk1ZMGczanZINmhSbWdyRS8r?=
 =?utf-8?B?a0YrVDBZRm9ac3JJR3VmaitzaExtKytaNE03dXIwZG5GZnYycmtQcTIzTzhw?=
 =?utf-8?B?cEhCRGRxNGkrek9ra0dLVitWdVpuN2YrWklNVG4wM1BaVUNUZDJQRk9sdmFk?=
 =?utf-8?B?RjFLRjlBUVVNSUNaQnRYV2VHVlFtRGZxSFIzYVIyOXF6ZTBlK1JjOFpBUUlH?=
 =?utf-8?B?QUZES25LUnUrN25td3l3MW5nOWxpbmVCemVrMGIrem9aOEN5c0x4SUdDc3dF?=
 =?utf-8?B?T3J1RVRMbHFWR2Zac0N2eGRxeklSckpDZ0MxSG1zd1B1RGc2ZC9uN2dETGcv?=
 =?utf-8?B?UEgyUGJ3Nm9qMThEVk45ZjliaE1INGNkK3QyVWdCZllacnI4QUgrRHhRZlRT?=
 =?utf-8?B?N3NCSjdXbGVnYVM2aXRkYTRtUUJSZDl6YlAzUVVRc1RsMFJBdUJPWE9TVUZw?=
 =?utf-8?B?YURKc0RLN1V0STVObHlscUVDK1ZVdE1rT3psRWY0T2JUa1d2Sm4vdmNzQ2dO?=
 =?utf-8?B?bU52VktNOXhDaTVYOEdwTDYwY2hzRS94SWRoMmVTaWUwNkFRREt2dll3U04y?=
 =?utf-8?B?cTZmdlRhaXBwd2FTeUxuNXBTTHVIdWNKS3I2RlpYbVdqendnTDJISHZYYllz?=
 =?utf-8?B?VVMxWlU4dW1iR3lWaTNPeU5ubkNGMUE0ZDVBTm5KbEZiTEo1cVJBVXlTMGZC?=
 =?utf-8?B?aE9KdktHenQxbzVjUUZ3Yi9MeDc2QU9hV0ZQZGk5R2VOUlBuRHlEaXcycmM4?=
 =?utf-8?B?dU1PZGgvcWFzZCtVUzJQNlR1TXZ4M2VjQm1WSXRpWFYvNTNFSVJWS1VWNXJp?=
 =?utf-8?B?QUtWRjFDV0QyNDA0Ym05aU56b2RSSnRqcUE0eUIzSmJvQWtrZVlUakx0UFIw?=
 =?utf-8?B?MHBTZ1RIN2lLMVg2Wm9YVDd3dkd3YjVhM01MWHMwUHlMZnRQckNFTHcxWmtN?=
 =?utf-8?B?dHZubVpsaFVMUHlIZHpwS2dWc3N3YVExeWExaHhDbkhwQXFCUEtVbGtDTktT?=
 =?utf-8?B?ZlJkY0hBcGxrOGhmYW1WSFlEOU9vR1U2ZW0xSmlNc0dlRjY3eU9ZMmVNLzRN?=
 =?utf-8?B?UU1mbjVYbmVndFVadFdZSlhWVjltSkxtUkNTbWlRdjFZaktoZ01pZitTUVU1?=
 =?utf-8?B?Z3QydG8rUXFUQytpS1pwd3ArTitTVis3Smd1bm5xcWhnek16MDB6Tlo3Vmgy?=
 =?utf-8?B?b2VRUEtjVnNYS3FZc1lSalZiUXBvS0RsOFJsc1VvbmpvVVhRNmpHRG92OUVz?=
 =?utf-8?B?UlJyTjZHRFc4WE9kT0lVdm5wNjBDQ21rMUJmVTdIWGJGM3ZPVk9FM2owN0ZQ?=
 =?utf-8?B?UnFaNmdCMlpWTjU4TVhRanNaYlhObFJyQWYvT1BwSmJDbnV0OTI5TkxTeEww?=
 =?utf-8?B?SjhRb2wvSkxabnpTNE0vcjVGd25IZ1hRMFhRSVRnMUh3NEFHV3lTbVJSQUwv?=
 =?utf-8?B?YWtyWnpPMnpwMGdSb3ZDbjgxMC9FNFhGOWJscnF4V1BsNjg4bFlpdEhKTnBo?=
 =?utf-8?B?U1htVkFSVkpzUTVaVGRlN0c1WTFCL0dJanpRWW13aEFWU0F2bTNHQVMxUTR0?=
 =?utf-8?B?b21qV25Da2UrdWxpZThIbjVLL2tVSlpPRTFlMUpiZGJhOXlGTER5TmkxM2Mz?=
 =?utf-8?B?aGtCOU5KaGIyYi9uL3IrTXV4TWpENjlUUTN4Y2xDNE1VejdrVlY5QT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e82f88f-024f-4c17-9d90-08debb04732d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 08:54:52.1766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tixvgx/2FdXWJlBPxFbaaxCc8CExaju3AUV7b51olc0mrRBgz8Prlvobv97vZd4k7kPidU5wvlhEixc7S2ksGQ==
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
	TAGGED_FROM(0.00)[bounces-62766-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,nxp.com,baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 32B885D2D6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for child nodes in the imx95-blk-ctl binding to match
the driver implementation which calls devm_of_platform_populate().

Add #address-cells, #size-cells properties and patternProperties
to allow child device nodes with their own bindings.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v9:
- New patch to address the issue of formatter acting as a child node of syscon
---
 .../devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml          | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
index 27403b4c52d6..33ad1c15cc9c 100644
--- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
+++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
@@ -39,6 +39,17 @@ properties:
       ID in its "clocks" phandle cell. See
       include/dt-bindings/clock/nxp,imx95-clock.h
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+patternProperties:
+  "^.*@[0-9a-f]+$":
+    type: object
+    description: Child nodes with their own bindings
+
 required:
   - compatible
   - reg

-- 
2.34.1


