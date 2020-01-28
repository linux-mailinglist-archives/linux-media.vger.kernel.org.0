Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 313CE14B0F6
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2020 09:37:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbgA1Ig4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jan 2020 03:36:56 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:37401 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725867AbgA1Ig4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jan 2020 03:36:56 -0500
Received: from [IPv6:2001:983:e9a7:1:6d16:ffdc:f7c6:fc6f]
 ([IPv6:2001:983:e9a7:1:6d16:ffdc:f7c6:fc6f])
        by smtp-cloud7.xs4all.net with ESMTPA
        id wMMbiIkMxrNgywMMciSdAk; Tue, 28 Jan 2020 09:36:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580200613; bh=JDgXT1/UYDKOslMoK/jUkusLlmz+32ELnmLpz3iIi18=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=IsbFVycJA3BpHiEd7PQhDchB2yUmWmjGGsa6qhXnrFwfEjwT34NP5OzTUe2Qn5PyQ
         jMZ8gg/kQbSpsHdNDdQLnZinFAHZ3Zzs0qnMqg27j/KUQx783S/ayG1kYd169NRtZf
         fxroHgpOlpQhEMzJFZea3hBVB9PcnHxXEydk89m7Gk9v0UbG6LD7kwyPzAOIk2QY60
         1itOJwPCpmAd1sl7mhaadtVEC04aTnPxYO6uyF8Ts+kKXj3x5bkXttV2sOONrsWUB1
         1ReQ2BVjXMUUWOmmlHhZw9z1416O9425qevuHSg9IWbGYWhX8FlfZU18ps+ur7mpPW
         iQYsjc8YMRTLg==
Subject: Re: [RFC][PATCH 12/15] videobuf2: add begin/end cpu_access callbacks
 to dma-sg
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-13-senozhatsky@chromium.org>
 <1c5198dc-db4e-47d6-0d8b-259fbbb6372f@xs4all.nl>
 <CAAFQd5DN0FSJ=pXG3J32AXocnbkR+AB8yKKDk0tZS4s7K04Z9Q@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <560ba621-5396-1ea9-625e-a9f83622e052@xs4all.nl>
Date:   Tue, 28 Jan 2020 09:36:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5DN0FSJ=pXG3J32AXocnbkR+AB8yKKDk0tZS4s7K04Z9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHh9vFquUIeVQDbIEGUndWdmqS+f+pW//Hj6p2MJev0r34DL8qXdil99h/UwxH47ohe50ldTEeMYD6TijMy4o4jjL6MET60/+yvAIsQmr984wa8Movwe
 B3C4vuZBBNqsdWk2FNO20XjFf/8w4SF55GDH1u6LXUhpkgXrGaTvkRnbMUJImXlneie8SSCvotaoTFqCL+r26gCvtQkqbj6KFvwbSZmnalxXT07mJFdtnaHM
 B9DbbC5E4MN2Uw13yFOCG/ty0Q4k3AsQlFP98Pvk6QX88Wz2yvueslMrXhQexft5/8LE+4qWUduE7/eL/fvtKisn1Assltt1sIwamlzsgp8XEPIGEcw4RBXe
 TJnj1OlMF4v/xSIM3JQGkc9LB4mK5cHC3nwpRo0ecIohJ9bIuXY8FO/Qtzz/vGniBmqQ9575O1cR8ZCRW1x5jaPvK1g5yxt2KJL/c/b4b6QY4NFkDYIK7+JW
 lx+krq8klsnvzAXdl+ZBqposh+gOFEykDQWrZ5WVvNolfaN9CV5zBh8OJKgB0BMFEnjuIcWVl72mUznKpdHDfIMjIQ9gFCP1fHbC13wHD0gheUBCZPz4JXcg
 atrhGbdnFby9K6jhbCR2QaQArAS2tZwG5dyEa7bQibdmyQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/28/20 5:38 AM, Tomasz Figa wrote:
