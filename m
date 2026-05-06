Return-Path: <linux-media+bounces-60619-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BXcEBlJ+2lZYwMAu9opvQ
	(envelope-from <linux-media+bounces-60619-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:58:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D014E4DB7FD
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B8951301D5AD
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 13:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1075647B409;
	Wed,  6 May 2026 13:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZFxECvwy"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013014.outbound.protection.outlook.com [52.101.72.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5488547F2DB;
	Wed,  6 May 2026 13:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778075904; cv=fail; b=Id0kubyNZuxsr0U0akKynsSK7tTdJEaLD8F3KqbqUno+oaLlCtiYXiJB16CuJYDsKIaRNj/wzM1isI1h1qEsQrv7ZSBn5v9tzGWkDU9xCDU+6Mk41zjynUTYEE835DBzQ5vQYrDX+y7j8XwmYgWpksv2Nfeh/EplFZAVat2fq/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778075904; c=relaxed/simple;
	bh=RjM/Zqscy7D2BtP6rgXuplTLvzYi1Wbw8/dzss8Fsc0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Y+2Ls4qxzj6OQFlM6zlvdSa4x5bfXWfkMllJbzOBQLoPCiod3HYAaY3pZobNlzyHmHgIGsIo86qz0EyVlWLjlV6VdJxUi9GkSHIpkoK5Bf/hdbFCIk0BNnKrTGBWKzi0bcvkWhmOLnQus9lqD2Gw3rjuH3A0bVbmDeVLu3lVOVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZFxECvwy; arc=fail smtp.client-ip=52.101.72.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XqwSbtCmX3lCH60MIK4GCl+p/wJ77qKm8GAZVz7613szV8MbZmUFk2YhyghxmA65Ot3TGxPMF59MtGZIjkK3TrMBmm3aS4NsKtiO86G7vDxJk6tSPHEUHj1W9tH5Qz8nsbqend7/No7lUh/Np0zfAnavSqkQ6S8W35KhXR00SEomTDU8geVHt/Dt3q7S/o/6upgHKklKCmbNqz0izql+B1BA8yiBw0d6hbmnQY8FLFJhGghBXRtG9ax8mHsyeZ2EFat3MqgYvCGfYeakHbswOdaC+IWlYavTloJLikIT/2OEP83GZHEU+/HBrrvdrgy4IxgyjYcdVdJo8flVyZj4wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UubEAgraQJp5CInLuXgePgrLXJoYdAVKajXTCV44qVc=;
 b=zRWrCiJoV0DHWBP6OmkeQlm16lTGegU0BPJp0jr/7jll5tMoL6vMgwO7b3xWnfk3qtG9CHVtP5fYC2jVKqJuZ+uQglYgVE0R+pqSMyOHDEUDC09fljnS2bI1TXn/KwefP0673Cbkl49XBcUT7lnl2zheg+fAythxyz79CpwTlFq2nlZKFI1PTF+gGPQ9fK9PaQeRlT7Nip962ePCUT7dUZCVsLhhDOqo3YafCEQmYwIzGn1MRg1gpXOOQOnDQYkuCkLwkE/CCTfVQX7FBM4cV7xgjMY23YpI37evw6B2Jky7iGTv7IVfYJaTMUOtn1HFsPLr3aFT3IuIZ26OOPtgzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UubEAgraQJp5CInLuXgePgrLXJoYdAVKajXTCV44qVc=;
 b=ZFxECvwy0Fc3lFrFchmQtTy1XdajPzLSJ/KnfqjIxfFLCTVgcl6aMfOPFlq029QgsmuXyzw1oCv+JwQbiTSVr3/4nzxj3WZSDb5mw+9pThNnppC2B6/taqDc/UfWjX1NjwuF3EKSLpFOcwuycRSAhmbFzbFkgPKLPOPxicnD3Ps9KGb79EsKimtpKftJL7CtQz6fdRsXEO+7CidRAgvbXUCLdDlZPCd6h2Eqmf78RcVe1EaL1mBzMyWjQKGW7QZ+AlfgSGg4r26JMJ1w537cs9WSgXqFPz0SPK0noSpgDQLfRsWOrtmmdA9sAMYFxTXBs4pS821Bj4JteST02j/6iQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by PAXPR04MB8959.eurprd04.prod.outlook.com
 (2603:10a6:102:20e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 13:58:19 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 13:58:18 +0000
Message-ID: <e542034a-a3f2-4998-b581-70246fa7026e@nxp.com>
Date: Wed, 6 May 2026 15:58:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [v8 04/14] media: rppx1: wbmeas: Add support for white balance
 measurement
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
 <20260504010556.2796398-5-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Antoine Bouyer <antoine.bouyer@nxp.com>
In-Reply-To: <20260504010556.2796398-5-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0015.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::19) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|PAXPR04MB8959:EE_
X-MS-Office365-Filtering-Correlation-Id: b9ec29d1-9038-47bc-eed3-08deab7786eb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 jo+zDFm8VQRbXGuhhHFdkG0FPaV+aRVGmRYsAfvmRIO2M5qCzY5GzN9tOQhpipn0r9AZsQy3PZBW/+p2EJtTmZJqI2X3+Yvpo5hzkFBVyG+CH3i/7JfIMkY+3/juVWic3nDrGSMeeFhJmZYF8r8P2/UETBhwzISEsM3XzEH/dUXsU0cJv/KJJliRIbzLbjv9Z7q/lbHn3MgYeUynZOKEVgyMLA6oWJIO0IKLWcumciFawdYW7mfB5NJKQfaWPJLs+Nw59HPbLzaehPzAyCdM8LnFfi6jh+qdVklsZqI4ygMlybsK+9Wq7CBtTMF1sF6qAHa3RFzbljACXJ8UOxBmBSLmyW7QiIMMimDRh7attNKTdy1n9PzkOQZnV8YbxoFhtQdyqotSVIHcnou1ne9H0l+eE0+U+z27z8/E8MQM7InOsWbLCcBzJTM3DtqPwX9EkX+5BdZXJItwtzZLsNB89F0Os1O9zBLTtUQTv1b46O/nkRKpG+UeLruH7jkcm8ep6X3bANpr10UAOMdmnn6WBMWHWduMoO9Ku5mTVMNUiB1Hok3bbhUJoi1QW3mgCBd24N+Yy+zfF4k8uawZozBO2yKgXHOZIMs6m11u5UuDpmYlOr+k1Cd0NU4l9BHjGI/Rs3+tIiS6C+teimN/wPJGxhQcfzJsZkuKe80pV1PYEtbtjiUAPBwOdJ2dCSk4kDFs
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RDVQZC9aUVl4UGNUOFVVazdMSGRwNm1YdVN5NUUxUVlPU0JmWWZwMlUwTGtN?=
 =?utf-8?B?RTFxbDJTUzIySFhhUXlpYXVydUZCVVpmZDVldnUvaldRVDAyMzdsRUluZGJY?=
 =?utf-8?B?bEFVanc2eFpFUHJsbTV1NkowNStwVWtIUEZHZFhlQUlaMVBQT1ljL0hQeTRr?=
 =?utf-8?B?enFkamN2dndJaUNPZHdKZ3JiZjREWXZOejljbXN6WE5nZ1hHaXpVN1FYYisz?=
 =?utf-8?B?Z25IUUVKMnROVGg2UnBocjdZeUlVdXIyclFZTWxQcDZSQkg1dUZOZW1ocWJ1?=
 =?utf-8?B?ZGhOL0hKdE93VGswVURPaVNKRTliWm5CYndrdzkyd3NDRERWaFdNemVZbUhU?=
 =?utf-8?B?aUlHd1ZVVWdzRm5vOUppYTlSYTA4M2EzMzVsKzF2UWNzdGh1bHFTRi9GdXhC?=
 =?utf-8?B?dG50amlkUFp1bzJWakdBK2pRanBxQ3BEdk8yUy9Yd1JobHIvMzBBZDRQMEoy?=
 =?utf-8?B?bm1zMUtRS29hK29qbTY2c2hWRnNEdFU1dWFwbE8wSXBIa3ZtZnNtMlVTSUJh?=
 =?utf-8?B?a2ZVZ2pNa3AyNHhUQVdxcGZSNElSazVjazJPbm9wSFZnR3NnU295QnlEbTBM?=
 =?utf-8?B?Q0FLaHNnRmtTWUpZQ3htSEg2SWNXeFBiVmhYUzhWWnAzL3VnRFpPQjVkSlpo?=
 =?utf-8?B?NE9zcEFPMDNKaU5LaVp0VFFnVDE1UlVwVUIyOStoeUg5Lzc2NjdYa0U0STIr?=
 =?utf-8?B?K1BtNjh3N0ZSMUsyQWZFL3ZycmVjeUhOcktIaFY2V01KYStYVkJmWm1RQ05o?=
 =?utf-8?B?ZHFyMDYzUklRR3dtM0x3U0w0Tjh6STBmVXI0VUROQlVlVGJ5M1NQSzFYNXBK?=
 =?utf-8?B?WlcyRjF3VmM4QW9waTkwTHYxN3IxMFdGZTY4SEU5cTFHY1VXUjV2cFgxNzdp?=
 =?utf-8?B?VEplZDk3Rm8zOEVQbGROUFkvV1dTNTAzZU5xcE9TV3pnTDJYQ2tNcE8yZXB5?=
 =?utf-8?B?MVpvQno2ZnY4Mkk3UGpVWWs3NVFoYTlNUnBkTDViWVFsZU1qYXZNTC9pN2ZQ?=
 =?utf-8?B?NW9xZzQ2WEJHRUMzcm56VklaSFZiRDZIWThJNDNtY3FtalA4NmRKdW1nSEE0?=
 =?utf-8?B?ZnBCWGo0cEhtZnJUK1Vpc2t0VUtlK1d4SlFZTTIvQ1EwdzBBU3I4S2pKc3NL?=
 =?utf-8?B?S1hoTWZCdDhKaU1oRGNCUDlhVGJ5enlxbFdoa3RZOWpsN21LRWpra3lpUGQy?=
 =?utf-8?B?dUREM1UrbVVJRWZoaXlFSlI0NXZlR0tyMVNWU2dMZWovSEVDYVE3UzZLUndE?=
 =?utf-8?B?TTljcGpwZEEzVXpPQjZzdWcxcnFVTGJuZGRQN3JLMFlQcjVTOUgwYXJlbzlM?=
 =?utf-8?B?ZFgvcmk3OUxrSlR0V1EyYnMySk9vYjNJWGxUSVdxVERYUkZubllVTGk0UmVx?=
 =?utf-8?B?UXl6T2NFMGozbDZ2ZllyVkVuVzZ4aTAvak51WkFSckRNeEpWVUQ4UmZtRlgr?=
 =?utf-8?B?Tjlva2xtREtnbG0xdnorUTY2eEZIcWV6SVFjaEhsckpXdFY4VHZjVDFVZGty?=
 =?utf-8?B?L0NlT25ua08rVHpVMEh0ajV2djM2MDVoM1VaemFCQjRGaWJ1N1hneUdVdUMv?=
 =?utf-8?B?ZWFKVTJkdGNkUjZvbXc1bXByRk5vKzFQSlFFVitwY2lZb2ppUWp6cjUxN09Q?=
 =?utf-8?B?VnhTeDR2MEJGVjVIQkIxSmZOaWRSQWttRE11T1VnWVVsT0xaK0JwdWtlMmcz?=
 =?utf-8?B?K3FxQjRkK3RaL21ORWdLOXJ1TVdxK0plNmdiSnpIMWdXZVF2bzIwN3RielpX?=
 =?utf-8?B?RkE1Vy9wdGVoZWlrb1pCbzUzdUlkSlpoazBKdHlaSm5EbG1JcUg3MTVvM3da?=
 =?utf-8?B?K0lWZVVFMlVKL29oT0loYmlacnowNS91ZEIrSERzdVdGZmNMMUNJQXJCRzc3?=
 =?utf-8?B?QWhBZWdPS0VQTEFMY0pVTlBUeUZuOU1FZ3Zqa1hPRStIU0N0emZlWXpNcmNh?=
 =?utf-8?B?MXlYMlBGYkl3R0ZCejNzS0JrMVZZb3NocU00aGZTTFd3bEZRbmdCWnUvalgx?=
 =?utf-8?B?eGxFZEJ2c0R3blNJdkJ2N2VKQ3ZBcHFtakd0bmtVWjg4dnlxbmdXRXordVI3?=
 =?utf-8?B?YWZ2dGJSdlZKc3cwYTZ6RUxDanpSQzZLVERHN3k3Z2xGcVd6MmZjQlljWlpw?=
 =?utf-8?B?Q2hvQ3V3WDF0SjVOSGtLQXdCcXdaaHpxM1d6MDFoeWdiSEMrMVJqRFhZWnh2?=
 =?utf-8?B?Mm1aZGc2eG1Zcmp0YUFHUzVGUm1kUjF6MVBQMG8rdmo4SkVGK2xQUlBZV0ZD?=
 =?utf-8?B?Z2FHenJpUi9IOVBRbUd0a0kvUHI0cjFlcHcxWTdrL3ZsTk5RajlubEc1WXRz?=
 =?utf-8?B?UHdLT3NoQ0hRWDV4RjZkUUc1aTdtWm9ENmJrd3JFV1BrcnQ3eDBHdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ec29d1-9038-47bc-eed3-08deab7786eb
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 13:58:18.8649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R6EA/IYOKhCsa53nCUMcAOR27PxTom2AHkK0c3yYqWFiCM1BSoOP7/ZDJEr9BdFNC2nkFkAoB2S8cNIE/z+6Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8959
X-Rspamd-Queue-Id: D014E4DB7FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60619-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	TO_DN_SOME(0.00)[]

On 5/4/26 3:05 AM, Niklas Söderlund wrote:
> Extend the RPPX1 driver to allow setting the white balance measurement
> configuration and consuming the resulting statistics. It uses the RPPX1
> framework for parameters and its writer abstraction to allow the user to
> control how, and when, configuration is applied to the RPPX1.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> ---
>   .../platform/dreamchip/rppx1/rpp_module.h     |   2 +
>   .../platform/dreamchip/rppx1/rpp_params.c     |   4 +
>   .../platform/dreamchip/rppx1/rpp_stats.c      |  18 +++
>   .../platform/dreamchip/rppx1/rppx1_wbmeas.c   | 103 ++++++++++++++++++
>   .../uapi/linux/media/dreamchip/rppx1-config.h | 101 ++++++++++++++++-
>   5 files changed, 226 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> index 742904973e35..85fb23174e57 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> +++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> @@ -85,10 +85,12 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
> 
>   union rppx1_params_block {
>          struct v4l2_isp_params_block_header header;
> +       struct rppx1_wbmeas_params wbmeas;
>   };
> 
>   union rppx1_stats_block {
>          struct v4l2_isp_params_block_header header;
> +       struct rppx1_wbmeas_stats wbmeas;
>   };
> 
>   struct rpp_module_ops {
> diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> index a5feb18f3bd5..1262350d2190 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> @@ -16,6 +16,7 @@
> 
>   static const struct v4l2_isp_block_type_info
>   rppx1_ext_params_blocks_info[] = {
> +       RPPX1_PARAMS_BLOCK_INFO(WBMEAS_POST, wbmeas),
>   };
> 
>   int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
> @@ -50,6 +51,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
>                  block_offset += block->header.size;
> 
>                  switch (block->header.type) {
> +               case RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST:
> +                       module = &rpp->post.wbmeas;
> +                       break;
>                  default:
>                          module = NULL;
>                          break;
> diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
> index 8f43e56ba361..4c38e657e5f0 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
> @@ -14,6 +14,11 @@
>                  .size = sizeof(struct rppx1_ ## block ## _stats), \
>          }
> 
> +static const struct v4l2_isp_block_type_info
> +rppx1_stats_blocks_info[] = {
> +       RPPX1_STATS_BLOCK_INFO(WBMEAS_POST, wbmeas),
> +};
> +
>   #define rppx1_init_stats_block(rpp, buf, type)                         \
>          ((union rppx1_stats_block *)                                    \
>          v4l2_isp_stats_init_block((rpp)->dev, (buf),                    \
> @@ -23,5 +28,18 @@
> 
>   void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf)
>   {
> +       struct v4l2_isp_buffer *stats = buf;
> +       union rppx1_stats_block *block;
> +
> +       v4l2_isp_stats_init_buffer(stats);
> +
> +       if (isc & RPPX1_IRQ_ID_POST_AWB_MEAS) {
> +               block = rppx1_init_stats_block(rpp, stats,
> +                                              RPPX1_STATS_BLOCK_TYPE_WBMEAS_POST);
> +               if (!block)

Hi Niklas

I assume you need to use IS_ERR() here, instead of null pointer check, 
since v4l2_isp_stats_init_block() does return an error from this series [1].

Same applies to other stats blocks.

BR
Antoine

[1] 
https://lore.kernel.org/linux-media/20260505-extensible-stats-v1-6-e16f326b8dad@ideasonboard.com/

> +                       return;
> +
> +               rpp_module_call(&rpp->post.wbmeas, fill_stats, block);
> +       }
>   }
>   EXPORT_SYMBOL_GPL(rppx1_stats_fill_isr);
> diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c b/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
> index 3d197d914d07..53263bc96280 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
> @@ -56,6 +56,109 @@ static int rppx1_wbmeas_probe(struct rpp_module *mod)
>          return 0;
>   }
> 
> +static int
> +rppx1_wbmeas_fill_params(struct rpp_module *mod,
> +                        const union rppx1_params_block *block,
> +                        rppx1_reg_write write, void *priv)
> +{
> +       const struct rppx1_wbmeas_params *cfg = &block->wbmeas;
> +       u32 awb_meas_props;
> +
> +       /* If the modules is disabled, simply bypass it. */
> +       if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
> +               write(priv, mod->base + AWB_MEAS_PROP_REG, 0);
> +               return 0;
> +       }
> +
> +       /* Program measurement window. */
> +       write(priv, mod->base + AWB_MEAS_H_OFFS_REG, cfg->wnd.h_offs);
> +       write(priv, mod->base + AWB_MEAS_V_OFFS_REG, cfg->wnd.v_offs);
> +       write(priv, mod->base + AWB_MEAS_H_SIZE_REG, cfg->wnd.h_size);
> +       write(priv, mod->base + AWB_MEAS_V_SIZE_REG, cfg->wnd.v_size);
> +
> +       /* Set number of frames to sample. */
> +       write(priv, mod->base + AWB_MEAS_FRAMES_REG, cfg->frames);
> +
> +       if (cfg->mode == RPPX1_WBMEAS_MODE_YCBCR) {
> +               write(priv, mod->base + AWB_MEAS_REF_CB_MAX_B_REG,
> +                     cfg->ref_cb_max_b);
> +               write(priv, mod->base + AWB_MEAS_REF_CR_MAX_R_REG,
> +                     cfg->ref_cr_max_r);
> +               write(priv, mod->base + AWB_MEAS_MAX_Y_REG, cfg->max_y);
> +               write(priv, mod->base + AWB_MEAS_MIN_Y_MAX_G_REG,
> +                     cfg->min_y_max_g);
> +               write(priv, mod->base + AWB_MEAS_MAX_CSUM_REG, cfg->max_csum);
> +               write(priv, mod->base + AWB_MEAS_MIN_C_REG, cfg->min_c);
> +
> +               /*
> +                * Program the color conversion matrix coefficients and the
> +                * per-color channel offsets.
> +                */
> +               for (unsigned int i = 0; i < 3; i++) {
> +                       for (unsigned int j = 0; j < 3; j++) {
> +                               unsigned int index = i * 3 + j;
> +
> +                               write(priv,
> +                                     mod->base + AWB_MEAS_CCOR_COEFF_REG(index),
> +                                     cfg->ccor_coeff[i][j]);
> +                       }
> +               }
> +
> +               write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_R_REG,
> +                     cfg->ccor_offs[0]);
> +               write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_G_REG,
> +                     cfg->ccor_offs[1]);
> +               write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_B_REG,
> +                     cfg->ccor_offs[2]);
> +
> +               awb_meas_props = cfg->ymax_cmp ? AWB_MEAS_PROP_YMAX : 0;
> +       } else {
> +               write(priv, mod->base + AWB_MEAS_REF_CB_MAX_B_REG,
> +                     cfg->ref_cb_max_b);
> +               write(priv, mod->base + AWB_MEAS_REF_CR_MAX_R_REG,
> +                     cfg->ref_cr_max_r);
> +               write(priv, mod->base + AWB_MEAS_MIN_Y_MAX_G_REG,
> +                     cfg->min_y_max_g);
> +
> +               /* Bypass color conversion matrix and color offsets. */
> +               write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(0), 0x1000);
> +               write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(1), 0x0000);
> +               write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(2), 0x0000);
> +               write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(3), 0x0000);
> +               write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(4), 0x1000);
> +               write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(5), 0x0000);
> +               write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(6), 0x0000);
> +               write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(7), 0x0000);
> +               write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(8), 0x1000);
> +               write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_R_REG, 0x00000000);
> +               write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_G_REG, 0x00000000);
> +               write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_B_REG, 0x00000000);
> +
> +               awb_meas_props = AWB_MEAS_PROP_MEAS_MODE_RGB;
> +       }
> +
> +       write(priv, mod->base + AWB_MEAS_PROP_REG,
> +             awb_meas_props | AWB_MEAS_PROP_AWB_MODE_ON);
> +
> +       return 0;
> +}
> +
> +static int rppx1_wbmeas_fill_stats(struct rpp_module *mod,
> +                                  union rppx1_stats_block *block)
> +{
> +       struct rppx1_wbmeas_stats *stats = &block->wbmeas;
> +
> +       /* Return measurements at native hardware precision. */
> +       stats->cnt = rpp_module_read(mod, AWB_MEAS_WHITE_CNT_REG);
> +       stats->mean_y_or_g = rpp_module_read(mod, AWB_MEAS_MEAN_Y_G_REG);
> +       stats->mean_cb_or_b = rpp_module_read(mod, AWB_MEAS_MEAN_CB_B_REG);
> +       stats->mean_cr_or_r = rpp_module_read(mod, AWB_MEAS_MEAN_CR_R_REG);
> +
> +       return 0;
> +}
> +
>   const struct rpp_module_ops rppx1_wbmeas_ops = {
>          .probe = rppx1_wbmeas_probe,
> +       .fill_params = rppx1_wbmeas_fill_params,
> +       .fill_stats = rppx1_wbmeas_fill_stats
>   };
> diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
> index 26627be6f483..1d76a85164c8 100644
> --- a/include/uapi/linux/media/dreamchip/rppx1-config.h
> +++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
> @@ -40,13 +40,81 @@ struct rppx1_window {
>    * wider-than-8-bit results.
>    */
> 
> +/**
> + * enum rppx1_params_block_type - RPP-X1 extensible params block types
> + *
> + * NOTE: Only append to the enumeration as the numbers are uAPI.
> + *
> + * @RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST: AWB Measurement Configuration
> + */
> +enum rppx1_params_block_type {
> +       RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
> +};
> +
> +/**
> + * enum rppx1_wbmeas_mode - AWB measurement mode
> + *
> + * @RPPX1_WBMEAS_MODE_YCBCR: YCbCr measurement mode
> + * @RPPX1_WBMEAS_MODE_RGB: RGB measurement mode
> + */
> +enum rppx1_wbmeas_mode {
> +       RPPX1_WBMEAS_MODE_YCBCR,
> +       RPPX1_WBMEAS_MODE_RGB,
> +};
> +
> +/**
> + * struct rppx1_wbmeas_params - AWB measurement configuration
> + *
> + * The Auto-White Balance measurement module is available on the MAIN_POST pipe.
> + * It supports two measurement modes, selected by the @mode field. The
> + * measurement window is programmed through the @wnd field.
> + *
> + * To support measurement in YCbCr mode a color conversion matrix with
> + * programmable offset is available in the @ccor_coeff and @ccor_offs fields.
> + * The color conversion matrix coefficients are represented as 16 bits signed
> + * Q4.12 numbers ranging from -8 to +7.99. The per-color channel offsets are
> + * represented as 25 bits 2's complement integer numbers ranging from -16777216
> + * to +16777215.
> + *
> + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST)
> + * @mode: measurement mode (from enum rppx1_wbmeas_mode)
> + * @ymax_cmp: enable Y_MAX compare using @max_y
> + * @wnd: measurement window
> + * @frames: number of frames for mean value calculation (0 = 1 frame)
> + * @ref_cr_max_r: reference Cr or max red value in RGB mode, 24 bits
> + * @ref_cb_max_b: reference Cb or max blue value in RGB mode, 24 bits
> + * @min_y_max_g: luminance minimum value or max green value in RGB mode, 24 bits
> + * @max_y: luminance maximum value, only valid if @mode is set to YCbCr and
> + *        @ymax_cmp is set to enabled, 24 bits
> + * @max_csum: chrominance sum maximum value, 24 bits
> + * @min_c: chrominance minimum value, 24 bits
> + * @ccor_coeff: coefficients for color conversion matrix, signed 16 bits Q4.6
> + * @ccor_offs: R-G-B color conversion coefficients, signed 25 bits 2's complement
> + */
> +struct rppx1_wbmeas_params {
> +       struct v4l2_isp_params_block_header header;
> +       __u8 mode;
> +       __u8 ymax_cmp;
> +       struct rppx1_window wnd;
> +       __u8 frames;
> +       __u32 ref_cr_max_r;
> +       __u32 ref_cb_max_b;
> +       __u32 min_y_max_g;
> +       __u32 max_y;
> +       __u32 max_csum;
> +       __u32 min_c;
> +       __u16 ccor_coeff[3][3];
> +       __u32 ccor_offs[3];
> +};
> +
>   /**
>    * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
>    *
>    * Some types are reported twice as the same block might be instantiated in
>    * multiple pipes.
>    */
> -#define RPPX1_PARAMS_MAX_SIZE 0
> +#define RPPX1_PARAMS_MAX_SIZE                                          \
> +       (sizeof(struct rppx1_wbmeas_params))
> 
>   /* ---------------------------------------------------------------------------
>    * Statistics Structures
> @@ -55,12 +123,41 @@ struct rppx1_window {
>    * wider-than-8-bit results.
>    */
> 
> +/**
> + * enum rppx1_stats_block_type - RPP-X1 extensible stats block types
> + *
> + * NOTE: Only append to the enumeration as the numbers are uAPI.
> + *
> + * @RPPX1_STATS_BLOCK_TYPE_WBMEAS_POST: post-fusion white-balance measurement
> + */
> +enum rppx1_stats_block_type {
> +       RPPX1_STATS_BLOCK_TYPE_WBMEAS_POST,
> +};
> +
> +/**
> + * struct rppx1_wbmeas_stats - AWB statistics
> + *
> + * @header: block header (type = RPPX1_STATS_BLOCK_TYPE_WBMEAS)
> + * @cnt: Number of pixels matched
> + * @mean_y_or_g: mean Y (or G in RGB mode) value, 24-bit
> + * @mean_cb_or_b: mean Cb (or B in RGB mode) value, 24-bit
> + * @mean_cr_or_r: mean Cr (or R in RGB mode) value, 24-bit
> + */
> +struct rppx1_wbmeas_stats {
> +       struct v4l2_isp_block_header header;
> +       __u32 cnt;
> +       __u32 mean_y_or_g;
> +       __u32 mean_cb_or_b;
> +       __u32 mean_cr_or_r;
> +};
> +
>   /**
>    * RPPX1_STATS_MAX_SIZE - Maximum size of all RPP-X1 statistics
>    *
>    * Some types are reported twice as the same block might be instantiated in
>    * multiple pipes.
>    */
> -#define RPPX1_STATS_MAX_SIZE 0
> +#define RPPX1_STATS_MAX_SIZE                                           \
> +       (sizeof(struct rppx1_wbmeas_stats))
> 
>   #endif /* __UAPI_RPP_X1_CONFIG_H */
> --
> 2.54.0
> 
> 


