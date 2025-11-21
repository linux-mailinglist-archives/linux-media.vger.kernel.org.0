Return-Path: <linux-media+bounces-47537-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AADEC7707E
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 03:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id C625C2BF6F
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 02:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B1E285CB4;
	Fri, 21 Nov 2025 02:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iJ/nVrJC"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011071.outbound.protection.outlook.com [52.101.70.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B9922688C;
	Fri, 21 Nov 2025 02:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763692890; cv=fail; b=NBFpWoga6zN5JCcaCrFrbg/20bdHmTXaC6x/5zraGiYVzFKawx18tibp7ZbISBBVTvM1jcQrxVfXnNX2vELf1u1Qf155LbBwL+0PgDP4Ii+Q+UzYK4g/frz9i/pw/YSsHcGCK0EOMn8H9nyzlrqslwZJHmAeUDbc9sC5gwIGVqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763692890; c=relaxed/simple;
	bh=LYxCp7ue7/IqGLIKrBzSh4iI67APnloMlyunMyUooUU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IqHUhs6MMYepGjnXLKZYdJW6OlAiQJg811EyXq4AIy7WFu65sOR+Rxy1dJ39zsRmSQrKrHPSyTyn2olhwy2vo4ltMCr6tFAe4S31JDULOS05QJQ6wbLXOrY8orm3zRrE0BtsIQ35D1m9p/qJ4qwVe00ZO0Lnpzm4TPYodOBkXqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iJ/nVrJC; arc=fail smtp.client-ip=52.101.70.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQLOWkbyhBqedav4vb66pPxh0iAx/MyWorVnDdd28dLFukeRtQj+Cn8Z+GbnDSlKva3cte45vPhDxKc2BzDTNcirXr4uCoigFbedXbE0ZH+gueT6kzQGwTVPmggFDZYwDnQzWGXStxIyRLCg3g9DXzj2N4Z5IDCfpkSNXoWZsHffNC+le9eS4MIqFjD7anzLa73mIAcNQUs4LLt1wX5T48e0J3D3CE/Q7qfb+BdSRhunocwSADgNwJ+gGlmoLGjVmMuLy7pASODp6/NYvU7A5D+mm0c60UEjWTGJ3HREpSQnEk7IhwMN9MedpxdGAiYHUdzt5XzJE0s1YrfSL4RG9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EL2MdvalPTCqdRKidnq4pgq88A5kOYaecpbfSPT6Lk=;
 b=OB7BzdG7A9eP9mg997SGJwhpdQ1krh6J5uY2vbMGFfv/2uI2PGoUH992n389VCK5RVkbN4/q0pRfVrL/TYR40bG4to36jBzwoEVhzko0WIIf8mRUkyvanZcosBYQhaTkHDiyavWZN2uO379KV6X9ExmGDRsCOBCHmbIcKgUnAGAoxUuG/EDJtLyedffCojIAWUfEy7mfHi/PGvr1QF+iOZU66+KLOGTlAKw9q+TIsGmYw7iXyGcDjXP7thZfdtRS76ZmDo4n/4v3NVHDXJH8Jo6PvB+xGEV8zqeg32S4BH8TFkKPejUER/NMAmNzbFz322a8iqMZQw3Sj+YEPtuaMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EL2MdvalPTCqdRKidnq4pgq88A5kOYaecpbfSPT6Lk=;
 b=iJ/nVrJCyh2XCprZF2X09YrNm5pAwamjxwTu19K4PZTTfG/fK3EZJBPz0xs8zALHt7kViBR2JQAJlWHAmLfCbpWLXV08EQECJwLH/PZ9bC+upPe2Fq+XdKm1s2X8Eim5KhphsD+BuryZ8T1VyaOrP1O0dmHQVm5iWPqF265lW/105LXL59zcuB8vobOt4UsElq1a+YqPp8KaIfHTpZ2+CHjLn6jStJcXOq3MSrKHPtDgmBAVvziRlmIK6G/SVrBEFYoU5m9Y/EjUXf3UfCkgJHxdwij8d3N+GF3Lt4ycXDHSUju/ic9mOulR4cObWtYZeXn09Kf82I/Ihsg5ZxwDAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com (2603:10a6:102:225::22)
 by GV1PR04MB10306.eurprd04.prod.outlook.com (2603:10a6:150:1c9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 21 Nov
 2025 02:41:24 +0000
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::7bfd:652a:2f5b:e488]) by PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::7bfd:652a:2f5b:e488%4]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 02:41:24 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 21 Nov 2025 10:41:53 +0800
Subject: [PATCH v9 2/5] media: imx8mq-mipi-csi2: Use
 devm_clk_bulk_get_all() to fetch clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-csi2_imx8ulp-v9-2-05b41b897e50@nxp.com>
