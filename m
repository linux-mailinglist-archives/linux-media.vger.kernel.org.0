Return-Path: <linux-media+bounces-47540-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EC9C77093
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 03:43:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 7CF112C83F
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 02:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA43429B8D3;
	Fri, 21 Nov 2025 02:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LN1iKxlc"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013028.outbound.protection.outlook.com [40.107.159.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E08C273D9A;
	Fri, 21 Nov 2025 02:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763692906; cv=fail; b=aTjlH+P/DKzCrbxz19SoHrgVzMg2EZAQn11OEtKVBDpF2DLmcl+MQdRk6h8VorEYGkNEW/Ka4naCrZq13Gf9aT83Ic+iJk8xmC0zFnovj7tM/w/HK5KVxNrX12ayELiJKdHdfFkELrN96+xO4q827C0wg6onJgzbutGdH2VHJdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763692906; c=relaxed/simple;
	bh=j7pO0U/vX3Eo6mDBPo+tB6+EKCtdBRCcpusjWT1xDd0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cgX2xPyiOByxaxH6ifNxQL+RJbI9ymJ4lazu5H8XSqLNVtX836Ro3rlDwdG8Hjak6WBmqS7F2ynB6jq+G3nO3/tzSa1fvg4CIXKroBOPzRrQMTvi3tF6+ovbl586X9EBucY13q0rE7ZllBlkQMoC6L757zP4nzWJK1yO7KQLWpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LN1iKxlc; arc=fail smtp.client-ip=40.107.159.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YyeJh4v6Tx14MOT10wd0guO8YmlzLZBnLFBoPxI69AvWnyVo1yiYPeN3jGCKprEA+RsJTPccTyJ6GBBwz6CTTM/poHDTq9GRuJf7rZCaNhkzBjIblFczKFrojsHXMrJ5aNXzZRq9WDeRCCG7H1kC1e1NBnOqgnQNTBxfqhn0g9dnmB35AKDNN9FBrlC+peN3jdLAwX+/a6avF9X9WzDqc0Yk1jOaLUFuSLOCyC3SQOBGpjqiFSASlbiogvr8k0IDFfIH/5JRxaH0VBP8hfvMFSdAKe8eM24Hd2knSjWHQ+s23t6bD4J1btZ9rg3iSfFgEblQq4Jh27Bgc3pdYD090Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAHnykv+oPFVn8h63+wcXMPDqInG7mBWbvzr8dEFq9A=;
 b=O29CNR5ctehAsoNmGRdB4rMOtcw6xb6P0FYuo42GDh5VecKolpAiGRjrHcxIuZrxi7NmMLMBGS48k3ha9Od2AQq+vACBtIxu2ej3i1LNsMNW1tz4GZ9x4ehnCbmAqzre+IkxM08rsIImEXph3gSK+rd5mMKUdRWvqazW1QC5b/2Rd9iLUbfiYX+V24x7tg0LxeMI9z/SaF9BQnhJb2Qwt+SFbWEftJpfVaoy9UagGBicquaXPUw+oEovK09aa1RR1hIsqyRo3fof2dP6R8LeKRpcAyLsUFTPZUukAlg26EcnOnQQASZEcSWFBMQaS93lEdTL9WLkv+evDjs1mhfl5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAHnykv+oPFVn8h63+wcXMPDqInG7mBWbvzr8dEFq9A=;
 b=LN1iKxlceUF8O3R0Q3mNQoz2OzjEutY5558Aj2uPWwWLCvm6q1g96vH6MEjIfmjv20+sjCVLByZWcFmHcxHilNs6gWT5IuDIo2kwIsGS7t3JtqHxcmeRJx2a/MstKQJSzHLlTug90LA7yyx1edTGhWE67aPv2JY4fnDe65GhTnQdVcfj/HBYUCCrOTGtUU3+Opmi8KU6I9GatAgt9DApCG2loXqDeVcI5I+Qr5ANe4G+17bKgEyv3uzlAooOkZC/1gaL6TDdEgB9nppeG95HHeYPLIVpdLAIp2JlQz0Ug0LuYF3RmwJvgOc2BUA66tGPdla+RVLK93UxfTcejsPrNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com (2603:10a6:102:225::22)
 by GV1PR04MB10306.eurprd04.prod.outlook.com (2603:10a6:150:1c9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 21 Nov
 2025 02:41:41 +0000
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::7bfd:652a:2f5b:e488]) by PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::7bfd:652a:2f5b:e488%4]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 02:41:41 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 21 Nov 2025 10:41:56 +0800
Subject: [PATCH v9 5/5] arm64: dts: imx8ulp: Add CSI and ISI Nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-csi2_imx8ulp-v9-5-05b41b897e50@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763692932; l=3075;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=pafiDd8TT+F3YKZUKFnv2yYEiY+Kqw4JnA7sm+f9DV0=;
 b=EAdWPVJTR02eVQiPcRgGhSqIAKmDA21iVdW8OrCD2xJV/mkPSQ8UhJzctx64ZzQzTsUA01UeG
 iFBS6EaY44TAwqGfiHvMgdf+vqUwy/dEdaSe7Bcx89pTFVBv/h+ViBJ
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
X-MS-Office365-Filtering-Correlation-Id: e9050c1e-7d2a-4c28-4543-08de28a78032
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?ZU5PZmtaK2QxRnpNVDh0cHQvL1l6bmExNGc2MkNhSExRcFAxOWZsVGtsMlRI?=
 =?utf-8?B?Ykt1Ty9JMFYvRXRzYWUzeGtuM29vSjR0L1Axbmh1alNrd3hmUTJmMHpFNzEx?=
 =?utf-8?B?YUZJTjBhMis3Rkg0d1NwUzRwUXpQZURjM1FZY3l0clA1WlV1WEpTR0FmZnVH?=
 =?utf-8?B?MEdLZCtRVUNpd2NJYWlJWDIzdXRjdE0rOGVBQkpvcWJMTCs4SVlRMEpEalk1?=
 =?utf-8?B?L0xpMkozb0F0cHc1OHhqUUFMZjdHWksyd096akV3a1RMaVFuMmg0ZmpKcDhX?=
 =?utf-8?B?bHdqUlUzMHd2RVlpYkM4TElRVFNVWGUzNWkra0Y5aGpNQjlNNW5Fc1BDT2dZ?=
 =?utf-8?B?aUpqZDhpYW9EalJSN293OXgvOGh3S1N6ZHVXTVhtWkRjNUtQWlFlVXc3cHhX?=
 =?utf-8?B?RkduMWppRXI2ZWF3K0lFb1BiTy9SQUNvam5rV2l2RXdnUjBVUGNaZXRWcUZT?=
 =?utf-8?B?RXlKYWYrUFpjWVdFK2txR1VNRFVvdzd1OXpvcUl3SGEyTHNUOG92bno4VkZS?=
 =?utf-8?B?UEVjaTVRM3hnRURPMzUvZzVNa3B4eHY2aEdpYXliM1ZiTktpMWJyZlMwbWZq?=
 =?utf-8?B?cFd1RlBvSUZqemh3bmx5Q0JZU1E4Qmg3a0UwaEpiU3lrdUd3L2pKZDkxc0xD?=
 =?utf-8?B?TCtRL0g1ZTVaRWhrVVlnV0xoNThQbUpSVXViRHRicndJelJvUWJBUnFkWnNw?=
 =?utf-8?B?cExtekRCTXRwZUZrakFxSEVMSTdHUnBjZDNFd3R2dW1OYm9YNUprZUFhaUN6?=
 =?utf-8?B?TStPa0NJQW1xNi9HS2RobkVlTzh0K29NRmNDZ3cwbU9lRFRzRlNuUlpyQkFJ?=
 =?utf-8?B?SXV3SmRRbjJJUVFoTk9oeE82YmZhdFlKM0g1UmV6WHkrRnMvVGJQTU1TcUJD?=
 =?utf-8?B?RlpKc2Fucy9hbkhJVEZxMTdGL0xhKytObXZ1dFFSN3QxZ3Z5TFhZSGdVdmhp?=
 =?utf-8?B?QnVjL0h5VFdKa0JmNERRcFRGdlB5N3NGSmw1NnZlNzdOTUxuYTRxYTBvUStX?=
 =?utf-8?B?UDdxbmFhSEREYmgwRjZXME9QOGJTSzZpc0YzNE1QdHFDbUFwRXBRbkdlNnBV?=
 =?utf-8?B?QXY2cGs3R3lZK2V4QmtYYVRWNDNPMWl0ZVdCRDlYZkpOODM2VGFTd1N5RkdJ?=
 =?utf-8?B?ZS9QejNtM3JSc2k4dHU0YjhXL1pFZmZseVJibk4zbDEvUzJCMFRucXZWMGIv?=
 =?utf-8?B?Y1lzWExLUGlWRFM1M3pnK2pMMm5yMTlwL0ZsTzQ2c09ERFdQckd5WXkvNnQ5?=
 =?utf-8?B?eUg2QVduT3pJUG0wVWtRNzBzWEhBaWJINTlMc0cyWGlMdkxpWlZUVlcwSi9Z?=
 =?utf-8?B?RTg3TzdGeGNUQ2tRaDBGRS9keW5vM2VJTHNrUE5wb0FtSlhoZ3hSaWNvUUZL?=
 =?utf-8?B?cTZsVE5hMGlXb2VXSFVocUhiSEZWQVlaNjVaU1d2UGZzcEtTbS90eitneUZ3?=
 =?utf-8?B?WHdyUVNUZ0VoNGI4RmJpcDY1eHRoMWZZNS9JZ2NxdlVaNnNNL1FSWlFmdHVH?=
 =?utf-8?B?R1NqVVlybjVOb0pGdytoUVdRbFVLQlNXU2FIdWNyZlBsbnkwQ2tXWmhoTVNF?=
 =?utf-8?B?ZWtOQWVnekZzYnBXYmt2c3d2emVoY2owMzY0N1ZJTUowQXhLUWZLZExoUEJt?=
 =?utf-8?B?RmRZNjh4NzQ1V1JqcWxDazd3S0NDMEdtbVJjUUtWQS80aGlQcWc5OUV2TDhF?=
 =?utf-8?B?enI0anFvdUNXVC96ek5rWVByWFV2VTArY0E4a0RDMGZJbDhKZUQvWEwzSnB4?=
 =?utf-8?B?VTV5NTQzQ1prQ09hU3dJNWF1R3FraGw4QlpQWUJ0WEN5ZEc1bExId2pHeEE5?=
 =?utf-8?B?RVBJbkoxRDNlSHgyblJnYU5LWHBqTFJ0RjJodEdJd1dtcXM5WFZINnpLYytB?=
 =?utf-8?B?bElhTHUyM1VHNjdRY0VKS3BUOVk5UGtaalZEMHBVMXlkangvTXRvQm51UVVD?=
 =?utf-8?B?NlZMVDhJK0d2M25oWnVMaE1hbU92YjlmaTlCdVBsdGVmbDJsMDRQcGtGSXFl?=
 =?utf-8?B?OGVYOXExTUNJSjdNQ1pqOFdJQldOalE0TkJXTlhQWmVZU282NkJvTlJqUy94?=
 =?utf-8?B?ZWFsbkhOVDBEeW1tUkF4RGJoV0FqUG1sNlc0Zz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9089.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?OTB1MWFNNnErOENoL0tSTUMxTDhKcW1HS1FkcURnR0xYclJjL0NwM21kWERv?=
 =?utf-8?B?aTJaODhnQTc4bkNmOWE3c05uMXJrU3lldEtKVnZiZ09kUExIVFJoUGcwai90?=
 =?utf-8?B?YnVnNEx5VVhtQlRIWGlCMW9BN3JHdTFOdVBBODhYdXlmQUQ3K0VyK292akNQ?=
 =?utf-8?B?OHN3OXd0eTA0UkVDYW16RkRRVFZOcThCdTdmRjBDemRaMDBweWlJdjhBRzV1?=
 =?utf-8?B?RTR3OFc4SGxUUUtlN0RYUitnb0hlZmViaDlEZjdoZ3lHdStTTkIrQWdVYWxM?=
 =?utf-8?B?SzNyRHRFc25OSDloUmQrUEtyc3Qvd1h0U3ZGTjN0MXo0d3hKTUZYTEg4Z0RU?=
 =?utf-8?B?NXhua0RzdnJBSEFuMnVSQ2pwcnozSytqQTl1Y1VyeEpJbzJOcUNUUjkwR3BU?=
 =?utf-8?B?bi9jNXlFMThYcGE2S0N3RXBsMzg5ODU5UzhzM3RrSFg3QzVSc1ZneDJNdDVK?=
 =?utf-8?B?NmRjMzNlMnRkK1RlMUtJRG1mZkgrdFkwaGNTM0MwYXNXZ0lQQi9DMlhzOVU5?=
 =?utf-8?B?UXh3MzVnRmxQTmd2bm9mMStMM3l1Qld0b1BuZHlNOG8zK0xCYXd6blRUdnZ6?=
 =?utf-8?B?M3ZDa2xpL0lGYXNrWFJuRFY2N3JmVEpJVTdjZ0luRDdVa1Y3UkdTQzVLc2JM?=
 =?utf-8?B?OUhma29CU25JblFBbmdVM2c5ZUNUTW9uM0dhU3ozbHkvN0J5UXIxNmtnNTBH?=
 =?utf-8?B?L0NUeUttT1h6L21Ha0srUmF5MDFZN21yZ2FoZGwzWCtmdUVRU0tiOWxMalda?=
 =?utf-8?B?TU9yR3lnc1ZiV1FHbmJCZWdDbEpLTG5DT0dNSTJ3ZkRaZTdBay9ZQ2k0YkVI?=
 =?utf-8?B?dXlSN0I4RGtDS21BSXByOW1nVGlRZGk0eXNyRzI2MGRGWlgxejc1eU5xQ1Jk?=
 =?utf-8?B?OXpNWnlDV2hlWGdra0RaaWkzZTFkb3JMYkcyTFZ5NitxWEJyUjdKWUlabG83?=
 =?utf-8?B?TVh2ZlUxL0pvV2p3bmJ6MW1uTyt1MFd0TGMxMCs3dE5YMWJXdk5OM25vS2pu?=
 =?utf-8?B?cmxpMWNjc2ZxRzdnSXNJdmZENXVIUGZFOGdQWnZOeU5NNXJOQmFJbFppUnVF?=
 =?utf-8?B?QUZMWWpBaFZnRXM2WkVWeXhiZkdmSERuUUwvMGs4ZFNwNmdsbHQ2UE1oK3c3?=
 =?utf-8?B?L2tlbGl1Q2dUcVdybWhNSXRVTS91Q1E0TW16ZnY2NnNLaXBmYXRGNWlXVzBY?=
 =?utf-8?B?TXJHV2lEWEF0Szl0TlJVQ2c4N1lsbTJlQk9KbkZsMjhKenhhd1kxbHIvOGdC?=
 =?utf-8?B?Sy9uRTlOaDhUUmk3aHZrOEVHRGxkY0twclJhWnFLYzEvVi9lQTNVYlMvY2tY?=
 =?utf-8?B?bi90VzFzcjJWcCtBSGRWRnFHOTZnbWtwRE9raGV2TmJ1eTA4V3R2aE44bVNT?=
 =?utf-8?B?WXBOemxkRFkrQ3lHWHFuQ2FSQTg2WmRCMWNBVkZRZzBUR3ZvbEtabG9KY2FT?=
 =?utf-8?B?WFpxMkFmczd2N0IxNG1tYUE2OElXS3cxdjQ3RjZmWTk1SFFJeGVJNW1URGpI?=
 =?utf-8?B?MDVhRmVzdll6Zlp3VDVxVURpcHppWlZvY2Y3bDFHdy91SDJQeldmQUlaMnFK?=
 =?utf-8?B?ejVSTzZJV0NOQVY2TjBGd2tFUEZWbkdBNG5yUmRUMVFKSEY1TTFHSjlDcXJD?=
 =?utf-8?B?R1prNWlUL0NHWHdQRUxFd2U4NUl1cGo2Tk5NQVBGbUg0S2grdFlsbmhsdzV3?=
 =?utf-8?B?S2w5aDBlUjY5Ry9FaXErSXVNcGxVelFhN0orL3NJbGhpdzRJVWc3NGFGK0R3?=
 =?utf-8?B?VVlaZS9CbXVxYkdMMzlrWUVyWlhpZm1vY0ZmYVp5T1R4VFNMYXBFNzlHeWp1?=
 =?utf-8?B?cXo0L2paVVlaQlpvR2hROCthM3lmR2YzME9nUDE2STJ4cjBJMCtsS3U1eHMx?=
 =?utf-8?B?Z2JESnM1R1Qrcnpqd1IwSEVmMDYxT25kc3lzRFBhZ25YVHlrNnRQVTI2QW1j?=
 =?utf-8?B?VllYaEU5MVd3TlJEOXRuTThjaEV1YlJLdmpEOFQzMkhYVTRkN3Yvc1htK0tM?=
 =?utf-8?B?TUNaL3Y0Z29hVVNQZm15bEV6Q0RsWEx4bzZoUFdzbEJ6cCtLME1tMUliVk0x?=
 =?utf-8?B?ZTJuTXIzMDBQZGMvM1YxU3VKb1pLKzVhYTVwQW0yK0QvS2RERjdZMHBzZmhM?=
 =?utf-8?Q?WgJOvpCuYoI1If8ilY9pFwGPu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9050c1e-7d2a-4c28-4543-08de28a78032
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9089.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 02:41:40.9896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AdZVaO5pAIvzgSNuXgi13gGnTQ+rKb5EwSRORKEL9TFDi+wnXGLq5MEmWztMNiiyioF2C7OfndRSs86u1pA8EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10306

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The CSI-2 in the i.MX8ULP is almost identical to the version present
in the i.MX8QXP/QM and is routed to the ISI. Add both the ISI and CSI
nodes and mark them as disabled by default since capture is dependent
on an attached camera.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 67 ++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4950c37e72e04f6bfb5995dc19178..99271d55dfb60ed2cbfe664d928be179eb257674 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/imx8ulp-power.h>
+#include <dt-bindings/reset/imx8ulp-pcc-reset.h>
 #include <dt-bindings/thermal/thermal.h>
 
 #include "imx8ulp-pinfunc.h"
