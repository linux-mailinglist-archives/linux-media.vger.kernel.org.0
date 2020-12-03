Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98B832CD9EA
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 16:14:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbgLCPL7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 10:11:59 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:43909 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727427AbgLCPL6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 10:11:58 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id kqGDkuGpBarN7kqGGkru2T; Thu, 03 Dec 2020 16:11:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1607008274; bh=BsZORl1mYIQ8+Kkd+xpSw1nx0zTU0h+cYmagvph5y3Q=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=e/iz0QNwYpo7i+aOLciZ8YmoLVggp2pfcfvzGhL+elrF3LQJsBcrrDX+pErcSp6dG
         +XdBuBrlTJJZs9zfEte1Z1nobFOU1RQdxehgcXtxo2cLW1QNKm5vWa/u+bnh0cUqFa
         NZ5kL3++rfX/9ViEr9RGoXAg5hs84Rk0G9BqPv6AEIYp0No0G84LdHkIguH0VTDna4
         qHBdxbtc+Q3hHXT7jubo1dcKOkCha3hmD0KJhunan/NcMqNX43V3qpPV32OZYO9+ru
         9JDlqa2kAYa8Cmd5gydE6H7f02lmtO8Il3O6EUjhphmhpzeMLx0rT39bJYGWFr7bxo
         WzOKoQRam03EA==
Subject: Re: [PATCH v5 2/7] media: v4l2: Add extended buffer operations
To:     Helen Koike <helen.koike@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Brian Starkey <Brian.Starkey@arm.com>, kernel@collabora.com,
        Neil Armstrong <narmstrong@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
References: <20200804192939.2251988-1-helen.koike@collabora.com>
 <20200804192939.2251988-3-helen.koike@collabora.com>
 <b8a08145-c54e-3d06-dd61-78ce99a812d5@xs4all.nl>
 <3ac23162-ce59-6cc3-da48-90f26c618345@collabora.com>
 <CAAFQd5A1F7g=LSJrtqwF+KEUq-QXmi0__-mbebsN27xFA0rQCQ@mail.gmail.com>
 <b14809a5-e471-73da-efde-1d0d6f54e485@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <de781845-7192-df0b-26c4-36b981237735@xs4all.nl>
Date:   Thu, 3 Dec 2020 16:11:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <b14809a5-e471-73da-efde-1d0d6f54e485@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMISraogJ0DQg5bYeleDRdXEQHcyjZQvRt1PFj9vhFlTrKxCha7PWe3lU1+fWzxPdFDoQETg5slIAcUiPZ2ACBHV80kvqnztN2yb+Jc5bADi8rNXNgvv
 GupSzRdO29OHNvPUE8ZyaQfK7tb7w34mZBs5+c4QDf2KJkG0g3v6BGokyiHBgWpIdUqsjEGd27lrHMlx/SC4cF6M8wUWu8kSX/xrMTid8n/Qfbm6Zkss7aPE
 KTt+tTm14Igo0jhWoi7LzYdRbrK+C87gh4DnprD0zLj4aUAGyuxrPwUSpHKkAxKTmCwtZ2omtNIYDxoZlzbnjTvhscsF8eObQh0TMhUlaO9cm8vlpKaZOUck
 rA76qMJyy7CiBr5/OVEflWiwhDxuRhKDrlIT5Dcrupch6TiLQbKNGLQKze5P2JV6OyYI/1uDK6HVYp6dF9wQfRnjszU3Il/8xBsDdZootzuySVbxkEJybAfo
 hFGbL6Ri7Bpp3LJ/rvuKKT2TTlw5bwxrW+9tVd8Kfa0KzuZs5C/pldR5MTGuusi5q/qf2RuIC9yKZQxPbt+nIy+Ux2c1rbEDECtgo5Ua4ce+6SqIyHxjbcUs
 LdmEqSe6Gp0ieTJEMuxE5lSq8B4vbGxBG4sqM+XE2tjaUd0n+kETNZyiup2PUPHK1iSr2LnT3jefnx3fGIYfDKglAD+FDLyP4XYo15nMsYISvr/BmrTNjaBi
 72WKcDUQaV2lQDmiRAQedwDZ5jK/1sXxZcKPDsXbhFAthkkvNNW9PQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/11/2020 18:40, Helen Koike wrote:
