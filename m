Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05AF9314EC5
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 13:16:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhBIMOC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 07:14:02 -0500
Received: from mail-bn8nam11on2080.outbound.protection.outlook.com ([40.107.236.80]:23584
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230050AbhBIMMS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Feb 2021 07:12:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mrx829m9ND4fxlOtPn6yGhreBIXuz5u7O34KDrIjozXdGr2bZ2uht6V3BG+1b86H5Ag2pATAYGb7mOEBzzPpuvLFVRBQqfzLfcm8J5FNQ+ORkdKcLAbNcz6NIhkGke1OBfrHfFix3L8sNsSn7X2qamDYSguadm7M/3rhyVeTrIIYI7odzQ9ObGySbD0gnVbZADAgzKZKH652rzQXsmf3cCDycdrsahkFRQjSZdz5DTLDkQdoUmNA80YRhZIfoL1vjHKVM39Yd5Jim3+i3YmxzC0Z0ZD00T4r6ZI/gdRgkcULIkXb6svx8oekz2YTfipY+616k/Yum1O2TEl3L7zKjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lirIvH87AEi9z9KBaO/s5muD93QGIa1juve6lnuznkM=;
 b=DIOBoTPVqVIEhWkyv0mkPc/ABpzMWlOonVRPRYARXgFKz1854jx3R7J+GP0QdC7LngOl95NZT2D8cyJfzi/P6+OJRir6uogLf78grTiNGPMvCSz2PYl6zGx8o/aDrI2gQPJ6LtnvBIYhQMMCLmIh8y5P/OMPE+kB/TF6WZ4cjKSv/cqNQN2VG6CuXoR0m1S9CG3Xo4oex0aEDXj8R9UwfcX5fK7TUo0sShsQwIAeG549Ry4OuapGOVpisAoe0AP83QTm5svREp521A60rY8OC9K6FvM9gbv1Zp3OCVE0uXGHB1QzyJhBeflzEdBDzMT0WDmNwBMC5FcHk9bSvMeVcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lirIvH87AEi9z9KBaO/s5muD93QGIa1juve6lnuznkM=;
 b=i3sWEYg/zoVGArLKdk2n1DX5vGIAv1Tmnm6RuXSkXpt+VDZdTZDSmqZPLwxAhAOepdXSa/riuWWhz6ll54Zbfvk8YWkH2W48SaVgV75Gi2WKDvUwGocJ8Z2KEXGiPuMh7L2XCeNfLKoc9dU+UTHSFB3XtR4RJMGYOppuoCpvJ6E=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4207.namprd12.prod.outlook.com (2603:10b6:208:1d9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.24; Tue, 9 Feb
 2021 12:11:22 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 12:11:22 +0000
Subject: Re: [RFC][PATCH v6 1/7] drm: Add a sharable drm page-pool
 implementation
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
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
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <48225879-2fe1-22ac-daae-c61d52465aea@amd.com>
Date:   Tue, 9 Feb 2021 13:11:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CALAqxLWZkUFvJX5r2OU2erW4tU3j=+u==VTyzYkt+95LwwVCUA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:444c:9a67:948b:2493]
X-ClientProxiedBy: AM4PR0101CA0056.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:444c:9a67:948b:2493] (2a02:908:1252:fb60:444c:9a67:948b:2493) by AM4PR0101CA0056.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Tue, 9 Feb 2021 12:11:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c44009a3-3faf-470e-33c7-08d8ccf3d096
X-MS-TrafficTypeDiagnostic: MN2PR12MB4207:
X-Microsoft-Antispam-PRVS: <MN2PR12MB42074C9A1A45F31615FB567F838E9@MN2PR12MB4207.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eexS5PjTmB86hhAyXgbYc2PRbrqVrfERXs9PRTcZE0ldOgjh37VukpWOk85L/3F4/VuTyrXVSUBkih02gtv2fpvOn0VAs7MkLgnNk4pDFWeKJFl/pTf3RynNqVUIN/uTBJ7gUbhwhXsiYJOjX0Pr9EX70iZ1bV6DsaIabPj4/7Wcxp8GdGhdthT1rBa5VRjuehQH0kmi52o+cP0vAAEBzbYPLu+FpJh97GZ++8ah1BRvks4b5uI1Fb59zgQAGxIUq5YtBjApX6sYmWn0qe9qNWwBYgAkf1q8E/8DxrdXMGt8GDhvPrUa9iQOGbclB2szFjymufJyJa6+RT9to3bQNdo44MpnlFZBzAD6Q2kTVk6EC1vMd6cpde6HGdDNAP0O3hhVLenl0DkUcO+TBASDWyuHDWBwCU0MZi2NUpbmJC79UGxtS4f3hyg/X+C2KARMf8d/ioFaJUYmyCgGQkwFX4tofXh7XZ8tlecdV5utb4/M7U7k6WQSaHo/e78F7yCjVEC7jTRyw2vYms2dQNXUsPQTaEOfuPrllO6JDV56MFr4d/BrRynlXpuHEsrhqs/OKBgy6nNnwLWY++JM5Fi2Xbd+oFsOZu/k5TFkmJcm7doxSBQTlUCBT+ZQUoitadIytaOTJJARF1ucvRAVm4BxyqF6eV6+MzGv/GN9bBY66rQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(966005)(6916009)(31696002)(54906003)(478600001)(86362001)(52116002)(66946007)(66556008)(45080400002)(4326008)(53546011)(2906002)(316002)(6666004)(8676002)(66476007)(8936002)(2616005)(6486002)(31686004)(66574015)(16526019)(7416002)(83380400001)(5660300002)(186003)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Sk1SOFJiL0x4WFJXbWNONzZrRS9FdEkwdWZsaUU4UHZJQ3FyMVVnbGN0UXBq?=
 =?utf-8?B?dTVKWnB2ajQ5MENaTDNDNGpTaWloczFFVENGdkR0R1BKQU9HYnE0Y1NWbGN6?=
 =?utf-8?B?M09mSmdTKzNDcFFNWGhITmFmUDlGNzBrWWlyS0VqcUxYNXViRkhueEF3dUF6?=
 =?utf-8?B?YjNwT25kU21rRythb3ppVkdJT2dUaEUzU01KNXlFa3VVaWo1VXQ5MzlNMnl6?=
 =?utf-8?B?Mytzb1VOSnJERGxQVmdvTVpjSE5CSGs2V2JVRDlKczNZVlp4dDd1Tk8wZkhL?=
 =?utf-8?B?RzVXT1Fhc0VJdVhGOHBjU2grOEhyNnN0ek8yN1pKN3VkVnZpYmVGMW1GaDB1?=
 =?utf-8?B?azRtUmxkNlRpSVJSZTFneTZWeU1VWXVmcXBISTNYVkNLdHpqeEplYlBXd1VW?=
 =?utf-8?B?Y3JrOEVxOWRNY1pwMmJTbTgyaGlJTFh6b0d4c3lESWtVenRFR1NrWUxEUEdM?=
 =?utf-8?B?bWZFbzJEWjh5dVZNcCt6WTVWaGljZmhHQjM5cWlqandJNXh2dkgxQy8zbWFn?=
 =?utf-8?B?VjVldkNRcFE4L2pLOTR6M0Zpa2g3dkQ4U3h4YllwUHpoaXJPN01NYkFHcnhE?=
 =?utf-8?B?aFBLTE1pVTdCcXAyS2J4VTU2R3l0Q1hNclJrZEFBQUcxR2VOWEdVNnlYS1pZ?=
 =?utf-8?B?M3FKYnF5QTZhbVFYSkdxYm1KQ3JFZDRHTVdEMEhQcUF6UUFTWDlSUDQvZWxP?=
 =?utf-8?B?QVY3MGNCQUN3aThYby9LTUM0bi93N0E5RmJWUHZRbm0rUitUSnozSld0V0VJ?=
 =?utf-8?B?aWVhaExTU3pHK29hTUE4NVFmQ05jUVZvWTZYWXlDaDVERDZFTlcrV1U3WnR3?=
 =?utf-8?B?dFFWZmdkajVTNjA2QWlVcFFnRlR2ZkV6NjcwT2ZVaDBiOVZXdnhxekE2TndU?=
 =?utf-8?B?NHlEeFdxTGduY1ZPR3JIejIvMGQzY0c2QkxNQUFBOVpiUDBUa0JjejZic2hK?=
 =?utf-8?B?dkZYSkRQTExqOVBtc2t1WEx5UXMzTytkMU51NXBWeXB6UTFFQmZtWWIrZHZh?=
 =?utf-8?B?U0pWRjAwVUVRTkk0NnMzcFFrRWdpKzdWRitOT0JZK2dWSlplTFI0MytJZVJs?=
 =?utf-8?B?RHlFbE1kaWZyb2lCalpsOTJheWRpWjhZdnlSOWtSQ0J3SC9NeUV0aDZ5SnNI?=
 =?utf-8?B?a2FXSXdiR2ZqY3RlQkFMakFxeENoNHV4TFQ0RWJrdHlCZUpuNzlvMW5HeGp4?=
 =?utf-8?B?MmZQd1FrVFRzS3dMNzVkWkxYWmRhaWJDaXFpYk5OQXptbWVDbW5jckszaWtw?=
 =?utf-8?B?bXVvVWJXc3E4STliWEVGYVVseUNsMmdYUFAyZFhzbmtTdW5iLy9BcTFXZmRM?=
 =?utf-8?B?czd1SVcrNFZoT3ZJVm9jZElQcS9ncDNVeUhDY0NOOXdWVStyeW5MaDJiTlBF?=
 =?utf-8?B?MUpUVmdZVTJ4MHJRSHVxcEQrOXFrcDV4bjlBK0dWUzZhV2UrUi84bEhodGRv?=
 =?utf-8?B?c1dkenVaTitVdDZBQjNsR1NoY3JUeWpQUHNvUkE5cjVROGlOcFVDb0JocXVq?=
 =?utf-8?B?VWxZODRNVkZOWlFvdHZOYXhFVEVBL0dtUDFTWkRTVFRxUHdZMHRDSlZpbktU?=
 =?utf-8?B?dllOV2djZElUbHRwejVWY0VNZU5nU1EwOHRDUUZ3dzBHT2hMV3NRTTJYczl4?=
 =?utf-8?B?NEVjKzArL2RFN0FNVGNvRWZoUzVWKzBROWZLci9QUXFrQ3NLT2ZSdkxtNFJR?=
 =?utf-8?B?UnFtaUF4YkF5elFFbmhISkd5aGdiZ3BXQkV1SjJFNW43UWQzeDFMRWsvU052?=
 =?utf-8?B?ZXpIS1o3WndSWTRZZmc0dW0vV3Z5UmtqRlVXVVcwaTRUUFNoalRMeWF1b2NV?=
 =?utf-8?B?RUVFWmYvbWJvSVR3eXJ6OUVZY2ZXMWc2dlpmSXI5Y2FQNEcvdm5wNHU5cHN1?=
 =?utf-8?Q?ZVbqlVbZKe/uW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c44009a3-3faf-470e-33c7-08d8ccf3d096
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 12:11:22.2968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AMFJ6ZpsxfAeuBwqQX7zrYD3+WNRdYS1rxm7XmyyJozBL+LttM+sCb5f+knQ1Dxg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4207
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 05.02.21 um 21:46 schrieb John Stultz:
> On Fri, Feb 5, 2021 at 12:47 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 05.02.21 um 09:06 schrieb John Stultz:
>>> diff --git a/drivers/gpu/drm/page_pool.c b/drivers/gpu/drm/page_pool.c
>>> new file mode 100644
>>> index 000000000000..2139f86e6ca7
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/page_pool.c
>>> @@ -0,0 +1,220 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>> Please use a BSD/MIT compatible license if you want to copy this from
>> the TTM code.
> Hrm. This may be problematic, as it's not just TTM code, but some of
> the TTM logic integrated into a page-pool implementation I wrote based
> on logic from the ION code (which was GPL-2.0 before it was dropped).
> So I don't think I can just make it MIT.  Any extra context on the
> need for MIT, or suggestions on how to best resolve this?

