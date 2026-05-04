Return-Path: <linux-media+bounces-60251-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBY5Go5P+GmQsQIAu9opvQ
	(envelope-from <linux-media+bounces-60251-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 09:49:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 042584B99F9
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 09:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 692883004DFF
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 07:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDFFA3101A6;
	Mon,  4 May 2026 07:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IdahbNtE"
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010035.outbound.protection.outlook.com [52.101.61.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00263002CF;
	Mon,  4 May 2026 07:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777880970; cv=fail; b=VUdJyMoP7GdT5vsYSC818j39Fp15NKX5BfUg0qVkgORj9PBwZyQdiPHDnY5/4qNCamNHtDPXzvwstSfOEfP7Q8dH2WoYz9QNOyN4YFvO+e47cWACy0KQZ5fNbCNJx9Kmv1q1g6YZmYvLoBnZMruvR3lm55Y/WsreXd4Y9oDCViA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777880970; c=relaxed/simple;
	bh=9INDeJ+e0k0OriwSMzNWyPHBgkfKwE0ZkKVHGS8zPpA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O/Z2kyURE+LoZ1SabMahjYWIp7bDArvK4FbeFbdsTYyzKPBqI43pSxqnrDL+E4rHSqTiO4IsCdrP4WTJquZ2ACfihrm8/2dhhcZX9c6oh8QaKT9TkV1jbiCvPKF6SJZYiXyLaJYZXYjSU0mv/F0X7q+wTs03pLC4ToK4IR+B1hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IdahbNtE; arc=fail smtp.client-ip=52.101.61.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Usz9fuTu+9tU8uPV//YDY14fftwgRsH5e5C5x6BEsMIt/7Jis1hOcUPBzqpBCnJipHrxjyammL0aZ5v3LqsifZD0pplra5dJz42qob4y8MIBmdpEHpU+dSbc0NJXx64dfiTpgA9ZNautfcYkJtWGCv5nsqxa7KWx2cngvTEPbTOF9M5kRQ5+fPVgYntwF0gdOvEJ5j+64Ju+LOCo4BRaMVf90xg7C0y8ALlMH9lNp0ZD+q/9rUW8hck8BHB8iTHgGe4LTwrHa8YJgsmp2v4ECwnw7FbLbvJCMCyye4Nodc/vMytOtNRrrNXiMSCT/fJWhM/15F3wI4ZP3r+EKEca9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0xcKJkFbFaYT1KQdPIlpEkD4K7meX9f46DKUFjINbk=;
 b=rrqqqTZIC3jVrOX02IbvKWveyM5/8wSGqah40CEsOd+oahRlfsqMdN25EXDDBXKcx6LLRfAsnryT5Zo8E6g/jw3l86c3wzousNeitZqSkO29DfjEnNCEfpLK/RDFACYVwTSL/gH8A73PckKSPUDCz8MYLzJpdrmWgqApyd8W8clqf4RJzLtu8rRWtBR2PvNQbOix1MSIqJpGFnzzsVvjR9nEN9L3t2F+2h+u1BgGp9nGyISIkPAT8g3Yb9Iuz6kP419ZE3WVEMz2HYUCh6yrW/EbooQ/E1XEhhdH5bZVz2Uk5mWdMq/O3bIBx6GM2vuiCw1DDASkMfP1/HZVUhnODA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0xcKJkFbFaYT1KQdPIlpEkD4K7meX9f46DKUFjINbk=;
 b=IdahbNtEMkjeuf9ulw87mxdUNfsbd0QIxmISkSseVSowEtBHZc1uzoKJ3zpr4dXsZpWSGW0+pVT8jOd8HjHBb4jvJQjCRWHKkdyTh5tFq0hvh2a/P7vGCNd5/cBV0FEpx1ikknnY1SOeTQnbI3da3SaUseXQEVfUB0w3Mk/DMYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6448.namprd12.prod.outlook.com (2603:10b6:8:8a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.25; Mon, 4 May 2026 07:49:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 07:49:25 +0000
Message-ID: <bc74694b-9cbc-4cbb-9dcd-9e25960d3b97@amd.com>
Date: Mon, 4 May 2026 09:49:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: system_heap: Optimize sg_table-to-pages
 conversion in vmap
To: "T.J. Mercier" <tjmercier@google.com>, Barry Song <baohua@kernel.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Xueyuan Chen <Xueyuan.chen21@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>
References: <20260406214938.24142-1-baohua@kernel.org>
 <a6d1c89a-3c71-4e06-adcb-56595071dcc2@amd.com>
 <CAGsJ_4xquCzQLbvpkC8arAN=9KhrAkdPdxnB=v85GvvQu23Xyg@mail.gmail.com>
 <9034246e-3971-4fad-94b7-80f4ad0e29db@amd.com>
 <CAGsJ_4z5EZoNMBVnu6sCkThyi9VTCeCH29buVecuySuv_Ry8fw@mail.gmail.com>
 <CABdmKX3baqmBkZxMB6PTG6Sj5S9qi+RwVvwpmkLqKkqvfeZAUw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABdmKX3baqmBkZxMB6PTG6Sj5S9qi+RwVvwpmkLqKkqvfeZAUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:208:236::25) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6448:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f4f0df3-3181-4d56-baaf-08dea9b1a952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YxSbS3cCdzuv0A0U+ZdrHkbCDGpnQe3u0jIAIp43IHpc7JfNDOt8K4QCH4u7BaTL+Ty4o6z94aalHgJuhk6v3/2OjKrWHhVyiAoBjYH71/ctxAFbYllgBTiNkZZ60g4YiW2LT16fQGKwLG/3sFKYlXHVUhqtehY2V2FePj3b2mFYnzAS4KHycqGhvPS623ugyScru/b3hSB2FnyfZtopAlBCHihENZKHEy998wI7BKf9c1hlzu/X73Q9P02hpAufKd76uxolAla09Fv4fiAhtBqQnggVedZtr4t12F3tVzJGI0/qWVU+9OokyqCbLecFtfu4UtrYUKpvQxLWvSTAmFEe/xef+C7E8kdMLP/UtTOTiub+JIK9l9hD1NQIWonZAg32hSuYv8XfDncUBwTJT8+9F8fB7vNsFc0fHenH5tuMRhVMXqwqg1jDd+xK0ruPoHiyUqlzKwfT/cmZoHcNI/YdSLi1QS1nW+/lc7TcuCyf4TCMoaKs9iYnrlLuO3W+6Y6eaTuVwqqVE3DzJRhTbQvH+v3dMRlZ9jERIpRex8ixYnBMX1UqpPC6wqxSBN1NtFZB0B+z5TfImGUhhak34QG5P4GaDnA3Bahb9qo+d/hM6YsnZeESupFtDBmTAJ7IBWJcVopMiVvg/ZyvNAhFpAoduyfeMijH4TY1hwQPLFgNL91Ry5hZbbl6FhkqSkQb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R281UEM0TkRkZEQrcUUzMHJ2dFFBNUJ0MzlUQ2NMTEpiQ0FBTkFsakRJb1Ez?=
 =?utf-8?B?UDFNU1FmWEdXcVBuOStTa1RUVUlIazh5UUZqZHo1SlFwYXFHbmx2M3poWnNt?=
 =?utf-8?B?T0V3L1JFbERYV3BDeFpPTENsdml4Q2NhUEk1eHRJYW1iN1owTDZ3aFBwTWQy?=
 =?utf-8?B?bDF5OWFzMG1PK3NUK1VFQVduQzV1U3lxeGRGTXJzSm5MMFc4Z0JrY0FMOWtY?=
 =?utf-8?B?R3YxbTFKY25jdGYwM3JNZy9CalI4YWJxZXgvWllXZ05yNFFxa2s3aGpxRER2?=
 =?utf-8?B?V2pQOUJjeFlScTRhNHUxeFk3MkdVZ0tOcG4zTkdzWXltVUlGZmRoTnRBaHo5?=
 =?utf-8?B?Y1N5bDdqa3lNZEFGSkJMZnhVWWlJRlVMc1dXRU9UMFJtZUNCMGozdkVuV2pu?=
 =?utf-8?B?cm93MGNQa3hFSzFHV0djbTltbXMxZ0Z5alkxMUtFaVY0Vjhmam5RNlFuc29T?=
 =?utf-8?B?STJhZFFQR0dZcUFVT3FDRmJQK2pQOEJHVTd6cG5VWTljd3JydGFUNHBoL3hu?=
 =?utf-8?B?Nit0bGlUb2xXUjJHcmh1UFN6WjdqV1pJdWtBYjNUQ0pHazV5SFFvNTlUSVZF?=
 =?utf-8?B?blcrY1BoYkNSdUZRMURrY2NsV0F1dHVVZTRtNEkveFRhakE0T2Z4aXdtelVo?=
 =?utf-8?B?T0JSd0F0NVBaWVJPMUFpbzhjSHJxdVVoOE9kTFNpQmE1cEh0M3ZkYjVRYmJ0?=
 =?utf-8?B?ejdyQ2Nwd3EwMG9UOXVUOGN4Nm5UUUVlZGxzR2dzcFB5c1pLNyswbU9TcW9L?=
 =?utf-8?B?amdWdmRHWWprNVpzQ1c2YmNsY2ZQQk1Ea3hqelNtcmoyS0NCY3hUd3FxbGg2?=
 =?utf-8?B?S1h4T0lKWnJWdnlsSnBydkpXL0RWY0w1ZlphcERmVkxreEltL0I3Ui9aLzl3?=
 =?utf-8?B?TGlqK3puZWV3dnBTemEvc0dWQ2pUQmRQcEFhemlzUWlBeWttb0ZjS2ZBNERX?=
 =?utf-8?B?ak5IQjFzUzlKZGgwNXd5bkJ1UW9aR1NvQmdoSUc0dlJCVmxib01HaS9WZkh4?=
 =?utf-8?B?b1Z5d2ZNWUJFd25yQ3ZpZEpUZW5IOXAyN1Q5SzdpNzRWOTl0dVZKS1hpM0ph?=
 =?utf-8?B?Tjdrdi9RQVFNcnFPOW1jZkpranVaR2hTU0RqWkJONnM0RzJLbHpvbTIzYXNE?=
 =?utf-8?B?SkdLUWtwNERFcmgrZXF0YjJTSTBuZnltNXlKajBSaDJMaVBxaXF3WHMzNkY1?=
 =?utf-8?B?dU5IQk1pdW5QbDVQQ3ZrTGtDRWhSYzR0dnBTUDZmdS9uSmNkeGNqOXltU0Mz?=
 =?utf-8?B?d2htU0VlNTh4Z0lmNHJxTWF4U1NvUUEzdlZ4T2RHbEg5RnM1RmtNSHVvZVRO?=
 =?utf-8?B?M2FZL2FwT25abGt4ZHdWWGpLQ1MyMFFNZnhUMDR6MVkwblJLMHBDUEJ6T2d3?=
 =?utf-8?B?aFNsbjROKzN3R3RNQTN5RnlISndiUS9sdzZCRmFWUGtjb1M5UHJZelZkalJB?=
 =?utf-8?B?TnVZeTdoYmhkeEk5bnBLSXVNK1Q2RTE4OXgxbDQydlBOb1Z6Y3pPTEZ3UWky?=
 =?utf-8?B?QTNuNkc4OTYvdHdLcU9XNUdmQTJPKzRJVVpoSzNtdzZsNjV4eCtYb1p0K01Q?=
 =?utf-8?B?cWdrN0Q1dGhrM0x1ak85U3ZzenBHSVUyZWZWUmhOamoyMGFDa1BiR1d6WlJu?=
 =?utf-8?B?OGM0RHlWR2xadnFMTm5xVTJFNGc0ZHVFU2pnWVNTY00zNnYzQmw1WEh2c2ZV?=
 =?utf-8?B?Yzdxd1lmeDFOUnZ4TVlFTTJocFZ0WXRpNEMyWnRXdFFZOUE3TTEvamp6WnZS?=
 =?utf-8?B?emYrL2RNVnhtU00xYWxuV2RZb3ZNY2cvck1YV3NhK0prQmI5Vk4rOVY3R2RL?=
 =?utf-8?B?WXlLUHovTmJxQnpGdXI2UHRXWmZwTjVTbm9vV3d2bmFTdWFONXFNSEtaMmpo?=
 =?utf-8?B?bjNITWYyZ1ljVk1yaWFBOG5HRlRPTU54NER1OHFVMnpQeXZrNzhoZFczL08v?=
 =?utf-8?B?U3lXMmlTUUNHTkwzci9vTXpCczZOS3AzR1YvTkpjZEdOZHdWUXdYaDQ3RHJQ?=
 =?utf-8?B?N1lSY0k5UUFOM3hNWFlRa3lkVUoyQ2VpTTVMcTJIS1FkekdPdk9aaHhNRmlV?=
 =?utf-8?B?a2NObTJKbXBXdmFJV0d1Z3Z3Q0JLTlVHUUZIQmdnbnR5Z1lUV0dKTkplOTc4?=
 =?utf-8?B?bnpyU0dEenlkRjRHRUQ4QzZkUTljV2JVVUZHaFVnNEcvbFRKc0pBdHpMNng2?=
 =?utf-8?B?K2FBVmZDQmovQmZ5RS9MSEg4eTBRM2xsMTlrS28rZEhrMXYyOXduZUxXbTVS?=
 =?utf-8?B?SWozN3M3bnN0QmtVWnNFT1AwNytwdXpWa1RNL3Qreksrb2JuTXlwRmZaRmxS?=
 =?utf-8?Q?ChHrLgWwDDhMD59UQ8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f4f0df3-3181-4d56-baaf-08dea9b1a952
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 07:49:25.0316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08IXILGD0Nq1GyTLzUWUmctNfbPW1i7r9OlOitB2vjsGgjvN9Z1t9v507RS0sekK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6448
X-Rspamd-Queue-Id: 042584B99F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.linaro.org,gmail.com,linaro.org,collabora.com,arm.com,google.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60251-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]

On 5/1/26 17:54, T.J. Mercier wrote:
> On Thu, Apr 30, 2026 at 9:15 PM Barry Song <baohua@kernel.org> wrote:
>>
>> On Wed, Apr 22, 2026 at 3:10 PM Christian König
>> <christian.koenig@amd.com> wrote:
>>>
>>> On 4/7/26 13:29, Barry Song wrote:
>>>> On Tue, Apr 7, 2026 at 3:58 PM Christian König <christian.koenig@amd.com> wrote:
>>>>>
>>>>> On 4/6/26 23:49, Barry Song (Xiaomi) wrote:
>>>>>> From: Xueyuan Chen <Xueyuan.chen21@gmail.com>
>>>>>>
>>>>>> Replace the heavy for_each_sgtable_page() iterator in system_heap_do_vmap()
>>>>>> with a more efficient nested loop approach.
>>>>>>
>>>>>> Instead of iterating page by page, we now iterate through the scatterlist
>>>>>> entries via for_each_sgtable_sg(). Because pages within a single sg entry
>>>>>> are physically contiguous, we can populate the page array with a in an
>>>>>> inner loop using simple pointer math. This save a lot of time.
>>>>>>
>>>>>> The WARN_ON check is also pulled out of the loop to save branch
>>>>>> instructions.
>>>>>>
>>>>>> Performance results mapping a 2GB buffer on Radxa O6:
>>>>>> - Before: ~1440000 ns
>>>>>> - After:  ~232000 ns
>>>>>> (~84% reduction in iteration time, or ~6.2x faster)
>>>>>
>>>>> Well real question is why do you care about the vmap performance?
>>>>>
>>>>> That should basically only be used for fbdev emulation (except for VMGFX) and we absolutely don't care about performance there.
>>>>
>>>> I agree that in mainline, dma_buf_vmap is not used very often.
>>>> Here’s what I was able to find:
>>>>
>>>>   1   1638  drivers/dma-buf/dma-buf.c <<dma_buf_vmap_unlocked>>
>>>>              ret = dma_buf_vmap(dmabuf, map);
>>>>    2    376  drivers/gpu/drm/drm_gem_shmem_helper.c
>>>> <<drm_gem_shmem_vmap_locked>>
>>>>              ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
>>>>    3     85  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
>>>> <<etnaviv_gem_prime_vmap_impl>>
>>>>              ret = dma_buf_vmap(etnaviv_obj->base.import_attach->dmabuf, &map);
>>>>    4    433  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c <<map_external>>
>>>>              ret = dma_buf_vmap(bo->tbo.base.dma_buf, map);
>>>>    5     88  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c <<vmw_gem_vmap>>
>>>>              ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
>>>>
>>>> However, in the Android ecosystem, system_heap and similar heaps
>>>> are widely used across camera, NPU, and media drivers. Many of these
>>>> drivers are not in mainline but do use vmap() in real code paths.
>>>
>>> Well out of tree drivers are not a justification to make an upstream changes.
>>>
>>> Apart from a handful of workarounds which need to CPU access as fallback DMA-buf vmap is only used to provide fb dev emulation.
>>>
>>> The vmap interface has already given us quite a headache in the first place and there are a couple of unresolved problems regarding synchronization and coherency.
>>>
>>> When a driver would be pushed upstream which makes so frequent use of the dma_buf_vmap function that it matters for the performance I think there would be push back on that and the driver developer would require a very good explanation why that is necessary.
>>>
>>> So for now I have to reject that patch.
>>
>> Well, it doesn’t seem to increase complexity, and the code is quite easy
>> to understand.
> 
> I agree with this. This change introduces basically no downsides for
> upstream, even if it primarily benefits a rare use case. Since
> dma_buf_vmap is exported for driver use, why not enhance the
> performance for all callers?

Because we essentially want to restrict the vmap interface to only the fb dev emulation use case and not promote or even expand it.

When this matters performance wise the caller is clearly doing something wrong and by improving the performance we just paper over the issue instead of fixing it.

Regards,
Christian.

> 
> -T.J.
> 
>> It would be great if the community could be more welcoming
>> to developers who are just getting involved, rather than discouraging them.
>>
>> Apparently, no one can control whether the source code of those kernel
>> modules will be upstreamed except the vendors themselves, but products
>> can still benefit from the common kernel.
>>
>> Best Regards
>> Barry


