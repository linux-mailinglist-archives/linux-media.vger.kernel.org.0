Return-Path: <linux-media+bounces-29462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82554A7D5FC
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 09:33:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E86A9189950C
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 07:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6781123A9A2;
	Mon,  7 Apr 2025 07:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MP3J1GuU"
X-Original-To: linux-media@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2EF227BA5
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 07:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010598; cv=none; b=DzxY0F2umEBBFWTL/iAIgEioMP0P3LV9pN0J0LnkMvTEGgEqpKAHiCbukNmv64vzbxosFCgDkWMytSRcDIwN7wGxJ+4Tv87kDiWoyJE8c20icls0RII6JSL+spqvypnbHwJZ9XndSw2PLhQSFjOS3gFC+8QBZUbOBzzzC1wfJ/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010598; c=relaxed/simple;
	bh=GcDemWlm9mCg6bGXbFdcN/CaQWjHZp5Tj29aydirtAA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=FuPzBbcJZiJc9z+xkZEgAju59meGrg9QiLk7MGsqyRoWxbUNtOf8vP8oGfdlfHLbjnqH2ZQtAzKwp4TZ+nx3Hcix3W/r0CBsSVlNATVEbI/Re2+9/C061xY8pZqh9th2G4h04FAzIj708nXmEbn62JAxYuURbsdVlh3ZnOIRqpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MP3J1GuU; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744010581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vrijqIO4hPzJruG16zYzwCBzVzb9WmLqL3WnUdfELbM=;
	b=MP3J1GuUO9BCyamovJmWCTVfHeITr4Ofmgt+/8nIjLAVXOyvG4J1gf5TLN1Y4S/hmvzRP5
	kBeoLE781fZRmyE0VQuGrVzysvJIF29iWumnnXMKsL5k+QvXTMGIvHUWQfR9L+VTZRkB3y
	56g7Tz4smGymDq/KrZUY21M9CElAQGc=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP is broken, was Re: [RFC
 PATCH 0/6] Deep talk about folio vmap
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <55306631-8421-455a-9d03-709ebee97d76@vivo.com>
Date: Mon, 7 Apr 2025 15:22:22 +0800
Cc: bingbu.cao@linux.intel.com,
 Christoph Hellwig <hch@lst.de>,
 Matthew Wilcox <willy@infradead.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org,
 opensource.kernel@vivo.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <777BB63E-245D-4027-880A-FFC3717928D7@linux.dev>
References: <20250327092922.536-1-link@vivo.com>
 <20250404090111.GB11105@lst.de>
 <9A899641-BDED-4773-B349-56AF1DD58B21@linux.dev>
 <43DD699A-5C5D-429B-A2B5-61FBEAE2E252@linux.dev>
 <e9f44d16-fd9a-4d82-b40e-c173d068676a@vivo.com>
 <E4D6E02F-BC82-4630-8CB8-CD1A0163ABCF@linux.dev>
 <6f76a497-248b-4f92-9448-755006c732c8@vivo.com>
 <FDB7F930-8537-4B79-BAA6-AA782B39943A@linux.dev>
 <35D26C00-952F-481C-8345-E339F0ED770B@linux.dev>
 <55306631-8421-455a-9d03-709ebee97d76@vivo.com>
To: Huan Yang <link@vivo.com>
X-Migadu-Flow: FLOW_OUT



