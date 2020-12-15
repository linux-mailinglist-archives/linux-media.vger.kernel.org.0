Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80B302DAEC8
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 15:22:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726844AbgLOOUA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 09:20:00 -0500
Received: from mail-bn7nam10on2071.outbound.protection.outlook.com ([40.107.92.71]:3036
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727452AbgLOOTr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 09:19:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWysLmklmwEFOtyAMfq3Vgs0wGG4aPddjnOHGURIC1ZxaWT1s7JTsqGgkNERzQOYapw8UbkIgvQjvYYFzjmBhior4eIknAXQJy5lPmgb7aD+/eOZdOXYovSPGbeCC8TnUZCxv+yFMZrdkvxhW830cKZ5WHKPt6+Sgu1c9JbXWfJQnni232xcpbJFYN9mOmIXjLBIWqu/iowniB4eeBh5KboWjNM4HEPEv+rRt0XwkCVHeW9VHv2dFh9awOuBQucFn8zWU5N8KeelAZ6NYDs/jOZegxBoYMRxM2XA7VGzi+GzItyFS1q7Z+z59yiK2P4L0job+G6hYQsYh5+pJLtQbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dF/V0zhceXzLIstydtAwONc7I8hmUmrNvsBRubr9Sw=;
 b=PhaiUVnX5v2BAS/lCR6r2Bn//3ONTMQJUrEgLqpmvLYSAml12xbhfrSBF8973iTsr9dShtL/e5TGlKL027FbOVDUtfZr43oTm8luxS5d85j0yDAjMmiTzK/AMg6yZIS2hQeoBd/YjY7OTdhCfM2hJn3Ea8M4jpzSMkibJIdxTFu2SY2G+v6jE4y6CSbEZ1IUVDFuUCKAbAr849YKsLUp5ha84l5qJ0CFTDIvJihM/F3PwaeCDyk0gkMeFxuo0jtmPNRrzmnOo85n62LmULkqnOTlbmecF4r9V8mXUQid/EDZ7r7gnxwZLL/hgfWr/+/xTi+b4rk81o4AqVnZWZdqng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dF/V0zhceXzLIstydtAwONc7I8hmUmrNvsBRubr9Sw=;
 b=ajlsjPImq0w1PCfJuoP5iN9w3DAg67ijmnC6mq7QFuJsWmly5/6IlGUx2N8jqdOdoCr8UerxJaIed9vHq1Jqd3kGcxPUORr9uZCxaRm2WOdD4unBiaoxWVCSino3tqCjTk3FGS2ELQLRr/zL2bPv71YRvOfWMOPfr+RrEDTqV48=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4320.namprd12.prod.outlook.com (2603:10b6:208:15f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Tue, 15 Dec
 2020 14:18:53 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.025; Tue, 15 Dec 2020
 14:18:53 +0000
Subject: Re: [PATCH 1/4] dma-buf: Remove kmap kerneldoc vestiges
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20201211155843.3348718-1-daniel.vetter@ffwll.ch>
 <9508713a-2a83-dd53-bddf-828a460e11cb@amd.com>
 <20201214160143.GZ401619@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e0681309-c927-9b02-0d43-0853cd9bb9fb@amd.com>
Date:   Tue, 15 Dec 2020 15:18:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201214160143.GZ401619@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM9P193CA0015.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::20) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM9P193CA0015.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Tue, 15 Dec 2020 14:18:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3fe6551b-bddd-4432-7003-08d8a1045a09
X-MS-TrafficTypeDiagnostic: MN2PR12MB4320:
X-Microsoft-Antispam-PRVS: <MN2PR12MB432054312F88F7AEEF5B18E383C60@MN2PR12MB4320.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KDC3t9cD9IGztEWG48rhV8Due/i7JaftEVjNowFVcPFqju2wT5r8VlL1Ql6IGQb0UoSY8gvGJ8UccGFQowHlnRJZv5oOLKmGlb2ro8xjRwtOUQm05cFQlTIqb4e5f+1hzGan5qoNxRxUEhhUumCdXBG7rOKMxLU+PwRRGWCHE/F0CEB5/RwH+ffT+VzmksXyaYGMBPODWnGVKkc3rc5WVFY76kaRM1cvBMaJvM3rG2ow6KAkaUkAbNVemwJA6uYW/0HGHxOItoqo8C8cgh2DkJXHtZSIdlP8YXS7hMRhnXzxj/nbmIqU5Rv7vX8aVktFLJi/5ftSXkzrQbIEWQTnvDGjdU1g/b+8ehk2zD6+0rd0BOPLJqbmpbj9Mgxp8f96RmU+DCqjgDurKOEuWHfQDcRG0lrjaf51pvuPoyvvrmaK65RC/yQxzSbz2qFV5x0a
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(366004)(2906002)(6666004)(66476007)(52116002)(4326008)(508600001)(66556008)(31686004)(66946007)(5660300002)(186003)(6486002)(8676002)(16526019)(54906003)(8936002)(2616005)(66574015)(6916009)(83380400001)(31696002)(36756003)(86362001)(34490700003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U3VQTWt5TGV4Smp6aTFqTTBST05HVThDMFJVQ01vUldqSlZiaEYwRklGNm5T?=
 =?utf-8?B?R1dlWWVJb2NwS0l0WXJzTjRVWHBFSVdmaGp6a3RER0taNnFha2xHT0JFSmpY?=
 =?utf-8?B?MFRDcWZQTmVDdUVVQ1ZyQjFnazdCMlJhN0hhSkJLMEQ1ODl1ZHdZcFg3Sms0?=
 =?utf-8?B?cHNRLzkrSUZiUUlXNEttUU5rS1h2eW8yeG1QM09zMVJWbFViU1B5eEYyY1hK?=
 =?utf-8?B?S0J1RjNwSThYUm5uQjhCTUtSblB5QXR4QjIwQ3F3eXZYV0FzSXArSVlxYklk?=
 =?utf-8?B?ajlGeHVBUFU5Z21HbDJmZG1UVElONGZTR1B6cHoxN2xUOE9OeWFSMTBPTkdh?=
 =?utf-8?B?cWdJRjRrdVVZK0hhanozT0l5L1Q3djlJUHd4MmRqK0c2U0dQeVpNbUE0Mm43?=
 =?utf-8?B?am1BeUhPVWNQQlZIa1Z5Rkx1Zkd1TVQ5dVJZWXRvMDUrdithMTVqajM2dzFq?=
 =?utf-8?B?bVRFYndaYUk5bnVXL3hyditUZ0VWdkVyRzc2bEtyVjlQTUZtVkdGMGJLNHYw?=
 =?utf-8?B?UXVBR2lEVXh0WGRNOTExL2hQM0tTckhUWjFRT0I1bkljNmNPWW1ZajYrUS9O?=
 =?utf-8?B?VUFpMXM1RS9zWUQ3Uys2RlVYeGN6bE1naTN6YVUyT29RNlFVaWJycC9WUzlu?=
 =?utf-8?B?L0UrSHlMK0grYVpLa05MWU5lQW1BbHJibDdzMVpSbGVRK3dBQVVlZHMxQVlY?=
 =?utf-8?B?cnlrYVFIWnVERVlxalE4RmxvaFJBdFRUQlZaUnVUc0kyWU1wZjA4azF6RDhl?=
 =?utf-8?B?N1dXNDYraGQ1NzhlVTVFR0x0aTVvb1ZsbWV4aHhKZTRZNk5BZUhzT3A1QjVk?=
 =?utf-8?B?NkorMkVBV0EyTHZiSVFQL2gxWkVzVkk2MjhpUkxaVktZOWU0Zm84WGlwaDRW?=
 =?utf-8?B?dHBIOGdSUGc2OHI2NCtqcXdlRDN2QlBRQXJFSDF3aDRuQXc4T051TnRUUjdB?=
 =?utf-8?B?eUJmczVVcVJIWkwwNEV5U09KUVNHbHZuRnkwNkY2dEdleHJvd2lXcDN5WmRV?=
 =?utf-8?B?czRZd3lSS0RsOXRuWmRUUnE3V1JnL3BzbHNKdEc1aEE1U0tGRTZ3cTh0ajZq?=
 =?utf-8?B?QzZzOEtRV2lIZVBiOGExbTJEaThoWUliU3pLeWFPR3hzbUJ1QVRTT1lJczJ2?=
 =?utf-8?B?SmJEUnVBUHU0M0ZDdHQrYmY0WTRBT1FVV2d1bGFUYTNFVEE1SHhXRzQybENU?=
 =?utf-8?B?T2NaNkZqZ1ZkZGRrT1ZjdDZJakg4cCtxcWtZdjZtVVRnZ2VGdHpiMUZRZUZy?=
 =?utf-8?B?Y1kzNGY2a2xaNUswY1lYVFZUNGRBWjBiVWdIcHJvUXVmNDJsS0hFUzBUbnN2?=
 =?utf-8?B?NFJZU2trWnU2bXNmZE9QYnJ2dFQzNUdWak9PNUtndTFNZ0hJR1Njc2FCZmZy?=
 =?utf-8?B?K2t6Zjd6bURJcEh1UUR0UEgwOGg1bUUzWE01UjJMWnhka3ZrR3NVVHBOWHMv?=
 =?utf-8?Q?Ux1BLEjz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 14:18:53.4824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe6551b-bddd-4432-7003-08d8a1045a09
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZYuEVJ1urL0gTRDvK2Oio6+7ogncd+q1dG4qAH3mUdwct8oXYiV+GYNHfiAvzQG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4320
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 14.12.20 um 17:01 schrieb Daniel Vetter:
> On Mon, Dec 14, 2020 at 11:33:10AM +0100, Christian König wrote:
>> Am 11.12.20 um 16:58 schrieb Daniel Vetter:
>>> Also try to clarify a bit when dma_buf_begin/end_cpu_access should
>>> be called.
>>>
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>> Cc: "Christian König" <christian.koenig@amd.com>
>>> Cc: linux-media@vger.kernel.org
>>> Cc: linaro-mm-sig@lists.linaro.org
>>> ---
>>>    drivers/dma-buf/dma-buf.c | 20 ++++++++++++++------
>>>    include/linux/dma-buf.h   | 25 +++++++++----------------
>>>    2 files changed, 23 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index e63684d4cd90..a12fdffa130f 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -1001,15 +1001,15 @@ EXPORT_SYMBOL_GPL(dma_buf_move_notify);
>>>     *   vmalloc space might be limited and result in vmap calls failing.
>>>     *
>>>     *   Interfaces::
>>> + *
>>>     *      void \*dma_buf_vmap(struct dma_buf \*dmabuf)
>>>     *      void dma_buf_vunmap(struct dma_buf \*dmabuf, void \*vaddr)
>>>     *
>>>     *   The vmap call can fail if there is no vmap support in the exporter, or if
>>> - *   it runs out of vmalloc space. Fallback to kmap should be implemented. Note
>>> - *   that the dma-buf layer keeps a reference count for all vmap access and
>>> - *   calls down into the exporter's vmap function only when no vmapping exists,
>>> - *   and only unmaps it once. Protection against concurrent vmap/vunmap calls is
>>> - *   provided by taking the dma_buf->lock mutex.
>>> + *   it runs out of vmalloc space. Note that the dma-buf layer keeps a reference
>>> + *   count for all vmap access and calls down into the exporter's vmap function
>>> + *   only when no vmapping exists, and only unmaps it once. Protection against
>>> + *   concurrent vmap/vunmap calls is provided by taking the &dma_buf.lock mutex.
>> Who is talking the lock? The caller of the dma_buf_vmap/vunmap() functions,
>> the functions itself or the callback inside the exporter?
> That's the part I didn't change at all here, just re-laid out the line
> breaking. I only removed the outdated kmap section here.

I just wanted to point out that this still isn't described here very very.


> Should I do another patch and remove this one sentence here (it's kinda
> pointless and generally we don't muse about implementation details that
> callers don't care about)?

Na, works like this for me.

> I did try and do a cursory review of the dma-buf docs, but this is kinda
> not meant as an all-out revamp. Just a few things I've noticed while
> reviewing Thomas' vmap_local stuff.


Fell free to add an Acked-by: Christian König <christian.koenig@amd.com> 
to the series.

Christian.

> -Daniel
>
>> Christian.
>>
>>>     *
>>>     * - For full compatibility on the importer side with existing userspace
>>>     *   interfaces, which might already support mmap'ing buffers. This is needed in
>>> @@ -1098,6 +1098,11 @@ static int __dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
>>>     * dma_buf_end_cpu_access(). Only when cpu access is braketed by both calls is
>>>     * it guaranteed to be coherent with other DMA access.
>>>     *
>>> + * This function will also wait for any DMA transactions tracked through
>>> + * implicit synchronization in &dma_buf.resv. For DMA transactions with explicit
>>> + * synchronization this function will only ensure cache coherency, callers must
>>> + * ensure synchronization with such DMA transactions on their own.
>>> + *
>>>     * Can return negative error values, returns 0 on success.
>>>     */
>>>    int dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
>>> @@ -1199,7 +1204,10 @@ EXPORT_SYMBOL_GPL(dma_buf_mmap);
>>>     * This call may fail due to lack of virtual mapping address space.
>>>     * These calls are optional in drivers. The intended use for them
>>>     * is for mapping objects linear in kernel space for high use objects.
>>> - * Please attempt to use kmap/kunmap before thinking about these interfaces.
>>> + *
>>> + * To ensure coherency users must call dma_buf_begin_cpu_access() and
>>> + * dma_buf_end_cpu_access() around any cpu access performed through this
>>> + * mapping.
>>>     *
>>>     * Returns 0 on success, or a negative errno code otherwise.
>>>     */
>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>> index cf72699cb2bc..7eca37c8b10c 100644
>>> --- a/include/linux/dma-buf.h
>>> +++ b/include/linux/dma-buf.h
>>> @@ -183,24 +183,19 @@ struct dma_buf_ops {
>>>    	 * @begin_cpu_access:
>>>    	 *
>>>    	 * This is called from dma_buf_begin_cpu_access() and allows the
>>> -	 * exporter to ensure that the memory is actually available for cpu
>>> -	 * access - the exporter might need to allocate or swap-in and pin the
>>> -	 * backing storage. The exporter also needs to ensure that cpu access is
>>> -	 * coherent for the access direction. The direction can be used by the
>>> -	 * exporter to optimize the cache flushing, i.e. access with a different
>>> +	 * exporter to ensure that the memory is actually coherent for cpu
>>> +	 * access. The exporter also needs to ensure that cpu access is coherent
>>> +	 * for the access direction. The direction can be used by the exporter
>>> +	 * to optimize the cache flushing, i.e. access with a different
>>>    	 * direction (read instead of write) might return stale or even bogus
>>>    	 * data (e.g. when the exporter needs to copy the data to temporary
>>>    	 * storage).
>>>    	 *
>>> -	 * This callback is optional.
>>> +	 * Note that this is both called through the DMA_BUF_IOCTL_SYNC IOCTL
>>> +	 * command for userspace mappings established through @mmap, and also
>>> +	 * for kernel mappings established with @vmap.
>>>    	 *
>>> -	 * FIXME: This is both called through the DMA_BUF_IOCTL_SYNC command
>>> -	 * from userspace (where storage shouldn't be pinned to avoid handing
>>> -	 * de-factor mlock rights to userspace) and for the kernel-internal
>>> -	 * users of the various kmap interfaces, where the backing storage must
>>> -	 * be pinned to guarantee that the atomic kmap calls can succeed. Since
>>> -	 * there's no in-kernel users of the kmap interfaces yet this isn't a
>>> -	 * real problem.
>>> +	 * This callback is optional.
>>>    	 *
>>>    	 * Returns:
>>>    	 *
>>> @@ -216,9 +211,7 @@ struct dma_buf_ops {
>>>    	 *
>>>    	 * This is called from dma_buf_end_cpu_access() when the importer is
>>>    	 * done accessing the CPU. The exporter can use this to flush caches and
>>> -	 * unpin any resources pinned in @begin_cpu_access.
>>> -	 * The result of any dma_buf kmap calls after end_cpu_access is
>>> -	 * undefined.
>>> +	 * undo anything else done in @begin_cpu_access.
>>>    	 *
>>>    	 * This callback is optional.
>>>    	 *

