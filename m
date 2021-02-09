Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E91F315587
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 19:01:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233042AbhBIR45 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 12:56:57 -0500
Received: from mail-mw2nam10on2041.outbound.protection.outlook.com ([40.107.94.41]:36811
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233090AbhBIRri (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Feb 2021 12:47:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCMCOUCpkicO5QRY/qRM7pPeqbwxl9lHDFZKO+IeDb5+yDawVEv0+rrdeftCzK4UDbDF8HPR8ESNGWhBj1kGzH4HU3h5UawD68dl0Cy/Qh1Ce0bkFOXFUY+G9W618/PU4zLTpN+YoxFjoDpJVG9zCBpPC2P/jLrI82FZbRT7Q3xTPaQf77Bq6/DPTru3jz2MssUOy8oXM5CYOuhH2+kE4iKiT4+f0HTQOOEIVTR1KXV3acnBgjKcbnt1Hmi22rZME/BFmugRLxeyTD6PcV4Hd990ceXElBx9dwKjcJ/an9mPxjk7x45M3Aqp/kTgasyUyJWm59hkIcFB3PzdQcAfPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OVDWMr3VC10GbAAJQyMf4L/d3lFCGKnTmvTvLn4kkM=;
 b=EU4BYEy1wLfTEI1QwiQ5b5L1UMoxo7i2QmodrVjVpLZah60sqTieC+6CjBGYX5BZDZpVFC07iGWu6/9bLYPhi/aEi8iLey34yugSHrqe+knAOOzgTYqvvgp0PacYc3ybX7ya7bqn0hfWq3O+HoPJLtyJDjBif0A9FsvCEhyqoQ7XTn2TfHVkgoKU1bZRO4Czj2IO2bu8V32OeHhRcatdluv/3quxuheRY+QhY6A9xhVch4JsqY8pFU9Fmc/Ne1vIrmDypEfn5KAuJRB3+sht0ccAp2hS0OWKU5cjMeQK5HwaO/bmT7lHge8hbjwx7hPwIoPttXHtvNjHyCgu/3QQkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OVDWMr3VC10GbAAJQyMf4L/d3lFCGKnTmvTvLn4kkM=;
 b=RYe/v8fyPI1TaeGOzhs2NGItn5eF2qiMF2PU2ZNzvCPY/1TIdFl1u3d9TuJ6ke/yKbai9K6ZPIgipCEMdSsWsVxw8uRF9Aqveh05GxvmQzYzNKfU52wOkd4WhpEh4QqqhwJjRttGh2+XAgyZQ31EVSbQaD+0ESeABAiBcd5wzuI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4223.namprd12.prod.outlook.com (2603:10b6:208:1d3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Tue, 9 Feb
 2021 17:46:43 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 17:46:43 +0000
Subject: Re: [RFC][PATCH v6 1/7] drm: Add a sharable drm page-pool
 implementation
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        =?UTF-8?Q?=c3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-2-john.stultz@linaro.org>
 <4471b3b0-603e-6dbb-8064-ff4a95afbba9@amd.com>
 <CALAqxLWZkUFvJX5r2OU2erW4tU3j=+u==VTyzYkt+95LwwVCUA@mail.gmail.com>
 <48225879-2fe1-22ac-daae-c61d52465aea@amd.com>
 <a9dd7f8a-ef30-9eb4-4834-37801d43b96f@amd.com>
 <CAJuCfpE-T4Cs_h6LfrgHE+T_iOVywU2oNzLquYETudOaBMauMQ@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c7df099f-27f7-adc6-4e87-9903ac00cbea@amd.com>
Date:   Tue, 9 Feb 2021 18:46:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAJuCfpE-T4Cs_h6LfrgHE+T_iOVywU2oNzLquYETudOaBMauMQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:fd71:881d:d213:f46a]
X-ClientProxiedBy: AM3PR07CA0122.eurprd07.prod.outlook.com
 (2603:10a6:207:7::32) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:fd71:881d:d213:f46a] (2a02:908:1252:fb60:fd71:881d:d213:f46a) by AM3PR07CA0122.eurprd07.prod.outlook.com (2603:10a6:207:7::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.11 via Frontend Transport; Tue, 9 Feb 2021 17:46:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 46555105-3d6c-48b9-1eee-08d8cd22a988
X-MS-TrafficTypeDiagnostic: MN2PR12MB4223:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4223AD290AC034EB00E75EB5838E9@MN2PR12MB4223.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CqoE9asoBOC4TjIofMuktziMZrKeaBNvJKGiOIgSagSXbQBKIWz/zlan4Fn6bNkjhL2m+CttDuGwFc8btJG63Qe2SAOArU9tUjbBCxW+Phi3N7qNNnJu4oTZ06mruiVonhnajnNdqMCdS3yweVDfveYOzhiUKXKLm7VlgthNb4Kwm2RlgW+fIu7rD0Nyd5pMQjxLHx+XgAu24q5DEiQIeS1fvJ5hZXjwWIIc491UMlUuuqsrhLnYrW9cZf4sO3slUeZZ38wv2WATv0IW+nbo/vQI2sLXJjuzaiKlQ+TH/VQpofVfqowwGft1ldJjTBcseikWNmVUtaUA3ji+nVubNjGYTxHpDZQ6fsM6qBzyNGASGj8eX+ZLHAjkjdFyLAguBsL1++qJ8Aw+QdWko4r3mP97Wgz0xUn7x/eAPJIH8e2Jxb2USKWF9/GJa8utSadJh/9L6+U1aLKJuNBctIBAt/PiGq9z4cM0B0Uh91Hx2EnubFHWiHlpTqcOv3XjzpY5gB2wrYZoRMH1MD9fhPGQ5aJuPPpTZp8fkVbjP5mrVl2Z13HMB95TPyvLrtyUB9wtt7KxSPDY5NCiiwLWMr3nsm5Km3SKrFEtn8jSt8Q1NtGFmZKSXLNIJ2g6W2WnxKrNL2OWZqsmjzREJqNT5c2ttouYp9VUxQwST1m4cTrSExSKG8GYDw3jQRAZDc+PJtqK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(186003)(4326008)(45080400002)(66574015)(2906002)(966005)(86362001)(31686004)(66476007)(6486002)(66556008)(6666004)(5660300002)(31696002)(52116002)(478600001)(16526019)(8676002)(6916009)(8936002)(36756003)(54906003)(7416002)(53546011)(66946007)(316002)(2616005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OGVhcW9Yblh6YVp3NnhQZ2pNK0JIVHVlTUpFUUF2MHAzTXFnQmhEQ2JicEFB?=
 =?utf-8?B?NTJPazBjalBPV3BJaDg5NnFhVnloZzRwbTdEUVEwVjhHbkhISUNiN3ZlZ2xj?=
 =?utf-8?B?RUxFQ08zRU16dTkvT1d2MGZ0MGlhZWV2eXRGZExxVCtEZmQ2WTJ4dUFXSjVJ?=
 =?utf-8?B?NzNXbWYrczlCVTluM3lmU1RaVFkrVWxMTWJsaXY1dlAyZ1hTZWkzWldUS0dV?=
 =?utf-8?B?SFc0MnJZdURpcEQ2NnJaU29KQ0lpcnVpUGY3cjZZcFN6eVhVQ01qTHYzSHFP?=
 =?utf-8?B?eklxZlNQNGZlbGNxZjNzUnJLd1NRQ2VQZkpOUU1nclBYNDFCYkxoQmZrRFNJ?=
 =?utf-8?B?eEF3WTJGWUVVNE9ZT2p1c0hMMHpVaGRGcG14bjUvNGdOTWc5bm1Bb1k0c2ZW?=
 =?utf-8?B?ck5WU1FBV2duWUNwS2d2WkRvWGp3WmZqOERUNzVlbytMTXZld1AwU2hwTUpz?=
 =?utf-8?B?WU9yRStGVkZzZ0FvSXplVitXZkJoUkxQdzdOb3JIWWxQSmg4Y3dVbGE3cm1l?=
 =?utf-8?B?SU5jVDM5WUJrZlVucGJIY1lhTVJHTHdQQ00rN3N2Sy9Kbll2YnRYM0g5bzJx?=
 =?utf-8?B?R3lBaUZlK1YvT0o3S2I3Q1Evei91b01zMWxzcWJMRGVKSW9YcmRYcHZQbjlH?=
 =?utf-8?B?bUhyc2tNcEdXL25WeWViWEEzd1RYT1hXb1YySHl5MXVmVkw4eWljVWp0TnNL?=
 =?utf-8?B?MnhuVXBidHptS2FseG8yTXhTTVY2Uk9jMTlLaytGWnpTMWxOS0kweWZnRUFL?=
 =?utf-8?B?RkNaQ0M3U0xyaTkwRC9IME1zeStyRHB2SFNNWGJseWtjQW9OTkdpQ2VDVlE5?=
 =?utf-8?B?Q2wzR2EyeDNVMW9xV3hySUJRcmVGeFVrNFQ4c2VyNFRNQ0JieWF1Rnl1MlJv?=
 =?utf-8?B?ZjdzWWZJa2ZqM212WXpVb0ord1FmVTkxYlVtVytuMWdXakFMeVlsRTd1N0g0?=
 =?utf-8?B?aGdjYlVXa2ZGc0M1YlNmK2lXY2lNelg5THhuQWtQbjlMNVZTV1BJR1cweFB2?=
 =?utf-8?B?ZHFEbFZGbWRxWWRCc25obnhWVDBWSCtkYVc0SW1FZTBIQmNieTFEZW5vSDJn?=
 =?utf-8?B?NEUxZytoU2VabnpjS0ZyY2pmbk5FSW5zejZuSU5rbTZKeTNrdWw3eDVnNERH?=
 =?utf-8?B?QVB2dGVKOUZLSU9hL0ViMDNOSitwVG5pV3VlYUZ4TjFqcGhKZ2h2R1l4YUpk?=
 =?utf-8?B?SktnemErcWkyN1dueVoxZzh6RFU4c2RlWVFBL1JIdnpyWllpRGhwWWhmcHNv?=
 =?utf-8?B?SHp2M2lvVGZ1Wmo3VlBCdTVEaHh0M0xRc3ZYOVBVeVpjbDVaeUxIVDJrTUxI?=
 =?utf-8?B?TVRYWVdhbG11enBmODNXdVkrV2VhOGRvckV0LzdTb0tUSW1iekEvR1BocDla?=
 =?utf-8?B?cEtnTVc1b1M1eWFnWVBvUzFYcHg4UGRsbG0vQnpQV1BlU3FKakR6d3FPUU9j?=
 =?utf-8?B?M0RObm1YSzZzY0kxZ1FoblFLODdJSElCb2RaWDdvcnB0ZEFsRkpzRVJ5dmR5?=
 =?utf-8?B?bnpSbjV6ajhiYUdPZ2ZuU1FGMkF4NjN2S0l5RWxZZ3RwVU1EWHlIRHJUM0U1?=
 =?utf-8?B?NEhRVGhSVytvdzc5ZXo5aHZyWkxid1ZKbVJFSXgxNFJYMWY1QjByeCtYU1lD?=
 =?utf-8?B?Y21Ic3Z6K3BFejR6MXVmdzVGdkExVWhhaGtKZlRsM0xtdUZ4SnQxMktmZDU5?=
 =?utf-8?B?d3libkV6VkludGRENWlzdUs0QzZibnYwZDBPTGJ1ajJrbmZOd241clhwZDRT?=
 =?utf-8?B?R1pucktuS3hHSTg1SGJWSU9xaElVdFZaWForRnJjZVQ2TUNwTGc4TzJZTkh6?=
 =?utf-8?B?MUJlUHpwdmlsQVJUYkt0NmxyeU5zNm5RVkRQeG1iUTFxRUZGRjI4TWUzNE14?=
 =?utf-8?Q?GzlS14C+pHGYS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46555105-3d6c-48b9-1eee-08d8cd22a988
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 17:46:43.2276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yY0mzzVeerlw7mMve/dYcat9tuIzNAYi8pRwgf3TuRfXqCdCylWLz/Hfdm9d5OPG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4223
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 09.02.21 um 18:33 schrieb Suren Baghdasaryan:
> On Tue, Feb 9, 2021 at 4:57 AM Christian König <christian.koenig@amd.com> wrote:
>> Am 09.02.21 um 13:11 schrieb Christian König:
>>> [SNIP]
>>>>>> +void drm_page_pool_add(struct drm_page_pool *pool, struct page *page)
>>>>>> +{
>>>>>> +     spin_lock(&pool->lock);
>>>>>> +     list_add_tail(&page->lru, &pool->items);
>>>>>> +     pool->count++;
>>>>>> +     atomic_long_add(1 << pool->order, &total_pages);
>>>>>> +     spin_unlock(&pool->lock);
>>>>>> +
>>>>>> +     mod_node_page_state(page_pgdat(page),
>>>>>> NR_KERNEL_MISC_RECLAIMABLE,
>>>>>> +                         1 << pool->order);
>>>>> Hui what? What should that be good for?
>>>> This is a carryover from the ION page pool implementation:
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Ftree%2Fdrivers%2Fstaging%2Fandroid%2Fion%2Fion_page_pool.c%3Fh%3Dv5.10%23n28&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cdccccff8edcd4d147a5b08d8cd20cff2%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637484888114923580%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=9%2BIBC0tezSV6Ci4S3kWfW%2BQvJm4mdunn3dF6C0kyfCw%3D&amp;reserved=0
>>>>
>>>>
>>>> My sense is it helps with the vmstat/meminfo accounting so folks can
>>>> see the cached pages are shrinkable/freeable. This maybe falls under
>>>> other dmabuf accounting/stats discussions, so I'm happy to remove it
>>>> for now, or let the drivers using the shared page pool logic handle
>>>> the accounting themselves?
>> Intentionally separated the discussion for that here.
>>
>> As far as I can see this is just bluntly incorrect.
>>
>> Either the page is reclaimable or it is part of our pool and freeable
>> through the shrinker, but never ever both.
> IIRC the original motivation for counting ION pooled pages as
> reclaimable was to include them into /proc/meminfo's MemAvailable
> calculations. NR_KERNEL_MISC_RECLAIMABLE defined as "reclaimable
> non-slab kernel pages" seems like a good place to account for them but
> I might be wrong.

Yeah, that's what I see here as well. But exactly that is utterly nonsense.

Those pages are not "free" in the sense that get_free_page could return 
them directly.

Regards,
Christian.

>
>> In the best case this just messes up the accounting, in the worst case
>> it can cause memory corruption.
>>
>> Christian.

