Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A8426E094
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 18:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728490AbgIQQXi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 12:23:38 -0400
Received: from mail-eopbgr760071.outbound.protection.outlook.com ([40.107.76.71]:22207
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728480AbgIQQXE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 12:23:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLKaKtZzrcszfnPE4BIWQ6Tj5hj0b0Ni9H0HyWbH1CKnj97+3UMY8G9FKHiH8D9/7b3XebPF0790YkiaUjrkTa5g/uzYxjaNLHptlYmJTQwXNr5VAt+o2fH5TduPsl2xC1aT5yPWjKgsshk79xzMMBnO3NLq4BOh9NMNkroLaGdnfsYPiwAl/4H5CiFZKZjnWS4nO+aevON4fHjRqvBElDMLGAmq3rFWGIBQMqEPaxNUUP6c8oaWbBNVMU+zhRqREaeUf8xHAF6CMQIXg9Kjuikr9dt82YFicOjJONJ9gwEXSh1s2FIjYacJtP5oOewlqU4Cy9CU+p6OAUI4CB6f7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jABm8LwfQX+B7OVzYuiuFVcRy4WDCIjn9tFN0xI5x1o=;
 b=Sswm6761KqzqkxCER6CFcZXF1mnPMPS4ElQKY+lKY7XxT4AjY97EKf7fI8iwVWR1ykEkD4DO/DxKcDZl1UjBoI0jrXVMT4WUExMkRijE8cGfq6WFERv8l8gRg7Gj9HW6M06Wx7/yZDagCHm9eKa7cOI5eOpEoFtCX+JsfU9g+kdRSSNuAs7OxWjNHy6xPRDBRbMQJv7Lhkg9Fshwpoa34Jo7QMU7aM0IG4jXuKHRbl0UFtH3qdK6zJsmQXkCUwt37jLwyQCstoioySCvZETqPQ8Bg492lL2ZwtCiKKkJm68E5V/KqvO+OGHXDJ1vsAhSP3ouEtgqPjHEXrl+xZaB9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jABm8LwfQX+B7OVzYuiuFVcRy4WDCIjn9tFN0xI5x1o=;
 b=tjUQf9hu1vkWKCA3qyTQqvjNmAGdMhOEhTeTuqNFS7lAq7+zyry4CiqiZfKNjJKoTnJxhnYePvcidoa3TFQQki6N6nBgu68jufvZ/6wlN8q4TrvcLqzkArzflVdRcmmgXWp3VFjxsvDKEXPE+4dHBKhvbl7Pgs9k2qKR9PPAShk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4317.namprd12.prod.outlook.com (2603:10b6:208:1d0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 17 Sep
 2020 16:06:19 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.014; Thu, 17 Sep 2020
 16:06:19 +0000
Subject: Re: [Linaro-mm-sig] Changing vma->vm_file in dma_buf_mmap()
To:     Daniel Vetter <daniel@ffwll.ch>, Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Linux MM <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com>
 <CAKMK7uHJNRzCJfWVSmMrLmGXE0qo+OCXiMd+zPTOkeG2pnVrmQ@mail.gmail.com>
 <8d8693db-a3f0-4f5f-3e32-57d23ca620f8@amd.com>
 <CAKMK7uE=UqZD3PVC8XZAXrgGH-VsUF_-YQD3MLV8KK1kpxO4yQ@mail.gmail.com>
 <20200917113110.GE8409@ziepe.ca>
 <6fd74b84-959c-8b3b-c27b-e9fbf66396c7@gmail.com>
 <20200917121858.GF8409@ziepe.ca>
 <d82f08ee-2dec-18e8-fb06-d26f18ed777a@gmail.com>
 <20200917143551.GG8409@ziepe.ca>
 <5b330920-c789-fac7-e9b1-49f3bc1097a8@gmail.com>
 <20200917152456.GH8409@ziepe.ca>
 <CAKMK7uHQLAHXC_aBZZco0e3tbAqnNuW8QdJk=-V-yM2khw5e=Q@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b9e65f47-b5c8-db09-117a-a8e22a5b6c71@amd.com>
Date:   Thu, 17 Sep 2020 18:06:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uHQLAHXC_aBZZco0e3tbAqnNuW8QdJk=-V-yM2khw5e=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM4PR0902CA0001.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::11) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM4PR0902CA0001.eurprd09.prod.outlook.com (2603:10a6:200:9b::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend Transport; Thu, 17 Sep 2020 16:06:18 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 71c1777b-f91f-422d-07f7-08d85b239d36
X-MS-TrafficTypeDiagnostic: MN2PR12MB4317:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4317C26D8019B740B7579197833E0@MN2PR12MB4317.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uTF4rWjd0cd8XQV8FUu1r/YTO4CJa+Rap3hyTCxCUTppkm9WqcOioURc0B9j1e3XMOuqhPVsoUanx1QtHpXo40LjBtIOjn68phfWENPOTmU89Dl9i2NGWNEtH7FNSfXeP0N+JQyTd8qi8TJ9L5UU++1hmBXwlCbYVc+zzPaXmFm0/XCuOB4+5aZZ1uq6g6FtZ5AILJGuzmcw23znq+ifNJZlvSO+Q63zEEH30qfxj42GO3MFUjHm8qgP7L8jF5ebNrEs4aomHdQx3ZqiYiowDq6FasLRShWNSmVPymaUNGD6hqkLYvS4PpXFowUJDtpmgm/L6oVVmDCxBJ82PYV/uIHpTA0YAguc6WB708EGll/6K8Kv0DEEg8f7YPn0CXkF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(2906002)(110136005)(66476007)(186003)(6666004)(66556008)(478600001)(66946007)(316002)(53546011)(16526019)(5660300002)(54906003)(2616005)(52116002)(31686004)(83380400001)(66574015)(8936002)(6486002)(31696002)(86362001)(8676002)(36756003)(4326008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: /fwqzab6FKSc2jXw0oyBau/S2HZmZQJuqcmcAfhEcvQWiv+Etyas15rnnZ1rR0CbCcSr8BG5X9JPpId/YYBnUmJllk4B7smIFNj05aZTyULc+88TgOnGUpfZ2tQNELpFOsV+A78HaCJBc3BKoKfSehCgqcRnVB4E2iXGUUVbozAWEeRaYn9DhNIyMn6JYxO91Hmt68ibRX3iUJwkkiLItS9kCNcZQ8oPFIX0oXINZgMtbYLBPlfPgby10FDIud/WGO5fi9x4gMRq9+bqCgSa9oBI2IbJsvncxcgVQN2+OF9rg3iCnbcTDz4GC++8/Ksk2XbM2rPRfSEFWeHBGqT9edUgHj8akQVfEsGC7pmv3FOqrgIVjGm/U9/T7FjtfAGMtPaxmYiq7G+wdBT0qUxIJ6sSGYj+GzwqxlWBinLSAHPp+n86pwSXqn4tnZRJYEZfZpHwvrs+WL4P7hQolQAfi5LmhZ6SjwiMjQPnMqQwuAJ5CmzYoyiA/r4ZJUTflnUf6WREmCZA9DtOyFmwdl6quTtnI2rQSIWdWWvkLKMVGcll2UV0CHTYaJlHkuCIdeS832IK2XQxk50NrrjMczKiJLaewEy0Kvk7k6T5RqNTA00Ty7liIEOAvIgtVmVMduaTXoMkW36Es0GTcLmfcrk5/XvbbcZ7DIwdbycYAqGmo+19YNDaMb368BWye/sVgDifAV/WRmFXvgMql28d5MBXSQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c1777b-f91f-422d-07f7-08d85b239d36
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 16:06:19.4131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e6L3bzi/zd6czyz0pwmshNVrnkdyfc7qmRXmFsjjH/K8aYeaGIAriPbeejyTnwb/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4317
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 17.09.20 um 17:37 schrieb Daniel Vetter:
> On Thu, Sep 17, 2020 at 5:24 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>> On Thu, Sep 17, 2020 at 04:54:44PM +0200, Christian König wrote:
>>> Am 17.09.20 um 16:35 schrieb Jason Gunthorpe:
>>>> On Thu, Sep 17, 2020 at 02:24:29PM +0200, Christian König wrote:
>>>>> Am 17.09.20 um 14:18 schrieb Jason Gunthorpe:
>>>>>> On Thu, Sep 17, 2020 at 02:03:48PM +0200, Christian König wrote:
>>>>>>> Am 17.09.20 um 13:31 schrieb Jason Gunthorpe:
>>>>>>>> On Thu, Sep 17, 2020 at 10:09:12AM +0200, Daniel Vetter wrote:
>>>>>>>>
>>>>>>>>> Yeah, but it doesn't work when forwarding from the drm chardev to the
>>>>>>>>> dma-buf on the importer side, since you'd need a ton of different
>>>>>>>>> address spaces. And you still rely on the core code picking up your
>>>>>>>>> pgoff mangling, which feels about as risky to me as the vma file
>>>>>>>>> pointer wrangling - if it's not consistently applied the reverse map
>>>>>>>>> is toast and unmap_mapping_range doesn't work correctly for our needs.
>>>>>>>> I would think the pgoff has to be translated at the same time the
>>>>>>>> vm->vm_file is changed?
>>>>>>>>
>>>>>>>> The owner of the dma_buf should have one virtual address space and FD,
>>>>>>>> all its dma bufs should be linked to it, and all pgoffs translated to
>>>>>>>> that space.
>>>>>>> Yeah, that is exactly like amdgpu is doing it.
>>>>>>>
>>>>>>> Going to document that somehow when I'm done with TTM cleanups.
>>>>>> BTW, while people are looking at this, is there a way to go from a VMA
>>>>>> to a dma_buf that owns it?
>>>>> Only a driver specific one.
>>>> Sounds OK
>>>>
>>>>> For TTM drivers vma->vm_private_data points to the buffer object. Not sure
>>>>> about the drivers using GEM only.
>>>> Why are drivers in control of the vma? I would think dma_buf should be
>>>> the vma owner. IIRC module lifetime correctness essentially hings on
>>>> the module owner of the struct file
>>> Because the page fault handling is completely driver specific.
>>>
>>> We could install some DMA-buf vmops, but that would just be another layer of
>>> redirection.
> Uh geez I didn't know amdgpu was doing that :-/
>
> Since this is on, I guess the inverse of trying to convert a userptr
> into a dma-buf is properly rejected?

My fault, I wasn't specific enough in my description :)

Amdgpu is NOT doing this with mmaped DMA-bufs, but rather with it's own 
mmaped BOs.

In other words when userspace call the userptr IOCTL and we get an error 
because we can't make an userptr from some random device memory we 
instead check all CPU mappings if the application was brain dead enough 
to provide us our own pointer back.

IIRC this is even done in userspace and not the kernel. But we talked 
about doing it in the kernel with the private_data as well.

>
>> If it is already taking a page fault I'm not sure the extra function
>> call indirection is going to be a big deal. Having a uniform VMA
>> sounds saner than every driver custom rolling something.
>>
>> When I unwound a similar mess in RDMA all the custom VMA stuff in the
>> drivers turned out to be generally buggy, at least.
>>
>> Is vma->vm_file->private_data universally a dma_buf pointer at least?
> Nope. I think if you want this without some large scale rewrite of a
> lot of code we'd need a vmops->get_dmabuf or similar. Not pretty, but
> would get the job done.

Yeah, agree that sounds like the simplest approach.

Regards,
Christian.

>
>>>> So, user VA -> find_vma -> dma_buf object -> dma_buf operations on the
>>>> memory it represents
>>> Ah, yes we are already doing this in amdgpu as well. But only for DMA-bufs
>>> or more generally buffers which are mmaped by this driver instance.
>> So there is no general dma_buf service? That is a real bummer
> Mostly historical reasons and "it's complicated". One problem is that
> dma-buf isn't a powerful enough interface that drivers could use it
> for all their native objects, e.g. userptr doesn't pass through it,
> and clever cache flushing tricks aren't allowed and a bunch of other
> things. So there's some serious roadblocks before we could have a
> common allocator (or set of allocators) behind dma-buf.
> -Daniel

