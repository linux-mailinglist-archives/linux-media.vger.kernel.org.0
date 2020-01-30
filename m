Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CBE814DA80
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2020 13:18:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbgA3MSx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jan 2020 07:18:53 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:51225 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726873AbgA3MSw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jan 2020 07:18:52 -0500
Received: from [IPv6:2001:420:44c1:2577:91db:5aec:4999:a214]
 ([IPv6:2001:420:44c1:2577:91db:5aec:4999:a214])
        by smtp-cloud7.xs4all.net with ESMTPA
        id x8mTip8w2VuxOx8mXiojsk; Thu, 30 Jan 2020 13:18:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580386730; bh=3aLk1oziqQqBDv9/mNRZ8REmK5GdIwmVv/wgoQqFGwg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Fgf99QecIbkxG+m/IwzYi/bRmIv8UXfIDqukw4bsJYabw29xQ9R2b4p6bgWz6Yw9E
         //Nj49svkIAvvyhsuB2/HkqniznSJTIwFcgClmN0T0+k2vFcNFQ0hYNNs2wjRF/kbl
         ytYpN3ALYYaiKL1qnEpZhLDlC4SUrdckGoJYF0Twbjro4e+2BIDTDYDZEKFe52tGVu
         QO4YPQGci3FezO+tfIjdzR3B0rNalQgQyTXPi7/jlRyrqdMFG02IXAHt0R5u4yVu81
         DR3ai6kTs5azaZoQc54XbpwKHgNpB+aOyxZVKpX7eLJdlhC22h/XHAjkgSxt6bLiJ8
         aZjp54lURNgPQ==
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
 <560ba621-5396-1ea9-625e-a9f83622e052@xs4all.nl>
 <CAAFQd5D27xaKhxg8UuPH6XXdzgBBsCeDL8wYw37r6AK+6sWcbg@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c23618a9-4bf8-1d9a-6e52-d616c79ff289@xs4all.nl>
Date:   Thu, 30 Jan 2020 13:18:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5D27xaKhxg8UuPH6XXdzgBBsCeDL8wYw37r6AK+6sWcbg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOhqeuOxnoTsYEvYo3jHDgU1BU++/edLrHB4Z+lHEkpbZuXm0NTzXvSzYHXWmUcxToKunBjCc6ZcNPmc825MzMi0Wk0XizJfGpfdJKXnUiG7CxL32ZqM
 pkfZrOdBUmB5HpI131EtLEZvYNM02n84rd3z7w5ogIJs0z/U6T/qCxpLWQuHnBIsfTrX191ubiRCyNJvQh6xlL4zJzvmN1vZEOALqdEEzEoBA7F06VT+GZ6G
 +yTOgrTlVbclTf5oCkLGlCYVsHkM2M+qlH/GCe3dwxAExLDi3y92ENIBWMOBjy5lusMEgdwplELFpOlWRStLRsP/9hMbv5gnJMbpJqQ0Yh9Zmn6Ho7Phn2ff
 pMawYhG7EF6TqUSITbqs5rCnPvJHfF8YCQYrglKLVhwWqc2IzYaaDJqDQ6fmNdJ1vH4mWbvXvAHR/oKHM1/fSrXkCIg5S8i+GfGY60+yl3KdePeOK9mUlZbK
 fmJwnhGd4sWXZRbJI5dDuanb13fyoSwRxMpBZNKR+NCp2qgtIksocrGSeWUhCw5BnVRsvSgHZ08AOcr+0TdQhHaQ7jiSkmnt6EOV8kpKezMVirSHSXp4Gb14
 INQYGZtVR/fp61t37V276k39EOWf2FwoueTi6aa1d/sY5cTMA9zNFJJC8oZ9JsbgZY4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/30/20 12:02 PM, Tomasz Figa wrote:
