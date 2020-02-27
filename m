Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24B70171287
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 09:28:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728537AbgB0I2j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Feb 2020 03:28:39 -0500
Received: from mail-dm6nam12on2065.outbound.protection.outlook.com ([40.107.243.65]:6186
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728454AbgB0I2j (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Feb 2020 03:28:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CvrDBDVVOfJ/vDMP0sqoy4STCIcrmblgzlcJsqA0ubQGlj0T+60iJSkdELZQxW/jOexlRxvstF3wHtOQMvgUhMOdiGTplEUwbXPUnr1tKH+LJUJfDUZcLYTRTTu2QeJG9AIKpzrk9i9uyhXHVXacnsS61EOzBeZ3ex2hxg6kk74RSqEkF7HAwPGe43YsL02SW7AY/i+1rT0KpWdXmjbJ7ApwkYVOFb6N1TjiOsj2YZommvlZA6+bRwetc29WsKcFhCoeAMcA5IBfFTAv5WBEWY4HbIuuILrG6QMopEj0/JYqSsCUX7yLMTF+7UeiA+vefgiQxZfAnT4CiMqTWBb5Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Qq4uOA3yO+M/yRygpiS5tBhy8VtK31AJPQvRnXv4p4=;
 b=evb7xq8e98aZAMS+SIz762CfI7EM9+rlgd40V3HGz16EtvIcO0GI/gQn3+Hha2OWXhKwFmfyz4coL3Kwu1CxJ/x+jQRClZ8cvLGBxY7gXecK6VEt4K10KLbXnsJqx96+NSIFtzdlA6cs3NvRLVXreRFj7C+7JOIeHUcqPT2MPvcSoLwTUl0wTRFqCyavl5UuaXwLlOHcNqpJxgWkxFsnsG13Jnm5n6m4MbabnHjqrbs6LjbHpG9c5XSJfcHkpfKH7M2Dy1Pdzjp1bKyglAQC+N331wWm65GxpZ2N9wvs/Q27AKBrqToy1oQ3faMhBlZpkTPbsk+qSdQ49xXgjTKhoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Qq4uOA3yO+M/yRygpiS5tBhy8VtK31AJPQvRnXv4p4=;
 b=W4UL+6y4jND9B9oiihN82h5POvRafnqlmmAKHuJHQh4NokUcBVus+h4QP0nVOVzgfMwodiOjlsDj6eIcDPhiG3GYNcuR9+hD1fW8izqnCuYe1vPdA0j8f4rEeLirXVaNwm3YrF5rWnzt0aKz3dfWsgmsp3d7yVY+ii0LrVTRg60=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB1820.namprd12.prod.outlook.com (2603:10b6:3:10d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15; Thu, 27 Feb
 2020 08:28:36 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2750.021; Thu, 27 Feb
 2020 08:28:36 +0000
Subject: Re: [PATCH] RFC: dma-buf: Add an API for importing and exporting sync
 files
To:     Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
        Jason Ekstrand <jason@jlekstrand.net>
Cc:     Dave Airlie <airlied@redhat.com>,
        Jesse Hall <jessehall@google.com>,
        James Jones <jajones@nvidia.com>,
        Daniel Stone <daniels@collabora.com>,
        =?UTF-8?Q?Kristian_H=c3=b8gsberg?= <hoegsberg@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Chenbo Feng <fengc@google.com>,
        Greg Hackmann <ghackmann@google.com>,
        linux-media@vger.kernel.org,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20200225235856.975366-1-jason@jlekstrand.net>
 <8066d8b2-dd6a-10ef-a7bb-2c18a0661912@amd.com>
 <20200226100523.GQ2363188@phenom.ffwll.local>
 <CAOFGe94O66HL212aXqhi9tdYqw---Xm-fwNSV4pxHyPmpSGpbg@mail.gmail.com>
 <CAP+8YyEUz29fXDW5kO_0ZG6c849=TuFWCK8ynT3LuM+Tn+rMzw@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <810a26e7-4294-a615-b7ee-18148ac70641@amd.com>
Date:   Thu, 27 Feb 2020 09:28:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <CAP+8YyEUz29fXDW5kO_0ZG6c849=TuFWCK8ynT3LuM+Tn+rMzw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0029.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::39) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR10CA0029.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15 via Frontend Transport; Thu, 27 Feb 2020 08:28:33 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2fefc28b-8240-46b9-50a5-08d7bb5f09dd
X-MS-TrafficTypeDiagnostic: DM5PR12MB1820:
X-Microsoft-Antispam-PRVS: <DM5PR12MB18207C7CA038F70322AE451283EB0@DM5PR12MB1820.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 03264AEA72
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(189003)(199004)(186003)(4326008)(6666004)(2616005)(16526019)(53546011)(31686004)(478600001)(110136005)(5660300002)(52116002)(2906002)(54906003)(316002)(7416002)(6486002)(31696002)(66476007)(66946007)(66556008)(66574012)(81166006)(8936002)(81156014)(8676002)(86362001)(36756003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR12MB1820;H:DM5PR12MB1705.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U+o5quqCd3/zAFyzDijHQ3AvLur6Ab/RYmFqscIIlHOkXFckQXU1XOV5a3xiXDGP8nwUvwSfofyuAC78d5YHXBXISMVPTCjjvBeMDjUu9zIqR4M/7H0eNlm7JirhQspZOW7Lba1oiQVJKuGUIVTFg+0TKfpexx6R941b0YIg5mtgNzkWhE0qTJ1xBbK46zMrzBRirI2JjtvH0MCXk6TNAo3T9ziCuRSnC20VEeWazPxuAw7Fg1o2r1jVqMtrGszgJtnE3is/ln/IrQPt8pFw9lwN8Jj8oxLwoPsQBefMxDGNuy6/NGuJuTHByaED/YGAZWFKKvxAOpg/mMTDJCs/bDsmnGlyOTL9cvfWZ2TMwAPlmj/j4IgtLCs5C4vniIvjypICev3Ave7WmuaMifm++bCDIxjnBafyFEGfMBE75F5GMB8dBMLa0ez4ckmcSvz0
X-MS-Exchange-AntiSpam-MessageData: Y8RDKz4KokE6ayL7JGH1UoOAXzJlVMa3iS5TIb+oL9DlvnY5Q1mGvkeHXjMeaAuWAusRAxap3QIMehQn//SEO1YA7+U+p5yH7WAMB3LEyp4VmkjrJz3aG6Ko0K9S8fO/rtgVsUmK+ajMly+vfifQbSrTnnwZIrwo1GiwXtpBMiRUTVg4aNTSBP5UuWOR1h14PuC3jXZk1PuAk6Uz0mTD4w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fefc28b-8240-46b9-50a5-08d7bb5f09dd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2020 08:28:36.1929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fv3akRB3ftFbia1vA0hX+LM5A+jjNetxcPCc66UvFtPfDy0kqjdPNp2Jhq0WaGaN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1820
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 26.02.20 um 17:46 schrieb Bas Nieuwenhuizen:
> On Wed, Feb 26, 2020 at 4:29 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>> On Wed, Feb 26, 2020 at 4:05 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>> On Wed, Feb 26, 2020 at 10:16:05AM +0100, Christian König wrote:
>>> [SNIP]
>>>> Just imagine that you access some DMA-buf with a shader and that operation
>>>> is presented as a fence on the DMA-bufs reservation object. And now you can
>>>> go ahead and replace that fence and free up the memory.
>>>>
>>>> Tricking the Linux kernel into allocating page tables in that freed memory
>>>> is trivial and that's basically it you can overwrite page tables with your
>>>> shader and gain access to all of system memory :)
>>>>
>>>> What we could do is to always make sure that the added fences will complete
>>>> later than the already existing ones, but that is also rather tricky to get
>>>> right. I wouldn't do that if we don't have a rather big use case for this.
>> Right.  I thought about that but I'm still learning how dma_resv
>> works.  It'd be easy enough to make a fence array that contains both
>> the old fence and the new fence and replace the old fence with that.
>> What I don't know is the proper way to replace the exclusive fence
>> safely.  Some sort of atomic_cpxchg loop, perhaps?  I presume there's
>> some way of doing it properly because DRM drivers are doing it all the
>> time.

First of all you need to grab the lock of the dma_resv object or you 
can't replace the exclusive nor the shared ones.

This way you don't need to do a atomic_cmpxchg or anything else and 
still guarantee correct ordering.

> I think for an exclusive fence you may need to create a fence array
> that includes the existing exclusive and shared fences in the dma_resv
> combined with the added fence.

Yes, that at least gives us the correct synchronization.

> However, I'm not sure what the best way is to do garbage collection on
> that so that we don't get an impossibly list of fence arrays.

Exactly yes. That's also the reason why the dma_fence_chain container I 
came up with for the sync timeline stuff has such a rather sophisticated 
garbage collection.

When some of the included fences signal you need to free up the 
array/chain and make sure that the memory for the container can be reused.

>   (Note
> the dma_resv has a lock that needs to be taken before adding an
> exclusive fence, might be useful). Some code that does a thing like
> this is __dma_resv_make_exclusive in
> drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c 

Wanted to move that into dma_resv.c for quite a while since there are 
quite a few other cases where we need this.

Regards,
Christian.

> The other piece of the puzzle is that on the submit path this would
> need something to ignore implicit fences. And there semantically the
> question comes up whether it is safe for a driver to ignore exclusive
> fences from another driver. (and then we have amdgpu which has its own
> rules on exclusiveness of its shared fences based on the context. e.g.
> the current option to ignore implicit fences for a buffer still syncs
> on exclusive fences on the buffer).

