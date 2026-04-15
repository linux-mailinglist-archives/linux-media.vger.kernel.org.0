Return-Path: <linux-media+bounces-58792-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJhJNw1J32mFRQAAu9opvQ
	(envelope-from <linux-media+bounces-58792-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 10:15:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E359401CD8
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 10:15:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA3D13012C7B
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 08:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B983B47D9;
	Wed, 15 Apr 2026 08:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="COfIA1g7"
X-Original-To: linux-media@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011063.outbound.protection.outlook.com [52.101.62.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D3F3A0E8E
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 08:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776240820; cv=fail; b=Ym1YyGnRUmQUm5j6yri/bUd/40j+4KZuvQHFZMKCM+Rx4BsY5LbhMtOF/EqtcNDt3N1P+9m+bIjwc865KrgnZ4XjJYm74cynccevg2boybe76R9D5RG++h9o2IdFElcIiZb4KXsXeaqQoI3zXnOd+kXIp2zHkgczATCvIuUKlB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776240820; c=relaxed/simple;
	bh=DriBMk0o6IhFRUxGmrZBtXHv5KsQ6JVn2DQLzgS28H4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=koEJzzVFIAROQuB4vyZ6P/FQA/Vyw74SyNYwyTLEsg1L3WBpkTQ7q6SMg/FzTT6o6UsZUvMUCL0YDivg1cIFeCb9sAkVtjWtESSRma1sFionhOXUSnjQKn642sr4039giJ30XZX4uBx9NyAydU/bYHsV7dzKB7BzHmHCH40HpRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=COfIA1g7; arc=fail smtp.client-ip=52.101.62.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k976mIoS0FVE1ei6WQf4XcdIkrFXsPUgYoZpoeVDVFxJAADHLtFoL3CNOB/MmP5WVGQ6uvazjO7kdEP0hwoXpoz9YlLyQhNk/vJQAhnXTDEk4KigWbFAdE+/YfrVADcuDRgAVJmtsWwo58Ed1PzFhLt2CCggzv/czWJVVhnqgxP9hZGHVC4PDfxuOcvUEPHdbW0nX8xQwAWcnYgZiZ4INxtmupkEFEiUaebxUP7oiAJTMkYqbZAqszbJH6wrMDbyZdAP7+6e018ROjuDc2Rrrqt/ZElJB1CxBlTA4TMSprBOezF9q6bJlhc7pgq6iwU7i8ATw0Swl/3WgTidiH36SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJGA8BjFVmbHRgu+EtVP7QLihP04KoXqpy/5E3rXk/g=;
 b=P0Zmp2Gme1QyYk/Yvtc3TeVRrO9NNryqkUqbib8Yi36XlpkW0IRhQ1U4o0B9NDHMurok543tCDuoPFj6oYOOMfnZM9SyIlK5o1mpWU2pXABTxuDyL0OiuFJudgzaCsFie00JELD61ODiiUn1LeWcsVQndUL/B1BueT388dx4tCU2BSs709ueySoa4yV+7xthDvBlxzqv334HKOlaVScO5hRzA/IPDUHBeM6ACEp4lCh57fdbFMvnWv/VTU43nQorf9iImzV07p5ExB9ebiSPGrqZ2noJdVh+2v3pa8ikn9Hz9QVNVGnGEqFbaEvHDB7bva4z3IsnsMAqf/4C1UbooA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJGA8BjFVmbHRgu+EtVP7QLihP04KoXqpy/5E3rXk/g=;
 b=COfIA1g78DOEeETEFqxI0nm90Baar/fhqa1kg4IGGzP2zhp20skq7EbRfY/VWOpR8kAw/bBn9r+8/vQvWh83PrTrOdQ5Qz/ANYLk+qVYlvy4l98fKGKtXtSlkFXQOCHWOk8IEDcaLlZ0sfq0GQaJHEakhcZfC8zMCuZaIuREy5g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB5769.namprd12.prod.outlook.com (2603:10b6:8:60::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.34; Wed, 15 Apr 2026 08:13:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 08:13:33 +0000
Message-ID: <b3b75077-878b-4d4e-b18e-4976765c63db@amd.com>
Date: Wed, 15 Apr 2026 10:13:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dma-fence: Fix potential tracepoint null pointer
 dereferences
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Philipp Stanner <phasta@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260414154928.32934-1-tvrtko.ursulin@igalia.com>
 <20260414154928.32934-2-tvrtko.ursulin@igalia.com>
 <650e835e-b60d-44fd-b212-47f8a9d18c15@amd.com>
 <5fea79b5-ab5a-4a98-95c8-6452b20e83c4@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5fea79b5-ab5a-4a98-95c8-6452b20e83c4@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:208:256::35) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d703ebc-0f62-4ee8-c791-08de9ac6e287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	AhvvHs3xI9XpEK788Afsv0bYZmAbwfO5pd2FVCo50Nv+gx1hKVbQX7PfC4n0YkvtmKWJ9Ov2DLWkWLRIuHq9wFZIudPmwpyQepv7IjK5qidcpGfybJv2mXKeULRBRlYS7rDeSlracGHmbwQWLwNebWCGfIKqeIj14uPC103cCCTVTOViWvcdbFhOtRCKDTtx8cfr4TxVNEi5phdPQ2h50lPAM568bzGcb9lGY0Iu60aaMMersI94k3jLvz9D5tBxIcgARH34RXbE33kCU8UHPXYXtkvdyFgzT/MjmLFWuHLyAQmi/cM21Ca9SQug61RUsgnTJQoC4HHR39aoZVImFX04NEMp4HrKUasEH/RRY0UffSqxiTTQbsNyiomNjUcxLY9j60jUhWvWjwLLVKmDY/ukt9RgbOW7i+sXdt5taVv3JUt8Z523zxuHOVoytrwn1xmwv+fZ8Ur/aKubG+sRavcsCGD3mEibFHmDdDWWiyiz0g6EzPkBkk/Ht7fBeARKnZQN7kn7EzsGBlMGNDoBg3vOwW3BuAInWQoRhEDMJsUUzm+5ikMXU6Nk37xgVXnPWApmR/5txk65IVQyZZkhSlIyxxOxGJosfkQHHCUA/DoUSFZgCwn9YpGEWUSozuIOPqwkvMAuyys+VRfODUxOATjWgvXTkqURAEGvGPKGMhDikbGBvNUov05Q1UAJz3Q40zgEvQ3+7qtXQQ6KNln/5X/VAOtUpmn+vkUEaduGRsV3BBqqzDJHa1UWkr4hyDd0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WW1hdGZJQWV2NlBaYUhnd29zd2FrWHVCMkJRbGJ6VDVwanRJODNpeVNPU1du?=
 =?utf-8?B?RUtIQjBhSTcrOWZlTUlCN2VJMGFLZGRpb3lJbnNwZDJwN3dtWXM5Nkk5K055?=
 =?utf-8?B?WU9YRTEvSG81TnpYTFJTZEFoSkRtc1pNRzFHKzdWN0I3Zlg0aFlYL2U4c0sw?=
 =?utf-8?B?VjZYcENOWWVjZlFpa1hiaU5jdFU5Ni9IZzNIdHdFTFk0N2Uva1ViUmpPYjJp?=
 =?utf-8?B?RWdQM0EvSE43RkdObnIzaWU4TWw1NnlmcWtVUmlxQTNyZy9MYmwyelBraGJ4?=
 =?utf-8?B?SUxlMkpQYTFXMnY3RVRlakgvcFdHOHRjR0oxamFxWngzN0o3QmhjNDBUNE9w?=
 =?utf-8?B?REtYaFFFQWx5NjFIS2J6dzRnSEpPY3lNZXJQQzhnU0FmaGJ1b2JTRkxqc1dj?=
 =?utf-8?B?V2hDMkIwbEZoTGJXLzhCYy92ZFZ6ZHZmMDVnWXBNdXhhK21zYTFSWEhTQ0dz?=
 =?utf-8?B?S2IyMFdOSUorUEFuTVoxK1JzcmpaVitmVDdNdWNSVWo5WVpIcEplZkdRMHJ3?=
 =?utf-8?B?eUppbFBVenFqa3NzLzU5ZUdwZFByVWI0eHRjcHpVRm03SE9UUWdhMjZZTk1y?=
 =?utf-8?B?c3dwbUNHcmJZODBmdEMzL2U5WXNCTUJ1MnZDYnRadytzVHVoT1NYcUxNRW1Q?=
 =?utf-8?B?RXJLcTZySnpVU2NMRS82TDBXT2JGN3J0ZER6M3dTNUFCN28wMmIrN3hhdy91?=
 =?utf-8?B?STkvbGU0eHk1Z3J1ZkNoUUVRbTZYS3YrZ280VjlwOEwwSzFnbXY1empnYktR?=
 =?utf-8?B?YmRTTmorM09tblZyQVJCQU0yaHVqbUMrbjZmLzdRek9yakIrU1Zyekc2WExI?=
 =?utf-8?B?cjBBWjkvMVd5eXBza0xmQ1BjQ3V2K0hTV2FLeWVISFZocEdYdzEyZFhVN1FH?=
 =?utf-8?B?TTlrSzlycUZ1QUNOSnlvNi9mc2QwTWtvL0hMcHdLUDNNbldIb2RNWXBNQzRo?=
 =?utf-8?B?Y2ZFMVM3cUxNNEM2SFBtTVZVd3J6a0F3OXR1UkxNK2lQeVlRK0VManlZaC80?=
 =?utf-8?B?Q0FvTldWcEVKNUlUSHZnYVAyQ2hNeDk5c1c3dTNwOU52R2o1S3F2enE4bDFn?=
 =?utf-8?B?NmdFOERwOXAzbmhqdFdoUXRkVU15aFFId2dJY3VYcFZONTdwdTM4eFFkd3VL?=
 =?utf-8?B?cGcyUmIzMncvU0xIZzJrNEQxT2VHM0FvRk1TZEc0SzlvMFFJUVlLWjBsNlNu?=
 =?utf-8?B?YUZTbHl3K1o1Z2NwUlRxRFg1UHRSSzk4K05ma1JOT1hlSTZrT1hPaVdwMmJ3?=
 =?utf-8?B?OVBHZGhnc3VvWUEyUmpnUUxkMkNkb3FMeVpZSUQ2enlvTlNEb3ZzWXJxU0lK?=
 =?utf-8?B?RXc0cDJhbU5Qb2h3VEpzR0tSSU5XSzVodGtqckcvTnhFMGo2bklFSDZ5Z0NF?=
 =?utf-8?B?TkFoMkQzdEY5Q1dzTTloMmdsNnhMai9tTEpTYnB4SDRQZkdyTk5GWGs1YWJB?=
 =?utf-8?B?Ry9ROGJUanBtWThKeXlXM1hOZkpuUkR0U1RnRE83Y3hqQVR5TC9IODhnK1ZR?=
 =?utf-8?B?c1pZazEzTEoyTGJLM3hEbUEzZnFzZGE2ejM2a0VURGRyWFAwTmVON3RYQnVJ?=
 =?utf-8?B?T1NHejBJVVdMSk1FQmR1dnB6WEhMUmdOMWNHK0xteHVNQUhMejBuckxoSnB2?=
 =?utf-8?B?ZDdiR29ZU21GYXV4SDBnWElvS0RBSmdqZ2tyVFhhdVNCSlRsaTl3WDRkRkgx?=
 =?utf-8?B?ZTdFTXhvVFdLaklCWWtqeXlJNjhvRVhlWE9SZ3JiakU0cUlHZFZjUTJ0ZjZX?=
 =?utf-8?B?OG9QSVY5VkJoMFBMUEF6Y0VvbmRrME95RE1UTWVNNHh5V2krZ3BIeit6Yk04?=
 =?utf-8?B?SUFlVGx3TTdZR1BZMS95Vmc5dE0zaWZVUm1hUy9OMzdFbndMZDFPZHZJMnRP?=
 =?utf-8?B?d1F0M0RpbFdGTDZRb0xtY3pCYUIrZ0huQ1BRU0E3Skp6N2xmQ1J5Y2FONU1L?=
 =?utf-8?B?dnljTERTOE9LM3lxK1JjRHBDQmtwU0VGbE1yZFgyQnhuWVVDSzFiVVY0UTJo?=
 =?utf-8?B?cnBHWFozZmlaekhxeERqemsvQ0NtWnVtOWpyQVZOMWo1Q3NvaVpraldxblpX?=
 =?utf-8?B?WEdiZ205R2ZjWjNIbXMvdms1d1pTaE43SGZKcXJCZnp0aXJUU2IzVXhGZy9U?=
 =?utf-8?B?ckRvUlM3cmRWYTJXYTgrSHdYV2hVZHpISzdGVXRsSWlwR2dhN0RocWZoVWl0?=
 =?utf-8?B?UnMzYU0yVWplc3REMXZrTTdORExoZlMvZ0lmZUhKT1A0Z0k3NDBML1JreGZy?=
 =?utf-8?B?cjNCR0FkNk1ONjRzVWJ3SjJ5R3lhMUpWMXNXUmxZdmJrYm40R0dOdHRxbjg0?=
 =?utf-8?Q?EWv7o/6z90mlM6Zhnt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d703ebc-0f62-4ee8-c791-08de9ac6e287
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 08:13:32.9641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8wqKcjI4rX/EStj+D2hb0PnPFGzpWLcUhwEg6+wLSQUHJlOvQQqq2iICmhtNxlTf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5769
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58792-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,collabora.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,igalia.com:email,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 1E359401CD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/15/26 09:58, Tvrtko Ursulin wrote:
> 
> On 14/04/2026 19:30, Christian König wrote:
>> On 4/14/26 17:49, Tvrtko Ursulin wrote:
>>> Trace_dma_fence_signaled, trace_dma_fence_wait_end and
>>> trace_dma_fence_destroy can all currently dereference a null fence->ops
>>> pointer after it has been reset on fence signalling.
>>>
>>> Lets use the safe string getters for most tracepoints to avoid this class
>>> of a problem, while for the signal tracepoint we move it to before ops are
>>> cleared to avoid losing the driver and timeline name information. Apart
>>> from moving it we also need to add a new tracepoint class to bypass the
>>> safe name getters since the signaled bit is already set.
>>>
>>> For dma_fence_init we also need to use the new tracepoint class since the
>>> rcu read lock is not held there, and we can do the same for the enable
>>> signaling since there we are certain the fence cannot be signaled while
>>> we are holding the lock and have even validated the fence->ops.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> Fixes: 541c8f2468b9 ("dma-buf: detach fence ops on signal v3")
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Philipp Stanner <phasta@kernel.org>
>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>>> Cc: linux-media@vger.kernel.org
>>> Cc: linaro-mm-sig@lists.linaro.org
>>> ---
>>>   drivers/dma-buf/dma-fence.c      |  3 ++-
>>>   include/trace/events/dma_fence.h | 33 ++++++++++++++++++++++++++++----
>>>   2 files changed, 31 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>> index a2aa82f4eedd..b3bfa6943a8e 100644
>>> --- a/drivers/dma-buf/dma-fence.c
>>> +++ b/drivers/dma-buf/dma-fence.c
>>> @@ -363,6 +363,8 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>>                         &fence->flags)))
>>>           return;
>>>   +    trace_dma_fence_signaled(fence);
>>> +
>>>       /*
>>>        * When neither a release nor a wait operation is specified set the ops
>>>        * pointer to NULL to allow the fence structure to become independent
>>> @@ -377,7 +379,6 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>>         fence->timestamp = timestamp;
>>>       set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
>>> -    trace_dma_fence_signaled(fence);
>>
>> I think this part here should be a separate patch.
> 
> I had that in https://lore.kernel.org/dri-devel/20260330133623.17704-1-tvrtko.ursulin@igalia.com/ but the discussion fizzled out before an rb.
> 
>>
>>>         list_for_each_entry_safe(cur, tmp, &cb_list, node) {
>>>           INIT_LIST_HEAD(&cur->node);
>>> diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
>>> index 3abba45c0601..9e0cb9ce2388 100644
>>> --- a/include/trace/events/dma_fence.h
>>> +++ b/include/trace/events/dma_fence.h
>>> @@ -9,12 +9,37 @@
>>>     struct dma_fence;
>>>   +DECLARE_EVENT_CLASS(dma_fence,
>>> +
>>> +    TP_PROTO(struct dma_fence *fence),
>>> +
>>> +    TP_ARGS(fence),
>>> +
>>> +    TP_STRUCT__entry(
>>> +        __string(driver, dma_fence_driver_name(fence))
>>> +        __string(timeline, dma_fence_timeline_name(fence))
>>> +        __field(unsigned int, context)
>>> +        __field(unsigned int, seqno)
>>> +    ),
>>> +
>>> +    TP_fast_assign(
>>> +        __assign_str(driver);
>>> +        __assign_str(timeline);
>>> +        __entry->context = fence->context;
>>> +        __entry->seqno = fence->seqno;
>>> +    ),
>>> +
>>> +    TP_printk("driver=%s timeline=%s context=%u seqno=%u",
>>> +          __get_str(driver), __get_str(timeline), __entry->context,
>>> +          __entry->seqno)
>>> +);
>>> +
>>
>> Mhm, I'm strongly in favor to just use this approach for all trace points.
>>
>> The minimal extra overhead shouldn't really matter at all.
> 
> Yeah, I am a bit on the fence. It would required a bit of an ugly rcu_read_lock around trace_dma_fence_signal_init

I think as long as we only grab the RCU read side lock when the tracepoint is actually enabled then that shouldn't matter.

I do remember patches flying by which optimized this use case for the whole trace subsystem but didn't took a closer look how to do that now.

> and trace_dma_fence_signaled would lose the driver/timeline info _unless_ name helpers would also be changed to look at fence->ops instead of "is signaled". Those have no memory barriers so not sure I want to think about racyness and how to solve it.

Mhm, that is a bit more problematic.

ops is only set to NULL when neither free nor wait is specified, so checking is signaled is still the right thing to do for drivers which uses those callbacks but still want to have the RCU protection of the returned strings.

Ok, feel free to go ahead with this approach for now but please add a /* TODO: clean that up when most drivers switched to independent fences */.

