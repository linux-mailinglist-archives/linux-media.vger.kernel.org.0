Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60F4445DFC5
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 18:32:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349003AbhKYRfX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 25 Nov 2021 12:35:23 -0500
Received: from aposti.net ([89.234.176.197]:55254 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348647AbhKYRdW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 12:33:22 -0500
Date:   Thu, 25 Nov 2021 17:29:58 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 11/15] iio: buffer-dma: Boost performance using
 write-combine cache setting
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Alexandru Ardelean <ardeleanalex@gmail.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?b?S/ZuaWc=?= <christian.koenig@amd.com>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Message-Id: <YX153R.0PENWW3ING7F1@crapouillou.net>
In-Reply-To: <8WNX2R.M4XE9MQC24W22@crapouillou.net>
References: <20211115141925.60164-1-paul@crapouillou.net>
        <20211115141925.60164-12-paul@crapouillou.net>
        <20211121150037.2a606be0@jic23-huawei>
        <8WNX2R.M4XE9MQC24W22@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jonathan,

Le dim., nov. 21 2021 at 17:43:20 +0000, Paul Cercueil 
<paul@crapouillou.net> a �crit :
> Hi Jonathan,
> 
> Le dim., nov. 21 2021 at 15:00:37 +0000, Jonathan Cameron 
> <jic23@kernel.org> a �crit :
>> On Mon, 15 Nov 2021 14:19:21 +0000
>> Paul Cercueil <paul@crapouillou.net> wrote:
>> 
>>>  We can be certain that the input buffers will only be accessed by
>>>  userspace for reading, and output buffers will mostly be accessed 
>>> by
>>>  userspace for writing.
>> 
>> Mostly?  Perhaps a little more info on why that's not 'only'.
> 
> Just like with a framebuffer, it really depends on what the 
> application does. Most of the cases it will just read sequentially an 
> input buffer, or write sequentially an output buffer. But then you 
> get the exotic application that will try to do something like alpha 
> blending, which means read+write. Hence "mostly".
> 
>>> 
>>>  Therefore, it makes more sense to use only fully cached input 
>>> buffers,
>>>  and to use the write-combine cache coherency setting for output 
>>> buffers.
>>> 
>>>  This boosts performance, as the data written to the output buffers 
>>> does
>>>  not have to be sync'd for coherency. It will halve performance if 
>>> the
>>>  userspace application tries to read from the output buffer, but 
>>> this
>>>  should never happen.
>>> 
>>>  Since we don't need to sync the cache when disabling CPU access 
>>> either
>>>  for input buffers or output buffers, the .end_cpu_access() 
>>> callback can
>>>  be dropped completely.
>> 
>> We have an odd mix of coherent and non coherent DMA in here as you 
>> noted,
>> but are you sure this is safe on all platforms?
> 
> The mix isn't safe, but using only coherent or only non-coherent 
> should be safe, yes.
> 
>> 
>>> 
>>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> 
>> Any numbers to support this patch?  The mapping types are performance
>> optimisations so nice to know how much of a difference they make.
> 
> Output buffers are definitely faster in write-combine mode. On a 
> ZedBoard with a AD9361 transceiver set to 66 MSPS, and buffer/size 
> set to 8192, I would get about 185 MiB/s before, 197 MiB/s after.
> 
> Input buffers... early results are mixed. On ARM32 it does look like 
> it is slightly faster to read from *uncached* memory than reading 
> from cached memory. The cache sync does take a long time.
> 
> Other architectures might have a different result, for instance on 
> MIPS invalidating the cache is a very fast operation, so using cached 
> buffers would be a huge win in performance.
> 
> Setups where the DMA operations are coherent also wouldn't require 
> any cache sync and this patch would give a huge win in performance.
> 
> I'll run some more tests next week to have some fresh numbers.

I think I mixed things up before, because I get different results now.

Here are some fresh benchmarks, triple-checked, using libiio's 
iio_readdev and iio_writedev tools, with 64K samples buffers at 61.44 
MSPS (max. theorical throughput: 234 MiB/s):
  iio_readdev -b 65536 cf-ad9361-lpc voltage0 voltage1 | pv > /dev/null
  pv /dev/zero | iio_writedev -b 65536 cf-ad9361-dds-core-lpc voltage0 
voltage1

Coherent mapping:
- fileio:
    read:	125 MiB/s
    write:	141 MiB/s
- dmabuf:
    read:	171 MiB/s
    write:	210 MiB/s

Coherent reads + Write-combine writes:
- fileio:
    read:	125 MiB/s
    write:	141 MiB/s
- dmabuf:
    read:	171 MiB/s
    write:	210 MiB/s

Non-coherent mapping:
- fileio:
    read:	119 MiB/s
    write:	124 MiB/s
- dmabuf:
    read:	159 MiB/s
    write:	124 MiB/s

Non-coherent reads + write-combine writes:
- fileio:
    read:	119 MiB/s
    write:	140 MiB/s
- dmabuf:
    read:	159 MiB/s
    write:	210 MiB/s

Non-coherent mapping with no cache sync:
- fileio:
    read:	156 MiB/s
    write:	123 MiB/s
- dmabuf:
    read:	234 MiB/s (capped by sample rate)
    write:	182 MiB/s

Non-coherent reads with no cache sync + write-combine writes:
- fileio:
    read:	156 MiB/s
    write:	140 MiB/s
- dmabuf:
    read:	234 MiB/s (capped by sample rate)
    write:	210 MiB/s


A few things we can deduce from this:

* Write-combine is not available on Zynq/ARM? If it was working, it 
should give a better performance than the coherent mapping, but it 
doesn't seem to do anything at all. At least it doesn't harm 
performance.

* Non-coherent + cache invalidation is definitely a good deal slower 
than using coherent mapping, at least on ARM32. However, when the cache 
sync is disabled (e.g. if the DMA operations are coherent) the reads 
are much faster.

* The new dma-buf based API is a great deal faster than the fileio API.

So in the future we could use coherent reads + write-combine writes, 
unless we know the DMA operations are coherent, and in this case use 
non-coherent reads + write-combine writes.

Regarding this patch, unfortunately I cannot prove that write-combine 
is faster, so I'll just drop this patch for now.

Cheers,
-Paul


