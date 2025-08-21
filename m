Return-Path: <linux-media+bounces-40668-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E219B305D1
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DB2F1BA31F9
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A3735AABA;
	Thu, 21 Aug 2025 20:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UbdMnmCw"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013049.outbound.protection.outlook.com [40.107.159.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D243135AAA9;
	Thu, 21 Aug 2025 20:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807444; cv=fail; b=OYxl8a448dpmpnL4mYSAo8XJuMQ5GxyW60ZY7snVIBQN8HnZC2GEIbkMoICOe30E6VL10DlWm8tV4g+2X52N1GkB1m8jYN5YY1k8O/Q/kMqIXfZulp/vbh0M/Hw+IFjJ0jLCMJr/JUHHUZK5Dlh4MSuC0QvPz0M2rJWi6jWxqCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807444; c=relaxed/simple;
	bh=hH7/rhTJ88NOxiRxYMd7JYvI16I4CIVL3+9vr1CK+Nc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Q++3M9oKzPGrp4Afv6DmotrOuHQj2Zc09lhMKvPtqFmhKwVl9sSF0mmPeBBsMI9b4fmtNVzP/saUCat5JYNyfDvwuCwvSpQYBCj2e4PjDJzAl4uwcUzqupQf1lb44AxdMD6jevchzeqYY+3QL3vYPCE38BRkh1hCxzGIHc6+XD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UbdMnmCw; arc=fail smtp.client-ip=40.107.159.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PEGLyZXHVEHUKtjL6Mog+IwvDxPG074gRyVzygzlp/7/mgJfNLrJKHubICDXedR3xIMSlhmtN5qhOSLyUkVgcqNuV+J+650YzgryfUhL0HxaVjSChqrB3S72iYwvC3eQzyc5ZZoadIkHpFCQhh5LCYPvtPPGuBWn7zbxwdlTbbtWe7HUEYC0wpj129y83Kv1Ts3KtlrM1BMfEJs/hc49iTwipjPOWtizGMCmCTNCEyY9AGw/DD4ENaiWOf5+uhSoiWSvAMqHcbxB+brTyxVe3mtxDuqhzSCRBdawYoeCTdfa8DC7qpBYmuyjNWvyQREEaYwQmxhRE6C3t9bSwOVt3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHynjD9WnZ1E9QTFCo3jsxZ+nUSYiBC7LKhzY6ZlN5I=;
 b=orlKVk6bPf/42mcoD+5hnOimPsac4tIvsGAz4OCZAkkw1pbWRT9VnYn7phIzsAt6SE/8wLlKMP0SvWfbTM7328NaFrXsY8Lc3zJWy+hyxZpfC5iC41zABTtNd0TArzDMTAYWxSxIry3GUsdVfYZaT8A7n0gZCgJFDADPy7gDzUYsdg2jIXfGrjROrk7BlpGg/JvZ6R+3LpXvKIQeEygSYheO/FCEgxnVLccmuPzpI2zOfvHf16de6WY4wR2UssCksfB05WPl3ArkM4kCj3B/AzHLqRWkVEjhrcZjtoTxmVJih5aZ1bunSWWLw5kuNb7HmRYoJ7qZIkz6MDTYk46Q0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHynjD9WnZ1E9QTFCo3jsxZ+nUSYiBC7LKhzY6ZlN5I=;
 b=UbdMnmCwFpHIn+bV21HCsdg/zLrA3O3rQwO9bDv+rLWajH0F61fyWwhJNChisIzC/8oWps1kFfTyrNSTwxR4VoM7xIIMO/OdbyaE8b/K3UGEmLa9OxlcamOMtzBXpa1dVlnnpoN3yqxj7UA/IShhyFv3W75Os2YPuEPFQLAo+OmHKSmp1zGiFyGFG8I86kPloXe9nqmZhS5bm/hwBV6YYuBBnM4sEtn23HD4ApnwQhMMdDQu9Ab4/jx1/aLewuywPLCM4XrtDxt9+Xa2hE/tkLnY8pNluut5wqbd6tTAIAtE8IIJH0ZCN4A5u/s7MHld7UYq5Uasd5DfwMNb/cBxLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8438.eurprd04.prod.outlook.com (2603:10a6:20b:411::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Thu, 21 Aug
 2025 20:17:17 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:17:17 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:15:46 -0400
Subject: [PATCH v3 11/31] media: staging: media: imx6-mipi-csi2: move probe
 part to imx6-csi2.c
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-11-c9286fbb34b9@nxp.com>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
In-Reply-To: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-staging@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807361; l=16267;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=hH7/rhTJ88NOxiRxYMd7JYvI16I4CIVL3+9vr1CK+Nc=;
 b=6mICnbE2lNVMYW5uK9YQc1h4dqDKIORu748t/hIeghSVPHbfIFSBmQ/bWO6bjr7Fmu094Ni0a
 g3r/XrFUBkBAfi40ugJx9goZGAqTOfVYwDspXygM3jmWJZbeN/FuJv5
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f537e42-6b26-417f-5729-08dde0efb997
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|19092799006|52116014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?QVRhOEFneCtTWGdnUkY5SVlvY3Avd1dxQkpMdU43TDdtbFJsRk54NkFYQ1Va?=
 =?utf-8?B?UmRCdnRjb0l1UzVPLzVSSm03dmNsTkpOR3NFSXh0OXFmSHlQeVpVQk9qWURG?=
 =?utf-8?B?Rm9ZZFlMTUU4S2hhWFhHc3NRTjZFeXZ2WVczajVtWm5Da2R5eHNGeEFqQVZO?=
 =?utf-8?B?QkVCc0llRFhJOXYvZ0ZKR2NDc21xdmtwVUh3ay9Ic2FlNTdqR0dOMzNVaWw5?=
 =?utf-8?B?Y1huMmVJSzRSSXVkbVQwdmJDbHVGQ0g0c1hMK0xFMVBTekNjRkd5S1NNb1dQ?=
 =?utf-8?B?MWZ6ZzQ3WXpRRGxmQThxbnhRMS9WUENjVGw4UngzUkQreWVpS1hIM2d3ZDdJ?=
 =?utf-8?B?Ny8vSnBnVS9RenVCNjNSRVhydFBQMkpSbmFMR3Z2RlVtTU5PTFBkSVpHaFVh?=
 =?utf-8?B?dHJMVWJnZFpUcUZRMlI5bUZCWFRwZzBacjd6SlZ2TVdiYm1vMkdaNTdXaE5V?=
 =?utf-8?B?ejc2Z1J1UUZ2NmNxb3FGTkJDQzY2KzFiMFlWQ3VCcXZCeGkrOFp3WGFkRzho?=
 =?utf-8?B?WkNaRllEblBucTl3MEJCRmREQTl6THZ1Ylp1enlyTkZ6T3BQWkpmY1BUejE4?=
 =?utf-8?B?eTdFbUZodU5MZGc4T3dROE5veExOUzZzc01ZdjRnK2VTU1E0a0ZXYTlzOXRV?=
 =?utf-8?B?bFE0akRkamRyUWpBYkhaTURReXhuUVk4NStWQStYTSs2dGsxWnRZZkZXOStR?=
 =?utf-8?B?SXlTdFIwdDZQT2JRbGFqQWtsY2VPVUcrTWNxeTVyK3N4ZGJCU0F4MTE5Y3RR?=
 =?utf-8?B?NThJR2lGRUsxUWJESUg4YzRFc2ZQcXVnZmNzdEdMRlpDdCs4N3FMUFpaR2kx?=
 =?utf-8?B?NndCeUtFTThMcWdNa0o5YjMvdGFZbUhzcWp4anZ0TjdiWHEreit6bThTaTZP?=
 =?utf-8?B?NWZYaUVyYU10VUM0L05Ba1lYaHI1MHYyM0JhQnlVdkNqM3hkODFnbXUrUm9Q?=
 =?utf-8?B?S3lnQUIxeko1YitwQ3BzM09QZHk2Qms5ZWpFNldSSmE4RE0vNTNjUnk5LzE0?=
 =?utf-8?B?Z1ZsTFdUY3pvVlQ0VmREeFBuWmxlM3NYZGI2UFd4d3Jya2szNjJ3QU1mK1Vy?=
 =?utf-8?B?ekVRTnREaVk5dndDOFBYWk9vdDlvMmZRVjZ6ZUE1aUhkYi81cTBrQWZhSlY1?=
 =?utf-8?B?YUJOd1hnUjFHV2VpOXdEWlk0SXVoQmFQMXNLT2Z4UElsV1EySWs0d2J3MlNs?=
 =?utf-8?B?T3RaNnlGUldHamhhWGlaR2NWejhWT01NVlFqTTE5OGRYcVl2Ym03bWFTcW80?=
 =?utf-8?B?WHpzbDlSV0ZrOEJEQlI2eWtxNUlKb2E1MEIydkZGbTJQODkwdTIvdkdVYUdz?=
 =?utf-8?B?b0R0dlRiSW5Oc0hpckpYQUk2U1pjdnEySXd3WDZ3ZkJRT1BwUWxBS1Z5MGp4?=
 =?utf-8?B?ZTlxOVRzaHp2VlkvM0JmMENHRHg0UDdsN0FuNmNCUitqLzZ1NEpVcFdMWG1O?=
 =?utf-8?B?VkhmZ0svVTM1dGJURWJHRDMyTGNwMVZXL1ZvMzJGczA3NU4yTmVhSmYyNEZw?=
 =?utf-8?B?dkRSeVVPZEoyQStRSkMxUEYrWUNZbmtXQzFKOUQrVzcybXE1V3JIQnJQMmV5?=
 =?utf-8?B?eUJZc0ZVdnNBMU42aVM3bFMrbld2RkI1YWNlY1FNQ1RvQVVZeGJWL0Zva2Yy?=
 =?utf-8?B?aVhOYUIveGVpd1FhVVFJNWdRUlhONzlRUld2LzhDNjlSamQ3TElnNWdydVk1?=
 =?utf-8?B?Rld6Y1dEMjIwTUwvbmhjYUMxRW5NYmYrZ1RpaU8zUnMwVWhVOW9iRGRXTlFk?=
 =?utf-8?B?NkIyaVgydFpRd1hxNmRzWm9LbUxXUGdlSytrRzdXTkRxYlFmOERrZ1hWV3E2?=
 =?utf-8?B?QnZDU3UrelJTMWJxU1QzRjlnZXNzY2xoazFPK2krNExjWTh5RFNKbUF6K0Rm?=
 =?utf-8?B?SW8zdGlWcVpTeFAyd1oxRUR2Zm5MbWFLL2xBb1ZKZk1nWk5nQjZrOVVuN0Zj?=
 =?utf-8?B?RE9RWHZQSVhKZFZ0aUFoVUFWTUVTTnIxcnRaRXEvU2J3SWNwYjMvVCt0SEdI?=
 =?utf-8?Q?Zad5E25NyF/F/vhxyyAHqzbiJzyMq4=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?STJiVlhNWldXZzdJYWRwNDJxUENzNGk1cFJZckROWmJHUXZlN2hFRU5OSlFk?=
 =?utf-8?B?QU1WZ25PWHNPcExvZm90cnM0bzFYNCtuUEhCSlZSSjhJYklTMVFEV0c2aUla?=
 =?utf-8?B?WkhMYlZ0R1hvWURqYk81Zk9vWm9KUi9TVG1yOHJPRzhuMU5MdG5wUzZLZ3o4?=
 =?utf-8?B?VVlnWkxpNUFMaXFLbC9EdHdZeUwxd0QxekZ4ekl1cThPblRXVlFTd3BqbFdq?=
 =?utf-8?B?OFVGQjBISFBpN1YvZEV4Q2xDK3V5d3FrN1h4b1E1VDNORWdaRk9lMnBBc25o?=
 =?utf-8?B?U3hVRlJuRE53NGt2ZnloUVA5MFlzbmRxUlNyVE16Q0JLSUVlS3hqTXNwdVk3?=
 =?utf-8?B?T1lCVnFrRmI5MVNQKzEwV3ZLODBvN0Y4VnhCOS9ZMGR1cG1vRmgzeVdDWDgx?=
 =?utf-8?B?RGkySEg4UTk5ZzkzQXZwK2tjNit3dDN1T0U0T3FRcC8xNnN1VkdzVllZeWhz?=
 =?utf-8?B?Q2thc2RYU3lPbDMzdVRPckRwdWlqeElKcE5GZEExWmwwdHVHZ3ZDaHc1d0cv?=
 =?utf-8?B?RitSUVFUVnhWa1RYelpUcmRoUFFmcmhyUlpEeHlNQ0lTRXFUQTczK2ljRDlv?=
 =?utf-8?B?ZTJNWldiY0w2ZE5vWXppcisrOHF2ajFEM045WTNSWW1vYkZweFpyTEE0VWM2?=
 =?utf-8?B?RGNMc2JnOE5Lak41T1JoNzRUMERJNm9Zazg4MkhZZ3J1SmZDdDBNOVVaOGhi?=
 =?utf-8?B?ZEVDY0FZQ0NWQnRIc05YaktOWFdWd2ZEdjlvU2tGcWVxU3BGOVlnWXVIQURC?=
 =?utf-8?B?SEVnRDk4NEM3N2RlaWlpWks4NTNpYTQvemdQd051SlhWU0xMblVZa29YQkRS?=
 =?utf-8?B?VXNyTGFJbHI1MVVPNy9qNDd4dEZYa2U1NXY1d0pZcDF1ajlCeWNEWXdUQWZZ?=
 =?utf-8?B?dnFvS0V4WEJ0ZnBRTDV4dVZITytBWXFEWFpURm5hcDNvb1JFdDBZZHNob3Nj?=
 =?utf-8?B?bXAyQUk4em55YjhpeS94UzU2VUszMm9LSjNkZ0VCMzl1NHh1OWFKREljd1BS?=
 =?utf-8?B?NXBka2pOMWJvdEZDeGtuYmZPQ3FxYytydjJWczF2QjdyektmRHZyL1JHOTBV?=
 =?utf-8?B?WEdEa3Q2VDdaL3huNWg1MitPb0hlYkNKVndSa253L1NHOCtsK1ZuOWlMMFp1?=
 =?utf-8?B?ZFZzL3RzQXM0elZiZUIvanJPQzZHc0xsME5QenhnYkV3SXo3V1dUQkNHNHJh?=
 =?utf-8?B?SG1zRDhOM0IrLzRRL3JLZjE3d1dIRXhHbTJKZnhHbjM1a0hyM1l6am9vWnky?=
 =?utf-8?B?Z3pZdzFQRWRNbDFaZVYrUCtyYURtbnpicnVKSWpMYkpSWWl1SEF6ai9rQWwx?=
 =?utf-8?B?KzZuSWtLYk9KMTg0eGN1dyt6RjZVTzRhc3VGMEZTeEhLeGVoUkk4Z2s0aFg5?=
 =?utf-8?B?UnFZb2VIcWEzby9BZU05U2UvRkpHS3BLQ2ZBY1VQbWthWnc5SkcwaXhEVmJ0?=
 =?utf-8?B?OVcwby8wMHd2L3A2dGx3UUlUMThnbXRzaDFMKzNYaU1CSjJlY1JseXpUYklk?=
 =?utf-8?B?dmR0ZFlOck94SzQ4MUpYc2ttNkhEQmxDR3JEYVY0THpXY2RXT25tOHpFT21J?=
 =?utf-8?B?QnI0b3k2WktkbG5QVDFxUUsrcVFMSkhETVE5eXgrblJTU2RmU2dtSXNnKzdG?=
 =?utf-8?B?bTNvREJhd2ptaEhUYVJRek5yZmpZNll1bSs5QU9OM0hqZk5xRVdXS0JnWTda?=
 =?utf-8?B?V3ZLUWwrTVNuZTYzc0Vab0NPWHFwZElpS2wvRi9va2Q0MWQxQWtVYmhrMkls?=
 =?utf-8?B?allpaUNGNmRoVGd4OEpld0hRQVMwcnpMcXBObWx2ZDJTOE1keVE1L1EyQWlD?=
 =?utf-8?B?eGhHeGpVSkdteVVsUTZjc2NQMzIzb2RWbFpRVFVuZGtTSDZZMmd2VkR4NGcy?=
 =?utf-8?B?OEkxeHhWVXpCTHdqNnplb1BWdTZGRzc2U1JYNDRUYitldEIzMjg0aE5aTEsv?=
 =?utf-8?B?endGY1VlVUEwcWVJK1BDdDdUYmw1cXBubTRObzFsbmxaa1BNSEc1Vm5xSDhR?=
 =?utf-8?B?OXFtYmJOK0w2K3gwSU9qM3JPVmlocDZ2V1VHVzRlLzBXd0tkTW9tKzNLTVE1?=
 =?utf-8?B?K0FmTVNnZCt0YVI3b20zT2wwU0lpazFNYnU0L1JsNmpZK3o5aEZZbURDYXlr?=
 =?utf-8?Q?8AKk=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f537e42-6b26-417f-5729-08dde0efb997
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:17:17.3526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RiGDo0PhteEzlS+JA9wChx5TXaPFPdyWn8e6nzV1nGaT+DNN0jdpAoDob/b9UJCzl4RORIPYQQN3Q3nn46iPhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8438

Prepare create common dw mipi csi2 library from imx6-mipi-csi2.c.

Move probe part to imx6-csi.c.

Rename struct csi2_dev to struct dw_mipi_csi2_dev and move it
include/media/dw-mipi-csi2.h.

Create two API dw_mipi_csi2_init() and dw_mipi_csi2_deinit().

No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/Makefile         |   2 +-
 drivers/staging/media/imx/imx6-csi2.c      |  61 ++++++++++++++
 drivers/staging/media/imx/imx6-mipi-csi2.c | 130 ++++++++---------------------
 include/media/dw-mipi-csi2.h               |  62 ++++++++++++++
 4 files changed, 159 insertions(+), 96 deletions(-)

diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
index 330e0825f506bd98d6a8093a58d3b7d06a94a626..064a6c6c069aa440c72a483080cbedf89d370193 100644
--- a/drivers/staging/media/imx/Makefile
+++ b/drivers/staging/media/imx/Makefile
@@ -11,4 +11,4 @@ imx6-media-csi-objs := imx-media-csi.o imx-media-fim.o
 obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media-common.o
 obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx6-media.o
 obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx6-media-csi.o
-obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx6-mipi-csi2.o
+obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx6-mipi-csi2.o imx6-csi2.o
diff --git a/drivers/staging/media/imx/imx6-csi2.c b/drivers/staging/media/imx/imx6-csi2.c
new file mode 100644
index 0000000000000000000000000000000000000000..72eff685fad99b3def46cf2866565191b7de9a8b
--- /dev/null
+++ b/drivers/staging/media/imx/imx6-csi2.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * MIPI CSI-2 Receiver Subdev for Freescale i.MX6 SOC.
+ *
+ * Copyright (c) 2012-2017 Mentor Graphics Inc.
+ */
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <media/dw-mipi-csi2.h>
+#include "imx-media.h"
+
+struct imx6_csi2 {
+	struct dw_mipi_csi2_dev dw;
+};
+
+static int csi2_probe(struct platform_device *pdev)
+{
+	struct imx6_csi2 *csi2;
+
+	csi2 = devm_kzalloc(&pdev->dev, sizeof(*csi2), GFP_KERNEL);
+	if (!csi2)
+		return -ENOMEM;
+
+	return dw_mipi_csi2_init(pdev, &csi2->dw, NULL);
+}
+
+static void csi2_remove(struct platform_device *pdev)
+{
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_mipi_csi2_dev *csi2 = sd_to_dw_mipi_csi2_dev(sd);
+
+	dw_mipi_csi2_deinit(csi2);
+}
+
+static const struct of_device_id csi2_dt_ids[] = {
+	{ .compatible = "fsl,imx6-mipi-csi2"},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, csi2_dt_ids);
+
+static struct platform_driver csi2_driver = {
+	.driver = {
+		.name = "imx6-mipi-csi2",
+		.of_match_table = csi2_dt_ids,
+	},
+	.probe = csi2_probe,
+	.remove = csi2_remove,
+};
+
+module_platform_driver(csi2_driver);
+
+MODULE_DESCRIPTION("i.MX5/6 MIPI CSI-2 Receiver driver");
+MODULE_AUTHOR("Steve Longerbeam <steve_longerbeam@mentor.com>");
+MODULE_LICENSE("GPL");
+
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 7b8911bea3fad8187fafb1d0916d730fd6fa671c..b5911a37972be868e10c115ada1910fa04b2765c 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -4,6 +4,7 @@
  *
  * Copyright (c) 2012-2017 Mentor Graphics Inc.
  */
+#include <linux/export.h>
 #include <linux/clk.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -12,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
+#include <media/dw-mipi-csi2.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -19,15 +21,6 @@
 #include <media/v4l2-subdev.h>
 #include "imx-media.h"
 
-/*
- * there must be 5 pads: 1 input pad from sensor, and
- * the 4 virtual channel output pads
- */
-#define CSI2_SINK_PAD		0
-#define CSI2_NUM_SINK_PADS	1
-#define CSI2_NUM_SRC_PADS	4
-#define CSI2_NUM_PADS		5
-
 /*
  * The default maximum bit-rate per lane in Mbps, if the
  * source subdev does not provide V4L2_CID_LINK_FREQ.
@@ -51,31 +44,6 @@ struct dw_csi2_regs {
 	u32	phy_tst_ctrl1;
 };
 
-struct csi2_dev {
-	struct device			*dev;
-	struct v4l2_subdev		sd;
-	struct v4l2_async_notifier	notifier;
-	struct media_pad		pad[CSI2_NUM_PADS];
-	void __iomem			*base;
-	const struct dw_csi2_regs	*regs;
-
-	struct clk_bulk_data		*clks;
-	int				num_clks;
-
-	struct v4l2_subdev		*remote;
-	unsigned int			remote_pad;
-	unsigned short			data_lanes;
-
-	/* lock to protect all members below */
-	struct mutex			lock;
-
-	struct v4l2_mbus_framefmt	format_mbus;
-
-	int				stream_count;
-	struct v4l2_subdev		*src_sd;
-	bool				sink_linked[CSI2_NUM_SRC_PADS];
-};
-
 #define DEVICE_NAME "imx6-mipi-csi2"
 
 /* Help check wrong access unexisted register at difference IP version */