References: <20251121-csi2_imx8ulp-v9-0-05b41b897e50@nxp.com>
In-Reply-To: <20251121-csi2_imx8ulp-v9-0-05b41b897e50@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763692932; l=4116;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=KdMm32MaSoxJek0Iz/RfpQtwblTNJY4J5AZZGqyqaPk=;
 b=8Mn4g+3PohVX6T1bzL/JQe2ac+0bmfKFUJ7bkJoZxkYUMv0kXGZCPUO/YrzxOpdVLb7hMoYX5
 v+yuuwfZt+pBHGRG80lD+mzDVGd7MarFr7jgpLupKUTROQFSAvgLBAH
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
X-MS-Office365-Filtering-Correlation-Id: 3a2c404b-7520-4b9a-af3d-08de28a77674
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?eGZnQ2dOTHFhYUxJUDBmTUFmdE4vWFZUK3JIWTdreU5Sd1Q2b2VIRndQSURl?=
 =?utf-8?B?L1RCcFMxaFRjUXU4b1c1dEp1TTl3Z05pcFpGdkExSXdYNExQWGp0WnRKME5o?=
 =?utf-8?B?R1ZpMGJlQU9HZ0pSMHhydXNnWGpJS05VNnJWaHJRZzBOTk15TFBMNmkrWjc5?=
 =?utf-8?B?OHVvNVRpUDJ2OGNIVVNHaGo5KzdNVHJxbkVwYUtpWVcvaEN2ejROQ3diZXh5?=
 =?utf-8?B?clMyWlYrT0haamNwaWVCWlQ2QldGdU5QTWZqL2N1UllUYTd3MUp2aFFiWW56?=
 =?utf-8?B?RVU3V0xGZG9FbnFxUE53RUlzbmoyMHl2S1l2RG52aFFveExqSEJkL0J2L3NT?=
 =?utf-8?B?eFF4ZkhSRzd1OWtzN1laM2R4WWg0REJ1dlZrMmlTcEk4aHJUZ3M3eDFnZFRW?=
 =?utf-8?B?clJOWE5yd1JtQ2xLazhoUVVVRDJUYmh3RGJXTlAranZkTGFha3l0N2hINVVr?=
 =?utf-8?B?ZWNKRGdhNDlXTCt0ZXJDMHI5ekp1TERPdzNEVk5hcnBpMjEwTVBUQitpYW9y?=
 =?utf-8?B?NTcrcCt5SFdjb2lrL1U1L245MjAvbVBSK0tNOFZtZ3Iyc040L21YTWV2S0pD?=
 =?utf-8?B?b0RVMDd1LzkycWt1UFdTcnB1YyszTjFJOWU0N3REVHo5TG9aMEg4Z2NsaFYy?=
 =?utf-8?B?UFFxeVIzdFRydVZnYUMvdWNQYytFaERhVW1qekVJS0NqSVJuN3c2cGdzYkVG?=
 =?utf-8?B?RERkU3R0cElRNHRvTzVnMWpVRElDZXJrWndnRHFpWVJlOUpFRjBjSHQvbUtR?=
 =?utf-8?B?RHdWaWk2U3NlRVV4TjNzbW9kL1ZHczZVOG01eGZyWXhQOVB5S1dLS0g3NEt1?=
 =?utf-8?B?bjBJdmdiRFM5OGtIWlhMLzVrYXpWS2xOL2l5STFyR3FQNytBNk5BQ3l2eC9a?=
 =?utf-8?B?elhiSEh3VVpzZ0dML0h1Z1pYRU5uL0IrcHA2SldoQjJDNkVJdDFaUGdzcFI3?=
 =?utf-8?B?dzI4MmtYNFg4dGxnVUdHdzNkQlhBQ0FOeGcwR0hFMkhhbExHWFM2QjJRN29h?=
 =?utf-8?B?eEZBckI2bWVBUTNwL3M5NkYxN0NDdng2c0FjQnFiNjhLMW9YalFtNmpoM2RD?=
 =?utf-8?B?ak9mNmpVNjgyU01OOUNaVGUzaUhmSGdaM2YzNUNxaHZCbWwydzBMN3BpMXBw?=
 =?utf-8?B?OXlwV3UzVmI1UUJpWmxwZWNLYlZzbG5YcTkyN28rU1ZLTXJpdlhaaDJUK1Ex?=
 =?utf-8?B?U29MT0VPY1NPbmRuUGJOZTJEU05CbFFQV0pNejV4eXJMRWIwankraHdBOXRw?=
 =?utf-8?B?blNIckFIM3kyNUR2WGFHYTBFa0h1UXA3RzBDUHgvZ1FIMTZxTlI4c0NzUnB3?=
 =?utf-8?B?dXdONHk3NXhHR2dycUc5d3BSQjI5RVhwaXF1cU1CL0FoQ3B1YXg2ZTFoUFdl?=
 =?utf-8?B?N0k2R0lCNFhVNlR5Y1hFK3h4MEd6ZWlFL1ArUjhlTXJDSHhkNjJpVXdOZmtY?=
 =?utf-8?B?VER2aEVuMnlDby9CeXg3OXg0aTlkY2hVOXFiejhWUlpHeVlWTnFhTjVJNCtx?=
 =?utf-8?B?eGtyb0V1WVZEOVo1ZjBROVNodzlGUGd6OHhyN01PNURjclZ1LzRhZjhwclM0?=
 =?utf-8?B?NVpEYXUyN0JPL3M1QXRZMlhWaThtQ01vanJEN2FHR1A2WDgwYnNHS0laNEpN?=
 =?utf-8?B?djUxNTd0ZnBhQ2JydGtWUDNnVnF5bzFSZWd6SGxDbW5hcEUrbk91SFJ4aldy?=
 =?utf-8?B?VnJzQWxqSEY4Q080ay82RWlYMHc0a3ZrZ3BLL1ZtSUYvQzdtZlM5V1AvSjZJ?=
 =?utf-8?B?V3lhOWwrVFlmWERqa0F2ejNuZk1xOFVNTnhDbmJtWjRWSmx3TEU4VXRDUkRl?=
 =?utf-8?B?dExuQXQzOVBxcnNybUFhNUZNSXI0Q1NFVnIwRkdsZXZ2TFdUSUJVaFF6azNE?=
 =?utf-8?B?eWtMSk5xLzZTYnRVN2czZ2lmVDFnN2k3ZG93djZjeFJhQVB5NjZXK1h5enBv?=
 =?utf-8?B?MEV2eHhZb0F0cFg3ampkeWpaOGIxdkdZUmZUZUNFR2h4MytjQkdjS2hKbW43?=
 =?utf-8?B?L2JGbEFBSkMrNTJyNGRiZmNHYTlRNnJmN1kyUVZ4RytiZUEyT2tQdkFOa2ZZ?=
 =?utf-8?B?VmVQdDFSSDVGV2wrQUNod3RFM0hCS0FDTWJGdz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9089.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TzcxWi9QYkNkeVhJOUoxZUxrZ1czQ3hkOUhFSUpPL3FCMjd3TjhHa0R5Qmlm?=
 =?utf-8?B?UHM3TGVGb3BIMTRoYjRaOTVaLy9XZ3VkWEhtZzcyayt4MmZ6RWQrTTlUNC9l?=
 =?utf-8?B?YnpJNzMveWhPZUtEbUFiUVJiSGFpSkJ1MmQrSHNQSFhMU2JPNUQ0SkZSdklD?=
 =?utf-8?B?UDVyVUZ4VVZIUXVIaEsrZjFNNmE5VGZncjdBanZBK2NtOENCbmtFNUFyTmt0?=
 =?utf-8?B?bTUwLzNGNEFENUp5bCsvREJoSS9Ic05TL0ljaDdVaVhuSlh5QUFTV2RqcE9F?=
 =?utf-8?B?M3NWYkJGYUJDK3BRSUJxajhRMzlKbVFLWGNSRWhLT1JrRkE1clZRM2ZEdnEy?=
 =?utf-8?B?N3lqWHFjNmxTRkVzcS9xT3BzMGNuTC9BaHRtckNKcW12TGZLWUFEaVRJaHlO?=
 =?utf-8?B?bW1XUGpveFd5RlMwODhVUXNDNUw2VlBqdVk4blRobEZTTnV4dnVZeHFPVnZW?=
 =?utf-8?B?OTNGWGJQeW1tYnVxQkl1ZmZ3cE51c0pUbEFvN2lnNjROVkVtZjhZb0EyU3p4?=
 =?utf-8?B?VVlORThJRVE0WGJ3L3FCRGZ1WTJYV2VtZSsyMCt4azhMbmlZY1dUbndTVVBo?=
 =?utf-8?B?Qld3bFZuUXZGVDN3YWNQa0xnRThKVUR6OStFVm5YSzRuaVhqRlppUnhKWnJY?=
 =?utf-8?B?ZTJiMXpUZU1ick9oVm1lV2NQNVplb3RLczNycTYvZTVVd2JnUjlkKzBiaHd2?=
 =?utf-8?B?NXFGK1EzaWowR2Fwa1RuUDVUZUNZSm51dEQyYXUveENIaERNTjY4UkNOTkRP?=
 =?utf-8?B?TC82UjU1aVM0bmFsZlo2U09CSWw4SGdnL3ZIeWxsY0ZkdTA3enk1TDByZ05w?=
 =?utf-8?B?ZHRRaTV3WFJLWnJ6WW9idk5hU1VCWjNGeTE3K252dlhVMzArekIzdjh4MWRm?=
 =?utf-8?B?VHdSRk5PVW1ob0VncGx3bzd2SDIwL2I1eStxeExEK0UrQSszUDBxdkd3SzVI?=
 =?utf-8?B?d3VhVGV4WGxRTlY3ZGF0VmFxQ2hkVG03RlhxNlBGRXRwTzdQdHF1b2FBQWk3?=
 =?utf-8?B?dlh2cmcwWFRBOGsvSnhUWUwyMG4xUVZ2VlpoNkxBWmlGOXhIRHkrU21lMkRs?=
 =?utf-8?B?OGM4Q0x6SmQ0YkYzTFo4VHhPUXI0RlVoN2p4cVA1Wk51S3VDa2gzZnB6UDI0?=
 =?utf-8?B?K1hzdThxOG56VTJrbGhPaW4xZU5FMmw2MGdtYXJmSk8yM09Ha3RUQ3AvcXo0?=
 =?utf-8?B?VmoxRVF4Yys1S3RIaEM5MnNUQjVqRHVNTGRybXBNVFV2dndSSStGTHFqUWxC?=
 =?utf-8?B?aDBKTkNwUk4wTTBFOUhUU3NZVnFuT3BES3RWbGthOUZ2ZzhWZmNvM3gvS2FD?=
 =?utf-8?B?ZFRWWWIwRTJobldCQ0Zja2VqUDMzL0R2K005a1NaODBqRElTU0F2UFQ5Wjhw?=
 =?utf-8?B?V2huaDZQTi9Fcm9vd2hFbm5nbmFoa0xKS0hIRkUrVDFtcFVQSzcwVDc1R2tO?=
 =?utf-8?B?U3FzQkJ0Z3h0aG9ZVEt6aW8ybHM4b1krcUwvakRjbWxUdk02M255b0lZdjZC?=
 =?utf-8?B?dk5BZllsYmZhZHcvUityV1ROSTNyLzEyZW9nZy8vU2d2eTJmeEdMb2hyL0xR?=
 =?utf-8?B?bGVvUmRERnBzKzMwMVFxdkhLaDREN25Uc25ieGt4enpYWGp6VWZQQkI4UjVj?=
 =?utf-8?B?K0dqNm1SbFpkRzFVT0p1M0tjdlkwN3h1T0gyNTJCQjVBS2FzeTUyV0FQTWtn?=
 =?utf-8?B?dEk5Q055b1AwSExoZVh2RnhibkNDeENncEY2VmREcXV3dFI0dUhOSFNsTmUv?=
 =?utf-8?B?THFNY0tJVjVNVDFaRWxiUSs3MTBIVisyQXJJQTdReXBEdUVVaXRES05ERm5Z?=
 =?utf-8?B?OXB1REhUTy9vcEFUNURBNFFSMGlLRCsySHJYSFl4emVheFZMMEV6WmxFQ1o2?=
 =?utf-8?B?NDByeFFZd1dFQWJoTkFINy91QXpCZXZXQy9kOG1wVExIUWRjTm1EOGJiSlM4?=
 =?utf-8?B?TC83ZmlmWk5ORmtBd2gxOXpmbzlHWGhNZ1FFZ1cxb3hzSjAxWVZ1VXljU1Rz?=
 =?utf-8?B?Z01SdlpvcCtPQlZHWnlSNTdlSWV0eFVrRjlIUmNOUEpCanM1N292ZnZHamVx?=
 =?utf-8?B?ZzhOaXpWR2gxbjBhQnc2REE0NlI0cWQ4MmdlaCtYeStjbU1YUmErVTl1Vk83?=
 =?utf-8?Q?/M5Vsx5pLauxXFhFSCSQuxGSb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a2c404b-7520-4b9a-af3d-08de28a77674
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9089.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 02:41:24.6512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o+P5OgH0kHZoqrUDPv6qICpXVWSjyuieBMSAX/0kRXePYW8i0pH9DGfAvenG057XIOLSM6jRBIKwdXTeDmZSmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10306

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Use devm_clk_bulk_get_all() helper to simplify clock handle code.

