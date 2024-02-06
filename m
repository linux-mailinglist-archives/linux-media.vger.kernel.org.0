Return-Path: <linux-media+bounces-4762-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4D384B658
	for <lists+linux-media@lfdr.de>; Tue,  6 Feb 2024 14:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1D3DB27A89
	for <lists+linux-media@lfdr.de>; Tue,  6 Feb 2024 13:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A86130E4F;
	Tue,  6 Feb 2024 13:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHR3VNqO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC4D12FF97;
	Tue,  6 Feb 2024 13:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707226122; cv=none; b=qB76wwSy/PoA1Lc1uOk0FOYqcnvDbeeE9Xza1kgBHgtEXMj7tKo4KC2Ztgb0YwF8N8J6BOFlI2iWzi+StNVT7fjn822S79hAuUVwyi/FcpYZYIlQ7VqI0kpvcbj5URDLDVYyxiFzwMOGjJ2kZ3Jog3GYIXA0lxku2RtZxxBA3Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707226122; c=relaxed/simple;
	bh=Y6u4vsxwAHerMpaObMfnjuURvcBzAxAuonlC1EEHjeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EVmv4ODbXU18AYc7AzoVs+124CO5PIVJqwmQs8GFmFjcSWyt0K/x92x3ckmfqsHLNrqfpcMv06q27N3l4T+rUZn+TJiiZMzMqkbzRkT+QgG2RXK2IhBf/iwjfGGVqmXI2woIiXr/hCHpP3GbSUUU5Ponme4eXYzN8/5MAMuPzPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHR3VNqO; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33b436dbdcfso896995f8f.0;
        Tue, 06 Feb 2024 05:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707226119; x=1707830919; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wsLRKQ8iAaIhKBkm7KdmikDqe1gMJ2UtuCoYvn2yltg=;
        b=jHR3VNqOuMtcOf8X5bl1o/N38jc6n7YSjuFUaLCx3TpOwxFRWESrtGUC7wnyDRY2JB
         IftGuVaKP4FFrJFzJjY1PL30sp21MPYzu4yj1hj8j8SxTlwcnApgSLhlSgmcggZXgWkq
         pvVWtWO6QdL5HhQfqX150klIAj4zzDvmFC0lpc1TMLzHAzTeG1Txsa+eSbT3IpuGKjdC
         ZHwf64zrN8vVrmT4ivkXEzJgZ2qhomNcaQhyp8dro5NhF6w4MlrOXqkLDNgvQNjfimF3
         Mm6U4JwF84oukxG+Sx+kAih2ZYgV/b/rQy1w/L7RQ/GRBunokxD7SUVLi96NVH1oV7xl
         /mjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707226119; x=1707830919;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wsLRKQ8iAaIhKBkm7KdmikDqe1gMJ2UtuCoYvn2yltg=;
        b=tvJ6IaSRyOB7B8HNMeapmkDTH1v8vLrzbopmQoqrLNjGCVnir8y9RklCBGa46khKMX
         rZ9XBJHEWmnBAhdLKRE/XPo4h0RI3YrevCKZnBIFLaAJ9vc/1o8Q2YiTWRBsu3QqXlSl
         noJXA62+w5UYC8G7koEuNYhk99bf+MtY5EDJHiR6G+VWeLt574tns1jU3c3zG5wsQxHV
         Wvt38P3Bu0KYncrQ5iiTjqHXRNy+aaNAdBHyn3sXlWi30qZiZSa2meGqglwfE64PCWqY
         n3O/lSwROqUv52YCOSnGV6oLGWh1hW+a9V5bJp2Z9F9Z2+Rq3z3We3THzyywbEfHqsfb
         XHKw==
X-Gm-Message-State: AOJu0YzkLi6T7pLD0gnqXtOEq4Nj9kxVQENnq4F55oRn2xyiDMFk6S9o
	gGn1YNAL5eK5HjE7UIkP6iLdOlxpVDVklDiHiywUijHW98COLcA3
