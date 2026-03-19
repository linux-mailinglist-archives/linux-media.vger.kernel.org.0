Return-Path: <linux-media+bounces-56337-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IdFJtX5u2llqwIAu9opvQ
	(envelope-from <linux-media+bounces-56337-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 14:27:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A23E2CBF8A
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 14:27:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C681F301C6EE
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 13:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572C33D47B0;
	Thu, 19 Mar 2026 13:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Kw7tC1sX"
X-Original-To: linux-media@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012025.outbound.protection.outlook.com [40.107.200.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31513B19D9
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 13:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773926852; cv=fail; b=fFcWh7wo9iATL2sqzLgthobpvT+h9glDYj7QQ4ojC4tFmQl0hjxB/kiH+PWUTga71mOVkp99ufjTz2/Y2kQxnWiPdYF9aj4QC12zclIoGztBJg9TqJolrJj3HTuCqBVkTe+NQwPRRwlX4uleg8Ar6rojMDAnwZMvIlNGSkMRPc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773926852; c=relaxed/simple;
	bh=NRduZxVR0BQli1VmLd2Z6F9qFQrFiDxyZ9dmK5o/ZdQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qwLJ5zxTA8TQj0XYAu1zyCP7ciJXvpfaG8fN34hRnm3+OCTvryWBLS2GUlexE882/yr3MEN+RhHmdAs08eR5HwoNsVfTztgDEEzHW66axg2n/KjBCV//ZIFJDyyDVoo9oVM5RO4PacgWNthBMOwxog5IMKZOyW27ckjJD9pDYBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Kw7tC1sX; arc=fail smtp.client-ip=40.107.200.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D++aePUBIan5EieyPMWoOIKdLDZA/zOSp03Ej+KBm/dTL8tkh5QIrFyjcDnXNnM0ZZnc/ZIDg8yfSqdqScIKEWe0iuLwY7jLHIxKaMm2ZgfwwKkvCza7Eo9fPSzzq7DTR8rJWxR14viFKgOui+s7aVPRWHkoX2TK+a/XmRqhnsb2atrAdhLE41GD6pywgLqcFTwN5Piu7vhMibMwcb2pfi0IkEAsJ+vKdjFnwoqLAH+5/DBMBAE/sMqAfH/1Ce6er3dIjM/yhV4rPqgC/o2VcHFVEmaS7LFOvGn9rmZQHys4m9FVrTtB5pNzsyUR6FoxER+CNk6RvkWCJhdjxGxODA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4XJ0+ZbTiwtwbNzXxTL9BKE1ZwdG/Cg3FQ25MnlBZo=;
 b=IZ6sX12ibDnuIqAVzDlbgTtWCSk+j6QxKDRLHrxTrH9fAE6j4/W1nOdexdMGxflirt2a2OhoHSJ6gNVfDVOPQdKv/7+dsApgqNmXCSyZPvPVLk/nUOpl3SnqOQ6vKUxt03Bbgxp6TFCDVEWVxd1PUq9CNw+jfOH0MkrBt08dMMY2gubOApM6vIfhkcch0lSbV/FQRoggl48oTSYLLOO0RlIeXxB/5v72giuhgEHuYAsoECzvZ4Dkg4bl7SUwq3pxxaPvTE6HC2H1zsRDiLLQPyTXoyyrEDcIN1JdQ8z5/JkHtQqkaoa8nT/FRz9lfNhgd5xr3iePLIcEvdzfxLNm8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4XJ0+ZbTiwtwbNzXxTL9BKE1ZwdG/Cg3FQ25MnlBZo=;
 b=Kw7tC1sXnV4jOmfFMFgVr1BzN7+MAdmrTJY/qKIs71Pjb4Ip7iIhenLOYSpe2+Djes/LRXlzR/Wchdcx9STTpoGpGduVKGwVb6VKc+noWdPE63jfIZpGPjTte/P8dYpTa7w25AnnfQC4UmyKn8ndD+fIA8gu7bLyrH5OijMTm2w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB7159.namprd12.prod.outlook.com (2603:10b6:510:229::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 13:27:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 13:27:25 +0000
Message-ID: <46d74746-f89f-4218-8600-7acd3b8e6367@amd.com>
Date: Thu, 19 Mar 2026 14:27:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf/dma_fence_array: remove unused functionality
To: Tvrtko Ursulin <tursulin@ursulin.net>, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20260317145039.2418-1-christian.koenig@amd.com>
 <dd55b402-5322-4590-becf-caa3b4242ec2@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <dd55b402-5322-4590-becf-caa3b4242ec2@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0151.namprd03.prod.outlook.com
 (2603:10b6:208:32f::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: abea55b3-5c4b-424b-b1d3-08de85bb40ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	U9GXskvHBPvhzwI2bUonbhCDe2/maJw/I779GxClY5N+36wPDs2XecP8PXCFSXotGKqSQ13i+/sPEk6Y9sr9fZTSgvVWJd/pTLuP7hAYywtWqrfK4vhIBrO5QkwM7qqJdTgFb2kDcKY5e7CUo7xFmd3ZiY1FFfjEI76oigc/ryTeg37jA30ah+ns+m1h1HC4GB6jSwlKRKBaCvqCXAx06ZvS5aNJjSN2+9/WTaFTfkOO7JzaCe6+JikN7jmm6XcCQFHQwpJgQr10iWaLnfPS03t+6BHyC57kyb1+oxlUEWayQ0GSCmxuKS+pL9zWjk4c8M0LMC51b7Q8SU4iNF+uK2FtvcJ599B9c9Th3HfTSPW9fHlT+x3T0WKHL90wVCKo+RnOefleCu+IfTNfQO7r0vFQwCzkVwOigjIzBs6tVNgtYSp16310XEmioGV4P/f6aZkJbk5kRlPrKxWy5e9at1TqkIc2UXHL3hsTlxzMVGNIIQxsux1uf6wOn7oRxUWY7xxca9cWmg3ZZQyPLL+W25du56/mvGfy0tFyPJAUaBvsytqWt30iROMgEd+C+sxkiMyBQmnpd6G5ZzXwiabht2cd2Wzhj9q1hJu8Xp91HEDaEXyxp3j6uXZtjMLsvmzaQ4kUpaAigpKPLRu6KLyuXAzRFXb7zW+wiv0XjA0DVZy6keDnmJYWNe6Z2NfiUQn6W8GpTX8IjFsDK3JSOh48tvMI0KZVxjpsyJd6nW8rPHw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUNxcmd0VDlLTndTejYwUVN2OSsySzZuZk1SakNhL2RTTERSaHB0YXZ3MTlJ?=
 =?utf-8?B?VU4xOGNGVWc1TExrcEdwa0pEOUE4U2s1TWwxeHgxUUdEaXVCeEZaWDZxK2FW?=
 =?utf-8?B?c242U1Fib2tnMzdQSnNxWnlEdDlNRnZOd2pKRE9TK29WQyttR2F0Qyt2SHpx?=
 =?utf-8?B?a1BQUmhXaGtpNElLWHNFYkFmU0JTSE9IYmNlTzlxVENCcTFnblZnQTJWd3dp?=
 =?utf-8?B?NkgxaHJJZU1Ia0dlK1pQYVlWakc5bGludGRZdVVEb3RkcjRWWWh2VTd5RkZ6?=
 =?utf-8?B?ZVVDYWRlbXhhb0ZhQytZcjVaVHVKVVdXUlp5NWVPdmcya1RJc3lEckQrL2hO?=
 =?utf-8?B?SlhjbWhZZUYvNUlHNTF4VHpsWFRuRXkwVnBMNXlOK3RLSkMxZXdSd3FIQkVU?=
 =?utf-8?B?enRxSExBdTUxOEREOG5FK3RqM3VTUkpIVTVBZWlCejFMdFAwajlFcFFQTWNG?=
 =?utf-8?B?azIwclVta3VUUFhEVlk1YldtbjVqaXJBVjZnTjh4b3NCWlhaYjk3UzVRKzhT?=
 =?utf-8?B?VU9oVytoaldNcVI5UmMvS2hmWXBWR0g2TW5QN0NLbjhlTmt1WnBpaFRVYXFy?=
 =?utf-8?B?MmVKdXc3S29BaktWU2RRNTFETVJYNlBWaWJLaGxCN1ZKQ1NUTXVTcEZ6cmx4?=
 =?utf-8?B?MUJEYWdtR1RXbzhVMmdkazQrdVFLd1FaZFBEQmM0dUxEMlNySVhJamp2L0xu?=
 =?utf-8?B?VWZXVmFiM2RUaGlOdVl3V0lpUmJsQXA4QXp1QTQyS0dEanozS0EweXc4VVlY?=
 =?utf-8?B?cmg4Wk55RnFvQTBKSzZVVzE0ekg2Zi9vM2RBaVF0a2FQN0V4blE0RFIrcHN0?=
 =?utf-8?B?akNmK1FCcWhsc3VzSDBNQWVid0RlZUtZZURmOVZIMkZ2WUFzUFozWW9WYTBT?=
 =?utf-8?B?cVNabERldGxlblRmZ3BCemJ6SGVoUXh1bVlpSTJYeDVwU1dvbFoyQXpscFJv?=
 =?utf-8?B?amZYZFpRb29ZbGpHOWd1bEp5ZnVlV3JVd0R6blV4VkdYSlN2ZCsxZTlOVEJu?=
 =?utf-8?B?ejUvMFJpT25oM3RkR2t4Mmk2cUNaSXFYV202RFFXeGI1ckZnemNMOWdUL2Nw?=
 =?utf-8?B?TW9JcUZnMWxSNGJRQ1ZWN0NTRUNqd3BuTkhYVXEyQU80S2VBV1ZqOWp2cEsr?=
 =?utf-8?B?U3BmNzkvQ1NCSmdCSW5mT0VacjNYYTdVcEVjdUJlTXlqNGZBOVdKUmdwVlpB?=
 =?utf-8?B?RXE0VWVTOWFZTW9SR0hsbkk5ek51T3pPK0p4Z0xkR1RtN1BrQUVPWVFLbUVo?=
 =?utf-8?B?VzQ4Q21jSFI3dUZlNjVZanJFYjRXa0tiWHVvMEY5cTl0UTZmNGRYWWNDNTNQ?=
 =?utf-8?B?dmNYZ2dOQTZqL0hmOHFRUDNkL1hqQkhaejZtSkJtUDJDQ0loUElYTEpleTlJ?=
 =?utf-8?B?dWw3bDdVZGtaMXAwekRReGtrT1hGT2l5bGhmSXcvaGNYUjI5aVpvczdtZFJw?=
 =?utf-8?B?MTZYRXVYeVBLNjR6S2haczUwZVphSTVlbHNWellFRTl4TURsSmI1QnUvaEVH?=
 =?utf-8?B?cEpJcXllRUp0QjM1eWdYOWI5a3dxMndEK0psbzdjdFFMdG05dWZBYndCK3gr?=
 =?utf-8?B?dXVQUmZ3YWhaeVJ6cmJ0UDJiSWRFR2NZdXN3L3RrNEZEYmtyWHBiT29CTUYv?=
 =?utf-8?B?ejQrYTFqM202dGZVVGE3TGxQYmZMZ1hXSk5YMFM2Y3dZeWY1KytYYzFSUzdE?=
 =?utf-8?B?cHZYUUMvcDVCZUZBbWU0WEVqQUhkTHlYSnVCV3R2SnZ1VjI5ZUVtQ25URkla?=
 =?utf-8?B?MHhUMTI3QURnWWpURXBwQmh6ZyszRkhhd1hrQkNOK29xZzV2eEp3MzFBVE43?=
 =?utf-8?B?bTdXM1VwRHJGY0pnbEZPK0k1WFRFQ2NYeEJSUSs4aDl5cXVvQnE3ZmJabmlG?=
 =?utf-8?B?UE9CT3ZFazZGUXpiRG5oUUpVcWhySDFLWUdnM3pYZnVuRW5LdVEzMUhCTXNE?=
 =?utf-8?B?ckdrVVBMUmE2cnhhN3NsamZvdUVHRjh2c1E4VzNGV2xmSXA4T1o0N2U5bW1T?=
 =?utf-8?B?bG54TzVIMEtDQ3UyMWY1R0dHZ0p5OUY5NUlPVzNZYmNRV09QTkJnSEoxVDE3?=
 =?utf-8?B?OU5aR0s3bzZjK1dWTCszS0ltSytLcEp1a1dEYTFsZzFTWjM0Tlc2c2ZyYUZN?=
 =?utf-8?B?anZwZ2JEeFhVSkFrbjRrU0VuSzZhczVLbXhvbVIxTldudFpueFI1c2d2ek1v?=
 =?utf-8?B?TWdlMmJUNnBvVE1sZ0gyZjkrYWZBdFpzZWVrQnVoSk41R3hGaUZQbTVlRHQ4?=
 =?utf-8?B?ZHFaRGljb0Qyd3JCMkZLWXgrL0I0L2lHajlLWWZlbmhMRlVZMmVFREpYZ0ZP?=
 =?utf-8?Q?K2hCsaCSTugP++LI9o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abea55b3-5c4b-424b-b1d3-08de85bb40ec
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 13:27:24.9094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HNiTivs519/mvBrtlh567Ed/p2ErexRrMRe8GKBZJYY43zeye1bOQTXHbJtRt+h+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7159
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56337-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2A23E2CBF8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 10:51, Tvrtko Ursulin wrote:
> 
> On 17/03/2026 14:50, Christian König wrote:
>> Amdgpu was the only user of the signal on any feature and we dropped
>> that use case recently, so we can remove that functionality again.
>>
>> This allows to simplfy the dma_fence_array code a lot and saves us from
> 
> simplify
> 
>> the need to install a callback on all fences at the same time.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/dma-fence-array.c             | 133 +++++++-----------
>>   drivers/dma-buf/dma-fence-unwrap.c            |   3 +-
>>   drivers/dma-buf/dma-resv.c                    |   3 +-
>>   drivers/dma-buf/st-dma-fence-unwrap.c         |   2 +-
>>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   3 +-
>>   drivers/gpu/drm/xe/xe_sync.c                  |   2 +-
>>   drivers/gpu/drm/xe/xe_vm.c                    |   4 +-
>>   include/linux/dma-fence-array.h               |  28 +---
>>   8 files changed, 63 insertions(+), 115 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
>> index 089f69469524..0d54bf2e47ba 100644
>> --- a/drivers/dma-buf/dma-fence-array.c
>> +++ b/drivers/dma-buf/dma-fence-array.c
>> @@ -42,97 +42,71 @@ static void dma_fence_array_clear_pending_error(struct dma_fence_array *array)
>>       cmpxchg(&array->base.error, PENDING_ERROR, 0);
>>   }
>>   -static void irq_dma_fence_array_work(struct irq_work *wrk)
>> +static void dma_fence_array_cb_func(struct dma_fence *f,
>> +                    struct dma_fence_cb *cb)
>>   {
>> -    struct dma_fence_array *array = container_of(wrk, typeof(*array), work);
>> +    struct dma_fence_array *array =
>> +        container_of(cb, struct dma_fence_array, callback);
>>   -    dma_fence_array_clear_pending_error(array);
>> -
>> -    dma_fence_signal(&array->base);
>> -    dma_fence_put(&array->base);
>> +    irq_work_queue(&array->work);
>>   }
>>   -static void dma_fence_array_cb_func(struct dma_fence *f,
>> -                    struct dma_fence_cb *cb)
>> +static void irq_dma_fence_array_work(struct irq_work *wrk)
>>   {
>> -    struct dma_fence_array_cb *array_cb =
>> -        container_of(cb, struct dma_fence_array_cb, cb);
>> -    struct dma_fence_array *array = array_cb->array;
>> +    struct dma_fence_array *array = container_of(wrk, typeof(*array), work);
>>   -    dma_fence_array_set_pending_error(array, f->error);
>> +    while (array->num_pending--) {
>> +        struct dma_fence *f = array->fences[array->num_pending];
>>   -    if (atomic_dec_and_test(&array->num_pending))
>> -        irq_work_queue(&array->work);
>> -    else
>> -        dma_fence_put(&array->base);
>> +        if (!dma_fence_add_callback(f, &array->callback,
>> +                        dma_fence_array_cb_func))
>> +            return;
>> +
>> +        dma_fence_array_set_pending_error(array, f->error);
>> +    }
>> +
>> +    dma_fence_signal(&array->base);
>> +    dma_fence_put(&array->base);
>>   }
>>     static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
>>   {
>>       struct dma_fence_array *array = to_dma_fence_array(fence);
>> -    struct dma_fence_array_cb *cb = array->callbacks;
>> -    unsigned i;
>> -
>> -    for (i = 0; i < array->num_fences; ++i) {
>> -        cb[i].array = array;
>> -        /*
>> -         * As we may report that the fence is signaled before all
>> -         * callbacks are complete, we need to take an additional
>> -         * reference count on the array so that we do not free it too
>> -         * early. The core fence handling will only hold the reference
>> -         * until we signal the array as complete (but that is now
>> -         * insufficient).
>> -         */
>> -        dma_fence_get(&array->base);
>> -        if (dma_fence_add_callback(array->fences[i], &cb[i].cb,
>> -                       dma_fence_array_cb_func)) {
>> -            int error = array->fences[i]->error;
>> -
>> -            dma_fence_array_set_pending_error(array, error);
>> -            dma_fence_put(&array->base);
>> -            if (atomic_dec_and_test(&array->num_pending)) {
>> -                dma_fence_array_clear_pending_error(array);
>> -                return false;
>> -            }
>> -        }
>> -    }
>>   +    /*
>> +     * As we may report that the fence is signaled before all
>> +     * callbacks are complete, we need to take an additional
>> +     * reference count on the array so that we do not free it too
>> +     * early. The core fence handling will only hold the reference
>> +     * until we signal the array as complete (but that is now
>> +     * insufficient).
>> +     */
>> +    dma_fence_get(&array->base);
>> +    irq_dma_fence_array_work(&array->work);
>>       return true;
>>   }
>>     static bool dma_fence_array_signaled(struct dma_fence *fence)
>>   {
>>       struct dma_fence_array *array = to_dma_fence_array(fence);
>> -    int num_pending;
>> +    int num_pending, error = 0;
>>       unsigned int i;
>>         /*
>> -     * We need to read num_pending before checking the enable_signal bit
>> -     * to avoid racing with the enable_signaling() implementation, which
>> -     * might decrement the counter, and cause a partial check.
>> -     * atomic_read_acquire() pairs with atomic_dec_and_test() in
>> -     * dma_fence_array_enable_signaling()
>> -     *
>> -     * The !--num_pending check is here to account for the any_signaled case
>> -     * if we race with enable_signaling(), that means the !num_pending check
>> -     * in the is_signalling_enabled branch might be outdated (num_pending (
>> -     * might have been decremented), but that's fine. The user will get the
>> -     * right value when testing again later.
>> +     * Reading num_pending is just an optimization, it is perfectly
>> +     * acceptable to have a stale value for it.
> 
> Bear with me please. I decided to look at this in the morning and maybe it is too early after all. At first I thought "is this true". Because for example:
> 
> num_fences = 2
> num_pending = 1
> 
> fences = [ signaled, unsignaled ]
> 
> Below loop exits and function returns array signaled status.
> 
> Then I realised array->num_pending is not the number of unsignaled fences. Instead it seems to be number of fences on which callbacks have not been installed, regardless of the signaled status. Or from a different angle, the next fence index to install the callback on after the current one signals.
> 
> But still the false positive seems possible. After installing the callback on the 2nd fence num_pending will be 1, so the signaled check at a point where the first fence has been signaled, but the second one still has not will return true. Dma_fence_array_signaled() cannot know since it doesn't look at the second fence.

Good point, I will rework the handling to take that into account.

Thanks for the review,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>>        */
>> -    num_pending = atomic_read_acquire(&array->num_pending);
>> -    if (test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &array->base.flags)) {
>> -        if (num_pending <= 0)
>> -            goto signal;
>> -        return false;
>> -    }
>> +    num_pending = READ_ONCE(array->num_pending);
>> +    for (i = 0; i < num_pending; ++i) {
>> +        struct dma_fence *f = array->fences[i];
>>   -    for (i = 0; i < array->num_fences; ++i) {
>> -        if (dma_fence_is_signaled(array->fences[i]) && !--num_pending)
>> -            goto signal;
>> -    }
>> -    return false;
>> +        if (!dma_fence_is_signaled(f))
>> +            return false;
>>   -signal:
>> +        if (!error)
>> +            error = f->error;
>> +    }
>> +    dma_fence_array_set_pending_error(array, error);
>>       dma_fence_array_clear_pending_error(array);
>>       return true;
>>   }
>> @@ -171,15 +145,12 @@ EXPORT_SYMBOL(dma_fence_array_ops);
>>     /**
>>    * dma_fence_array_alloc - Allocate a custom fence array
>> - * @num_fences:        [in]    number of fences to add in the array
>>    *
>>    * Return dma fence array on success, NULL on failure
>>    */
>> -struct dma_fence_array *dma_fence_array_alloc(int num_fences)
>> +struct dma_fence_array *dma_fence_array_alloc(void)
>>   {
>> -    struct dma_fence_array *array;
>> -
>> -    return kzalloc_flex(*array, callbacks, num_fences);
>> +    return kzalloc_obj(struct dma_fence_array);
>>   }
>>   EXPORT_SYMBOL(dma_fence_array_alloc);
>>   @@ -190,21 +161,22 @@ EXPORT_SYMBOL(dma_fence_array_alloc);
>>    * @fences:        [in]    array containing the fences
>>    * @context:        [in]    fence context to use
>>    * @seqno:        [in]    sequence number to use
>> - * @signal_on_any:    [in]    signal on any fence in the array
>>    *
>>    * Implementation of @dma_fence_array_create without allocation. Useful to init
>>    * a preallocated dma fence array in the path of reclaim or dma fence signaling.
>>    */
>>   void dma_fence_array_init(struct dma_fence_array *array,
>>                 int num_fences, struct dma_fence **fences,
>> -              u64 context, unsigned seqno,
>> -              bool signal_on_any)
>> +              u64 context, unsigned seqno)
>>   {
>>       static struct lock_class_key dma_fence_array_lock_key;
>>         WARN_ON(!num_fences || !fences);
>>         array->num_fences = num_fences;
>> +    array->num_pending = num_fences;
>> +    array->fences = fences;
>> +    array->base.error = PENDING_ERROR;
>>         dma_fence_init(&array->base, &dma_fence_array_ops, NULL, context,
>>                  seqno);
>> @@ -222,11 +194,6 @@ void dma_fence_array_init(struct dma_fence_array *array,
>>        */
>>       lockdep_set_class(&array->base.inline_lock, &dma_fence_array_lock_key);
>>   -    atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
>> -    array->fences = fences;
>> -
>> -    array->base.error = PENDING_ERROR;
>> -
>>       /*
>>        * dma_fence_array objects should never contain any other fence
>>        * containers or otherwise we run into recursion and potential kernel
>> @@ -249,7 +216,6 @@ EXPORT_SYMBOL(dma_fence_array_init);
>>    * @fences:        [in]    array containing the fences
>>    * @context:        [in]    fence context to use
>>    * @seqno:        [in]    sequence number to use
>> - * @signal_on_any:    [in]    signal on any fence in the array
>>    *
>>    * Allocate a dma_fence_array object and initialize the base fence with
>>    * dma_fence_init().
>> @@ -264,17 +230,16 @@ EXPORT_SYMBOL(dma_fence_array_init);
>>    */
>>   struct dma_fence_array *dma_fence_array_create(int num_fences,
>>                              struct dma_fence **fences,
>> -                           u64 context, unsigned seqno,
>> -                           bool signal_on_any)
>> +                           u64 context, unsigned seqno)
>>   {
>>       struct dma_fence_array *array;
>>   -    array = dma_fence_array_alloc(num_fences);
>> +    array = dma_fence_array_alloc();
>>       if (!array)
>>           return NULL;
>>         dma_fence_array_init(array, num_fences, fences,
>> -                 context, seqno, signal_on_any);
>> +                 context, seqno);
>>         return array;
>>   }
>> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
>> index 07fe9bf45aea..53bb40e70b27 100644
>> --- a/drivers/dma-buf/dma-fence-unwrap.c
>> +++ b/drivers/dma-buf/dma-fence-unwrap.c
>> @@ -180,8 +180,7 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>>         if (count > 1) {
>>           result = dma_fence_array_create(count, array,
>> -                        dma_fence_context_alloc(1),
>> -                        1, false);
>> +                        dma_fence_context_alloc(1), 1);
>>           if (!result) {
>>               for (i = 0; i < count; i++)
>>                   dma_fence_put(array[i]);
>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>> index ce9e6c04897f..39a92d9f2413 100644
>> --- a/drivers/dma-buf/dma-resv.c
>> +++ b/drivers/dma-buf/dma-resv.c
>> @@ -648,8 +648,7 @@ int dma_resv_get_singleton(struct dma_resv *obj, enum dma_resv_usage usage,
>>       }
>>         array = dma_fence_array_create(count, fences,
>> -                       dma_fence_context_alloc(1),
>> -                       1, false);
>> +                       dma_fence_context_alloc(1), 1);
>>       if (!array) {
>>           while (count--)
>>               dma_fence_put(fences[count]);
>> diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
>> index 9c74195f47fd..45413666970e 100644
>> --- a/drivers/dma-buf/st-dma-fence-unwrap.c
>> +++ b/drivers/dma-buf/st-dma-fence-unwrap.c
>> @@ -65,7 +65,7 @@ static struct dma_fence *mock_array(unsigned int num_fences, ...)
>>         array = dma_fence_array_create(num_fences, fences,
>>                          dma_fence_context_alloc(1),
>> -                       1, false);
>> +                       1);
>>       if (!array)
>>           goto error_free;
>>       return &array->base;
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> index e7918f896a26..1ac91a46d87f 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> @@ -3203,8 +3203,7 @@ eb_composite_fence_create(struct i915_execbuffer *eb, int out_fence_fd)
>>       fence_array = dma_fence_array_create(eb->num_batches,
>>                            fences,
>>                            eb->context->parallel.fence_context,
>> -                         eb->context->parallel.seqno++,
>> -                         false);
>> +                         eb->context->parallel.seqno++);
>>       if (!fence_array) {
>>           kfree(fences);
>>           return ERR_PTR(-ENOMEM);
>> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
>> index 24d6d9af20d6..37866768d64c 100644
>> --- a/drivers/gpu/drm/xe/xe_sync.c
>> +++ b/drivers/gpu/drm/xe/xe_sync.c
>> @@ -376,7 +376,7 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
>>           xe_assert(vm->xe, current_fence == num_fence);
>>           cf = dma_fence_array_create(num_fence, fences,
>>                           dma_fence_context_alloc(1),
>> -                        1, false);
>> +                        1);
>>           if (!cf)
>>               goto err_out;
>>   diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 548b0769b3ef..b916a9d90104 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -3196,7 +3196,7 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
>>           goto err_trace;
>>       }
>>   -    cf = dma_fence_array_alloc(n_fence);
>> +    cf = dma_fence_array_alloc();
>>       if (!cf) {
>>           fence = ERR_PTR(-ENOMEM);
>>           goto err_out;
>> @@ -3240,7 +3240,7 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
>>         xe_assert(vm->xe, current_fence == n_fence);
>>       dma_fence_array_init(cf, n_fence, fences, dma_fence_context_alloc(1),
>> -                 1, false);
>> +                 1);
>>       fence = &cf->base;
>>         for_each_tile(tile, vm->xe, id) {
>> diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
>> index 370b3d2bba37..3ee55c0e2fa4 100644
>> --- a/include/linux/dma-fence-array.h
>> +++ b/include/linux/dma-fence-array.h
>> @@ -15,16 +15,6 @@
>>   #include <linux/dma-fence.h>
>>   #include <linux/irq_work.h>
>>   -/**
>> - * struct dma_fence_array_cb - callback helper for fence array
>> - * @cb: fence callback structure for signaling
>> - * @array: reference to the parent fence array object
>> - */
>> -struct dma_fence_array_cb {
>> -    struct dma_fence_cb cb;
>> -    struct dma_fence_array *array;
>> -};
>> -
>>   /**
>>    * struct dma_fence_array - fence to represent an array of fences
>>    * @base: fence base class
>> @@ -33,18 +23,17 @@ struct dma_fence_array_cb {
>>    * @num_pending: fences in the array still pending
>>    * @fences: array of the fences
>>    * @work: internal irq_work function
>> - * @callbacks: array of callback helpers
>> + * @callback: callback structure for signaling
>>    */
>>   struct dma_fence_array {
>>       struct dma_fence base;
>>   -    unsigned num_fences;
>> -    atomic_t num_pending;
>> +    unsigned int num_fences;
>> +    unsigned int num_pending;
>>       struct dma_fence **fences;
>>         struct irq_work work;
>> -
>> -    struct dma_fence_array_cb callbacks[] __counted_by(num_fences);
>> +    struct dma_fence_cb callback;
>>   };
>>     /**
>> @@ -78,16 +67,13 @@ to_dma_fence_array(struct dma_fence *fence)
>>       for (index = 0, fence = dma_fence_array_first(head); fence;    \
>>            ++(index), fence = dma_fence_array_next(head, index))
>>   -struct dma_fence_array *dma_fence_array_alloc(int num_fences);
>> +struct dma_fence_array *dma_fence_array_alloc(void);
>>   void dma_fence_array_init(struct dma_fence_array *array,
>>                 int num_fences, struct dma_fence **fences,
>> -              u64 context, unsigned seqno,
>> -              bool signal_on_any);
>> -
>> +              u64 context, unsigned seqno);
>>   struct dma_fence_array *dma_fence_array_create(int num_fences,
>>                              struct dma_fence **fences,
>> -                           u64 context, unsigned seqno,
>> -                           bool signal_on_any);
>> +                           u64 context, unsigned seqno);
>>     bool dma_fence_match_context(struct dma_fence *fence, u64 context);
>>   
> 


