Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2660B767582
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 20:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231807AbjG1SeZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 14:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230360AbjG1SeT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 14:34:19 -0400
Received: from kozue.soulik.info (kozue.soulik.info [IPv6:2001:19f0:7000:8404:5400:ff:fe00:d7d6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD584488
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 11:34:16 -0700 (PDT)
Received: from [192.168.10.7] (unknown [10.0.12.132])
        by kozue.soulik.info (Postfix) with ESMTPSA id 0A755300F2B;
        Sat, 29 Jul 2023 03:33:49 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 kozue.soulik.info 0A755300F2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soulik.info; s=mail;
        t=1690569234; bh=UupO+/k4HbNKvejj1AVmVwxWXFkzX7lvD90tVfI4E6s=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=IpF8thssD2lt4zAncjz4qycAW8wNwcj0HOogNTK9RLZO/HnkzjvLBJzyb8LdUHdey
         z/XdXrhM56bRuQKKhcoRXCu4BjnpWXGI5SMvcKNmLOIP8oPtVtra5JqDzyFnG/PJMl
         OzwrX/AB88Puni9eYHb9bYQDBYluR59+sAm5zu0E=
Message-ID: <cbc0756a-1a98-545e-7eed-cccfd59289b8@soulik.info>
Date:   Sat, 29 Jul 2023 02:34:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC]: m2m dec reports the graphics memory requirement
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Hsia-Jun Li <Randy.Li@synaptics.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, Brian.Starkey@arm.com,
        boris.brezillon@collabora.com, frkoenig@chromium.org,
        hans.verkuil@cisco.com, hiroh@chromium.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Helen Koike <helen.koike@collabora.com>
References: <a2ffa1cb-42db-a78a-8bd7-b0e422aade13@synaptics.com>
 <CAAFQd5AFJwreERs2Hn_A+3g51OLF6F0eWjx2+rgiZV=FR_61fA@mail.gmail.com>
 <20230728043347.GM955071@google.com>
 <20230728081824.GC28824@pendragon.ideasonboard.com>
 <CAAFQd5BqDo41U05pmQ+eQvWa0YpJj2OTyKXDAFPwX2S5s5sqBg@mail.gmail.com>
 <20230728084205.GD28824@pendragon.ideasonboard.com>
Content-Language: en-US
From:   Randy Li <ayaka@soulik.info>
In-Reply-To: <20230728084205.GD28824@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 2023/7/28 16:42, Laurent Pinchart wrote:
> On Fri, Jul 28, 2023 at 05:28:56PM +0900, Tomasz Figa wrote:
>> On Fri, Jul 28, 2023 at 5:18 PM Laurent Pinchart wrote:
>>> On Fri, Jul 28, 2023 at 01:33:47PM +0900, Sergey Senozhatsky wrote:
>>>> On (23/07/27 17:17), Tomasz Figa wrote:
>>>>> On Fri, Jun 30, 2023 at 7:47 PM Hsia-Jun Li wrote:
>>>>>> Hello All
>>>>>>
>>>>>> This RFC tries to address the following problems:
>>>>>>
>>>>>> 1. Application may request too many buffers, increasing pressure to
>>>>>> system's memory allocator(Thinking about running Android with 8K UHD
>>>>>> playback in a system with only 2 GiB memory available);
>>>>> Yeah, I think that's something that has to be addressed. It was also
>>>>> mentioned recently in the review of the DELETE_BUF series. I think we
>>>>> need some kind of accounting of the allocations to the processes, so
>>>>> that the per-process limits of memory usage could apply. Let me add
>>>>> +Sergey Senozhatsky who often crosses his path with kernel memory
>>>>> management.
>>>> That's an interesting topic. The usual approach would be memcg: we
>>>> create a memory controller, set memory usage limit, then move tasks
>>>> under that controller. The last part is problematic, as it implies
>>>> a well-behaving user-space. I'm not aware of a simple way (or any
>>>> way for that matter) to "automatically enforce" memcg on a process
>>>> group.
>>>>
>>>>  From what I can tell networking code attempts to "enforce" memcg on its
>>>> allocations, and hence has to manually charge memcg. For instance, take
>>>> a look at sock_reserve_memory() and corresponding mem_cgroup_charge_skmem()
>>>> call.
>>>>
>>>> So I wonder if we can take a closer look at what networking does and
>>>> do something similar in vb2.
>>> It's a long-standing issue that would be nice to solve indeed. I however
>>> wonder if we should do so in vb2, or instead invest our time and efforts
>>> in transitioning to DMA heaps and solving the memory accounting issue
>>> there.
>> Would we then provide some way to disable MMAP buffer support for
>> applications? Or you're thinking more about backing MMAP allocations
>> with DMA-buf heaps internally in the kernel?
> Long term I'd like to see MMAP going away, replaced with DMA heaps.
> That's veeeery long term though. In the meantime, maybe an option to
> disable MMAP support (either a compilation option or a kernel command
> line option) would be useful.

MMAP is a confusion name, it means the driver would allocate memory in 
the device's memory space,

which turns out to be the unified memory(system memory) in the most 
embedded platform.

While we can't disable such option even for those embedded platform, a 
few cache hints are missing in DMA-heap.

For example, the page contiguous requirement hints(Device's iommu only 
support large page size).

>
