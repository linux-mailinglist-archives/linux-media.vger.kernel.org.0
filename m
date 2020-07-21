Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8469022826B
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 16:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728961AbgGUOkw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 10:40:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728850AbgGUOkw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 10:40:52 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0855DC061794;
        Tue, 21 Jul 2020 07:40:52 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 2AFF729744C
Subject: Re: [PATCH v4 2/6] media: v4l2: Add extended buffer operations
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        mchehab@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        linux-media@vger.kernel.org
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        tfiga@chromium.org, hiroh@chromium.org, nicolas@ndufresne.ca,
        Brian.Starkey@arm.com, kernel@collabora.com,
        narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
        frkoenig@chromium.org, mjourdan@baylibre.com
References: <20200717115435.2632623-1-helen.koike@collabora.com>
 <20200717115435.2632623-3-helen.koike@collabora.com>
 <5665bbd4-75e2-ec73-ba24-54e5981eb4ac@linaro.org>
 <e4d4c88b-2724-76c0-fff2-2404d5073ae4@collabora.com>
 <0fd9e21d-4317-dbed-c035-9c1523e0195b@linaro.org>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <15067dff-c802-d6f0-a2f8-817fb487b30d@collabora.com>
Date:   Tue, 21 Jul 2020 11:40:43 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <0fd9e21d-4317-dbed-c035-9c1523e0195b@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/21/20 11:30 AM, Stanimir Varbanov wrote:
> Hi Helen,
> 
> On 7/21/20 4:54 PM, Helen Koike wrote:
>> Hi,
>>
>> On 7/21/20 8:26 AM, Stanimir Varbanov wrote:
>>>
>>>
>>> On 7/17/20 2:54 PM, Helen Koike wrote:
>>>> From: Hans Verkuil <hans.verkuil@cisco.com>
>>>>
>>>> Those extended buffer ops have several purpose:
>>>> 1/ Fix y2038 issues by converting the timestamp into an u64 counting
>>>>    the number of ns elapsed since 1970
>>>> 2/ Unify single/multiplanar handling
>>>> 3/ Add a new start offset field to each v4l2 plane buffer info struct
>>>>    to support the case where a single buffer object is storing all
>>>>    planes data, each one being placed at a different offset
>>>>
>>>> New hooks are created in v4l2_ioctl_ops so that drivers can start using
>>>> these new objects.
>>>>
>>>> The core takes care of converting new ioctls requests to old ones
>>>> if the driver does not support the new hooks, and vice versa.
>>>>
>>>> Note that the timecode field is gone, since there doesn't seem to be
>>>> in-kernel users. We can be added back in the reserved area if needed or
>>>> use the Request API to collect more metadata information from the
>>>> frame.
>>>>
>>>> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>>>> ---
>>>> Changes in v4:
>>>> - Use v4l2_ext_pix_format directly in the ioctl, drop v4l2_ext_format,
>>>> making V4L2_BUF_TYPE_VIDEO_[OUTPUT,CAPTURE] the only valid types.
>>>> - Drop VIDIOC_EXT_EXPBUF, since the only difference from VIDIOC_EXPBUF
>>>> was that with VIDIOC_EXT_EXPBUF we could export multiple planes at once.
>>>> I think we can add this later, so I removed it from this RFC to simplify it.
>>>> - Remove num_planes field from struct v4l2_ext_buffer
>>>> - Add flags field to struct v4l2_ext_create_buffers
>>>> - Reformulate struct v4l2_ext_plane
>>>> - Fix some bugs caught by v4l2-compliance
>>>> - Rebased on top of media/master (post 5.8-rc1)
>>>>
>>>> Changes in v3:
>>>> - Rebased on top of media/master (post 5.4-rc1)
>>>>
>>>> Changes in v2:
>>>> - Add reserved space to v4l2_ext_buffer so that new fields can be added
>>>>   later on
>>>> ---
>>>>  drivers/media/v4l2-core/v4l2-dev.c   |  29 ++-
>>>>  drivers/media/v4l2-core/v4l2-ioctl.c | 349 +++++++++++++++++++++++++--
>>>>  include/media/v4l2-ioctl.h           |  26 ++
>>>>  include/uapi/linux/videodev2.h       |  89 +++++++
>>>>  4 files changed, 471 insertions(+), 22 deletions(-)
>>>>
>>>
>>> <cut>
>>>
>>>> +/**
>>>> + * struct v4l2_ext_plane - extended plane buffer info
>>>> + * @buffer_length:	size of the entire buffer in bytes, should fit
>>>> + *			@offset + @plane_length
>>>> + * @plane_length:	size of the plane in bytes.
>>>> + * @userptr:		when memory is V4L2_MEMORY_USERPTR, a userspace pointer pointing
>>>> + *			to this plane.
>>>> + * @dmabuf_fd:		when memory is V4L2_MEMORY_DMABUF, a userspace file descriptor
>>>> + *			associated with this plane.
>>>> + * @offset:		offset in the memory buffer where the plane starts. If
>>>> + *			V4L2_MEMORY_MMAP is used, then it can be a "cookie" that
>>>> + *			should be passed to mmap() called on the video node.
>>>> + * @reserved:		extra space reserved for future fields, must be set to 0.
>>>> + *
>>>> + *
>>>> + * Buffers consist of one or more planes, e.g. an YCbCr buffer with two planes
>>>> + * can have one plane for Y, and another for interleaved CbCr components.
>>>> + * Each plane can reside in a separate memory buffer, or even in
>>>> + * a completely separate memory node (e.g. in embedded devices).
>>>> + */
>>>> +struct v4l2_ext_plane {
>>>> +	__u32 buffer_length;
>>>> +	__u32 plane_length;
>>>> +	union {
>>>> +		__u64 userptr;
>>>> +		__s32 dmabuf_fd;
>>>> +	} m;
>>>> +	__u32 offset;
>>>> +	__u32 reserved[4];
>>>> +};
>>>> +
>>>>  /**
>>>>   * struct v4l2_buffer - video buffer info
>>>>   * @index:	id number of the buffer
>>>> @@ -1055,6 +1086,36 @@ struct v4l2_buffer {
>>>>  	};
>>>>  };
>>>>  
>>>> +/**
>>>> + * struct v4l2_ext_buffer - extended video buffer info
>>>> + * @index:	id number of the buffer
>>>> + * @type:	V4L2_BUF_TYPE_VIDEO_CAPTURE or V4L2_BUF_TYPE_VIDEO_OUTPUT
>>>> + * @flags:	buffer informational flags
>>>> + * @field:	enum v4l2_field; field order of the image in the buffer
>>>> + * @timestamp:	frame timestamp
>>>> + * @sequence:	sequence count of this frame
>>>> + * @memory:	enum v4l2_memory; the method, in which the actual video data is
>>>> + *		passed
>>>> + * @planes:	per-plane buffer information
>>>> + * @request_fd:	fd of the request that this buffer should use
>>>> + * @reserved:	extra space reserved for future fields, must be set to 0
>>>> + *
>>>> + * Contains data exchanged by application and driver using one of the Streaming
>>>> + * I/O methods.
>>>> + */
>>>> +struct v4l2_ext_buffer {
>>>> +	__u32 index;
>>>> +	__u32 type;
>>>> +	__u32 flags;
>>>> +	__u32 field;
>>>> +	__u64 timestamp;
>>>> +	__u32 sequence;
>>>> +	__u32 memory;
>>>> +	__u32 request_fd;
>>>
>>> This should be __s32, at least for consistency with dmabuf_fd?
>>
>> I see that in struct v4l2_buffer, we have __s32, I don't mind changing it
>> to keep the consistency, I just don't see where this value can be a negative
>> number.
> 
> here
> https://elixir.bootlin.com/linux/v5.8-rc4/source/drivers/media/common/videobuf2/videobuf2-v4l2.c#L134

I saw that -1 is used to signal an invalid value, but I was just wondering when request_fd = 0 is valid.

> 
>>
>>>
>>>> +	struct v4l2_ext_plane planes[VIDEO_MAX_PLANES];
>>>> +	__u32 reserved[4];
>>>
>>> I think we have to reserve more words here for future extensions.
>>>
>>> I'd like also to propose to add here __s32 metadata_fd. The idea behind
>>> this is to have a way to pass per-frame metadata dmabuf buffers for
>>> synchronous type of metadata where the metadata is coming at the same
>>> time with data buffers. What would be the format of the metadata buffer
>>> is TBD.
>>>
>>> One option for metadata buffer format could be:
>>>
>>> header {
>>> 	num_ctrls
>>> 	array_of_ctrls [0..N]
>>> 		ctrl_id
>>> 		ctrl_size
>>> 		ctrl_offset
>>> }
>>>
>>> data {
>>> 	cid0	//offset of cid0 in dmabuf buffer
>>> 	cid1
>>> 	cidN
>>> }
>>
>> Would it be better if, instead of adding a medatata_fd inside struct v4l2_ext_buffer,
>> we create a new ioctl that gets this structs for the controls and sync them using the
>> Request API ?
> 
> no, this solution has performance drawbacks when the metadata is big,
> think of 64K.

Why? You could still use a dmabuf in this new ioctl, no?


Regards,
Helen

> 
>>
>> I'd like to avoid too much metadata in the buffer object.
>>
>> Regards,
>> Helen
>>
>>>
>>> This will make easy to get concrete ctrl id without a need to parse the
>>> whole metadata buffer. Also using dmabuf we don't need to copy data
>>> between userspace <-> kernelspace (just cache syncs through
>>> begin/end_cpu_access).
>>>
>>> The open question is who will validate the metadata buffer when it comes
>>> from userspace. The obvious answer is v4l2-core but looking into DRM
>>> subsytem they give more freedom to the drivers, and just provide generic
>>> helpers which are not mandatory.
>>>
>>> I guess this will be a voice in the wilderness but I wanted to know your
>>> opinion.
>>>
>>>> +};
>>>> +
>>>>  #ifndef __KERNEL__
>>>>  /**
>>>>   * v4l2_timeval_to_ns - Convert timeval to nanoseconds
>>>> @@ -2520,6 +2581,29 @@ struct v4l2_create_buffers {
>>>>  	__u32			reserved[6];
>>>>  };
>>>>  
>>>> +/**
>>>> + * struct v4l2_ext_create_buffers - VIDIOC_EXT_CREATE_BUFS argument
>>>> + * @index:	on return, index of the first created buffer
>>>> + * @count:	entry: number of requested buffers,
>>>> + *		return: number of created buffers
>>>> + * @memory:	enum v4l2_memory; buffer memory type
>>>> + * @capabilities: capabilities of this buffer type.
>>>> + * @format:	frame format, for which buffers are requested
>>>> + * @flags:	additional buffer management attributes (ignored unless the
>>>> + *		queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS capability
>>>> + *		and configured for MMAP streaming I/O).
>>>> + * @reserved:	extra space reserved for future fields, must be set to 0
>>>> + */
>>>> +struct v4l2_ext_create_buffers {
>>>> +	__u32				index;
>>>> +	__u32				count;
>>>> +	__u32				memory;
>>>> +	struct v4l2_ext_pix_format	format;
>>>> +	__u32				capabilities;
>>>> +	__u32				flags;
>>>> +	__u32 reserved[4];
>>>> +};
>>>> +
>>>>  /*
>>>>   *	I O C T L   C O D E S   F O R   V I D E O   D E V I C E S
>>>>   *
>>>> @@ -2623,6 +2707,11 @@ struct v4l2_create_buffers {
>>>>  #define VIDIOC_G_EXT_PIX_FMT	_IOWR('V', 104, struct v4l2_ext_pix_format)
>>>>  #define VIDIOC_S_EXT_PIX_FMT	_IOWR('V', 105, struct v4l2_ext_pix_format)
>>>>  #define VIDIOC_TRY_EXT_PIX_FMT	_IOWR('V', 106, struct v4l2_ext_pix_format)
>>>> +#define VIDIOC_EXT_CREATE_BUFS	_IOWR('V', 107, struct v4l2_ext_create_buffers)
>>>> +#define VIDIOC_EXT_QUERYBUF	_IOWR('V', 108, struct v4l2_ext_buffer)
>>>> +#define VIDIOC_EXT_QBUF		_IOWR('V', 109, struct v4l2_ext_buffer)
>>>> +#define VIDIOC_EXT_DQBUF	_IOWR('V', 110, struct v4l2_ext_buffer)
>>>> +#define VIDIOC_EXT_PREPARE_BUF	_IOWR('V', 111, struct v4l2_ext_buffer)
>>>>  
>>>>  /* Reminder: when adding new ioctls please add support for them to
>>>>     drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
>>>>
>>>
> 
