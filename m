Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5A317E4A8
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 17:21:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbgCIQVf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 12:21:35 -0400
Received: from mail-dm6nam12on2051.outbound.protection.outlook.com ([40.107.243.51]:6132
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726922AbgCIQVf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Mar 2020 12:21:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ay8nhP5Emt/RBLmwFw51TdFmjv3AtCTqEVLdOCqEwqpye/AoCtiiyYs4hIHlgFU+H9BJcYFX6o8HsJYO8O9f44a3w2M1bXZ7gFNmGrNfdwEYSbal6106tHEfvVrj3eJgmwpxLjE1N7PVUCxGBjONE4s1zFyz7TMxAl1ipu/08hCpOPc22tZaO+PE0HxQ0SFE4RYsZQqz5iS6t8OcKZLhhFDr3/TXDHT749DVzgKrb65O2XQ04psO0rjkzZxjIRPCIVb/u/4Xszu/8Z9qw68M2otHwk+I0w+Q1kjgRDq9oKOe5Hp9gFqV1mGatgYlP28HvY9go0kG1/Byux+iMx//Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sfdtfa45UOIUhzkdK6Y15K9szw4UTEq9EdA3bf2EmOQ=;
 b=oPOsvaCue2adp9q70uVOfte+ScOBdgu/feohR0kC+3Or1d7pz0PImnihdRq60X52a+3eIObbNI/f+GcswjEkEGXa4CVxz6bfTayffyAJF+B8IE9WgWgbvUmAkIXFwx5Dlgx0UVa2h7pXaSQ5fJCsyY78kmakZd8Kye/du5KNPgHrxmB3fsdMhFz/KhCI8coOWS4owlaCPCB8mU9MIOrBxc8bQz2E+rs4i7x7HKzKhlwrCTGxxSUKXumu8eNlz9IgNPC6HUFHWDN4TvcR6mGxUr1zlXK8HQ1hHmGTvnkss8Cd0E8Vzv0SDI9UQhqB6ZETupPI9LsBDhgewQK9gMaM1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sfdtfa45UOIUhzkdK6Y15K9szw4UTEq9EdA3bf2EmOQ=;
 b=i+wUak5kpUEeEwOm9pDFLXFDLTNEamPWKkzOl2Eaz5dRqVlcef9hUsuEI47omTmqWwL+bdVhh6S8uv+dA+kRnrXE2l/CQevmTqoj1MJLc4vo7M8WDtj8U5dKTwLp0DVv0WvWsGC0z5/qrkFWW3bm+TVLdMwkWWYGzh9dDCnyMVU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB1612.namprd12.prod.outlook.com (2603:10b6:4:a::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Mon, 9 Mar 2020 16:21:32 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2793.013; Mon, 9 Mar 2020
 16:21:32 +0000
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
 <21aeacc0-f3ae-c5dd-66df-4d2f3d73f73e@amd.com>
 <CAOFGe95Gx=kX=sxwhx1FYmXQuPtGAKwt2V5YodQBwJXujE3WwA@mail.gmail.com>
 <CAOFGe97XSxgzCViOH=2+B2_d5P3vGifKmvAw-JrzRQbbRMRbcg@mail.gmail.com>
 <6fb8becf-9e6b-f59e-9c22-2b20069241a7@amd.com>
 <CAOFGe94gv9N+6n6oEC2aRtsmy7kBfx1D_R6WLQSGq7-8yUM_OQ@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <203505dc-7b75-1135-587e-cc6e88ade8cd@amd.com>
Date:   Mon, 9 Mar 2020 17:21:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <CAOFGe94gv9N+6n6oEC2aRtsmy7kBfx1D_R6WLQSGq7-8yUM_OQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::7) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by FR2P281CA0020.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16 via Frontend Transport; Mon, 9 Mar 2020 16:21:29 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7ca5cfad-ccd1-4b08-cd7b-08d7c445ee22
X-MS-TrafficTypeDiagnostic: DM5PR12MB1612:
X-Microsoft-Antispam-PRVS: <DM5PR12MB16121BAB8EC10FCF51EFAA5783FE0@DM5PR12MB1612.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 0337AFFE9A
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(189003)(199004)(54906003)(316002)(66556008)(66476007)(86362001)(53546011)(4326008)(2616005)(186003)(16526019)(478600001)(8676002)(8936002)(81156014)(36756003)(81166006)(66946007)(31696002)(6916009)(6666004)(31686004)(7416002)(66574012)(52116002)(6486002)(2906002)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR12MB1612;H:DM5PR12MB1705.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +/hJFmwB1HLZNQcNzv44PO6sa+6EGKRpf6XHMG43a0JcBbiiwWnf4PCAzSqJh2CbTPzho+hJwW/md6dJIPaGN4H0UOjGEAHx7DvR06J+TeY5QmEfAmJalNgQrslDJsdaSUJdvUQbLnkZ6t3lubq8a11XHmSMwQm9e71qLl2+iu2HIY2aiKi5JZY+YykPj5GYzTYUU9cJAGkEZqUgNWCkExb9cOYicMvgTJNRugqvvhUpPRZuO8ZEissNNQeXJfxLSQd+Lr2TF1j4qreMUR3vK+rVZgWr839ZbmeLG53SrfhQDqWVGz+86eM4W8gccc7pWKKtH4xnoGMR94Q0hajN2mVHtDSLPvNxX7Md3qmMAR2Ta9TFE1MbA4RV0z738D5EehNl4ou0TZh25qhT4ykc9emG2UX2fK22AsrSKqkpiM7XwjwGtE7mM08vucnbZSZs
X-MS-Exchange-AntiSpam-MessageData: T9G+7euyMKv3bp/XmxiHvsMM7wknz1gyYHLaODAsiHJV1qZex9MB6HPYTHyl59SewsQAEX013vTR2pUdCLXmndvwSRkTjxdiaypriUPz5byAfzXQ5vXyp7ptDQ2/G60YWoY38jpivElZS1iUvkpXbSk43h1aN0pU1lOowfrWyuYgdPnn+C4JayxzExdSV402PdaQsZvTSEuzI+NW6pA2Xw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca5cfad-ccd1-4b08-cd7b-08d7c445ee22
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2020 16:21:32.5689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OCMqKJ8rt5KaAPNgxneLzSzDJTeTyeYZf4z2KXRVDpgxL9xo/f0RQQmiZb8YBUR9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1612
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 05.03.20 um 16:54 schrieb Jason Ekstrand:
> On Thu, Mar 5, 2020 at 7:06 AM Christian König <christian.koenig@amd.com> wrote:
>> [SNIP]
>> Well as far as I can see this won't work because it would break the
>> semantics of the timeline sync.
> I'm not 100% convinced it has to.  We already have support for the
> seqno regressing and we ensure that we still wait for all the fences.
> I thought maybe we could use that but I haven't spent enough time
> looking at the details to be sure.  I may be missing something.

That won't work. The seqno regression works by punishing userspace for 
doing something stupid and undefined.

Be we can't do that under normal circumstances.

>> I can prototype that if you want, shouldn't be more than a few hours of
>> hacking anyway.
> If you'd like to, go for it.  I'd be happy to give it a go as well but
> if you already know what you want, it may be easier for you to just
> write the patch for the cursor.

Send you two patches for that a few minutes ago. But keep in mind that 
those are completely untested.

> Two more questions:
>
>   1. Do you want this collapsing to happen every time we create a
> dma_fence_array or should it be a special entrypoint?  Collapsing all
> the time likely means doing extra array calculations instead of the
> dma_fence_array taking ownership of the array that's passed in.  My
> gut says that cost is ok; but my gut doesn't spend much time in kernel
> space.

In my prototype implementation that is a dma_resv function you call and 
get either a single fence or a dma_fence_array with the collapsed fences 
in return.

But I wouldn't add that to the general dma_fence_array_init function 
since this is still a rather special case. Well see the patches, they 
should be pretty self explaining.

>   2. When we do the collapsing, should we call dma_fence_is_signaled()
> to avoid adding signaled fences to the array?  It seems like avoiding
> adding references to fences that are already signaled would let the
> kernel clean them up faster and reduce the likelihood that a fence
> will hang around forever because it keeps getting added to arrays with
> other unsignaled fences.

I think so. Can't think of a good reason why we would want to add 
already signaled fences to the array.

Christian.

>
> --Jason

