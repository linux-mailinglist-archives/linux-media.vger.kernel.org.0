Return-Path: <linux-media+bounces-51954-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEhKJH49gGmD5AIAu9opvQ
	(envelope-from <linux-media+bounces-51954-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 07:00:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B30C86DB
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 07:00:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6461C301411A
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 05:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C6AA2EB840;
	Mon,  2 Feb 2026 05:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UuajPaN+"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011070.outbound.protection.outlook.com [52.101.70.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FFC1B78F3;
	Mon,  2 Feb 2026 05:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770011982; cv=fail; b=EtWpqivYrkvTX3TQzhVErOXq160IHupfxXnVg2V0Dm3EteOxqlT7ozJldLpSOg+cHB+3VIif1By/tckMScACwuhVNqXyu/EiFCsefYfVbdovoIrHwJ6wpudERD+628i+sFyw469xmfJgZ1eEOJTVLpzphy+IDQcB9NZX5cVtVCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770011982; c=relaxed/simple;
	bh=eAKEWMmUJg/Zp4LODR6XKeZHmUXEFdfMbh04paBH5TE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lX9NFSeAJaKeuhiIaPO2y+LAh11iqztxn1hVDw09tYNNhM6gZ2+hwchQFYKUIi+MeMALDkVc/7jgXrTVL7OHu3r9N1nTRRPtQEqZj0zhrZAnCw40tNpC5VwB/kCs4n0o7EphYyuVJso3fmSLp3WYt4u4KX1k5t1d/jjD0KXesj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UuajPaN+; arc=fail smtp.client-ip=52.101.70.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yp2o8kuUeT2IntGKwLsMqNY7WjqzVT53Q/EMHVsTazND3yRNwVRoIN0o0Uwktdl/zCtbNrEQYeWVI0sYYigcEqhldUvBkeSLKliNQQVNWVD2TYEr06jjE4YlG25OyS5JW7YMzQq2KuhfgODjuQBlkSrjNxCoeH4MEyCMTHts511clmrl7JBuY95aIhTtAizvu992viX28HF6Mtzb/y8b1u8bvTeIw7eoT236IopvNQccdUGRG4ZY0tmXJe5spm3I/eHFTXjUkJ4MHu8OtFHpJYUaSk+fsC8nnd8DT3W60EjoRkGGwGlAGBLscth8kLe016vIHuzkA0TpH36Rur/F3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/FtHS18iTHmGhouZ5gF4OqQfT2XiqcooUNCVcfGLxnE=;
 b=jmcMqQcXhRQc57v5jKL4CX9U+dEU/8b7oA2C+vIeYx7MUYVv3bJnTx5FVkjmc7KIX2sIab9HnsB5q5AkOOAwxjFQmX1B/ASa7nzVj0TxKg/gcSy2mQjGmBeIY1t2rkiV6w5zrP21/od27vTIkVLNXUsYC5hiygDF1bUvUSzwwspViNIpG6oPd71JlxS/b4XV4kunBxS78O6EkpZLetBpAV/1gAYPd6q4JtONLsoiLaD3OYWC4Jau/2XqAtM0Mqkv8aESwdezWpTP7q3m3uPV5l6C0DAS8gFr7Rcg0UTw/KsRZm+SiXkNNzB26ZLIPbxe0TuOECOwZASpQKHGncA0KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FtHS18iTHmGhouZ5gF4OqQfT2XiqcooUNCVcfGLxnE=;
 b=UuajPaN+Qf6Oz+bqMTjJU0/wRMp11k2zpwIleJZ9od8kSn/tKL2eGF0U29v1WtxxDO/Br44WUTFcfVxYlqWEu14XePBhVHQbyv8Xds41lFjlQ/DiCVVBtqJrCrTiIMcZM8igOI/hrgy+gpehNqdl0H4pU48S4Z1KFPB+TF59bi8sMLPAcdQKoZUZkBTPReJngGYf1XWAwbh0rQTC43h0H8W4Dc1a0FAVM3XDLG4NiMFQlEVfnhnzYxaHOpL6ZwdigeM5CtZqTaSe77+trV3UABarzSYXXbyfJZxdsXU2lt3vGndMXb3tT+hOzWfJkDLmGLyLilTXSR+YV0r+BtVdcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PAWPR04MB11610.eurprd04.prod.outlook.com (2603:10a6:102:50f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 05:59:37 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 05:59:37 +0000
Message-ID: <092bffcf-d8e8-447d-9795-0fff491b23a5@oss.nxp.com>
Date: Mon, 2 Feb 2026 13:59:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: imx-jpeg: Add support for encoder v1 descriptor
 configuration
To: Frank Li <Frank.li@nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, mirela.rabulea@oss.nxp.com,
 nicolas@ndufresne.ca, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, linux-imx@nxp.com, imx@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260130062236.2109-1-ming.qian@oss.nxp.com>
 <aXzFnXmvZIcqWxZ4@lizhi-Precision-Tower-5810>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <aXzFnXmvZIcqWxZ4@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0015.APCP153.PROD.OUTLOOK.COM (2603:1096::25) To
 PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PAWPR04MB11610:EE_
X-MS-Office365-Filtering-Correlation-Id: c73a0b03-a2c5-416c-0e97-08de62203ef9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWs4M0JzaXNnY0tpeXdPbFJ3U3VjSUhzNlgwcXUvc1ZndGxqWFFJcFlNQnJ6?=
 =?utf-8?B?YXlYWmRrWmgvclg1N3lwcFVjMENrdVg3WDBhaUt2RDFMb3luRWo1eVQyOGxW?=
 =?utf-8?B?NFMrVGJ3bTJQWHRZWXUrcUlDK0xRVG9IOHJCa0R3bDZoeWRUV1hEdDdIVEQ2?=
 =?utf-8?B?VEdnZC9rajAvdEpnSHZtREIxN3FUV3JZVS92TGFWd2dodUROc3FOSDVrcU93?=
 =?utf-8?B?a3RKbUcwcGRnV0YwY2JZTDlDclE2SWxtU1hvMDdaUkZGemNaZmQ2WkM5bHMz?=
 =?utf-8?B?OHBCSCtCemlCRVAzaWFvL3piYzZ1dWlEMVpjMThsc04vQUNJY0YvUGJTejk4?=
 =?utf-8?B?MFJzdjByRDRVVmVHTkljR09NZnByajJFeFBDVS9waHZYZUJZVnJJUysxS1Fl?=
 =?utf-8?B?VithOTRxdm05RFNiT1lNck1Pak5rZFBIREtsMFRDNktlRnlHbUcxVmNhdXcv?=
 =?utf-8?B?U2IyY0ZaYy9MRjBYMWcxSE9mREhPYVlzaG80N3lmY01ldG1RajVEK21USC9U?=
 =?utf-8?B?bmVlRjJaTjZWSmJaS0NPYVNFTFQ0NEpuV0pvOUU0eTd5ZTdxVWZTSG4wRnM1?=
 =?utf-8?B?MWxJbnJQekltMHlQOC9KZmg2OE9UQlBTYW5hNHlYNGVJR3czL3QzNnMzbmQr?=
 =?utf-8?B?dWdaRkRYa0c0NkhhYUk3VytjL202UUlWTFZWRzJ4UDd6SkwxRGJVMHBvQ1Fr?=
 =?utf-8?B?am1aMkk4aER2SGhpVWhCTzF6eE9WWlFiYmxwMmlUZHJuUWJ2WUhzWlVZN2Vk?=
 =?utf-8?B?ZDBsa0dkM1lISjJhTVFDeGVtc3Y2elFoZ1M4L0J3S1dmcFAwTnJJTmFFUlRE?=
 =?utf-8?B?R0M1UmpYSXhZS1ZTa045SWdmK1ltWS9ZSDkwU2JZNzROc1R2bnQ3SWk2ZUw1?=
 =?utf-8?B?ais2cTM3cGFmVTk3eG1Bako3OXRGdU44bUlwNzZJUWVoSHI3bmdjM2d6M1lh?=
 =?utf-8?B?TUpDMGxzNCt1YjMyUjJEZUhSSzVacnhDMFNTeHFwcXYxZGhRSHYzcWdWOWlz?=
 =?utf-8?B?QmNNNUNmV0M4Y3krdlMyRTJXWUxPV0E1UHFLSlJpWU85dkdjMUpVdjZaY3hV?=
 =?utf-8?B?bTloU1daUXpBejUxRmdNSnZYQk96QlM5R05jT1c0WisyV3h0NjdhUHZxMkpJ?=
 =?utf-8?B?eVBMZEZPWmdSazkvZzhoZHdqTHBVVUxadzRIZElxOUNJSTJWaVljSFhIdGho?=
 =?utf-8?B?TUJPajFSY014TlhBaVJLK1BTMjdyQWtEOFpIZEtnazZLcTJmSVQ2OW5LRU5w?=
 =?utf-8?B?Q3NSZE5NUFNtMDFMRkdBOEdEYTRKaFZBSytuckZUT0F0TmZoTjlCNWdPVnNN?=
 =?utf-8?B?YnRPVGxzc05RMFBPeGMzbjhPejduRGkwY1hNU0QxTmt1cmxSVlVWL2dFVEJG?=
 =?utf-8?B?SnFlbG16RkVCZWs1cyt6cTdVOE9TVEZyU3dBY1QzYW93ZjRUemZYOTZwMTZq?=
 =?utf-8?B?VUthSXc3LzgycmNUTExhb2lBZGdXT3hGZTN1cXF0SFJyQUJ0OWs0ZTBEazAr?=
 =?utf-8?B?K044eDRHK2dZdEgzRzV5azFhdEx4c2ZwMlhoVUtFUk8wd2o0R2YvMGgxYU9s?=
 =?utf-8?B?Nk1td1FCd2Y2VXlRUGdXc0tWVFB2aTk1bVBjN2xVSW0xMWxiNEFzRTc1am5K?=
 =?utf-8?B?NVU3R3hKaDJ6d0E0MExvRythVFF6SzVNcWlhYW9weVhINXB1RWVzcy9VeTRF?=
 =?utf-8?B?S1B1bXhoTTVrMjByT3RMZkFjRTZCMWt2Q25vQ2N0M3UxM0pMQVhrOFptWjdW?=
 =?utf-8?B?WnlwV1ZhbzNYbzRTUHlQNElBeDdkZ01vVnVKVWNGcDBhQnkycDlFY1ZuYXVz?=
 =?utf-8?B?eVEwNG4zSW5EK2UzYytRNHFMZU51T3R0Wm4vMTM4cDdZc09LZm55TVNUNlc0?=
 =?utf-8?B?bnhzcGxrWkNQSElyV1FZUUd4RXdpMXNDazB1OTNodkQxNzNXRWpjNFBxWFha?=
 =?utf-8?B?M3JJUUFJNHBVWnFSY3VsbVVTTktLWWFQd292Z0I3Sk94NlZ0bElHS21QK0R1?=
 =?utf-8?B?SGR6YmgwbW5uMm1uVW4rQjRqVXAyMUlScWFONzJhRUc1TVlDTnp1MGUzOFNV?=
 =?utf-8?B?Vm8xTU1OZ1B1eThra1NDSTF0dUxqTzg1L2VSOXluc0ZLVTBVb25sMUlKZkth?=
 =?utf-8?Q?ygq0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WS9PZ2krbG1xd0Z1bUFDVHFHcDgrQnRBVXFEQlJhNlYzSlpGU0FicWg2QStm?=
 =?utf-8?B?RGtjS0hlL3dwWDJlSnVrbks0UmNDWTJxS1h3L1V0VVF4MVZ6ZUdmL3BPb1hw?=
 =?utf-8?B?Qi9iUncxbW80eThhODArQldubW53V1ZHRENNRVlQRStLZkRxd0pmSStSY1dL?=
 =?utf-8?B?YXY5YkNXT1QrMXFkNlhZNzJGVERuWU1WcXhnU1ZmY1Fnay9nTkpIb2xXTkpQ?=
 =?utf-8?B?VVovUW5vUGY4ZTBFYnpsaXlnamsxUW5jSDFzUnVKSTJUYkUwNjVLRis5UUdY?=
 =?utf-8?B?VVFZQWM0Nms5anY2cnoxUGpHY3dVeDBiZkdzV1FxU09RSW9nc2YxWUw4cndZ?=
 =?utf-8?B?eThuMERPZkUreVY5VStqenUydXVPMW1ZWDhOajdIcGpIb1NMMmk4TG1mb0ZL?=
 =?utf-8?B?WUJxOUFwMGJpTk5QckNEdWFpby83WVlUMldEc3JreUZCNXBwdkNVYkl4a0Rx?=
 =?utf-8?B?NUpoOG9HaWJmRklvWnB6TmJZMk9ScTc4VFpkL1Z5L29HRTJvRjBlRFo2dHlP?=
 =?utf-8?B?THJYZFRRM1dhODIwUFFzU0RRaFc1ZmJWaS81ei9sTVd4dGFmM0ZyWldNZVZy?=
 =?utf-8?B?T0lCblFRR3FMd091QXJVM1RhUFpDVzdzd3UwQjBTQTJ5SDNQMEZ5c0xwbFdM?=
 =?utf-8?B?YnF6Si9VTFIwR1dvN3pRb1pPOFdYcWJvWE5UZkNXVUtjNy9pRzRHblhaWE1T?=
 =?utf-8?B?b0hnM1I5ellLVkVUbitmYk1hS3JMQUxGM2VFU2tnL28wZUw5NVg5VUw2ejMy?=
 =?utf-8?B?YS9kZlVwRWp6QTJGYTUzd29TNzhQbURwY0ZVMzRDUUdwbUlod3djYlZYVWNh?=
 =?utf-8?B?aURVcmRCU2s3aEJ2SlVSQkFuRmZIVU5wNFljSXZPT0JwV2tUcEIwa1ZiR0xX?=
 =?utf-8?B?VGpQZ2VFaEg2ZUxUK2UvbytqdkE5TWZXNkJCRmpRSXBtSTJmdGdINU8xQlZr?=
 =?utf-8?B?anBMc1ZzMTBESTM2cDhJYmpqdE9YaUxMUE8zaHVrcklPUWxtWHZtc0hKbGda?=
 =?utf-8?B?REFkSUgrQitjZGc2UFE2ZW9sQXM5dTJlYTZIYVAzdGJFRlRqR29idENpL25U?=
 =?utf-8?B?QWEyT2toSXV4Q3ZXRnRsc0poVUNXc0krU09YaGUyaU9YMTZBZm13cndmN2pD?=
 =?utf-8?B?V2d3ZjlyT2ZzTVJXWU5uRnA4SXlLenl3cEk2V2svenp2OFBOOHViZ3RaYm9L?=
 =?utf-8?B?R1ExbWlIQXI1Z3hvbnpjalZHVE1Ld0g4M3VUU0svZG51Y05tODU4b1ZDcXM2?=
 =?utf-8?B?NG9aZzM5NWRZenk4K1hSQ3E1U2lCZHRBNEtDWnI0NGRseitCaTQzSUNSTGRF?=
 =?utf-8?B?bWRBRm96c3JkSWJPeGFFeTRmSkxDWTZIZEtCTXRQVFpwZXcvSVNGRGdKUE9w?=
 =?utf-8?B?S1pRWVd3bUZNQVVyUDM1ZFFGckx3aGI2MmZ5Qm4wMThnM052d2tHUE1OWUp0?=
 =?utf-8?B?UXRkb2x3eXVXZjJzTkkxTm9INDNhdSt2dDBuYnNGOEZVWE5OVkw5ZGM0YzYw?=
 =?utf-8?B?OWl2RjcyT2Z6dXpLRDlqeVdlZmlwNHVMQVUrV3MzNU9BdGd4ejBTNTR5R1hT?=
 =?utf-8?B?aE5wRlpyckd4R3kwRWZZa3FrbGM1OVQxNm1tN1NUZnZLZWw4UXo3MmVPU2Y5?=
 =?utf-8?B?cXJ1OE9BNlZURGVITXhieWZvYTVlNTNUZWdRSHZJSmg1aDg0Tkx0N3V0N20x?=
 =?utf-8?B?MTRnRjF4NlZDaVF2SnNHVzc2dE04b1doVnFmcTBUME0zSTUxbkowb1JNTTEr?=
 =?utf-8?B?TUFlT2hWeUFSVEt6TWV0ZkordnJ3MVVzd2tBQ0NLQTJCM25IcHJPalNZdXVT?=
 =?utf-8?B?VGlMMlROc2FMdkdXZFA1Ri9hRW0raVM4UG1EYXlidDlpeW9XeDV2T1BwSzI0?=
 =?utf-8?B?b3RXOXkzbG1oUkpQTDhJdVlOazZJOUxjanA1TzRYNG5hckVVUVVQTTZYVDNy?=
 =?utf-8?B?cWxuUUJ0LzdWK0c2b29BL1QvcnZnZG9OVER2M1JpdzJjSjNubEdPMzJvcTVx?=
 =?utf-8?B?RFc0MUF3Uk01a0pqbnN3WTBybWl0R2lhM0dsQVY0MCttdU5rdzhJVWcyaVpy?=
 =?utf-8?B?ajBpaUErL1lISDA3SFZPd3FwaEtLK2tqN0FQS1VjYkZvbURteGdjbkYvK1hi?=
 =?utf-8?B?OGk2NjdHajlWNFVzWE5raEZvWEVyS0lFRTBCK3VZQi9jTWg2NnJCNkp5Z09o?=
 =?utf-8?B?VW53ZUdRVzdHUHQ4L3VyT2w4ekxzNFZOR1pYVnVZbm1jeTcxRCtud2JMQVEy?=
 =?utf-8?B?TTV5MmFXd1lXa29nZDJ0T2RoUlNMR2JHL2YrSEZZZ081VWozTXovWmxZS0I0?=
 =?utf-8?B?T1dqVW4wOUlON3FOSVJ5ZnQ1M0ZFVERZR0tkZTFoNXozUm1vV01MZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c73a0b03-a2c5-416c-0e97-08de62203ef9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 05:59:37.2439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W3aY6Ec2t3pRwovwbpXrgUkPVqlQEl+6WnWmO4rMVeqBdc9SWhbw57/0xoyE/g0A68Xj2X6fbyO/7YTPqKSvZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11610
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51954-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,oss.nxp.com,ndufresne.ca,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 04B30C86DB
X-Rspamd-Action: no action

Hi Frank,

On 1/30/2026 10:52 PM, Frank Li wrote:
> On Fri, Jan 30, 2026 at 02:22:33PM +0800, ming.qian@oss.nxp.com wrote:
>> From: Ming Qian <ming.qian@oss.nxp.com>
>>
>> Support the upgraded JPEG encoder v1 found on i.MX952 SoC.
>>
>> Detect the encoder hardware version via the version register.
>>
>> The v1 encoder uses an expanded descriptor format that allows all
>> encoding parameters, including JPEG quality, to be configured directly
>> in the descriptor.
>>
>> This removes the manual register-based configuration step required by v0
>> and reduces the interrupt count from two to one per frame.
>>
>> V0 encoding flow:
>>    1. Write quality to registers -> trigger config interrupt
>>    2. Start encoding -> trigger completion interrupt
>>
>> V1 encoding flow:
>>    1. Configure descriptor with all parameters including quality
>>    2. Start encoding -> trigger completion interrupt
>>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>>
>> ---
>> v2
>> - Improve commit message
>> - Use GENMASK_U32
>> - make mxc_jpeg_get_version() static
>> - Check version in probe()
>> - Remove noise that update copyright years
>> ---
>>   .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |   1 +
>>   .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 104 +++++++++++++++---
>>   .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |  22 ++++
>>   3 files changed, 113 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>> index adb93e977be9..0d78443cb270 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>> @@ -73,6 +73,7 @@
>>   #define GLB_CTRL_DEC_GO					(0x1 << 2)
>>   #define GLB_CTRL_L_ENDIAN(le)				((le) << 3)
>>   #define GLB_CTRL_SLOT_EN(slot)				(0x1 << ((slot) + 4))
>> +#define GLB_CTRL_CUR_VERSION(r)				FIELD_GET(GENMASK_U32(19, 16), r)
>>
>>   /* COM_STAUS fields */
>>   #define COM_STATUS_DEC_ONGOING(r)		(((r) & (1 << 31)) >> 31)
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> index b558700d1d96..71f4a1d292ac 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> @@ -64,6 +64,12 @@
>>   #include "mxc-jpeg-hw.h"
>>   #include "mxc-jpeg.h"
>>
>> +#define call_void_jpeg_enc_ops(jpeg, op, args...)			\
>> +	do {								\
>> +		if ((jpeg)->enc_cfg_ops && (jpeg)->enc_cfg_ops->op)	\
>> +			(jpeg)->enc_cfg_ops->op(args);			\
>> +	} while (0)
>> +
>>   static const struct mxc_jpeg_fmt mxc_formats[] = {
>>   	{
>>   		.name		= "JPEG",
>> @@ -1030,11 +1036,7 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
>>
>>   	if (jpeg->mode == MXC_JPEG_ENCODE &&
>>   	    ctx->enc_state == MXC_JPEG_ENC_CONF) {
>> -		q_data = mxc_jpeg_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> -		ctx->enc_state = MXC_JPEG_ENCODING;
>> -		dev_dbg(dev, "Encoder config finished. Start encoding...\n");
>> -		mxc_jpeg_enc_set_quality(dev, reg, ctx->jpeg_quality);
>> -		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
>> +		call_void_jpeg_enc_ops(jpeg, exit_config_mode, ctx);
>>   		goto job_unlock;
>>   	}
>>   	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
>> @@ -1272,6 +1274,7 @@ static void mxc_jpeg_config_dec_desc(struct vb2_buffer *out_buf,
>>
>>   	jpeg_src_buf = vb2_to_mxc_buf(src_buf);
>>
>> +	ctx->extseq = mxc_jpeg_is_extended_sequential(jpeg_src_buf->fmt);
>>   	/* setup the decoding descriptor */
>>   	desc->next_descpt_ptr = 0; /* end of chain */
>>   	q_data_cap = mxc_jpeg_get_q_data(ctx, cap_type);
>> @@ -1335,9 +1338,15 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
>>   	struct mxc_jpeg_q_data *q_data;
>>   	enum mxc_jpeg_image_format img_fmt;
>>   	int w, h;
>> +	bool extseq;
>>
>>   	q_data = mxc_jpeg_get_q_data(ctx, src_buf->vb2_queue->type);
>> +	extseq = mxc_jpeg_is_extended_sequential(q_data->fmt);
>> +
>> +	ctx->extseq = extseq;
>>
>> +	memset(desc, 0, sizeof(struct mxc_jpeg_desc));
>> +	memset(cfg_desc, 0, sizeof(struct mxc_jpeg_desc));
>>   	jpeg->slot_data.cfg_stream_size =
>>   			mxc_jpeg_setup_cfg_stream(cfg_stream_vaddr,
>>   						  q_data->fmt->fourcc,
>> @@ -1348,11 +1357,6 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
>>   	cfg_desc->next_descpt_ptr = desc_handle | MXC_NXT_DESCPT_EN;
>>
>>   	cfg_desc->buf_base0 = jpeg->slot_data.cfg_stream_handle;
>> -	cfg_desc->buf_base1 = 0;
>> -	cfg_desc->line_pitch = 0;
>> -	cfg_desc->stm_bufbase = 0; /* no output expected */
>> -	cfg_desc->stm_bufsize = 0x0;
>> -	cfg_desc->imgsize = 0;
> 
> this change and memset belong code cleanup, it'd better use seperate patch.
> 

Sure, I'll make it a separate patch in v3

>>   	cfg_desc->stm_ctrl = STM_CTRL_CONFIG_MOD(1);
>>   	cfg_desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
>>
>> @@ -1372,11 +1376,14 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
>>   	desc->stm_ctrl = STM_CTRL_CONFIG_MOD(0) |
>>   			 STM_CTRL_IMAGE_FORMAT(img_fmt);
>>   	desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
>> -	if (mxc_jpeg_is_extended_sequential(q_data->fmt))
>> +	if (extseq)
>>   		desc->stm_ctrl |= STM_CTRL_PIXEL_PRECISION;
>>   	else
>>   		desc->stm_ctrl &= ~STM_CTRL_PIXEL_PRECISION;
>>   	mxc_jpeg_addrs(desc, src_buf, dst_buf, 0);
>> +
>> +	call_void_jpeg_enc_ops(jpeg, setup_desc, ctx);
>> +
>>   	dev_dbg(jpeg->dev, "cfg_desc:\n");
>>   	print_descriptor_info(jpeg->dev, cfg_desc);
>>   	dev_dbg(jpeg->dev, "enc desc:\n");
>> @@ -1388,6 +1395,54 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
>>   	mxc_jpeg_set_desc(cfg_desc_handle, reg, slot);
>>   }
>>
>> +static void mxc_jpeg_enc_start_config_manually(struct mxc_jpeg_ctx *ctx)
>> +{
>> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
>> +	void __iomem *reg = jpeg->base_reg;
>> +	struct device *dev = jpeg->dev;
>> +
>> +	ctx->enc_state = MXC_JPEG_ENC_CONF;
>> +	mxc_jpeg_enc_mode_conf(dev, reg, ctx->extseq);
>> +}
>> +
>> +static void mxc_jpeg_enc_finish_config_manually(struct mxc_jpeg_ctx *ctx)
>> +{
>> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
>> +	void __iomem *reg = jpeg->base_reg;
>> +	struct device *dev = jpeg->dev;
>> +
>> +	ctx->enc_state = MXC_JPEG_ENCODING;
>> +	dev_dbg(dev, "Encoder config finished. Start encoding...\n");
>> +	mxc_jpeg_enc_set_quality(dev, reg, ctx->jpeg_quality);
>> +	mxc_jpeg_enc_mode_go(dev, reg, ctx->extseq);
>> +}
> 
> If I do this, I prefer mxc_jpeg_enc_start_config_manually() and
> mxc_jpeg_enc_finish_config_manually() as patch, just do code re-org.
> 
> Then base that, add mxc_jpeg_enc_configure_desc() will straight forward.
> 
> Some maintainer accept this if change is not bigger.  The squash patches
> is trivials by maintainers.
> 
> Frank

OK, I'll split them into separate patches in v3

Regards,
Ming

>> +
>> +static void mxc_jpeg_enc_configure_desc(struct mxc_jpeg_ctx *ctx)
>> +{
>> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
>> +	struct mxc_jpeg_desc *desc = jpeg->slot_data.desc;
>> +	struct mxc_jpeg_desc *cfg_desc = jpeg->slot_data.cfg_desc;
>> +
>> +	ctx->enc_state = MXC_JPEG_ENCODING;
>> +	cfg_desc->mode = (ctx->extseq) ? 0xb0 : 0xa0;
>> +	cfg_desc->cfg_mode = 0x3ff;
>> +
>> +	desc->mode = (ctx->extseq) ? 0x150 : 0x140;
>> +	desc->cfg_mode = 0x3ff;
>> +	desc->quality = ctx->jpeg_quality;
>> +	desc->lumth = 0xffff;
>> +	desc->chrth = 0xffff;
>> +}
>> +
>> +static const struct mxc_jpeg_enc_ops mxc_jpeg_enc_cfg_ops_v0 = {
>> +	.enter_config_mode = mxc_jpeg_enc_start_config_manually,
>> +	.exit_config_mode = mxc_jpeg_enc_finish_config_manually
>> +};
>> +
>> +static const struct mxc_jpeg_enc_ops mxc_jpeg_enc_cfg_ops_v1 = {
>> +	.setup_desc = mxc_jpeg_enc_configure_desc
>> +};
>> +
>>   static const struct mxc_jpeg_fmt *mxc_jpeg_get_sibling_format(const struct mxc_jpeg_fmt *fmt)
>>   {
>>   	int i;
>> @@ -1593,12 +1648,10 @@ static void mxc_jpeg_device_run(void *priv)
>>
>>   	if (jpeg->mode == MXC_JPEG_ENCODE) {
>>   		dev_dbg(dev, "Encoding on slot %d\n", ctx->slot);
>> -		ctx->enc_state = MXC_JPEG_ENC_CONF;
>>   		mxc_jpeg_config_enc_desc(&dst_buf->vb2_buf, ctx,
>>   					 &src_buf->vb2_buf, &dst_buf->vb2_buf);
>>   		/* start config phase */
>> -		mxc_jpeg_enc_mode_conf(dev, reg,
>> -				       mxc_jpeg_is_extended_sequential(q_data_out->fmt));
>> +		call_void_jpeg_enc_ops(jpeg, enter_config_mode, ctx);
>>   	} else {
>>   		dev_dbg(dev, "Decoding on slot %d\n", ctx->slot);
>>   		print_mxc_buf(jpeg, &src_buf->vb2_buf, 0);
>> @@ -2842,6 +2895,14 @@ static int mxc_jpeg_attach_pm_domains(struct mxc_jpeg_dev *jpeg)
>>   	return ret;
>>   }
>>
>> +static int mxc_jpeg_get_version(void __iomem *reg)
>> +{
>> +	u32 regval;
>> +
>> +	regval = readl(reg + GLB_CTRL);
>> +	return GLB_CTRL_CUR_VERSION(regval);
>> +}
>> +
>>   static int mxc_jpeg_probe(struct platform_device *pdev)
>>   {
>>   	struct mxc_jpeg_dev *jpeg;
>> @@ -2976,8 +3037,23 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
>>   	platform_set_drvdata(pdev, jpeg);
>>   	pm_runtime_enable(dev);
>>
>> +	if (mode == MXC_JPEG_ENCODE) {
>> +		ret = pm_runtime_resume_and_get(dev);
>> +		if (ret < 0)
>> +			goto err_check_version;
>> +
>> +		if (mxc_jpeg_get_version(jpeg->base_reg) == 0)
>> +			jpeg->enc_cfg_ops = &mxc_jpeg_enc_cfg_ops_v0;
>> +		else
>> +			jpeg->enc_cfg_ops = &mxc_jpeg_enc_cfg_ops_v1;
>> +
>> +		pm_runtime_put_sync(dev);
>> +	}
>> +
>>   	return 0;
>>
>> +err_check_version:
>> +	pm_runtime_disable(&pdev->dev);
>>   err_vdev_register:
>>   	video_device_release(jpeg->dec_vdev);
>>
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
>> index 9c5b4f053ded..c00c13549746 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
>> @@ -81,6 +81,17 @@ struct mxc_jpeg_desc {
>>   	u32 stm_bufsize;
>>   	u32 imgsize;
>>   	u32 stm_ctrl;
>> +	/* below parameters are valid for v1 */
>> +	u32 mode;
>> +	u32 cfg_mode;
>> +	u32 quality;
>> +	u32 rc_regs_sel;
>> +	u32 lumth;
>> +	u32 chrth;
>> +	u32 nomfrsize_lo;
>> +	u32 nomfrsize_hi;
>> +	u32 ofbsize_lo;
>> +	u32 ofbsize_hi;
>>   } __packed;
>>
>>   struct mxc_jpeg_q_data {
>> @@ -105,6 +116,7 @@ struct mxc_jpeg_ctx {
>>   	unsigned int			source_change;
>>   	bool				need_initial_source_change_evt;
>>   	bool				header_parsed;
>> +	bool				extseq;
>>   	struct v4l2_ctrl_handler	ctrl_handler;
>>   	u8				jpeg_quality;
>>   	struct delayed_work		task_timer;
>> @@ -125,6 +137,15 @@ struct mxc_jpeg_slot_data {
>>   	dma_addr_t cfg_dec_daddr;
>>   };
>>
>> +struct mxc_jpeg_enc_ops {
>> +	/* Manual configuration (v0 hardware) - two-phase process */
>> +	void (*enter_config_mode)(struct mxc_jpeg_ctx *ctx);
>> +	void (*exit_config_mode)(struct mxc_jpeg_ctx *ctx);
>> +
>> +	/* Descriptor-based configuration (v1 hardware) - single-phase */
>> +	void (*setup_desc)(struct mxc_jpeg_ctx *ctx);
>> +};
>> +
>>   struct mxc_jpeg_dev {
>>   	spinlock_t			hw_lock; /* hardware access lock */
>>   	unsigned int			mode;
>> @@ -142,6 +163,7 @@ struct mxc_jpeg_dev {
>>   	struct device			**pd_dev;
>>   	struct device_link		**pd_link;
>>   	struct gen_pool			*sram_pool;
>> +	const struct mxc_jpeg_enc_ops	*enc_cfg_ops;
>>   };
>>
>>   /**
>>
>> base-commit: c824345288d11e269ce41b36c105715bc2286050
>> prerequisite-patch-id: 0000000000000000000000000000000000000000
>> --
>> 2.52.0
>>