No functional changes intended.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 57 ++++++++++-----------------
 1 file changed, 20 insertions(+), 37 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 371b4e81328c107269f89da23818ab0abd0179da..4666afec362a8111516ec2424b0d68ce48a6892e 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -71,21 +71,6 @@ enum {
 	ST_SUSPENDED	= 4,
 };
 
-enum imx8mq_mipi_csi_clk {
-	CSI2_CLK_CORE,
-	CSI2_CLK_ESC,
-	CSI2_CLK_UI,
-	CSI2_NUM_CLKS,
-};
-
-static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
-	[CSI2_CLK_CORE] = "core",
-	[CSI2_CLK_ESC] = "esc",
-	[CSI2_CLK_UI] = "ui",
-};
-
-#define CSI2_NUM_CLKS	ARRAY_SIZE(imx8mq_mipi_csi_clk_id)
-
 struct imx8mq_plat_data {
 	int (*enable)(struct csi_state *state, u32 hs_settle);
 	void (*disable)(struct csi_state *state);
@@ -111,7 +96,9 @@ struct csi_state {
 	struct device *dev;
 	const struct imx8mq_plat_data *pdata;
 	void __iomem *regs;
-	struct clk_bulk_data clks[CSI2_NUM_CLKS];
+	struct clk_bulk_data *clks;
+	struct clk *esc_clk;
+	int num_clks;
 	struct reset_control *rst;
 	struct regulator *mipi_phy_regulator;
 
@@ -384,24 +371,16 @@ static void imx8mq_mipi_csi_set_params(struct csi_state *state)
 			      CSI2RX_SEND_LEVEL);
 }
 
