Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA55357F44
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 11:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231224AbhDHJfK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 05:35:10 -0400
Received: from mail-dm6nam10on2049.outbound.protection.outlook.com ([40.107.93.49]:10753
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231205AbhDHJfJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Apr 2021 05:35:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kgLLvmrxy1OkxoI4NrG7dVkzClNIVScK+5eh4gDPzV3s7F9tlFzVciZj1pwDyF4RPceuzB2g/9zyTtJ3SV/IzoRSRBHg1kwX+PsTjTo4mB31fc39WY4/2HvgCg4leHf0l/lvB13A+7Oc4xX0pQYkCHBDUXoq2Z/DzFE52tqGLmy7s3Ym/osX2bTCl7JVLcw3eP7gT4QxDAE1CaC/1ez0ghMZXgutDjsuBdpsZ3RhNluiFxbPh0qP0NRuTyM0ehVe2/Ru7LLk/9BzVqAI7pQ6NGI8+vUdR80ve6rgY5aNUGoSlwWULyQjwvnCQkLQqjBEssJiZCo61bsJ9BvBnL/CCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNoChk4y4oYQ0G6odp88JZsrTnpDYP/5YP10jedNcTY=;
 b=DrJO+J/xWstgC0e6Uk4nTf/LEgkwjyPsuYW8g74FfiqVu989LISWgHX+D7ocm61TJJQ8gvZ6toRwpKkmgbqMla3oTHL6WswsxmPnhHTsO5D4B7MPMcxcJUBl8uv4inW04WpYkwfGosHiV9GiCqeV1zl9wcc3ZZDE8kIQpsGAkpOmHy3IKTKM7oIm7r4GDsHgYtIXHwQCqxq0zJvw+Zy1t5bSPblGKr/AGASoM/dtWcD9A1miNAPX5ApAZaF8DEWysmv4cd7cW6TZ+qeRS1AdetCJd5OTg/fyyRDyf3SGXMz8afphPn8R4A3kAa2gDFj8K+EfR5y6DhdO3zlgBNnHRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNoChk4y4oYQ0G6odp88JZsrTnpDYP/5YP10jedNcTY=;
 b=GABMiugg0ZsY+W6ctXkSUwJ2/weKw2oohOYHm1R1MGObEt3PBv5eN/XOmWeg++CKJEcd+B1ABPljamq2DvoX4gSaE/j4RanmSYasw87VJKtqPZn5b08rhS6R3SIFGnLmJvfqk/ifRWUrjymAlIQj/y19roEZFwg/ep4E0yY+xzc=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4657.namprd12.prod.outlook.com (2603:10b6:207:1a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Thu, 8 Apr
 2021 09:34:55 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4020.017; Thu, 8 Apr 2021
 09:34:55 +0000
Subject: Re: [PATCH] Revert "drm/syncobj: use dma_fence_get_stub"
To:     David Stevens <stevensd@chromium.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
References: <20210408045926.3202160-1-stevensd@google.com>
 <7f22ac22-dbe0-f056-b7db-24fa60f9724e@amd.com>
 <CAD=HUj5vS7VZQ-Meaz_Q1xEoamE_2fF0VE-RGj0sfUu0apP7Zg@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e933b01d-5f3c-f7f6-48b9-1106eb9a431c@amd.com>
Date:   Thu, 8 Apr 2021 11:34:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CAD=HUj5vS7VZQ-Meaz_Q1xEoamE_2fF0VE-RGj0sfUu0apP7Zg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:db83:c532:1fa2:b0cc]
X-ClientProxiedBy: FR0P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:db83:c532:1fa2:b0cc] (2a02:908:1252:fb60:db83:c532:1fa2:b0cc) by FR0P281CA0038.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.6 via Frontend Transport; Thu, 8 Apr 2021 09:34:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6f89d13-df7f-4f9f-26cc-08d8fa719118
X-MS-TrafficTypeDiagnostic: BL0PR12MB4657:
X-Microsoft-Antispam-PRVS: <BL0PR12MB46574833579E7E84B8758DD483749@BL0PR12MB4657.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H244R4sQgpPApQeS4IqNvJqEbxk55FhCHx1fPZ6KWSDFCAQMd0BF3PuzOW2N3Udy4iUpfmXIyEgSC9rPRZNzfeBVbuikNJzgbLGqm7iC3ts6vNjuzEnnxY+XeQQjuKTpUEXsXp5vAz9v1Q/iNUFhVGysRjjVV1T99dK6x2PWOU0/9n+/bD9SdP8wzm7b3m6qxvKIE0+k6KWC4e/11Colv8Q1JVaeJt5wEHeyuLOp2fGwMw5OJ4Gjdrz2SCifJsruwDsgbGdTTeh0yy6/9tky7wE/Psg2UulBbP2orDkTQEowSB2m4mKajx3NGcQ9VM7j9KDOPsfuekCUA8ACks6lY3/VEy455SvlFsYT2zyWfUoigPDORiIyUfqmwsIz6+ztykDcy03vSaW7t0q1dhM2g4zc9JODE3aGDeBYWJIaq8dP9ZLBjwHp8x+4WQ5VpBRixPx1hhQeX/kyNQk9pE1x0oSHJlbLMBUmrQrSUXfP27iwrQ6XlcxaD8gp2873cx+O6Zuj6wuYJ5NSUW9anGMTio32z/0OZr8ypAAMnW/uA2gTC54Nu4rK6JymZkU9Pu9Ql1rnGUD4MnkT0ysk7tJX99qhfp14NcuZmyuXiJQRET260qzJfYdMmVzz6p4rsLcEEyPJugajmWNkOiFXufFGfTTpetfh43KXO34tL5Rr1vlY59g2BzRyo8EDXQ8gzvBXJeZzWb4xIKSioCFZ8Hn2Z7kwTtu80qzmqHDUynIDk6g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(39860400002)(376002)(396003)(6666004)(5660300002)(86362001)(31696002)(6916009)(478600001)(38100700001)(8936002)(66946007)(66476007)(6486002)(66556008)(4326008)(2906002)(53546011)(54906003)(16526019)(31686004)(36756003)(186003)(316002)(66574015)(2616005)(8676002)(7416002)(83380400001)(52116002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aWI3QUlVeUc1emQ3MDNPUGJXMjlMUlRSS1djTVFQZldWYUVXb1UzeW9nRXBB?=
 =?utf-8?B?QW1VWW8xajNJVDBpc2ZHVDkyOGlOY0RuTFlEKzhrNjhLNjBWKzFRRTVac1Bu?=
 =?utf-8?B?cHIyYXJ2aW14TVY3SHhubkVnTVFWalUyTTdodDV1UWU4Y01WL2M4K1VNVDNj?=
 =?utf-8?B?aVhPclRZa1ZwL1RwUnZrU3kwRmxlME1Eb0pGekhjYnJJUUE4dHZ2bTFQYk5B?=
 =?utf-8?B?SC9yUUdvc3ZXTU5vdW8zeTdTenZvYkljb3NoY0M3eFlhb0Q4ZkRtckZSNWV5?=
 =?utf-8?B?R2owQmpzRVB6MUJ5Z3l6NmI5MEtPQkFDK01FVUdLRjJjQlhiMmcxYitJczBG?=
 =?utf-8?B?QjNKelkzT1M4YjYxNWxsb1lPbTl5ZDRuZS9JTnZDUnUyNm90NTl3emVBV1g2?=
 =?utf-8?B?eEJVVkh3NW4wUWNCcUZyT0dWYVRzL0prZEZNOHhEOUkzUjdzMHBBTlNlM2d1?=
 =?utf-8?B?TVVhekRiNzVPWm5yRkVrRFkzZ2FwUjFVZkRsTzdKQk1qa2tOOFNHQUV2aFpv?=
 =?utf-8?B?akZ5OVZzamk0dUhQYVppN3R6bE02cnVjWGhPTGJHOVJ0Z21FandYL0dLWk9C?=
 =?utf-8?B?emxDV2JGOHZSdXpHYU03cEtSNDU5T0dMZjVNRUo0UzRXb3dvODRNbTAvZzhu?=
 =?utf-8?B?WUxUS1RxKzBuMGlLOWNEYzZ6blZiY0N1bE9jSmJDeWJoeGIxZCtReVNwRDV5?=
 =?utf-8?B?RFJMSXh2aDVtQTVJRzdJaHJEaVVJazNWa1FJWVJiWTFybDFtZjVaaVEveW4x?=
 =?utf-8?B?L1NyMjQ5dEJ3WGt3S0xGUWRBZlU3QnRGSEtBUDg0SndUMHBsYTJXajdkUUUr?=
 =?utf-8?B?a1RYMVpCTUVrRDltL0RnVkxrMXIxeXlPUmVRdS9lR0xsMWlvRGgrZVdwcytQ?=
 =?utf-8?B?Sm5ETWtvaS8rM0duNmNzR0cxUmhkekNaR25yeU9mVWZlaUVnamlaVU9wVWNX?=
 =?utf-8?B?NnVrb3BISE5CRitjdXRBME5ULzUvdnEyMFNtRXNEQ1BIL3V0THdIdm9YTUND?=
 =?utf-8?B?TVdld1RMaERQTk0zNDZXOGpPTUtzdTBwWlhmQUh2b1lGaEo1NTZZdkxSaXVE?=
 =?utf-8?B?dlNCK3hXbDh2bUdPRlIyZmg1MjVnNytoU0Nla0JDaFpZR2V3Qys2MEZaOHJk?=
 =?utf-8?B?RGNIUzBiL2QzcFFPMk5ZS29FRER3S092bkJIaUNmREVMdTQ5WnpRUG1aTWE1?=
 =?utf-8?B?WU5oL3hqQStKOWJJNzBoZ2x2am9uczM4TkFRaUxsdFVVSENaaVZ5OEdhdXlO?=
 =?utf-8?B?MWZOM1dLeTlKNlBoR295Zm5GL3RMTHIxY2hNSndwRW5ONUw1ZkJNU0VqUzg4?=
 =?utf-8?B?SVN6V29wM01GN3ZRdDRMd3l6NXp6UHhxSFFSbEovRm9JTHRoS1NTck5ldDdC?=
 =?utf-8?B?QWFsN2tLOWo5NzJUbks4YURKZmszOXlvZ0xacXVJVERWK3VocUJicDYwVUM5?=
 =?utf-8?B?R2s5NHY2dmVuQVFGV1RXUGhMWW9ncHF2ZkFTckJMbUU3N1NRWlNiQk5SQnlW?=
 =?utf-8?B?RlVpKzMvcm1ETDdXNVRjYkxGaXpCRHF4RU9PQVo2VDNNa1VwOWFNSncrbW1y?=
 =?utf-8?B?VGptcENXcTVEbEdRRDFmZFEwbS9aVkwvN3pPNThKdTFTVGhBZVBFOXNuSUtZ?=
 =?utf-8?B?MUhmTWZhaXdJYjc2dVUvY1RlSm5OTXgxTjhFZ2U3MEw0R0QxTU9CVUNiaFJL?=
 =?utf-8?B?L0dsTXJFbWhGTmdRZzkwQ08ycS8zc254T0swZGgvVldNSjBLK01xcXhXQlM1?=
 =?utf-8?B?dm5DKzBFVFlKc0dDbnJYbTZhaGNrZWgyYW1RNWxBR016NTJyTThETzFRSjFQ?=
 =?utf-8?B?Mno4bFZJTWNvY2NtVEprd0FWOFJwaldnSG1yalduNUl2UGxja1FaaXYzRS92?=
 =?utf-8?Q?J+OJ73Gxt+9Cr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f89d13-df7f-4f9f-26cc-08d8fa719118
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 09:34:54.9250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WLpKtvpNeM17QXiuajxsB2W6HG5ffIvrftGnEIR29XzBJ9gAXAmCxofGhyQl9jln
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4657
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 08.04.21 um 11:30 schrieb David Stevens:
> On Thu, Apr 8, 2021 at 4:03 PM Christian König <christian.koenig@amd.com> wrote:
>> Am 08.04.21 um 06:59 schrieb David Stevens:
>>> From: David Stevens <stevensd@chromium.org>
>>>
>>> This reverts commit 86bbd89d5da66fe760049ad3f04adc407ec0c4d6.
>>>
>>> Using the singleton stub fence in drm_syncobj_assign_null_handle means
>>> that all syncobjs created in an already signaled state or any syncobjs
>>> signaled by userspace will reference the singleton fence when exported
>>> to a sync_file. If those sync_files are queried with SYNC_IOC_FILE_INFO,
>>> then the timestamp_ns value returned will correspond to whenever the
>>> singleton stub fence was first initialized. This can break the ability
>>> of userspace to use timestamps of these fences, as the singleton stub
>>> fence's timestamp bears no relationship to any meaningful event.
>> And why exactly is having the timestamp of the call to
>> drm_syncobj_assign_null_handle() better?
> The timestamp returned by SYNC_IOC_FILE_INFO is the "timestamp of
> status change in nanoseconds". If userspace signals the fence with
> DRM_IOCTL_SYNCOBJ_SIGNAL, then a timestamp from
> drm_syncobj_assign_null_handle corresponds to the status change. If
> userspace sets DRM_SYNCOBJ_CREATE_SIGNALED when creating a fence, then
> the status change happens immediately upon creation, which again
> corresponds to when drm_syncobj_assign_null_handle gets called.

Ok, that makes sense.

>
>> Additional if you really need that please don't revert the patch.
>> Instead provide a function which returns a newly initialized stub fence
>> in the dma_fence.c code.
> Ack.

Just add a something like dma_fence_get_new_stub() with kmalloc(), 
dma_fence_init() and dma_fence_signal().

Shouldn't be more than a six liner.

Thanks,
Christian.

>
> -David
>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: David Stevens <stevensd@chromium.org>
>>> ---
>>>    drivers/gpu/drm/drm_syncobj.c | 58 ++++++++++++++++++++++++++---------
>>>    1 file changed, 44 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
>>> index 349146049849..7cc11f1a83f4 100644
>>> --- a/drivers/gpu/drm/drm_syncobj.c
>>> +++ b/drivers/gpu/drm/drm_syncobj.c
>>> @@ -211,6 +211,21 @@ struct syncobj_wait_entry {
>>>    static void syncobj_wait_syncobj_func(struct drm_syncobj *syncobj,
>>>                                      struct syncobj_wait_entry *wait);
>>>
>>> +struct drm_syncobj_stub_fence {
>>> +     struct dma_fence base;
>>> +     spinlock_t lock;
>>> +};
>>> +
>>> +static const char *drm_syncobj_stub_fence_get_name(struct dma_fence *fence)
>>> +{
>>> +     return "syncobjstub";
>>> +}
>>> +
>>> +static const struct dma_fence_ops drm_syncobj_stub_fence_ops = {
>>> +     .get_driver_name = drm_syncobj_stub_fence_get_name,
>>> +     .get_timeline_name = drm_syncobj_stub_fence_get_name,
>>> +};
>>> +
>>>    /**
>>>     * drm_syncobj_find - lookup and reference a sync object.
>>>     * @file_private: drm file private pointer
>>> @@ -344,18 +359,24 @@ void drm_syncobj_replace_fence(struct drm_syncobj *syncobj,
>>>    }
>>>    EXPORT_SYMBOL(drm_syncobj_replace_fence);
>>>
>>> -/**
>>> - * drm_syncobj_assign_null_handle - assign a stub fence to the sync object
>>> - * @syncobj: sync object to assign the fence on
>>> - *
>>> - * Assign a already signaled stub fence to the sync object.
>>> - */
>>> -static void drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
>>> +static int drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
>>>    {
>>> -     struct dma_fence *fence = dma_fence_get_stub();
>>> +     struct drm_syncobj_stub_fence *fence;
>>>
>>> -     drm_syncobj_replace_fence(syncobj, fence);
>>> -     dma_fence_put(fence);
>>> +     fence = kzalloc(sizeof(*fence), GFP_KERNEL);
>>> +     if (fence == NULL)
>>> +             return -ENOMEM;
>>> +
>>> +     spin_lock_init(&fence->lock);
>>> +     dma_fence_init(&fence->base, &drm_syncobj_stub_fence_ops,
>>> +                    &fence->lock, 0, 0);
>>> +     dma_fence_signal(&fence->base);
>>> +
>>> +     drm_syncobj_replace_fence(syncobj, &fence->base);
>>> +
>>> +     dma_fence_put(&fence->base);
>>> +
>>> +     return 0;
>>>    }
>>>
>>>    /* 5s default for wait submission */
>>> @@ -469,6 +490,7 @@ EXPORT_SYMBOL(drm_syncobj_free);
>>>    int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
>>>                       struct dma_fence *fence)
>>>    {
>>> +     int ret;
>>>        struct drm_syncobj *syncobj;
>>>
>>>        syncobj = kzalloc(sizeof(struct drm_syncobj), GFP_KERNEL);
>>> @@ -479,8 +501,13 @@ int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
>>>        INIT_LIST_HEAD(&syncobj->cb_list);
>>>        spin_lock_init(&syncobj->lock);
>>>
>>> -     if (flags & DRM_SYNCOBJ_CREATE_SIGNALED)
>>> -             drm_syncobj_assign_null_handle(syncobj);
>>> +     if (flags & DRM_SYNCOBJ_CREATE_SIGNALED) {
>>> +             ret = drm_syncobj_assign_null_handle(syncobj);
>>> +             if (ret < 0) {
>>> +                     drm_syncobj_put(syncobj);
>>> +                     return ret;
>>> +             }
>>> +     }
>>>
>>>        if (fence)
>>>                drm_syncobj_replace_fence(syncobj, fence);
>>> @@ -1322,8 +1349,11 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
>>>        if (ret < 0)
>>>                return ret;
>>>
>>> -     for (i = 0; i < args->count_handles; i++)
>>> -             drm_syncobj_assign_null_handle(syncobjs[i]);
>>> +     for (i = 0; i < args->count_handles; i++) {
>>> +             ret = drm_syncobj_assign_null_handle(syncobjs[i]);
>>> +             if (ret < 0)
>>> +                     break;
>>> +     }
>>>
>>>        drm_syncobj_array_free(syncobjs, args->count_handles);
>>>