> 
> 
> On 11/23/20 12:46 PM, Tomasz Figa wrote:
>> On Tue, Nov 24, 2020 at 12:08 AM Helen Koike <helen.koike@collabora.com> wrote:
>>>
>>> Hi Hans,
>>>
>>> Thank you for your review.
>>>
>>> On 9/9/20 9:27 AM, Hans Verkuil wrote:
>>>> Hi Helen,
>>>>
>>>> Again I'm just reviewing the uAPI.
>>>>
>>>> On 04/08/2020 21:29, Helen Koike wrote:
>>>>> From: Hans Verkuil <hans.verkuil@cisco.com>
>>>>>
>>>>> Those extended buffer ops have several purpose:
>>>>> 1/ Fix y2038 issues by converting the timestamp into an u64 counting
>>>>>    the number of ns elapsed since 1970
>>>>> 2/ Unify single/multiplanar handling
>>>>> 3/ Add a new start offset field to each v4l2 plane buffer info struct
>>>>>    to support the case where a single buffer object is storing all
>>>>>    planes data, each one being placed at a different offset
>>>>>
>>>>> New hooks are created in v4l2_ioctl_ops so that drivers can start using
>>>>> these new objects.
>>>>>
>>>>> The core takes care of converting new ioctls requests to old ones
>>>>> if the driver does not support the new hooks, and vice versa.
>>>>>
>>>>> Note that the timecode field is gone, since there doesn't seem to be
>>>>> in-kernel users. We can be added back in the reserved area if needed or
>>>>> use the Request API to collect more metadata information from the
>>>>> frame.
>>>>>
>>>>> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
>>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>>>>> ---
>>>>> Changes in v5:
>>>>> - migrate memory from v4l2_ext_buffer to v4l2_ext_plane
>>>>> - return mem_offset to struct v4l2_ext_plane
>>>>> - change sizes and reorder fields to avoid holes in the struct and make
>>>>>   it the same for 32 and 64 bits
>>>>>
>>>>> Changes in v4:
>>>>> - Use v4l2_ext_pix_format directly in the ioctl, drop v4l2_ext_format,
>>>>> making V4L2_BUF_TYPE_VIDEO_[OUTPUT,CAPTURE] the only valid types.
>>>>> - Drop VIDIOC_EXT_EXPBUF, since the only difference from VIDIOC_EXPBUF
>>>>> was that with VIDIOC_EXT_EXPBUF we could export multiple planes at once.
>>>>> I think we can add this later, so I removed it from this RFC to simplify it.
>>>>> - Remove num_planes field from struct v4l2_ext_buffer
>>>>> - Add flags field to struct v4l2_ext_create_buffers
>>>>> - Reformulate struct v4l2_ext_plane
>>>>> - Fix some bugs caught by v4l2-compliance
>>>>> - Rebased on top of media/master (post 5.8-rc1)
>>>>>
>>>>> Changes in v3:
>>>>> - Rebased on top of media/master (post 5.4-rc1)
>>>>>
>>>>> Changes in v2:
>>>>> - Add reserved space to v4l2_ext_buffer so that new fields can be added
>>>>>   later on
>>>>> ---
>>>>>  drivers/media/v4l2-core/v4l2-dev.c   |  29 ++-
>>>>>  drivers/media/v4l2-core/v4l2-ioctl.c | 353 +++++++++++++++++++++++++--
>>>>>  include/media/v4l2-ioctl.h           |  26 ++
>>>>>  include/uapi/linux/videodev2.h       |  90 +++++++
>>>>>  4 files changed, 476 insertions(+), 22 deletions(-)
>>>>>
>>>>
>>>> <snip>
>>>>
>>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>>>> index 7123c6a4d9569..334cafdd2be97 100644
>>>>> --- a/include/uapi/linux/videodev2.h
>>>>> +++ b/include/uapi/linux/videodev2.h
>>>>> @@ -996,6 +996,41 @@ struct v4l2_plane {
>>>>>      __u32                   reserved[11];
>>>>>  };
>>>>>
>>>>> +/**
>>>>> + * struct v4l2_ext_plane - extended plane buffer info
>>>>> + * @buffer_length:  size of the entire buffer in bytes, should fit
>>>>> + *                  @offset + @plane_length
>>>>> + * @plane_length:   size of the plane in bytes.
>>>>> + * @mem_offset:             If V4L2_MEMORY_MMAP is used, then it can be a "cookie"
>>>>> + *                  that should be passed to mmap() called on the video node.
>>>>> + * @userptr:                when memory is V4L2_MEMORY_USERPTR, a userspace pointer pointing
>>>>> + *                  to this plane.
>>>>> + * @dmabuf_fd:              when memory is V4L2_MEMORY_DMABUF, a userspace file descriptor
>>>>> + *                  associated with this plane.
>>>>> + * @offset:         offset in the memory buffer where the plane starts.
>>>>> + * @memory:         enum v4l2_memory; the method, in which the actual video
>>>>> + *                  data is passed
>>>>> + * @reserved:               extra space reserved for future fields, must be set to 0.
>>>>> + *
>>>>> + *
>>>>> + * Buffers consist of one or more planes, e.g. an YCbCr buffer with two planes
>>>>> + * can have one plane for Y, and another for interleaved CbCr components.
>>>>> + * Each plane can reside in a separate memory buffer, or even in
>>>>> + * a completely separate memory node (e.g. in embedded devices).
>>>>> + */
>>>>> +struct v4l2_ext_plane {
>>>>> +    __u32 buffer_length;
>>>>> +    __u32 plane_length;
>>>>> +    union {
>>>>> +            __u32 mem_offset;
>>>>> +            __u64 userptr;
>>>>> +            __s32 dmabuf_fd;
>>>>> +    } m;
>>>>> +    __u32 offset;
>>>>
>>>> I'd rename this plane_offset. I think some reordering would make this struct easier
>>>> to understand:
>>>>
>>>> struct v4l2_ext_plane {
>>>>       __u32 buffer_length;
>>>>       __u32 plane_offset;
>>>>       __u32 plane_length;
>>>>       __u32 memory;
>>>>       union {
>>>>               __u32 mem_offset;
>>>>               __u64 userptr;
>>>>               __s32 dmabuf_fd;
>>>>       } m;
>>>>       __u32 reserved[4];
>>>> };
>>>>
>>>>> +    __u32 memory;
>>>>> +    __u32 reserved[4];
>>>>> +};
>>>
>>> Ok, I'll apply this to the next version.
>>>
>>>>
>>>> What is not clear is how to tell the different between a single buffer containing
>>>> multiple planes, and using a separate buffer per plane. E.g. what would this look
>>>> like for V4L2_PIX_FMT_YVU420, V4L2_PIX_FMT_YUV420M and a theoretical variant of
>>>> V4L2_PIX_FMT_YUV420M where the luma plane has its own buffer and the two chroma
>>>> planes are also combined in a single buffer?
>>>>
>>>> I would guess that the m union is set to 0 if the plane is part of the buffer
>>>> defined in the previous plane?
>>>
>>> The difference would be if m are equal or differ between planes, example:
>>>
>>> For V4L2_PIX_FMT_YVU420:
>>>
>>>     Y:
>>>         plane_offset = 0
>>>         m.dmabuf_fd = 3
>>>     Cb:
>>>         plane_offset = 300
>>>         m.dmabuf_fd = 3
>>>     Cr:
>>>         plane_offset = 375
>>>         m.dmabuf_fd = 3
>>>
>>> For V4L2_PIX_FMT_YVU420M:
>>>
>>>     Y:
>>>         plane_offset = 0
>>>         m.dmabuf_fd = 4
>>>     Cb:
>>>         plane_offset = 0
>>>         m.dmabuf_fd = 5
>>>     Cr:
>>>         plane_offset = 0
>>>         m.dmabuf_fd = 6
>>>
>>>
>>> Does it make sense?
>>>
>>
>> Actually all the 3 file descriptors can still point to the same
>> buffer, because they might have been dup()ed. The kernel needs to
>> resolve the file descriptors into struct dma_buf and then check
>> whether it's one or more buffers.
> 
> Right, thanks for this.
> 
>>
>> In fact, dup()ed FD for each plane is quite a common case in other
>> APIs, e.g. EGL, but current V4L2 API can't handle it. In Chromium we
>> basically work around it by assuming that if we receive a buffer for a
>> V4L2 device that only supports non-M formats, then we can safely
>> ignore all but first FD. The new API gives the ability to handle the
>> case properly, with full validation by the kernel.
>>
>>>>
>>>>> +
>>>>>  /**
>>>>>   * struct v4l2_buffer - video buffer info
>>>>>   * @index:  id number of the buffer
>>>>> @@ -1057,6 +1092,33 @@ struct v4l2_buffer {
>>>>>      };
>>>>>  };
>>>>>
>>>>> +/**
>>>>> + * struct v4l2_ext_buffer - extended video buffer info
>>>>> + * @index:  id number of the buffer
>>>>> + * @type:   V4L2_BUF_TYPE_VIDEO_CAPTURE or V4L2_BUF_TYPE_VIDEO_OUTPUT
>>>>> + * @flags:  buffer informational flags
>>>>> + * @field:  enum v4l2_field; field order of the image in the buffer
>>>>> + * @timestamp:      frame timestamp
>>>>> + * @sequence:       sequence count of this frame
>>>>> + * @planes: per-plane buffer information
>>>>> + * @request_fd:     fd of the request that this buffer should use
>>>>> + * @reserved:       extra space reserved for future fields, must be set to 0
>>>>> + *
>>>>> + * Contains data exchanged by application and driver using one of the Streaming
>>>>> + * I/O methods.
>>>>> + */
>>>>> +struct v4l2_ext_buffer {
>>>>> +    __u32 index;
>>>>> +    __u32 type;
>>>>> +    __u32 field;
>>>>> +    __u32 sequence;
>>>>> +    __u64 flags;
>>>>> +    __u64 timestamp;
>>>>> +    struct v4l2_ext_plane planes[VIDEO_MAX_PLANES];
>>>>> +    __s32 request_fd;
>>>>> +    __u32 reserved[9];
>>>>> +};
>>>>
>>>> Brainstorming:
>>>>
>>>> Some ideas I have to make it easier to support mid stream resolution/colorimetry
>>>> changes:
>>>>
>>>> Adding width and height would support resolution changes (requires the use of
>>>> CREATE_BUFS to ensure the allocated buffers are large enough, of course). If that
>>>> information is provided here, then there are no race conditions.
>>>>
>>>> Same for adding the colorimetry fields here, this too can change on the fly (esp.
>>>> with HDMI), so reporting this information here avoids race conditions as well.
>>>
>>> Right, do you think this is something we can discuss later in a different RFC?
>>> So we can have a better view on how dynamic resolution change would be used?
>>>
>>> We can add more reserved fields or maybe try to do something to what has been
>>> discussed in about extensible system calls [1]
>>>
>>> [1] https://lwn.net/Articles/830666/
>>>
>>>>
>>>> And thirdly, I would like to have a __u64 boot_timestamp field containing the
>>>> CLOCK_BOOTTIME of when the vb2_buffer_done() was called. The problem with 'timestamp'
>>>> is that for m2m devices it is just copied and that for other devices it can have
>>>> different meanings depending on the timestamp buffer flags.
>>>>
>>>> There also have been requests for CLOCK_BOOTTIME support, so this might be a good time
>>>> to add support for this. That way you know exactly when the driver was finished with
>>>> the buffer and that helps in detecting missed frames or instrumentation.
>>>
>>> I don't mind adding it. Does it make sense to have both timestamp and boot_timestamp?
>>>
>>
>> I think this is quite independent from the ext API work. AFAIR there
>> was an RFC to request the timestamp source from the userspace by the
>> flags field in QBUF, which would work with the existing API as well,
>> or it wasn't posted in the end?

