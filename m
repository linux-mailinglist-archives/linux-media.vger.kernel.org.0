Return-Path: <linux-media+bounces-42647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F77B7F2FE
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 15:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E5BD3BB0D5
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 08:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314FE307AC6;
	Wed, 17 Sep 2025 08:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fQ4PpSUj"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013021.outbound.protection.outlook.com [40.107.162.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3743064BE;
	Wed, 17 Sep 2025 08:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758096927; cv=fail; b=CToa6a5cqkEzFmEP3uJ6tWZUhyyIp9miRmYplL7ZuqZcAJFkMw2n/SKgIoQ3c+FX4FjYWFJkjLvDCJqiGA+apWSHM/oDkyaKPEb7dFxIelISfy3dCRIp1/uyk9PfyXEbPnhepRSthvJF9zlJG3LKfkiW6+MR5hA4GXiqcpfcqV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758096927; c=relaxed/simple;
	bh=jK8QSZ1UJGxJYMmNyDzjSwNQppnwplVbWr6MVQwybrk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JHsdaE4l/1Db2mXG76aw/HF35gPinaTB5o1XrjslHMsKPmNiMLMu30UQcsdEIW/4VSn+s+FbOlkiSwR9XijbqW4IsREtGG1c5NxPFlmS6/YkKbMl0nzFMnmUvykbaCI5w4Q0iWkSp/CmhfiUxgq+3jFDj53v16yO9nLfWy6LJZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fQ4PpSUj; arc=fail smtp.client-ip=40.107.162.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkPBBGTWzZXjDsDjkBjgEBZxnbdLFfngUznBs1oLcMAsirbUA67dwkCCtOx/xv1CLf4+xUYgG1pbyqnJXHsR0YRYgxxAG18Kac6btXW3drotslrajXhZ4KDl0tkkBHEi4LvjCfuh2mnMOLF8WMudpMqmhejjo+ByAeAjP/Uw/ivYthK689Owtyzk3hkZq7j18yPcL9fgp5XtEVWjr9TdMqCVa7TSpPDFuXSJOlAbRvil07aZ38OoGJMKoP2OnZkM3c0Umu8G9Fc9FcorTiQV0BzmzPkKdWcOO2Ab4fitd7PL0hqroqp2fOkf2Pq7EKNKgsY9ZC/Q4hlNoDnU4Blf3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSFXGM2PTO9Y7faZ0n1YF8QwroVHi4KLvJgrkJ9bxh0=;
 b=EuxrA6sjFKZgXWSB/k5avKL/wQOFdNC0b2/EtDt9ER6uNtzKgoBZLrzYkkYc6tjA4KHb/zsPrVO0tm+xEZ2nzJDtJYDWO/64Z/aBrpkA4UjxM9+l5Cr8cCcAednJjm+jMT9r3Uq3KGm3b9mhsh/vs4A+nO8Jq4LKQdNRe8SK+IZIfYNMY68ok0gC2LB/5YEO0fZOdfvuuC1csAP1THN99qFjmP/72jEWsGFHMx/hilI45A5s3aGXJPyGMNp/40HT6+TT+CwKEuRo32oiSdAzEcgmWJp7Q62Yt2ZFN49AcTupo3QinxF+SxJGx3gB1Y6Y2o1UgELmJTDiuTIDAS9SOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSFXGM2PTO9Y7faZ0n1YF8QwroVHi4KLvJgrkJ9bxh0=;
 b=fQ4PpSUjF/exCM6ntIyR8uwUcco6uSS9CKt8jjkp2GobmXoBCcg11tH4Jw97xmiAITVlL2Oy71lNWsGyT2rRe1htoBvkQPbwDzw6/XB8mlDQTJjrvdXngLkjColSI8eYyr68BwRSI/q3K88YAQg5O68uAaVckCkZuaNjt33HxtGBZsDrDIjWiFF07pia/bkPd6JBlbRrIFA+jheOSjL10NqTFpYIHxpAmPUDTNL48WIwhj24A90XMA9ffXxu+avdd11pdfBYGp664EelFdQFN+YodIbwG6ojZVHmlBVKeUkieqILGW+j5/+cmnbSjuZgJTCHU6hBNDgROu8n2gjfSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU4PR04MB10958.eurprd04.prod.outlook.com (2603:10a6:10:581::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Wed, 17 Sep
 2025 08:15:23 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%7]) with mapi id 15.20.9137.010; Wed, 17 Sep 2025
 08:15:23 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 17 Sep 2025 16:14:50 +0800
