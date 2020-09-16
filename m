Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5BA126CD31
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 22:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbgIPUzk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 16:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726578AbgIPQxB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 12:53:01 -0400
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (mail-bl2nam02on061e.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe46::61e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2B02C0A889D;
        Wed, 16 Sep 2020 06:00:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ErrOuxa3MujUvNNOBau1Hx54hJbxueklDRulQ8TsAFJr0aKt+ZNXgns46OwJJF86+khjlEauA7+hZSCY8WpS/Ob6bqgqpYFzvGIW6c6r0k7tmj17PN033lXju6Y3hsyc8deBkdPBYsoqf35NpgbTxgmznWZS5EHXq9HrSYvnCSffhzKoDaqVunuivLQJjjNuA9kMIIDxLNMZaQZcYyc3F3UKNi4/uYkruRC30s8yn3KmP1AH1HE17LO/ilPSgr3GIn5zzWAs7lA0+N0A+dKkaFC1wgq9pIiHHDzRC7akKHNBnu9KR2VDLpSYuupgB7VwmQxEQLWlNt03Juoh5bb51A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IaEdr8l66IXRq8bDD6lyfWmluYbsj84CmtABMDA/ypg=;
 b=ByZVPp2AIWoc3wWSR+zNaeAme9p68lTAe4jG2YT+4XMnSfu2j/YOSRhTcxDJO/VuV+XtcNMkfRlaIkk5TgIcay/J3Iz0L9ExpBeREDa78SXz5Gst9aautKVJ1Z8TPr4zFhAfJc+aD0zeSt6kmmtMIJRmzigpQBuF8BWY50oKYNE1H8a0talEl/887uVFm0IiSjdHNKXpE+PWAZMlXTgmnEpPC57W1w8R2FlJaLTFKkKwNgSir7A70Khagh2McEviyXllfR3ucJ3miPkAToVw2DqQJUItoshnXlAMVBj4epHAeChvdtB0oJPpkCRXhSHp6QBahm68Z/WMkS0Nzq3rwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IaEdr8l66IXRq8bDD6lyfWmluYbsj84CmtABMDA/ypg=;
 b=mHZlf4b/GkF/MCf4AwcTjbw38pM9T3sW01COjLfT3EUPAin+PQpioWCtKQwKyiYlxvLuANowWRJHkU/E+6qqy0bFEuFh16i9NXjA5o20kpnoNk+SGjbudKEoGV+cmX5fYqBZQJOVwMzfah04b6vfbPjNrfjav8SzAWPv79H3Fsw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2580.namprd12.prod.outlook.com (2603:10b6:207:3e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 13:00:06 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 13:00:06 +0000
Subject: Re: [PATCH 0/3] dma-buf: Flag vmap'ed memory as system or I/O memory
To:     Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     sumit.semwal@linaro.org, airlied@linux.ie, sam@ravnborg.org,
        mark.cave-ayland@ilande.co.uk, kraxel@redhat.com,
        davem@davemloft.net, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, l.stach@pengutronix.de,
        linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, mchehab@kernel.org,
        chris@chris-wilson.co.uk, matthew.auld@intel.com,
        thomas.hellstrom@intel.com, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        etnaviv@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, sparclinux@vger.kernel.org
References: <20200914112521.1327-1-tzimmermann@suse.de>
 <20200916093756.GC438822@phenom.ffwll.local>
 <0378c326-28c6-371e-45d2-8b81ccbda84f@suse.de>
 <20200916122405.GQ438822@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <53743f37-4142-c076-296f-bfcba0840121@amd.com>
Date:   Wed, 16 Sep 2020 14:59:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200916122405.GQ438822@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM3PR05CA0104.eurprd05.prod.outlook.com
 (2603:10a6:207:1::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM3PR05CA0104.eurprd05.prod.outlook.com (2603:10a6:207:1::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend Transport; Wed, 16 Sep 2020 13:00:01 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d9006b38-420f-435f-3165-08d85a406eea
X-MS-TrafficTypeDiagnostic: BL0PR12MB2580:
X-Microsoft-Antispam-PRVS: <BL0PR12MB25802D9F1777F77863361ED483210@BL0PR12MB2580.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W9YuKSjzvl0+CWdsjPlJ6MZBlU1GWg9UCpOnG/Cf+UnegqZl6gNWuTGLwrNXlGer/ccMKalKDHIOVwvo6guv7HXTq/S3znGWcVI8CCQIwG9xkiZ11aMFSbBY3ytfDt97gVuY/ZHhqxpZVktSv5sWl9N3CKSb7Wws8qUT1jtZg0r2igPm0SzPBExuJ+JTCesGJuHiQiz24nhFSrAzqeBcy9m/BrfUOWlwRLogNz1wtAp6qEmJL165/3noKRuQGrJM8MM0QH4j21GEU5+FIz0ZanYUXijVGK3M8VvqM96v3i0jpyvlEVKWxDPsnzd1gckdHYL1K1k5tuYg923gDPxIdLEupkr5Xvlx7irIYTrjwd5WcW+oIgZ4NVYOA7whsjca20ykILcaIh/yztrRvV4bzgEFMym9mI3ZFskcDj7oEITkBSgdFPGXtb8Inf8fL/sr7CdRdNFdGotWJNAZxZZcag==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(6486002)(66946007)(31686004)(66574015)(66556008)(45080400002)(8936002)(66476007)(86362001)(2616005)(6666004)(83380400001)(4326008)(31696002)(36756003)(5660300002)(316002)(7406005)(16526019)(478600001)(966005)(2906002)(110136005)(8676002)(52116002)(7416002)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: eiBS9mQMZ8tM7l0nRg0iUe4VG6mQQqQq3ebQ4yRlpaf2Qrf93jFVQWpq+NfSBf3LinaAGJrd7vnSgcDdRK3keETxkUYr0hf0iy+bLgtN0gnhEkHikq/4hCrxqPeyYsmw4jmBpa0zDZA9huTWHSbAr0GBUd/d1v/h9i9VnKoC33fxcOPoh5VbhmnpjzFwzFFkWCDlX/6xI5gr/r6ZDBb+P2kO9nCQd2hgXL0tMTmxGN0lAsCrssJJ63bijPK4UCu1HFdca9lNW4+I6CabYaT3z665H0ETXIHc9Sw/+73I0Ej0MPZgLiO5A9x5T44qNEOzwLPh8MBAeG0QoMVRt1nirZkWc51b/IX1H0px27aMiiXgn332JCoLzRfArr3/M3ICQR1bQO2rbQvKonobfsqTBPjt/Gla6RO3zW02UZs3pKzIM9mp5tCG/XmNvnlF9l5QX7h+EYgBzeXQPK9nFs7cmn5YBxjgir4gybAKe60L6BN+jVZH9CF7qqeVhw2WUP7xKTgzgZGdFxjcAALUGy29wNxmpOHbORpFd9xmt9DijzxAgw/rswjzSCx5BzT5wgzbnFsT87Z9jL/0+QGQwvA3zcCILNu3l7cAI7r6L1Wgh0D5/ElER+1XN+dqBKM3DgX3RKxBvDeXqam4HwrRkKOBy5PUmfHkesTe5t9g2Zqp0nvMz7dwSOktCeuE0lXFd4bC47RRIaRJEW6WToG+We0mCQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9006b38-420f-435f-3165-08d85a406eea
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 13:00:06.5109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gMFmyU2SHkeiVAdprVWOgNnXNdvcqtwhGAVtPFYMugRtl1jG/0G0DnyKk7f62lnz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2580
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 16.09.20 um 14:24 schrieb Daniel Vetter:
> On Wed, Sep 16, 2020 at 12:48:20PM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 16.09.20 um 11:37 schrieb Daniel Vetter:
>>> On Mon, Sep 14, 2020 at 01:25:18PM +0200, Thomas Zimmermann wrote:
>>>> Dma-buf provides vmap() and vunmap() for retrieving and releasing mappings
>>>> of dma-buf memory in kernel address space. The functions operate with plain
>>>> addresses and the assumption is that the memory can be accessed with load
>>>> and store operations. This is not the case on some architectures (e.g.,
>>>> sparc64) where I/O memory can only be accessed with dedicated instructions.
>>>>
>>>> This patchset introduces struct dma_buf_map, which contains the address of
>>>> a buffer and a flag that tells whether system- or I/O-memory instructions
>>>> are required.
>>>>
>>>> Some background: updating the DRM framebuffer console on sparc64 makes the
>>>> kernel panic. This is because the framebuffer memory cannot be accessed with
>>>> system-memory instructions. We currently employ a workaround in DRM to
>>>> address this specific problem. [1]
>>>>
>>>> To resolve the problem, we'd like to address it at the most common point,
>>>> which is the dma-buf framework. The dma-buf mapping ideally knows if I/O
>>>> instructions are required and exports this information to it's users. The
>>>> new structure struct dma_buf_map stores the buffer address and a flag that
>>>> signals I/O memory. Affected users of the buffer (e.g., drivers, frameworks)
>>>> can then access the memory accordingly.
>>>>
>>>> This patchset only introduces struct dma_buf_map, and updates struct dma_buf
>>>> and it's interfaces. Further patches can update dma-buf users. For example,
>>>> there's a prototype patchset for DRM that fixes the framebuffer problem. [2]
>>>>
>>>> Further work: TTM, one of DRM's memory managers, already exports an
>>>> is_iomem flag of its own. It could later be switched over to exporting struct
>>>> dma_buf_map, thus simplifying some code. Several DRM drivers expect their
>>>> fbdev console to operate on I/O memory. These could possibly be switched over
>>>> to the generic fbdev emulation, as soon as the generic code uses struct
>>>> dma_buf_map.
>>>>
>>>> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20200725191012.GA434957%40ravnborg.org%2F&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C04e3cc3e03ae40f1fa0f08d85a3b6a68%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637358558524732385&amp;sdata=wTmFuB95GhKUU%2F2Q91V0%2BtzAu4%2BEe3VBUcriBy3jx2g%3D&amp;reserved=0
>>>> [2] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20200806085239.4606-1-tzimmermann%40suse.de%2F&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C04e3cc3e03ae40f1fa0f08d85a3b6a68%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637358558524732385&amp;sdata=L4rBHmegO63b%2FiTQdTyH158KNxAZwSuJCQOaFszo5L0%3D&amp;reserved=0
>>> lgtm, imo ready to convert the follow-up patches over to this. But I think
>>> would be good to get at least some ack from the ttm side for the overall
>>> plan.
>> Yup, it would be nice if TTM could had out these types automatically.
>> Then all TTM-based drivers would automatically support it.
>>
>>> Also, I think we should put all the various helpers (writel/readl, memset,
>>> memcpy, whatever else) into the dma-buf-map.h helper, so that most code
>>> using this can just treat it as an abstract pointer type and never look
>>> underneath it.
>> We have some framebuffer helpers that rely on pointer arithmetic, so
>> we'd need that too. No big deal wrt code, but I was worried about the
>> overhead. If a loop goes over framebuffer memory, there's an if/else
>> branch for each access to the memory buffer.
> If we make all the helpers static inline, then the compiler should be able
> to see that dma_buf_map.is_iomem is always the same, and produced really
> optimized code for it by pulling that check out from all the loops.
>
> So should only result in somewhat verbose code of having to call
> dma_buf_map pointer arthimetic helpers, but not in bad generated code.
> Still worth double-checking I think, since e.g. on x86 the generated code
> should be the same for both cases (but maybe the compiler doesn't see
> through the inline asm to realize that, so we might end up with 2 copies).

Can we have that even independent of DMA-buf? We have essentially the 
same problem in TTM and the code around that is a complete mess if you 
ask me.

Christian.

> -Daniel
>
>
>> Best regards
>> Thomas
>>
>>> -Daniel
>>>
>>>> Thomas Zimmermann (3):
>>>>    dma-buf: Add struct dma-buf-map for storing struct dma_buf.vaddr_ptr
>>>>    dma-buf: Use struct dma_buf_map in dma_buf_vmap() interfaces
>>>>    dma-buf: Use struct dma_buf_map in dma_buf_vunmap() interfaces
>>>>
>>>>   Documentation/driver-api/dma-buf.rst          |   3 +
>>>>   drivers/dma-buf/dma-buf.c                     |  40 +++---
>>>>   drivers/gpu/drm/drm_gem_cma_helper.c          |  16 ++-
>>>>   drivers/gpu/drm/drm_gem_shmem_helper.c        |  17 ++-
>>>>   drivers/gpu/drm/drm_prime.c                   |  14 +-
>>>>   drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  13 +-
>>>>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  13 +-
>>>>   .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  18 ++-
>>>>   drivers/gpu/drm/tegra/gem.c                   |  23 ++--
>>>>   .../common/videobuf2/videobuf2-dma-contig.c   |  17 ++-
>>>>   .../media/common/videobuf2/videobuf2-dma-sg.c |  19 ++-
>>>>   .../common/videobuf2/videobuf2-vmalloc.c      |  21 ++-
>>>>   include/drm/drm_prime.h                       |   5 +-
>>>>   include/linux/dma-buf-map.h                   | 126 ++++++++++++++++++
>>>>   include/linux/dma-buf.h                       |  11 +-
>>>>   15 files changed, 274 insertions(+), 82 deletions(-)
>>>>   create mode 100644 include/linux/dma-buf-map.h
>>>>
>>>> --
>>>> 2.28.0
>>>>
>> -- 
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 Nürnberg, Germany
>> (HRB 36809, AG Nürnberg)
>> Geschäftsführer: Felix Imendörffer
>>
>
>
>