-static int imx8mq_mipi_csi_clk_enable(struct csi_state *state)
-{
-	return clk_bulk_prepare_enable(CSI2_NUM_CLKS, state->clks);
-}
-
-static void imx8mq_mipi_csi_clk_disable(struct csi_state *state)
+static struct clk *find_esc_clk(struct csi_state *state)
 {
-	clk_bulk_disable_unprepare(CSI2_NUM_CLKS, state->clks);
-}
-
-static int imx8mq_mipi_csi_clk_get(struct csi_state *state)
-{
-	unsigned int i;
+	int i;
 
-	for (i = 0; i < CSI2_NUM_CLKS; i++)
-		state->clks[i].id = imx8mq_mipi_csi_clk_id[i];
+	for (i = 0; i < state->num_clks; i++) {
+		if (!strcmp(state->clks[i].id, "esc"))
+			return state->clks[i].clk;
+	}
 
-	return devm_clk_bulk_get(state->dev, CSI2_NUM_CLKS, state->clks);
+	return ERR_PTR(-ENODEV);
 }
 
 static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
@@ -456,7 +435,7 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
 	 * documentation recommends picking a value away from the boundaries.
 	 * Let's pick the average.
 	 */
-	esc_clk_rate = clk_get_rate(state->clks[CSI2_CLK_ESC].clk);
+	esc_clk_rate = clk_get_rate(state->esc_clk);
 	if (!esc_clk_rate) {
 		dev_err(state->dev, "Could not get esc clock rate.\n");
 		return -EINVAL;
@@ -783,7 +762,7 @@ static void imx8mq_mipi_csi_pm_suspend(struct device *dev)
 
 	if (state->state & ST_POWERED) {
 		imx8mq_mipi_csi_stop_stream(state);
-		imx8mq_mipi_csi_clk_disable(state);
+		clk_bulk_disable_unprepare(state->num_clks, state->clks);
 		state->state &= ~ST_POWERED;
 	}
 
@@ -801,7 +780,7 @@ static int imx8mq_mipi_csi_pm_resume(struct device *dev)
 
 	if (!(state->state & ST_POWERED)) {
 		state->state |= ST_POWERED;
-		ret = imx8mq_mipi_csi_clk_enable(state);
+		ret = clk_bulk_prepare_enable(state->num_clks, state->clks);
 	}
 	if (state->state & ST_STREAMING) {
 		sd_state = v4l2_subdev_lock_and_get_active_state(sd);
@@ -1027,9 +1006,13 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 	if (IS_ERR(state->regs))
 		return PTR_ERR(state->regs);
 
-	ret = imx8mq_mipi_csi_clk_get(state);
-	if (ret < 0)
-		return ret;
+	state->num_clks = devm_clk_bulk_get_all(dev, &state->clks);
+	if (state->num_clks < 0)
+		return dev_err_probe(dev, state->num_clks, "Failed to get clocks\n");
+
+	state->esc_clk = find_esc_clk(state);
+	if (IS_ERR(state->esc_clk))
+		return dev_err_probe(dev, PTR_ERR(state->esc_clk), "Couldn't find esc clock\n");
 
 	platform_set_drvdata(pdev, &state->sd);
 

-- 
2.34.1


