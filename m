Return-Path: <linux-media+bounces-47846-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8FAC90E9B
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 06:58:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC93F3AC9C0
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 05:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 015E52C2346;
	Fri, 28 Nov 2025 05:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FxgTNdvo"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013053.outbound.protection.outlook.com [40.107.159.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF230296BD1
	for <linux-media@vger.kernel.org>; Fri, 28 Nov 2025 05:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764309482; cv=fail; b=OEUTLXHKsWIabjoM25jwntTgEuqHUJlRAZjuVQc9HMpUTIsWoiq3Yvo32M+uE6iyq8VLUy2YkCTxU2naY4qyNhF8peNcef8MmpNWgU4IAntCOpZVjfOVnnj0Yu3bP9LuXfB/LhobbCZZWCyLK7o5vpFSnkBK03MtvsFhEPxJVAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764309482; c=relaxed/simple;
	bh=u78Gd45Q9fHV8oi4bZIYWe9zugXxqoZkEkD3YhLWUPU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oASFrOFRQIfjjH6iwmRQnPlyeStw+KKmu3mgsUZDxLzOOXAAThNi49yAR1FAmeJaFd0xWR86RahTn/8UpCPW4FMtMm+Qw/zR6B5gYXWTzuqVRbe0/O8Z4JAkn6Q8S02J1xudtZQIanL2rMsvN3o602x3KYkB7d0bZwjJvlFJeSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FxgTNdvo; arc=fail smtp.client-ip=40.107.159.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+oY8/hiJ9YFD3lyAihDCHd+yJS4Z5MlM4cM0rx5+2QEhm1FZv06EZ9Ci1ivLUjxckKGPIzoXkLxR6qLeOuVmllIOUosM8q3v9OyvKf45Hph02rUrTTx7sy5V8dLC4BDq/NWDZV0M0zLcVFsahCSerSSK160I9WM5FyFDl1iRnb7wrOe8RqHv6SBQE1oOP6DID76KJDcTILRWo5Bk76OwI0CRuhCHU363raB/yVqbHJUcJpcGzjkrHL2fX8fHj//+xXZ71soZS9GK1w0S3F47rJL4je8mKLHKekzIh7uTuGnpWMieOfyEGZ/4EDM1w3ySSXs4fiIT/d7Ojp8uRqQ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZadliOtTfwVMtDM2D9WKpfGblbtEolTCRn0dFekO3Y=;
 b=DuoLOrV3pg7T0ZXU/gGLll/eraFkr8gZXf+TR5MFPL44SHhXA4UwsSbT0yYADlBb0uM9/To0BOMDMZrmLRCX1hvUKOJiVseVNMOpKdIfQQuTFFk27HLsNR4giIFw2DA+BrhvQVF8JlmYp4NCPuvN7o0mbj800UVKE3NWJvTsECxplV9jSLK7n5gsDSIUqIb969kdlVSe7ghb97jPgRaJDXp1kvzZF7BKkTKm1tWsoFP/bur29Q2iCwr+Kd3JvZXOxQRAtl/aIsFD9cmZ4sFUE0w1Zf89N+YcdSVv9hUzle99PziMgAy4z76n7pqOi6Xb/N+R56gQZ0hqEwaC+P8XpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZadliOtTfwVMtDM2D9WKpfGblbtEolTCRn0dFekO3Y=;
 b=FxgTNdvobRbcvE6T3sr9Dqqp9fqCGCJoJYrJ9+pWVkByPbznrVLzYtNba1OSbSE1WBbB7vfLdCX5J43BPo/VIPdUMRKt+wUkJ3f01hprm7V+lR4MOOEYCCFfzasvtOmmWwO1o9BZG6Oh9Nmb1bYin8HW7EnDqp6MSzm+4yjphD5ezT5jXepnFa4qRApYCypqh/YyU6A1dH+B02ipGSYDzmpnXZ9TQhog/v1WNSZdbYWEltdQMj5Zux8feg6/lcfZVXFiCy+iey566UCK9JfAMgYDhwsz7h6381mVmaXwDpnCdmKWE7qeagxjbO/QgRWZ2OV0dbED4+rrdTwtG9FEpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AM9PR04MB7538.eurprd04.prod.outlook.com (2603:10a6:20b:2d8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Fri, 28 Nov
 2025 05:57:54 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 05:57:54 +0000
Message-ID: <a5bf0f9b-e9db-478a-986c-736121e43724@oss.nxp.com>
Date: Fri, 28 Nov 2025 13:57:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,1/2] pmdomain: imx8m-blk-ctrl: Remove separate rst and clk
 mask for 8mq vpu