> On Tue, Jan 28, 2020 at 5:36 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 1/28/20 5:38 AM, Tomasz Figa wrote:
>>> On Fri, Jan 10, 2020 at 7:13 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>>>
>>>> On 12/17/19 4:20 AM, Sergey Senozhatsky wrote:
>>>>> Provide begin_cpu_access() and end_cpu_access() dma_buf_ops
>>>>> callbacks for cache synchronisation on exported buffers.
>>>>>
>>>>> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
>>>>> ---
>>>>>  .../media/common/videobuf2/videobuf2-dma-sg.c | 22 +++++++++++++++++++
>>>>>  1 file changed, 22 insertions(+)
>>>>>
>>>>> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
>>>>> index 6db60e9d5183..bfc99a0cb7b9 100644
>>>>> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
>>>>> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
>>>>> @@ -470,6 +470,26 @@ static void vb2_dma_sg_dmabuf_ops_release(struct dma_buf *dbuf)
>>>>>       vb2_dma_sg_put(dbuf->priv);
>>>>>  }
>>>>>
>>>>
>>>> There is no corresponding vb2_sg_buffer_consistent function here.
>>>>
>>>> Looking more closely I see that vb2_dma_sg_alloc doesn't pass the dma_attrs
>>>> argument to dma_map_sg_attrs, thus V4L2_FLAG_MEMORY_NON_CONSISTENT has no
>>>> effect on dma-sg buffers.
>>>
>>> videobuf2-dma-sg allocates the memory using the page allocator
>>> directly, which means that there is no memory consistency guarantee.
>>>
>>>>
>>>> Is there a reason why dma_attrs isn't passed on to dma_map_sg_attrs()?
>>>>
>>>
>>> V4L2_FLAG_MEMORY_NON_CONSISTENT is a flag for dma_alloc_attrs(). It
>>> isn't supposed to do anything for dma_map_sg_attrs(), which is only
>>> supposed to create the device (e.g. IOMMU) mapping for already
>>> allocated memory.
>>
>> Ah, right.
>>
>> But could vb2_dma_sg_alloc_compacted() be modified so that is uses
>> dma_alloc_attrs() instead of alloc_pages()? Sorry, that might be a stupid
>> question, I'm not an expert in this area. All I know is that I hate inconsistent
>> APIs where something works for one thing, but not another.
>>
> 
> dma_alloc_attrs() would allocate contiguous memory, which kind of goes
> against the vb2_dma_sg allocator idea. Technically we could call it N
> times with size = 1 page to achieve what we want, but is this really
> what we want?
> 
> Given that vb2_dma_sg has always been returning non-consistent memory,
> do we have any good reason to add consistent memory to it? If so,
> perhaps we could still do that in an incremental patch, to avoid
> complicating this already complex series? :)

I very much agree with that. But this should be very clearly documented.
Should V4L2_CAP_MEMORY_NON_CONSISTENT always be set in this case?

Regards,

	Hans

> 
> Best regards,
> Tomasz
> 
>> Regards,
>>
>>         Hans
>>
>>>
>>>> I suspect it was just laziness in the past, and that it should be wired
>>>> up, just as for dma-contig.
>>>>
>>>> Regards,
>>>>
>>>>         Hans
>>>>
>>>>> +static int vb2_dma_sg_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
>>>>> +                                     enum dma_data_direction direction)
>>>>> +{
>>>>> +     struct vb2_dma_sg_buf *buf = dbuf->priv;
>>>>> +     struct sg_table *sgt = buf->dma_sgt;
>>>>> +
>>>>> +     dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static int vb2_dma_sg_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
>>>>> +                                     enum dma_data_direction direction)
>>>>> +{
>>>>> +     struct vb2_dma_sg_buf *buf = dbuf->priv;
>>>>> +     struct sg_table *sgt = buf->dma_sgt;
>>>>> +
>>>>> +     dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>>  static void *vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf)
>>>>>  {
>>>>>       struct vb2_dma_sg_buf *buf = dbuf->priv;
>>>>> @@ -488,6 +508,8 @@ static const struct dma_buf_ops vb2_dma_sg_dmabuf_ops = {
>>>>>       .detach = vb2_dma_sg_dmabuf_ops_detach,
>>>>>       .map_dma_buf = vb2_dma_sg_dmabuf_ops_map,
>>>>>       .unmap_dma_buf = vb2_dma_sg_dmabuf_ops_unmap,
>>>>> +     .begin_cpu_access = vb2_dma_sg_dmabuf_ops_begin_cpu_access,
>>>>> +     .end_cpu_access = vb2_dma_sg_dmabuf_ops_end_cpu_access,
>>>>>       .vmap = vb2_dma_sg_dmabuf_ops_vmap,
>>>>>       .mmap = vb2_dma_sg_dmabuf_ops_mmap,
>>>>>       .release = vb2_dma_sg_dmabuf_ops_release,
>>>>>
>>>>
>>