Subject: [PATCH v6 1/5] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-csi2_imx8ulp-v6-1-23a355982eff@nxp.com>
References: <20250917-csi2_imx8ulp-v6-0-23a355982eff@nxp.com>
In-Reply-To: <20250917-csi2_imx8ulp-v6-0-23a355982eff@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758096930; l=2839;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=X+EAhFXQ7Jpe8+p2hEKOi7COYMv9aDN/m0FBXFZH3O8=;
 b=Cs4Bu/bmT3EY9tKx0WWAe+vZIEyeo9zwd3j3oV+87uyZHiOYZwnnjPUYT9FyRnhhnhFmP8Szf
 LOo0id9YSKpBV+ztlxVhHsMWptmcYSatb+GUP7ARWK9r4qULriYDlii
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::8)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DU4PR04MB10958:EE_
X-MS-Office365-Filtering-Correlation-Id: 6da7fd26-1a67-433e-f071-08ddf5c2597a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?c0lxK25SZkRaQzM1ekl6c3pZSEVEd0VHdzZ1MzdGRCtUNHRUbXcxSmJxL0dp?=
 =?utf-8?B?VkxRTWp5Z1JLRFhuM3BWNzFxUzNZSG1oUnBxWlZKVjRHblZqVmNlYjNCcHlx?=
 =?utf-8?B?aVFHUjZsR3JwK3YzRzF2a00zT1k2RW5VVlRzTk9XcytxUEJFSUtvUHVJdnE2?=
 =?utf-8?B?ZVpGc2ZhTGJtME5ZNFBRenBrZll6cmlDbnFaMHJKa0ZEUkw2Rng4eEY2NUh2?=
 =?utf-8?B?MEZaUWdWTkNUUHVhZWFxU0lDamhiRW5peUp1ZGxQbk1jeWdJQmNlMEdBU3ZT?=
 =?utf-8?B?NHRvMVFMbzhIdDdjNElYajVBRmxWOU84cVNFRG9aTDRuTjduUG8zeldaeTQ3?=
 =?utf-8?B?WmVrMlhiVmVTcU5aVWxldHBoVjZkZHk4N1FTNE9vZWMrTGR4U2xZWFdqd1RW?=
 =?utf-8?B?djMvbjdHZXNGYWl6UXZBdm9acDVLT1pqeEhNbnhmR2VRS1NTRTFlSFpLbmky?=
 =?utf-8?B?bnkrYXhXTDVmZms4V2xFbkFSWGo2V3VURFkzWGhaMy96RmtjRXFwNHdpUnlI?=
 =?utf-8?B?by9NS1c1eEN5UVJXMDhZV2NpWnUwOHFrN0dHSzJwMUQrWC9KK3BkNzNXRkNz?=
 =?utf-8?B?T2hBUlU4cmIraHZtZHBXTCs0eXBRdE1ieWgvRmhQUEZXdU9tNkdlTkVpbTB3?=
 =?utf-8?B?YThvUnRtQlpEcjY0ekEzdE1GamN3TmxZWVRtdzc0a0I0ODArNTlZM1FXSThy?=
 =?utf-8?B?RWppeVFFUVVzNndSTUk4dGlrVEFPSEEyTGg5a3NxOHYvYzkwNEg0T2FWbCtn?=
 =?utf-8?B?NzRPOVUxaUtVYW1zSVZPZW9sczdWVW9sK0NvejN2elBoekptRjhHZTJzY0la?=
 =?utf-8?B?WHkzUWFkZ0dMWnl3dmc1MHNUMmJTbzBwYmdOUlB1Vzk4NG1LUE8zbGUrc3Bp?=
 =?utf-8?B?bm1vOXk5SXhVMkh6SU1CVmM3amExQm85dGxpVFVKU296ODZmWFR4RXplWktL?=
 =?utf-8?B?OXpZQkErSjRRYU5adkxpSnJUZENkUVU4YlNWc29MZ1ZadnJKSDhHUVlER2VC?=
 =?utf-8?B?R1NkZmNaK1E4RkNZVHJaSkcySXJaNHJ1bWVEVlRyamdTVHRWaVkzcU1rV3R2?=
 =?utf-8?B?RUlrWkpuQ3V3Y09seWtyV2NXWkUzOFBWTmtXcFFhQWFtMVh4WDhZdGIybjVF?=
 =?utf-8?B?Y3hXNlhLTmxYZTVrbEM4L0pjMXE2blFNMWZNdmhvWmpyVjVScmI2bDRIRldE?=
 =?utf-8?B?d3A5a2RGckJrMmNiNWEwQW0wTzVrMENZZGRrU1hoY1lTNlNxOUJ3dmpYK2NL?=
 =?utf-8?B?T0JERmNUMjgwd05DMmUvMmpWVENpbCtMeld0VG5rM3h2TnhMVThVVDhXcWlG?=
 =?utf-8?B?ZUFRVlVndXNNMllqeXArd1B4L0pTVGhPOWVrcjZ0aExlZnhncnIrUmZ4ZTBD?=
 =?utf-8?B?TUZIQ0FVRXhscVhpaTQxWTMyMzR0NmRrSEJYSjFPZnRSRGF0MlBNSENlZ01q?=
 =?utf-8?B?aUdqZ2YvRStiQWRJVWNTZFJ0cit3NEx0eS9NMjJycGd1d2hhUlBmbHJlSmlX?=
 =?utf-8?B?a0ViNm1hQ3FpekZrTXlYNGk1VlZHZWRZakVpd1RmNU1odGF2YXFBTS83bVBV?=
 =?utf-8?B?eWNZSit6STNZSzRmL2RweFBkNTVWMHRMUGdnU05sbG9DRHlXNFZQWk9rWDVP?=
 =?utf-8?B?RFBTTzJTUHMySTAzZ2wxYmk3ZXlxdERwcFhRV1d1elBzOGlYZUZSSXJVT0Ji?=
 =?utf-8?B?Y0p3OFE1eXgrbmcwVVU5Y3ZUZnJtWU15bzU4b3JPS2ZNV2xxSjhOSHg0RVZj?=
 =?utf-8?B?aUdjdC8zWmtlcWdDa1E1Y0FLSVRscEE1andRWmNhWmtHNFhNbnFiaWFIWlhK?=
 =?utf-8?B?Rm85Nk51V3lGV01zajRsbkZFeG8xNTN6UEJqd2Y3MmQ4VFhPWU5CNUxKQmZv?=
 =?utf-8?B?dGxDUWpxUDZOcEJqS052NXlVSCtuRlk0UGxJeVJMMzJRdVVJUmRueld0YWc3?=
 =?utf-8?B?MFdWTjhka3pJNTA4ckRMYTFuSXBzaWRROFVLY1lwbFpSRG8wZjZTb1l0OEt6?=
 =?utf-8?Q?pLmkBSuvGZ5zvjlu6dU1rmfi2/Rf9Q=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?OW1odnVqNlJkWkw4d0lRVGxteSt5c3JzWUJJQUlQeVdzNTVUdHVTYnd6djZ5?=
 =?utf-8?B?ank3dUk0SUtnQ0pNY2RNaC9LZ1ZHN0lGM0R3M0lKMTk4WnJ5Sm9IclIvS2J2?=
 =?utf-8?B?MldSZTIyT0Rsb0ltZlJ6a1o4QjR0dVdSeCthTlUwQnhGWDlFcFpNN1VJQVNZ?=
 =?utf-8?B?ZkVNMEt5d1pOcW12dS9GREVjOGdwSkVXQ01RRkJPSE1jUHhCK2srRUhUUmRW?=
 =?utf-8?B?VVprV3p0RmwrTzFMYjVoeWNDUVN6OThROGJOeVN4MUtKdWx6TFdxczJqZnB3?=
 =?utf-8?B?N0dWNk04V1BmZXZxMWdyT1JRRkVFZXNSN3hqZlc5U3hNSFVPb1FmcFhhd1lN?=
 =?utf-8?B?eUJWdzVNYXl0cWN1ejB1WUpLMHBEOHhvay9vaVdUa015Z3NJQ01MTndmLzNC?=
 =?utf-8?B?K2IzR0JPdW0vcFY2ZVlRcC83MGIrZnE4RGpvbUsxRzYvdHovd2hqWFRpNG5q?=
 =?utf-8?B?TEptaXpwS21LRlR4N0NJQ3lGOFlUY2srVUpTWXVYT3JRb1VtUUQ3dzJlTzRk?=
 =?utf-8?B?K0d6cXFpbEYwQzhlUmt0Tk1kNXVJT3oxSDEyNVdSMDdVTTEyNnI5clJiZ3dk?=
 =?utf-8?B?NjUvVW5QNjVDaFRNNzJBMld2dEdvTzhvcTc3ODU3N0sxeGV3T2YvTEJkaU9P?=
 =?utf-8?B?Ym56cjJ4QUtQaW1TQmhvOXFieXRLenZoRFlKRmtzNHlTZk5mKzJ3NklvOUpB?=
 =?utf-8?B?elRVMlJLKzB4UXhkTWJZV25uczM5RThZOHZJU2FFa1p0WmpNRFNNR1IzaG9Q?=
 =?utf-8?B?Wm5PRWFGS3FYNWpiMEQ3Mk5KTkYyamV2ZVY0NW9WMC9JYTROeTFza3R3eGph?=
 =?utf-8?B?UU1JVkkzdE0waE80c3pZRmVIellJb0l1T3RBQlJWaFhBMXFib05YM2dJN0xw?=
 =?utf-8?B?TjlkRzlZUHpuSmFjbFJNTm82TEU5bTVCNU5KMHlYVGtNMlVmWlFxcjFBZGpi?=
 =?utf-8?B?NUZyRWt0c1hFMjc5RXdPZTNrZ1dVWVIwTzM2cWpxYWRXN0lOVU0zU21HdHI1?=
 =?utf-8?B?QlRia0Nob0xudUM4K2ZpYkIxOXoxVGFCMjZIeUtCZEtLTGtKbFFIZXlyUDl3?=
 =?utf-8?B?d2NDdGVtQmE1WmxOZE45L2xrY2dtVS9aVkF2dkpMUWJEZGJ3RGRZNWhKM1U5?=
 =?utf-8?B?Qk9NM2dIVU5GSGQwNGhRQUlUczlEV05TNlhRNmxVSzljajlOQlVMdnI5Vjho?=
 =?utf-8?B?UG52M1YrTFlKeW80WEpRKzR5S25jeks2eXF0L24vUDViRnhic1RDV2dUc2Nn?=
 =?utf-8?B?akRxbll0SXBDcHVHQXNXWTFwL3pKajIxRTZyYnByTXpLT0MyQ2pEMWtWSStp?=
 =?utf-8?B?Z1pZeXdQUlg5clAra0syemdXdlluU283QlRkTjIxeit4Zi9rMzBmVHlLSUN4?=
 =?utf-8?B?Y0pZQTNGb0JxT01lN2RZbjlnQVh3SkNZK2ZxbFNmdllGdmx3VEVlaitvVFpY?=
 =?utf-8?B?UitJRDJ5NFZPdHpGb1hrbWVMY280TXk1ZEFNV1QxU1Zkd1RoNXc4cWZLdjdJ?=
 =?utf-8?B?UkpFUjdyR2VTVnhoTHd0YzYwRmppL3MwbXRkdFZaMGlSWmI4bm50VUptR1FH?=
 =?utf-8?B?MGxBb0FXNXRpWWtrYkkveHovTXpEUmhOSEJ5VjUrdytLK2VpdklGWHovYUxv?=
 =?utf-8?B?TUFlazZUWm9RNGpzTUFFb3IvczAwa0cvZXhoRVBDSmYzVm5NbE1OUWdMNlUr?=
 =?utf-8?B?QnIwMGlDcWtRTzZFR2hibFkyam9USXpIQ2FHSEVzTkF2eG9wZTZQcldob1F5?=
 =?utf-8?B?TEJnWlVMQ1hmZlQ0VWdJQy83OTN0UGNFclJPODNLbkNFWjFGRDE4WVl2R25X?=
 =?utf-8?B?K0x3aUxCeGc3TFVEaDVvMWJlU21pazhhbEtkZWowUzE1MkxEMkJxaGpjVjZl?=
 =?utf-8?B?bnBMci9yRDNUZFRVWTNFWjRWZUtlTzh4RkZLMmRreVJDc1pITk10cVFueE51?=
 =?utf-8?B?WDNudFN6ZlZudzR4aDh5dkNPMmd6NGtNYTh0bExEQS9tQW5taVhUZjkwRVJk?=
 =?utf-8?B?REZIdFlUY2Y0YU5kYmZ1YVdkTm1zb0xNSlV2dWNqRy9Id2JhQlBQS24zNy8x?=
 =?utf-8?B?OXZCNEoweUExdFNRaGVubEdYTFF1U2FxZzFDeVoxdWVHYU9uTmpSaEJtVUJX?=
 =?utf-8?Q?65pvPD8OHqWMo9O+RkMVqXmxt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da7fd26-1a67-433e-f071-08ddf5c2597a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 08:15:23.2500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9pkBc+cfKc8e47gzWMm5xjPpv+TIKTZf44TKrfY4o8YRWBtReW/aT2HUtEVxcLNgiaw73vjlY9gq2BN+sAdxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10958

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The CSI-2 receiver in the i.MX8ULP is almost identical to the version
present in the i.MX8QXP/QM, but i.MX8ULP CSI-2 controller needs pclk
clock as the input clock for its APB interface of Control and Status
register(CSR). So add compatible string fsl,imx8ulp-mipi-csi2 and
increase maxItems of Clocks (clock-names) to 4 from 3.  And keep the
same restriction for existing compatible.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 41 ++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
index 3389bab266a9adbda313c8ad795b998641df12f3..da3978da1cab75292ada3f24837443f7f4ab6418 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - fsl,imx8mq-mipi-csi2
           - fsl,imx8qxp-mipi-csi2
