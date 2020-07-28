Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA58F23114D
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 20:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732193AbgG1SJD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 14:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732189AbgG1SJC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 14:09:02 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EC29C0619D2
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 11:09:02 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id x5so411104wmi.2
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 11:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zykf1czy4WaVDlWzH97KJpRjFvN5BetCzFh2Q+1sfy0=;
        b=Ng9CE+wSlzZqIH1Zu8+fhZDEpKZDdoJSS5JB3BqkjVcnnrm7+gBzbql4g9YcmwRiYf
         OiLJHNAW4GxvwfG7h3Bd8lKSCs1RNSN459GerQOo9woppUL6V//AqjscGKfVKE4mBENM
         56yfQgIEPmEdkW9kXIuzH4OlxQc3oAeMcsXSRqLshQdnfkvKGbI/gJIwHXAz+ZsHyTcQ
         TcgC5KmrH9Tf9Uc/nHb3LTq7lWkECBQ/k1PDkdSxJgJFPZkz7g+h/ZJPOq6wBFhC32WJ
         M5XHD9JjUKUgUInAkscmuhQJFxjNW7Ztorqri2e8UH29quAQLdXpGe2w29EDkTo5tvbh
         m/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zykf1czy4WaVDlWzH97KJpRjFvN5BetCzFh2Q+1sfy0=;
        b=m4tFFcpT6aSjKb9aqup8TJWBlWbRFbm45RXf8pS9LyiyjVpfQDcj9zF12BYFnyIu+1
         HBtcgL4KtFKVtDlafvNo+DxILcd9cPiVUuK2vh35H6hFuFqK9b3wH3Y2XDAjHGQaxm8I
         j9iMjAcK8DFT61TyGPJyScXmNMBj0wL+08UuRxklUixr+vZG9cyjvnfuUtmkz0I3b63v
         V0BT6wbr7Cu97M9syV4JSZ9B5z2nzRsKgpGj0u5Foiw8bVWV+QtEkh7Ql8apR3hTdi56
         /5Z+LBNiBeuz2ychglufZP2dLuBr8COMtp+oWX5ICvPXlpYtjWqbHEb2JgHVhSqnaxFS
         zxAA==
X-Gm-Message-State: AOAM530fZp4UaOaMSwk70w4vthNZxrDqDKOzjzb8tQQGUWjO4sBcwMPM
        FdUjJhuCN0TvgDj4wQO2wWy7Vg==
X-Google-Smtp-Source: ABdhPJyUsY23zh62zsHIl8ONOyfqpDbU61Ceo6v+9oa0yb5adrBA693Gk3dKupXQ26MoUh38AmmMyg==
X-Received: by 2002:a1c:a757:: with SMTP id q84mr4889323wme.1.1595959741010;
        Tue, 28 Jul 2020 11:09:01 -0700 (PDT)
Received: from [192.168.1.7] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id 5sm5182317wmk.9.2020.07.28.11.08.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2020 11:09:00 -0700 (PDT)
Subject: Re: [PATCH v4 2/6] media: v4l2: Add extended buffer operations
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
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
        frkoenig@chromium.org, Maxime Jourdan <mjourdan@baylibre.com>
References: <20200717115435.2632623-1-helen.koike@collabora.com>
 <20200717115435.2632623-3-helen.koike@collabora.com>
 <5665bbd4-75e2-ec73-ba24-54e5981eb4ac@linaro.org>
 <e4d4c88b-2724-76c0-fff2-2404d5073ae4@collabora.com>
 <0fd9e21d-4317-dbed-c035-9c1523e0195b@linaro.org>
 <15067dff-c802-d6f0-a2f8-817fb487b30d@collabora.com>
 <b11b0887-ce9e-63ab-9f74-7ad3dbda922b@linaro.org>
 <CAAFQd5BJcTmyt5Ae5N8ZqvVZAN_Ta+j71FTG_C=R9sT_aHJdbw@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <ef1327d4-1cea-d87c-8a4f-0bb2b56508df@linaro.org>