To: linux-media@vger.kernel.org
References: <20251128025117.535-1-ming.qian@oss.nxp.com>
 <69292671.920a0220.251399.2344@mx.google.com>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <69292671.920a0220.251399.2344@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AM9PR04MB7538:EE_
X-MS-Office365-Filtering-Correlation-Id: 23bcff35-11ce-44e8-27e7-08de2e431217
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|19092799006;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bTlmVmVPTmp1dnJrUFdRNHdQdG8ya0VSRDFlOG55VUpmeklvZVh1Qkluellu?=
 =?utf-8?B?blVDcy9HallseEpSSm1jTjVRYkxPOS9CQmRES25sTUlEQ3EvbkVxUWRZZXMy?=
 =?utf-8?B?L29ienJNNXZXOWhZNG1ia2NKdm84ZHg2NzU3SFI0RzlvVk1aVW9LL2JHcGFw?=
 =?utf-8?B?RWlnNzh0dDcyUXRDSm1DYkk2amVwZ2huNTFxRGZLdGdSRnFZMldYckxIRmpV?=
 =?utf-8?B?UXRQRkNOeEtOZTIzS1lSUGZxMkZSRTdicEVFSkNHajZteldJMW52ZTBzNnRi?=
 =?utf-8?B?dTZGVUgwZGZ2NUtGMjZDVWFrZGJGWG9ESUdjQ05XUkQxaVJ2cjdMaHhGTGNP?=
 =?utf-8?B?OEU4NGMwMG1hUzhqZmR0eE4raGU1VTk2enh5K25IS21FNjlrM3MwcXczVVF0?=
 =?utf-8?B?SmpTNjJYbkpTRTc1OGpQN2g2bnQrZnlUZktHSnNQdGQ1TnBlTW5seUp6bU94?=
 =?utf-8?B?VGRHNjUyd1pTTFA3a1ZJU25Vc2l0OEoyRHhtV0RQWG1CZlorSDBIdXYxVzk2?=
 =?utf-8?B?ZDYyZmhvbjllNFJFZ3JUQW5uVGVsV0FVRlpKazV0MFNQSzE1M3ZkdWNKWU5q?=
 =?utf-8?B?aUk1YkpYQlRCbk9qcTlSNFl5S1hvOWZYMzFOQTBQelRKNzg4WVhQTHd2RTNS?=
 =?utf-8?B?OUlLTnZCaERPVWtiVy8vcjRFZ3BxalJoV3AvSzQ2U05rQ09XODljemd0VkJn?=
 =?utf-8?B?V0xiK05kcEJ3cTRseVZrbStCRFRVT3VKS1c4SWRzT0pzOS9CYkdwL2ozR1ZN?=
 =?utf-8?B?Q2FGaFgxVUhScjNYUmhOVW4wcjJIR283UWxwcjNkUk5MNjVEWkxMVHdoeXBo?=
 =?utf-8?B?ZXpOSEtncjNjbEwwNng0amt3L2hRNTNTbFdZbXNWZEFDQ0oyWVlEU2hzTDN5?=
 =?utf-8?B?SnpkajJVOW5UekFvV0xiTnZMbjJVais3Tm9hN2d2cVdYc2x6SHJvVjRDY3p0?=
 =?utf-8?B?ZGxUYmZkTjFIVVNGSTJVWHZxQnRwL1BpcTc3bTFHczl5T0d5ZmtOTklHdUhO?=
 =?utf-8?B?dmZzR0RLZjFnYUNkdnJHZDIzWUZTRDY2YkxLVU1qQVExSjc0c0tsRndzZngv?=
 =?utf-8?B?eDlMYU52Z2pVK2gxbEplSGlJcDIzU09aeVdDZ3llMmdlMjI0WVpIL09KcTEw?=
 =?utf-8?B?YWtmcjZJYWNwdkZSbzZOM1pGSVFVRmh3ekhxTDBDaGN6SFF4VHN6eUlmMjVL?=
 =?utf-8?B?ejJHL3QzWjN6RDdhdHBldDR6UGpyMVlWRXJJaEkwekJGbysvMjRtMStCdm5N?=
 =?utf-8?B?KzJMRk9qajNxNVJaT2oxRDVjcUgyQUgzOFVRRnZZN3NJUmlNVmpOVVdWNHhl?=
 =?utf-8?B?allENlh3OUc3SXJPOEVjU2lxYmJuK0ZtU0NtQi9Id0ZPS2lEYUZFQ0Y0ZDRC?=
 =?utf-8?B?VGR0TDZnaW1jVUdHZHR3MEJSZFBVSS9CdVVMby9aNmlxSXBWRFBCRmsrbFlP?=
 =?utf-8?B?bGI0emtrOUdvVzZMNGFHZ1pvY2lYTGMxbzZlb0FHRExCTmxoWmppc0pIYVFW?=
 =?utf-8?B?MitzMzBsWllhaTE4TERRWjZCVlBkZndlcXhzclJzVDlYVkY1NnhOS1NxelBz?=
 =?utf-8?B?TVp5a214UDVnZHRQTUJBb2ZzMkxOelFUd0NmZ1V5a0NWMkswTnVsYTJWOWlU?=
 =?utf-8?B?U1FuR0d0ZWx1b2w1MnBNamZDVWV3T1hTWUZOVHdrZ3puTm5NREhOYzNnZ1V5?=
 =?utf-8?B?UmZtWTM2U1VoQUlRSkdabzFyUkdRQVBaQU8wRjZRMk4xNzZYTkhqS28zZ05t?=
 =?utf-8?B?bURRUDUyMlNYdEo1Um95M3pOSW9BU21McWtKcDkxQ0h4Y3B3d3FxMzhnNE9i?=
 =?utf-8?B?dFEraHUvUzNTZ2dXaHlrRTE1VWlIbitmanBJdWdpUHk2cHJNcWQwcUZMdkdn?=
 =?utf-8?B?YkwrdnNmY2M0WkJwbGxOdXlzWnlKZm5DVkxrRkd3T0RDeGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qm11Q2Jhak93Q1l6YlFUVmMxZTdzNUR6NkVqbCszWHhVL1ZzOFhkRUczUDhX?=
 =?utf-8?B?K1QxcGc5ZmppWG14alhlczJhaTZpckJHS05QS0kvdFk4MXN2MktDaHJ2c1Bh?=
 =?utf-8?B?VnBDeWZlc2dtd01nM0Y5YTV1MXlWNTJKSmZJdm4zblpMbEM5Tk9WbVJaVVZz?=
 =?utf-8?B?Q1hlSXdURzVDQUFLL1E0eGlmUEROQkp4cDdISkRNbmFQQzNWQytjNW1iTTdj?=
 =?utf-8?B?UFdaditEaFlocG95RzJrYXh0eEhVVERiTlJRQVdLU2xEUDZyU3Q0WHNjeENk?=
 =?utf-8?B?UHQxNXM1U252UGllUmNHZHlNNUI1SnFleWJJZDVsc3NEQ2N5NXRZQzFqU210?=
 =?utf-8?B?QnltUURrRm9RbFdUangwWnBQUitFNkp4bXdzZzZQdGhSSUJFaUIxcTZnaVZj?=
 =?utf-8?B?S1piVHRsbDVSSHVYUGJ2Q1FJaXJJa3Y1b3BCbGsrNU5jaEtZM0Y3RU83TTRR?=
 =?utf-8?B?OUpPMSsyS0Zkbnl3WXdhN2p3WWNkeHZscTZnRDc2TXpYR0VTVW14Z241aGh5?=
 =?utf-8?B?dW5OK1hFRFVGaWxBOVZvWmM4S05CQVZ2MXBIWmFGRnMrdkhkeUJwWEJqcXo2?=
 =?utf-8?B?Y0ZMUTl1NnBVNWovbURaQzN2Y0MyU21vMnZuVmlTbGh6cTdmTkNZNjFoY2VC?=
 =?utf-8?B?R3BjOHBYbWdlbGNTWWQ3cEsyblNqWXNtS0VOa1RXUC81RUVFdlRleUZuMXhl?=
 =?utf-8?B?ZHhmdEkxdW9JaFY3OVYwYUNaUXhZNmRPWmZXb0x5dzlXL0crZ01lOUQ2cm13?=
 =?utf-8?B?Sm5VS0g2cHFTakVyRWhhOGExRktiQytoT3Q3RHpyTEF0cldid2NSUitwRzhw?=
 =?utf-8?B?cEZWN0RrQ2tra1ZWbUdDa25yMElEV2pqNklvNFNvaTIyWTBtZWloOGoxRTN2?=
 =?utf-8?B?R2tvSnZNVzcwS244NDVPQk5aRncvbmtEU2pGcVhVRXVBRUJ1WEN0amFNMFhL?=
 =?utf-8?B?cWdZdnp3VEhtTVI4N2lhUlBPSEZUQnlBR244RGJuckRuYTVGQnlzNmFUUXlQ?=
 =?utf-8?B?N1JzRWloMHhWNUdBVnZqNFZnZFJEZjB1WlV2OVBsUDdFb1E0MDdORlhHZm5U?=
 =?utf-8?B?S2pvL0tXQUNiZjllZUJQL2NtbXo2OFZMbjhlSlM0ejZoYnFaUTN2L01LMkdU?=
 =?utf-8?B?UU4zTDV6ZjdzczduRnJIUW80azBYYVhXNk1KRmxsTkVrcEZZNUliZG96N3Rl?=
 =?utf-8?B?aGN3YVFOQkxCV0Z2aG9nbUZYS0ZaUE82VzUwWU5KNlg2bEVkMkhvNllSeUpD?=
 =?utf-8?B?aWhOVlZZVmVyVU9EMVpDRFpKRDkrUTlHVnZzVTdXVVZWMmhPTWhkaXliVjdm?=
 =?utf-8?B?d3dqNUFhaEdOWjZ2UjdCYXF1ZCtndDJ4VUNjc043OUpycnA3REhiTXg3WFR4?=
 =?utf-8?B?eGZYMmFLUU9HbzJ4VjN4clE1akQ3RHRqdHYwMVdSUWJ1MktoQmk1R3piMEtJ?=
 =?utf-8?B?NE1Mb2VDeElhaS96UDBUNXVTaGlDSWU5SGx4TTJoS09FSzBWaVd5bVB2WGVV?=
 =?utf-8?B?K0RhRVNFSXJBejhxWFpoYi96SmQzQ2FIcXloU0I3RFdSL1FQeTZtdlh0cC8y?=
 =?utf-8?B?YW1ZREd5N0lVMG82SklGQTMyanllZ2xISHFnalJIMXYvNEtPSEFtS0tyb1d6?=
 =?utf-8?B?WjdCYTYwZ295b1ByUGZlL3NhWGxmelNGdXZKYU1YQnIzVFZXOVUvbHdMQ2lB?=
 =?utf-8?B?ZmdvTytjaThRNnpXMXRrMlpCWXFxVkluWjFhOEkrZjNIOVNTNHloWWsrQ3JY?=
 =?utf-8?B?RmhRMkFXdlcwNU9DelNoek9UNmREa0l0aW82MkRQVGxSVnhNd2lnSUVObG9w?=
 =?utf-8?B?OWNkM1FvVDdVUFJsZTZ2Wit4MHBDSytyeVJCVVgvdVBaTTIrY1RMeWdxemFS?=
 =?utf-8?B?UUIzSTlBOHZKODA0Zi9pcU9RYmhMeVZjSGpCOWl5ZU4vdmVjRDA1dEVIOU9N?=
 =?utf-8?B?UXd4WU9XbnFTak1NcFpzNXBneHBtSHVjMlMwOE03TUV2K21hTE44eC9JeDEv?=
 =?utf-8?B?Vzcvc3oxTm9tOUZVWjJ3dkpUTzQ0b1pWTmUzd3JXTUwzQ0prR3VqV0VJd2VC?=
 =?utf-8?B?L0w0VmQvL2dseVo4SHNlRXpWY0ZjUGg4VWZCK3NvZHp6S3lic2l3OW1CVXpE?=
 =?utf-8?Q?6OFBfisPHBNiXncCnoLVhUoBD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23bcff35-11ce-44e8-27e7-08de2e431217
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 05:57:54.5870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XPGcrYZDOf61RxohR+BnFyr8PG02iu15bCVPK8IIv7BJcGxioaUiJuUZxOvrc0JCkTc6hFvmi7Ysw/1dJP/3zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7538

