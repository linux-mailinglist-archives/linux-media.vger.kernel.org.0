Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54139327BDC
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 11:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233228AbhCAKUi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 05:20:38 -0500
Received: from mail-dm6nam11on2069.outbound.protection.outlook.com ([40.107.223.69]:56909
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233381AbhCAKTN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Mar 2021 05:19:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=it+3DNlVQX6oYr+8fDJnNj9WPNqCslbD1/EQawdfD9RyjRVcZd2dCyX9H+K+MzH7bYoJYypwm6Kw+IUbrWsY9tM7iUtJ9CZ1A80IglZwl3M8kndNCtWtwwVX7mD/u9mdJR2u6wW0zIZvLNSsAX4/VRTSH6iH+LkOLteVXesbQA3NlFYqr2gJTsXVjLB87eXnmESrB1O0UXMXzaebrxdMeFJCCU2bNc75EPI3ukcYWkKBTK3UMYup6XywfkmaOYM0jrwXQ0eWOxhX1bzNsZLCcthpWh9cy1u0l+p9wZ60qbERVo9LDcDKikJ0m/l4yRarOitK3CvbLQYSmnL312On9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyc3UGnNTIqRtymu9gELU2gbvshZsITJwnRcgO2YPD4=;
 b=OgGp6h/EQ3ThBQHA+3GhkfMBNP2aqNnadxET01IXGXX+fh7+r+gjRRYGxqQcDS03qSthHg+xlbzny9Q59b7DRMha1jICX+dEzUdsQgXSz+2yoAhgmCuHXsw/jqlz2MdHhz3v3cwaVj4vFUeCmqENgVCp2Fy+B0UMYvpYFSICI9EnXE8GhxYkash9m+s4u1MznaezhMQFHG7MqIFSeEHEmWX5g3s79jWyh7D07/CjHjg8TozcK+FG5qTG5FzCvlrDElp+tnt1XWd8GsfTu+8b0SB4D6b1rXQy+Pc63fqUzuWIj/uOrX1IqgFkmzLxanCUr3tU0hXt/bV8AR1e2LzHXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyc3UGnNTIqRtymu9gELU2gbvshZsITJwnRcgO2YPD4=;
 b=5QsvE6qsdXmOEdkDHf541wb0jdOMKjxz5REIsBi+U59dJoLwPKJkUcWjjig4uW50S1NZTJDxABVq/YyciuYFnBPFPG8o8SyNVBud5PfL4O8KoOXTfdIBQxgXcHj8/NjMPXS14ShZBRXDbYP1wfPdtK7uaSaN1eKmtiOvGA5K900=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3694.namprd12.prod.outlook.com (2603:10b6:208:165::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Mon, 1 Mar
 2021 10:17:44 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 10:17:44 +0000
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for
 mmap
To:     =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= 
        <thomas_os@shipmail.org>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
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
References: <f43311c8-a02a-1a29-a53b-88e599c92187@shipmail.org>
 <CAKMK7uE2UrOruQPWG9KPBQ781f9Bq9xpVRNserAC9BZ2VzDutQ@mail.gmail.com>
 <b30dacb0-edea-0a3c-6163-0f329e58ba61@gmail.com>
 <YDd/hlf8uM3+lxhr@phenom.ffwll.local>
 <CAKMK7uFezcV52oTZbHeve2HFFATeCGyK6zTT6nE1KVP69QRr0A@mail.gmail.com>
 <61c5c371-debe-4ca0-a067-ce306e51ef88@shipmail.org>
 <CAKMK7uFUiJyMP0E5JUzMOx=NyMW+ZObGsaFOh409x0LOvGbnzg@mail.gmail.com>
 <0d69bd00-e673-17cf-c9e3-ccbcd52649a6@shipmail.org>
 <CAKMK7uE=8+hj-MUFXHFoG_hAbz_Obi8a99+DE5_d1K+KZaG+tQ@mail.gmail.com>
 <b367b7e8-f202-4d23-d672-a5c9bc7fcec1@shipmail.org>
 <YDyuYk8x5QeX83s6@phenom.ffwll.local>
 <be8f2503-ffcb-eb58-83be-26fa0fc1837a@shipmail.org>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <648556e6-2d99-950d-c940-706eb5a8f6cc@amd.com>
Date:   Mon, 1 Mar 2021 11:17:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <be8f2503-ffcb-eb58-83be-26fa0fc1837a@shipmail.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:a93a:2306:54f2:28c4]
X-ClientProxiedBy: AM9P195CA0024.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::29) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:a93a:2306:54f2:28c4] (2a02:908:1252:fb60:a93a:2306:54f2:28c4) by AM9P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Mon, 1 Mar 2021 10:17:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: aaff20dd-3bdc-4f4b-45cd-08d8dc9b406c
X-MS-TrafficTypeDiagnostic: MN2PR12MB3694:
X-Microsoft-Antispam-PRVS: <MN2PR12MB36942822E654C303913BCAC0839A9@MN2PR12MB3694.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0RUfnEkGDNzJe/SyyKzQQ2DoyY/zFLOfwZG9mnF63tMYLBYYFdRGAwOkuHAfIUgltdIJ1o9Gg00fjngRT6/oupr/3Njfyv0PhwMc4d2YpP24DrcyutJ+SncPiuih+0UumGI2pN25NDA8b01mfizZIK97WIitc0s8UztogwX+Z1u+79YjnVE1utxjqV/Asv1exwptrI0p/xBpm1++ZLxDquml2ScUiP190sko5BMdY8qiRyHsXwSMvy5dKktraZNtlPZjYy7LLwd2VNgcMycREIKDFlLN7RMLfJ4ZMEu5d3mJlDJZsycQFzYmbO4XtazPT1MVMPArp0h7IRJKwDRwp1N6xvYuTZLtAfXymq9ukPEp+WB9LhYismecR8sYloYy04tWdpHCcF3eYGesewEyACjiEc7nj8mQ4YyJ3tYdc3Q9Y8wdmZkLLE7+QIJrHMIyLLQeEUKVi4zhUYEIvshmvT2SJWi3fiOJxWSVaUQftQUMgW20icUExW2UaFeNF6eVc0NTgyQkDQxFHu5AMTSaDQyfmrLUw7YGdeBUV4ZnvlJCOLg9bpLHsj92Ya3t0AwHVNBrnndw5z3VRDnwlTlbV+rMjGO7zirjaAkiqOK0bJM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(4326008)(6486002)(31686004)(31696002)(66556008)(66476007)(83380400001)(66946007)(478600001)(66574015)(2616005)(6666004)(16526019)(186003)(2906002)(5660300002)(36756003)(7416002)(86362001)(52116002)(110136005)(316002)(8676002)(8936002)(54906003)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ejhxSTJhajBXZkozUmRsM05hTWRjZThXMW9DR1dKT2RyUHRHbVB0UGhLRDht?=
 =?utf-8?B?R2ZrL21xMnhLcktQR00xK0E3L3VMYlFrcEVsVlJYaENLeC9heHU0TWVFUVdR?=
 =?utf-8?B?alBvT1lvc1RYMDZaOTBQeVFVTjFvZDQxT1djOVpENERyV251NFNsWmZyY2g1?=
 =?utf-8?B?NWQ2MUdrSlhWUzdQWEoxSkFRRG9oRVJ4RlJEODlPb2RTcDd1ejhGVW95RHdX?=
 =?utf-8?B?ayt6QUtuR2FyNVFLczRoM2E2cjJMeG40ay9ReVQrdkZPZ3hQUmxQSVZjRjFz?=
 =?utf-8?B?WnpxNjFJOXhpSkl5aWt5aG9nckRLSFhXS2ZyTExObGVVOHB1Z2xkQnkwZDZp?=
 =?utf-8?B?cTBPb1NMSmE1TGs3Q0NDTWl6bSt0cnNYZkVLaGlZSk9idDlST3oxTVBDMTVX?=
 =?utf-8?B?YUZ6N2VoZGdtVFFwQ3hpc1htYXFaSUJ1SFc3VlY1aC9OTkY4TytuRjZWaFI0?=
 =?utf-8?B?Ym9aNFhXMVdyQy9VTkFtMitSbm9hNFNWMlZFNTlwdmRSYlp6VitnYTJIZzcx?=
 =?utf-8?B?bFZmNDdKS1NERTNacTlTeE5DL2hkK2x3RXB3NldtUHN1N0F0ZVZhV0NESU1B?=
 =?utf-8?B?Y0pjclZXQ0J2bGNib2d6WGRoci84d3FnOXlkRERuSmh4em1PRWtVU0g4Uysr?=
 =?utf-8?B?S2J0NzlCaWJnaStOREtDYzYzUE9jallQQXo2YmRROFZrK0Y2dGxiTzJ0U1Bw?=
 =?utf-8?B?NTlLVVVSYVVwUFplVzRPMXk5bXo2THJFVzZ6VGlKTHZGZ3F3MDIzTHNSZUtq?=
 =?utf-8?B?aFJieWNUM0IxaWc0cGhkeUJFb3ljU3EzUDhzV0QxRmoyYWNKVGl6aDZaa1V2?=
 =?utf-8?B?aFV6QVh0bXdBOHh6a2gvNWMvSmN0eTh1b0EzeFBudHVvVmJKdDhJNThwb0RH?=
 =?utf-8?B?NnZPTmEzenFVZXM0Njd0Z0lkNEkvdkYvbmVRZDFhbnI5VHVXZ21KK0JDV1VC?=
 =?utf-8?B?d09aTTE2Uyt3dW0xNVNpZGhoUFU0Q0NYVDNGMmNRUWZQcWliRW5jM1BmRFl5?=
 =?utf-8?B?aTNWb2V6a0RieHY0dTM4SktTNWo3bGJtS082ZW5vMGE4dWlGQVA3SWNTbjAx?=
 =?utf-8?B?d0NpNWhGSVU2eW5zeHFOWWh1OFpabGtRZWdib3F3Qnp0TVk1Nlc5WnpwZ0o1?=
 =?utf-8?B?aHBTZmlRNnp1RzYySHFma1dBdjJZYnZ4bnlsYUxyM1BqdlR0bExnUitkazB0?=
 =?utf-8?B?Y1diZmFZalVMcXFWbm91eWY1ODNxYi91YVg5aGl2RlZrTy8wWVJLd0RCRmRY?=
 =?utf-8?B?TFpyZ1R5eTI3L1NyRWxhbjNBSmZSbE5xV3NteHlsblNFRzlJUEQrUC9IaERm?=
 =?utf-8?B?ODZCTEFsMG1DSXBiOWl6ZG1XbmxEc0Vhd3JrMHduNStDd1J3VkZMWm53QmJq?=
 =?utf-8?B?VE1zQ0g3eFpzMGd5Z05hRWZTYTloc0hhY2hZaURTb0dVTWUwZlhRZExGZW93?=
 =?utf-8?B?RHFsM3g3ajJuSVpaN3dZME5HdkNOMDA2WWJlWFUwdzNESFNjZHhaOXhiRHRj?=
 =?utf-8?B?NlN2b3VkMzdmaGs1bU1oM1NtenNPYWxlaHI2aTArSjg3VXJ6N3pBSzdQQVN4?=
 =?utf-8?B?MXlkcXhaRHJQcGpZK1JVREoxVUZ6UFhWZ0cxRWVDbTl0VTYwWW5IY0ZFK3Va?=
 =?utf-8?B?QlFQbWlNWGkwTTBNK0VOVXpxNTRiRTJDWi9vMUJWMXFwZjUxQ1NmSytRd1Nk?=
 =?utf-8?B?NTdwOG12Qzk3OWJENXJ3NzB2SDdqR2Q0Q3RxOWVNZW1ualR3WUJDbkRhcVV6?=
 =?utf-8?B?VEVKTS9PYnd0eGh4RENoNDdJUmg5WE84ZnNITGhrSWxYMk5raE1oTUs1UDZG?=
 =?utf-8?B?YTc1bUk2SEZVZVRTZEM1ejVxamhiWExlQnpCS0o5TTQzY29KZGc2QXhXSlZE?=
 =?utf-8?Q?O94KbnHCA0HzT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaff20dd-3bdc-4f4b-45cd-08d8dc9b406c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 10:17:43.8620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2mWZXQgYnBh74YGR8S4kEazUe6Yfz7LsQR04LbrgK9547oXpYEXHMKicTm3Y1Ln
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3694
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 01.03.21 um 10:21 schrieb Thomas Hellström (Intel):
>
> On 3/1/21 10:05 AM, Daniel Vetter wrote:
>> On Mon, Mar 01, 2021 at 09:39:53AM +0100, Thomas Hellström (Intel) 
>> wrote:
>>> Hi,
>>>
>>> On 3/1/21 9:28 AM, Daniel Vetter wrote:
>>>> On Sat, Feb 27, 2021 at 9:06 AM Thomas Hellström (Intel)
>>>> <thomas_os@shipmail.org> wrote:
>>>>> On 2/26/21 2:28 PM, Daniel Vetter wrote:
>>>>>> So I think it stops gup. But I haven't verified at all. Would be 
>>>>>> good
>>>>>> if Christian can check this with some direct io to a buffer in 
>>>>>> system
>>>>>> memory.
>>>>> Hmm,
>>>>>
>>>>> Docs (again vm_normal_page() say)
>>>>>
>>>>>     * VM_MIXEDMAP mappings can likewise contain memory with or 
>>>>> without "struct
>>>>>     * page" backing, however the difference is that _all_ pages 
>>>>> with a struct
>>>>>     * page (that is, those where pfn_valid is true) are refcounted 
>>>>> and
>>>>> considered
>>>>>     * normal pages by the VM. The disadvantage is that pages are 
>>>>> refcounted
>>>>>     * (which can be slower and simply not an option for some PFNMAP
>>>>> users). The
>>>>>     * advantage is that we don't have to follow the strict 
>>>>> linearity rule of
>>>>>     * PFNMAP mappings in order to support COWable mappings.
>>>>>
>>>>> but it's true __vm_insert_mixed() ends up in the insert_pfn() 
>>>>> path, so
>>>>> the above isn't really true, which makes me wonder if and in that 
>>>>> case
>>>>> why there could any longer ever be a significant performance 
>>>>> difference
>>>>> between MIXEDMAP and PFNMAP.
>>>> Yeah it's definitely confusing. I guess I'll hack up a patch and see
>>>> what sticks.
>>>>
>>>>> BTW regarding the TTM hugeptes, I don't think we ever landed that 
>>>>> devmap
>>>>> hack, so they are (for the non-gup case) relying on
>>>>> vma_is_special_huge(). For the gup case, I think the bug is still 
>>>>> there.
>>>> Maybe there's another devmap hack, but the ttm_vm_insert functions do
>>>> use PFN_DEV and all that. And I think that stops gup_fast from trying
>>>> to find the underlying page.
>>>> -Daniel
>>> Hmm perhaps it might, but I don't think so. The fix I tried out was 
>>> to set
>>>
>>> PFN_DEV | PFN_MAP for huge PTEs which causes pfn_devmap() to be 
>>> true, and
>>> then
>>>
>>> follow_devmap_pmd()->get_dev_pagemap() which returns NULL and 
>>> gup_fast()
>>> backs off,
>>>
>>> in the end that would mean setting in stone that "if there is a huge 
>>> devmap
>>> page table entry for which we haven't registered any devmap struct 
>>> pages
>>> (get_dev_pagemap returns NULL), we should treat that as a "special" 
>>> huge
>>> page table entry".
>>>
>>>  From what I can tell, all code calling get_dev_pagemap() already 
>>> does that,
>>> it's just a question of getting it accepted and formalizing it.
>> Oh I thought that's already how it works, since I didn't spot anything
>> else that would block gup_fast from falling over. I guess really would
>> need some testcases to make sure direct i/o (that's the easiest to test)
>> fails like we expect.
>
> Yeah, IIRC the "| PFN_MAP" is the missing piece for TTM huge ptes. 
> Otherwise pmd_devmap() will not return true and since there is no 
> pmd_special() things break.

Is that maybe the issue we have seen with amdgpu and huge pages?

Apart from that I'm lost guys, that devmap and gup stuff is not 
something I have a good knowledge of apart from a one mile high view.

Christian.

>
> /Thomas
>
>
>
>> -Daniel

