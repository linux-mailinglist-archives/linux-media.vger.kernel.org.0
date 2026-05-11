Return-Path: <linux-media+bounces-61181-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEqZAGhpAmoxsgEAu9opvQ
	(envelope-from <linux-media+bounces-61181-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 01:42:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CF15175E3
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 01:42:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDAEA3027300
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 23:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B520836A36D;
	Mon, 11 May 2026 23:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1k2ozd5A"
X-Original-To: linux-media@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010039.outbound.protection.outlook.com [52.101.56.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBAE363C7C;
	Mon, 11 May 2026 23:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778542941; cv=fail; b=Gpg7+3IgfDtgXV4tFbQ5NDCrUXnBxdMVFm21u1vor5LbQQCaqTnNSWN6um6uC8OBnZDtCFzUah25dDP9T/ZNVEpvr5IluxqcediNT2F9GjxZkih72Y//bD74c4w2A/fUb/Erp7ALo+ZTg1+PU/zmaBb5SZqNTFT6vhKBM+2o1vE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778542941; c=relaxed/simple;
	bh=7in+A8mXt2TuFoVpH6Hi8NQGe9lx4QuLDjeuBJmTjwI=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qWDp8EVUyCa9SFgfV/JjplEDZUz5+ICvQQFnMYLhveOfutCXUFAMgLyDTsUMhp9Hy8i/ht45BjCbeDbIzz7Rea6JPBkHgFF/3ORcjAd9MHP7p6IpT9Ac5CasZiBuD46XlQLXtUsNcqq3FGf3KQcRBbEWCVHjh+JIrZTtvKBgOHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1k2ozd5A; arc=fail smtp.client-ip=52.101.56.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SsidSv5LLvBw9xlPCB+v8CuHV4UsEXlqWamZhX4LEhcaM4vjjxo0ngP1+twR2AJrVEru0rsnNCqV057zW32Yr3w5IoahDmGl+67NZMRmYu2Q+CgJkqIJ/4Wbck3ZAvQJOBEyw7PYaXC1MxL2FUrSuELwrFVSDYMdwIs73Dt+LVm18+XSBxfAbSAjcVjbz4Vvx1E6oArf6hr4HEfNMcGa0G7suSQe5pG+XI0WmW9sNGCO3+fDHHalrxCMS8TJpC8uvyaAZJH4X4N37JDftRCDStSCteQcFiA1Stp6su+8k2ufY+Be8XbY/w4vZv5H7gwEGvVq76LGYZY03xeNEUM62A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfnCXGVZ97JaPsThADObJGA4Ik9hcs/2KVetzeZr0qA=;
 b=UmfNo4zxV1y74lM3xf1jbKKYyT5PBa70kQGcGdg5uxodQ9SE/KlUJdc5SMm+Sj3qFD7tLmdyLjM6PAmgQ/XO1tkMzyN38YErIF1DT2Rje6nFrZilmUqa+fGOinD9hc/rGHd6WZhuIN7jn0JA1Y9uuh1oR07aurrcO00mjOPQYvQRMk+4y49zoP84bR8GEJ7GZesd/NXDTWTRzBd1kR+PlHrU0SX2C8nDvUrAX4PeeKcRq+I6CzBqaArpiYxQJ1jpVMquDRAsCqyuAJtVFlkZWz+oX4OT5tAk2HekhF5pfmMS/sUx/5Lt47ks+duGUB22zOAWXyshKtY/kSfxX+u44w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfnCXGVZ97JaPsThADObJGA4Ik9hcs/2KVetzeZr0qA=;
 b=1k2ozd5ACY2haAI0oVPdE70j2LRq5d0KCJjzmvc5Qo5Ti9KW4O7FiovTADctE9yRf5VlG3K9d64yPoJkIc8iei+BmirMRb1UXTqXTewqtC1FJYGKsGD8iPgUW3B0jc+X9VnU0RJse+XNtwOxN/1FIAFLKyBsEVAnePB0+iA28Jc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by SA0PR12MB7073.namprd12.prod.outlook.com (2603:10b6:806:2d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 23:42:15 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::1e6b:ca8b:7715:6fee]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::1e6b:ca8b:7715:6fee%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 23:42:15 +0000
Message-ID: <c166f41e-d983-4a22-95d1-c485a82d1d06@amd.com>
Date: Tue, 12 May 2026 09:42:01 +1000
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [RFC PATCH 04/12] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
From: Alexey Kardashevskiy <aik@amd.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-5-yilun.xu@linux.intel.com>
 <c0b160f8-2930-4158-9e50-b4cc4209e2ca@amd.com> <afs/Jamxnj6GGFfM@nvidia.com>
 <3128deea-95a3-4c36-902b-37f280913f2b@amd.com>
Content-Language: en-US
In-Reply-To: <3128deea-95a3-4c36-902b-37f280913f2b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY8PR01CA0026.ausprd01.prod.outlook.com
 (2603:10c6:10:29c::22) To CH3PR12MB9194.namprd12.prod.outlook.com
 (2603:10b6:610:19f::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|SA0PR12MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: af9e2ba0-6d25-468f-8f41-08deafb6ee10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|22082099003|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	DonMYyCL5psj1Ra5Ta1YXJ9ojiMjfTxTk2ZwUEbj/kQbxGt4Zoglv+ihVWHdcF0V5OKzIyPJg1+TXV2n7wlvypg6yW+hPqicgs3mbOa2MkGkx0YA7EomT7lvZYhi8Q+P+AZmMvDe8slZZHeVpRBe6VDNRA4vh8md5AuAzUehk7Et/hAXVPQYC4PFtFAJ/5lYa7YvN9fzoA67bPGOtPdtFv1sLWkyC4XHCw11yKIDt9IONaWaDsrfp+CHs5XL+v3C7edQYVuVp0ps0bx1/6DH10XWf+X4eXXC8dNSd9X+46AmfzSr6yJGplkOVj64plQmrhlLS2mBSzVEE0UtE+lleDyoVUpl4FQaQ3J5TCV6Rns/fl7aYbZQM8tg9O2TS8SwzEKcbIjrNX0C+oRrc8h/TIRLPyx7uCQaFCdFZ2u2byyz6KMZzaw0ELIjpMl9UYcd8RKe2tRDFjpheOROIq3QLSb3Lvn0OfuM10MXJFqrUbMiWR8F7iS0X7EAsqL7WVOY0Dx1Iymr3P9IQCDP3RU540iojpMyHJDXBhYfJCT04Uugbl2Rhzih06rahb2cbjjjgD/de5kwFi4Reas9alp4UhFC8rexVOmLGct9TzvoipZvh3vYdnATwLzTpPqI2/9dSni3JYDd8F95fYcD5KsvZBqxpwS9YFIvPmEbcc54YKs3kYr50UISwoN8t3X/Jfux
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB9194.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(22082099003)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGhDbXUzaFNNZzJQTEZFQ1ZJd3RYcWt5MlQxT1NNeVVlcS93SDFvWWNTT29O?=
 =?utf-8?B?Z2tCQmN6Ui9yT2pINnJKMTZncTZ6Nm11M2VjazROS2NXbG9iYzdJK0UvRGZX?=
 =?utf-8?B?a0UwOTV5dy9OdFNsZGM1T0Y3RDJTVHJPQ3JyUGZoaWhWWWdNZEhIT2xNTmlY?=
 =?utf-8?B?Y0tOTzNXV29TU3p3ZWdzWGVMWnl5MEg0a2MzRWt6M1pxbEVBSWJxOUJHU1Fa?=
 =?utf-8?B?QjAybVZBYU12c0d3cFd4Tk5aeGRZWXhmWUpiQ1g5UWhPT05xenBuTGttWCtp?=
 =?utf-8?B?dHg1RGE4SFpwa0xSb0xHaXNyc0dGWTlTeEI5TzJhSWN0MXNOVSs2NlZJaEd1?=
 =?utf-8?B?RUFtVDZPVVhFU2F6cjdWUjR6ZjFKaDNSUTR6OGNUb1dxMytPVFRKOGw5Wmxs?=
 =?utf-8?B?TTVjamNyWFlkeVNpR25HdFRLLytvVUZqTUozK3lGQUNCaHoweUtxVHVJQmV4?=
 =?utf-8?B?RnUzcmNZRXZnMkt3S21MeXhMUlRWdVQ5YzhJeE5RUEN3WWVaRkRzV2xRQWd2?=
 =?utf-8?B?NE1EeHZaS2RlM0NyTm9VdVIzSGc4TUdRczBFcE5BWVdDcjNabGl6N3gzMzlX?=
 =?utf-8?B?dWdIQWVuVEFiMDh4SW5kUkVDd1lHNHBRQ3FiUDVZYlAxeFJPQUYwSDlXdEx1?=
 =?utf-8?B?MXc1WkJicnJwR1hoUmNnMzlXNGJYcGx3YlRISDExSFI2Y2V1RXBFY1ZKTDUy?=
 =?utf-8?B?bXNQRjhuaTNUb0YxazYyWWVnMUNnSWs0MVBRUEpyNkxiTHhzTkM1bkMwMWNP?=
 =?utf-8?B?NGE3S0NVa3paUm1ZaHlLemJQY2dvZ0MzYzFyN1dDcWs5VHNZaUZ3SnBWUkNI?=
 =?utf-8?B?UGplSmtWRUxhczE5bU1DZE4zOWNyajRTUHhUMVQzTUxBbDBpVTBxNElFNFZZ?=
 =?utf-8?B?U3hYaEZxU3R2a0hqYWRvMlUvZ212OSt4R3NVakdITUxJdUtHc2dvQVJGNkhz?=
 =?utf-8?B?SlBwVUJmZ21DZXc0eC96cWJGeGhmYSt3dExSclY4MnE2aDdvWUVYaGV6Qy9w?=
 =?utf-8?B?VDVpVkZqekhKSVJyL2tSU3IxUmVUR0pvLzhkZzg1RUhqK2ZXR1hKaU1oa2Iv?=
 =?utf-8?B?SmRONzRCWkhRQURGUVZlamdYRTR6UFNHYWJKRUhYOWR4S1F5RUkyWlZrUXA4?=
 =?utf-8?B?Z00xalRMQ0FmNlo4dHE3QmNESVl3Vm1zRG4wR2hZMjNTa3lSb0Rub2ZHT1FG?=
 =?utf-8?B?WUdVVzBxMHA2RitFYnlLeklGUFlhVG1ndHpZU1k3ekt2TVlZTU9sTlJrSTBD?=
 =?utf-8?B?NkFJSFdRT1BEV0d5NGVGRVNFZTk5NWwrTjhJK28xK3hqMTNRK2Z0clpHbGxZ?=
 =?utf-8?B?QVp2Q0ZPbHJxcjhZdnVzUWZaVkhheHNhU1VtVEpLd0VMbGlnME02Y3ArZG0x?=
 =?utf-8?B?SGxldTl0ME9ZcXdyNlB6ckl3bUtzMkF6YmxSbmRVa0JIdVFWN0pTajRSUjJy?=
 =?utf-8?B?UjU5dTROaHhmdTIzMzBNaDdENFl1MkhzeWFPL3d4M0VRd0xmWXlnSy9VZ1hT?=
 =?utf-8?B?Qzd4OGw4UllvR1kxY2t6S3AwZ3BVcUU2ZkxwaS9pTWp6WSthT2h0ME1zWnJy?=
 =?utf-8?B?VXdldXg5ZDkwODdTNzhQaEIrUGR5YzdqT2Zmclo1eHBTeE5Mc1pEU3RZVlYr?=
 =?utf-8?B?ditNRUViWW1KRGtQOGY3T3E2S0NhUktsZjZkdm1jYStod0laR2F0b0pyTjJw?=
 =?utf-8?B?Y2NhK1IyM1BlZVI3R1VSditWVExBUU1HOFFvZzNJRmFKSkg4bjYwTzlXemQ0?=
 =?utf-8?B?ZFBjbkVDaHBoK3FHM1VFQ20vTXUrWWwzam5GUnhCY2oraFkwUm1hY2xuVEdM?=
 =?utf-8?B?eFN1cU5TSGd3bzZYVDZ5MUV0Q2JmTVk3K2JDb003TlFqekdabWVDSXNrWXkx?=
 =?utf-8?B?UmsvMjkwMVNNN0N2aHZxS1R5UVgycEsvdjZZL1QxdDBURktCL24wOUhCaUdB?=
 =?utf-8?B?MVhuY0g1N29LYlBSenVuYXVROVIyZmZINExOd2JjYmNrNWVSZ3R4ZWtObld5?=
 =?utf-8?B?ck5keGx2WXk3eHNEa3pjNTZ2SFo3UGNXa3lVU0JpMVZKTzdMU05DZmU5ckFN?=
 =?utf-8?B?V0dEeGpoYVU2RHJiQXBrbkx5eEhmMlBxcHpRcHhTS1REdW41b2Nmd1AxS0lC?=
 =?utf-8?B?NUFTUjRIYnFtblVkcEd6d21rTnVTRVI5K1hWUU1ObmVQakg3SWZsSDc5ck5M?=
 =?utf-8?B?Y3BiU1M2SGs4bTMyd056OXZDZGVqcDVrb1hEV1dSZE5oYzFvT2VIbmQ3RXdK?=
 =?utf-8?B?bjBUbEorcGpSZkdQazVaZ0VpeWNiNmZBREJGN0MzWVErM1o5amk1NmVrMkdP?=
 =?utf-8?B?WWkrNDE3QnQ0NW0weEJ1MWUwUHJaSStpYkhQTk1FQkJkOHYxTkVwQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af9e2ba0-6d25-468f-8f41-08deafb6ee10
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 23:42:14.9915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0vcqpE54gT++RjaYdQ2eadTujuRRVULaIKch8w7kEjZhlVE2wjlz58NotNwHTKg1hntfaXk9W24qLSyNgZxnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7073
X-Rspamd-Queue-Id: 63CF15175E3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-61181-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aik@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action



On 7/5/26 17:16, Alexey Kardashevskiy wrote:
> On 6/5/26 23:16, Jason Gunthorpe wrote:
>> On Wed, May 06, 2026 at 12:35:42PM +1000, Alexey Kardashevskiy wrote:
>>> Hi!
>>>
>>> Let's reignite this topic.
>>>
>>> I've been using these patches + QEMU side hacks for 6+ months. And it's been fine until I got a device where MSIX BAR is in a middle of another BAR marked as TEE in the TDISP interface report. And no trusted MSIX yet.
>>>
>>> Every time QEMU mmaps a BAR - I request a dmabuf fd from VFIO in QEMU. Since mapping of an entire MSIX BAR is allowed by default, VFIORegion::nr_mmaps==1 and it is an entire BAR.
>>>
>>> Problem: KVM memslot mismatches the dmabuf fd size
>>
>> Huh? kvm does not care about dmabuf at all? Are you running other
>> patches to hook kvm and dmabuf?
> 
> yup, 06/12 of this patchset.
> 
>> Putting a slice in a dmabuf is a well understood need for MSI, so I
>> expect whatever kvm dmabuf interface that gets merged to accomodate
>> this?
> 
> good to know.
> 
>>> Solution2: modify logic in VFIO dmabuf to allow multiple KVM memory
>>> slots per dmabuf. Now it is kvm_memory_slot::dmabuf_attach with no
>>> offset into the dmabuf and one kvm_vfio_dmabuf per dma_buf.
>>
>> Yes, when kvm learns to take in a dmabuf it needs to take in a slice,
>> not the whole buf. Or you need to create multiple dmabufs with the
>> necessary slices from the VFIO. The upstream vfio dmabuf creation
>> allows creating it with a slice.
> 
> true but either way dmabuf slicing will be directed by QEMU's msix-table emulation MR and this slicing needs to match the TDISP report so I'll have to teach QEMU these reports, right? 

Or TDISP devices are going to align MSIX BARs to 4K, and QEMU will do the same and it should "just work", and if it does not - the host won't crash. Can this work? Thanks,




> I am worried if I miss something obvious, again. Thanks,
> 
> 
> ps. I like nntp.lore.kernel.org very much for ability to dig out old stuff and then just reply to it :)
> 
>>
>> Jason
> 

-- 
Alexey