Date:   Tue, 28 Jul 2020 21:08:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5BJcTmyt5Ae5N8ZqvVZAN_Ta+j71FTG_C=R9sT_aHJdbw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On 7/27/20 3:35 PM, Tomasz Figa wrote:
> Hi Stanimir,
> 
> On Fri, Jul 24, 2020 at 3:17 PM Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>>
>>
>>
>> On 7/21/20 5:40 PM, Helen Koike wrote:
>>>
>>>
>>> On 7/21/20 11:30 AM, Stanimir Varbanov wrote:
>>>> Hi Helen,
>>>>
>>>> On 7/21/20 4:54 PM, Helen Koike wrote:
>>>>> Hi,
>>>>>
>>>>> On 7/21/20 8:26 AM, Stanimir Varbanov wrote:
>>>>>>
>>>>>>
>>>>>> On 7/17/20 2:54 PM, Helen Koike wrote:
>>>>>>> From: Hans Verkuil <hans.verkuil@cisco.com>
>>>>>>>
>>>>>>> Those extended buffer ops have several purpose:
>>>>>>> 1/ Fix y2038 issues by converting the timestamp into an u64 counting
>>>>>>>    the number of ns elapsed since 1970
>>>>>>> 2/ Unify single/multiplanar handling
>>>>>>> 3/ Add a new start offset field to each v4l2 plane buffer info struct
>>>>>>>    to support the case where a single buffer object is storing all
>>>>>>>    planes data, each one being placed at a different offset
>>>>>>>
>>>>>>> New hooks are created in v4l2_ioctl_ops so that drivers can start using
>>>>>>> these new objects.
>>>>>>>
>>>>>>> The core takes care of converting new ioctls requests to old ones
>>>>>>> if the driver does not support the new hooks, and vice versa.
>>>>>>>
>>>>>>> Note that the timecode field is gone, since there doesn't seem to be
>>>>>>> in-kernel users. We can be added back in the reserved area if needed or
>>>>>>> use the Request API to collect more metadata information from the
>>>>>>> frame.
>>>>>>>
>>>>>>> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
>>>>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>>>>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>>>>>>> ---
>>>>>>> Changes in v4:
>>>>>>> - Use v4l2_ext_pix_format directly in the ioctl, drop v4l2_ext_format,
>>>>>>> making V4L2_BUF_TYPE_VIDEO_[OUTPUT,CAPTURE] the only valid types.
>>>>>>> - Drop VIDIOC_EXT_EXPBUF, since the only difference from VIDIOC_EXPBUF
>>>>>>> was that with VIDIOC_EXT_EXPBUF we could export multiple planes at once.
>>>>>>> I think we can add this later, so I removed it from this RFC to simplify it.
>>>>>>> - Remove num_planes field from struct v4l2_ext_buffer
>>>>>>> - Add flags field to struct v4l2_ext_create_buffers
>>>>>>> - Reformulate struct v4l2_ext_plane
>>>>>>> - Fix some bugs caught by v4l2-compliance
>>>>>>> - Rebased on top of media/master (post 5.8-rc1)
>>>>>>>
>>>>>>> Changes in v3:
>>>>>>> - Rebased on top of media/master (post 5.4-rc1)
>>>>>>>
>>>>>>> Changes in v2:
>>>>>>> - Add reserved space to v4l2_ext_buffer so that new fields can be added
>>>>>>>   later on
>>>>>>> ---
>>>>>>>  drivers/media/v4l2-core/v4l2-dev.c   |  29 ++-
>>>>>>>  drivers/media/v4l2-core/v4l2-ioctl.c | 349 +++++++++++++++++++++++++--
>>>>>>>  include/media/v4l2-ioctl.h           |  26 ++
>>>>>>>  include/uapi/linux/videodev2.h       |  89 +++++++
>>>>>>>  4 files changed, 471 insertions(+), 22 deletions(-)
>>>>>>>
>>>>>>
>>>>>> <cut>
>>>>>>
>>>>>>> +/**
>>>>>>> + * struct v4l2_ext_plane - extended plane buffer info
>>>>>>> + * @buffer_length:       size of the entire buffer in bytes, should fit
>>>>>>> + *                       @offset + @plane_length
>>>>>>> + * @plane_length:        size of the plane in bytes.
>>>>>>> + * @userptr:             when memory is V4L2_MEMORY_USERPTR, a userspace pointer pointing
>>>>>>> + *                       to this plane.
>>>>>>> + * @dmabuf_fd:           when memory is V4L2_MEMORY_DMABUF, a userspace file descriptor
>>>>>>> + *                       associated with this plane.
>>>>>>> + * @offset:              offset in the memory buffer where the plane starts. If
>>>>>>> + *                       V4L2_MEMORY_MMAP is used, then it can be a "cookie" that
>>>>>>> + *                       should be passed to mmap() called on the video node.
>>>>>>> + * @reserved:            extra space reserved for future fields, must be set to 0.
>>>>>>> + *
>>>>>>> + *
>>>>>>> + * Buffers consist of one or more planes, e.g. an YCbCr buffer with two planes
>>>>>>> + * can have one plane for Y, and another for interleaved CbCr components.
>>>>>>> + * Each plane can reside in a separate memory buffer, or even in
>>>>>>> + * a completely separate memory node (e.g. in embedded devices).
>>>>>>> + */
>>>>>>> +struct v4l2_ext_plane {
>>>>>>> + __u32 buffer_length;
>>>>>>> + __u32 plane_length;
>>>>>>> + union {
>>>>>>> +         __u64 userptr;
>>>>>>> +         __s32 dmabuf_fd;
>>>>>>> + } m;
>>>>>>> + __u32 offset;
>>>>>>> + __u32 reserved[4];
>>>>>>> +};
>>>>>>> +
>>>>>>>  /**
>>>>>>>   * struct v4l2_buffer - video buffer info
>>>>>>>   * @index:       id number of the buffer
>>>>>>> @@ -1055,6 +1086,36 @@ struct v4l2_buffer {
>>>>>>>   };
>>>>>>>  };
>>>>>>>
>>>>>>> +/**
>>>>>>> + * struct v4l2_ext_buffer - extended video buffer info
>>>>>>> + * @index:       id number of the buffer
>>>>>>> + * @type:        V4L2_BUF_TYPE_VIDEO_CAPTURE or V4L2_BUF_TYPE_VIDEO_OUTPUT
>>>>>>> + * @flags:       buffer informational flags
>>>>>>> + * @field:       enum v4l2_field; field order of the image in the buffer
>>>>>>> + * @timestamp:   frame timestamp
>>>>>>> + * @sequence:    sequence count of this frame
>>>>>>> + * @memory:      enum v4l2_memory; the method, in which the actual video data is
>>>>>>> + *               passed
>>>>>>> + * @planes:      per-plane buffer information
>>>>>>> + * @request_fd:  fd of the request that this buffer should use
>>>>>>> + * @reserved:    extra space reserved for future fields, must be set to 0
>>>>>>> + *
>>>>>>> + * Contains data exchanged by application and driver using one of the Streaming
>>>>>>> + * I/O methods.
>>>>>>> + */
>>>>>>> +struct v4l2_ext_buffer {
>>>>>>> + __u32 index;
>>>>>>> + __u32 type;
>>>>>>> + __u32 flags;
>>>>>>> + __u32 field;
>>>>>>> + __u64 timestamp;
>>>>>>> + __u32 sequence;
>>>>>>> + __u32 memory;
>>>>>>> + __u32 request_fd;
>>>>>>
>>>>>> This should be __s32, at least for consistency with dmabuf_fd?
>>>>>
>>>>> I see that in struct v4l2_buffer, we have __s32, I don't mind changing it
>>>>> to keep the consistency, I just don't see where this value can be a negative
>>>>> number.
>>>>
>>>> here
>>>> https://elixir.bootlin.com/linux/v5.8-rc4/source/drivers/media/common/videobuf2/videobuf2-v4l2.c#L134
>>>
>>> I saw that -1 is used to signal an invalid value, but I was just wondering when request_fd = 0 is valid.
>>
>> The request_fd is valid system wide file descriptor and request_fd = 0
>> is STDIN_FILENO thus IMO it is valid as far as we call it file descriptor.
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>>> + struct v4l2_ext_plane planes[VIDEO_MAX_PLANES];
>>>>>>> + __u32 reserved[4];
>>>>>>
>>>>>> I think we have to reserve more words here for future extensions.
>>>>>>
>>>>>> I'd like also to propose to add here __s32 metadata_fd. The idea behind
>>>>>> this is to have a way to pass per-frame metadata dmabuf buffers for
>>>>>> synchronous type of metadata where the metadata is coming at the same
>>>>>> time with data buffers. What would be the format of the metadata buffer
>>>>>> is TBD.
>>>>>>
>>>>>> One option for metadata buffer format could be:
>>>>>>
>>>>>> header {
>>>>>>    num_ctrls
>>>>>>    array_of_ctrls [0..N]
>>>>>>            ctrl_id
>>>>>>            ctrl_size
>>>>>>            ctrl_offset
>>>>>> }
>>>>>>
>>>>>> data {
>>>>>>    cid0    //offset of cid0 in dmabuf buffer
>>>>>>    cid1
>>>>>>    cidN
>>>>>> }
>>>>>
>>>>> Would it be better if, instead of adding a medatata_fd inside struct v4l2_ext_buffer,
>>>>> we create a new ioctl that gets this structs for the controls and sync them using the
>>>>> Request API ?
>>
>> New ioctl means new syscall. There are use-cases where encoding
>> framerate is 480 fps (and more in near future, for example 960fps) this
>> means 480 more syscalls per second. I don't think this is optimal and
>> scalable solution at all.
>>
> 
> Do you happen to have some data to confirm that it's indeed a problem?

If you mean profiling data, unfortunately I don't have such. But isn't
it obvious that increasing metadata size (think of compound v4l2
controls) and new syscalls isn't scalable solution in regards to higher
framerates?

I'm open to consider any suggestion different from v4l2 controls plus
Request API.

> 
> Best regards,
> Tomasz
-- 
regards,
Stan
