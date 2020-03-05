Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74A9B17A5FC
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2020 14:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgCENGd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Mar 2020 08:06:33 -0500
Received: from mail-mw2nam12on2062.outbound.protection.outlook.com ([40.107.244.62]:41889
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725912AbgCENGc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Mar 2020 08:06:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQ9+XoNLZ6yu5Whnnw4Ut2bYgzHsLSOAOiAmfM48276EKNqJ5gEQYQJx5zcu9BBPAAVd6nWbB+Of5iFlPoEucpHvQAFo+4hV/Ce/SBOF5r6ebLGkxs9EpYGwAt9e6fCpy1Fc+9UTAoyFr8Aq55IJR0MMDJLP+COx1rXfxexhIK9YpkRd+5dBJGDPHzf3BnLTXPRRkCgbfBz7N6pq3QEU+RyCcZd4x6GblTAgyOS1F2238hCUN2emslHl5g/gdPQxaZDOsF9mSJixb8J+jdqE+rwd8ECAuKeuz9dGGOK9XCziugdPG1BGbecKRrWrS+Vxm0k6456eBmJDQp/2fo7fJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqNL9FcGGcb/dfMzEIXU6J9BccTobLaTuWOTPyaNml8=;
 b=fzLjKfl0D+RGY7YBzMwap4KgrvF3foiWdL1IjjqTTawdOTZ3CVjnvdKe8Sxy0tC+JUbDLafzawAN59AG7WYTr6GPRVLCaY8/stfMorZ04hRmTDVZQmkNAArzrV5Z+CLvuqBlVjLYGPm7SH99FbVJxgndicJ4s0td8Z8T2eQLok5Ee8SsclnIYgtOU8jPAVwsr1jWCa2CYmYtJkjnVMsUnJMWRUwT/U65gqFh585DNsONhciGktqiUppTbcINURCQ2dQpSKicGmStQwZfBEOij5f7Q7nIRomyroKg0AIyVOPttzt7bHrRnjRMPpZNk8eHdhyoTrgXXfLUZaMxSxNTwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqNL9FcGGcb/dfMzEIXU6J9BccTobLaTuWOTPyaNml8=;
 b=VpeQ8+C5MLZwaAJBHYWcQy/oD2SsRDgc2GkyfTCvpG+39Xs7ZCcPtPv68KO5VuWidPzKnQgY3CLzcHa68D2lGJgMV+eOpPutoapwc/BXW+6KXbmpyTfXAUt4Z82Y5VlWHHzN3EhEUPaWsHsAsqCa//WEb3o8OgBR6wqQhTlvqbA=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB2550.namprd12.prod.outlook.com (2603:10b6:4:b8::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16; Thu, 5 Mar
 2020 13:06:27 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2772.019; Thu, 5 Mar 2020
 13:06:27 +0000
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
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6fb8becf-9e6b-f59e-9c22-2b20069241a7@amd.com>
Date:   Thu, 5 Mar 2020 14:06:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <CAOFGe97XSxgzCViOH=2+B2_d5P3vGifKmvAw-JrzRQbbRMRbcg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM4PR0202CA0010.eurprd02.prod.outlook.com
 (2603:10a6:200:89::20) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM4PR0202CA0010.eurprd02.prod.outlook.com (2603:10a6:200:89::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16 via Frontend Transport; Thu, 5 Mar 2020 13:06:21 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 314297da-1ef0-4e62-97ed-08d7c1060376
X-MS-TrafficTypeDiagnostic: DM5PR12MB2550:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2550F6011FC5C25ABE3D75B983E20@DM5PR12MB2550.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 03333C607F
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(189003)(199004)(478600001)(2906002)(4326008)(66946007)(66556008)(66476007)(6666004)(5660300002)(2616005)(8676002)(81166006)(8936002)(81156014)(66574012)(6916009)(31686004)(186003)(16526019)(7416002)(6486002)(316002)(54906003)(36756003)(86362001)(53546011)(52116002)(31696002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR12MB2550;H:DM5PR12MB1705.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1FyNnT5cwA/0hzlkj12jmaxP8X+YHX4Rd0rSPpy1EJQ8gF13lcHR0nXM+3nPfahAMOqG3eg1iek6JMdEJMeVeqSINI0oOdNUM0VWOEPMR7Q3YklTsE5gBV/PW+jIeJ2zg+Et2foec79KsFPu2k1N7qIG48iQtgTAt0bU4IgV1hdS+VA6rJj7UaGHwJqLa0jMLKxMaoxf8JESxiq8rK7rKGXlBRfFKcfA2jluX6Wfw1dKO2hpak6j94SX9R/aBiipCDviMUU4143psO30/pigxNGWFt3aV+DZdsipueP29WAUsr2f87xvWEA0SpvLaWptMvt8DIK7s/fDb3q7pAL2cCr+8w/8xVBOJYWP1HE8u572WkeiPcNYQtK2ConWVnE4tdpaWiVWJA6EWWJ/P8enoASULuIjPZxmsFJQ0py08WA6XmWeA2/nxPeMXJKw29Sl
X-MS-Exchange-AntiSpam-MessageData: 9OZ3sY85iSFvOkCuFSWTCdyWrPiaeD2YKjSIYP8i5j2674oVtWoRK8Aur47FSZ8CLZkf9/jI5K7pvTim8nO28xypNOZXVeMpqLjBAMNGoDXtTFZfPC0PSOOyWXwxSNtwteekiUnlSGdyvpCqnXF2b8xiTXfCrQ40Yedt2iDp1Hi5tpR9qlyn9xQoWbyzRb4A/TnsdkSPFLhe/5Vlo+zAXQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 314297da-1ef0-4e62-97ed-08d7c1060376
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2020 13:06:27.0351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TfLsGbjvKvZSvjf2EtAujJCw8Ei8TtWpANtCIwGKRj4zcce0iZWsgba208VU088S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2550
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 04.03.20 um 17:41 schrieb Jason Ekstrand:
> On Wed, Mar 4, 2020 at 10:27 AM Jason Ekstrand <jason@jlekstrand.net> wrote:
>> On Wed, Mar 4, 2020 at 2:34 AM Christian König <christian.koenig@amd.com> wrote:
>>> Am 03.03.20 um 20:10 schrieb Jason Ekstrand:
>>>> On Thu, Feb 27, 2020 at 2:28 AM Christian König
>>>> <christian.koenig@amd.com> wrote:
>>>> [SNIP]
>>> For reference see what dance is necessary in the dma_fence_chain_release
>>> function to avoid that:
>>>>          /* Manually unlink the chain as much as possible to avoid
>>>> recursion
>>>>           * and potential stack overflow.
>>>>           */
>>>>          while ((prev = rcu_dereference_protected(chain->prev, true))) {
>>> ....
>>>
>>> It took me quite a while to figure out how to do this without causing
>>> issues. But I don't see how this would be possible for dma_fence_array.
>> Ah, I see the issue now!  It hadn't even occurred to me that userspace
>> could use this to build up an infinite recursion chain.  That's nasty!

Yeah, when I first stumbled over it it was like why the heck is my code 
crashing in an interrupt handler?

Realizing that this is stack corruption because of the long chain we 
constructed was quite an enlightenment.

And then it took me even longer to fix it :)

>>   I'll give this some more thought and see if can come up with
>> something clever.
>>
>> Here's one thought:  We could make dma_fence_array automatically
>> collapse any arrays it references and instead directly reference their
>> fences.  This way, no matter how much the client chains things, they
>> will never get more than one dma_fence_array.  Of course, the
>> difficulty here (answering my own question) comes if they ping-pong
>> back-and-forth between something which constructs a dma_fence_array
>> and something which constructs a dma_fence_chain to get
>> array-of-chain-of-array-of-chain-of-...  More thought needed.

Condensing the fences into a larger array can certainly work, yes.

> Answering my own questions again...  I think the
> array-of-chain-of-array case is also solvable.
>
> For array-of-chain, we can simply add all unsignaled dma_fences in the
> chain to the array.  The array won't signal until all of them have
> which is exactly the same behavior as if we'd added the chain itself.

Yeah, that should work. Probably best to implement something like a 
cursor to walk all fences in the data structure.

> For chain-of-array, we can add all unsignaled dma_fences in the array
> to the same point in the chain.  There may be some fiddling with the
> chain numbering required here but I think we can get it so the chain
> won't signal until everything in the array has signaled and we get the
> same behavior as if we'd added the dma_fence_array to the chain.

Well as far as I can see this won't work because it would break the 
semantics of the timeline sync.

But I think I know a different way which should work: A dma_fence_chain 
can still contain a dma_fence_array, only the other way around is 
forbidden. Then we create the cursor functionality in such a way that it 
allows us to deep dive into the data structure and return all containing 
fences one by one.

I can prototype that if you want, shouldn't be more than a few hours of 
hacking anyway.

Regards,
Christian.

>
> In both cases, we end up with either a single array or a single and
> destruction doesn't require recursion.  Thoughts?
>
> --Jason