X-Google-Smtp-Source: AGHT+IGSDJt3qyb8vqRZcGNSkwAyY4OOFYpsyl5EB9OpHo+uWm9GpfenvaGvvYCRalJgwa8LRwgXHA==
X-Received: by 2002:a5d:468b:0:b0:33b:214b:1a6c with SMTP id u11-20020a5d468b000000b0033b214b1a6cmr1257999wrq.22.1707226118451;
        Tue, 06 Feb 2024 05:28:38 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV/xd/hEifO+dh/jkqixxKYmjfxNhhZAMCya98Aa5zo+qWYH015fAtOyzEaN8GI+6mlwKVyFScyB4J6MmSJ954wR+MWzART6L4Ahc0FsQgfs7f0HdgsCCADkTuOkZQSaOvJnekcFu6MeDVvQGe2vIo4Rfeedt0rPHNjI0LKgzcux+K6zSm7FFwrUTvz8twOXlNZV/QtfQVMeKFukreR1kgYwaKciqspQsPXaI0jXFfdiDiTjCyqLl+wvm39Re23g6SWfApq2JCwOfy0GblNwuDqZ+QhkAnfM1T70g109AcyEEw8BHYDVdaFso7ZME3uKPQCmRnRFWjxpTq+0lUMzaidSwgxbOc/I71b3xV2IKbNYlN+OdoZU4H6m/nQtv/dOqzS9j7JREkdNyanHJZV9bFaGu/b9VzvUB91+1iRpkSm/ZXGQsoiySnSHeps71anGtgZbUP6NDgWecuHQKzaBduU6gSL/2SNvh1mVN02/o15ndJPb261Nu3IC9Ne1k14Swfg6v15U/95/qYEYdTiZA==
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id e1-20020a5d65c1000000b0033b3c1200f0sm2124190wrw.10.2024.02.06.05.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 05:28:37 -0800 (PST)
Message-ID: <b2906521-998f-4a65-adb2-23caff207a4a@gmail.com>
Date: Tue, 6 Feb 2024 14:28:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] Re: [PATCH v5 1/6] dma-buf: Add
 dma_buf_{begin,end}_access()
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <noname.nuno@gmail.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Christoph Hellwig <hch@lst.de>
References: <577501f9-9d1c-4f8d-9882-7c71090e5ef3@amd.com>
 <7928c0866ac5b2bfaaa56ad3422bedc9061e0f7b.camel@crapouillou.net>
 <2ac7562c-d221-409a-bfee-1b3cfcc0f1c6@amd.com>
 <ZbKiCPhRvWaz4Icn@phenom.ffwll.local>
 <c97e38ee-b860-4990-87f1-3e59d7d9c999@amd.com>
 <Zbi6zQYtnfOZu5Wh@phenom.ffwll.local>
 <a2346244-e22b-4ff6-b6cd-1da7138725ae@amd.com>
 <7eec45a95808afe94ac65a8518df853356ecf117.camel@crapouillou.net>
 <ZbjSJi07gQhZ4WMC@phenom.ffwll.local>
 <1d912523-b980-4386-82b2-8d79808398c1@amd.com>
 <ZboNyju8h4vfSd7v@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ZboNyju8h4vfSd7v@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 31.01.24 um 10:07 schrieb Daniel Vetter:
