Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5C79325422
	for <lists+linux-media@lfdr.de>; Thu, 25 Feb 2021 17:58:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233777AbhBYQ4x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 11:56:53 -0500
Received: from mail-dm6nam10on2056.outbound.protection.outlook.com ([40.107.93.56]:54272
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233657AbhBYQzE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 11:55:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVJvaSfIP28PY5DG4oj7k2n0U+Wi/F4nL396mXtbQkCNtbjalmrTcXOOpY5ZmLSB96+RDkVQrN20ZvDWs7pHTCbtTRkc19GjBogqkUhTnxfmzgHpSyDmio2eO7xu1W3S7bvhTK/h7V3uEVENNEDhUNxU7UooOyfblgVA7McNvfWvq58OHMCKkmdbEBgi1cRYyM92tJwCjq4txtfMkQuQhwNKo9PPx//UFaRMbSuBrIpdXiY5mMGOIQf9cvV72+D9mbT5IoUwg/xeKmaQKIfCITstbOVo6Jxx8mR9Y6tBHd7+7AXEuordz9M/cYyhIEmYLDYtfoa23fftFPf68R47Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4ZejY3bP27KNTfkq51Pp+4dspIF4imBz0MjOVQ9pB0=;
 b=H73MxkcZKww9XqEXPKyw125uab/Nzhg0W1nTPozdA+NBXslcZa8lpByKkDx7ehVuZCQ9DNhYzvYh6ZbrL7mDvsh+atJpOh0OZ0iMvC8Gf5oYPnWxAlhwPIYh9eyO65v47kyqgtQAZfN8aXvDyvYvhyubGux9VewhF63f2aWsYRLn3KsZiBzmOfGaevhp3dw9mZQGVZwQZGQ7ylbwJadCljBhZY8qf19a57kVR7KUYvjEnveKjoplkEp0tDN3uvc4oJg1SPU8fJ9kMOcayaJ0pNgQfaXIXJqiJli8Ik4Wz8l4VlB46S1ndtZ641k4dqpkcTPooHZNPPikMYw/6F+MsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4ZejY3bP27KNTfkq51Pp+4dspIF4imBz0MjOVQ9pB0=;
 b=Sjo7Uimum+NMlZRaRjhNaNEqLblf81EIC7kK5XC9D+FGLXMgYdmgLpozsfq9E7WnKMlcJsVBNPxqRRPBnph8qxZJKdCQs7N0kC5f1It+kZbcnCKTJRnVQlkEAl8wSI2YKmTNTFnzIB3tZziuspjUvVdIaOinAG10PcC7peKFv28=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33; Thu, 25 Feb
 2021 16:54:09 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3868.033; Thu, 25 Feb 2021
 16:54:09 +0000
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for
 mmap
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= 
        <thomas_os@shipmail.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Matthew Wilcox <willy@infradead.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Jason Gunthorpe <jgg@ziepe.ca>,
        John Stultz <john.stultz@linaro.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Suren Baghdasaryan <surenb@google.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20210223105951.912577-1-daniel.vetter@ffwll.ch>
 <1a7c2295-6241-f2bf-4a78-6cadd43bc248@shipmail.org>
 <CAKMK7uHzRb6Q_LgPUrrHn18sorYo7ysTgB+PNE36LDUUsJpHDg@mail.gmail.com>
 <f43311c8-a02a-1a29-a53b-88e599c92187@shipmail.org>
 <CAKMK7uE2UrOruQPWG9KPBQ781f9Bq9xpVRNserAC9BZ2VzDutQ@mail.gmail.com>
 <b30dacb0-edea-0a3c-6163-0f329e58ba61@gmail.com>
 <YDd/hlf8uM3+lxhr@phenom.ffwll.local>
 <CAKMK7uFezcV52oTZbHeve2HFFATeCGyK6zTT6nE1KVP69QRr0A@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <432a0da0-ff0e-9b2b-4aee-13f20522fee3@amd.com>
Date:   Thu, 25 Feb 2021 17:53:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uFezcV52oTZbHeve2HFFATeCGyK6zTT6nE1KVP69QRr0A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:7944:296:6ad0:31ef]
X-ClientProxiedBy: AM3PR07CA0099.eurprd07.prod.outlook.com
 (2603:10a6:207:6::33) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:7944:296:6ad0:31ef] (2a02:908:1252:fb60:7944:296:6ad0:31ef) by AM3PR07CA0099.eurprd07.prod.outlook.com (2603:10a6:207:6::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend Transport; Thu, 25 Feb 2021 16:54:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9dbbf5a3-93c2-4635-2d79-08d8d9adf7e6
X-MS-TrafficTypeDiagnostic: MN2PR12MB4255:
X-MS-Exchange-MinimumUrlDomainAge: bootlin.com#1161
X-Microsoft-Antispam-PRVS: <MN2PR12MB4255DBA5B3B65AC8380897E0839E9@MN2PR12MB4255.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vMJTbfaJPaS1CfzChH/WR2xB3CJpR3/CC7uIUIKotORZyjl+wrbxwTvID44fSDJBGKwBN9tBJIbm93DIALwpHUv/4LlHAWfwa5E59bAqq4HzthP8XhN23ZJBP1FYZK8Ighl2kAEuTr+dAi02WT/1LB+nN8Xb+2x7PsTdgvf8soJamMY2p1xEeyMVE3ZucZfRHmtWxfFurXcUuwTelNO6DYrnt5YkW6G419HBIJn/C5cT5alcEiz+60l/3loeNw7JTwaEgSc7AZjk39znrTE9LBqSKSqCBl8kevacLvjbpBaAkP0B0lLmRbN9bjwFp56bzNuvpH3RU1de6JfK7fUr+NeJa4RuN0auaXYK3t0GT3yeOkTk0n5cWAtFYJZBeyRcUwANS1YL+NKyhpVEkTg1JjkSNw218kss88kXIvGr0L9hxdoK6/RlTcRGEPgItOTbGFPAYrPc2WUjMnUcmbtUc/4BoLk6AKmPgT6/V6tuq3cjPMUcW/4IPdAsK5tcFuYID/Ai+q/zM3vLVHsQ+SBTXGp362Mnd03+BITaeOALDJU7tJc6RP4qkyqycUpXgmUYJurgHxTMZU3up/X5cSIHOjMWZstgnmPrpJKkulRrD3Y8EEoRvXhVclg9cf/DPa6gaolgzlMNOp9fdUvpozZbUVqo8CHJe7nIOCsH8WI9x6kRaXxJSm+KsHb+ejjPmOEf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(110136005)(54906003)(8676002)(478600001)(5660300002)(966005)(66556008)(45080400002)(66574015)(6486002)(8936002)(36756003)(2906002)(31696002)(83380400001)(86362001)(52116002)(7416002)(186003)(6666004)(66946007)(16526019)(2616005)(66476007)(31686004)(4326008)(53546011)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UXRwY3pVTUpPOGxqMWJiK3dJbTBxQTBqdzc2a2VHdWNWRVFoN1h2ZHNxSFhX?=
 =?utf-8?B?bnYxdWpZVytpQWRWYlhseVhBSWcwU05Eb3krM1c2WDVJMWhvS0M4Y2ZDUlJn?=
 =?utf-8?B?MkNmRWxKME9QMTZLYysvVG5aNnVmREZNdld5em9pRW1kNGlkVlQ4ZDlOWHZs?=
 =?utf-8?B?QmJMOENSNEZ4dmdrQXczZmg0UHZ1WDVqNnFveEwrRnNFbzduczQ2WE9mUnhB?=
 =?utf-8?B?VFdpUGFpb2NqcXRldkpqVHlSeWpQa0xnSWF1M2FUaDh2d1FsYjBEdnVNdU1D?=
 =?utf-8?B?Q2U4Sm9ZOHVjMXV5TXI0OTZlRGMvZjhOKzhVWGM5RENaWFNGS1dqcDdPNVdI?=
 =?utf-8?B?OGR1d3RXL0RuN1hERnEvTzkveGpCaFFSWTFkQVcwWTNkb3FUSVg4NDMrR0Iv?=
 =?utf-8?B?dHM2YW9mSysvMUhteGQvOXNzWk84eks2UEdNaTNPdjZ6Q2FqSTcvMFdGenhM?=
 =?utf-8?B?d1VSL0JxdHZvSEM5UXNjQWNQN3JPUXUvVTZpblJjLzBweUxXRWVJdXdmUHZa?=
 =?utf-8?B?b3pXV3lRMnB2MC9BRGJSbUMwcS9BY1hrYUVsNFR0bzR3RzhKdkhJRHk1WjhG?=
 =?utf-8?B?WlpVejJCWHkxbHJ3bDU2NW9FL2VZbXhqeFVOSGg0bUdnQmlKQWxLbzVZQjRV?=
 =?utf-8?B?QUNTdlJHelc3cGFJVVQyeHcwdURJeDUzQmhxck8wOGtkYXJVZEhlVlNodGRO?=
 =?utf-8?B?ZElSVWxpRWZWNHZPSkZyTnZFV3dhU0FOejB3YXhlUnhOVHNCTEZvUHlabi80?=
 =?utf-8?B?QmhOcHlCL1UvS29LOXJ1VHl4b2JobHpMNGJFcjNzVmVVWlg3RkZIcFlQUnF0?=
 =?utf-8?B?WG4zY2lvUFNMVCtTU2ZWVEx2WWdvb21lM1RhWVpheEt5NGdOL0h2QTY5eG1K?=
 =?utf-8?B?T1hFVTJ5VDVsSFU5M082djgyTTJOdzBsWEdrTTdQQzVKSjZVaUlIczVGL2lD?=
 =?utf-8?B?SGJqRlAweG1uT3dlMkVXK2pKUlpyY1d1ZDJ0N1BtcGxpTVNpbE81dnFCd2h6?=
 =?utf-8?B?dXphN1UvUjlubkl1Vzd0aWdXZ3dwZUFqMGZuUHhRZ3BycnJ6RjRpeVBod1RI?=
 =?utf-8?B?Mk5Ec2pFS2R0S0I5VnJLZThYK05pTmFDb0VZaEJjcm9VVno0cXYwYWRObHRB?=
 =?utf-8?B?d0JhWDVybDkxaG1lbXJJTHJPYWY0ZFpNYk42ZDB0WHBCVGp5OThqMU5SRm81?=
 =?utf-8?B?L1lKcXhhYW9WZEx4MmhHcXpQdER1RXJFRHlJcVBOUkRSb1A0dy9BRTd6a29Z?=
 =?utf-8?B?elRDZkVtRGxRbUQraWtPeVdkbTYrRFBLcUVSTURrMGJ2ZUVFWXF6VmovT0FT?=
 =?utf-8?B?YnZPbUs2M2pHZlpDM0o3ZjZmRzJHWUdBNXdWSUhtQVlNdjJqUFJmSkdQWGlh?=
 =?utf-8?B?NVRiZnF2UGVjV2NRN0ZhYlRGcElROUx4N0dLQ3pOSGNQVWdFZlFTYjdoNFRT?=
 =?utf-8?B?SjAxV1ZjZlFadUJMVjNHL2ZuRytsOEJGbWZBTithZ1JqcDNtQ04zblF6NWVh?=
 =?utf-8?B?VmFWcWo3OWt4NG9jeEpOOFM4c1FuazlKNDZ0VkowMHZ3R28yWFdxemdYMnhT?=
 =?utf-8?B?ZHBhWWpmSW11QUVoUG5ESWMzd0tvTGQ5MXF1eDNjZ20wTlo4QjVVQUJqalE5?=
 =?utf-8?B?ZXQ2elZpZjk0R0YxNEMxQ244SVBhVmdqWVZPNGpMZ29jd3MwQUxpVGdmR0hi?=
 =?utf-8?B?VVZaYXZOOHRsbHB4ZWcrWlJDc24wc2ZJTWlDQjcrUWNWMkFlR0VWY1pIeldB?=
 =?utf-8?B?OWtBQUQ3cEcxZlA1ZEhDc09qWjJtY1BkZW50dmxncEdIdDlhMGordWdBWXkw?=
 =?utf-8?B?c01YVlcwTVVVSEFOV2JoQW41WUozTjdGc01vUUNISGNUdEdsQytYN2RJejky?=
 =?utf-8?Q?CUyK6d7ekGDj7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dbbf5a3-93c2-4635-2d79-08d8d9adf7e6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 16:54:08.9829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ZHOEu96unWEP/F+FJYtlnc6MMiTw2jS4ntwIUTjvCaNY9l/dQxAwOtTOQy/pmOn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 25.02.21 um 16:49 schrieb Daniel Vetter:
> On Thu, Feb 25, 2021 at 11:44 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>> On Thu, Feb 25, 2021 at 11:28:31AM +0100, Christian König wrote:
>>> Am 24.02.21 um 10:31 schrieb Daniel Vetter:
>>>> On Wed, Feb 24, 2021 at 10:16 AM Thomas Hellström (Intel)
>>>> <thomas_os@shipmail.org> wrote:
>>>>> On 2/24/21 9:45 AM, Daniel Vetter wrote:
>>>>>> On Wed, Feb 24, 2021 at 8:46 AM Thomas Hellström (Intel)
>>>>>> <thomas_os@shipmail.org> wrote:
>>>>>>> On 2/23/21 11:59 AM, Daniel Vetter wrote:
>>>>>>>> tldr; DMA buffers aren't normal memory, expecting that you can use
>>>>>>>> them like that (like calling get_user_pages works, or that they're
>>>>>>>> accounting like any other normal memory) cannot be guaranteed.
>>>>>>>>
>>>>>>>> Since some userspace only runs on integrated devices, where all
>>>>>>>> buffers are actually all resident system memory, there's a huge
>>>>>>>> temptation to assume that a struct page is always present and useable
>>>>>>>> like for any more pagecache backed mmap. This has the potential to
>>>>>>>> result in a uapi nightmare.
>>>>>>>>
>>>>>>>> To stop this gap require that DMA buffer mmaps are VM_PFNMAP, which
>>>>>>>> blocks get_user_pages and all the other struct page based
>>>>>>>> infrastructure for everyone. In spirit this is the uapi counterpart to
>>>>>>>> the kernel-internal CONFIG_DMABUF_DEBUG.
>>>>>>>>
>>>>>>>> Motivated by a recent patch which wanted to swich the system dma-buf
>>>>>>>> heap to vm_insert_page instead of vm_insert_pfn.
>>>>>>>>
>>>>>>>> v2:
>>>>>>>>
>>>>>>>> Jason brought up that we also want to guarantee that all ptes have the
>>>>>>>> pte_special flag set, to catch fast get_user_pages (on architectures
>>>>>>>> that support this). Allowing VM_MIXEDMAP (like VM_SPECIAL does) would
>>>>>>>> still allow vm_insert_page, but limiting to VM_PFNMAP will catch that.
>>>>>>>>
>>>>>>>>     From auditing the various functions to insert pfn pte entires
>>>>>>>> (vm_insert_pfn_prot, remap_pfn_range and all it's callers like
>>>>>>>> dma_mmap_wc) it looks like VM_PFNMAP is already required anyway, so
>>>>>>>> this should be the correct flag to check for.
>>>>>>>>
>>>>>>> If we require VM_PFNMAP, for ordinary page mappings, we also need to
>>>>>>> disallow COW mappings, since it will not work on architectures that
>>>>>>> don't have CONFIG_ARCH_HAS_PTE_SPECIAL, (see the docs for vm_normal_page()).
>>>>>> Hm I figured everyone just uses MAP_SHARED for buffer objects since
>>>>>> COW really makes absolutely no sense. How would we enforce this?
>>>>> Perhaps returning -EINVAL on is_cow_mapping() at mmap time. Either that
>>>>> or allowing MIXEDMAP.
>>>>>
>>>>>>> Also worth noting is the comment in  ttm_bo_mmap_vma_setup() with
>>>>>>> possible performance implications with x86 + PAT + VM_PFNMAP + normal
>>>>>>> pages. That's a very old comment, though, and might not be valid anymore.
>>>>>> I think that's why ttm has a page cache for these, because it indeed
>>>>>> sucks. The PAT changes on pages are rather expensive.
>>>>> IIRC the page cache was implemented because of the slowness of the
>>>>> caching mode transition itself, more specifically the wbinvd() call +
>>>>> global TLB flush.
>>> Yes, exactly that. The global TLB flush is what really breaks our neck here
>>> from a performance perspective.
>>>
>>>>>> There is still an issue for iomem mappings, because the PAT validation
>>>>>> does a linear walk of the resource tree (lol) for every vm_insert_pfn.
>>>>>> But for i915 at least this is fixed by using the io_mapping
>>>>>> infrastructure, which does the PAT reservation only once when you set
>>>>>> up the mapping area at driver load.
>>>>> Yes, I guess that was the issue that the comment describes, but the
>>>>> issue wasn't there with vm_insert_mixed() + VM_MIXEDMAP.
>>>>>
>>>>>> Also TTM uses VM_PFNMAP right now for everything, so it can't be a
>>>>>> problem that hurts much :-)
>>>>> Hmm, both 5.11 and drm-tip appears to still use MIXEDMAP?
>>>>>
>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Flatest%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Fttm%2Fttm_bo_vm.c%23L554&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Ca93d0dbbc0484fec118808d8d9a4fc22%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637498649935442516%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=7%2BO0WNdBF62eVDy7u4hRydsfviF6dBJEDeZiYIzQAcc%3D&amp;reserved=0
>>>> Uh that's bad, because mixed maps pointing at struct page wont stop
>>>> gup. At least afaik.
>>> Hui? I'm pretty sure MIXEDMAP stops gup as well. Otherwise we would have
>>> already seen tons of problems with the page cache.
>> On any architecture which has CONFIG_ARCH_HAS_PTE_SPECIAL vm_insert_mixed
>> boils down to vm_insert_pfn wrt gup. And special pte stops gup fast path.
>>
>> But if you don't have VM_IO or VM_PFNMAP set, then I'm not seeing how
>> you're stopping gup slow path. See check_vma_flags() in mm/gup.c.
>>
>> Also if you don't have CONFIG_ARCH_HAS_PTE_SPECIAL then I don't think
>> vm_insert_mixed even works on iomem pfns. There's the devmap exception,
>> but we're not devmap. Worse ttm abuses some accidental codepath to smuggle
>> in hugepte support by intentionally not being devmap.
>>
>> So I'm really not sure this works as we think it should. Maybe good to do
>> a quick test program on amdgpu with a buffer in system memory only and try
>> to do direct io into it. If it works, you have a problem, and a bad one.
> That's probably impossible, since a quick git grep shows that pretty
> much anything reasonable has special ptes: arc, arm, arm64, powerpc,
> riscv, s390, sh, sparc, x86. I don't think you'll have a platform
> where you can plug an amdgpu in and actually exercise the bug :-)
>
> So maybe we should just switch over to VM_PFNMAP for ttm for more clarity?

Maybe yes, but not sure.

I've once had a request to do this from some google guys, but rejected 
it because I wasn't sure of the consequences.

Christian.

> -Daniel
>
>
>>> Regards,
>>> Christian.
>>>
>>>> Christian, do we need to patch this up, and maybe fix up ttm fault
>>>> handler to use io_mapping so the vm_insert_pfn stuff is fast?
>>>> -Daniel
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Ca93d0dbbc0484fec118808d8d9a4fc22%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637498649935442516%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=PmdIbYM6kemXstScf2OoZU9YyXGGzzNzeWEyL8ZDnfo%3D&amp;reserved=0
>
>

