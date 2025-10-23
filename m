Return-Path: <linux-media+bounces-45356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0083BC00361
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 11:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1ABE188D71D
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 09:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166B9305E14;
	Thu, 23 Oct 2025 09:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MoPzr92m"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011034.outbound.protection.outlook.com [52.101.70.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BDA305974;
	Thu, 23 Oct 2025 09:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761211188; cv=fail; b=RxwebEquVBM8ZBXSTNTiCneB/u5Djxh25KxZH373u++rMsRMds3y4jl61GQtDgJGGMuu8I+AMXCu0jSlgqZfMTKD4PKCOznxQd+ZG2dUOKxuBdCCTOZCrWrqCcnv/UJcjaBusDktjpM8uFb+1S9IuWardnAH0VWfNJD1zWhqcDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761211188; c=relaxed/simple;
	bh=f+/oBcapOfe70p+uvc/1gA08cI3DGipZGEBa6b05QSc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UvMBjhcC4d192tLK1SKpIQ05pFX1fVIXs23DFLtB4z2PQEw/qz5h+Ska/gA3PEU26qz/aijhTjJSzu8Y2pMHREk0sn3CYeNesBwmJH2NNXqBthQM4afUx3gg3EG4HxRMZGVsEZeKWfGJ9eJS/SBAx3P1pUUPlLaHPCqEZfjYiTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MoPzr92m; arc=fail smtp.client-ip=52.101.70.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BpMX+n/GRlCO4vXAnU2gq8aIVCauSBVFf2BTfQ/j3Jv9QzMlkLb4Ha2KsMorem9hWt1Q2XH4S0z8LZuVArZkWT2M8QP/CqH02ZBfO7kqQL3dxsQ/2iNDOAzf9WOxlX6MmbO1q2UOxMEyUkhxcNpeS4PFq62SQRqVz6z9UcB4RQGoYLTHMgzANo8p2EpkOu2j6p7xyqQevESbOAG4vSaST0LwnwGPiGM2rmKE3aIEforJ6AUom1e25Qw6I7AiCLZy3OnRnyDow/gDg+tUFwBd3e3MK8IpWYeZK2QQgOLCwC2Mdza6JyuipvDWsVRhHqrjlrxCqdP7FfsX9S+gc/sA+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7cvruvE95lir6gN48yXZJHbhumfWNL2YC8Ci5mjl/EM=;
 b=QshSNLhK0kc6FBNw0AgsOea+Vti/k4hR4X3DCAzfdcW2D0clVEL6Gdo6DQiw7md3ILa+2Td0Usy28xLJNamn4KCISw5kCe40nNOFcnj4LFxwKvzRjkpXU28/YtwVcOddcJhfqM1k9OOb75p3q8ofQ9Q7uXl8+f5SjSxgGPITzaeyd0SfbsW6RJD16krNDVBzOdtAJW5b171sYBOIvhnDpdpY9DbaEd9wzBmY3SBoCI3vE4RHMBoHbQhSaCpP8Tty70hDoGNrCADG+ig2arNDCN5itreaqVu33ES1StP/xqoMIlup6mPp0J9pVxDTg6cp8MtUb1a51KFgNxsRvxs3bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7cvruvE95lir6gN48yXZJHbhumfWNL2YC8Ci5mjl/EM=;
 b=MoPzr92mPFT+jgIcxY57DGrJC3DsMIIClp1FsCTMembR0c/AkGIXOG1hW0KljDXyt4oQDKjzfNQYdmfoNVqGKNvMehvGu5HhCdbI/y/Cb/RVCPz1FeHEpVl5rmFmVdJeFt3KlWneygwzU8VdVs5m3kkdB6L4k/7uaYnyiYG7HKtllzAF3c9hV3Ajwvs6ZcuOiPC2eW6sl0PgkvBFcazCY+vtZU80J1W1ad7k7GaxbiZM0w8aS+xq34A3I9lYnjfnbnbYeb/tbvcKjQcQO0bVDjURYD6UT64HJkL9bOEwuY1ql0geKEP9K1XM1xJSlz9zhVjm156cZ4SbYFPUa4bZpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8SPRMB0023.eurprd04.prod.outlook.com (2603:10a6:20b:44e::21)
 by PA1PR04MB10556.eurprd04.prod.outlook.com (2603:10a6:102:48e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 09:19:43 +0000
Received: from AS8SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::1394:27d9:e69a:1798]) by AS8SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::1394:27d9:e69a:1798%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 09:19:41 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Thu, 23 Oct 2025 17:19:44 +0800
Subject: [PATCH v7 3/5] media: imx8mq-mipi-csi2: Explicitly release reset
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-csi2_imx8ulp-v7-3-5ecb081ce79b@nxp.com>
References: <20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@nxp.com>
In-Reply-To: <20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761211202; l=1321;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=LbwRZf2QpF7/tzlDwhvsWMxZ5iCWPU/b3bUYgO4/CVE=;
 b=wPH/w1jtTxJ0+ubbb/V5ifbEtN2bT7k3VCcymqn00xff3KlwByeYhPimtQgldVnDY2tA+hPc3
 COnTZbLI1WMDQD7iDazpSqem62CFIii4kK1av65PqTFwt+DNe2BaDoZ
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:4:197::20) To AS8SPRMB0023.eurprd04.prod.outlook.com
 (2603:10a6:20b:44e::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8SPRMB0023:EE_|PA1PR04MB10556:EE_
X-MS-Office365-Filtering-Correlation-Id: 248018ae-c490-4a9e-8f1f-08de12154c2f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Y00wcnBnSGMvcjBCeThUdFJoSCtVaDBxbk9xYjBFWUtRbUhPU1o2bndZK0hP?=
 =?utf-8?B?K2tXeEhvbXVCbzI5Sms4SDJOZHU4cGRRUkw2TGh5VEJDK283U1duZ0ZLNWpv?=
 =?utf-8?B?RVlwRVUwNnd5WUV6R0traW9iSkpseW1xY2xqZVh3aytHMHFOVXFXZTVPK01J?=
 =?utf-8?B?MUFPR1ZCVUJkdTB2ZGRWQjJxVjBjd0dvUkp2d2VQSnI3VlEyMjk5Vk5NelRP?=
 =?utf-8?B?czlQRXNNL3RScGI4NlIxVzFZbWJwSGhkaVgyMGh0MVZqSGNQV20zNUtKQ1g0?=
 =?utf-8?B?Q3hZRTVpMUJiRHFiaVZWQnJZb01wRmhnS0JocE1ZdkI1Vlk0a0s0Ykdrd2po?=
 =?utf-8?B?OUpFWU5vcEF2V3ZZVHd2VEVnczJ0M01uNE4yT1lMWjJmY0dNaUhoNG53RHl5?=
 =?utf-8?B?Y1JYMnNBSHM2UmlDWnhjbklIVzVYNzQwZXA0ai9zbEIxQjZYZm1GRnd6VE1z?=
 =?utf-8?B?L1dsQVpxSVJQVGMvd2pydVZod0VMNldNcURKdTE5U1dCN3Z3R3Y0ZWlIeWJ3?=
 =?utf-8?B?bTAzR01qRlRXaDE1WU81dHYvWHYzM0xWWlVnSlVLTmVycGZnV2VnWk1Hb1c2?=
 =?utf-8?B?b3dhMjVFQ1dMWnJkdGE4RzF0bWN3Y3dicy9IbVpyTWVJMnlwblJIQW81UGRR?=
 =?utf-8?B?Q3Y0RVFUZWNUY0tZUkk4VjJTU2M5QlA2WTl5QTVjU2REejA2VCtBcHExT1NN?=
 =?utf-8?B?QXM2blRIeG9oR2dzSmovaW5hUE1MVkJjclpvL1dBR2cxK2tKeStqWjkzaXRO?=
 =?utf-8?B?TlRxMGxWQzRHQXdwY3RkSWlsQ2NqYUd2dzZ6UzBVQlhkZi8vU251OGlTVGly?=
 =?utf-8?B?akVKaTBvSnkwd0pQSkxYWFpWeTM4dGxWZUxNcmp5MTl5bWxtL0NNbmxnYWdo?=
 =?utf-8?B?cGxBMk10WTM3TDFHV3ZtajZJMXFQRFkrV2p1Y1pFZ3BleThrbDFTdzNLK2dE?=
 =?utf-8?B?SEd2b3hRRjFiOUs3YVEwSTk3YURvM3AwRnRibnJZR3Y0UFdqZ2owdjB2SnBo?=
 =?utf-8?B?QUZCZHg1Y1cyaHpTNHdNYkIxTi9XY1Q3TnZNNFB2cjlpZW81ZzZ3ZEhSZDUx?=
 =?utf-8?B?SlJyQUErVzNuazJuRm92YjhkUG1RSE5MTWxoTnQ1VkxqUHZYN09KSktmSEJL?=
 =?utf-8?B?V25PS2tZQ2djcEsxTUUxcXBkMld4TndKTTIxa3d4aFpzdjJhYkduRWJ6eUQr?=
 =?utf-8?B?ZHQ4dDVnakdDTWZscEJnRUhybHg5N1MvYW5XRDI4ZXIzby9sNmk1SU0vYmZM?=
 =?utf-8?B?N0xGazdmb3cvd2NCY3BlNndhUHc2RlF2UlZmOEk2cjQwUTk0djkzM0hwWDcx?=
 =?utf-8?B?RExwMFkyNllReE9zS216Z211T3hrdHpSUlNXNEU0QVNJR3g4dFFLc3BaeUpS?=
 =?utf-8?B?K2Q0STBmQVVnWTdzYXQ0L3VwY3F4TXFCRnVwRlp6bUR6OU9yQm15V0dyUTBY?=
 =?utf-8?B?ZXU4YzJKNVNTN0F1NkN2YTBYUWZ1ZUNRbEU5RXZlYTcxQTJyVjR2OG9BWDZq?=
 =?utf-8?B?aHVqUWlpWGZidUEveDlmWSszMnJxWE9kaHJ5a1ZkemxGQWJRc1pvRlQ5aDlO?=
 =?utf-8?B?V0cvLzNyazJFMnB6SmFYMVRJSk1BNlZvTWFrYWV4UTBsdWxudXZhSFNYc1ZI?=
 =?utf-8?B?R0VxUmxVNlRLT0hyUE0zSXMxS3I5T01qa2pmc3VJY01hc1BteWtOODZ0ZHNU?=
 =?utf-8?B?UFFqajRrOE0wWjlublRTRXlIQUQvNXhsL3Jjc3BLSWtCWk14L0lwWWZpMXNB?=
 =?utf-8?B?cTJ2a3d4c2VHbTdramtjWWZSVzJ5bEFOem9VdnlISi8xekNkWW9YMnA3dXJx?=
 =?utf-8?B?VDFveXJXNmNGRWlFQ3pLVFJHTk5ielplRlJXdGFUR2tUcFRNRlJPUmJ5eDZn?=
 =?utf-8?B?MkVQWUNncFZ5QXo5MERheEkzczQ1UDdXN1pHMGVPNCtnVUdERFArRktXT0o5?=
 =?utf-8?B?WVE1YUxSR3c2MjJmMkhLM1djM0VEb1FlT3pRNFVmTXlKZUZrR0R3cFI0c1dk?=
 =?utf-8?B?RGlpRFphZkxPSENKem1jTGhDTEVja2lmb0xCQmxNTVhMNDJVVktqb1IxK3BC?=
 =?utf-8?B?YThHS0ZTNmZBa0pSYUFESG9Sb1hadFpXWTBadz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8SPRMB0023.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?aXo5clRYc1kwSEpQT3B6R3BOYkc4NG15Yk5LRFlXTm4rSUdGaWxlZUxBWjEx?=
 =?utf-8?B?ZlBscXQ4cUJYenhTZmNrWVprWXREak8ycEQ2NFRQRHlkQTZrZmlUaUtKWGpu?=
 =?utf-8?B?WkN6Wmt5Ykk0WU1YY1A1dE9BVHlCem4zSTZIdEQvQW80eWRmRHE1NUFaSjNR?=
 =?utf-8?B?WE9NWi9SMDFVMzlnR2FZUXJON1V0c1VzWVRQdTRwNE1pKzN4WFlGWEEzcWlL?=
 =?utf-8?B?NENQRDdFaWFWd2VEM0ZDQnNweFZIZ1J6WjRmdWY3QW1aaHp1VnNUNXdTeXJ2?=
 =?utf-8?B?azdkRFlFbWdzQnhFeVpCdVA4NWY2NDBoUTRKbFRrYU9JYTFTa1dBRWtMTTBP?=
 =?utf-8?B?eHlUdzJvZmxGMVVUdDVObW83dXBCTDNSYzhxcjhlS3RyVEpFMGhVc0RzazRl?=
 =?utf-8?B?YjhHZDQvNVJwOU9SRDhGNkdkUUhpWGVZYnBNSldPcVpqU1Jrak9jZytHSnlx?=
 =?utf-8?B?dTBRd2laeS85UEs4dmVoQmljc1I3VURFVjM4MERNelQ1SS9scHYzT0JIc1Vv?=
 =?utf-8?B?K0w0bFNQTm1uWkJhTzdxbnN6MTBGbzIzUUVFdTNYOEtySEZNVk1CeDZkWTVX?=
 =?utf-8?B?RmlMWWRBcXNOY24xeE1kQ0NRZGF1Z2tsN1loR2wyRUY5ZnNDZUlkdFpmdXlu?=
 =?utf-8?B?ZGxYbjNRU0wzaERWenV4SCtkNXpOQmRJQnkvZ1d5VGwwamFSbXRBWW5ublRj?=
 =?utf-8?B?THpYb2hEcHBBK3B5eHJUdWZvUjh6VC9xTk5QZ0NSMFNINkNxcFZ2Qml0YTFH?=
 =?utf-8?B?RjF3ZDQ5TklZcFFDSWMwQTJXZk5xZEc2Zlg0Q3dmelVhWDNaa0szOENOZS9V?=
 =?utf-8?B?L204ZDg5RmVHL2RHNEd2eDBsczdEa3M5NWRkMG4rRHJMN081MGJJem5xRHlR?=
 =?utf-8?B?UHkzcU1uZkV5VWc0M2xRMDFJTnIvV0F2dWRBNkJVQ0JRQ3ZUWnZUNWhMcUUz?=
 =?utf-8?B?eGwzMlpHN3dsSFlHdFdWNjVSQ25MV1NVVXpoT2VFdm56OHpYbWc2Zm16dStW?=
 =?utf-8?B?VHZhMk1vNnZ2L1ZyQXRoQnBELzRmYUIxblhTeHdkYlV2Y2ZyUGplSFhCeUIv?=
 =?utf-8?B?U0hTMENPaUVxQmdWOUprQU9raEs5YTJvRndJc1VMbjR6T01mWS85cE1FWmlY?=
 =?utf-8?B?bk5pbUhld2N6S042di9NUmVhOWlScDVrVWJWS21kaFdHTUcrbHZvckVHUnNy?=
 =?utf-8?B?dVFZSGFlR1VMOXArcEdLWmFrV01SV2h4dWl2czV4NUJVdDRUeE0zOEpDa014?=
 =?utf-8?B?eEFHaHNUTzM1d05QOS9RMmdXY3Z3N3VNU0V5QU81Y1QvVGNwQ3R0ekZSWVNj?=
 =?utf-8?B?Vm5MczZFL0NOUUNRUE1QV0tQUWVjT1F6WFByTnA0REt0MjM1ZGVtUEdlR0tE?=
 =?utf-8?B?U1hkVUdUQStRSGg0SGFZaC9STVVnNkpHeXNZSDFrb1RrV3VvWFhlVmJlZXhj?=
 =?utf-8?B?TlhkQmlZUUNIRGdpVW1YRmI0bGFrdEtYOU1idm1JZFAvMDR2UXdjTmNrS1pJ?=
 =?utf-8?B?azVLOUhwbDhBN2pnRno5UDhhNEw3OUhBUyt5dStYWXc3czJGakxzQ3RJYVo2?=
 =?utf-8?B?cjV5dC9UTXFCeWZNTXd0QVlyTGsvMk5vV0pCSnBWMURHdzhpNDZqRTBQNmZs?=
 =?utf-8?B?bnA5S2VRdzMzcFlmNmdzbjhoUG5NRmphUTN3RGFYaW9ZbjJ1ZDJwWjZ2ZDJx?=
 =?utf-8?B?aHNzdllqQVpNUFBpZXBjUzlaQldnQ1FvbEsyc3BvR21TVEF1d1FBU09mRTda?=
 =?utf-8?B?K0RDUnd1NEY1NXJSLy8zVURHRWxqc0ZGQ3hSQXRsRHdzZ2tINmNGWHQ1TTJO?=
 =?utf-8?B?UGNWRlpaNnIvSnQrUXlxMkVUNTVMMTJsbnlsRVZyQUtOdjRUUjB3NzdCVFNl?=
 =?utf-8?B?Tmw4Q1ZuZEtGd2VnbWlQVzVFQkZRWVFIdzNtenRRYlZNbHNOZllsb2FKOW5U?=
 =?utf-8?B?VG5XY0ZEMW5WYk5rY1NZWlVVSExkV3VUMGFHVnh1dlZoeTVGcFF1NGNGa3Nh?=
 =?utf-8?B?bnF0QTlCdU1oQ0IwTWtuenc1WkxtQ0tOQWd0OXlYQ3I1ZXVMclRJbnNBTHB1?=
 =?utf-8?B?MHJPMk5lQnJqb0t0WkRXbktkRDNnVUxJcnpjcVVaUk1lbElLeDgzaGVsZzVk?=
 =?utf-8?Q?WIoEcSkevY3oToP5e1aTWfXr0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 248018ae-c490-4a9e-8f1f-08de12154c2f
X-MS-Exchange-CrossTenant-AuthSource: AS8SPRMB0023.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 09:19:41.6947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FX7EnT9aHrRTcOhrwyY3Fb4bMkrtkRzRFSWqWbJVpm/t0Q7HW93A/e5E2MqEmXPHa7S0XlZqwiu5VJzt3NSbFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10556

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Call reset_control_deassert() to explicitly release reset to make sure
reset bits are cleared since platform like i.MX8ULP can't clear reset
bits automatically.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index fd202601d401145da8be23df4451f6af660642c5..fd788a7f48e5feeff658e3d2347db6fefca5d0cf 100644
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