Most of the DRM/TTM code is also license able under the BSD/MIT style 
license since we want to enable the BSD guys to port it over as well.

What stuff do you need from the ION code that you can't just code 
yourself? As far as I have seen this is like 99% code from the TTM pool.

Christian.

>
>>> +int drm_page_pool_get_size(struct drm_page_pool *pool)
>>> +{
>>> +     int ret;
>>> +
>>> +     spin_lock(&pool->lock);
>>> +     ret = pool->count;
>>> +     spin_unlock(&pool->lock);
>> Maybe use an atomic for the count instead?
>>
> I can do that, but am curious as to the benefit? We are mostly using
> count where we already have to take the pool->lock anyway, and this
> drm_page_pool_get_size() is only used for debugfs output so far, so I
> don't expect it to be a hot path.

Yeah, it's not really important. IIRC I even walked over the linked list 
to count how many pages we had.

Christian.

>
>
>>> +void drm_page_pool_add(struct drm_page_pool *pool, struct page *page)
>>> +{
>>> +     spin_lock(&pool->lock);
>>> +     list_add_tail(&page->lru, &pool->items);
>>> +     pool->count++;
>>> +     atomic_long_add(1 << pool->order, &total_pages);
>>> +     spin_unlock(&pool->lock);
>>> +
>>> +     mod_node_page_state(page_pgdat(page), NR_KERNEL_MISC_RECLAIMABLE,
>>> +                         1 << pool->order);
>> Hui what? What should that be good for?
> This is a carryover from the ION page pool implementation:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Ftree%2Fdrivers%2Fstaging%2Fandroid%2Fion%2Fion_page_pool.c%3Fh%3Dv5.10%23n28&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cc4eadb0a9cf6491d99ba08d8ca173457%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637481548325174885%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=FUjZK5NSDMUYfU7vGeE4fDU2HCF%2FYyNBwc30aoLLPQ4%3D&amp;reserved=0
>
> My sense is it helps with the vmstat/meminfo accounting so folks can
> see the cached pages are shrinkable/freeable. This maybe falls under
> other dmabuf accounting/stats discussions, so I'm happy to remove it
> for now, or let the drivers using the shared page pool logic handle
> the accounting themselves?
>
>
>>> +static struct page *drm_page_pool_remove(struct drm_page_pool *pool)
>>> +{
>>> +     struct page *page;
>>> +
>>> +     if (!pool->count)
>>> +             return NULL;
>> Better use list_first_entry_or_null instead of checking the count.
>>
>> This way you can also pull the lock into the function.
> Yea, that cleans a number of things up nicely. Thank you!
>
>
>>> +struct drm_page_pool *drm_page_pool_create(unsigned int order,
>>> +                                        int (*free_page)(struct page *p, unsigned int order))
>>> +{
>>> +     struct drm_page_pool *pool = kmalloc(sizeof(*pool), GFP_KERNEL);
>> Why not making this an embedded object? We should not see much dynamic
>> pool creation.
> Yea, it felt cleaner at the time this way, but I think I will need to
> switch to an embedded object in order to resolve the memory usage
> issue you pointed out with growing the ttm_pool_dma, so thank you for
> the suggestion!
>
>
>>> +void drm_page_pool_destroy(struct drm_page_pool *pool)
>>> +{
>>> +     struct page *page;
>>> +
>>> +     /* Remove us from the pool list */
>>> +     mutex_lock(&pool_list_lock);
>>> +     list_del(&pool->list);
>>> +     mutex_unlock(&pool_list_lock);
>>> +
>>> +     /* Free any remaining pages in the pool */
>>> +     spin_lock(&pool->lock);
>> Locking should be unnecessary when the pool is destroyed anyway.
> I guess if we've already pruned ourself from the pool list, then your
> right, we can't race with the shrinker and it's maybe not necessary.
> But it also seems easier to consistently follow the locking rules in a
> very unlikely path rather than leaning on subtlety.  Either way, I
> think this becomes moot if I make the improvements you suggest to
> drm_page_pool_remove().
>
>>> +static int drm_page_pool_shrink_one(void)
>>> +{
>>> +     struct drm_page_pool *pool;
>>> +     struct page *page;
>>> +     int nr_freed = 0;
>>> +
>>> +     mutex_lock(&pool_list_lock);
>>> +     pool = list_first_entry(&pool_list, typeof(*pool), list);
>>> +
>>> +     spin_lock(&pool->lock);
>>> +     page = drm_page_pool_remove(pool);
>>> +     spin_unlock(&pool->lock);
>>> +
>>> +     if (page)
>>> +             nr_freed = drm_page_pool_free_pages(pool, page);
>>> +
>>> +     list_move_tail(&pool->list, &pool_list);
>> Better to move this up, directly after the list_first_entry().
> Sounds good!
>
> Thanks so much for your review and feedback! I'll try to get some of
> the easy suggestions integrated, and will have to figure out what to
> do about the re-licensing request.
>
> thanks
> -john

