Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5EE427C3F2
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 13:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729094AbgI2LKG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 07:10:06 -0400
Received: from mail-dm6nam10on2044.outbound.protection.outlook.com ([40.107.93.44]:59390
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728658AbgI2LJ6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 07:09:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQoewyJpfCBCE3/qElf5nkUfJw0dMuVa6B+HVoEp1mTfiWlIp8/AD3UN8VJtkOVV3RNLttwRcpkCfVTcKvD1Xyl9S2po+i5jxX1YS7KpYXoQAPVsIaiTEpiEV84ujTFL7OegqFDJCoY5gQLxNjA3IrFUz+VVQH7YLJrzOowjeYGH0TLv938euVhHIPLrSiBdoiXObTyoAAFd6M7sW7Dp86wUabH5QigKaaxsJok9dKAxT6O65KiP9Oqoor7xLpERQ9t0ZJfWZ2N0D4DDgEvxlT6DI2MIoFqbbMLy8E9BzevnfPhQyCfc+qJWNlVAU43vc7ZGMF9u2ItRF4lSg81vmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LALp6CBHaJNvdlpYOzbYmeKb8DFCHGK1mLsYgah15Z4=;
 b=WbIfcnebGBmHytxcLMSyt3DuAJbw+5zBMucRidQY2KahlHWeYpEUhJmZ0ZETvRsQLzoaqGqUCqxbblWOeiiT2PMrNSeGuRHWIXOERa05zGzvdmPmOvw/i9HrzbVCb5wdcktxQDomEWBTCJ6+5KUZu5lPh7am4mAUwU9ER2E4iDf4ZfPfhU5wDp8lG3f6JOIR6y4TdEQgj9K9FVdisPsTqw+32YmHkyfrhOgMhhWC8WeNrZa/rmjd/XVutR/8gyKlmHPttycVDzDmo4MYBHf0pznwL2h4E9grVyhGEE0WGLdMCcW+P18ex92ffpXuBBenuVb1ws+Q72Oofn7SHVKseQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LALp6CBHaJNvdlpYOzbYmeKb8DFCHGK1mLsYgah15Z4=;
 b=rEr8rwa9vzEoyNe6kb9v/E3u/yJIEzoQmqpD2M4cqLvHfA4uCAQw6ARW1OHyCrLpuXNSfke65aTFbJzTBGxWZ88Xo311aD9bOGb8BcjvLymmKpyEtelsvQOTRyxIbhIkvjom585h3nNS+3uz6Qe6n4aKsuK6JmmPeaQOocN8TA4=
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2386.namprd12.prod.outlook.com (2603:10b6:207:47::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Tue, 29 Sep
 2020 11:09:54 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 11:09:54 +0000
Subject: Re: [PATCH v3 0/4] dma-buf: Flag vmap'ed memory as system or I/O
 memory
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>, linux-doc@vger.kernel.org,
        airlied@linux.ie, dri-devel@lists.freedesktop.org,
        thierry.reding@gmail.com, kraxel@redhat.com, afd@ti.com,
        m.szyprowski@samsung.com, arnd@arndb.de, corbet@lwn.net,
        jonathanh@nvidia.com, matthew.auld@intel.com,
        linux+etnaviv@armlinux.org.uk, labbott@redhat.com,
        linux-media@vger.kernel.org, pawel@osciak.com,
        intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, thomas.hellstrom@intel.com,
        rodrigo.vivi@intel.com, linux-tegra@vger.kernel.org,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        lmark@codeaurora.org, tfiga@chromium.org,
        kyungmin.park@samsung.com, robin.murphy@arm.com
References: <20200925115601.23955-1-tzimmermann@suse.de>
 <20200926071334.GA42915@ravnborg.org>
 <8761e0dd-569e-0ea0-7bc5-25e4f7cb67cc@suse.de>
 <20200927191605.GA237178@ravnborg.org>
 <3f703297-7b4f-dcca-ea56-70b2413a1e3d@amd.com>
 <ef4400a7-397b-e550-7114-1d4238dd36f3@suse.de>
 <49c4dcec-cd69-510a-9781-e8fa5fb669f9@amd.com>
 <20200929091445.GI438822@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <774e382e-6e60-450c-ee88-bd9ea2916fb4@amd.com>
Date:   Tue, 29 Sep 2020 13:09:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200929091445.GI438822@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR06CA0124.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::29) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR06CA0124.eurprd06.prod.outlook.com (2603:10a6:208:ab::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22 via Frontend Transport; Tue, 29 Sep 2020 11:09:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a2f129a8-075b-43d8-74c9-08d8646830ff
X-MS-TrafficTypeDiagnostic: BL0PR12MB2386:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2386ECD0145541655827DCA683320@BL0PR12MB2386.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2yP1TRasLE1vKmCSuxaj024bNfGenbBRrgIOMO6Gw5EQIFYmwmOKRRAvyXmghT0SXyA0qnZ2A3vAd5m6YL2VJyqWma9sUDjS1AIy0KBq/NO5yEkQ3oAZkxLGRV2iRN8lgA7sLv/hrJuio5F88uq3iz4iMAnrt3g9jNEvaEVERYdKCp0h2us8tDIsvRbzovR6uE/ZfkqrEIANH5JNxkQcIpmapEdJ/7I3aYIdBf1NoFk+0FQc/QuBKbwUov/CRXH8Wipibwgzf8O7u/8AXjM7yTe9HSqpUKJmwyS2JTBGTYnQC/6Uts2NbOjXxDJcPwmUGLBstwYum51BshYgJRTCeXHJa7uOBsXDzpDU4A3p72sCg8IjXtRVV0OUtlwdMUqGlyCzhUVQfSoyTKbKgKSb71c0SmwEMn/taTwsBzm4bSH2/2NCqfuUyldSfzPym/OwtbrVYBV80j7I1Phf6f0klQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(8676002)(7416002)(2906002)(4326008)(6916009)(966005)(7406005)(66476007)(66556008)(86362001)(31686004)(66574015)(83380400001)(31696002)(36756003)(8936002)(54906003)(16526019)(2616005)(186003)(316002)(6666004)(5660300002)(66946007)(6486002)(52116002)(478600001)(45080400002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 4bThE3sAYgmvlXt6iy6dj7Y/h2+PA/7qfJddyLVH7oGy83QGtR7i3iY4ab1K3tvpY38n82/hbdSjc2qUhxtKeE6OCPmIRT5+8QXIlnDxxh9cr13jw+hgRkthn1SqEHRCdhlshwaU/b23+q+tCAiw+u/gfw6Fw5IaZPxB/leSowaVPSiqXtKVnSakGpKGKhhgqXB1OSG6Np40MknBKb94exg4GusX4qJ67a+71ZiFZ/wELfodfBLOlhr9uFuWD5pxbtcZcdiXlsTI9/5nW6UhhRyzgNoKFuw9Y5YZAje+P9vu2HAhOhzoAGDf9aLXfoDxSsAIzvai9ncMS/Ryap9FnBj973wGfwXNW209zPqA19bfqFmld7J1Yx/U2KFTQSq7lY3+QKK63jFkcg2SQDsPGKcAUaCWaKMz1Ax31XgAHmTv0Rd7/E/E5WKjwgdj6jeUAQyPW/OtClyShFKcu5/Oxai0409KJ+OM8kyPEy/F4Zs6RBn7tUl9cDiqLgJ3YmLoG7G0IBJh/aP7wGs2vYR7XzmMAi8BKReJCw89jt06DXvwimumzmLiYjDkMwKK8nKmDPhnzC98AlQc7zOvRDTmfbJK+gY9nsKMqigKcnPkG+ioawqj0O5J6IP5AnDEv3op+cGpSZx0Gy3nLYCxRHQ9luIbp30mO6Fmc25V94QLe1SO1YC06ARO95Kj2NmHYChmwWvpPIkb33fhWxszyUTjGQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f129a8-075b-43d8-74c9-08d8646830ff
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 11:09:54.0326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5j52JEA12Idjn/FC7IEnEgz9tY3UOwz7AyYNf2Ig3e8ylgqhY7k71oz4l7J+TXZk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2386
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 29.09.20 um 11:14 schrieb Daniel Vetter:
> On Mon, Sep 28, 2020 at 01:22:13PM +0200, Christian König wrote:
>> Am 28.09.20 um 09:37 schrieb Thomas Zimmermann:
>>> Hi
>>>
>>> Am 28.09.20 um 08:50 schrieb Christian König:
>>>> Am 27.09.20 um 21:16 schrieb Sam Ravnborg:
>>>>> Hi Thomas.
>>>>>
>>>>>>> struct simap {
>>>>>>>           union {
>>>>>>>                   void __iomem *vaddr_iomem;
>>>>>>>                   void *vaddr;
>>>>>>>           };
>>>>>>>           bool is_iomem;
>>>>>>> };
>>>>>>>
>>>>>>> Where simap is a shorthand for system_iomem_map
>>>>>>> And it could al be stuffed into a include/linux/simap.h file.
>>>>>>>
>>>>>>> Not totally sold on the simap name - but wanted to come up with
>>>>>>> something.
>>>>>> Yes. Others, myself included, have suggested to use a name that does not
>>>>>> imply a connection to the dma-buf framework, but no one has come up with
>>>>>>     a good name.
>>>>>>
>>>>>> I strongly dislike simap, as it's entirely non-obvious what it does.
>>>>>> dma-buf-map is not actually wrong. The structures represents the mapping
>>>>>> of a dma-able buffer in most cases.
>>>>>>
>>>>>>> With this approach users do not have to pull in dma-buf to use it and
>>>>>>> users will not confuse that this is only for dma-buf usage.
>>>>>> There's no need to enable dma-buf. It's all in the header file without
>>>>>> dependencies on dma-buf. It's really just the name.
>>>>>>
>>>>>> But there's something else to take into account. The whole issue here is
>>>>>> that the buffer is disconnected from its originating driver, so we don't
>>>>>> know which kind of memory ops we have to use. Thinking about it, I
>>>>>> realized that no one else seemed to have this problem until now.
>>>>>> Otherwise there would be a solution already. So maybe the dma-buf
>>>>>> framework *is* the native use case for this data structure.
>>>>> We have at least:
>>>>> linux/fb.h:
>>>>>       union {
>>>>>           char __iomem *screen_base;      /* Virtual address */
>>>>>           char *screen_buffer;
>>>>>       };
>>>>>
>>>>> Which solve more or less the same problem.
>>> I thought this was for convenience. The important is_iomem bit is missing.
>>>
>>>> I also already noted that in TTM we have exactly the same problem and a
>>>> whole bunch of helpers to allow operations on those pointers.
>>> How do you call this within TTM?
>> ttm_bus_placement, but I really don't like that name.
>>
>>> The data structure represents a pointer to either system or I/O memory,
>>> but not necessatrily device memory. It contains raw data. That would
>>> give something like
>>>
>>>     struct databuf_map
>>>     struct databuf_ptr
>>>     struct dbuf_map
>>>     struct dbuf_ptr
>>>
>>> My favorite would be dbuf_ptr. It's short and the API names would make
>>> sense: dbuf_ptr_clear() for clearing, dbuf_ptr_set_vaddr() to set an
>>> address, dbuf_ptr_incr() to increment, etc. Also, the _ptr indicates
>>> that it's a single address; not an offset with length.
>> Puh, no idea. All of that doesn't sound like it 100% hits the underlying
>> meaning of the structure.
> Imo first let's merge this and then second with more users we might come
> up with a better name. And cocci is fairly good at large-scale rename, to
> the point where we manged to rename struct fence to struct dma_fence.

Agreed, renaming things later on is easy if somebody comes up with 
something better.

But blocking a necessary technical change just because of the naming is 
usually not a good idea.

Christian.

>
> Also this entire thread here imo shows that we haven't yet figured out the
> perfect name anyway, and I don't think it's worth it to hold this up
> because of this bikeshed :-)
>
> Cheers, Daniel
>
>> Christian.
>>
>>> Best regards
>>> Thomas
>>>
>>>> Christian.
>>>>
>>>>>> Anyway, if a better name than dma-buf-map comes in, I'm willing to
>>>>>> rename the thing. Otherwise I intend to merge the patchset by the end of
>>>>>> the week.
>>>>> Well, the main thing is that I think this shoud be moved away from
>>>>> dma-buf. But if indeed dma-buf is the only relevant user in drm then
>>>>> I am totally fine with the current naming.
>>>>>
>>>>> One alternative named that popped up in my head: struct sys_io_map {}
>>>>> But again, if this is kept in dma-buf then I am fine with the current
>>>>> naming.
>>>>>
>>>>> In other words, if you continue to think this is mostly a dma-buf
>>>>> thing all three patches are:
>>>>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>>>>>
>>>>>       Sam
>>>> _______________________________________________
>>>> dri-devel mailing list
>>>> dri-devel@lists.freedesktop.org
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C71c630a7ca1d48476eed08d864581e4f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637369676925032848&amp;sdata=CsekzASvj2lY%2B74FIiLc9B5QG7AHma8B2M5y8Cassj4%3D&amp;reserved=0

