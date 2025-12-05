Return-Path: <linux-media+bounces-48303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C77CA6E29
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 10:23:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D633F302111D
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 09:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0E52FD68A;
	Fri,  5 Dec 2025 09:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="J66Hr3E1"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013039.outbound.protection.outlook.com [40.107.159.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4ED2F6912;
	Fri,  5 Dec 2025 09:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764925644; cv=fail; b=pA8FHnyO0/w+NhPXXmaLfX3X1ptWZRMXukB4FWJ7YMoXh3Jv7g4hSZin7zIPK17AOgJzSP5b30cUxHG7iHONOetQwxkLG3OO7h7X16urc3WaStNF/tBsxbyCvWC0misBL6+A0zfOZohqavfWwyXWcmATJpnHXOTK93iir4VEXmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764925644; c=relaxed/simple;
	bh=W8mh5VJhs2WtX/khA75rrUxV4yrFh3tRjoJO3W0uMlI=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=iI9dwBhd1aTKzI2CPMS8BIoXoX+y2HMnMMcWEw7XVWwYT0GqhjS0vM4TAIETTj+gS7BcCtmZ+IIwmisbtsP87FOUoDU2IHawPpxelEccYR8D2RCABonScW8eRIrM1ZeSrTaZo5GFS49xQmHQmRtFkCnEd3Z5lMdX2SkD+3y+CaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=J66Hr3E1; arc=fail smtp.client-ip=40.107.159.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9je1JlwX9j1laQ17hNXypsdkkpk9CXGBcvfpYoc0PZjFs+UrKH38u0cT08AQQSgg+3CfqZN6Ch8hrz4ZhBnrX2+c0fYMZCD8b7VN2TBP8IDc3L43lG/+r6U7HEl1ziwIf/njG0rzJ8A/EYB3M4/YHXQCcwaArfWft4bAutTg32H5442bjCoHkPeW9TAXwFs734RK+h5+2eYCUtzahNJ0AIFUiHBSjsX+neB2z5EXT6TtYBEOd6Rv90Cz9wDi54QMUoXD4wTVqzVmrYR4ZbbpXOvZeP4eU2wUGMwVNEV9Kax+xq8nu7a/8Pr5CDk+ZuVSyfyQqMJo4t0EugJEskMag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UyEhkZYI2IOhJ6RCtQEDuEs8W64TNrsRp/pnYcahyXg=;
 b=t9gyWyGi8DxvEk7LjKM383v+Nx1Ydx5X1y++WGoRUpA68fnM9pDm9nxK/y32re8+5jOIaLGORqw5hzBPsvQZZsRMb/GGcdrZj+EzKpF6+4BuLCbJoXsc0LnZqhcJwHDhIR+cG5wAZ31Cmv5E91gZYzygVkjjwJlfWfuzAhtFA21AkfvHOsFs0k9z1Jhr2+AuYxleDc5DUJZ0C+vW9cYh1RrdZ061AmtQJpv5hY0j96EEzHtdODjbU04AcENKqvR7jBhlWgmwqP+7NWu5RQa4rUxKAzrGeSCEwnCd+Ey2HHtRX9gGc0OaGcajqsW25v7Wf2/RrSAJ5hltw14pSKkDHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyEhkZYI2IOhJ6RCtQEDuEs8W64TNrsRp/pnYcahyXg=;
 b=J66Hr3E1VoeTCvvZ9kwZmVSZWepGSEK+osVcNzuaXcCHKsTrh/7TJHhynDeL/39/kfNQiHyhIzalj277x+kYNDSUzVCDImoOwagTl/47N/kwdIHf8Mkr9y30fWW1vVfCeBkdCoP8wrTP4iGEZXs7ZNHwmUUO3gwLe7Eyma5s53ZfpkEcvJudno1gBJDM/6WIFcQZL1JGWQJVHHlObY+KVmtRlH3/txE4EkDW4DH51pSvevmMjjUhb25335+JH3GiNSC/lJUPKkTyFGsaiwkGwrmLC5pKYjnUi/mUSTSInaznWGC43SgNfVteatsNjAj6qOxoxZvVj1kwl4ZUGh3c0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GVXPR04MB11042.eurprd04.prod.outlook.com (2603:10a6:150:21f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 5 Dec
 2025 09:07:06 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 09:07:06 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v10 0/5] Add MIPI CSI-2 support for i.MX8ULP
Date: Fri, 05 Dec 2025 17:07:42 +0800
Message-Id: <20251205-csi2_imx8ulp-v10-0-190cdadb20a3@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN6gMmkC/13RTW7DIBAF4KtEXhcLhv+uco+qqsCGGKkxlomtt
 FHuXhy1jWE5oO/xRtya5ObgUvN6uDWzW0MKccwDwS+HphvMeHIo9PmgAQwcK6JRlwJ8hPNVLZ8
 T0r2lSvS9sL1vMplm58P1kff2nmc/xzO6DLMz+xDYgoC2BBNNGUcEnZY4hqX9HuJyjCm143Vqu
 3jeIoeQLnH+ejRcYQv+jQEou6yAMAJhGGNUMy348S9la7LSPeUVpZlSrhQ31giwXUnZnqqKskw
 NeC0t4dZqVVL+pBqTivJMhdSC9YRJ4mlJxY4SWVGx7UoN5VwrcN6XVP5TgoFWVGbKXWfzJ3ROa
 ltS9aSE1FRtrzrrqFRe5vuS6h2FeledKeaWEau0dBw/6f1+/wHZdHc9hwIAAA==
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
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764925695; l=3965;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=W8mh5VJhs2WtX/khA75rrUxV4yrFh3tRjoJO3W0uMlI=;
 b=M9QTYYn4+g5/NIMigcjDDkfUt6C/kUXsjP8lfEYz9jW+MCnD7xsFOi0KRSE5na/XxQFRjqC1C
 PiO763SNob3CHz9zfg8n9Hp72NmA83mSjrUIcR/V0Qq7Ydeh7x6/w6S
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0058.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::9) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GVXPR04MB11042:EE_
X-MS-Office365-Filtering-Correlation-Id: 770e6d24-62e7-4b14-002d-08de33dda9f1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|52116014|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?bHlHQlJINUZRVW11MzEyd0xKVEEzZ1RaL0p1OGU0NTVIeVZTU29jc3MvK202?=
 =?utf-8?B?cGZ5b0NnQlJyQVRMNlRGR0VjMURDMG9yaEYyeUViT3RIaXpDeUFiaHlIVk1R?=
 =?utf-8?B?K0Q5VXBmbnl2ZXRLQWdPeFRMeFg4eFNJZ1lLOE9kK3FyRTFYTzd5SEFSdnRB?=
 =?utf-8?B?V09XUWhrMURETkpnbTM3T2g2Y05ZdmttcThSVUQwWStrU053VDlaMVpkTFVR?=
 =?utf-8?B?TlViUEdUckZTRllUVXhJWFQ4RVRYNnpvZE90VTBXU1RiQlE0ck1BN0kxYzBL?=
 =?utf-8?B?SmV1MW5jUnlSSTUzNWY4YmtjdkhYUjJpbnVMU2RvTnNMRWJCcXNlazVkemE4?=
 =?utf-8?B?OC9MY3owTlRvd2p1NkhJTWQ1UFRxMno4TlRldGJuMTVtS05weUV6S3QxV0RS?=
 =?utf-8?B?dCtlTjk5Y2dPRUZGWi9tRnV2OFZPUVJJVzA2WFZyS3huajFXcGhhbjdBZjhU?=
 =?utf-8?B?MFYxclVHSHZXeDM2bGFlMm1LeTRvNCszV3d0bjlTR2F6dWRUTWI5d095U3Rz?=
 =?utf-8?B?TWREZ3g4QWhQWFFPMUFWK3hoRVlRTlhRVUxRcUp2YWVTbEN1K28ySjFZSmtG?=
 =?utf-8?B?MURXa1NIUEhINlZqZjYwR2Yrc3ZucjQvRTBSVWY0clp5bWVSaEVjaloyTU9N?=
 =?utf-8?B?NGdvdUNkSTd4Z0xTYUcvOVVsM2xnRzB2L3FETjZxUCtsdjhxTzlKNjFXTXlQ?=
 =?utf-8?B?ZVdqR0hmYW9lZDVDUDhYeUdhd3B5YURldXlidTJVMmQ2Wk9vUWkzQnpIc2wx?=
 =?utf-8?B?dElXaEhaQVp2Y0lNZm0yVnE5ZWpNYjl3dXlhL2xrZ0cyemZLbU4rRCtPaGl3?=
 =?utf-8?B?dEF5Y2RUc2RaMmhFZjRpZmNocE5zK1Z4bVR1Y0liLytSUmlXTmlDNldrTThO?=
 =?utf-8?B?ZEFodEc0SVpDWW1ZcVFjUGE3bFlaWGlMeGs3NHFKR1R5bGxyR3VTSml1NE1y?=
 =?utf-8?B?YlFCZXhMckdxRGlNbXBOVmdBY0lRZEd6bnppNVlXR3k3NTM2UzJTZlIrK2pj?=
 =?utf-8?B?Q3hnVXk2MDlpcFJsYUVReFFzRTZHWFo5N3lsRzYxdzdIMTRlTlpLaU5xeDJu?=
 =?utf-8?B?eFY2aXhpKzBCVzFFYW5vRTl3UzNVTXZXcGZPdHhjUE90ZTBncDlidlNlLzdP?=
 =?utf-8?B?cDd1RDZNOW93Q05FSUE4Tk84aDZ6OGdES2U4Z21BYkNUSW1PK3VlUUxGR010?=
 =?utf-8?B?aFEvTzlrYlpSUHI2M0d4cmRSRWRXRzhSZVJaOW16U3NqSVM1T1ltNHVFQTQ4?=
 =?utf-8?B?RkpFeGp4QnpqcnArNUxncUIydjdSYXZiNG43bGsvV3hNSGZBZVd5Nm5sbDJl?=
 =?utf-8?B?OHpZQXM4ODBPWDJLSFc3dHVLb0FtSUgvQWpZNTFxMmFnM2VseWphNFpjelJi?=
 =?utf-8?B?VzJYUDZTempMMmVCZUdXSzVrT25FKy9mU3dtNE9mQTVlcjlkOUhWeXNiN3pl?=
 =?utf-8?B?dWtXd2JrTDdhbnBYSW03VnFNQWQvek90d3ZnMzF6RTFPTEdJUXpwOWhGZEZk?=
 =?utf-8?B?Tk5lK09PekorN3RaRmpGVjhBYmNCZUJKeUxjTmt1cEcwVDROd3pvT2FhTVJp?=
 =?utf-8?B?VkJSUmt5M08ybVF0YjBhM29JRHMybkVISkU0R2JDWGtlbEtHYS9uMlJxRVJH?=
 =?utf-8?B?VkRzVWVPZ2NjN3VqL3JqVFUxV2c1d3lFeUd4REtvcGU1SFdZQldnTk45anJI?=
 =?utf-8?B?Q0tGTWdBUVRKU1V2SjloOFRZa1VjZTJJZ2hOVkhoWDM1OXcxZkZTWkFldGph?=
 =?utf-8?B?NTJGdFdab1UzVSt3bndCS0tnVnJMOUM4b1RRTDB4ZE0reXVabkx5d2doSHhT?=
 =?utf-8?B?R2F4N1lUMHgzQ1pZQ09WT002bEtZRWpPazZibDUrYUh1ajRpSWQ0ZVJXYkdE?=
 =?utf-8?B?QWRqQWRSVnpqeGtYcDhYT0ZxMDZvc0JjRWl2M2hBSk5HeEZ5N1dJS2ovOE1Z?=
 =?utf-8?B?c1VLSU43T0R6QmNaM3ZKRFRBMngraDBOWEt2NkdKTllBTTRLN3Q5Z2E2MElm?=
 =?utf-8?B?NkxyZVdzUElhQlNaTjFIZ2pPTVRjM0p5a3lvQTBzR29HZlRydG9neHFmbkV4?=
 =?utf-8?B?V3NKd1VvT0srU1p3OXdKY2kwRnBJN1l6bmN2dz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(19092799006)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WTZ1R1E3L0pLZFZBNkdOTm01NFdpemtjQnQrOUw1bk1NQllEbGpPQWlYVHd5?=
 =?utf-8?B?a2czM01pbUtROVlqWVhjcVFrbzRQelp5b3drTHRmWEdZWUF6bExMN3NVUnhm?=
 =?utf-8?B?TVVEVDVMbDNPU1FFM1hQN1V3RU9VSHdLUEthRlZtdVJTNHpkN21iT29FMi9X?=
 =?utf-8?B?ZUEyMDlWcWhvQnlNUElwMDdvMHFURHlZR2Y5Slg2RnB5blZqSjZkWGorU01z?=
 =?utf-8?B?SEhuUmN5MWUwQ05SZnhuWnpCL3YrR2IwVWNKNmtxRkFHdHZMQ0dGTElDRjdo?=
 =?utf-8?B?c3pFVmlQNWZKOE5QbUJ0T3JkY0d6L1ViSHpVa0ZHeGNJaXMrNmt2N29RTEgx?=
 =?utf-8?B?Z3NVM0t2ZVo2TzRpdnZYRG5qc0xYVERucWpVaVN6a0RBWCs2QlZPWDNvbWFY?=
 =?utf-8?B?TUoyT29hUjVJbnNuRVNOSUhHTFd3bTJXVW90Q3dKUGExMnIwZlByZ0o0SGVF?=
 =?utf-8?B?VWtXMXpPMndwdE43bFRlakdZaDFSN0wvTEc0b3JZMGUxTWY1c0w4VEZodVZZ?=
 =?utf-8?B?OUViYXBVV0VBVnJReU1MZmhKS0xMODRGRysvVlVoM0RRRzNIb0hrNmJHUzg0?=
 =?utf-8?B?eEdLNVl1MW8xT3R2aHBrcXVtN2FzeG96Zmo1MUpvWUN6RXZMa1BVR2JHK3JC?=
 =?utf-8?B?ZTcwLzZpRHFuV3Q3dnlsVjVVYmcwWjdTNmtOcys2Qld4dE03aWM4aENLS2hV?=
 =?utf-8?B?b0x0OXNhMGdzUzJRUHNIRW8xeldsd09YUzRPSi96Tk5BemZUWXBHWjVWMVdQ?=
 =?utf-8?B?bnhEZEF0cU5zcFZ0NEptdFpaK2paTU83Y0M2RnVJMm16NjFncFA2Ukd6a2k4?=
 =?utf-8?B?YmdBdk5Md1AyOW1xSEdvK0tOZEVpNlRSdTdTckU2d0htNHVKMkFyNC9HSVZs?=
 =?utf-8?B?THhkT3ZWVXl3Q3U2RlFCcnp2OGJ1djlBN3FrTGpkUmphQVVZWFZ3UGlkeWE0?=
 =?utf-8?B?M3JkUmY5MzE3YmVQTHlPcG9VNCtoUUV3UHg2THpTQ1RBVzdTdEp1Uzc3WVRL?=
 =?utf-8?B?bXYrS1o1SEhMUmRORzVTNlNwQjVLdlkzVUdqZmRxaTkyS2VTcGZBRmxlWWQw?=
 =?utf-8?B?Y2EwMy9KU1dJdUN2bUh0Ymc5WkNBZEsrTEgyQjdSMHpBR2ZlNmZoYkd5TTg4?=
 =?utf-8?B?WlZxQ0t2a0MzbDFWcmpxRTFBUEZBRDBRcGpvL1E4S3U4QXg5SjQvWmQ1ck94?=
 =?utf-8?B?K3ZGOHlIMExDaFJTdUx5SlN1WDhjOTUvNmU1d08vMUhIK0U1bThvcGZpNEJo?=
 =?utf-8?B?WDQvNEJSTkVsdGRYM2ltYndOSVY1NmJlQjNxaVhFTHhJNUgvUDB0aFFSUXJC?=
 =?utf-8?B?dkZEd0tkSzE4dWxPc0hhVWhQYzdqTDJOWEhBS2xENCs0RVp2ZFdnMmJQYU5z?=
 =?utf-8?B?akpXdktQYkp5OHFlUGFza0FKY1drMy9iOFJKREN5NmpUTjdsZXVFbGhMUlBE?=
 =?utf-8?B?RHBkV2tScy9MOWRRckk2ZU1zWGhabjA3dm5WUXVqaHpnMU9oTHFaMWZTNllL?=
 =?utf-8?B?Sjg3bUxqc3FmNWpXRmhCTU5pK2U1NmphQmExdmFTeEVTeVA5cWZlb0ZtUTQx?=
 =?utf-8?B?Ni9HdUl0dmJ3SVdBWk5LME9La0d5aWNOTXc5ZEVQRFlBQXRINzBkbzIvUnVr?=
 =?utf-8?B?UkFsTTRUOUpONXdGek51NXl1SHFIZjI2cS9tamZaWDZPRVhQcndTYnNaUUxa?=
 =?utf-8?B?aU1Od2NKWitkMDdleXI4SXExNnNxbXZFVitudVVZdVNFZm5RMlJuTmhQeWg5?=
 =?utf-8?B?QXlxWkpaUHM0ZUwySk1lblZ2NGJqam1qWmEyWXBacUdNZU54MmllZ0w4Szd0?=
 =?utf-8?B?Uy81K2I5RWs4elVMMTVwZ01hY1ViNzhHdW14THl5bVlna1FRWmNtS2RBUlha?=
 =?utf-8?B?dmxqU2VQMVBZb0hKZk5kWkZMbkNSSVBIcFlqeUVTdWFqSU5Kd3FzS29VOGRz?=
 =?utf-8?B?YmZGb2xVQS9aMHhCS0phNEE4Lyt2c3JmZEdFSzh2VGJ3ektUNlAraVJDS2lu?=
 =?utf-8?B?SE1RcFk5aEdRbC9WbTVrZEFBYjJjYVBuWFREN0FtOTkrWjNwczl6aEQyQXZ3?=
 =?utf-8?B?UG5pZzROb2Fqc2VMeDJaTGVRbkp0YmkyNDZBOUU5cG5tTHIwRDFxSkdKSkFu?=
 =?utf-8?Q?w7h9brSqp3/N4EDYkvGuLnGip?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 770e6d24-62e7-4b14-002d-08de33dda9f1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 09:07:06.7410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kKycPufb1/DBk2J49hPSU/YulQnmpM2TFwlWU7Bm9VC3qEOytibQhHlR9EkWGgy/k0wKVbeZbjbhTj4VE8ebVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11042

The serial adds MIPI CSI-2 support for i.MX8ULP.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v10:
- Make state->num_clks unsigned as suggested in bellow instead of making i signed.
  https://lore.kernel.org/linux-media/20251121024714.GD11519@pendragon.ideasonboard.com/
  media: imx8mq-mipi-csi2: Use devm_clk_bulk_get_all() to fetch clocks
- Rebased on latest media/next.
- Link to v9: https://lore.kernel.org/r/20251121-csi2_imx8ulp-v9-0-05b41b897e50@nxp.com

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
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      | 64 ++++++++-------------
 3 files changed, 133 insertions(+), 47 deletions(-)
---
base-commit: 1f2353f5a1af995efbf7bea44341aa0d03460b28
change-id: 20250819-csi2_imx8ulp-9db386dd6bdf

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