Is this warning due to a file path change?
The file patch is changed in the following commit:

e2ad626f8f40 ("pmdomain: Rename the genpd subsystem to pmdomain")

I have confirmed that the commit id '608d7c325e85' exists.

commit 608d7c325e855cb4a853afef3cd9f0df594bd12d
Author: Lucas Stach <l.stach@pengutronix.de>
Date:   Tue Jan 25 11:11:21 2022 -0600

     soc: imx: imx8m-blk-ctrl: add i.MX8MQ VPU blk-ctrl

     This adds the necessary bits to drive the VPU blk-ctrl on the 
i.MX8MQ, to
     avoid putting more of this functionality into the decoder driver.

     Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
     Signed-off-by: Adam Ford <aford173@gmail.com>
     Signed-off-by: Shawn Guo <shawnguo@kernel.org>

  drivers/soc/imx/imx8m-blk-ctrl.c | 66 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  1 file changed, 66 insertions(+)

On 11/28/2025 12:34 PM, Patchwork Integration wrote:
> Dear Ming Qian(OSS):
> 
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
> 
> # Test checkpatch:./0001-pmdomain-imx8m-blk-ctrl-Remove-separate-rst-and-clk-.patch checkpatch
> WARNING: Unknown commit id '608d7c325e85', maybe rebased or not pulled?
> #13:
> Fixes: 608d7c325e85 ("soc: imx: imx8m-blk-ctrl: add i.MX8MQ VPU blk-ctrl")
> 
> total: 0 errors, 1 warnings, 0 checks, 16 lines checked
> 
> 
> 
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/88804646/artifacts/report.htm .
> 
> 
> 
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
> 
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> 
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.
> 


