Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A5E72F68EF
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 19:08:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729409AbhANSFv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 13:05:51 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51352 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726743AbhANSFt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 13:05:49 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 089061F45BDC
Subject: Re: [PATCH v5 7/7] media: docs: add documentation for the Extended
 API
To:     Hans Verkuil <hverkuil@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Brian Starkey <Brian.Starkey@arm.com>, kernel@collabora.com,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
References: <20200804192939.2251988-1-helen.koike@collabora.com>
 <20200804192939.2251988-8-helen.koike@collabora.com>
 <20201120110611.GA841224@chromium.org>
 <5feb8cc4-d2ef-46b9-82f6-af5cbb552f6a@xs4all.nl>
 <CAAFQd5C70MSUhLpkT4DNOFrVqjQ8YqHnTT+WRYKwn7pU9Y8BMQ@mail.gmail.com>
 <9dcd5184-79d3-162c-946e-319fb19f6f83@xs4all.nl>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <fc56c637-89e0-dec8-22b5-8e23385f9bc6@collabora.com>
Date:   Thu, 14 Jan 2021 15:04:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <9dcd5184-79d3-162c-946e-319fb19f6f83@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11/20/20 10:20 AM, Hans Verkuil wrote:
> On 20/11/2020 13:40, Tomasz Figa wrote:
>> On Fri, Nov 20, 2020 at 9:24 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>>
>>> On 20/11/2020 12:06, Tomasz Figa wrote:z
>>>> Hi Helen,
>>>>
>>>> On Tue, Aug 04, 2020 at 04:29:39PM -0300, Helen Koike wrote:
>>>>> Add documentation and update references in current documentation for the
>>>>> Extended API.
>>>>>
>>>>
>>>> Thank you for the patch. Please see my comments inline.
>>>>
>>>>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>>>>> ---
>>>>> Changes in v5:
>>>>> - new patch
>>>>>
>>>>>  .../userspace-api/media/v4l/buffer.rst        |   5 +
>>>>>  .../userspace-api/media/v4l/common.rst        |   1 +
>>>>>  .../userspace-api/media/v4l/dev-capture.rst   |   5 +
>>>>>  .../userspace-api/media/v4l/dev-output.rst    |   5 +
>>>>>  .../userspace-api/media/v4l/ext-api.rst       | 107 +++++++++
>>>>>  .../userspace-api/media/v4l/format.rst        |  16 +-
>>>>>  .../userspace-api/media/v4l/user-func.rst     |   5 +
>>>>>  .../media/v4l/vidioc-ext-create-bufs.rst      |  95 ++++++++
>>>>>  .../media/v4l/vidioc-ext-prepare-buf.rst      |  62 ++++++
>>>>>  .../media/v4l/vidioc-ext-qbuf.rst             | 204 ++++++++++++++++++
>>>>>  .../media/v4l/vidioc-ext-querybuf.rst         |  79 +++++++
>>>>>  .../media/v4l/vidioc-g-ext-pix-fmt.rst        | 117 ++++++++++
>>>>>  12 files changed, 697 insertions(+), 4 deletions(-)
>>>>>  create mode 100644 Documentation/userspace-api/media/v4l/ext-api.rst
>>>>>  create mode 100644 Documentation/userspace-api/media/v4l/vidioc-ext-create-bufs.rst
>>>>>  create mode 100644 Documentation/userspace-api/media/v4l/vidioc-ext-prepare-buf.rst
>>>>>  create mode 100644 Documentation/userspace-api/media/v4l/vidioc-ext-qbuf.rst
>>>>>  create mode 100644 Documentation/userspace-api/media/v4l/vidioc-ext-querybuf.rst
>>>>>  create mode 100644 Documentation/userspace-api/media/v4l/vidioc-g-ext-pix-fmt.rst
>>>>>
>>>>> diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
>>>>> index 57e752aaf414a..c832bedd64e4c 100644
>>>>> --- a/Documentation/userspace-api/media/v4l/buffer.rst
>>>>> +++ b/Documentation/userspace-api/media/v4l/buffer.rst
>>>>> @@ -27,6 +27,11 @@ such as pointers and sizes for each plane, are stored in
>>>>>  struct :c:type:`v4l2_plane` instead. In that case,
>>>>>  struct :c:type:`v4l2_buffer` contains an array of plane structures.
>>>>>
>>>>> +.. note::
>>>>> +
>>>>> +    The :ref:`ext_api` version can also be used, and it is
>>>>> +    preferable when applicable.
>>>>
>>>> Would rephrasing this as below making a bit more definitive?
>>>>
>>>>       For modern applications, these operations are replaced by their
>>>>       :ref:`ext_api` counterparts, which should be used instead.
>>>
>>> You can't say that, since especially in the beginning userspace will be running
>>> on older kernels that do not support this.
>>>
>>> This will work: "should be used instead, if supported by the driver."
>>>
>>
>> With the wrappers that the patches provide, all drivers would support
>> the new API, so this boils down to the kernel version only, not
>> specific drivers.
>>
>> Agreed, though, that application developers must be made aware that
>> the new API is only available in new kernels and old API must be used
>> for compatibility with old kernels.
> 
> Is the conversion layer fully independent of vb2? We still have older
> drivers that do not use vb2, and I'm not sure if the extended buffer
> operations work with those drivers as well. (Sorry, it's been a while
> since I last looked at this series, so I can't remember).

The conversion layer should be independent of vb2 (please check v6, I think
it is cleaner).

> 
>>
>>>>
>>>>> +
>>>>>  Dequeued video buffers come with timestamps. The driver decides at which
>>>>>  part of the frame and with which clock the timestamp is taken. Please
>>>>>  see flags in the masks ``V4L2_BUF_FLAG_TIMESTAMP_MASK`` and
>>>>> diff --git a/Documentation/userspace-api/media/v4l/common.rst b/Documentation/userspace-api/media/v4l/common.rst
>>>>> index 7d81c58a13cd7..3430e0bdad667 100644
>>>>> --- a/Documentation/userspace-api/media/v4l/common.rst
>>>>> +++ b/Documentation/userspace-api/media/v4l/common.rst
>>>>> @@ -59,6 +59,7 @@ applicable to all devices.
>>>>>      ext-ctrls-detect
>>>>>      fourcc
>>>>>      format
>>>>> +    ext-api
>>>>>      planar-apis
>>>>>      selection-api
>>>>>      crop
>>>>> diff --git a/Documentation/userspace-api/media/v4l/dev-capture.rst b/Documentation/userspace-api/media/v4l/dev-capture.rst
>>>>> index 44d3094093ab6..5077639787d92 100644
>>>>> --- a/Documentation/userspace-api/media/v4l/dev-capture.rst
>>>>> +++ b/Documentation/userspace-api/media/v4l/dev-capture.rst
>>>>> @@ -102,6 +102,11 @@ and :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl, even if :ref:`VIDIOC_S_FMT <VIDIOC
>>>>>  requests and always returns default parameters as :ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` does.
>>>>>  :ref:`VIDIOC_TRY_FMT <VIDIOC_G_FMT>` is optional.
>>>>>
>>>>> +.. note::
>>>>> +
>>>>> +    The :ref:`ext_api` version can also be used, and it is
>>>>> +    preferable when applicable.
>>>>> +
>>>>>
>>>>>  Reading Images
>>>>>  ==============
>>>>> diff --git a/Documentation/userspace-api/media/v4l/dev-output.rst b/Documentation/userspace-api/media/v4l/dev-output.rst
>>>>> index e4f2a1d8b0fc7..f8f40c708e49f 100644
>>>>> --- a/Documentation/userspace-api/media/v4l/dev-output.rst
>>>>> +++ b/Documentation/userspace-api/media/v4l/dev-output.rst
>>>>> @@ -99,6 +99,11 @@ and :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl, even if :ref:`VIDIOC_S_FMT <VIDIOC
>>>>>  requests and always returns default parameters as :ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` does.
>>>>>  :ref:`VIDIOC_TRY_FMT <VIDIOC_G_FMT>` is optional.
>>>>>
>>>>> +.. note::
>>>>> +
>>>>> +    The :ref:`ext_api` version can also be used, and it is
>>>>> +    preferable when applicable.
>>>>> +
>>>>>
>>>>>  Writing Images
>>>>>  ==============
>>>>> diff --git a/Documentation/userspace-api/media/v4l/ext-api.rst b/Documentation/userspace-api/media/v4l/ext-api.rst
>>>>> new file mode 100644
>>>>> index 0000000000000..da2a82960d22f
>>>>> --- /dev/null
>>>>> +++ b/Documentation/userspace-api/media/v4l/ext-api.rst
>>>>> @@ -0,0 +1,107 @@
>>>>> +.. Permission is granted to copy, distribute and/or modify this
>>>>> +.. document under the terms of the GNU Free Documentation License,
>>>>> +.. Version 1.1 or any later version published by the Free Software
>>>>> +.. Foundation, with no Invariant Sections, no Front-Cover Texts
>>>>> +.. and no Back-Cover Texts. A copy of the license is included at
>>>>> +.. Documentation/userspace-api/media/fdl-appendix.rst.
>>>>> +..
>>>>> +.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
>>>>> +
>>>>> +.. _ext_api:
>>>>> +
>>>>> +*************
>>>>> +Extendend API
>>>>> +*************
>>>>> +
>>>>> +Introduction
>>>>> +============
>>>>> +
>>>>> +The Extended Format API was conceived to extend V4L2 capabilities and
>>>>> +to simplify certain mechanisms.
>>>>> +It unifies single- vs multi- planar handling,
>>>>> +brings the concept of pixelformat + modifiers, allows planes to be placed
>>>>> +in any offset inside a buffer and let userspace to change colorspace
>>>>> +attributes if supported by the driver.
>>>>
>>>> How about simplifying this paragraph a bit:
>>>>
>>>> The Extended Format API unifies single- and multi- planar format handling
>>>> and provides a base for further functional extensions, such as format
>>>> modifiers, arbitrary plane offsets, colorspace configuration.
>>>
>>> Actually, I prefer Helen's version.
>>>
>>
>> To me it's a lot of text to read to get the same information, but I
>> won't insist.
>>
>>>>
>>>>> +
>>>>> +Data format negotiation and buffer handling works very similar to the classical
>>>>> +version, thus in this document we'll just mention the main differences.
>>>>
>>>> nit: "we will" or maybe even just "we mention only the main differences".

Applied for v6.

>>>>
>>>>> +
>>>>> +Data Format Negotiation
>>>>> +=======================
>>>>> +
>>>>> +The API replaces the classical ioctls:
>>>>> +
>>>>> +:ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>`, :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>`,
>>>>> +:ref:`VIDIOC_TRY_FMT <VIDIOC_G_FMT>`
>>>>> +(with :c:type:`v4l2_format` as the main parameter).
>>>>> +
>>>>> +By the extended versions:
>>>>> +
>>>>> +:ref:`VIDIOC_G_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>`,
>>>>> +:ref:`VIDIOC_S_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>`,
>>>>> +:ref:`VIDIOC_TRY_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>`
>>>>> +(with :c:type:`v4l2_ext_pix_format` as the main parameter).
>>>>> +
>>>>> +For CAPTURE and OUTPUT queues only.
>>>>> +
>>>>> +The ``type`` field of struct :c:type:`v4l2_ext_pix_format` only accepts
>>>>> +``V4L2_BUF_TYPE_VIDEO_CAPTURE`` or ``V4L2_BUF_TYPE_VIDEO_OUTPUT``, and it
>>>>> +supports multiplanar format through a combination of ``pixelfomat`` and
>>>>> +``modifier`` fields.
>>>>> +
>>>>> +Only the single-planar variants of the pixel formats are valid in the
>>>>> +``pixelformat`` field.
>>>>
>>>> Some formats have only multi-planar variants, like NV12MT. What should we
>>>> do about them? Since we have to keep those defines to support the legacy
>>>> API anyway, maybe we can just accept both variants and treat them equally?
>>>
>>> Helen mentioned that as well in a reply to patch 1/7. I'll have a think about
>>> that myself and reply to that post because this is a good question.
>>>
>>
>> I'm thinking about it as well. :)
>>
>>>>
>>>>> +To support multi-planar, a modifier should be set in the ``modifier`` field to
>>>>> +provide more information regarding the memory layout of pixels and number of
>>>>> +planes.
>>>>> +
>>>>> +The ``plane_fmt`` field is an array which holds information by plane using
>>>>> +the :c:type:`v4l2_plane_ext_pix_format`. When this struct is filled, its
>>>>> +``sizeimage`` field should be non-zero for all valid planes for a given
>>>>> +``pixelformat`` + ``modifier`` combination, and zeroed for the invalid ones.
>>>>> +
>>>>> +Colospace attributes are not read-only as in the classical version, i.e, they
>>>>> +can be set by application and drivers will adjust accordingly depending on what
>>>>> +is supported by the underlying hardware.
>>>>> +
>>>>> +Buffers
>>>>> +=======
>>>>> +
>>>>> +The API replaces the classical ioctls:
>>>>> +
>>>>> +:ref:`VIDIOC_CREATE_BUFS <VIDIOC_CREATE_BUFS>`
>>>>> +(with :c:type:`v4l2_create_buffers` as the main parameter),
>>>>> +:ref:`VIDIOC_QUERYBUF <VIDIOC_QUERYBUF>`, :ref:`VIDIOC_QBUF <VIDIOC_QBUF>`,
>>>>> +:ref:`VIDIOC_DQBUF <VIDIOC_QBUF>`, :ref:`VIDIOC_PREPARE_BUF <VIDIOC_PREPARE_BUF>`
>>>>> +(with :c:type:`v4l2_buffer` as the main parameter)
>>>>> +
>>>>> +By the extended versions:
>>>>> +
>>>>> +:ref:`VIDIOC_EXT_CREATE_BUFS <VIDIOC_EXT_CREATE_BUFS>`
>>>>> +(with :c:type:`v4l2_ext_create_buffers` as the main parameter),
>>>>> +:ref:`VIDIOC_EXT_QUERYBUF <VIDIOC_EXT_QUERYBUF>`,
>>>>> +:ref:`VIDIOC_EXT_QBUF <VIDIOC_EXT_QBUF>`,
>>>>> +:ref:`VIDIOC_EXT_DQBUF <VIDIOC_EXT_QBUF>`,
>>>>> +:ref:`VIDIOC_EXT_PREPARE_BUF <VIDIOC_EXT_PREPARE_BUF>`
>>>>> +(with :c:type:`v4l2_ext_buffer` as the main parameter)
>>>>> +
>>>>> +The basic difference between :c:type:`v4l2_create_buffers` and
>>>>> +:c:type:`v4l2_ext_create_buffers` is that the later have a
>>>>> +:c:type:`v4l2_ext_pix_format` as the type of the ``format`` field.
>>>>> +
>>>>> +Comparing :c:type:`v4l2_ext_buffer` with :c:type:`v4l2_buffer`, in the
>>>>> +extended version there is a unification of the single-/multi- planar handling
>>>>> +through the ``planes`` field of type :c:type:`v4l2_ext_plane`.
>>>>> +
>>>>> +The :c:type:`v4l2_ext_plane also allows planes to be placed in a given offset
>>>>> +inside a buffer.
>>>>> +Planes can be placed in different locations inside the same buffer, or in
>>>>> +different buffers.
>>>>> +
>>>>> +
>>>>> +.. kernel-doc:: include/uapi/linux/videodev2.h
>>>>> +   :functions: v4l2_ext_plane
>>>>> +
>>>>> +
>>>>> +.. kernel-doc:: include/uapi/linux/videodev2.h
>>>>> +   :functions: v4l2_ext_buffer
>>>>> diff --git a/Documentation/userspace-api/media/v4l/format.rst b/Documentation/userspace-api/media/v4l/format.rst
>>>>> index e47fc0505727c..b96d26f26793c 100644
>>>>> --- a/Documentation/userspace-api/media/v4l/format.rst
>>>>> +++ b/Documentation/userspace-api/media/v4l/format.rst
>>>>> @@ -28,13 +28,19 @@ format and the driver selects and reports the best the hardware can do
>>>>>  to satisfy the request. Of course applications can also just query the
>>>>>  current selection.
>>>>>
>>>>> -A single mechanism exists to negotiate all data formats using the
>>>>> -aggregate struct :c:type:`v4l2_format` and the
>>>>> +There are two mechanism to negociate data formats:
>>>>
>>>> negotiate

Ack, updated for v6.

>>>>
>>>>> +
>>>>> +The first one is using the aggregate struct :c:type:`v4l2_format` and the
>>>>>  :ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` and
>>>>>  :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctls. Additionally the
>>>>>  :ref:`VIDIOC_TRY_FMT <VIDIOC_G_FMT>` ioctl can be used to examine
>>>>>  what the hardware *could* do, without actually selecting a new data
>>>>> -format. The data formats supported by the V4L2 API are covered in the
>>>>> +format.
>>>>> +
>>>>> +The second is through the :ref:`ext_api`, please refer to its documentation
>>>>> +for more information.
>>>>> +
>>>>
>>>> Should we reverse the order to prefer the new API?

Ack, updated for v6.

>>>>
>>>>> +The data formats supported by the V4L2 API are covered in the
>>>>>  respective device section in :ref:`devices`. For a closer look at
>>>>>  image formats see :ref:`pixfmt`.
>>>>>
>>>>> @@ -71,7 +77,9 @@ earlier versions of V4L2. Switching the logical stream or returning into
>>>>>  *may* support a switch using :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>`.
>>>>>
>>>>>  All drivers exchanging data with applications must support the
>>>>> -:ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` and :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl. Implementation of the
>>>>> +:ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` and :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl
>>>>> +or the Extended respective versions (TODO: link).
>>>>
>>>> TODO? :)

Thanks!

>>>>
>>>>> +Implementation of the
>>>>>  :ref:`VIDIOC_TRY_FMT <VIDIOC_G_FMT>` is highly recommended but optional.
>>>>>
>>>>>
>>>>> diff --git a/Documentation/userspace-api/media/v4l/user-func.rst b/Documentation/userspace-api/media/v4l/user-func.rst
>>>>> index bf77c842718e5..67b254812791c 100644
>>>>> --- a/Documentation/userspace-api/media/v4l/user-func.rst
>>>>> +++ b/Documentation/userspace-api/media/v4l/user-func.rst
>>>>> @@ -20,6 +20,7 @@ Function Reference
>>>>>      func-close
>>>>>      func-ioctl
>>>>>      vidioc-create-bufs
>>>>> +    vidioc-ext-create-bufs
>>>>>      vidioc-cropcap
>>>>>      vidioc-dbg-g-chip-info
>>>>>      vidioc-dbg-g-register
>>>>> @@ -48,6 +49,7 @@ Function Reference
>>>>>      vidioc-g-ext-ctrls
>>>>>      vidioc-g-fbuf
>>>>>      vidioc-g-fmt
>>>>> +    vidioc-g-ext-pix-fmt
>>>>>      vidioc-g-frequency
>>>>>      vidioc-g-input
>>>>>      vidioc-g-jpegcomp
>>>>> @@ -62,8 +64,11 @@ Function Reference
>>>>>      vidioc-log-status
>>>>>      vidioc-overlay
>>>>>      vidioc-prepare-buf
>>>>> +    vidioc-ext-prepare-buf
>>>>>      vidioc-qbuf
>>>>> +    vidioc-ext-qbuf
>>>>>      vidioc-querybuf
>>>>> +    vidioc-ext-querybuf
>>>>>      vidioc-querycap
>>>>>      vidioc-queryctrl
>>>>>      vidioc-query-dv-timings
>>>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-ext-create-bufs.rst b/Documentation/userspace-api/media/v4l/vidioc-ext-create-bufs.rst
>>>>> new file mode 100644
>>>>> index 0000000000000..67f2c541e4d79
>>>>> --- /dev/null
>>>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-ext-create-bufs.rst
>>>>> @@ -0,0 +1,95 @@
>>>>> +.. Permission is granted to copy, distribute and/or modify this
>>>>> +.. document under the terms of the GNU Free Documentation License,
>>>>> +.. Version 1.1 or any later version published by the Free Software
>>>>> +.. Foundation, with no Invariant Sections, no Front-Cover Texts
>>>>> +.. and no Back-Cover Texts. A copy of the license is included at
>>>>> +.. Documentation/userspace-api/media/fdl-appendix.rst.
>>>>> +..
>>>>> +.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
>>>>> +
>>>>
>>>> TODO? :)

Thanks!

>>>>
>>>>> +.. _VIDIOC_EXT_CREATE_BUFS:
>>>>> +
>>>>> +****************************
>>>>> +ioctl VIDIOC_EXT_CREATE_BUFS
>>>>> +****************************
>>>>> +
>>>>> +Name
>>>>> +====
>>>>> +
>>>>> +VIDIOC_EXT_CREATE_BUFS - Create buffers for Memory Mapped or User Pointer or DMA Buffer I/O
>>>>> +
>>>>> +
>>>>> +Synopsis
>>>>> +========
>>>>> +
>>>>> +.. c:function:: int ioctl( int fd, VIDIOC_EXT_CREATE_BUFS, struct v4l2_ext_create_buffers *argp )
>>>>> +    :name: VIDIOC_EXT_CREATE_BUFS
>>>>> +
>>>>> +
>>>>> +Arguments
>>>>> +=========
>>>>> +
>>>>> +``fd``
>>>>> +    File descriptor returned by :ref:`open() <func-open>`.
>>>>> +
>>>>> +``argp``
>>>>> +    Pointer to struct :c:type:`v4l2_ext_create_buffers`.
>>>>> +
>>>>> +
>>>>> +Description
>>>>> +===========
>>>>> +
>>>>> +This ioctl is used to create buffers for :ref:`memory mapped <mmap>`
>>>>> +or :ref:`user pointer <userp>` or :ref:`DMA buffer <dmabuf>` I/O.
>>>>> +This ioctl can be called multiple times to
>>>>> +create buffers of different sizes.
>>>>> +
>>>>> +To allocate the device buffers applications must initialize the relevant
>>>>> +fields of the struct :c:type:`v4l2_ext_create_buffers` structure. The
>>>>> +``count`` field must be set to the number of requested buffers, the
>>>>> +``memory`` field specifies the requested I/O method and the ``reserved``
>>>>> +array must be zeroed.
>>>>> +
>>>>> +The ``format`` field specifies the image format that the buffers must be
>>>>> +able to handle. The application has to fill in this struct
>>>>> +:c:type:`v4l2_format`. Usually this will be done using the
>>>>> +:ref:`VIDIOC_TRY_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>` or
>>>>> +:ref:`VIDIOC_G_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>` ioctls to ensure that the
>>>>> +requested format is supported by the driver.
>>>>> +The driver may return an error if the size(s) are not supported by the
>>>>> +hardware (usually because they are too small).
>>>>> +
>>>>> +The driver can create a memory buffer per plane, or a single memory buffer
>>>>> +containing all the planes, with a minimum size according to the size
>>>>> +defined by the ``format.plane_fmt[i].sizeimage`` field.
>>>>> +Usually if the ``format.plane_fmt[i].sizeimage``
>>>>> +field is less than the minimum required for the given format, then an
>>>>> +error will be returned since drivers will typically not allow this. If
>>>>> +it is larger, then the value will be used as-is. In other words, the
>>>>> +driver may reject the requested size, but if it is accepted the driver
>>>>> +will use it unchanged.
>>>>> +
>>>>> +When the ioctl is called with a pointer to this structure the driver
>>>>> +will attempt to allocate up to the requested number of buffers and store
>>>>> +the actual number allocated and the starting index in the ``count`` and
>>>>> +the ``index`` fields respectively. On return ``count`` can be smaller
>>>>> +than the number requested.
>>>>
>>>> The 'capabilities' and 'flags' fields seem to go undocumented.

I removed create_bufs for v6 for now, since it is only useful for MMAP, and if
we are going torwards a DMA-fd centric API, then this is low priority and we
can define it later. Please check v6 and let me know what you think.

>>>>
>>>>> +
>>>>> +
>>>>> +.. kernel-doc:: include/uapi/linux/videodev2.h
>>>>> +   :functions: v4l2_ext_create_buffers
>>>>> +
>>>>> +
>>>>> +Return Value
>>>>> +============
>>>>> +
>>>>> +On success 0 is returned, on error -1 and the ``errno`` variable is set
>>>>> +appropriately. The generic error codes are described at the
>>>>> +:ref:`Generic Error Codes <gen-errors>` chapter.
>>>>> +
>>>>> +ENOMEM
>>>>> +    No memory to allocate buffers for :ref:`memory mapped <mmap>` I/O.
>>>>> +
>>>>> +EINVAL
>>>>> +    The buffer type (``format.type`` field), requested I/O method
>>>>> +    (``memory``) or format (``format`` field) is not valid.
>>>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-ext-prepare-buf.rst b/Documentation/userspace-api/media/v4l/vidioc-ext-prepare-buf.rst
>>>>> new file mode 100644
>>>>> index 0000000000000..88e4b57121254
>>>>> --- /dev/null
>>>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-ext-prepare-buf.rst
>>>>> @@ -0,0 +1,62 @@
>>>>> +.. Permission is granted to copy, distribute and/or modify this
>>>>> +.. document under the terms of the GNU Free Documentation License,
>>>>> +.. Version 1.1 or any later version published by the Free Software
>>>>> +.. Foundation, with no Invariant Sections, no Front-Cover Texts
>>>>> +.. and no Back-Cover Texts. A copy of the license is included at
>>>>> +.. Documentation/userspace-api/media/fdl-appendix.rst.
>>>>> +..
>>>>> +.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
>>>>> +
>>>>> +.. _VIDIOC_EXT_PREPARE_BUF:
>>>>> +
>>>>> +****************************
>>>>> +ioctl VIDIOC_EXT_PREPARE_BUF
>>>>> +****************************
>>>>> +
>>>>> +Name
>>>>> +====
>>>>> +
>>>>> +VIDIOC_EXT_PREPARE_BUF - Prepare a buffer for I/O
>>>>> +
>>>>> +
>>>>> +Synopsis
>>>>> +========
>>>>> +
>>>>> +.. c:function:: int ioctl( int fd, VIDIOC_EXT_PREPARE_BUF, struct v4l2_ext_buffer *argp )
>>>>> +    :name: VIDIOC_EXT_PREPARE_BUF
>>>>> +
>>>>> +
>>>>> +Arguments
>>>>> +=========
>>>>> +
>>>>> +``fd``
>>>>> +    File descriptor returned by :ref:`open() <func-open>`.
>>>>> +
>>>>> +``argp``
>>>>> +    Pointer to struct :c:type:`v4l2_ext_buffer`.
>>>>> +
>>>>> +
>>>>> +Description
>>>>> +===========
>>>>> +
>>>>> +Applications can optionally call the :ref:`VIDIOC_EXT_PREPARE_BUF` ioctl to
>>>>> +pass ownership of the buffer to the driver before actually enqueuing it,
>>>>> +using the :ref:`VIDIOC_EXT_QBUF <VIDIOC_EXT_QBUF>` ioctl, and to prepare it for future I/O. Such
>>>>> +preparations may include cache invalidation or cleaning. Performing them
>>>>> +in advance saves time during the actual I/O.
>>>>> +
>>>>> +
>>>>> +Return Value
>>>>> +============
>>>>> +
>>>>> +On success 0 is returned, on error -1 and the ``errno`` variable is set
>>>>> +appropriately. The generic error codes are described at the
>>>>> +:ref:`Generic Error Codes <gen-errors>` chapter.
>>>>> +
>>>>> +EBUSY
>>>>> +    File I/O is in progress.
>>>>> +
>>>>> +EINVAL
>>>>> +    The buffer ``type`` is not supported, or the ``index`` is out of
>>>>> +    bounds, or no buffers have been allocated yet, or the ``userptr`` or
>>>>> +    ``length`` are invalid.
>>>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-ext-qbuf.rst b/Documentation/userspace-api/media/v4l/vidioc-ext-qbuf.rst
>>>>> new file mode 100644
>>>>> index 0000000000000..083e106cf6bad
>>>>> --- /dev/null
>>>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-ext-qbuf.rst
>>>>> @@ -0,0 +1,204 @@
>>>>> +.. Permission is granted to copy, distribute and/or modify this
>>>>> +.. document under the terms of the GNU Free Documentation License,
>>>>> +.. Version 1.1 or any later version published by the Free Software
>>>>> +.. Foundation, with no Invariant Sections, no Front-Cover Texts
>>>>> +.. and no Back-Cover Texts. A copy of the license is included at
>>>>> +.. Documentation/userspace-api/media/fdl-appendix.rst.
>>>>> +..
>>>>> +.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
>>>>> +
>>>>> +.. _VIDIOC_EXT_QBUF:
>>>>> +
>>>>> +***************************************
>>>>> +ioctl VIDIOC_EXT_QBUF, VIDIOC_EXT_DQBUF
>>>>> +***************************************
>>>>> +
>>>>> +Name
>>>>> +====
>>>>> +
>>>>> +VIDIOC_EXT_QBUF - VIDIOC_EXT_DQBUF - Exchange a buffer with the driver
>>>>> +
>>>>> +
>>>>> +Synopsis
>>>>> +========
>>>>> +
>>>>> +.. c:function:: int ioctl( int fd, VIDIOC_EXT_QBUF, struct v4l2_ext_buffer *argp )
>>>>> +    :name: VIDIOC_EXT_QBUF
>>>>> +
>>>>> +.. c:function:: int ioctl( int fd, VIDIOC_EXT_DQBUF, struct v4l2_ext_buffer *argp )
>>>>> +    :name: VIDIOC_EXT_DQBUF
>>>>> +
>>>>> +
>>>>> +Arguments
>>>>> +=========
>>>>> +
>>>>> +``fd``
>>>>> +    File descriptor returned by :ref:`open() <func-open>`.
>>>>> +
>>>>> +``argp``
>>>>> +    Pointer to struct :c:type:`v4l2_ext_buffer`.
>>>>> +
>>>>> +
>>>>> +Description
>>>>> +===========
>>>>> +
>>>>> +Applications call the ``VIDIOC_EXT_QBUF`` ioctl to enqueue an empty
>>>>> +(capturing) or filled (output) buffer in the driver's incoming queue.
>>>>> +The semantics depend on the selected I/O method.
>>>>> +
>>>>> +To enqueue a buffer applications set the ``type`` field of a struct
>>>>> +:c:type:`v4l2_ext_buffer` to the same buffer type as was
>>>>> +previously used with struct :c:type:`v4l2_ext_pix_format` ``type``.
>>>>> +Applications must also set the ``index`` field. Valid index numbers
>>>>> +range from zero to the number of buffers allocated with
>>>>> +:ref:`VIDIOC_EXT_CREATE_BUFS` (struct
>>>>> +:c:type:`v4l2_ext_create_buffers` ``count``) minus
>>>>> +one. The contents of the struct :c:type:`v4l2_ext_buffer` returned
>>>>
>>>> I think this might not be entirely accurate. One can call
>>>> VIDIOC_EXT_CREATE_BUFS multiple times. Moreover, I don't think we've
>>>> prohibited VIDIOC_REQBUFS for the ext API, or have we?

As per above, I removed VIDIOC_EXT_CREATE_BUFS for v6.

>>>>
>>>>> +by a :ref:`VIDIOC_EXT_QUERYBUF` ioctl will do as well.
>>>>> +When the buffer is intended for output (``type`` is
>>>>> +``V4L2_BUF_TYPE_VIDEO_OUTPUT``) applications must also initialize the
>>>>> +``timestamp`` fields and the ``planes[i].plane_length`` for each valid plane,
>>>>> +and invalid ones must be set as zero.
>>>>> +see :ref:`buffer` for details. Applications must also set ``flags`` to 0. The
>>>>> +``reserved`` field must be set to 0.
>>>>> +
>>>>> +To enqueue a :ref:`memory mapped <mmap>` buffer applications set the
>>>>> +``planes[i].memory`` field to ``V4L2_MEMORY_MMAP`` in all the valid planes,
>>>>> +and invalid ones must be set as zero.
>>>>> +When ``VIDIOC_EXT_QBUF`` is called
>>>>> +with a pointer to this structure the driver sets the
>>>>> +``V4L2_BUF_FLAG_MAPPED`` and ``V4L2_BUF_FLAG_QUEUED`` flags and clears
>>>>> +the ``V4L2_BUF_FLAG_DONE`` flag in the ``flags`` field, or it returns an
>>>>> +``EINVAL`` error code.
>>>>> +
>>>>> +To enqueue a :ref:`user pointer <userp>` buffer applications set the
>>>>> +``planes[i].memory`` field to ``V4L2_MEMORY_USERPTR`` in all the valid planes,
>>>>> +and invalid ones must be set as zero, the ``planes[i].m.userptr`` field to the
>>>>> +address of the buffer,``planes[i].buffer_length`` to the size of the memory
>>>>> +buffer, ``planes[i].plane_length`` to the size that should be used by the plane,
>>>>> +and ``planes[i].offset`` of the plane in the memory buffer.
>>>>
>>>> Does offset make sense here if an arbitrary pointer can be given for the
>>>> start of the plane?

You are right, it doesn't, but offset can be set to non-zero in dqueue time,
in case drivers want to skip a header in the buffer.
Make sense?

>>>>
>>>>> +
>>>>> +When ``VIDIOC_EXT_QBUF`` is called with a pointer to this structure
>>>>> +the driver sets the ``V4L2_BUF_FLAG_QUEUED`` flag and clears the
>>>>> +``V4L2_BUF_FLAG_MAPPED`` and ``V4L2_BUF_FLAG_DONE`` flags in the
>>>>> +``flags`` field, or it returns an error code. This ioctl locks the
>>>>
>>>> This seems to be a copy of the text few lines above.

It is not quite the same, the flags that are set or cleared are slighly different.
The one a few lines above has V4L2_BUF_FLAG_MAPPED set, and here it is cleared.
Maybe we can show a table instead, showing which ones are set and which are
cleared, to make it easier to read.

>>>>
>>>>> +memory pages of the buffer in physical memory, they cannot be swapped
>>>>> +out to disk. Buffers remain locked until dequeued, until the
>>>>> +:ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>` or
>>>>> +:ref:`VIDIOC_EXT_CREATE_BUFS` ioctl is called, or until the
>>>>> +device is closed.
>>>>
>>>> Why would CREATE_BUFS affect existing buffers?

This was a mistake, fixed in v6.

>>>>
>>>>> +
>>>>> +To enqueue a :ref:`DMABUF <dmabuf>` buffer applications set the
>>>>> +``planes[i].memory`` field to ``V4L2_MEMORY_DMABUF`` in all the valid planes,
>>>>> +and invalid ones must be set as zero, the ``planes[i].m.fd`` field to a
>>>>> +file descriptor associated with a DMABUF buffer.,``planes[i].buffer_length`` to
>>>>> +the size of the memory buffer, ``planes[i].plane_length`` to the size that
>>>>
>>>> What is the buffer_length field needed for? DMA-bufs by definition are
>>>> kernel objects and the kernel should already know their sizes.
>>>
>>> See this discussion:
>>>
>>> https://patchwork.linuxtv.org/project/linux-media/patch/gh5kef5bkeel3o6b2dkgc2dfagu9klj4c0@4ax.com/
>>>
>>
>> I briefly read through it and I don't see what the conclusion was.
>> Generally I'd still prefer if the need to manually specify the buffer
>> size was eliminated, because that imposes unnecessary burden on the
>> userspace for the majority of cases. It could still remain valid for
>> userspace that wants to restrict the buffer size as it was mentioned
>> in that thread, though.
> 
> That's really the open issue: if userspace sets length to 0, then it should
> always be replaced by the dmabuf size, that's a no-brainer. But if it is non-zero,
> what do you do then? Your input would be appreciated.

I removed the length field for v6, please check.

> 
>>
>>>>
>>>>> +should be used by the plane, and ``planes[i].offset`` of the plane in the memory buffer.
>>>>> +When ``VIDIOC_EXT_QBUF`` is called with a pointer to this structure the driver
>>>>> +sets the ``V4L2_BUF_FLAG_QUEUED`` flag and clears the
>>>>> +``V4L2_BUF_FLAG_MAPPED`` and ``V4L2_BUF_FLAG_DONE`` flags in the
>>>>> +``flags`` field, or it returns an error code. This ioctl locks the
>>>>
>>>> Ditto.

Ditto.

>>>>
>>>>> +buffer. Locking a buffer means passing it to a driver for a hardware
>>>>> +access (usually DMA). If an application accesses (reads/writes) a locked
>>>>> +buffer then the result is undefined. Buffers remain locked until
>>>>> +dequeued, until the :ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>` or
>>>>> +:ref:`VIDIOC_EXT_CREATE_BUFS` ioctl is called, or until the
>>>>> +device is closed.
>>>>
>>>> Ditto.

Ditto.

>>>>
>>>>> +
>>>>> +The ``request_fd`` field can be used with the ``VIDIOC_EXT_QBUF`` ioctl to specify
>>>>> +the file descriptor of a :ref:`request <media-request-api>`, if requests are
>>>>> +in use. Setting it means that the buffer will not be passed to the driver
>>>>> +until the request itself is queued. Also, the driver will apply any
>>>>> +settings associated with the request for this buffer. This field will
>>>>> +be ignored unless the ``V4L2_BUF_FLAG_REQUEST_FD`` flag is set.
>>>>> +If the device does not support requests, then ``EBADR`` will be returned.
>>>>> +If requests are supported but an invalid request file descriptor is given,
>>>>> +then ``EINVAL`` will be returned.
>>>>> +
>>>>> +.. caution::
>>>>> +   It is not allowed to mix queuing requests with queuing buffers directly.
>>>>> +   ``EBUSY`` will be returned if the first buffer was queued directly and
>>>>> +   then the application tries to queue a request, or vice versa. After
>>>>> +   closing the file descriptor, calling
>>>>> +   :ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>` or calling :ref:`VIDIOC_EXT_CREATE_BUFS`
>>>>> +   the check for this will be reset.
>>>>> +
>>>>> +   For :ref:`memory-to-memory devices <mem2mem>` you can specify the
>>>>> +   ``request_fd`` only for output buffers, not for capture buffers. Attempting
>>>>> +   to specify this for a capture buffer will result in an ``EBADR`` error.
>>>>> +
>>>>> +Applications call the ``VIDIOC_EXT_DQBUF`` ioctl to dequeue a filled
>>>>> +(capturing) or displayed (output) buffer from the driver's outgoing
>>>>
>>>> "displayed" is quite inaccurate given that the majority of use cases for
>>>> OUTPUT in V4L2 now are m2m devices. Maybe "consumed"?

Right, I copy&pasted from vidioc-qbuf.rst, so I guess we should update there too.

>>>>
>>>>> +queue. They just set the ``type``, ``planes[i].memory`` and ``reserved`` fields of
>>>>
>>>> Why does the application have to set the memory field? It should be already
>>>> known by the kernel which owns the buffer at the given time.

Ack, does this apply to EXT_QBUF too? Since userspace needs to switch the memory type
in advance with reqbufs, then the kernel already knows the memory type at queue time
too.

>>>>
>>>>> +a struct :c:type:`v4l2_ext_buffer` as above, when
>>>>> +``VIDIOC_EXT_DQBUF`` is called with a pointer to this structure the driver
>>>>> +fills the remaining fields or returns an error code. The driver may also
>>>>> +set ``V4L2_BUF_FLAG_ERROR`` in the ``flags`` field. It indicates a
>>>>> +non-critical (recoverable) streaming error. In such case the application
>>>>> +may continue as normal, but should be aware that data in the dequeued
>>>>> +buffer might be corrupted. When using the multi-planar API, the planes
>>>>> +array must be passed in as well.
>>>>> +
>>>>> +If the application sets the ``memory`` field to ``V4L2_MEMORY_DMABUF`` to
>>>>> +dequeue a :ref:`DMABUF <dmabuf>` buffer, the driver fills the ``m.fd`` field
>>>>> +with a file descriptor numerically the same as the one given to ``VIDIOC_EXT_QBUF``
>>>>> +when the buffer was enqueued. No new file descriptor is created at dequeue time
>>>>> +and the value is only for the application convenience.
>>>>
>>>> Honestly, I don't like this aspect of the current API. It kind of implies
>>>> that the value returned is valid, but the file descriptor might have been
>>>> already closed. Could we just remove this and explicitly state that for
>>>> DMA-buf, it is the user space responsibility to track the mapping between
>>>> V4L2 indexes and its own buffer objects?

I can set to zero, and I would do this for all memory types, not only dma, just for
consistency.
But wouldn't it be usefull if applications want to re-queue the buffer
without the need to re-assign the pointers?

>>>>
>>>>> +
>>>>> +By default ``VIDIOC_EXT_DQBUF`` blocks when no buffer is in the outgoing
>>>>> +queue. When the ``O_NONBLOCK`` flag was given to the
>>>>> +:ref:`open() <func-open>` function, ``VIDIOC_EXT_DQBUF`` returns
>>>>> +immediately with an ``EAGAIN`` error code when no buffer is available.
>>>>> +
>>>>> +
>>>>> +.. kernel-doc:: include/uapi/linux/videodev2.h
>>>>> +   :functions: v4l2_ext_buffers
>>>>> +
>>>>> +
>>>>> +Return Value
>>>>> +============
>>>>> +
>>>>> +On success 0 is returned, on error -1 and the ``errno`` variable is set
>>>>> +appropriately. The generic error codes are described at the
>>>>> +:ref:`Generic Error Codes <gen-errors>` chapter.
>>>>> +
>>>>> +EAGAIN
>>>>> +    Non-blocking I/O has been selected using ``O_NONBLOCK`` and no
>>>>> +    buffer was in the outgoing queue.
>>>>> +
>>>>> +EINVAL
>>>>> +    The buffer ``type`` is not supported, or the ``index`` is out of
>>>>> +    bounds, or no buffers have been allocated yet, or the ``userptr`` or
>>>>> +    ``length`` are invalid, or the ``V4L2_BUF_FLAG_REQUEST_FD`` flag was
>>>>
>>>> There is no 'length' now.

Ack, removed.

>>>>
>>>>> +    set but the the given ``request_fd`` was invalid, or ``m.fd`` was
>>>>> +    an invalid DMABUF file descriptor.
>>>>> +
>>>>> +EIO
>>>>> +    ``VIDIOC_EXT_DQBUF`` failed due to an internal error. Can also indicate
>>>>> +    temporary problems like signal loss.
>>>
>>> Drop the last sentence, -EIO should never be used for temporary problems like
>>> that. EIO really means that the DMA engine crashed and userspace will have to call
>>> STREAMOFF and try to restart the DMA with STREAMON.
>>>
>>
>> I suspect the users of the new API wouldn't actually have to deal with
>> a signal loss, but if not, what should be the behavior then?
> 
> The typical behavior is to send out the SOURCE_CHANGE event and stall streaming,
> waiting for a valid signal.
> 
> That said, this is something I will dig into a bit deeper for the tegra HDMI
> support patch series next week, since this might be hard to do for that hardware.
> 
> But regardless of what is chosen for signal loss, EIO is wrong. Return values
> as are documented for VIDIOC_QUERY_DV_TIMINGS would be much more appropriate for this.

I'm dropping the last sentense for v6.

> 
>>
>>>>> +
>>>>> +    .. note::
>>>>> +
>>>>> +       The driver might dequeue an (empty) buffer despite returning
>>>>> +       an error, or even stop capturing. Reusing such buffer may be unsafe
>>>>> +       though and its details (e.g. ``index``) may not be returned either.
>>>
>>> The first part of this note is rather vague. I'm not sure what it meant with this.
>>>
>>>>> +       It is recommended that drivers indicate recoverable errors by setting
>>>>> +       the ``V4L2_BUF_FLAG_ERROR`` and returning 0 instead. In that case the
>>>>> +       application should be able to safely reuse the buffer and continue
>>>>> +       streaming.
>>>>
>>>> What is this for? It sounds like some legacy behavior, which maybe we could
>>>> drop with this new API?
>>>
>>> No, V4L2_BUF_FLAG_ERROR is really needed. Some hardware can really have
>>> intermittent failures causing video frames to be corrupt. And yes, that's
>>> typically due to hardware bugs. It usually either happens when you start
>>> streaming or just intermittent, but it is not severe enough to stop streaming
>>> completely (that's the -EIO error due to a call to vb2_queue_error).
>>>
>>> It's also used when you stop streaming and pending buffers are returned to
>>> userspace. They are marked as ERROR since they don't contain any video, or
>>> only partial video (if the DMA was stopped midway a frame).
>>>
>>
>> Sorry, I meant to insert that comment below the first half. The second
>> half is fine.
> 
> Ah, that makes much more sense :-)

I'm removing the first half for v6 then.

> 
>>
>>>>
>>>>> +
>>>>> +EPIPE
>>>>> +    ``VIDIOC_EXT_DQBUF`` returns this on an empty capture queue for mem2mem
>>>>> +    codecs if a buffer with the ``V4L2_BUF_FLAG_LAST`` was already
>>>>> +    dequeued and no new buffers are expected to become available.
>>>>> +
>>>>> +EBADR
>>>>> +    The ``V4L2_BUF_FLAG_REQUEST_FD`` flag was set but the device does not
>>>>> +    support requests for the given buffer type, or
>>>>> +    the ``V4L2_BUF_FLAG_REQUEST_FD`` flag was not set but the device requires
>>>>> +    that the buffer is part of a request.
>>>>> +
>>>>> +EBUSY
>>>>> +    The first buffer was queued via a request, but the application now tries
>>>>> +    to queue it directly, or vice versa (it is not permitted to mix the two
>>>>> +    APIs).
>>>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-ext-querybuf.rst b/Documentation/userspace-api/media/v4l/vidioc-ext-querybuf.rst
>>>>> new file mode 100644
>>>>> index 0000000000000..f2a12017253f6
>>>>> --- /dev/null
>>>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-ext-querybuf.rst
>>>>> @@ -0,0 +1,79 @@
>>>>> +.. Permission is granted to copy, distribute and/or modify this
>>>>> +.. document under the terms of the GNU Free Documentation License,
>>>>> +.. Version 1.1 or any later version published by the Free Software
>>>>> +.. Foundation, with no Invariant Sections, no Front-Cover Texts
>>>>> +.. and no Back-Cover Texts. A copy of the license is included at
>>>>> +.. Documentation/userspace-api/media/fdl-appendix.rst.
>>>>> +..
>>>>> +.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
>>>>> +
>>>>> +.. _VIDIOC_EXT_QUERYBUF:
>>>>> +
>>>>> +*************************
>>>>> +ioctl VIDIOC_EXT_QUERYBUF
>>>>> +*************************
>>>>> +
>>>>> +Name
>>>>> +====
>>>>> +
>>>>> +VIDIOC_EXT_QUERYBUF - Query the status of a buffer
>>>>> +
>>>>> +
>>>>> +Synopsis
>>>>> +========
>>>>> +
>>>>> +.. c:function:: int ioctl( int fd, VIDIOC_EXT_QUERYBUF, struct v4l2_ext_buffer *argp )
>>>>> +    :name: VIDIOC_EXT_QUERYBUF
>>>>> +
>>>>> +
>>>>> +Arguments
>>>>> +=========
>>>>> +
>>>>> +``fd``
>>>>> +    File descriptor returned by :ref:`open() <func-open>`.
>>>>> +
>>>>> +``argp``
>>>>> +    Pointer to struct :c:type:`v4l2_ext_buffer`.
>>>>> +
>>>>> +
>>>>> +Description
>>>>> +===========
>>>>> +
>>>>> +This ioctl is part of the :ref:`streaming <mmap>` I/O method. It can
>>>>> +be used to query the status of a buffer at any time after buffers have
>>>>> +been allocated with the :ref:`VIDIOC_EXT_CREATE_BUFS` ioctl.
>>>>> +
>>>>> +Applications set the ``type`` field of a struct
>>>>> +:c:type:`v4l2_ext_buffer` to the same buffer type as was
>>>>> +previously used with struct :c:type:`v4l2_ext_pix_format` ``type``,
>>>>> +and the ``index`` field. Valid index numbers range from zero to the
>>>>> +number of buffers allocated with
>>>>> +:ref:`VIDIOC_EXT_CREATE_BUFS` (struct
>>>>> +:c:type:`v4l2_ext_create_buffers` ``count``) minus
>>>>> +one. The ``reserved`` field must be set to 0.
>>>>> +
>>>>> +In the ``flags`` field the ``V4L2_BUF_FLAG_MAPPED``,
>>>>> +``V4L2_BUF_FLAG_PREPARED``, ``V4L2_BUF_FLAG_QUEUED`` and
>>>>> +``V4L2_BUF_FLAG_DONE`` flags will be valid. The ``planes.memory`` fields will be
>>>>> +set to the current I/O method for each plane.
>>>>> +
>>>>> +For every valid plane, an entry in ``planes`` will be filled, and zeroed for
>>>>> +invalid ones. ``planes[i].buffer_length`` is the size of the memory buffer
>>>>> +which contains the plane, ``planes[i].plane_length`` is the length of the plane,
>>>>
>>>> What is the length of the plane here? It seems like depending on the
>>>> context, the field can mean size of the payload (for filled buffer) or
>>>> total space for the payload (for empty buffer), which is a bit confusing.

I removed ext_querybuf for v6.

>>>>
>>>>> +and ``planes[i].offset` is where the plane is placed in the memory buffer.
>>>>> +
>>>>> +The size of the ``planes`` array can be calculated by the number of sequential
>>>>> +planes with ``planes[i].buffer_length`` that differs from zero up to the max
>>>>> +size of the array.
>>>>
>>>> Not sure if it's just me, but "size of array" sounds to me like the
>>>> total memory size of the array, i.e. the max number of elements, which
>>>> is fixed for this struct. How about
>>>>
>>>>   "The entries of the planes array are valid up to the last entry with
>>>>   non-zero buffer_length or the last entry of the array, whichever is
>>>>   first."
>>>>
>>>> ?

Sounds better indeed, but I removed ext_querybuf for v6.

>>>>
>>>>> +
>>>>> +
>>>>> +Return Value
>>>>> +============
>>>>> +
>>>>> +On success 0 is returned, on error -1 and the ``errno`` variable is set
>>>>> +appropriately. The generic error codes are described at the
>>>>> +:ref:`Generic Error Codes <gen-errors>` chapter.
>>>>> +
>>>>> +EINVAL
>>>>> +    The buffer ``type`` is not supported, or the ``index`` is out of
>>>>> +    bounds.
>>>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-pix-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-pix-fmt.rst
>>>>> new file mode 100644
>>>>> index 0000000000000..008e6c98a88a5
>>>>> --- /dev/null
>>>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-pix-fmt.rst
>>>>> @@ -0,0 +1,117 @@
>>>>> +.. Permission is granted to copy, distribute and/or modify this
>>>>> +.. document under the terms of the GNU Free Documentation License,
>>>>> +.. Version 1.1 or any later version published by the Free Software
>>>>> +.. Foundation, with no Invariant Sections, no Front-Cover Texts
>>>>> +.. and no Back-Cover Texts. A copy of the license is included at
>>>>> +.. Documentation/userspace-api/media/fdl-appendix.rst.
>>>>> +..
>>>>> +.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
>>>>> +
>>>>> +.. _VIDIOC_G_EXT_PIX_FMT:
>>>>> +
>>>>> +************************************************************************
>>>>> +ioctl VIDIOC_G_EXT_PIX_FMT, VIDIOC_S_EXT_PIX_FMT, VIDIOC_TRY_EXT_PIX_FMT
>>>>> +************************************************************************
>>>>> +
>>>>> +Name
>>>>> +====
>>>>> +
>>>>> +VIDIOC_G_EXT_PIX_FMT - VIDIOC_S_EXT_PIX_FMT - VIDIOC_TRY_EXT_PIX_FMT - Get or set the data format, try a format
>>>>> +
>>>>> +
>>>>> +Synopsis
>>>>> +========
>>>>> +
>>>>> +.. c:function:: int ioctl( int fd, VIDIOC_G_EXT_PIX_FMT, struct v4l2_ext_pix_format *argp )
>>>>> +    :name: VIDIOC_G_EXT_PIX_FMT
>>>>> +
>>>>> +.. c:function:: int ioctl( int fd, VIDIOC_S_EXT_PIX_FMT, struct v4l2_ext_pix_format *argp )
>>>>> +    :name: VIDIOC_S_EXT_PIX_FMT
>>>>> +
>>>>> +.. c:function:: int ioctl( int fd, VIDIOC_TRY_EXT_PIX_FMT, struct v4l2_ext_pix_format *argp )
>>>>> +    :name: VIDIOC_TRY_EXT_PIX_FMT
>>>>> +
>>>>> +Arguments
>>>>> +=========
>>>>> +
>>>>> +``fd``
>>>>> +    File descriptor returned by :ref:`open() <func-open>`.
>>>>> +
>>>>> +``argp``
>>>>> +    Pointer to struct :c:type:`v4l2_ext_pix_format`.
>>>>> +
>>>>> +
>>>>> +Description
>>>>> +===========
>>>>> +
>>>>> +These ioctls are used to negotiate the format of data (typically image
>>>>> +format) exchanged between driver and application.
>>>>> +
>>>>> +To query the current parameters applications set the ``type`` field of a
>>>>> +struct :c:type:`v4l2_ext_pix_format` to  ``V4L2_BUF_TYPE_VIDEO_CAPTURE`` or
>>>>> +``V4L2_BUF_TYPE_VIDEO_OUTPUT``, all the other types are invalid in this API,
>>>>> +and multiplanar is supported through modifiers.
>>>>> +
>>>>> +When the application calls the
>>>>> +:ref:`VIDIOC_G_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>` ioctl with a pointer to this
>>>>> +structure the driver fills the other members.
>>>>> +When the requested buffer type is not supported drivers return
>>>>> +an ``EINVAL`` error code.
>>>>> +
>>>>> +To change the current format parameters applications initialize all
>>>>> +the fields in the struct.
>>>>> +For details see the documentation of the various devices types in
>>>>> +:ref:`devices`. Good practice is to query the current parameters
>>>>> +first, and to modify only those parameters not suitable for the
>>>>> +application. When the application calls the :ref:`VIDIOC_S_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>` ioctl with
>>>>> +a pointer to a struct :c:type:`v4l2_ext_pix_format` structure the driver
>>>>> +checks and adjusts the parameters against hardware abilities. Drivers
>>>>> +should not return an error code unless the ``type`` field is invalid,
>>>>> +this is a mechanism to fathom device capabilities and to approach
>>>>> +parameters acceptable for both the application and driver. On success
>>>>> +the driver may program the hardware, allocate resources and generally
>>>>> +prepare for data exchange. Finally the :ref:`VIDIOC_S_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>` ioctl returns
>>>>> +the current format parameters as :ref:`VIDIOC_G_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>` does. Very simple,
>>>>> +inflexible devices may even ignore all input and always return the
>>>>> +default parameters. However all V4L2 devices exchanging data with the
>>>>> +application must implement the :ref:`VIDIOC_G_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>` and :ref:`VIDIOC_S_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>`
>>>>> +ioctl. When the requested buffer type is not supported drivers return an
>>>>> +EINVAL error code on a :ref:`VIDIOC_S_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>` attempt. When I/O is already in
>>>>> +progress or the resource is not available for other reasons drivers
>>>>> +return the ``EBUSY`` error code.
>>>>> +
>>>>> +The :ref:`VIDIOC_TRY_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>` ioctl is equivalent to :ref:`VIDIOC_S_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>` with one
>>>>> +exception: it does not change driver state. It can also be called at any
>>>>> +time, never returning ``EBUSY``. This function is provided to negotiate
>>>>> +parameters, to learn about hardware limitations, without disabling I/O
>>>>> +or possibly time consuming hardware preparations. Although strongly
>>>>> +recommended drivers are not required to implement this ioctl.
>>>>> +
>>>>
>>>> Could we make this mandatory to avoid ambiguities in the API? In
>>>
>>> Yes, please!

I updated the text for v6.
The only problem is if userspace uses EXT_TRY_FMT to a legacy driver through
a conversion layer, and the driver doesn't implement TRY_FMT, do we need a dummy
hook for those cases?

Thanks
Helen

>>>
>>>> general, most drivers implemented it anyway, without much added
>>>> complexity, because one can then simplify S_FMT to TRY_FMT + state
>>>> update.
>>>
>>> Ideally we would also fix the ambiguous situation regarding TRY/S_FMT
>>> and unsupported pixelformats: some drivers will replace unsupported
>>> pixelformats with a valid pixelformat, others will return an error.
>>>
>>> v4l2-compliance warns about drivers that return an error and point to
>>> this very old thread:
>>>
>>> http://www.mail-archive.com/linux-media@vger.kernel.org/msg56550.html
>>>
>>> However, I'm not really sure if we can resolve this ambiguity. I believe
>>> that it is only older webcam drivers that return an error.
>>
>> I guess we can at least enforce a specific behavior in the new API,
>> before we get compatibility obligations. :)
>>
>> Best regards,
>> Tomasz
>>
> 
> Regards,
> 
> 	Hans
> 
