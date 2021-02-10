Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49859317012
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 20:25:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233797AbhBJTYW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 14:24:22 -0500
Received: from mail-co1nam11on2045.outbound.protection.outlook.com ([40.107.220.45]:24181
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233168AbhBJTYU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 14:24:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BP5i0xZ8LiMNUWmXklGtnxbhxHxvW/VfvO2kxUQTFOe+j+Zewyk9KKyD6u9QcbSqiSE/rZSMWdTvEFzhYVDY4m32rwu9TWaebM4IzE1JtuOZvimpyLzpdMLooeVY9rSWYxUQ4asZYMQHdNVDKPs2Nh4LfvRuEwXDTKqJIa2+lbiEIkVsZVhZeeIYo/8F3pVrjUUCcf3wvkGHGKBMtq9Kx2DUoBhceXyIWJoT6oMi8rezlrHgCIGqvqArDzh+oBR9ApyTkbkeLafiDkq8UMA73BQsTvFIi7COdxO8ML/3GgYKeMQCgjwjdyojYPoSKbJTQLA0GjH9oYgCW85s8zZC8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhdnvNEvzQJ5qAV8jDhly82Wo2jMByfDuDfQOmp/0Bc=;
 b=arjUa3NBsKwllZPrD/3vtMOcOxJtS5q27nJixv0Jtm9QMUTrx7oVA5UrV+zkffoVwAqcYlFjNS8ZMWm7+iyqPP2JXc53LLrYgYxdzNd2GGL92SwuVr4d564gO4AksvqHr6QOgUDPNC3twlROGxCY9e2rqeqg0o4EUolHw3d3GfEQdFzqBmU1rx/YFYfye8EceLkax/doF397s/n+vaHgmOsqiKCwtombWbWObZUVgSORD16fN73nsoUWp8sl382qte4YcUDtgczrnlxnGyZVrR3bS2kNDKtjorsJDlZiWtwL126A+NnF28Bhua3fzeFpfQ7JBKFQC9ZyUa7ao6JxcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhdnvNEvzQJ5qAV8jDhly82Wo2jMByfDuDfQOmp/0Bc=;
 b=g2aa/cGkuLQdGQGnRmgJnSbPu8aR6u5ptc3xzjfwkhWS8Sqol/ECQE7keIgVtZ0uWSTsT/URM0YlC6FKysfdnElQ1z4w8YiD3vU6mE8RjaeQgSh9tayV6tJGpYXJvz6SDnQkRDeUjb657yscArKsxQYsoka+t5mp3arx2o2oK38=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3791.namprd12.prod.outlook.com (2603:10b6:208:167::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Wed, 10 Feb
 2021 19:23:26 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3846.027; Wed, 10 Feb 2021
 19:23:25 +0000
Subject: Re: [RFC][PATCH v6 1/7] drm: Add a sharable drm page-pool
 implementation
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
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
        dri-devel <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-2-john.stultz@linaro.org>
 <4471b3b0-603e-6dbb-8064-ff4a95afbba9@amd.com>
 <CALAqxLWZkUFvJX5r2OU2erW4tU3j=+u==VTyzYkt+95LwwVCUA@mail.gmail.com>
 <48225879-2fe1-22ac-daae-c61d52465aea@amd.com>
 <a9dd7f8a-ef30-9eb4-4834-37801d43b96f@amd.com>
 <CAJuCfpE-T4Cs_h6LfrgHE+T_iOVywU2oNzLquYETudOaBMauMQ@mail.gmail.com>
 <c7df099f-27f7-adc6-4e87-9903ac00cbea@amd.com>
 <CAKMK7uFu27RRpwPdNFuhd-Y5R8XiCNosET9BYtCnr3u30UDs0g@mail.gmail.com>
 <CAJuCfpF2Q1qVkv75czc2AFRrp25eNz7hqmeO9Wx8e5VY7PvyJw@mail.gmail.com>
 <YCPaZc0+F+5C7FG4@phenom.ffwll.local>
 <CAJuCfpG+nOwZJcJAXuvv=P=17vWdw2AFT7+WHfpwfmjAfefM2g@mail.gmail.com>
 <d085aaf7-8414-3efa-404b-1595abfb6da7@amd.com>
 <CAJuCfpHUBGykGdcgBSg6bGvPGtE66m+SrXeYg3jMtYQ5ZRzpdQ@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <cdf925d9-2874-79a6-7b03-fdaea4e4107e@amd.com>
Date:   Wed, 10 Feb 2021 20:23:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAJuCfpHUBGykGdcgBSg6bGvPGtE66m+SrXeYg3jMtYQ5ZRzpdQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:78b9:aa01:2f51:becf]
X-ClientProxiedBy: AM3PR03CA0071.eurprd03.prod.outlook.com
 (2603:10a6:207:5::29) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:78b9:aa01:2f51:becf] (2a02:908:1252:fb60:78b9:aa01:2f51:becf) by AM3PR03CA0071.eurprd03.prod.outlook.com (2603:10a6:207:5::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26 via Frontend Transport; Wed, 10 Feb 2021 19:23:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2aee8b2b-a197-4672-8af3-08d8cdf95688
X-MS-TrafficTypeDiagnostic: MN2PR12MB3791:
X-Microsoft-Antispam-PRVS: <MN2PR12MB379185939FBCCC715C780A45838D9@MN2PR12MB3791.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vZWiTLPt+GTkoG//hNYrXUXq5oP5TFf5LI7KaHbzMxnmIntSIFkMLHNYTzc5kB23lBlso0+M+PuA15Hl8AEn6RxF1w3J2BGq3TcOtYyLCr5DYep/PxLYYlLUGTK/ngTaL4cJJ9okPkT0+4flWtUGeimgLHjNjT8GG67ZSA9XW7lmsR4he99tNDtENHpypqc28zFu5fOxkxE5jR1auchBXzNdzK8c1Gl/XfQ1WnPErU52gL5pZDGQpz+CRCNxComRsFO9bC0KMK597+5nRKcj5IyEdTZ1yu0bLD6ig4I7PUFtVN3XR3bQ9qCszMsBEaeme8PAe+cBMbknVYxQM40f87tYfhsMHtE9QikkLNpo6cAsyg3upbPv5VR380Mj50nsbAvgrvTakjN9jQnb4DsIIntXcw10wWN1i6j7ZDqT5C8vA+VRsgkTCKgEqdGgCjRTaDxyQrmcmZGMEmwxnuJqMTOZ7tBYVgiPouYFU34rIWfYvsqpQ6Z7yiSz9pD3y1k91jdbjAv2OxTg8J1DGDK8m7gmslCXXKmao1xk67O5A3FwQ2DErzNPYRpUGGjuQXZKPLVK4A71Kcch7yUsh1OkvkRnFQnoRS+x2ICGaetwH4oTs5UgPzwEvgwPZRY2+Iu30WCEAqPCmhjac24PbzO1jzXDCUy6OehpUT7iqRoPtTwabSEwMenu6ho3c4yNdg79RIsb/BjcIgDbQ3kRwqpyfgyW+luLbFQefEs09edHDW4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(376002)(396003)(39840400004)(8676002)(316002)(31696002)(6666004)(86362001)(66946007)(4326008)(54906003)(5660300002)(186003)(6916009)(8936002)(83080400002)(36756003)(7416002)(66476007)(66556008)(31686004)(2616005)(45080400002)(52116002)(6486002)(2906002)(83380400001)(66574015)(53546011)(16526019)(966005)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RnJnTVVSZDdYQm0yOG5FeFNTWTRHeHczb21HcmJ1Vk13eWFoeEdZU3U0eTkr?=
 =?utf-8?B?ekxBc0pzRy9yd2llSXYvQWhxeG5RalR5SEJGQ0V0NEdrZUJ1Zll6S3dIV1hq?=
 =?utf-8?B?OFErektoT3pBV21tamNhRloxaHRONW9Od0JiN1dCWnA0S0s5WStCU2J0TUFG?=
 =?utf-8?B?dG9OTnVraGJxbDBOSDVjZzg0SzY4eWVnMk5vQ0ZITlBZaGlrZVd3dWJHbEgz?=
 =?utf-8?B?bE5ETTFNRVNBcVBQWmQrd3N6Z2poaXNsUVBhcTNFTTVXRUo2NnhwUnpWdlRn?=
 =?utf-8?B?UnUyYUhQTW5SK1JKOHF4UUF3bDZ4WUhmMEJZdDVDZDVTaWJ6UTNxVFJoY004?=
 =?utf-8?B?emwzR2dPK3d3NUhkZ0FuZXZwZXRvRDBRckQvd25pWllDNzhacXNxRXRJdTVW?=
 =?utf-8?B?Z09XNXo5ekZ6ZlVlbm91MnJCQWNBTHVCaTJ2T0UyZ25PZWYrbUlZSE9ZY3pV?=
 =?utf-8?B?WFhCSUdDbzhnamRra0U4YWNNdHJnN2lnMnhBRmsyVVh3Y1FGTi9keTFBeHRF?=
 =?utf-8?B?V1YyTjc2OTlyLzEvcm5IL1lGWkZiVDkyWGZXRkdOTUQyejdGSzN0andwQ0RD?=
 =?utf-8?B?Q0h0MzFGbGdwV2JEcGJxQWtObkZ0K1gvUmNaL2xBQ3QrTnFrV0NZdXhwTjFm?=
 =?utf-8?B?ZUlkMER3bDlnNlZlVjF5aWNGVmtTNmhVTmZYRklIOGh5ZUZ4cHRNcHl3QjE5?=
 =?utf-8?B?VkJWL1NCdXZaWXZPRjFBekkybEZ0T0cyZGFUK21LY2x3VUpESWlnaGluYnl6?=
 =?utf-8?B?cW9zekVyVUFrY0Vmc1ljY3R3RnFNbnlxWWNRTjdSNU9lTGpsa1A1OWRxSjIr?=
 =?utf-8?B?SlljcGU0eklCN2Y3MTlmTEUzYXF5YVJaUUVma2x2ZzZrVUUrTkx5emRGdENu?=
 =?utf-8?B?dDRHQjJoTWxkdlNDeEdzTDFmVSt6c2RMWWtUYUNmdisxcVZaUldFNUJzb09w?=
 =?utf-8?B?NE1GWEVvOGkxbXNJV3EwNFFoOUQzb2xwc25EWkFhQStzYlBGVEROS0VrSFhK?=
 =?utf-8?B?anJvcUpxaGQ3aHk2TVNXRUcxS2k5cWU0MnNPdzNKWUxvNk9PM0hVZXRGbFp4?=
 =?utf-8?B?L1ZlRSt3U1o1Qm9GbmtQYWtpVDZLME5SRWkyVjVOYkh5ejNkZmo4d0MvQkQv?=
 =?utf-8?B?cFc4S2h3VXZFbEJjYldQaG1ZWnpiZ2V4YW1nUnlQM3JEdVRBd2g2Ry9lQnJ5?=
 =?utf-8?B?U0ttRWQwWUJFR3UrblZCaDVJZHdGWW5qd0R1L1B5Qm1reVFYazhEV0VjR25F?=
 =?utf-8?B?WVVJenJwN203NU14bEZsWDBrOTlwTDdQZFBaS3Y0VGZqRklqRHhVYzNZNkhC?=
 =?utf-8?B?Nko4ZnBqRVRkdEJCSHlUTGRDZ0VvaVF6R1VOSjRZQmc4em5WU0UwNUNlajUx?=
 =?utf-8?B?RG1rZllaVkFDaWFpbDFQOU1CTnZEYXhnY1U0NFVXb1FZNy92UmlKMzE4dysv?=
 =?utf-8?B?ekJtcVBqYzVIL3h3dVB0dnpBVDJRU3B0blY1Mm84WU9ZM3dSdFdMekU1cnF1?=
 =?utf-8?B?OUNkUS9XbWV4RGVWMHJxU01UZURLcGN0OUJqVndGS05vS2tnZ3Awdmx6N1Jy?=
 =?utf-8?B?eGE0dFZrK2JDL2N1Y0RWNFhHaFY2ejB6L1diK3RMTlNtRm4wZ29weGdnZ2dD?=
 =?utf-8?B?amVJWk9IR1pxYTJJNWZUUXlDT1ZqZjRET1hsMzkwWGJIVFlFNDBLdU5ORWtS?=
 =?utf-8?B?ZStlWFp3WFJRVytWVnB5Qm9oOVNkSGRBcHVLbmJOMVllekpDN3pMYTUwZU5s?=
 =?utf-8?B?aVlwTlozUnJwYTMvdklQSWhFZzQ3RGR2dFh0MUt6Qm5PMmhxZktvc2E0L1A5?=
 =?utf-8?B?KzgrK3pxb3Z5bWtyVjBJVWVZOEs2QUw3dHN4b0FsSWVXa1FRaXFSbUFLakcy?=
 =?utf-8?Q?PglyYXVjKnsGM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aee8b2b-a197-4672-8af3-08d8cdf95688
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 19:23:25.7413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nIuh8QgRkJtdJ+HG5swBmG64A88Zo4wWa0NvfT1RSCoLiOPEgG6QEEPaFEjZeQZe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3791
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 10.02.21 um 20:12 schrieb Suren Baghdasaryan:
> On Wed, Feb 10, 2021 at 10:32 AM Christian König
> <christian.koenig@amd.com> wrote:
>>
>>
>> Am 10.02.21 um 17:39 schrieb Suren Baghdasaryan:
>>> On Wed, Feb 10, 2021 at 5:06 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>>> On Tue, Feb 09, 2021 at 12:16:51PM -0800, Suren Baghdasaryan wrote:
>>>>> On Tue, Feb 9, 2021 at 12:03 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>>>>>> On Tue, Feb 9, 2021 at 6:46 PM Christian König <christian.koenig@amd.com> wrote:
>>>>>>>
>>>>>>> Am 09.02.21 um 18:33 schrieb Suren Baghdasaryan:
>>>>>>>> On Tue, Feb 9, 2021 at 4:57 AM Christian König <christian.koenig@amd.com> wrote:
>>>>>>>>> Am 09.02.21 um 13:11 schrieb Christian König:
>>>>>>>>>> [SNIP]
>>>>>>>>>>>>> +void drm_page_pool_add(struct drm_page_pool *pool, struct page *page)
>>>>>>>>>>>>> +{
>>>>>>>>>>>>> +     spin_lock(&pool->lock);
>>>>>>>>>>>>> +     list_add_tail(&page->lru, &pool->items);
>>>>>>>>>>>>> +     pool->count++;
>>>>>>>>>>>>> +     atomic_long_add(1 << pool->order, &total_pages);
>>>>>>>>>>>>> +     spin_unlock(&pool->lock);
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +     mod_node_page_state(page_pgdat(page),
>>>>>>>>>>>>> NR_KERNEL_MISC_RECLAIMABLE,
>>>>>>>>>>>>> +                         1 << pool->order);
>>>>>>>>>>>> Hui what? What should that be good for?
>>>>>>>>>>> This is a carryover from the ION page pool implementation:
>>>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Ftree%2Fdrivers%2Fstaging%2Fandroid%2Fion%2Fion_page_pool.c%3Fh%3Dv5.10%23n28&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C4c92877de38440ef18ee08d8cdf7c8ab%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637485811429326241%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Ghp48YBj6R3z4yKsj8ecjXxhZp8g5sJOL0GJRUtCFKY%3D&amp;reserved=0
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> My sense is it helps with the vmstat/meminfo accounting so folks can
>>>>>>>>>>> see the cached pages are shrinkable/freeable. This maybe falls under
>>>>>>>>>>> other dmabuf accounting/stats discussions, so I'm happy to remove it
>>>>>>>>>>> for now, or let the drivers using the shared page pool logic handle
>>>>>>>>>>> the accounting themselves?
>>>>>>>>> Intentionally separated the discussion for that here.
>>>>>>>>>
>>>>>>>>> As far as I can see this is just bluntly incorrect.
>>>>>>>>>
>>>>>>>>> Either the page is reclaimable or it is part of our pool and freeable
>>>>>>>>> through the shrinker, but never ever both.
>>>>>>>> IIRC the original motivation for counting ION pooled pages as
>>>>>>>> reclaimable was to include them into /proc/meminfo's MemAvailable
>>>>>>>> calculations. NR_KERNEL_MISC_RECLAIMABLE defined as "reclaimable
>>>>>>>> non-slab kernel pages" seems like a good place to account for them but
>>>>>>>> I might be wrong.
>>>>>>> Yeah, that's what I see here as well. But exactly that is utterly nonsense.
>>>>>>>
>>>>>>> Those pages are not "free" in the sense that get_free_page could return
>>>>>>> them directly.
>>>>>> Well on Android that is kinda true, because Android has it's
>>>>>> oom-killer (way back it was just a shrinker callback, not sure how it
>>>>>> works now), which just shot down all the background apps. So at least
>>>>>> some of that (everything used by background apps) is indeed
>>>>>> reclaimable on Android.
>>>>>>
>>>>>> But that doesn't hold on Linux in general, so we can't really do this
>>>>>> for common code.
>>>>>>
>>>>>> Also I had a long meeting with Suren, John and other googles
>>>>>> yesterday, and the aim is now to try and support all the Android gpu
>>>>>> memory accounting needs with cgroups. That should work, and it will
>>>>>> allow Android to handle all the Android-ism in a clean way in upstream
>>>>>> code. Or that's at least the plan.
>>>>>>
>>>>>> I think the only thing we identified that Android still needs on top
>>>>>> is the dma-buf sysfs stuff, so that shared buffers (which on Android
>>>>>> are always dma-buf, and always stay around as dma-buf fd throughout
>>>>>> their lifetime) can be listed/analyzed with full detail.
>>>>>>
>>>>>> But aside from this the plan for all the per-process or per-heap
>>>>>> account, oom-killer integration and everything else is planned to be
>>>>>> done with cgroups.
>>>>> Until cgroups are ready we probably will need to add a sysfs node to
>>>>> report the total dmabuf pool size and I think that would cover our
>>>>> current accounting need here.
>>>>> As I mentioned, not including dmabuf pools into MemAvailable would
>>>>> affect that stat and I'm wondering if pools should be considered as
>>>>> part of MemAvailable or not. Since MemAvailable includes SReclaimable
>>>>> I think it makes sense to include them but maybe there are other
>>>>> considerations that I'm missing?
>>>> On Android, yes, on upstream, not so much. Because upstream doesn't have
>>>> the android low memory killer cleanup up all the apps, so effectively we
>>>> can't reclaim that memory, and we shouldn't report it as such.
>>>> -Daniel
>>> Hmm. Sorry, I fail to see why Android's low memory killer makes a
>>> difference here. In my mind, the pages in the pools are not used but
>>> kept there in case heaps need them (maybe that's the part I'm wrong?).
>>> These pages can be freed by the shrinker if memory pressure rises.
>> And exactly that's the difference. They *can* be freed is not the same
>> thing as they *are* free.
> No argument there. That's why I think meminfo has two separate stats
> for MemFree and MemAvailable. MemFree is self-explanatory. The
> description of MemAvailable in
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.kernel.org%2Fdoc%2FDocumentation%2Ffilesystems%2Fproc.txt&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C4c92877de38440ef18ee08d8cdf7c8ab%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637485811429326241%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=0MI4k9YtAnGvP0QlBYHC6QMCJvQpZoaWMRlqjptvwsA%3D&amp;reserved=0 says "An
> estimate of how much memory is available for starting new
> applications, without swapping.". Since dropping unused pages from
> slabs, caches and pools is less expensive than swapping, I would
> assume that a well-behaved system would do that before resorting to
> swapping. And if so, such memory should be included in MemAvailable
> because VM will make it available before swapping. But again, that's
> my interpretation. WDYT?
>
>>> In that sense I think it's very similar to reclaimable slabs which are
>>> already accounted as part of MemAvailable. So it seems logical to me
>>> to include unused pages in the pools here as well. What am I missing?
>> See the shrinkers are there because you need to do some action before
>> you can re-use the memory.
>>
>> In the case of the TTM/DRM pool for example you need to change the
>> caching attributes which might cause sleeping for a TLB flush to finish.
> I see your point here. But how about caches/pools which can be easily
> dropped? Shouldn't they be part of MemAvailable?

Well if it can be easily dropped and reallocated we wouldn't have a pool 
for that in the first place :)

I mean we have created this page pool because the TLB shot down for the 
caching change is extremely costly.

It could make sense for slap, but not sure about that.

Regards,
Christian.

>
>> By accounting those pages as free you mess up (for example) the handling
>> which makes sure that there are enough emergency reserves. I can only
>> strongly recommend to not do that.
>>
>> What you could do is to add a sysfs interface to expose the different
>> shrinkers and the amount of pages in them to userspace. Similar to what
>> /proc/slabinfo is doing.
> True, we can work around this. Just want to make sure whatever we do
> really makes sense.
> Thanks,
> Suren.
>
>> Regards,
>> Christian.
>>
>>>>>> Android (for now) only needs to account overall gpu
>>>>>> memory since none of it is swappable on android drivers anyway, plus
>>>>>> no vram, so not much needed.
>>>>>>
>>>>>> Cheers, Daniel
>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>>> In the best case this just messes up the accounting, in the worst case
>>>>>>>>> it can cause memory corruption.
>>>>>>>>>
>>>>>>>>> Christian.
>>>>>> --
>>>>>> Daniel Vetter
>>>>>> Software Engineer, Intel Corporation
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C4c92877de38440ef18ee08d8cdf7c8ab%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637485811429326241%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=vqR0DAK5XkzanA4fqN0hxDm8ZbCazpvlqTDMUqxhDoA%3D&amp;reserved=0
>>>> --
>>>> Daniel Vetter
>>>> Software Engineer, Intel Corporation
>>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C4c92877de38440ef18ee08d8cdf7c8ab%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637485811429326241%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=vqR0DAK5XkzanA4fqN0hxDm8ZbCazpvlqTDMUqxhDoA%3D&amp;reserved=0

