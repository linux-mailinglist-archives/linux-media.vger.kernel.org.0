Return-Path: <linux-media+bounces-56182-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6M83BlRhumnFUgIAu9opvQ
	(envelope-from <linux-media+bounces-56182-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 09:24:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 892142B7E0C
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 09:24:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFAF6308DCE2
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 08:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D1437AA99;
	Wed, 18 Mar 2026 08:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FLDrvCrg"
X-Original-To: linux-media@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011041.outbound.protection.outlook.com [52.101.57.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADC037AA97
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 08:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773822103; cv=fail; b=YRem0ASJ9OI052N73zTd0yFdPzNrG2Vgc+cv2UqAnhJ6x5gg7VR7ggeKDoO551fIPK9guvLOUmhjILBsYu+4GSNNsMFsakjGUyCuLOxtCwJ4Ghbi0aPPZJ4gW4WmSshGFkJV8wyIOwEoPTXWgGTpYfUMFaYVIPlMe1Xz8YEtFkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773822103; c=relaxed/simple;
	bh=ctF5HvOkjK4Rx9PyN3On3K/SF9AImKbhYPh310pIIv4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=r19/8/0iZR9sGODSEDIjWMhLYd5TcN7pDwM5OtmS48UGGKRGNkjw8BItd8m9HTovdCyrdupuErWXzin1tOIVDhzpx2vmhSJ79Azj5rFp/aoaolJaKIXRG5QaEeo28oKVOPtj8O3HaMy1hZfIP3SmL0xmZ1mIHT88K1DweVhtQUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FLDrvCrg; arc=fail smtp.client-ip=52.101.57.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEc9b2v+ZDo2uaDh4q43NssfLDpq4CDYLq6oRNMIwFz+Kec0XZINIc0O4l7ZFv0xJAygiWoLqcj1nmNEjDkFPkprZ1QCnRMmyS15/qOQ5GpS9oAaC6nz3HFEKlgEvam7hV4LGnJ/cwqS9Jd2NpYBsZmWKIE9qtq1r9r4lnpfBeHWalGz6TITE1EFZXcm+BuRvkczT400hzivAP3sB5ICeur8rzQwFXVLWfwo7G44FvbZ+rubXrhoXEnrAXJU9zOaBkLVdJeXMpeY6riQ/fSesh+rfsws/U1B8qBuio9NJUjGBjGwbVwO7jQQd0DvQyI9uL2ZRPz4O33Mog+3M7m6Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=clmqi+7yDCnyreBPUAIP/mNVfOPKtXF2ycLUwzk6Ap8=;
 b=IS0k1msay6bF/LgR3U57RHyhA2yaIFiJDAXj32D9eU8vBDXRs1zWCUJdNi9wa8eRUHYUbMy537L/dXcvc17i4ctjGvf9qWtaYoAcL3eO8x0XLvKi3Qdk003V0HVjzlOyrM9e18nnWIgmus+gdt8mSmo9BPiJpYlGA6RytH4QjDBQvh6oQU74YKO/ZFVndS36y8BOBa2iuC4BLe0/aLMYhiACwWX06+Ze8kYmDshf0yq7qerFJVUZPItB1WItasnsbNS4nsGt4vaho0P6t84pDHYwy0EVWMLBE9l+95SwV+EV351A9Up5NTPYyzcEt+JdXk+2KpWKryqOIphDOrbKNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=clmqi+7yDCnyreBPUAIP/mNVfOPKtXF2ycLUwzk6Ap8=;
 b=FLDrvCrgTfVKt0FoAOjgVvLIhpnrnFvMZQ3rQUyrYrn+MFKNTVQWQkZIwmVZgJ8sn69RMRb3gzkMRSX0hlFXeihV4Zd978WbgtYD10U8KoYd3rkk5KJrSfZzLemHdP7jmWJqGbnQQCV14BUuACCBWjtm7YJitnZztCiWamlt5SU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB6581.namprd12.prod.outlook.com (2603:10b6:8:d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 08:21:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9723.016; Wed, 18 Mar 2026
 08:21:38 +0000
Message-ID: <3e7ce7bb-75ab-4f73-8a5d-dabd5d56cd61@amd.com>
Date: Wed, 18 Mar 2026 09:21:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf/dma_fence: be more defensive in dma_fence_release
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: phasta@mailbox.org, aliceryhl@google.com, gary@garyguo.net,
 lossin@kernel.org, daniel.almeida@collabora.com, joelagnelf@nvidia.com,
 sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260317144825.2318-1-christian.koenig@amd.com>
 <20260317162147.4a7f03ff@fedora>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260317162147.4a7f03ff@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0953.namprd03.prod.outlook.com
 (2603:10b6:408:108::28) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB6581:EE_
X-MS-Office365-Filtering-Correlation-Id: ede7a74f-5708-432a-e6fc-08de84c76038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3diwPPhckn6PEGAZAptmjeavQbqBRlfPBIf0hDWpZ/CCdrCZGOkV366ruUOGtht519Fo4LvSti5gSyww0Eb77fBsy03/zS8My4L6piI8XACRmJB1mj7y90oVVp4/EuPnuM9YOmLuKuds0ubkO5VsIl4a5cFaYy2LlrluxnJoWKvU9icf18foc8kBBGo5deifuEZuq0FIMzkS07AZlw3iHgY6K+qSIJlru//BI+PomD7JPk138f+BSuYWyBSZv/81DNJAQrmf7LJFOEGhN6u69x84t7LK42itd7o2mazfg9L2TOYWoGFx2sYuSKj48guaITNcKLLKZAHmcwWBsGHTqb8irQ9A1sOQ9m4o2EXJ/1VDuWzpktNANcuDd9z4uFBcnXyzgxpdkxFRAlU3DxuJxngFrN8K9aeusg98vvc6iZwiPkKiR81fibA+TFICZVUs9PsYCrWWsaPortSCQnnHYd28dDtDmLHKd/q494m9k438OhUeZb77ypMEsfiSfmpFXWPTJwEYLZvEMLLPejxnM9CfoRVjxZUtck+qBFwwUcgqzpB3PlQXtY7NpbyDbDwrIL2+YuWKq/Yy3lHD0cbPooo3x6GQN7/1E8PX6oX6pR4uoxlaCoMXL8pM7CygDTPnaUyLsuu9VpR/Afuum1Gtvfh9/PIakBCF50SQBEF6RjnMxVS5BbLoxixuRKf7E2u9sxUwKQb+owlNYyScCOXyV+nbw3MUJDpIK4ieUgseYZ0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mmlua0FWbmJVOXBDQXljeUdsRzVvcHBIRUV3M1VKenFucXdPUU9JSi9ZOTZy?=
 =?utf-8?B?clozM1dtRkZma01teUFsWWVzbmRRaDd1L1daOURlQ0R6V2JCd3B1cDBwN1JW?=
 =?utf-8?B?NVRsbVpTaW9DemlkMVJRbHVLeUZVeVlhZnJETktSQkxSbG9ZT3hEejV3UVMz?=
 =?utf-8?B?MG1Fdk1DS0JtNWp1Sk5tOW90cmlVM1FaTHRyd2JNdi9qNDRUMTQyalppUUdX?=
 =?utf-8?B?eVRpblU0dFAzcVVBd1cvNXFZcmF4OVVBY2UzdjFod2J1cmRqR21FTHNMZDNn?=
 =?utf-8?B?c1hzY3FFUFo4elo3ZzdaRU5VMUw3c2RvdlN6dWFLRlA5Z285YmlZWU8yV2pn?=
 =?utf-8?B?Y2d1aml0TU5lVkovSHRTRUFSZDBkZm56ek11eExmZ3l1MExSUTJZaDlXOXBW?=
 =?utf-8?B?SmcrZ2lPb2krb2RaNXAwM0I1T1lyc0hPSFJSbUNCQkZlMFRYblNjdEVYYU9U?=
 =?utf-8?B?aDd0OXpIY1A4aVRNdTFZNFFGUWdUeGtqWHhaNVZPQ2dvVzlTbUNkOFNIZTZv?=
 =?utf-8?B?UXRrRWFEVnZLb1hkcFBsOXVBTGsydjZTQ0FHK3RwVkQ2RG9GeVNIRTAwOTZX?=
 =?utf-8?B?ZU5mWVE3aGl6RnBrOTY3Z090UUxHVFdpRG43TjMxelFSRU8zUit0bzA5NVZx?=
 =?utf-8?B?cDdwYWkxcEJra2dJNUJYWjR5clFkdmsrcWltTzluTVpuMHlxcUpQTm5uam92?=
 =?utf-8?B?bEtTK2JiTm1aU0dvczZqM1Vxd1k4RzlaZnJVSVpMUTZKLzFVKzU5bXZDUXlR?=
 =?utf-8?B?VE1xQkhwK3pyTCtYNFUyWENsUjlLd0JKUWl1dmIvNlljZ3J1V1h2c0ZKV2tD?=
 =?utf-8?B?ZDdodU5lbFYwTWhUak9rWkloNEtycCtaN3lvWVZWVmZQVk16UlZ2emFmVkNq?=
 =?utf-8?B?L0tqcUVZcG1MQTV0VFRTbitSaCtiTGZYWFkyTUpjbTMyNGx0S1d2NWlpMFF3?=
 =?utf-8?B?UmhQU3ZBbGRadlExSVh2RGdIQkNxZGlaVWZXQWV2dUxwNGtDWGpPUzE1cmlS?=
 =?utf-8?B?bkJsUWhPbkpPQzZGL1N1RXlpUCtmWklTT1VpeXlOcXc0blQ1bmRjZWdScXY3?=
 =?utf-8?B?SFNmVDlGaWF3dkFrUU1Bc3pEZ1FxWTdWN3NMaytUcW84NmlVY1JoMDd5b3Fv?=
 =?utf-8?B?cE5YMU1iMnI0Q2NSN1VockdYeHI0c2Z6dDQreHJqQnEyZWFEM1dFa2RzZllR?=
 =?utf-8?B?bWxVdkhacGJaYk9ZVG5kRFZYTDNQZGJyb3VuL0x1R1JMSkkrTkYrekVZSllF?=
 =?utf-8?B?SXduM2h1ZHM4SXBnSDdkMjkvcXZia2p4ZVdWQ09EUHppbmsrdU9JN2lSQ0pM?=
 =?utf-8?B?U01KMkIzZHFGQ3ZMWHBWYU9lVEc0VyttNzZnQ0dzRnJKOFN0SzNBeVNVY2U5?=
 =?utf-8?B?bnpCYWl5amRCellIYWZsa0RPZXhrU09seE5FdDZVYXR6TVQ2K2kxbldzWnJV?=
 =?utf-8?B?eFlDTWUwcTJrVUlWRVVzTjl2bVEzTUtvdDJlSktmS21VT01iN2o5OS9wTHZq?=
 =?utf-8?B?dTVobUt4SUpBYzBFQTNMOXlYbEt3NnNoWTkwcWNzZ1lhd3ZlQ1lzb0I2ZkFt?=
 =?utf-8?B?b1dlek5PRTBrcjhrZXlwWFVOZ2RCNGZIT0YxV2dKZUNLUXFBT0d0eWNpeEVl?=
 =?utf-8?B?am1LazJONUtUVnJreEhUR05lUXlLOGMyeVlsbzFPSlI4Q05qcllrd1o5MFhG?=
 =?utf-8?B?WTh6cmpDL2MvazE1Q0E0QUtubGw3TDh5NHV0bEx5ZUlpTDlVeDNmcXUySjFv?=
 =?utf-8?B?MEFnUmlKbjZMNlVsU3JaOENxMDc3dFU3cm9zMmpqQVdXLzk1WWRYeEFGaExE?=
 =?utf-8?B?NmZtdXk2eElxMmFDQnNLalZ0MFlpSDRvL1FvMHVBWnc3Y1dHUUhYdkpjYkN0?=
 =?utf-8?B?dExjaExFTUtjdC8vcmFpTUxpWFlUdXJOb3NHTHllMC9RaU1aaFlvV0NlZHFB?=
 =?utf-8?B?VnF5V0NCck03eUo3QmNYUjdJQXowZ2VTZVhnK2RLbDZxODIrQmpuZ1dtT0hy?=
 =?utf-8?B?SDBDL3Jsa1ZZZm9PVTRqYUN6R0NDQ2I2Sms0bG16cUxjNjErTjgzRzNncHZo?=
 =?utf-8?B?WjFYNDU5SERNRS9uN2ZOcGpLeVAzbytNdXE4S2Q0YWVSSmhSTVFUcEpJWUV5?=
 =?utf-8?B?TXJVOThoUm05NDI1dkpnN09takwvSzVzVFdTQWErbVNxMG0zZXFoRThPekUz?=
 =?utf-8?B?aWNiVUsxKzEydzc5NVM4VmFFdnAzcm5zU2ZZekU5SFF1WkRWV1kxaDF0SnBw?=
 =?utf-8?B?OXFBdldBdkQzaytnSFRTQS8zM0JCbG5IOC9FRDRtTk9BMytGT3JCbnV6VW9D?=
 =?utf-8?Q?LN21MoAGuqxbNU9Vou?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ede7a74f-5708-432a-e6fc-08de84c76038
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 08:21:38.4676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bkUX1uO8rfQLUDt64voDQdpn5IcXFjhIfNZrxV1VLRiPQmwRbE7C3nE2kPDbzUOt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6581
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-56182-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 892142B7E0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/17/26 16:21, Boris Brezillon wrote:
> On Tue, 17 Mar 2026 15:48:25 +0100
> "Christian König" <ckoenig.leichtzumerken@gmail.com> wrote:
> 
>> In case of a refcounting bug dma_fence_release() can be called before the
>> fence was even signaled.
>>
>> Previously the dma_fence framework then force signaled the fence to make
>> sure to unblock waiters, but that can potentially lead to random memory
>> corruption when the DMA operation continues. So be more defensive here and
>> pick the lesser evil.
>>
>> Instead of force signaling the fence set an error code on the fence,
>> re-initialize the refcount to something large and taint the kernel.
>>
>> This will leak memory and eventually can cause a deadlock when the fence
>> is never signaled, but at least we won't run into an use after free or
>> random memory corruption.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>  drivers/dma-buf/dma-fence.c | 18 ++++++++++++++----
>>  1 file changed, 14 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index 1826ba73094c..8bf07685a053 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -593,14 +593,24 @@ void dma_fence_release(struct kref *kref)
>>  		/*
>>  		 * Failed to signal before release, likely a refcounting issue.
>>  		 *
>> -		 * This should never happen, but if it does make sure that we
>> -		 * don't leave chains dangling. We set the error flag first
>> -		 * so that the callbacks know this signal is due to an error.
>> +		 * This should never happen, but if try to be defensive and take
>> +		 * the lesser evil. Initialize the refcount to something large,
>> +		 * but not so large that it can overflow.
>> +		 *
>> +		 * That will leak memory and could deadlock if the fence never
>> +		 * signals, but at least it doesn't cause an use after free or
>> +		 * random memory corruption.
>> +		 *
>> +		 * Also taint the kernel to note that it is rather unreliable to
>> +		 * continue.
>>  		 */
>>  		dma_fence_lock_irqsave(fence, flags);
>>  		fence->error = -EDEADLK;
>> -		dma_fence_signal_locked(fence);
>> +		refcount_set(&fence->refcount.refcount, INT_MAX);
> 
> I'm not convinced this is useful. If we leak the object, no one should
> have a ref to release anyway. This does raise a question though. The
> case we're trying to protect against is fence_callback being registered
> to this fence and waiting for an event to signal another proxy fence.

Not quite. The real problematic case is that it is necessary to wait for a fence to signal with tons of memory management locks held.

So it can be that a simple memory allocation cycles back and depends on the fence to signal.

> How can the refcnt drop to zero in that case? Isn't the proxy supposed
> to own a ref on the fence. Before we go further, I'd like to understand
> what we're trying to do.

Well we are in C here, so its simply coding errors. An unecessary dma_fence_put() in an error path is enough to trigger this.

> The original discussion that led you to write this patch was about
> detecting when a fence emitter/producer would leave unsignalled fences
> behind, and the problem we have is when such unsignalled fences have
> observers waiting for a "signalled" event. If the refcnt drops to zero
> and the fence is released, we're already passed that point,
> unfortunately.

Well that is not quite correct.

The most common problem is that we have unbalanced dma_fence_get()/dma_fence_put() and we end up in dma_fence_release() before the issuer of the dma_fence has a chance to signal it.

See the main purpose of DMA fences is to prevent releasing memory back into the core memory management before the DMA operation is completed.

So when a DMA fence signals to early it means that the HW is still writing to that memory but we already potentially re-using the memory ending in random memory corruption.

UAF issues are harmless compared to that.

Regards,
Christian.

> It can be that:
> 
> - the fence was never exposed -> this is fine
> - the fence was exposed but never observed -> this is broken, because if
>   it had been observed it would have led to a deadlock
> - the fence was exposed, observed for some time, but the observer got
>   bored, stopped waiting and:
>   * decided to go and execute its stuff anyway -> use-before-ready
>     situation
>   * gave up -> kinda okay, but we should still consider the fence
>     emitter broken
> - the fence observer registered a callback but didn't take a ref on the
>   object -> this is potential UAF on the dma_fence, which can also lead
>   to a VRAM/system-mem UAF if the emitter drops the dma_fence without
>   signalling, because of the auto-signal you're getting rid of in this
>   patch.  But the latter is just a side effect of the dma_fence UAF,
>   which I'm not convinced we should try to protect against.
> 
>>  		dma_fence_unlock_irqrestore(fence, flags);
>> +		rcu_read_unlock();
>> +		add_taint(TAINT_SOFTLOCKUP, LOCKDEP_STILL_OK);
>> +		return;
>>  	}
>>  
>>  	ops = rcu_dereference(fence->ops);
> 