> On Fri, Jan 10, 2020 at 7:13 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 12/17/19 4:20 AM, Sergey Senozhatsky wrote:
>>> Provide begin_cpu_access() and end_cpu_access() dma_buf_ops
>>> callbacks for cache synchronisation on exported buffers.
>>>
>>> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
>>> ---
>>>  .../media/common/videobuf2/videobuf2-dma-sg.c | 22 +++++++++++++++++++
>>>  1 file changed, 22 insertions(+)
>>>
>>> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
>>> index 6db60e9d5183..bfc99a0cb7b9 100644
>>> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
>>> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
>>> @@ -470,6 +470,26 @@ static void vb2_dma_sg_dmabuf_ops_release(struct dma_buf *dbuf)
>>>       vb2_dma_sg_put(dbuf->priv);
>>>  }
>>>
>>
>> There is no corresponding vb2_sg_buffer_consistent function here.
>>
>> Looking more closely I see that vb2_dma_sg_alloc doesn't pass the dma_attrs
>> argument to dma_map_sg_attrs, thus V4L2_FLAG_MEMORY_NON_CONSISTENT has no
>> effect on dma-sg buffers.
> 
> videobuf2-dma-sg allocates the memory using the page allocator
> directly, which means that there is no memory consistency guarantee.
> 
>>
>> Is there a reason why dma_attrs isn't passed on to dma_map_sg_attrs()?
>>
> 
> V4L2_FLAG_MEMORY_NON_CONSISTENT is a flag for dma_alloc_attrs(). It
> isn't supposed to do anything for dma_map_sg_attrs(), which is only
> supposed to create the device (e.g. IOMMU) mapping for already
> allocated memory.

Ah, right.

But could vb2_dma_sg_alloc_compacted() be modified so that is uses
dma_alloc_attrs() instead of alloc_pages()? Sorry, that might be a stupid
question, I'm not an expert in this area. All I know is that I hate inconsistent
APIs where something works for one thing, but not another.

Regards,

	Hans

> 
>> I suspect it was just laziness in the past, and that it should be wired
>> up, just as for dma-contig.
>>
>> Regards,
>>
>>         Hans
>>
>>> +static int vb2_dma_sg_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
>>> +                                     enum dma_data_direction direction)
>>> +{
>>> +     struct vb2_dma_sg_buf *buf = dbuf->priv;
>>> +     struct sg_table *sgt = buf->dma_sgt;
>>> +
>>> +     dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
>>> +     return 0;
>>> +}
>>> +
>>> +static int vb2_dma_sg_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
>>> +                                     enum dma_data_direction direction)
>>> +{
>>> +     struct vb2_dma_sg_buf *buf = dbuf->priv;
>>> +     struct sg_table *sgt = buf->dma_sgt;
>>> +
>>> +     dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
>>> +     return 0;
>>> +}
>>> +
>>>  static void *vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf)
>>>  {
>>>       struct vb2_dma_sg_buf *buf = dbuf->priv;
>>> @@ -488,6 +508,8 @@ static const struct dma_buf_ops vb2_dma_sg_dmabuf_ops = {
>>>       .detach = vb2_dma_sg_dmabuf_ops_detach,
>>>       .map_dma_buf = vb2_dma_sg_dmabuf_ops_map,
>>>       .unmap_dma_buf = vb2_dma_sg_dmabuf_ops_unmap,
>>> +     .begin_cpu_access = vb2_dma_sg_dmabuf_ops_begin_cpu_access,
>>> +     .end_cpu_access = vb2_dma_sg_dmabuf_ops_end_cpu_access,
>>>       .vmap = vb2_dma_sg_dmabuf_ops_vmap,
>>>       .mmap = vb2_dma_sg_dmabuf_ops_mmap,
>>>       .release = vb2_dma_sg_dmabuf_ops_release,
>>>
>>