Thanks,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>>
>> Regards,
>> Christian.
>>
>>>   /*
>>>    * Safe only for call sites which are guaranteed to not race with fence
>>>    * signaling,holding the fence->lock and having checked for not signaled, or the
>>>    * signaling path itself.
>>>    */
>>> -DECLARE_EVENT_CLASS(dma_fence,
>>> +DECLARE_EVENT_CLASS(dma_fence_ops,
>>>         TP_PROTO(struct dma_fence *fence),
>>>   @@ -46,7 +71,7 @@ DEFINE_EVENT(dma_fence, dma_fence_emit,
>>>       TP_ARGS(fence)
>>>   );
>>>   -DEFINE_EVENT(dma_fence, dma_fence_init,
>>> +DEFINE_EVENT(dma_fence_ops, dma_fence_init,
>>>         TP_PROTO(struct dma_fence *fence),
>>>   @@ -60,14 +85,14 @@ DEFINE_EVENT(dma_fence, dma_fence_destroy,
>>>       TP_ARGS(fence)
>>>   );
>>>   -DEFINE_EVENT(dma_fence, dma_fence_enable_signal,
>>> +DEFINE_EVENT(dma_fence_ops, dma_fence_enable_signal,
>>>         TP_PROTO(struct dma_fence *fence),
>>>         TP_ARGS(fence)
>>>   );
>>>   -DEFINE_EVENT(dma_fence, dma_fence_signaled,
>>> +DEFINE_EVENT(dma_fence_ops, dma_fence_signaled,
>>>         TP_PROTO(struct dma_fence *fence),
>>>   
>>
> 