> On Apr 7, 2025, at 15:09, Huan Yang <link@vivo.com> wrote:
>=20
>=20
> =E5=9C=A8 2025/4/7 14:43, Muchun Song =E5=86=99=E9=81=93:
>>=20
>>> On Apr 7, 2025, at 11:37, Muchun Song <muchun.song@linux.dev> wrote:
>>>=20
>>>=20
>>>=20
>>>> On Apr 7, 2025, at 11:21, Huan Yang <link@vivo.com> wrote:
>>>>=20
>>>>=20
>>>> =E5=9C=A8 2025/4/7 10:57, Muchun Song =E5=86=99=E9=81=93:
>>>>>> On Apr 7, 2025, at 09:59, Huan Yang <link@vivo.com> wrote:
>>>>>>=20
>>>>>>=20
>>>>>> =E5=9C=A8 2025/4/4 18:07, Muchun Song =E5=86=99=E9=81=93:
>>>>>>>> On Apr 4, 2025, at 17:38, Muchun Song <muchun.song@linux.dev> =
wrote:
>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>> On Apr 4, 2025, at 17:01, Christoph Hellwig <hch@lst.de> =
wrote:
>>>>>>>>>=20
>>>>>>>>> After the btrfs compressed bio discussion I think the hugetlb =
changes that
>>>>>>>>> skip the tail pages are fundamentally unsafe in the current =
kernel.
>>>>>>>>>=20
>>>>>>>>> That is because the bio_vec representation assumes tail pages =
do exist, so
>>>>>>>>> as soon as you are doing direct I/O that generates a bvec =
starting beyond
>>>>>>>>> the present head page things will blow up.  Other users of =
bio_vecs might
>>>>>>>>> do the same, but the way the block bio_vecs are generated are =
very suspect
>>>>>>>>> to that.  So we'll first need to sort that out and a few other =
things
>>>>>>>>> before we can even think of enabling such a feature.
>>>>>>>>>=20
>>>>>>>> I would like to express my gratitude to Christoph for including =
me in the
>>>>>>>> thread. I have carefully read the cover letter in [1], which =
indicates
>>>>>>>> that an issue has arisen due to the improper use of =
`vmap_pfn()`. I'm
>>>>>>>> wondering if we could consider using `vmap()` instead. In the =
HVO scenario,
>>>>>>>> the tail struct pages do **exist**, but they are read-only. =
I've examined
>>>>>>>> the code of `vmap()`, and it appears that it only reads the =
struct page.
>>>>>>>> Therefore, it seems feasible for us to use `vmap()` (I am not a =
expert in
>>>>>>>> udmabuf.). Right?
>>>>>>> I believe my stance is correct. I've also reviewed another =
thread in [2].
>>>>>>> Allow me to clarify and correct the viewpoints you presented. =
You stated:
>>>>>>>  "
>>>>>>>   So by HVO, it also not backed by pages, only contains folio =
head, each
>>>>>>>   tail pfn's page struct go away.
>>>>>>>  "
>>>>>>> This statement is entirely inaccurate. The tail pages do not =
cease to exist;
>>>>>>> rather, they are read-only. For your specific use-case, please =
use `vmap()`
>>>>>>> to resolve the issue at hand. If you wish to gain a =
comprehensive understanding
>>>>>> I see the document give a simple graph to point:
>>>>>>=20
>>>>>> +-----------+ ---virt_to_page---> +-----------+   mapping to   =
+-----------+
>>>>>> |           |                                     |     0     | =
-------------> |     0     |
>>>>>> |           | +-----------+                +-----------+
>>>>>> |           |                                      |     1     | =
-------------> |     1     |
>>>>>> |           | +-----------+                +-----------+
>>>>>> |           |                                      |     2     | =
----------------^ ^ ^ ^ ^ ^
>>>>>> |           | +-----------+                      | | | | |
>>>>>> |           |                                      |     3     | =
------------------+ | | | |
>>>>>> |           | +-----------+                        | | | |
>>>>>> |           |                                      |     4     | =
--------------------+ | | |
>>>>>> |    PMD    | +-----------+                          | | |
>>>>>> |   level   |                                   |     5     | =
----------------------+ | |
>>>>>> |  mapping  | +-----------+                             | |
>>>>>> |           |                                     |     6     | =
------------------------+ |
>>>>>> |           | +-----------+                              |
>>>>>> |           |                                     |     7     | =
--------------------------+
>>>>>> |           |                                    +-----------+
>>>>>> |           |
>>>>>> |           |
>>>>>> |           |
>>>>>> +-----------+
>>>>>>=20
>>>>>> If I understand correct, each 2-7 tail's page struct is freed, so =
if I just need map page 2-7, can we use vmap do
>>>>>>=20
>>>>>> something correctly?
>>>>> The answer is you can. It is essential to distinguish between =
virtual
>>>> Thanks for your reply, but I still can't understand it. For =
example, I need vmap a hugetlb HVO folio's
>>>>=20
>>>> 2-7 page:
>>>>=20
>>>> struct page **pages =3D kvmalloc(sizeof(*pages), 6, GFP_KENREL);
>>>>=20
>>>> for (i =3D 2; i < 8; ++i)
>>>>=20
>>>>    pages[i] =3D folio_page(folio, i);    //set 2-7 range page into =
pages,
>>>>=20
>>>> void *vaddr =3D vmap(pages, 6, 0, PAGE_KERNEL);
>>>>=20
>>>> For no HVO pages, this can work. If HVO enabled, do "pages[i] =3D =
folio_page(folio, i);" just
>>>>=20
>>>> got the head page? and how vmap can correctly map each page?
>>> Why do you think folio_page(folio, i) (i =E2=89=A0 0) returns the =
head page?
>>> Is it speculation or tested? Please base it on the actual situation
>>> instead of indulging in wild thoughts.
>> By the way, in case you truly struggle to comprehend the fundamental
>> aspects of HVO, I would like to summarize for you the user-visible
>> behaviors in comparison to the situation where HVO is disabled.
>>=20
>> HVO Status Tail Page Structures Head Page Structures
>> Enabled Read-Only (RO) Read-Write (RW)
>> Disabled Read-Write (RW) Read-Write (RW)
>>=20
>> The sole distinction between the two scenarios lies in whether the
>> tail page structures are allowed to be written or not. Please refrain
>> from getting bogged down in the details of the implementation of HVO.
>=20
> Thanks, I do a test, an figure out that I'm totally misunderstand it.
>=20
> Even if HVO enabled, tail page struct freed and point to head, linear =
mapping still exist, so that any page_to_pfn,
>=20
> page_to_virt(also folio's version), if start from head page can =
compute each need page like folio_page, can still work:
>=20
> hvo head 0xfffff9de849d0000, pfn=3D0x127400, wish offset_pfn 0x1275f1, =
idx 497 is 0xfffff9de849d7c40, pfn=3D0x1275f1.
>=20
> When vmap, we no need to touch actually page's content, just turn to =
pfn, so, work well.

You are able to read those tail page structures. The reason why vmap can
function is not that it doesn't read those page structures. What I mean
is that vmap will still work even if it does read the page structures,
because those tail page structures do indeed exist.

>=20
> BTW, even if we need to touch actually input page struct, it point to =
head page, I guess will effect nothing.

Allow me to clarify this for you to ensure that we have a shared =
understanding.
Those tail page structures (virtual addresses in the vmemmap area) are =
mapped
to the same page frame (physical page) to which the head page structures =
(virtual
addresses in the vmemmap area) are mapped. It is analogous to the =
shared-mapping
mechanism in the user space.

>=20
> If anything still misunderstand, please corrent me. :)
>=20
> Muchun, thank you for your patience,
>=20
> Huan Yang
>=20
>>=20
>> Thanks,
>> Muchun.
>>=20
>>> Thanks,
>>> Muchun.
>>>=20
>>>> Please correct me. :)
>>>>=20
>>>> Thanks,
>>>>=20
>>>> Huan Yang
>>>>=20
>>>>> address (VA) and physical address (PA). The VAs of tail struct =
pages
>>>>> aren't freed but remapped to the physical page mapped by the VA of =
the
>>>>> head struct page (since contents of those tail physical pages are =
the
>>>>> same). Thus, the freed pages are the physical pages mapped by =
original
>>>>> tail struct pages, not their virtual addresses. Moreover, while it
>>>>> is possible to read the virtual addresses of these tail struct =
pages,
>>>>> any write operations are prohibited since it is within the realm =
of
>>>>> acceptability that the kernel is expected to perform write =
operations
>>>>> solely on the head struct page of a compound head and conduct read
>>>>> operations only on the tail struct pages. BTW, folio =
infrastructure
>>>>> is also based on this assumption.
>>>>>=20
>>>>> Thanks,
>>>>> Muchun.
>>>>>=20
>>>>>> Or something I still misunderstand, please correct me.
>>>>>>=20
>>>>>> Thanks,
>>>>>>=20
>>>>>> Huan Yang
>>>>>>=20
>>>>>>> of the fundamentals of HVO, I kindly suggest a thorough review =
of the document
>>>>>>> in [3].
>>>>>>>=20
>>>>>>> [2] =
https://lore.kernel.org/lkml/5229b24f-1984-4225-ae03-8b952de56e3b@vivo.com=
/#t
>>>>>>> [3] Documentation/mm/vmemmap_dedup.rst
>>>>>>>=20
>>>>>>>> [1] =
https://lore.kernel.org/linux-mm/20250327092922.536-1-link@vivo.com/T/#m05=
5b34978cf882fd44d2d08d929b50292d8502b4
>>>>>>>>=20
>>>>>>>> Thanks,
>>>>>>>> Muchun.



