Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4B5178C98
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 09:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728909AbgCDIee (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Mar 2020 03:34:34 -0500
Received: from mail-mw2nam12on2077.outbound.protection.outlook.com ([40.107.244.77]:27914
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728301AbgCDIed (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Mar 2020 03:34:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/gHTgtPOjMOQBTotXnr1uun2rv3GAWtYNJMWO3J+RD4djCc/pitg6+lP6T4D+/1zljNb7FYz38Ypx/CLEx3n4mwW4Zl7GRsQHg5fT2t8vwsseeiIrH/poBs6Jed15zeK72R80aDtgoJ5XAY29UlOJJDpz/2M3fqi0V3buw2Oc5XaLnI7XK97LWWXTrOTFQtpyhB7cCI2KAoa4jJQna+jvkE9YqYXda5pyq66tbiic73XZFJDxmh22/436+CP2rub5oY1smiw4q5cRHV33oR3PNPp5kgWHI+EgAjU1q0+CA507jd6DcA2z/OwHS1KzTw2vAVFPxiAnX/Rie8H0VPjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJUl4Nq6XkzuqZcCGKpJvSr2+ixzpWWcr7f+eqZ/KX8=;
 b=HjqVHN+Hxy3Dw1hdMryI0YAAz1lbZKPvZGOTwzf/HKjwolGwDOUfxyhcSHBFYeR83WMS5Jam0p5Jcw+DH/MGC6T5KXxobDXDoCQ1JgFk1p6FJnoMpJb1Z2R2YbYkSc+QSWL1B2isaCUT0rD3hUPZglJFv3YK9y4Xo0Deid1wUUcG9N/lXihdnzSQkWj16Ub02TVi6vi37aaGbIbziSXZsJ7G/3rjEO210D7WWKGw+/+JctdQMLLMhp5TnwGe7q8q6xFghqDusc+3m+t/OLj7t/AdeqPxVQNyS7kv7vXD63D+bZdPYSpP+D7nyRyc69bxg7h+4pjn67DsTScBQZ4g1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJUl4Nq6XkzuqZcCGKpJvSr2+ixzpWWcr7f+eqZ/KX8=;
 b=Ig6WQUks+fEZAo0iExW777PojDzayvT2eGc2AaVcv/4gnB8ECWgwhiCUIUQeX+C8J+QXfPgEjb+z1vbvYxJfKhvAy1hSLVL6FdzIbT9IosQxoEbrcgE0d9v9ZIaI7oXaQdnUX1Bw6Ry9YQyBmzyqIL4tGbGoqF2499ja0wISGYg=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB1370.namprd12.prod.outlook.com (2603:10b6:3:76::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15; Wed, 4 Mar
 2020 08:34:30 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2772.019; Wed, 4 Mar 2020
 08:34:30 +0000
Subject: Re: [PATCH] RFC: dma-buf: Add an API for importing and exporting sync
 files
To:     Jason Ekstrand <jason@jlekstrand.net>
Cc:     Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
        Dave Airlie <airlied@redhat.com>,
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
 <810a26e7-4294-a615-b7ee-18148ac70641@amd.com>
 <CAOFGe96namyeQXTvdrduM+=wkJuoWWx34CxcsJHS3fcCaKDadw@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <21aeacc0-f3ae-c5dd-66df-4d2f3d73f73e@amd.com>
Date:   Wed, 4 Mar 2020 09:34:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <CAOFGe96namyeQXTvdrduM+=wkJuoWWx34CxcsJHS3fcCaKDadw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM3PR07CA0062.eurprd07.prod.outlook.com
 (2603:10a6:207:4::20) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM3PR07CA0062.eurprd07.prod.outlook.com (2603:10a6:207:4::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.5 via Frontend Transport; Wed, 4 Mar 2020 08:34:27 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f161961b-6500-40e1-b171-08d7c016db31
X-MS-TrafficTypeDiagnostic: DM5PR12MB1370:
X-Microsoft-Antispam-PRVS: <DM5PR12MB13707D43473B92F356B5C78F83E50@DM5PR12MB1370.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0332AACBC3
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(396003)(136003)(376002)(39860400002)(346002)(189003)(199004)(316002)(54906003)(2616005)(52116002)(31686004)(36756003)(5660300002)(31696002)(86362001)(6486002)(6916009)(16526019)(66574012)(8936002)(2906002)(4326008)(186003)(81166006)(478600001)(66476007)(6666004)(81156014)(66946007)(8676002)(66556008)(53546011)(7416002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR12MB1370;H:DM5PR12MB1705.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y3DXpqNpHqoqoOufSEm0oJ+5j0p+OFQt2T8ymMt5bboC1NDXbUfSs/v48wQ/ELy8JBhXal3x2NbsvOcV3WpOQUlgOgMuoL36gBGFw88IPdRx13G7Aw7TpvNWbo9/27eDc8zpaW5xDoSdgB+E4dhtt3hA3WHBPOdD9CiWHaV5kPCyLO9HzAy4mQKqCY9KUmSDDCLYjs4gcnsNrKkdVyGiC6glY8fbu8ssyTzKZS/kxV7MkiL5KnXOQBpDDRiGQQhCfVOt5UaVVcHbJ6hi2pWF38RRHj7X1RUwz9OqZjDKyIT+HVMH+dxQNxpKV7Xy0Qq9jsEcVAVK0Fq+f6s/0hc//aXmE1WJPgWdyw1UK7fxqarq84H0tfKTOOa/verbeQrIiXktz8fGr0UEgvIPUWtb4FhnZN7HWxlyWX9tJlLXz8NISOcpRLrqPhIr+G5n+KCw
X-MS-Exchange-AntiSpam-MessageData: hIqoKNK1YF7y9S1NBoc20Yp3+z3exIi0DFo0010jJjaXCBMvjL9CPvXmpLqSY/pdEVW7i/EHtgWrJMsSKRu/LtMCgAlfhdperN72LV1HWOpAS/zCsHAFOKhHQFfkJJYEoQmFtTPkqGwEOv5fTmqeSMYrhYsquxUP0L6CC4C2ta3WDnOK27ifdNW46pBiqsvejeT5Fs3wjgln3fqaKIlHaQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f161961b-6500-40e1-b171-08d7c016db31
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2020 08:34:29.8983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rk3OKu0GXCmwpYjJoJOeo2anRn93M0FTu86gATzEGI01r06z+LIaGHsHkeZeCVOQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1370
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 03.03.20 um 20:10 schrieb Jason Ekstrand:
> On Thu, Feb 27, 2020 at 2:28 AM Christian König
> <christian.koenig@amd.com> wrote:
>> [SNIP]
>>> However, I'm not sure what the best way is to do garbage collection on
>>> that so that we don't get an impossibly list of fence arrays.
>> Exactly yes. That's also the reason why the dma_fence_chain container I
>> came up with for the sync timeline stuff has such a rather sophisticated
>> garbage collection.
>>
>> When some of the included fences signal you need to free up the
>> array/chain and make sure that the memory for the container can be reused.
> Currently (as of v2), I'm using dma_fence_array and being careful to
> not bother constructing one if there's only one fence in play.  Is
> this insufficient?  If so, maybe we should consider improving
> dma_fence_array.

That still won't work correctly in all cases. See the problem is not 
only optimization, but also avoiding situations where userspace can 
abuse the interface to do nasty things.

For example if userspace just calls that function in a loop you can 
create a long chain of dma_fence_array objects.

If that chain is then suddenly released the recursive dropping of 
references can overwrite the kernel stack.

For reference see what dance is necessary in the dma_fence_chain_release 
function to avoid that:
>         /* Manually unlink the chain as much as possible to avoid 
> recursion
>          * and potential stack overflow.
>          */
>         while ((prev = rcu_dereference_protected(chain->prev, true))) {
....

It took me quite a while to figure out how to do this without causing 
issues. But I don't see how this would be possible for dma_fence_array.

As far as I can see the only real option to implement this would be to 
change the dma_resv object container so that you can add fences without 
overriding existing ones.

For shared fences that can be done relative easily, but I absolutely 
don't see how to do this for exclusive ones without a larger rework.

>>>    (Note
>>> the dma_resv has a lock that needs to be taken before adding an
>>> exclusive fence, might be useful). Some code that does a thing like
>>> this is __dma_resv_make_exclusive in
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> Wanted to move that into dma_resv.c for quite a while since there are
>> quite a few other cases where we need this.
> I've roughly done that.  The primary difference is that my version
> takes an optional additional fence to add to the array.  This makes it
> a bit more complicated but I think I got it mostly right.
>
> I've also written userspace code which exercises this and it seems to
> work.  Hopefully, that will give a better idea of what I'm trying to
> accomplish.

Yes, that is indeed a really nice to have feature.

Regards,
Christian.