> On Tue, Jan 30, 2024 at 02:09:45PM +0100, Christian König wrote:
>> Am 30.01.24 um 11:40 schrieb Daniel Vetter:
>>> On Tue, Jan 30, 2024 at 10:48:23AM +0100, Paul Cercueil wrote:
>>>> Le mardi 30 janvier 2024 à 10:23 +0100, Christian König a écrit :
>>>>>    I would say we start with the DMA-API by getting away from sg_tables
>>>>> to something cleaner and state oriented.
>>>> FYI I am already adding a 'dma_vec' object in my IIO DMABUF patchset,
>>>> which is just a dead simple
>>>>
>>>> struct dma_vec {
>>>>     dma_addr_t addr;
>>>>     size_t len;
>>>> };
>>>>
>>>> (The rationale for introducing it in the IIO DMABUF patchset was that
>>>> the "scatterlist" wouldn't allow me to change the transfer size.)
>>>>
>>>> So I believe a new "sg_table"-like could just be an array of struct
>>>> dma_vec + flags.
>>> Yeah that's pretty much the proposal I've seen, split the sg table into
>>> input data (struct page + len) and output data (which is the dma_addr_t +
>>> len you have above).
>> I would extend that a bit and say we have an array with
>> dma_addr+power_of_two_order and a header structure with lower bit offset and
>> some DMA transaction flags.
>>
>> But this is something which can be worked as an optimization later on. For a
>> start this proposal here looks good to me as well.
>>
>>> The part I don't expect to ever happen, because it hasn't the past 20 or
>>> so years, is that the dma-api will give us information about what is
>>> needed to keep the buffers coherency between various devices and the cpu.
>> Well maybe that's what we are doing wrong.
>>
>> Instead of asking the dma-api about the necessary information we should give
>> the API the opportunity to work for us.
>>
>> In other words we don't need the information about buffer coherency what we
>> need is that the API works for as and fulfills the requirements we have.
>>
>> So the question is really what should we propose to change on the DMA-api
>> side to get this working as expected?
> So one thing I've been pondering, kinda picking up your point about CXL,
> is that we do make the coherency protocol more explicit by adding a
> coherency mode to dma_buf that the exporter sets. Some ideas for values
> this could have:
>
> - ATTOMIC_COHERENT: Fully cache coherent, including device/cpu atomis.
>    This would be for CXL. Non-CXL devices could still participate with the
>    old model using explicit devices flushes, but must at comply with
>    CPU_COHERENT.
>
>    There's also the power9-only nvlink that would fit here, but I guess
>    going forward CXL (and cache-coherent integrated gpu) would really be
>    the only users of this flag.
>
>    Peer2peer would have the same rules, otherwise doesn't really make
>    sense. Also we might want to forbib non-CXL imports for these buffers
>    maybe even? Not sure on that.
>
> - CPU_COHERENT: device transactions do snoop cpu devices caches, but
>    devices might do their own caching which isn't snooped by the cpu and
>    needs explicit device-side invalidate/flushing. This means pcie
>    importers are not allowed to use pcie no-snoop transactions, intel igpu
>    wouldn't be allowed to use MOCS that do the same, similar for arm
>    integrated devices.
>
>    Importers can skip all explicit cache management apis like
>    dma_buf_begin/end_cpu_access, or the newly proposed
>    dma_buf_begin/end_device_access here.
>
>    We'd need to figure out what exactly this means for peer2peer
>    transactions, I have no idea whether the no-snoop flag even does
>    anything for those.
>
>    We might also want to split up CPU_COHERENT into CPU_COHERENT_WB and
>    CPU_WOHERENT_WC, so that importers know whether cpu reads are going to
>    be crawling or not.
>
> - MEMORY_COHERENT: devices transactions do not snoop any caches, but
>    promise that all transactions are fully flushed to system memory. Any
>    devices transactions which do fill cpu caches must call the proposed
>    dma_buf_begin/end_device_access functions proposed here. Any cpu access
>    must be braketed by calls to dma_buf_begin/end_cpu_access.
>
>    If your device does fill cpu caches, then essentially you'd not be able
>    to import such buffers. Not sure whether we need to put the
>    responsibility of checking that onto importers or exporters. Ideally
>    core dma-buf.c code would check this.
>
>    Also maybe the cpu WC mapping mode would actually need to be a sub-mode
>    for MEMORY_COHERENT, because all cpu wc achieves is to avoid the need to
>    call dma_buf_begin/end_cpu_access, you would still need your devices to
>    be memory coherent. And if they're not, then you cannot use that
>    dma-buf.
>
>    Or maybe alternatively we need to guarantee that exporters which set
>    MEMORY_COHERENT implement dma_buf_begin/end_device_access to make things
>    work for these cpu-coherent but not memory-coherent devices. This
>    becomes very tricky with device/arch/bus specific details I think.
>
> - DMA_API_COHERENT: The memory is allocated or mapped by the dma-api, and
>    the exact coherency mode is not know. Importers _must_ braket all cpu
>    and device access with the respective dma_buf functions. This is
>    essentially the "we have no idea" default.
>
>    Note that exporters might export memory allocated with dma_map_alloc
>    with MEMORY_COHERENT or CPU_COHERENT if they know how the memory exactly
>    works. E.g. for most arm soc gpu/display drivers we can assume that the
>    dma-api gives us MEMORY_COHERENT or CPU_COHERENT_WC, and just use that.
>    Essentially this would make the current implicit assumptions explicit.
>
>    udmabuf would need to set this, definitely if Paul's patches to add the
>    explicit device flushes land.
>
> - DEFAULT_COHERENT: This would be the backwards compat legacy yolo
>    behvaior. I'm not sure whether we should alias that with
>    DMA_API_COHERENT or leave it as a special value to mark exporters which
>    haven't been updated for the much more explicit coherency handling yet.
>
>    The specification for this coherency mode would be a flat out "who
>    knows, just don't break existing use-cases with actual users".
>    Essentially the only reason we'd have this would be to make sure we can
>    avoid regressions of these existing use-cases, by keeping whatever
>    horrible heuristics we have in current exporters.
>
>    It would also allow us to convert exporters and importers on a case by
>    case basis.
>
> Note that all these coherency modes are defined in terms of bus-sepecific
> device access and in terms of dma_buf apis the importer must call or can
> skip. This way we'd avoid having to change the dma-api in a first step,
> and if this all works out properly we could then use the resulting dma-api
> as a baseline to propose dma-api extensions.

When I read this for the first time my initial impression was that the 
idea mostly looked good, but while thinking about it more and more I 
came to the conclusion that this would go into the wrong direction.

Maybe I'm repeating myself, but I think we first of all have to talk a 
bit about some aspects of coherency:

1. Intra device coherency. This means that intra devices caches are 
invalidated before beginning an operation and flushed before signaling 
that an operation finished.

2. Inter device and device to CPU coherency. This means that caches 
which sit in between devices and between devices and the CPU need to be 
invalidated and flushed appropriately when buffers are accessed by 
different parties.

Number 1 is device specific, part of the DMA-buf framework and handled 
by dma_fences. As far as I can see that part is actually quite well 
designed and I don't see any obvious need for change.

Number 2 is platform specific and I completely agree with the DMA-api 
folks that this doesn't belong into DMA-buf in the first place. That's 
why I think the begin_cpu_access()/end_cpu_access() callbacks are 
actually a bit misplaced. We still can use those in the exporter, but to 
make better buffer placement decisions, but should not invalidate any 
caches when they are called.

The flushing and invalidation for platform caches should really be in 
the DMA-buf framework and not the exporter.

So in my thinking the enumeration you outlined above should really go 
into struct device and explaining to everybody what the coherency 
properties of DMA operations of this device is.

> I think starting right out with designing dma-api extension is a few
> bridges too far. Both from a "how do we convince upstream" pov, but maybe
> even more from a "how do we figure out what we even need" pov.

Well I totally agree on the "how do we figure out what we even need", 
but I disagree a bit on that we don't know what DMA-api extension we need.

We don't have the full picture yet, but as I already outlined from the 
DMA-api pov we have two major things on our TODO list:

1. Somehow remove the struct pages from the DMA-buf *importer* API.

     My best suggestion at the moment for this is to split sg_tables 
into two data structures, one for the struct pages and one for the DMA 
addresses.

     Mangling the addresses to ensure that no importer messes with the 
struct pages was a good step, but it also creates problems when 
dma_sync_sg_for_cpu() dma_sync_for_device() are supposed to be called.

2. Add some dma_sync_sg_between_devices(A, B....).

     And on this I think we are on the same page that we are going to 
need this, but we are just not clear on who is going to use it.

Regards,
Christian.

>
>> Regards,
>> Christian.
>>
>>
>>
>>
>>
>>> -Sima
>> _______________________________________________
>> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
>> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org