@@ -842,6 +843,72 @@ spdif: spdif@2dab0000 {
 				dma-names = "rx", "tx";
 				status = "disabled";
 			};
+
+			isi: isi@2dac0000 {
+				compatible = "fsl,imx8ulp-isi";
+				reg = <0x2dac0000 0x10000>;
+				interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pcc5 IMX8ULP_CLK_ISI>,
+					 <&cgc2 IMX8ULP_CLK_LPAV_AXI_DIV>;
+				clock-names = "axi", "apb";
+				power-domains = <&scmi_devpd IMX8ULP_PD_ISI>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						isi_in: endpoint {
+							remote-endpoint = <&mipi_csi_out>;
+						};
+					};
+				};
+			};
+
+			mipi_csi: csi@2daf0000 {
+				compatible = "fsl,imx8ulp-mipi-csi2";
+				reg = <0x2daf0000 0x10000>,
+				      <0x2dad0000 0x10000>;
+				clocks = <&pcc5 IMX8ULP_CLK_CSI>,
+					 <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
+					 <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
+					 <&pcc5 IMX8ULP_CLK_CSI_REGS>;
+				clock-names = "core", "esc", "ui", "pclk";
+				assigned-clocks = <&pcc5 IMX8ULP_CLK_CSI>,
+						  <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
+						  <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
+						  <&pcc5 IMX8ULP_CLK_CSI_REGS>;
+				assigned-clock-parents = <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV1>,
+							 <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV2>,
+							 <&cgc2 IMX8ULP_CLK_PLL4_PFD0_DIV1>;
+				assigned-clock-rates = <200000000>,
+						       <80000000>,
+						       <100000000>,
+						       <79200000>;
+				power-domains = <&scmi_devpd IMX8ULP_PD_MIPI_CSI>;
+				resets = <&pcc5 PCC5_CSI_SWRST>,
+					 <&pcc5 PCC5_CSI_REGS_SWRST>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mipi_csi_out: endpoint {
+							remote-endpoint = <&isi_in>;
+						};
+					};
+				};
+			};
 		};
 
 		gpiod: gpio@2e200000 {

-- 
2.34.1


