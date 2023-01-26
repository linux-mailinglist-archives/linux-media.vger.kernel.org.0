Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA94167C4A2
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 08:07:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbjAZHHj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 02:07:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjAZHHi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 02:07:38 -0500
Received: from kozue.soulik.info (kozue.soulik.info [IPv6:2001:19f0:7000:8404:5054:ff:fe75:428f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32F35EFBE;
        Wed, 25 Jan 2023 23:07:35 -0800 (PST)
Received: from [192.168.0.134] (unknown [192.168.0.134])
        by kozue.soulik.info (Postfix) with ESMTPSA id 446BF101C9A;
        Thu, 26 Jan 2023 16:06:30 +0900 (JST)
Message-ID: <a9fe3c82-57a5-84c6-53a5-4d95e2348937@soulik.info>
Date:   Thu, 26 Jan 2023 15:07:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH v6 03/11] media: v4l2: Add extended buffer (de)queue
 operations for video types
Content-Language: en-US
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hans.verkuil@cisco.com, boris.brezillon@collabora.com,
        hiroh@chromium.org, nicolas@ndufresne.ca, Brian.Starkey@arm.com,
        kernel@collabora.com, narmstrong@baylibre.com,
        linux-kernel@vger.kernel.org, frkoenig@chromium.org,
        stanimir.varbanov@linaro.org, tfiga@chromium.org,
        sakari.ailus@iki.fi, laurent.pinchart@ideasonboard.com,
        randy.li@synaptics.com
References: <20210114180738.1758707-1-helen.koike@collabora.com>
 <20210114180738.1758707-4-helen.koike@collabora.com>
 <d6e39465-831a-2f1f-e2e3-3779fc3c0a58@xs4all.nl>
From:   ayaka <ayaka@soulik.info>
In-Reply-To: <d6e39465-831a-2f1f-e2e3-3779fc3c0a58@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I am currently refresh this patchset, but I didn't see the need beyond 
v4l2_ext_pix_fmt, which I had done.

On 2/23/21 20:58, Hans Verkuil wrote:
> On 14/01/2021 19:07, Helen Koike wrote:
>> Those extended buffer ops have several purpose:
>> 1/ Fix y2038 issues by converting the timestamp into an u64 counting
>>     the number of ns elapsed since 1970
I think application just use the timestamp field for tracking the 
buffer. It would be just a sequence number.
At least for the most widely cases, the video encoder and decoder and 
ISP, this field is not a wall time.
>> 2/ Unify single/multiplanar handling
>> 3/ Add a new start offset field to each v4l2 plane buffer info struct
>>     to support the case where a single buffer object is storing all
>>     planes data, each one being placed at a different offset

This mention a long time issue, but I don't think we need to expand API 
here.

May the data_offset field in struct v4l2_plane is enough? The rest is 
the problem of the kernel internal API and allocator.

I am thinking just add a field recording the offset input from the user.
When we return the buffer back to the user, the value of the offset 
should be same as the it is queued.

Meanwhile, the API compatible that I want to keep is user using the new 
ext_pix API could access those drivers support old API.
But I don't want the user would expect they could get correct pixel 
format using the old ioctl(). It could create many duplicated pixel 
formats. If we want to keep the compatible here, that is the job of libv4l.

Besides, I think make the driver using the new API be compatible with 
the old ioctl() would lead a huge problem. User won't like to update its 
code if it could work even in a less performance mode because this code 
are for all the other hardware vendors/models.
Unless we make this a feature, they could make a new branch in their 
code(don't count them would update the kernel of the other products).
>> New hooks are created in v4l2_ioctl_ops so that drivers can start using
>> these new objects.
>>
>> Note that the timecode field is gone, since there doesn't seem to be
>> in-kernel users. We can be added back in the reserved area if needed or
>> use the Request API to collect more metadata information from the
>> frame.
>>
>> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>> ---
>>
>> Changes in v6:
>> This patch was completely refactored, and based on previous version from
>> Hans and Boris.
>> - Refactor conversions v4l2_buffer <-> v4l2_ext_buffer for (d)qbuf
>> - I removed EXT_CREATE_BUFS since it is basically only usefull to MMAP.
>>    If this is going towards DMA-fd centric, then we can use the current
>>    REQUESTBUF to switch to it, and we can think a better way to support
>>    MMAP later if there are usecases.
>>    I also moved memory field from v4l2_ext_plane to v4l2_ext_buffer,
>>    since it is very unlikely to mix memory types, and REQUESTBUF can
>>    switch the whole buffer object to a given type.
>> - I removed EXT_QUERYBUF, since it is only useful to MMAP, for the
>>    same reason above.
>> - I removed EXT_PREPARE_BUF, since it is basically just an optimization,
>>    we can add it later (my intention is to simplify this patchset).
>> - These ioctls are only valid for video types (and not for overlay,
>>    vbi, touch, meta, etc).
>> - Refactor struct v4l2_ext_buffer and struct v4l2_ext_planes as
>>    discussed with Tomasz:
>> 	- add bytesused back
>> 	- remove lenght field
>> 	- move memory field from planes to buffer object
>> - Fix order in documentation of struct v4l2_ext_buffer (Tomasz)
>> - Fix flags documentation of struct v4l2_ext_buffer, don't say when flags are ignored (Tomasz)
>> - v4l_print_ext_buffer(): print request_fd and offset/userptr (Tomasz)
>>
>> Changes in v5:
>> - migrate memory from v4l2_ext_buffer to v4l2_ext_plane
>> - return mem_offset to struct v4l2_ext_plane
>> - change sizes and reorder fields to avoid holes in the struct and make
>>    it the same for 32 and 64 bits
>>
>> Changes in v4:
>> - Use v4l2_ext_pix_format directly in the ioctl, drop v4l2_ext_format,
>> making V4L2_BUF_TYPE_VIDEO_[OUTPUT,CAPTURE] the only valid types.
>> - Drop VIDIOC_EXT_EXPBUF, since the only difference from VIDIOC_EXPBUF
>> was that with VIDIOC_EXT_EXPBUF we could export multiple planes at once.
>> I think we can add this later, so I removed it from this RFC to simplify it.
>> - Remove num_planes field from struct v4l2_ext_buffer
>> - Add flags field to struct v4l2_ext_create_buffers
>> - Reformulate struct v4l2_ext_plane
>> - Fix some bugs caught by v4l2-compliance
>> - Rebased on top of media/master (post 5.8-rc1)
>>
>> Changes in v3:
>> - Rebased on top of media/master (post 5.4-rc1)
>>
>> Changes in v2:
>> - Add reserved space to v4l2_ext_buffer so that new fields can be added
>>    later on
>>
>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-dev.c   |   4 +
>>   drivers/media/v4l2-core/v4l2-ioctl.c | 184 +++++++++++++++++++++++++++
>>   include/media/v4l2-ioctl.h           |   8 ++
>>   include/uapi/linux/videodev2.h       |  55 ++++++++
>>   4 files changed, 251 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
>> index 5add58cb6d45..94c9f1e04704 100644
>> --- a/drivers/media/v4l2-core/v4l2-dev.c
>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
>> @@ -664,6 +664,10 @@ static void determine_valid_ioctls(struct video_device *vdev)
>>   			set_bit(_IOC_NR(VIDIOC_S_CROP), valid_ioctls);
>>   		SET_VALID_IOCTL(ops, VIDIOC_G_SELECTION, vidioc_g_selection);
>>   		SET_VALID_IOCTL(ops, VIDIOC_S_SELECTION, vidioc_s_selection);
>> +		SET_VALID_IOCTL(ops, VIDIOC_EXT_QBUF, vidioc_ext_qbuf);
>> +		SET_VALID_IOCTL(ops, VIDIOC_EXT_QBUF, vidioc_qbuf);
>> +		SET_VALID_IOCTL(ops, VIDIOC_EXT_DQBUF, vidioc_ext_dqbuf);
>> +		SET_VALID_IOCTL(ops, VIDIOC_EXT_DQBUF, vidioc_dqbuf);
>>   	}
>>   	if (is_meta && is_rx) {
>>   		/* metadata capture specific ioctls */
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index a9c07c0a73ec..ba633e7efd6d 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -533,6 +533,24 @@ static void v4l_print_buffer(const void *arg, bool write_only)
>>   			tc->type, tc->flags, tc->frames, *(__u32 *)tc->userbits);
>>   }
>>   
>> +static void v4l_print_ext_buffer(const void *arg, bool write_only)
>> +{
>> +	const struct v4l2_ext_buffer *e = arg;
>> +	unsigned int i;
>> +
>> +	pr_cont("%lld index=%d, type=%s, request_fd=%d, flags=0x%08llx, field=%s, sequence=%d, memory=%s\n",
>> +		e->timestamp, e->index, prt_names(e->type, v4l2_type_names),
>> +		e->request_fd, e->flags, prt_names(e->field, v4l2_field_names),
>> +		e->sequence, prt_names(e->memory, v4l2_memory_names));
>> +
>> +	for (i = 0; i < VIDEO_MAX_PLANES && e->planes[i].m.userptr; i++) {
>> +		const struct v4l2_ext_plane *plane = &e->planes[i];
>> +
>> +		pr_cont("plane %d: bytesused=%d, offset=0x%08x, userptr=0x%llx\n",
>> +			i, plane->bytesused, plane->offset, plane->m.userptr);
>> +	}
>> +}
>> +
>>   static void v4l_print_exportbuffer(const void *arg, bool write_only)
>>   {
>>   	const struct v4l2_exportbuffer *p = arg;
>> @@ -2552,6 +2570,130 @@ static int v4l_qbuf(const struct v4l2_ioctl_ops *ops,
>>   	return ret ? ret : ops->vidioc_qbuf(file, fh, p);
>>   }
>>   
>> +static bool v4l2_ext_buffer_is_single_membuf(const struct v4l2_ext_buffer *eb)
>> +{
>> +	unsigned int i;
>> +
>> +	for (i = 1; i < VIDEO_MAX_PLANES && eb->planes[i].m.userptr; i++)
>> +		if (eb->planes[i].m.userptr != eb->planes[i - 1].m.userptr)
> Is this safe? m.userptr is a u64, but the other two fields in the union are
> 32 bits. If you are actually comparing fds, how certain are you that the
> 32 bits following the 'fd' are zeroed instead of containing garbage?
>
> Perhaps mem_offset and fd should be u64 and s64 respectively to avoid any
> uninitialized bits?
>
>> +			return false;
>> +	return true;
>> +}
>> +
>> +static int v4l2_fill_buffer_from_ext_buffer(const struct v4l2_ioctl_ops *ops,
>> +					    struct file *file, void *fh,
>> +					    const struct v4l2_ext_buffer *eb,
>> +					    struct v4l2_buffer *b,
>> +					    struct v4l2_plane *bplanes)
>> +{
>> +	const struct v4l2_ext_plane *eplanes = (struct v4l2_ext_plane *)&eb->planes;
>> +	struct video_device *vfd = video_devdata(file);
>> +	bool is_mplane = V4L2_IS_CAP_MULTIPLANAR(vfd);
>> +	unsigned int i;
>> +	u64 nsecs;
>> +	int ret;
>> +
>> +	b->index = eb->index;
>> +	if (is_mplane) {
>> +		b->m.planes = bplanes;
>> +		b->length = VIDEO_MAX_PLANES;
>> +		if (eb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
>> +			b->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>> +		else if (eb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
>> +			b->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>> +	} else {
>> +		b->type = eb->type;
>> +	}
>> +
>> +	/* Fill the rest of the v4l2_buffer */
>> +	ret = v4l_querybuf(ops, file, fh, b);
> This call is weird. Why is this needed?
>
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Fill other fields from v4l2_ext_buffer */
>> +	b->flags = eb->flags;
>> +	b->field = eb->field;
>> +	b->timestamp.tv_sec = div64_u64_rem(eb->timestamp, NSEC_PER_SEC, &nsecs);
>> +	b->timestamp.tv_usec = (u32)nsecs / NSEC_PER_USEC;
> Use v4l2_buffer_set_timestamp() for this.
>
>> +	b->sequence = eb->sequence;
>> +
>> +	if (!is_mplane) {
>> +		for (i = 0; i < VIDEO_MAX_PLANES; i++) {
>> +			b->bytesused += eplanes[i].bytesused;
>> +			WARN_ON(eplanes[i].offset);
>> +		}
>> +
>> +		/* MMAP info was filled by querybuf */
>> +		if (b->memory == V4L2_MEMORY_MMAP)
>> +			return 0 ;
> space before ;
>
>> +
>> +		/*
>> +		 * TODO: get the length of the buffer, for now, just
>> +		 * set to max to avoid errors in checks.
>> +		 */
>> +		b->length = U32_MAX;
>> +		b->m.userptr = eplanes[0].m.userptr;
>> +		return 0;
>> +	}
>> +
>> +	bplanes[0].bytesused = eplanes[0].bytesused + eplanes[0].offset;
>> +	bplanes[0].data_offset = eplanes[0].offset;
>> +	if (v4l2_ext_buffer_is_single_membuf(eb))
>> +		for (i = 1; i < VIDEO_MAX_PLANES && eplanes[i].bytesused; i++) {
>> +			bplanes[0].bytesused += eplanes[i].bytesused;
>> +			WARN_ON(eplanes[i].offset);
>> +		}
>> +	else
>> +		for (i = 1; i < VIDEO_MAX_PLANES && eplanes[i].bytesused; i++) {
>> +			bplanes[i].bytesused = eplanes[i].bytesused +
>> +					       eplanes[i].offset;
>> +			bplanes[i].data_offset = eplanes[i].offset;
>> +		}
>> +
>> +	/* MMAP info was filled by querybuf */
>> +	if (b->memory == V4L2_MEMORY_MMAP)
>> +		return 0;
>> +
>> +	for (i = 0; i < VIDEO_MAX_PLANES && eplanes[i].m.userptr; i++) {
>> +		bplanes[i].m.userptr = eplanes[i].m.userptr;
>> +		/*
>> +		 * TODO: get the length of the buffer, for now, just
>> +		 * set to max to avoid errors in checks.
>> +		 */
>> +		bplanes[i].length = U32_MAX;
>> +	}
>> +	return 0;
>> +}
>> +
>> +static int v4l_ext_qbuf(const struct v4l2_ioctl_ops *ops,
>> +			struct file *file, void *fh, void *arg)
>> +{
>> +	struct v4l2_plane planes[VIDEO_MAX_PLANES] = {0};
>> +	struct v4l2_ext_buffer *eb = arg;
>> +	struct v4l2_buffer b = {0};
>> +
>> +	int ret = check_fmt(file, eb->type);
>> +
>> +	if (!ret)
>> +		return ret;
>> +
>> +	if (ops->vidioc_ext_qbuf)
>> +		return ops->vidioc_ext_qbuf(file, fh, eb);
>> +
>> +	/* Fill other fields from v4l2_ext_buffer */
>> +	ret = v4l2_fill_buffer_from_ext_buffer(ops, file, fh, eb, &b, planes);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = v4l_qbuf(ops, file, fh, &b);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* TODO: check if we need to fill other fields */
>> +	eb->flags = b.flags;
>> +	return 0;
>> +}
>> +
>>   static int v4l_dqbuf(const struct v4l2_ioctl_ops *ops,
>>   				struct file *file, void *fh, void *arg)
>>   {
>> @@ -2561,6 +2703,46 @@ static int v4l_dqbuf(const struct v4l2_ioctl_ops *ops,
>>   	return ret ? ret : ops->vidioc_dqbuf(file, fh, p);
>>   }
>>   
>> +static int v4l_ext_dqbuf(const struct v4l2_ioctl_ops *ops,
>> +			 struct file *file, void *fh, void *arg)
>> +{
>> +	struct v4l2_plane planes[VIDEO_MAX_PLANES] = {0};
>> +	struct v4l2_ext_buffer *eb = arg;
>> +	struct v4l2_buffer b = {0};
>> +	unsigned int i;
>> +
>> +	int ret = check_fmt(file, eb->type);
>> +
>> +	if (!ret)
>> +		return ret;
>> +
>> +	if (ops->vidioc_ext_qbuf)
>> +		return ops->vidioc_ext_qbuf(file, fh, eb);
>> +
>> +	/* Fill other fields from v4l2_ext_buffer */
>> +	ret = v4l2_fill_buffer_from_ext_buffer(ops, file, fh, eb, &b, planes);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = v4l_qbuf(ops, file, fh, &b);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* TODO: check if we need to fill other fields */
>> +	eb->flags = b.flags;
>> +
>> +	/*
>> +	 * Set buffer pointers to zero. Usecase: DMA-fd might have being
> Use-case
>
>> +	 * alread closed, so just request userspace to fill it again in queue
> already
> in queue -> at queue
>
>> +	 * time.
>> +	 */
>> +	for (i = 0; i < VIDEO_MAX_PLANES && eb->planes[i].m.userptr; i++) {
>> +		eb->planes[i].m.userptr = 0;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
>>   				struct file *file, void *fh, void *arg)
>>   {
>> @@ -3340,6 +3522,8 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
>>   	IOCTL_INFO(VIDIOC_G_EXT_PIX_FMT, v4l_g_ext_pix_fmt, v4l_print_ext_pix_format, 0),
>>   	IOCTL_INFO(VIDIOC_S_EXT_PIX_FMT, v4l_s_ext_pix_fmt, v4l_print_ext_pix_format, INFO_FL_PRIO),
>>   	IOCTL_INFO(VIDIOC_TRY_EXT_PIX_FMT, v4l_try_ext_pix_fmt, v4l_print_ext_pix_format, 0),
>> +	IOCTL_INFO(VIDIOC_EXT_QBUF, v4l_ext_qbuf, v4l_print_ext_buffer, INFO_FL_QUEUE),
>> +	IOCTL_INFO(VIDIOC_EXT_DQBUF, v4l_ext_dqbuf, v4l_print_ext_buffer, INFO_FL_QUEUE),
>>   };
>>   #define V4L2_IOCTLS ARRAY_SIZE(v4l2_ioctls)
>>   
>> diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
>> index c44708dc9355..1d0ed36e5e67 100644
>> --- a/include/media/v4l2-ioctl.h
>> +++ b/include/media/v4l2-ioctl.h
>> @@ -171,10 +171,14 @@ struct v4l2_fh;
>>    *	:ref:`VIDIOC_QUERYBUF <vidioc_querybuf>` ioctl
>>    * @vidioc_qbuf: pointer to the function that implements
>>    *	:ref:`VIDIOC_QBUF <vidioc_qbuf>` ioctl
>> + * @vidioc_ext_qbuf: pointer to the function that implements
>> + *	:ref:`VIDIOC_EXT_QBUF <vidioc_ext_qbuf>` ioctl
>>    * @vidioc_expbuf: pointer to the function that implements
>>    *	:ref:`VIDIOC_EXPBUF <vidioc_expbuf>` ioctl
>>    * @vidioc_dqbuf: pointer to the function that implements
>>    *	:ref:`VIDIOC_DQBUF <vidioc_qbuf>` ioctl
>> + * @vidioc_ext_dqbuf: pointer to the function that implements
>> + *	:ref:`VIDIOC_EXT_DQBUF <vidioc_ext_qbuf>` ioctl
>>    * @vidioc_create_bufs: pointer to the function that implements
>>    *	:ref:`VIDIOC_CREATE_BUFS <vidioc_create_bufs>` ioctl
>>    * @vidioc_prepare_buf: pointer to the function that implements
>> @@ -441,10 +445,14 @@ struct v4l2_ioctl_ops {
>>   			       struct v4l2_buffer *b);
>>   	int (*vidioc_qbuf)(struct file *file, void *fh,
>>   			   struct v4l2_buffer *b);
>> +	int (*vidioc_ext_qbuf)(struct file *file, void *fh,
>> +			       struct v4l2_ext_buffer *b);
>>   	int (*vidioc_expbuf)(struct file *file, void *fh,
>>   			     struct v4l2_exportbuffer *e);
>>   	int (*vidioc_dqbuf)(struct file *file, void *fh,
>>   			    struct v4l2_buffer *b);
>> +	int (*vidioc_ext_dqbuf)(struct file *file, void *fh,
>> +				struct v4l2_ext_buffer *b);
>>   
>>   	int (*vidioc_create_bufs)(struct file *file, void *fh,
>>   				  struct v4l2_create_buffers *b);
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index a2d850513708..508ac11645bc 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -1056,6 +1056,59 @@ struct v4l2_buffer {
>>   	};
>>   };
>>   
>> +/**
>> + * struct v4l2_ext_plane - extended plane buffer info
>> + * @offset:		offset in the memory buffer where the plane starts.
>> + * @bytesused:		number of bytes occupied by data in the plane (payload).
>> + * @mmap_offset:	If V4L2_MEMORY_MMAP is used, then it can be a "cookie"
>> + *			that should be passed to mmap() called on the video node.
>> + * @userptr:		when memory is V4L2_MEMORY_USERPTR, a userspace pointer pointing
>> + *			to this plane.
>> + * @dmabuf_fd:		when memory is V4L2_MEMORY_DMABUF, a userspace file descriptor
>> + *			associated with this plane.
>> + * @reserved:		extra space reserved for future fields, must be set to 0.
>> + */
>> +struct v4l2_ext_plane {
>> +	__u32 offset;
>> +	__u32 bytesused;
>> +	union {
>> +		__u32 mmap_offset;
>> +		__u64 userptr;
>> +		__s32 dmabuf_fd;
>> +	} m;
>> +	__u32 reserved[6];
>> +};
>> +
>> +/**
>> + * struct v4l2_ext_buffer - extended video buffer info
>> + * @index:	id number of the buffer
>> + * @type:	V4L2_BUF_TYPE_VIDEO_CAPTURE or V4L2_BUF_TYPE_VIDEO_OUTPUT
>> + * @field:	enum v4l2_field; field order of the image in the buffer
>> + * @sequence:	sequence count of this frame
>> + * @flags:	buffer informational flags
>> + * @timestamp:	frame timestamp
>> + * @memory:	enum v4l2_memory; the method, in which the actual video
>> + *		data is passed
>> + * @request_fd:	fd of the request that this buffer should use
>> + * @planes:	per-plane buffer information
>> + * @reserved:	extra space reserved for future fields, must be set to 0
>> + *
>> + * Contains data exchanged by application and driver using one of the Streaming
>> + * I/O methods.
>> + */
>> +struct v4l2_ext_buffer {
>> +	__u32 index;
>> +	__u32 type;
>> +	__u32 field;
>> +	__u32 sequence;
>> +	__u64 flags;
>> +	__u64 timestamp;
>> +	__u32 memory;
>> +	__s32 request_fd;
>> +	struct v4l2_ext_plane planes[VIDEO_MAX_PLANES];
>> +	__u32 reserved[10];
>> +};
>> +
>>   #ifndef __KERNEL__
>>   /**
>>    * v4l2_timeval_to_ns - Convert timeval to nanoseconds
>> @@ -2623,6 +2676,8 @@ struct v4l2_create_buffers {
>>   #define VIDIOC_G_EXT_PIX_FMT	_IOWR('V', 104, struct v4l2_ext_pix_format)
>>   #define VIDIOC_S_EXT_PIX_FMT	_IOWR('V', 105, struct v4l2_ext_pix_format)
>>   #define VIDIOC_TRY_EXT_PIX_FMT	_IOWR('V', 106, struct v4l2_ext_pix_format)
>> +#define VIDIOC_EXT_QBUF		_IOWR('V', 107, struct v4l2_ext_buffer)
>> +#define VIDIOC_EXT_DQBUF	_IOWR('V', 118, struct v4l2_ext_buffer)
>>   
>>   /* Reminder: when adding new ioctls please add support for them to
>>      drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
>>
> Regards,
>
> 	Hans
>
