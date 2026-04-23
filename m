Return-Path: <linux-media+bounces-59372-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCYyIj3X6WmglQIAu9opvQ
	(envelope-from <linux-media+bounces-59372-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 10:24:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B984C44E80F
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 10:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0212C3069B97
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 08:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E643BE622;
	Thu, 23 Apr 2026 08:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bWyd7WQv"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013031.outbound.protection.outlook.com [52.101.83.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16C727453;
	Thu, 23 Apr 2026 08:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776932516; cv=fail; b=gVnbVb2W4sEZXRkQU2PatXUAJjiiGjOtO213MiNiIqaygcLMgIiYiz+xeI9aA58Otx2qBrsH3qJD3Aw5PXJMMSlGd7vVVDvwf9gKKJekUmhDTnEhT5oMpSU8m6iob3E+h8fCD1jnZHaP1589ZDZPRG0HyuanAva7f/V45nTtt2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776932516; c=relaxed/simple;
	bh=0gYPwP+1fJ7LjHfYy5Kbv6KvqxkuVzA0xH5QrJRpna0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VrOt7xQQqKKudgCrIBh0I4+sx1PcI++/nFMzVA5tMzYnVIPZpBNOlAEpvX4fz4khrmfdBMyaMLy0GO0JEhKxkzf5VBx55GTXUbFZsZp5eTWZ+GanCa0UFj9yHSzLQ43QNMKawgp3em2SNvAIl2FuwGz+/QFVfeNtb4Ox4dgmrOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bWyd7WQv; arc=fail smtp.client-ip=52.101.83.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v2qMAB4OZCIgobdLHHOnqxam+eXDMPB1IL6hx/9CFzMmsYIoBYiG/mEpCM9JiwP3DDeCX1kTKPtuHHZ9vN2+ffKvKtrq94HsadEbsFlH9NIFiokn1X071ypfw7ZH39y/FjdECaPgWdo5TeKLK7YeX76HGjb3ahRawQFZ0PwlYPlohApTogAT/+mH+w9FhnPE+O7QwO9CDhqKK10oSHsBKqwCABkRLgjDUSkzOf4o8IaVfD4+CDhfHlXVZ0qwhQo62MxGjVFoZKRDrYGVOfK5Ld9PqclVeG/c1YNnBh4x6tTlOD/5W95D+bh+cDaKLw3v1YVFQpkgt17OAnJwpre4IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3NblNqcLP1TPG6EDM+KVX6JPFtjz2tMJEVQB8G45Tg=;
 b=ZheBl5d0YyZbNqaH6VeOUqjUFYeMW3T7dWgiHX9m2Kpbh+8BEqKccd6PvKzIXcG4/T8C3o8+Q79B0dyScVV4C3t/aTIWhl7g2Qtx3tj9bqrodJe4avUV1JPwoGIVwbyLH3fVTVsmtjWOPXCellCEfM/07llw8ppJfiwne1Ha5ObsNp4IG3rtjJjR4yV6AFXpeT4gKCxt3em59KKlt3x+NHTtv0DlCZNSLTYoAdm0WTfPMGMScS6ZmvuN1QxmWgJJc4uoO63JavXS+Lq/BgyBPkpazGrSD7whhpSs5sU1pPNnQ8KdC3fyj3znZnbPyXZLRRmJXbWdkPXpkCC60P5cWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3NblNqcLP1TPG6EDM+KVX6JPFtjz2tMJEVQB8G45Tg=;
 b=bWyd7WQvMYAmqKuFU+cADEzNoPbUmEgXrQSuFRSmP7Ukdsr8IpQ4UfIFt0+/DiiyCIic/EqcdjRRfn5WZuhl5+bDAVRLQsC0jbsHbkvn5KmI1F/p50Hn52wckAhjyeCwCWl4ZU6ji3NBTXe3mIjfGDmNzc0ko9lW+oJjhvL1o7LzkVTev/434g/vzBCOZkT0TBgZ3w4HgoqhjkYeP5fObYPvcWH8hXeHjxFw6pbfIz5w4vjRlgkkc18NowLyY/TO35e8KxW5EY2Bn3oqGXS03C/HrQ538A3Y2b0DAUfCNFc/cmMkTkoFfb4M+qsCe8g5S/EPTVvaRv+O59EMAHw1PQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM9PR04MB8876.eurprd04.prod.outlook.com (2603:10a6:20b:40b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 08:21:50 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 08:21:48 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Thu, 23 Apr 2026 16:23:02 +0800
Subject: [PATCH v2 7/7] media: synopsys: Add support for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-csi2_imx95-v2-7-934c02f3422a@oss.nxp.com>
References: <20260423-csi2_imx95-v2-0-934c02f3422a@oss.nxp.com>
In-Reply-To: <20260423-csi2_imx95-v2-0-934c02f3422a@oss.nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776932600; l=2362;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=0gYPwP+1fJ7LjHfYy5Kbv6KvqxkuVzA0xH5QrJRpna0=;
 b=5ikXzbAwS95HhOWibcCmfrqykkgdoX7cpwQeUCC/owfBRoAzNDcEKXWHPhUIKCdisseEwJt/L
 FZSJHD9ZLlmCM70qhVTWPzib1QTqof3fFWUH4BEpk8KuZeKiWmNnWvt
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR06CA0252.apcprd06.prod.outlook.com
 (2603:1096:4:ac::36) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM9PR04MB8876:EE_
X-MS-Office365-Filtering-Correlation-Id: 966efee9-aea7-4043-76b2-08dea1115d75
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|366016|52116014|1800799024|376014|19092799006|18002099003|921020|38350700014|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 7P9IQ/82kfNqrpIEZD4TtwHz2tO/1BvAtqUic+08hEBBU6nrVok5SBMFrboaa8n4fXnEAEQTAsMdE8nZS6CEZAuaBlPBhZHHcJXb4pD8CwfZNuD+S+QerGU4Q1naDEpDqQLK6QXxpG6QFVe1B7drXZUyoux9vTeXV9qZOn0zlFP5JwdBx3Ti8xdiDEyW9WQIkxyfich7q8SZ5ZLSvKITkCRQZtjVtbi0mr0klRyFgvlO6JY+nEVt/2VTwJNw78uc6KL2kWN1fXv92H7qlzNsHIsGGbd5ueD5QyegmKvd0t9M2L+8bf4ha3xHeK1I2pzsajnfZbJwZj9hTAv1cRpLTFYdr/tGx+dLDGdvuC8JgT2iZjGZ9Gd8ejbrVe5eyXzNNI6/0h/bSaWzxGyP7cDH/DXBmjjKrRBDa52X9rn4dmeBPCdmw+gjHc6wETgdlTH2Eib6+U+gCVsWyVZDQ+8mjNUc149U5DQHRmgFDxCNtisUTqumYrE7oJEt2HAwqU14cCnFLU6c4IPdIeRREJHaRy5P+dqHoIvJ4ZKdeRDgy9ePntMd/MCMxnaUsBZwYHh3oji4LMuDqulBjCGQsvnMprW2iVeNPIWMUCHGb25wU5FnC03KH/jAtlBPpn4uCTn9OMV7N/N8HLpTIovkicCrGovPTIwN+Hi4nE0AJUc6PvIQRzaR/Fo9SFvg/5DPZCnXoLjh52K64iRZcgxY7kKvXAb3eb1UIxA6PXtJCDdocd5ZD2zsd7BPSz/hqqFBuZmlOYN2XWFFjgWSOI5KVdM/Z1M7B6x3DMC2dRkDtxg5ZtQu9LCB1h09mpVlNTxkLxU0
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(52116014)(1800799024)(376014)(19092799006)(18002099003)(921020)(38350700014)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RDlnTS9WNGxOUW5MQTIzaVRLanFPeUVjVUhjQVl2Qm50ZTJEdkZHOEp3a3cw?=
 =?utf-8?B?VUROK1dRcWN2ejNaV3YyQnBZRE1IZXR4d0M5ZS9oQUhhM3Q2djdJajdBVjNV?=
 =?utf-8?B?UUNndFhpMlhNTzg3YWlXWEc0UGc1QnZJc0hUNmlNbTBYdkRMSEg0bHRQYU9r?=
 =?utf-8?B?NFhmVnNSdXpVdEVRSWtodldEMGtyQWREWkVFUzBnK1dzM1RTcDBvNDBNM0U4?=
 =?utf-8?B?TVRtWXNYamxacG9Qb1NGV0JaR3k4NE5STlFOSUpIRE5iNloyTktxTzRYdy9F?=
 =?utf-8?B?MHc2NzdmVnA3eVJWNEYzS0ZBejBaRWRGMUhzM2xscUhNT2I4b3lBTlBscTdC?=
 =?utf-8?B?aDlpQTZyTGREci91Y2tTcVVpaEMvZEFqL2UvRllSRlBWeU9vQVlpOHZtMGpp?=
 =?utf-8?B?QXpuRkVoZURnU2IwaUhpODlvdjhDaStKdStjR1REdGhCdTdYeVhFaExRbUth?=
 =?utf-8?B?ZWZGSFIzdS9BOE5YbWF6TjljMGtYZkNFVlppeEc2bXphSm1BVlJtVGVvandU?=
 =?utf-8?B?RkFKMkl6ZHBDbi9kQ2dNYWhjbk96eEhHbTBNRGxOdDROWnpTZGt6QnZodWVw?=
 =?utf-8?B?ZksybW9QT3lGU1FhSm9qNnNrcWpHdXZva0EvWjlKTmxwRWo5VWhMRGduMmpF?=
 =?utf-8?B?MTNvanIydkVVVDBLT2xQZjRFNDQ1RmdvV1hRbHhRUC9UK2cyNUc3QXIzaDlk?=
 =?utf-8?B?V2NVSjJyZ3ZkbWZWNFl4OU5HeEpWUkRvOFNMeTA1ZGFtUUN1Vk4rTC9jcWx5?=
 =?utf-8?B?NDNSYUpVUUd5Vys2cnkvaGdYMXBUQWMwNkdMVTJCb0VoTTZiZ2t0cWI0R3Fs?=
 =?utf-8?B?THRwaW05dFkzb0srUUVvZmtGTis3aFAzdnRkRXlJcVlQUjFTRkllVzZDeWd6?=
 =?utf-8?B?cjAyV3BSM09sNWlvMDVlSkhRS2F0dTJDNlNsekFobkc2UlVrQ05Ec0RqMlFt?=
 =?utf-8?B?enpFcjFqTFI4V1h3azZzVVFHdThteHZyai9GNi9LMUNkK2hXZzBTQmpCTnNx?=
 =?utf-8?B?UGxtS0M4OWJLNndKUW1na1JjS3h2RGFUdDR3c1JTNWhINW53ZFRDT0N4Zk9x?=
 =?utf-8?B?VmhhVURNc084bFNHdCtkQkVXYlhtSXJ5VmJUN1NSOEFwZUhLcndQNVVPTkVR?=
 =?utf-8?B?S1Q0TnF2ZzdYV2g1VUI4MTlxdTBtZFV5akJhZU9BTjdEbWRtSVQxU0VGRUgz?=
 =?utf-8?B?WFJMUkRwVDdwY0lTNmR6UEZvRXpiZlFjbW1NeTlLZkdsRi9SQnBrT0tWL0pk?=
 =?utf-8?B?Rno1aWwwejNnK0krVU0rSXpxQ1J2S0xJVndnQ2xhYkhIbHREeThUeHY1V09E?=
 =?utf-8?B?MStiZ2FtNjZBNXl6c2N6NFRQL1BVbm14VnlGT3h3LzdPa0N0VnR6YjlWZ2lF?=
 =?utf-8?B?Y3g1a0ZxWU44b3lrVW1kUHh5Z043RkdHTEVSM21zVDFCOThUM0VzdzRMeGF0?=
 =?utf-8?B?bXNFTjRGelpubUt1QlF0OGc4VUQrNTBMWHNFMTlXK3NNOHA2UTlnbko5dTM4?=
 =?utf-8?B?UXEyK2hOTEtlZVcxUldKdjlEWHV3SmFCMnJUN1BwSWVmdGhuKzhkWVh6a0tp?=
 =?utf-8?B?UzZrVC85bU0zdGRhc2JWT3grVDliSzNnd2M3MWZwVUpqa2lOZmNhZlNuWi9j?=
 =?utf-8?B?QzhkWmliN09wQ1UzMFhZdUdzY2N4enEvN0V3dVBYcGM5cmc4cGRjb1pBeWJh?=
 =?utf-8?B?MGxtYXdQWTNGRHZyWUJiZFpRd05ySTJuUUVCSW9KbUNLa3BaSzFvMkhGQTJE?=
 =?utf-8?B?VjFPU2hJQ0s0OS9DNG90NFh4UTVoRVZqNXVYclRxWGlmaHR5M3JiQXNvazl5?=
 =?utf-8?B?cE9IdkFVM0gvbGlGQW1kVnZ3bnIyT09GeThlcE1jMGtGbm01WmM0TEJvT0s5?=
 =?utf-8?B?UWxCV3ovc05QYXBXamNLaXdYblZTSHM4V1ZzMUNmSHJjM3VxaU9CenV6SkF2?=
 =?utf-8?B?TWlYQXRVYlUyNS9BdjJWSDZVUVN3Z0JBOUhoS015VXU2a2s5bkp4bzRFeDMx?=
 =?utf-8?B?Uk5qL0ZGdm10Wk9qZDY5NnBGd1kybHdFc2FHRC9YamVzUFNLcm9kMXNwbnBY?=
 =?utf-8?B?WWpqbW9aQU4xNjlVeGszZmFPeHVqKzdaNHZMdmVQeGphRFpYd3ZoZWZIS2FD?=
 =?utf-8?B?SW0rMEtTQ0Vaa3k3SGpJQXJYRkVVSFlad0drK3dRaTFmYWNyVmFLREVhT096?=
 =?utf-8?B?MmhWeDFnZGJheVYrNWJuS3VoQjQzZ2NXOG10dHlKMWJacTN6M1Z5Q1FCRXJE?=
 =?utf-8?B?Sy9FVkJqZ1VRMDdCeUU4OEh5VlhvYm5SaHhIU0lzVGtIQ0VKY1JuMzc2dk1m?=
 =?utf-8?B?bVJoaWMrMTNoSTdXOUhvOWErdFdCWTZlazMxWm5HQVhTUmVLVnJjQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 966efee9-aea7-4043-76b2-08dea1115d75
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 08:21:48.9184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WT4h0lUuUpg+qx449m/mkiSO1U7fgZZ1O8fKOyCNJkn44Sn6p0bDsE9jqmhCSozEcDR6RT763/3nCpciivwRzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8876
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59372-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: B984C44E80F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the i.MX95 MIPI CSI-2 receiver. The i.MX95 variant is
nearly identical to i.MX93, with the main difference being the use of
IDI (Image Data Interface) instead of IPI (Image Pixel Interface).
However, the IDI interface is transparent to software, requiring only
a different register map definition while sharing the same PHY control
functions with i.MX93.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v2:
- Add Reviewed-by tag from Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 8c38fe8a3f06..62910d61eb64 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -154,6 +154,17 @@ static const u32 imx93_regs[DW_MIPI_CSI2RX_MAX] = {
 	[DW_MIPI_CSI2RX_IPI_SOFTRSTN] = DW_REG(0xa0),
 };
 
+static const u32 imx95_regs[DW_MIPI_CSI2RX_MAX] = {
+	[DW_MIPI_CSI2RX_N_LANES] = DW_REG(0x4),
+	[DW_MIPI_CSI2RX_RESETN] = DW_REG(0x8),
+	[DW_MIPI_CSI2RX_PHY_SHUTDOWNZ] = DW_REG(0x40),
+	[DW_MIPI_CSI2RX_DPHY_RSTZ] = DW_REG(0x44),
+	[DW_MIPI_CSI2RX_PHY_STATE] = DW_REG(0x48),
+	[DW_MIPI_CSI2RX_PHY_STOPSTATE] = DW_REG(0x4c),
+	[DW_MIPI_CSI2RX_PHY_TST_CTRL0] = DW_REG(0x50),
+	[DW_MIPI_CSI2RX_PHY_TST_CTRL1] = DW_REG(0x54),
+};
+
 static const struct v4l2_mbus_framefmt default_format = {
 	.width = 3840,
 	.height = 2160,
@@ -907,11 +918,22 @@ static const struct dw_mipi_csi2rx_drvdata imx93_drvdata = {
 	.wait_for_phy_stopstate = imx93_csi2rx_wait_for_phy_stopstate,
 };
 
+static const struct dw_mipi_csi2rx_drvdata imx95_drvdata = {
+	.regs = imx95_regs,
+	.dphy_assert_reset = imx93_csi2rx_dphy_assert_reset,
+	.dphy_deassert_reset = imx93_csi2rx_dphy_deassert_reset,
+	.wait_for_phy_stopstate = imx93_csi2rx_wait_for_phy_stopstate,
+};
+
 static const struct of_device_id dw_mipi_csi2rx_of_match[] = {
 	{
 		.compatible = "fsl,imx93-mipi-csi2",
 		.data = &imx93_drvdata,
 	},
+	{
+		.compatible = "fsl,imx95-mipi-csi2",
+		.data = &imx95_drvdata,
+	},
 	{
 		.compatible = "rockchip,rk3568-mipi-csi2",
 		.data = &rk3568_drvdata,

-- 
2.34.1


