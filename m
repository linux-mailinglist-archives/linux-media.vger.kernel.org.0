Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15BF822EC46
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 14:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728414AbgG0MgO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 08:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727078AbgG0MgO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 08:36:14 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00375C061794
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 05:36:13 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id a8so12008276edy.1
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 05:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x6caQUjexH2eAZHZxrKkjTMYYhIZR/WDASSA74m2eu8=;
        b=OiTflPpgY9Jcs6ZW5WSJtCWGR0RVMVivQ+3rv3KjYXDSrf7/bj4/gK1jpYSbwmnYwd
         P8D31958M+sfgH5XdZH6hxKdHaQsYF85GF8k0mVNgaQQ8Dt5OSWFcDOTNdt1ZbMX+Fq/
         Q3iZ1i7kISG1s1rTbnvt9RVkTjGw9Vxb8p8qU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x6caQUjexH2eAZHZxrKkjTMYYhIZR/WDASSA74m2eu8=;
        b=D6uRrhe77SDKG2m6t7qFjMtaE/0N6+kNfHx131FM8KilWhW3QbVz8WH8VdI0Mb2p0/
         FvKj3V24kD6TRjUq4f+9/dvUzzoAg38vcRSfyik+AadBvn+maZGlgriU9Dg7vhMqn0pQ
         EUOSANATJQVwoVt0acVe0/5u1EkE+c9JwEueVn3/AZQTjXdmIfYev/6Ym+fam1r8QCQU
         cVwbMTlr+12eVjmXeGUXfKeWDsALwFf1CWf0rBL81275yyEhSlAByyFWisXDxjD0QMfV
         COyipEDR6iU/RNxSsHIukvENV27vO8Pim1PbPrieSa4ofBK0hx+FRAm0XOCIzGNo6B+4
         I2Ug==
X-Gm-Message-State: AOAM531toPdmNrRABckukGpoSsc6xdonhXjNNEn0csIkffusPabi9HSU
        G38WNE2GZCGCGR/zJYZimLWEPtoeZHAcNg==
X-Google-Smtp-Source: ABdhPJxiIJ7NkawYQJ0MGF5AS3LfBRo9dkxMxnnTFUnc6MEh0WrWJDSslWoc+25E82ct5eNJwFyAzw==
X-Received: by 2002:a50:d80c:: with SMTP id o12mr19453257edj.244.1595853372378;
        Mon, 27 Jul 2020 05:36:12 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id o15sm7449162edv.55.2020.07.27.05.36.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 05:36:11 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id a14so14734813wra.5
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 05:36:10 -0700 (PDT)
X-Received: by 2002:adf:ec45:: with SMTP id w5mr20525305wrn.415.1595853370267;
 Mon, 27 Jul 2020 05:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200717115435.2632623-1-helen.koike@collabora.com>
 <20200717115435.2632623-3-helen.koike@collabora.com> <5665bbd4-75e2-ec73-ba24-54e5981eb4ac@linaro.org>
 <e4d4c88b-2724-76c0-fff2-2404d5073ae4@collabora.com> <0fd9e21d-4317-dbed-c035-9c1523e0195b@linaro.org>
 <15067dff-c802-d6f0-a2f8-817fb487b30d@collabora.com> <b11b0887-ce9e-63ab-9f74-7ad3dbda922b@linaro.org>
In-Reply-To: <b11b0887-ce9e-63ab-9f74-7ad3dbda922b@linaro.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 27 Jul 2020 14:35:58 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BJcTmyt5Ae5N8ZqvVZAN_Ta+j71FTG_C=R9sT_aHJdbw@mail.gmail.com>
Message-ID: <CAAFQd5BJcTmyt5Ae5N8ZqvVZAN_Ta+j71FTG_C=R9sT_aHJdbw@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] media: v4l2: Add extended buffer operations
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stanimir,

