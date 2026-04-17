Return-Path: <linux-media+bounces-58964-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KjOIiPn4WmKzgAAu9opvQ
	(envelope-from <linux-media+bounces-58964-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 09:54:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2192A41837D
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 09:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D528E300B84F
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 07:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CBE9347512;
	Fri, 17 Apr 2026 07:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3PzlDWYG"
X-Original-To: linux-media@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012034.outbound.protection.outlook.com [40.107.200.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B1E2D0C9D
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 07:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776412442; cv=fail; b=BfNwYkG4le6CIBozeKqvXrZBpeIVUOfmktuuCpcSSSyRG29AuRS1VgyuC1J6uhJSB5RkzqarWlneFOSOiBXbAdrKiFdCC76HiIukMAkALi7GuPzJNJSx9yVDWSkFtTk5TBqlixxuU2DYRTSfdzjK52PeUif+YZE3QNHfuRY0Rww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776412442; c=relaxed/simple;
	bh=sknJpRTSZ4uPvvIHXUBKHGM5SQUqygmIA/OsTfeHPVU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RyIySVsRSZBCL8EAJJsm+3WdLrZtr04uJUeqADArtHMwkdlbg5Aj9BV7MUSKs5t7rrHxWYWBrUW8j9+upvAeJw9FfaY+ykG/O5JWpFGe1YAZSmmsFgLTJlVjHRXy4UszlJpO5JgYKhvBnzuUynddG9Bf4IvFJiCMBfWmCVQJXJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3PzlDWYG; arc=fail smtp.client-ip=40.107.200.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iwwfUQNOsZyMgVOxTdoZhcOP+NTpog2V3nabtDcbgvjR/HltgFj/lTD8pUia4edheIbLi+1dofd5zQSF5v+lNS7d6/L/XWRvi/qleQc8k/ciH4suXj5/hVtvuHgMdvCZ0o3EqciSgCsfQTdq19uwy2Gp/VDNLjIu3B5ZuWTFpMKnbA42284Yv885dyPUaMNNONnGwQAHWMKH936gvcxKKA/eeNprOncE1sb6obQUE/9IetbA7NrxcJaF48uQKLcsQGYSk2JOfV1QU7rBKDUMXTVlR28ShbKAJwPkN8n64c/6VYhq2rePysadV9pbPUQH0svq2mmmy7KLjeh8AImVLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xI41eCdxT3vHHUSP6mcueoyvicczs1k4tmRDnqD8o30=;
 b=ESRXJ3T8IjwDYBQuza0F+Nc8luOf83vdiANBkzFC3o8SSnV91/QeGW1EizU2HPAZqV7HSQ/6jGyA6ijNeXZG+Az2XpcFVMlLbLrsK3LhRbeEc6wXsJszFIt8yQxQykl6TSwpl66E7OiynWKKAbEsHJAu9fWH03vA0CNLAmGKRPjEa3TMNRb1sW9tDJTm3AHQV9KpjhII4nh6U6mhdqqTAOpfzgCbakR/qxJINPSfvTZpV9ITQOCxW4NlgP1LHIDpra3+j4VwsKw74PgilGTZ6omsxWLmn6otqIKXt4S0HZVq2sRrQu0TR/CzPUFy4Ua7XVeA07yn+p3KLJ/KZLY2XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xI41eCdxT3vHHUSP6mcueoyvicczs1k4tmRDnqD8o30=;
 b=3PzlDWYGm7TSFEYUyYlkIXM+nkedqQ13z/8sgOLxHx/L3mgXKai8u9s7NysYBTfShb1xGQjwQQrLqudd0AsULLW0o/v06PiRtCEf0IcqYrB97SxHyp13yIlbWXB28I8wR31T1j25i5HI6k5CVtqI6XhF6UiTis9bH8g4lGz7Vr4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7828.namprd12.prod.outlook.com (2603:10b6:8:14b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.35; Fri, 17 Apr
 2026 07:53:57 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 07:53:57 +0000
Message-ID: <4751cf03-d3c1-4d5d-af8e-39ad7c8ffb84@amd.com>
Date: Fri, 17 Apr 2026 09:53:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Pinned, non-revocable mappings of VRAM: will bad things happen?
To: Demi Marie Obenour <demiobenour@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 linux-media@vger.kernel.org
Cc: Val Packett <val@invisiblethingslab.com>,
 Suwit Semal <sumit.semwal@linaro.org>
References: <a06133f7-3093-4733-9786-bc46c1453e06@gmail.com>
 <b8d04414-18b5-40f7-9ea2-88b30ff5bea0@amd.com>
 <c7865b27-6bf1-4df1-9520-c9ef6b3ef368@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <c7865b27-6bf1-4df1-9520-c9ef6b3ef368@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0278.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:109::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7828:EE_
X-MS-Office365-Filtering-Correlation-Id: f35a9599-72f5-410d-f3b8-08de9c567a9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nFBNT3vY5ZJiYdKs5fpP3kdfuCuiAHbWxymth6xkdMN5vZ41HlTeRTBF9J02Z/4WMfM2j/za6pRzpVGRcVuxMwjG5yMpHkiE6t1jjjyN8dq0Y+GPgd+Ai3K4wT1QRLJMgMmzTm/g6UGHwdDA3UwZYeyDFhG6EuDGAlmaUoMevriyYIeg07AaEmhWjQzhYubf/mlMRw0ph2plzWSHNYy/asCmsfGvu3lnt2GSIyzpgTGzbzsapaHCmMjJebNeNBWVYa+CPnwWvJx3PsguvYNFpQGM6Ce+ubodJjURmBACNGdJRzXIgcObmtcri/MIpqv6OVWl30Zj+OIsi0fdAWJTTcFu+o9SUJIXbICJtst4T1KekWAP0+d3QVvzhSVEMz2uRubhqkfi+GkZxXjEZT4nx0bXbO1HYWIImPoeDZmqINzIHi0cPXbYIK/R9QBrtMhs3ab6HKtrFagRS4IJrTs7++n8BSmqCurNF8qB4YoDxAyzlB4ihPB94CiCz29XR+/htP6h8UIAuZ1Ym3mxEozg8IEBkx7isVysDYyENXYdJ1I0cRO7FG/9B+zoZQCeUsILIiwDNvh/xZmg2OOBDCCFkDAxSULahFdlDlVCNKX0xHZnBQIh2m2uR9M2HJcz/ltHb7b6Kz0+gEVjeLcyf0lNd+UfiBc8k4ALTJGC9Wqi/DPVJTxENZxTem7Db5PR1adLcRKp18k8g6YYE17MaPfA37tJdsoBjX631mu96YgYS+A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEtjWC8vRzcvK1ArNGk2SUZ0OUgyVE5lbFBDSkgxZFZFYzFNWFE4WHl1c3Q2?=
 =?utf-8?B?K3g1OHk4VlJ2U0g1bklnL0xVMTdqOFFUY25DSm11a08zUGVjWUZMaG5ORmNF?=
 =?utf-8?B?N0lDU050TU94K3lMS3QrVHBLdlhKVmZiM2RWOGR4cUJ2T1pqa3IwbWN1Q1lu?=
 =?utf-8?B?ZmRDS2hObGdKa09zSEx6cU9waG0wU09Oc00xSDhSZm4yWGkxdGptaHYvMEV6?=
 =?utf-8?B?M2czQ3A1Z0Vya0xTNGJra2JPT3BJNzFVOEFEUEpyTjA1S3Z6cFFLVEozcjdr?=
 =?utf-8?B?dzJWdXhIMVV4d2h2KzMweHZDNVdTNTdCeS9FaUtEdi9SS09sbXpuTHN1YTdv?=
 =?utf-8?B?WUlGSGVaQmo3NDdiZkNLM0FCRDkrTzlkMDlOTTZaZysyNmRWOEkzM1kwZzFE?=
 =?utf-8?B?Rk1XMityaFNEbStValY5dHRYTmdzWml5SWkwcExsZjQ5VklYd2orbEVWOWNp?=
 =?utf-8?B?MGdLUHFSRmFzU0xjdkZDN21TMm1pTEFPc2VjQzlxZWh6cmEzUkZtdWorcm54?=
 =?utf-8?B?b1pXNEVnWXlHY0lrUzkvRDNtY2VSYVpKZ05NM2luRDNLc0hYWFRpN053aGc1?=
 =?utf-8?B?T3ByV0t2OWoyNFFjYkZRZWVuOFpXaEI1RFpkMjlDMmUxbVN4SlFFWlhaazFB?=
 =?utf-8?B?cHczK1Rhc0J4UDBhVXA0WGg1Nmg1WjhTSXJCMW45S1VlKzNZcWc5NVNPY0Fi?=
 =?utf-8?B?R1NMMStPVU9TMmRMU2tseHRpMjdDNWgzQU9xTkVhb3JjeHRiRllvTUlmR2ds?=
 =?utf-8?B?NmgwQ0ZUOU9uRGx2YWNUR0pPUEEzcG1pVDlXeU9DbXU1aGgxdG02N1RKdUdr?=
 =?utf-8?B?OXRUSE9IbllZUk8xbWdZc2JJMFNDNmZTaTk3emRibWJGYjNORnJNYkJsUkJ0?=
 =?utf-8?B?bWJQNGVPK2h5bHBvajIwTHh0ZTV6aDVYRUZYeE05WjdZTUoxbFlRbnZQalZD?=
 =?utf-8?B?QktMWWZENUNXRDVoVU10NGtuVEtZNFhqM20wTkpKaW5ZNEtEOVlHb1QxaWtQ?=
 =?utf-8?B?alFldVg4bjNWcW5MYUZnVTd5NXlPdTJBRW1DZ2VIYkhXci8vYlAyQU9jU0hj?=
 =?utf-8?B?VGtVSFdTUUFsTUpRc3hMMlM1YVp1UmpuRCs5QXRMcndJcWljV2xDdm01bmZI?=
 =?utf-8?B?NUNSKzVnMm5HeWxOOXJOVStUVEQ4OW15ZUJBdkg4M25RSVZNaS8ralQxdEFa?=
 =?utf-8?B?QWNGS1ZvandTRlhGQUV3aExOeWhONzEvM0QwMUNCVEJnYWlmR1hQY0ovZkZO?=
 =?utf-8?B?eURkYllBNEI1cko5bk1HNUUreXEyQnpYSzNMd2tGRnk1SnhlbE9CU3B5d0Rl?=
 =?utf-8?B?RWxHRCtkRUgvTm5KSDBZb0dmeG9HUCsvemowbFQ5aVdjeDZEZm5wS0ViK2V0?=
 =?utf-8?B?UkdnVzhiNlhna3ExN1BDQ1ZvTzdhOFVHaWQxRWRIVEVSVHlYRHd5MlVacGpD?=
 =?utf-8?B?cmdqVmZuVEk0ZFZDOENaRk5PRU5pbWRiMGU3T2h3VS9IUUdnRFJlbkFSRWN4?=
 =?utf-8?B?WTgxWlRybGVrUXEzL1d0MG1mbHdLKzR4SFFScHlhd29DVWlubjJ5WXhDS1gv?=
 =?utf-8?B?MUNkV3duWGpJdHBHTVZ1SldIU0ZKc0VLMHcvbFNyV3NiOHlac05wVkN6aFJX?=
 =?utf-8?B?WmxRc1hJNS91QVY3MmZCUDdQZjRzNFhFY0xxdGlwTjd3ekRwZW1PRXdmN2ZF?=
 =?utf-8?B?ZWJJTTRrN284V1VzWnEyUlpERGZ6YVNCK25NNjF6RDNMVno5a0xFODF6THRx?=
 =?utf-8?B?TThNczc2eldpOWtVYkxzeHh4YmdiVWt1cjE0TTNBSUJ0N3BGYWVOQ0VocFQ1?=
 =?utf-8?B?QXhJZWpRZnRDZVlCdmIrUTlneVdsZ2xHdGxGTXNHb2VGOWFLUkQxZmRBVHNu?=
 =?utf-8?B?SUFsb0xHbjZRTlAveDBXMDZ2VW0zRURpUmRLeUpQcXZvVkE0WjQ5amVoZm1W?=
 =?utf-8?B?aHNjTVh5Z2VpcTRpOUdpVFlhSXJ0OU56eWlsdHd5eDdrOEpJaGxqYjlZVDRB?=
 =?utf-8?B?ODdCV1lXNkoxUlBrcm45M2JoMmNidElrSm9mQmg5cUZsWXBpSWFiZVdBUXha?=
 =?utf-8?B?a245dFhkc0txRHR1QzdSRlQyWkhGbkdmU3VBaEh0ZERiOC9jeXFNQkxBeDNL?=
 =?utf-8?B?dm1CdlpGUy83bCtDV2ZnQ2NVTzR5ZkJkb01abGZ3czlXT2M3T3c3UG5EVCtV?=
 =?utf-8?B?WEg0NzNkNUdCZEVCZzdsQWR3VVUrRndyWitjc0tLME81MnFYRmx0RnFKRkJk?=
 =?utf-8?B?czZqazBCM05LMzhpRDc0UVBxKzYvVmdsUUw1SXh2eVBMUVdNT3hQTGNaWk1C?=
 =?utf-8?B?U0RLSlBsd215THFqb2t2alhrZTdlTFZRRTJFNlRVYWFzZk11WGZFdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f35a9599-72f5-410d-f3b8-08de9c567a9c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 07:53:57.3314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N+xG0bwEoNMrEr1vVN2SdFt23CoUIzKqbpZpvITcdQhTGf1XG31042aZyKufwVoo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7828
X-Spamd-Result: default: False [0.84 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58964-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,lists.xenproject.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 2192A41837D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/16/26 18:13, Demi Marie Obenour wrote:
> On 4/16/26 05:57, Christian König wrote:
>> On 4/16/26 01:27, Demi Marie Obenour wrote:
>>> Is it safe to assume that if a dmabuf exporter cannot handle
>>> non-revocable, pinned importers, it will fail the import?  Or is
>>> using dma_buf_pin() unsafe if one does not know the exporter?
>>
>> Neither.
>>
>> dma_buf_pin() makes sure that the importer doesn't get any invalidation notifications because the exporter moves the backing store of the buffer around for memory management.
>>
>> But what is still possible is that the exporter is hot removed, in which case the importer should basically terminate it's DMA operation as soon as possible.
>>
>> GPU drivers usually reject pin requests to VRAM from DMA-buf importers when that isn't restricted by cgroups for example, because that can otherwise easily result in a deny of service.
>>
>> Amdgpu only recently started to allow pinning into VRAM to support RDMA without ODP (I think it was ODP, but could be that I mixed up the RDMA three letter code for that feature).
>>
>>> For context, Xen grant tables do not support revocation.  One can ask
>>> the guest to unmap the grants, but if the guest doesn't obey the only
>>> recourse is to ungracefully kill it.  They also do not support page
>>> faults, so the pages must be pinned.  Right now, grant tables don't
>>> support PCI BAR mappings, but that's fixable.
>>
>> That sounds like an use case for the DMA-buf pin interface.
>>
>>> How badly is this going to break with dGPU VRAM, if at all?  I know
>>> that AMDGPU has a fallback when the BAR isn't mappable.  What about
>>> other drivers?  Supporting page faults the way KVM does is going to
>>> be extremely hard, so pinned mappings and DMA transfers are vastly
>>> preferable.
>>
>> Well if you only want to share a fixed amount of VRAM then that is pretty much ok.
>>
>> But when the client VM can trigger pinning on demand without any limitation you can pretty easily have deny of service against the host. That is usually a rather bad idea.
> 
> Is there a reasonable way to choose such an amount?

Not really.

> Unless I am
> mistaken, client workloads are highly non-uniform: a single game or
> compute job might well use more VRAM than every other program on the
> system combined.

Yeah, perfectly correct.

> Are these workloads impossible to make work well with pinning?

No, as long as you don't know the workload beforehand, e.g. when you define the limit.

I mean that's why basically everybody avoids pinning and assigning fixed amounts of resources.

Even if you can make it work technically pinning usually results in a rather bad end user experience.

Regards,
Christian.