@@ -100,7 +68,7 @@ static const struct dw_csi2_regs dw_csi2_v0 = {
 	.phy_tst_ctrl1 = DW_REG(0x34),
 };
 
-static int dw_csi2_reg_err(struct csi2_dev *csi2, const char *name)
+static int dw_csi2_reg_err(struct dw_mipi_csi2_dev *csi2, const char *name)
 {
 	dev_err_once(csi2->dev, "access to unexisted register: %s", name);
 	return 0;
@@ -134,14 +102,11 @@ dw_csi2_reg_err(csi2, #__name))
 #define CSI2IPU_GASKET		0xf00
 #define CSI2IPU_YUV422_YUYV	BIT(2)
 
-static inline struct csi2_dev *sd_to_dev(struct v4l2_subdev *sdev)
-{
-	return container_of(sdev, struct csi2_dev, sd);
-}
+#define sd_to_dev sd_to_dw_mipi_csi2_dev
 
-static inline struct csi2_dev *notifier_to_dev(struct v4l2_async_notifier *n)
+static inline struct dw_mipi_csi2_dev *notifier_to_dev(struct v4l2_async_notifier *n)
 {
-	return container_of(n, struct csi2_dev, notifier);
+	return container_of(n, struct dw_mipi_csi2_dev, notifier);
 }
 
 /*
@@ -172,7 +137,7 @@ static inline struct csi2_dev *notifier_to_dev(struct v4l2_async_notifier *n)
  * steps 5 and 7.
  */
 
-static void csi2_enable(struct csi2_dev *csi2, bool enable)
+static void csi2_enable(struct dw_mipi_csi2_dev *csi2, bool enable)
 {
 	if (enable) {
 		dw_writel(csi2, 0x1, phy_shutdownz);
@@ -185,12 +150,12 @@ static void csi2_enable(struct csi2_dev *csi2, bool enable)
 	}
 }
 
-static void csi2_set_lanes(struct csi2_dev *csi2, unsigned int lanes)
+static void csi2_set_lanes(struct dw_mipi_csi2_dev *csi2, unsigned int lanes)
 {
 	dw_writel(csi2, lanes - 1, n_lanes);
 }
 
-static void dw_mipi_csi2_phy_write(struct csi2_dev *csi2,
+static void dw_mipi_csi2_phy_write(struct dw_mipi_csi2_dev *csi2,
 				   u32 test_code, u32 test_data)
 {
 	/* Clear PHY test interface */
@@ -243,7 +208,7 @@ static int max_mbps_to_hsfreqrange_sel(u32 max_mbps)
 	return -EINVAL;
 }
 
-static int csi2_dphy_init(struct csi2_dev *csi2)
+static int csi2_dphy_init(struct dw_mipi_csi2_dev *csi2)
 {
 	struct v4l2_ctrl *ctrl;
 	u32 mbps_per_lane;
@@ -270,7 +235,7 @@ static int csi2_dphy_init(struct csi2_dev *csi2)
  * Waits for ultra-low-power state on D-PHY clock lane. This is currently
  * unused and may not be needed at all, but keep around just in case.
  */
-static int __maybe_unused csi2_dphy_wait_ulp(struct csi2_dev *csi2)
+static int __maybe_unused csi2_dphy_wait_ulp(struct dw_mipi_csi2_dev *csi2)
 {
 	u32 reg;
 	int ret;
@@ -294,7 +259,7 @@ static int __maybe_unused csi2_dphy_wait_ulp(struct csi2_dev *csi2)
 }
 
 /* Waits for low-power LP-11 state on data and clock lanes. */
-static void csi2_dphy_wait_stopstate(struct csi2_dev *csi2, unsigned int lanes)
+static void csi2_dphy_wait_stopstate(struct dw_mipi_csi2_dev *csi2, unsigned int lanes)
 {
 	u32 mask, reg;
 	int ret;
@@ -309,7 +274,7 @@ static void csi2_dphy_wait_stopstate(struct csi2_dev *csi2, unsigned int lanes)
 }
 
 /* Wait for active clock on the clock lane. */
-static int csi2_dphy_wait_clock_lane(struct csi2_dev *csi2)
+static int csi2_dphy_wait_clock_lane(struct dw_mipi_csi2_dev *csi2)
 {
 	u32 reg;
 	int ret;
@@ -326,7 +291,7 @@ static int csi2_dphy_wait_clock_lane(struct csi2_dev *csi2)
 }
 
 /* Setup the i.MX CSI2IPU Gasket */
-static void csi2ipu_gasket_init(struct csi2_dev *csi2)
+static void csi2ipu_gasket_init(struct dw_mipi_csi2_dev *csi2)
 {
 	u32 reg = 0;
 
@@ -342,7 +307,7 @@ static void csi2ipu_gasket_init(struct csi2_dev *csi2)
 	writel(reg, csi2->base + CSI2IPU_GASKET);
 }
 
-static int csi2_get_active_lanes(struct csi2_dev *csi2, unsigned int *lanes)
+static int csi2_get_active_lanes(struct dw_mipi_csi2_dev *csi2, unsigned int *lanes)
 {
 	struct v4l2_mbus_config mbus_config = { 0 };
 	int ret;
@@ -379,7 +344,7 @@ static int csi2_get_active_lanes(struct csi2_dev *csi2, unsigned int *lanes)
 	return 0;
 }
 
-static int csi2_start(struct csi2_dev *csi2)
+static int csi2_start(struct dw_mipi_csi2_dev *csi2)
 {
 	unsigned int lanes;
 	int ret;
@@ -435,7 +400,7 @@ static int csi2_start(struct csi2_dev *csi2)
 	return ret;
 }
 
-static void csi2_stop(struct csi2_dev *csi2)
+static void csi2_stop(struct dw_mipi_csi2_dev *csi2)
 {
 	/* stop upstream */
 	v4l2_subdev_call(csi2->src_sd, video, s_stream, 0);
@@ -451,7 +416,7 @@ static void csi2_stop(struct csi2_dev *csi2)
 
 static int csi2_s_stream(struct v4l2_subdev *sd, int enable)
 {
-	struct csi2_dev *csi2 = sd_to_dev(sd);
+	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
 	int i, ret = 0;
 
 	guard(mutex)(&csi2->lock);
@@ -493,7 +458,7 @@ static int csi2_link_setup(struct media_entity *entity,
 			   const struct media_pad *remote, u32 flags)
 {
 	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
-	struct csi2_dev *csi2 = sd_to_dev(sd);
+	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
 	struct v4l2_subdev *remote_sd;
 	int ret = 0;
 
@@ -528,7 +493,7 @@ static int csi2_link_setup(struct media_entity *entity,
 }
 
 static struct v4l2_mbus_framefmt *
-__csi2_get_fmt(struct csi2_dev *csi2, struct v4l2_subdev_state *sd_state,
+__csi2_get_fmt(struct dw_mipi_csi2_dev *csi2, struct v4l2_subdev_state *sd_state,
 	       unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
@@ -541,7 +506,7 @@ static int csi2_get_fmt(struct v4l2_subdev *sd,
 			struct v4l2_subdev_state *sd_state,
 			struct v4l2_subdev_format *sdformat)
 {
-	struct csi2_dev *csi2 = sd_to_dev(sd);
+	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
 	struct v4l2_mbus_framefmt *fmt;
 
 	guard(mutex)(&csi2->lock);
@@ -557,7 +522,7 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
 			struct v4l2_subdev_state *sd_state,
 			struct v4l2_subdev_format *sdformat)
 {
-	struct csi2_dev *csi2 = sd_to_dev(sd);
+	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
 	struct v4l2_mbus_framefmt *fmt;
 
 	if (sdformat->pad >= CSI2_NUM_PADS)
@@ -581,7 +546,7 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
 
 static int csi2_registered(struct v4l2_subdev *sd)
 {
-	struct csi2_dev *csi2 = sd_to_dev(sd);
+	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
 
 	/* set a default mbus format  */
 	return imx_media_init_mbus_fmt(&csi2->format_mbus,
@@ -594,7 +559,7 @@ static int csi2_registered(struct v4l2_subdev *sd)
 
 static int csi2_log_status(struct v4l2_subdev *sd)
 {
-	struct csi2_dev *csi2 = sd_to_dev(sd);
+	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
 
 	v4l2_info(sd, "-----MIPI CSI status-----\n");
 	v4l2_info(sd, "VERSION: 0x%x\n", dw_readl(csi2, version));
@@ -649,7 +614,7 @@ static int csi2_notify_bound(struct v4l2_async_notifier *notifier,
 			     struct v4l2_subdev *sd,
 			     struct v4l2_async_connection *asd)
 {
-	struct csi2_dev *csi2 = notifier_to_dev(notifier);
+	struct dw_mipi_csi2_dev *csi2 = notifier_to_dev(notifier);
 	struct media_pad *sink = &csi2->sd.entity.pads[CSI2_SINK_PAD];
 	int pad;
 
@@ -672,7 +637,7 @@ static void csi2_notify_unbind(struct v4l2_async_notifier *notifier,
 			       struct v4l2_subdev *sd,
 			       struct v4l2_async_connection *asd)
 {
-	struct csi2_dev *csi2 = notifier_to_dev(notifier);
+	struct dw_mipi_csi2_dev *csi2 = notifier_to_dev(notifier);
 
 	csi2->remote = NULL;
 }
@@ -682,7 +647,7 @@ static const struct v4l2_async_notifier_operations csi2_notify_ops = {
 	.unbind = csi2_notify_unbind,
 };
 
-static int csi2_async_register(struct csi2_dev *csi2)
+static int csi2_async_register(struct dw_mipi_csi2_dev *csi2)
 {
 	struct v4l2_fwnode_endpoint vep = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY,
@@ -729,21 +694,17 @@ static int csi2_async_register(struct csi2_dev *csi2)
 
 static void csi2_nf_cleanup(void *data)
 {
-	struct csi2_dev *csi2 = data;
+	struct dw_mipi_csi2_dev *csi2 = data;
 
 	v4l2_async_nf_unregister(&csi2->notifier);
 	v4l2_async_nf_cleanup(&csi2->notifier);
 }
 
-static int csi2_probe(struct platform_device *pdev)
+int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi2,
+		      const struct dw_mipi_csi2_config *config)
 {
-	struct csi2_dev *csi2;
 	int i, ret;
 
-	csi2 = devm_kzalloc(&pdev->dev, sizeof(*csi2), GFP_KERNEL);
-	if (!csi2)
-		return -ENOMEM;
-
 	csi2->dev = &pdev->dev;
 	csi2->regs = &dw_csi2_v0;
 	v4l2_subdev_init(&csi2->sd, &csi2_subdev_ops);
@@ -787,32 +748,11 @@ static int csi2_probe(struct platform_device *pdev)
 	return csi2_async_register(csi2);
 
 }
+EXPORT_SYMBOL_GPL(dw_mipi_csi2_init);
 
-static void csi2_remove(struct platform_device *pdev)
+void dw_mipi_csi2_deinit(struct dw_mipi_csi2_dev *csi2)
 {
-	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
-
-	v4l2_async_unregister_subdev(sd);
-	media_entity_cleanup(&sd->entity);
+	v4l2_async_unregister_subdev(&csi2->sd);
+	media_entity_cleanup(&csi2->sd.entity);
 }
-
-static const struct of_device_id csi2_dt_ids[] = {
-	{ .compatible = "fsl,imx6-mipi-csi2"},
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(of, csi2_dt_ids);
-
-static struct platform_driver csi2_driver = {
-	.driver = {
-		.name = DEVICE_NAME,
-		.of_match_table = csi2_dt_ids,
-	},
-	.probe = csi2_probe,
-	.remove = csi2_remove,
-};
-
-module_platform_driver(csi2_driver);
-
-MODULE_DESCRIPTION("i.MX5/6 MIPI CSI-2 Receiver driver");
-MODULE_AUTHOR("Steve Longerbeam <steve_longerbeam@mentor.com>");
-MODULE_LICENSE("GPL");
+EXPORT_SYMBOL_GPL(dw_mipi_csi2_deinit);
diff --git a/include/media/dw-mipi-csi2.h b/include/media/dw-mipi-csi2.h
new file mode 100644
index 0000000000000000000000000000000000000000..4e656f09c81db9dc9f232ed061f70803a5478c85
--- /dev/null
+++ b/include/media/dw-mipi-csi2.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DW_MIPI_CSI2_COMMON_
+#define __DW_MIPI_CSI2_COMMON_
+
+#include <media/v4l2-common.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+
+struct dw_mipi_csi2_config {
+};
+
+/*
+ * there must be 5 pads: 1 input pad from sensor, and
+ * the 4 virtual channel output pads
+ */
+#define CSI2_SINK_PAD		0
+#define CSI2_NUM_SINK_PADS	1
+#define CSI2_NUM_SRC_PADS	4
+#define CSI2_NUM_PADS		5
+
+struct dw_mipi_csi2_dev {
+	struct device			*dev;
+	struct v4l2_subdev		sd;
+	struct v4l2_async_notifier	notifier;
+	struct media_pad		pad[CSI2_NUM_PADS];
+	void __iomem			*base;
+	const struct dw_csi2_regs	*regs;
+
+	struct clk_bulk_data		*clks;
+	int				num_clks;
+
+	struct v4l2_subdev		*remote;
+	unsigned int			remote_pad;
+	unsigned short			data_lanes;
+
+	/* lock to protect all members below */
+	struct mutex			lock;
+
+	struct v4l2_mbus_framefmt	format_mbus;
+
+	int				stream_count;
+	struct v4l2_subdev		*src_sd;
+	bool				sink_linked[CSI2_NUM_SRC_PADS];
+};
+
+static inline struct dw_mipi_csi2_dev *
+sd_to_dw_mipi_csi2_dev(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct dw_mipi_csi2_dev, sd);
+}
+
+int dw_mipi_csi2_init(struct platform_device *pdev,
+		      struct dw_mipi_csi2_dev *csi2,
+		      const struct dw_mipi_csi2_config *config);
+
+void dw_mipi_csi2_deinit(struct dw_mipi_csi2_dev *csi2);
+
+#endif
+

-- 
2.34.1