On Fri, Jul 24, 2020 at 3:17 PM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
>
>
> On 7/21/20 5:40 PM, Helen Koike wrote:
> >
> >
> > On 7/21/20 11:30 AM, Stanimir Varbanov wrote:
> >> Hi Helen,
> >>
> >> On 7/21/20 4:54 PM, Helen Koike wrote:
> >>> Hi,
> >>>
> >>> On 7/21/20 8:26 AM, Stanimir Varbanov wrote:
> >>>>
> >>>>
> >>>> On 7/17/20 2:54 PM, Helen Koike wrote:
> >>>>> From: Hans Verkuil <hans.verkuil@cisco.com>
> >>>>>
> >>>>> Those extended buffer ops have several purpose:
> >>>>> 1/ Fix y2038 issues by converting the timestamp into an u64 counting
> >>>>>    the number of ns elapsed since 1970
> >>>>> 2/ Unify single/multiplanar handling
> >>>>> 3/ Add a new start offset field to each v4l2 plane buffer info struct
> >>>>>    to support the case where a single buffer object is storing all
> >>>>>    planes data, each one being placed at a different offset
> >>>>>
> >>>>> New hooks are created in v4l2_ioctl_ops so that drivers can start using
> >>>>> these new objects.
> >>>>>
> >>>>> The core takes care of converting new ioctls requests to old ones
> >>>>> if the driver does not support the new hooks, and vice versa.
> >>>>>
> >>>>> Note that the timecode field is gone, since there doesn't seem to be
> >>>>> in-kernel users. We can be added back in the reserved area if needed or
> >>>>> use the Request API to collect more metadata information from the
> >>>>> frame.
> >>>>>
> >>>>> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> >>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> >>>>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> >>>>> ---
> >>>>> Changes in v4:
> >>>>> - Use v4l2_ext_pix_format directly in the ioctl, drop v4l2_ext_format,
> >>>>> making V4L2_BUF_TYPE_VIDEO_[OUTPUT,CAPTURE] the only valid types.
> >>>>> - Drop VIDIOC_EXT_EXPBUF, since the only difference from VIDIOC_EXPBUF
> >>>>> was that with VIDIOC_EXT_EXPBUF we could export multiple planes at once.
> >>>>> I think we can add this later, so I removed it from this RFC to simplify it.
> >>>>> - Remove num_planes field from struct v4l2_ext_buffer
> >>>>> - Add flags field to struct v4l2_ext_create_buffers
> >>>>> - Reformulate struct v4l2_ext_plane
> >>>>> - Fix some bugs caught by v4l2-compliance
> >>>>> - Rebased on top of media/master (post 5.8-rc1)
> >>>>>
> >>>>> Changes in v3:
> >>>>> - Rebased on top of media/master (post 5.4-rc1)
> >>>>>
> >>>>> Changes in v2:
> >>>>> - Add reserved space to v4l2_ext_buffer so that new fields can be added
> >>>>>   later on
> >>>>> ---
> >>>>>  drivers/media/v4l2-core/v4l2-dev.c   |  29 ++-
> >>>>>  drivers/media/v4l2-core/v4l2-ioctl.c | 349 +++++++++++++++++++++++++--
> >>>>>  include/media/v4l2-ioctl.h           |  26 ++
> >>>>>  include/uapi/linux/videodev2.h       |  89 +++++++
> >>>>>  4 files changed, 471 insertions(+), 22 deletions(-)
> >>>>>
> >>>>
> >>>> <cut>
> >>>>
> >>>>> +/**
> >>>>> + * struct v4l2_ext_plane - extended plane buffer info
> >>>>> + * @buffer_length:       size of the entire buffer in bytes, should fit
> >>>>> + *                       @offset + @plane_length
> >>>>> + * @plane_length:        size of the plane in bytes.
> >>>>> + * @userptr:             when memory is V4L2_MEMORY_USERPTR, a userspace pointer pointing
> >>>>> + *                       to this plane.
> >>>>> + * @dmabuf_fd:           when memory is V4L2_MEMORY_DMABUF, a userspace file descriptor
> >>>>> + *                       associated with this plane.
> >>>>> + * @offset:              offset in the memory buffer where the plane starts. If
> >>>>> + *                       V4L2_MEMORY_MMAP is used, then it can be a "cookie" that
> >>>>> + *                       should be passed to mmap() called on the video node.
> >>>>> + * @reserved:            extra space reserved for future fields, must be set to 0.
> >>>>> + *
> >>>>> + *
> >>>>> + * Buffers consist of one or more planes, e.g. an YCbCr buffer with two planes
> >>>>> + * can have one plane for Y, and another for interleaved CbCr components.
> >>>>> + * Each plane can reside in a separate memory buffer, or even in
> >>>>> + * a completely separate memory node (e.g. in embedded devices).
> >>>>> + */
> >>>>> +struct v4l2_ext_plane {
> >>>>> + __u32 buffer_length;
> >>>>> + __u32 plane_length;
> >>>>> + union {
> >>>>> +         __u64 userptr;
> >>>>> +         __s32 dmabuf_fd;
> >>>>> + } m;
> >>>>> + __u32 offset;
> >>>>> + __u32 reserved[4];
> >>>>> +};
> >>>>> +
> >>>>>  /**
> >>>>>   * struct v4l2_buffer - video buffer info
> >>>>>   * @index:       id number of the buffer
> >>>>> @@ -1055,6 +1086,36 @@ struct v4l2_buffer {
> >>>>>   };
> >>>>>  };
> >>>>>
> >>>>> +/**
> >>>>> + * struct v4l2_ext_buffer - extended video buffer info
> >>>>> + * @index:       id number of the buffer
> >>>>> + * @type:        V4L2_BUF_TYPE_VIDEO_CAPTURE or V4L2_BUF_TYPE_VIDEO_OUTPUT
> >>>>> + * @flags:       buffer informational flags
> >>>>> + * @field:       enum v4l2_field; field order of the image in the buffer
> >>>>> + * @timestamp:   frame timestamp
> >>>>> + * @sequence:    sequence count of this frame
> >>>>> + * @memory:      enum v4l2_memory; the method, in which the actual video data is
> >>>>> + *               passed
> >>>>> + * @planes:      per-plane buffer information
> >>>>> + * @request_fd:  fd of the request that this buffer should use
> >>>>> + * @reserved:    extra space reserved for future fields, must be set to 0
> >>>>> + *
> >>>>> + * Contains data exchanged by application and driver using one of the Streaming
> >>>>> + * I/O methods.
> >>>>> + */
> >>>>> +struct v4l2_ext_buffer {
> >>>>> + __u32 index;
> >>>>> + __u32 type;
> >>>>> + __u32 flags;
> >>>>> + __u32 field;
> >>>>> + __u64 timestamp;
> >>>>> + __u32 sequence;
> >>>>> + __u32 memory;
> >>>>> + __u32 request_fd;
> >>>>
> >>>> This should be __s32, at least for consistency with dmabuf_fd?
> >>>
> >>> I see that in struct v4l2_buffer, we have __s32, I don't mind changing it
> >>> to keep the consistency, I just don't see where this value can be a negative
> >>> number.
> >>
> >> here
> >> https://elixir.bootlin.com/linux/v5.8-rc4/source/drivers/media/common/videobuf2/videobuf2-v4l2.c#L134
> >
> > I saw that -1 is used to signal an invalid value, but I was just wondering when request_fd = 0 is valid.
>
> The request_fd is valid system wide file descriptor and request_fd = 0
> is STDIN_FILENO thus IMO it is valid as far as we call it file descriptor.
>
> >
> >>
> >>>
> >>>>
> >>>>> + struct v4l2_ext_plane planes[VIDEO_MAX_PLANES];
> >>>>> + __u32 reserved[4];
> >>>>
> >>>> I think we have to reserve more words here for future extensions.
> >>>>
> >>>> I'd like also to propose to add here __s32 metadata_fd. The idea behind
> >>>> this is to have a way to pass per-frame metadata dmabuf buffers for
> >>>> synchronous type of metadata where the metadata is coming at the same
> >>>> time with data buffers. What would be the format of the metadata buffer
> >>>> is TBD.
> >>>>
> >>>> One option for metadata buffer format could be:
> >>>>
> >>>> header {
> >>>>    num_ctrls
> >>>>    array_of_ctrls [0..N]
> >>>>            ctrl_id
> >>>>            ctrl_size
> >>>>            ctrl_offset
> >>>> }
> >>>>
> >>>> data {
> >>>>    cid0    //offset of cid0 in dmabuf buffer
> >>>>    cid1
> >>>>    cidN
> >>>> }
> >>>
> >>> Would it be better if, instead of adding a medatata_fd inside struct v4l2_ext_buffer,
> >>> we create a new ioctl that gets this structs for the controls and sync them using the
> >>> Request API ?
>
> New ioctl means new syscall. There are use-cases where encoding
> framerate is 480 fps (and more in near future, for example 960fps) this
> means 480 more syscalls per second. I don't think this is optimal and
> scalable solution at all.
>

Do you happen to have some data to confirm that it's indeed a problem?

Best regards,
Tomasz

> >>
> >> no, this solution has performance drawbacks when the metadata is big,
> >> think of 64K.
> >
> > Why? You could still use a dmabuf in this new ioctl, no?
> >
> >
> > Regards,
> > Helen
> >
> >>
> >>>
> >>> I'd like to avoid too much metadata in the buffer object.
> >>>
> >>> Regards,
> >>> Helen
> >>>
> >>>>
> >>>> This will make easy to get concrete ctrl id without a need to parse the
> >>>> whole metadata buffer. Also using dmabuf we don't need to copy data
> >>>> between userspace <-> kernelspace (just cache syncs through
> >>>> begin/end_cpu_access).
> >>>>
> >>>> The open question is who will validate the metadata buffer when it comes
> >>>> from userspace. The obvious answer is v4l2-core but looking into DRM
> >>>> subsytem they give more freedom to the drivers, and just provide generic
> >>>> helpers which are not mandatory.
> >>>>
> >>>> I guess this will be a voice in the wilderness but I wanted to know your
> >>>> opinion.
> >>>>
> >>>>> +};
> >>>>> +
> >>>>>  #ifndef __KERNEL__
> >>>>>  /**
> >>>>>   * v4l2_timeval_to_ns - Convert timeval to nanoseconds
> >>>>> @@ -2520,6 +2581,29 @@ struct v4l2_create_buffers {
> >>>>>   __u32                   reserved[6];
> >>>>>  };
> >>>>>
> >>>>> +/**
> >>>>> + * struct v4l2_ext_create_buffers - VIDIOC_EXT_CREATE_BUFS argument
> >>>>> + * @index:       on return, index of the first created buffer
> >>>>> + * @count:       entry: number of requested buffers,
> >>>>> + *               return: number of created buffers
> >>>>> + * @memory:      enum v4l2_memory; buffer memory type
> >>>>> + * @capabilities: capabilities of this buffer type.
> >>>>> + * @format:      frame format, for which buffers are requested
> >>>>> + * @flags:       additional buffer management attributes (ignored unless the
> >>>>> + *               queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS capability
> >>>>> + *               and configured for MMAP streaming I/O).
> >>>>> + * @reserved:    extra space reserved for future fields, must be set to 0
> >>>>> + */
> >>>>> +struct v4l2_ext_create_buffers {
> >>>>> + __u32                           index;
> >>>>> + __u32                           count;
> >>>>> + __u32                           memory;
> >>>>> + struct v4l2_ext_pix_format      format;
> >>>>> + __u32                           capabilities;
> >>>>> + __u32                           flags;
> >>>>> + __u32 reserved[4];
> >>>>> +};
> >>>>> +
> >>>>>  /*
> >>>>>   *       I O C T L   C O D E S   F O R   V I D E O   D E V I C E S
> >>>>>   *
> >>>>> @@ -2623,6 +2707,11 @@ struct v4l2_create_buffers {
> >>>>>  #define VIDIOC_G_EXT_PIX_FMT     _IOWR('V', 104, struct v4l2_ext_pix_format)
> >>>>>  #define VIDIOC_S_EXT_PIX_FMT     _IOWR('V', 105, struct v4l2_ext_pix_format)
> >>>>>  #define VIDIOC_TRY_EXT_PIX_FMT   _IOWR('V', 106, struct v4l2_ext_pix_format)
> >>>>> +#define VIDIOC_EXT_CREATE_BUFS   _IOWR('V', 107, struct v4l2_ext_create_buffers)
> >>>>> +#define VIDIOC_EXT_QUERYBUF      _IOWR('V', 108, struct v4l2_ext_buffer)
> >>>>> +#define VIDIOC_EXT_QBUF          _IOWR('V', 109, struct v4l2_ext_buffer)
> >>>>> +#define VIDIOC_EXT_DQBUF _IOWR('V', 110, struct v4l2_ext_buffer)
> >>>>> +#define VIDIOC_EXT_PREPARE_BUF   _IOWR('V', 111, struct v4l2_ext_buffer)
> >>>>>
> >>>>>  /* Reminder: when adding new ioctls please add support for them to
> >>>>>     drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
> >>>>>
> >>>>
> >>
>
> --
> regards,
> Stan