+          - fsl,imx8ulp-mipi-csi2
       - items:
           - const: fsl,imx8qm-mipi-csi2
           - const: fsl,imx8qxp-mipi-csi2
@@ -39,12 +40,16 @@ properties:
                      clock that the RX DPHY receives.
       - description: ui is the pixel clock (phy_ref up to 333Mhz).
                      See the reference manual for details.
+      - description: pclk is clock for csr APB interface.
+    minItems: 3
 
   clock-names:
     items:
       - const: core
       - const: esc
       - const: ui
+      - const: pclk
+    minItems: 3
 
   power-domains:
     maxItems: 1
@@ -130,19 +135,51 @@ allOf:
         compatible:
           contains:
             enum:
-              - fsl,imx8qxp-mipi-csi2
+              - fsl,imx8ulp-mipi-csi2
+    then:
+      properties:
+        reg:
+          minItems: 2
+        resets:
+          minItems: 2
+          maxItems: 2
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8qxp-mipi-csi2
     then:
       properties:
         reg:
           minItems: 2
         resets:
           maxItems: 1
-    else:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8mq-mipi-csi2
+    then:
       properties:
         reg:
           maxItems: 1
         resets:
           minItems: 3
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
       required:
         - fsl,mipi-phy-gpr
 

-- 
2.34.1