It's not about selecting a specific clock source. I think that option 4 as described
below would work for that.

This problem I'm describing here is specific to m2m devices where the timestamp is
either just passed through untouched, or it is used as an identifier for a buffer
for use with stateless decoders.

In both cases you cannot use the timestamp as a proper timestamp that tells you when
the buffer was marked done by the driver. So this is about adding a second timestamp
field (timestamp_done or something like that). Whether this would be hardcoded as using
CLOCK_BOOTTIME or uses the same clock source as selected through a control is something
that can be discussed, but since it does require a new field I believe this is part of
this proposal.

Regards,

	Hans

> 
> I was recalling the discussions we had regarding this:
> 
> 1.
>     This first attempt in the uvc driver is to use a specific kernel parameter for that case:
>     https://patchwork.kernel.org/patch/10644887/
>     The conclusion that the support should be in the core API and not driver specific.
> 
> 2.
>     Then an attempt to add global v4l2 support was sent with the Mediatek patch series:
>     https://patchwork.linuxtv.org/patch/60878/
>     The major problem is that clock type should be something selectable by userspace, and
>     not pre-defined by the driver.
> 
> 3.
>     Another idea was to use the 'flags' field in the structs v4l2_requestbuffers and
>     v4l2_create_buffers.
>     But this field was removed in
>     129134e5415d ("media: media/v4l2: remove V4L2_FLAG_MEMORY_NON_CONSISTENT flag")
>     The major concern with this approach was with the uAPI, since it doesn't make much
>     sense to select a clock when creating buffers.
> 
> 4.
>     Another suggestion by Nicolas Dufresne was to add this as a menu control so that userspace
>     can choose the clock for the timestamps from a given list, the enum in the list can also match
>     the clocks ids.
>     We would need to add a new buf flag in struct v4l2_buffer, like V4L2_BUF_FLAG_TIMESTAMP_OTHER,
>     which would be "as specified through controls ...."
> 
> 
> So my current question is, should we have both __u32 timestamp and __u32 boottimestamp?
> Or should we have a mechanism that allows switching from one to the other and use
> a single field? And if this mechanism should be implemented in both APIs? Can this be
> defined later?
> 
> 
> Please, let me know your thoughts.
> 
> Thanks,
> Helen
> 
>>
>>>>
>>>>> +
>>>>>  #ifndef __KERNEL__
>>>>>  /**
>>>>>   * v4l2_timeval_to_ns - Convert timeval to nanoseconds
>>>>> @@ -2523,6 +2585,29 @@ struct v4l2_create_buffers {
>>>>>      __u32                   reserved[6];
>>>>>  };
>>>>>
>>>>> +/**
>>>>> + * struct v4l2_ext_create_buffers - VIDIOC_EXT_CREATE_BUFS argument
>>>>> + * @index:  on return, index of the first created buffer
>>>>> + * @count:  entry: number of requested buffers,
>>>>> + *          return: number of created buffers
>>>>> + * @memory: enum v4l2_memory; buffer memory type
>>>>> + * @capabilities: capabilities of this buffer type.
>>>>> + * @format: frame format, for which buffers are requested
>>>>> + * @flags:  additional buffer management attributes (ignored unless the
>>>>> + *          queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS capability
>>>>> + *          and configured for MMAP streaming I/O).
>>>>> + * @reserved:       extra space reserved for future fields, must be set to 0
>>>>> + */
>>>>> +struct v4l2_ext_create_buffers {
>>>>> +    __u32                           index;
>>>>> +    __u32                           count;
>>>>> +    __u32                           memory;
>>>>> +    __u32                           capabilities;
>>>>> +    struct v4l2_ext_pix_format      format;
>>>>
>>>> The reality is that the only field that is ever used in the original v4l2_format
>>>> struct is sizeimage. So this can be replaced with:
>>>>
>>>>       __u32                           plane_size[VIDEO_MAX_PLANES];
>>>>
>>>> (the field name I picked is debatable, but you get the idea)
>>>>
>>>> The main purpose of CREATE_BUFS is to add new buffers with larger sizes than
>>>> is needed for the current format. The original idea of using struct v4l2_format
>>>> was that drivers would use the full format information to calculate the
>>>> memory size, but that was just much too complicated to implement and nobody
>>>> ever used that. Only the sizeimage field was ever used.
>>>
>>> Right, I'll update this in next version, This should simplify things.
>>>
>>
>> I think this might need a bit more discussion. How would the userspace
>> know what size is enough for the desired resolution? The hardware
>> and/or drivers often have various alignment/padding restrictions,
>> which might not be easy to guess for the userspace.
>>
>> Also I don't quite understand what's so complicated in handling the
>> full format, or at least the most important parts of it. The
>> implementation of TRY_FMT/S_FMT, which exists in every driver, should
>> already be able to calculate the right plane sizes.
>>
>> Best regards,
>> Tomasz
>>
>>>
>>> Thanks,
>>> Helen
>>>
>>>>
>>>>> +    __u32                           flags;
>>>>> +    __u32 reserved[5];
>>>>> +};
>>>>> +
>>>>>  /*
>>>>>   *  I O C T L   C O D E S   F O R   V I D E O   D E V I C E S
>>>>>   *
>>>>> @@ -2626,6 +2711,11 @@ struct v4l2_create_buffers {
>>>>>  #define VIDIOC_G_EXT_PIX_FMT        _IOWR('V', 104, struct v4l2_ext_pix_format)
>>>>>  #define VIDIOC_S_EXT_PIX_FMT        _IOWR('V', 105, struct v4l2_ext_pix_format)
>>>>>  #define VIDIOC_TRY_EXT_PIX_FMT      _IOWR('V', 106, struct v4l2_ext_pix_format)
>>>>> +#define VIDIOC_EXT_CREATE_BUFS      _IOWR('V', 107, struct v4l2_ext_create_buffers)
>>>>> +#define VIDIOC_EXT_QUERYBUF _IOWR('V', 108, struct v4l2_ext_buffer)
>>>>> +#define VIDIOC_EXT_QBUF             _IOWR('V', 109, struct v4l2_ext_buffer)
>>>>> +#define VIDIOC_EXT_DQBUF    _IOWR('V', 110, struct v4l2_ext_buffer)
>>>>> +#define VIDIOC_EXT_PREPARE_BUF      _IOWR('V', 111, struct v4l2_ext_buffer)
>>>>>
>>>>>  /* Reminder: when adding new ioctls please add support for them to
>>>>>     drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
>>>>>
>>>>
>>>> Regards,
>>>>
>>>>       Hans
>>>>

