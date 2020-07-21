Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61596228257
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 16:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728700AbgGUOgV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 10:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726412AbgGUOgU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 10:36:20 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E735C061794;
        Tue, 21 Jul 2020 07:36:20 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 68334297425
Subject: Re: [PATCH v4 2/6] media: v4l2: Add extended buffer operations
To:     Hans Verkuil <hverkuil@xs4all.nl>, mchehab@kernel.org,
        hans.verkuil@cisco.com, laurent.pinchart@ideasonboard.com,
        sakari.ailus@iki.fi, linux-media@vger.kernel.org
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        tfiga@chromium.org, hiroh@chromium.org, nicolas@ndufresne.ca,
        Brian.Starkey@arm.com, kernel@collabora.com,
        narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
        frkoenig@chromium.org, mjourdan@baylibre.com,
        stanimir.varbanov@linaro.org
References: <20200717115435.2632623-1-helen.koike@collabora.com>
 <20200717115435.2632623-3-helen.koike@collabora.com>
 <786d2a41-83f1-30a8-83bc-17a5c106db81@xs4all.nl>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <c6cfdce6-b833-05c9-72c6-b6a3f034a3be@collabora.com>
Date:   Tue, 21 Jul 2020 11:36:08 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <786d2a41-83f1-30a8-83bc-17a5c106db81@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On 7/21/20 7:48 AM, Hans Verkuil wrote:
> On 17/07/2020 13:54, Helen Koike wrote:
>> From: Hans Verkuil <hans.verkuil@cisco.com>
>>
>> Those extended buffer ops have several purpose:
>> 1/ Fix y2038 issues by converting the timestamp into an u64 counting
>>    the number of ns elapsed since 1970
>> 2/ Unify single/multiplanar handling
>> 3/ Add a new start offset field to each v4l2 plane buffer info struct
>>    to support the case where a single buffer object is storing all
>>    planes data, each one being placed at a different offset
>>
>> New hooks are created in v4l2_ioctl_ops so that drivers can start using
>> these new objects.
>>
>> The core takes care of converting new ioctls requests to old ones
>> if the driver does not support the new hooks, and vice versa.
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
>>   later on
>> ---
>>  drivers/media/v4l2-core/v4l2-dev.c   |  29 ++-
>>  drivers/media/v4l2-core/v4l2-ioctl.c | 349 +++++++++++++++++++++++++--
>>  include/media/v4l2-ioctl.h           |  26 ++
>>  include/uapi/linux/videodev2.h       |  89 +++++++
>>  4 files changed, 471 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
>> index e1829906bc086..cb21ee8eb075c 100644
>> --- a/drivers/media/v4l2-core/v4l2-dev.c
>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
>> @@ -720,15 +720,34 @@ static void determine_valid_ioctls(struct video_device *vdev)
>>  		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_sdr_out);
>>  	}
>>  
>> +	if (is_vid || is_tch) {
>> +		/* ioctls valid for video and touch */
>> +		if (ops->vidioc_querybuf || ops->vidioc_ext_querybuf)
>> +			set_bit(_IOC_NR(VIDIOC_EXT_QUERYBUF), valid_ioctls);
>> +		if (ops->vidioc_qbuf || ops->vidioc_ext_qbuf)
>> +			set_bit(_IOC_NR(VIDIOC_EXT_QBUF), valid_ioctls);
>> +		if (ops->vidioc_dqbuf || ops->vidioc_ext_dqbuf)
>> +			set_bit(_IOC_NR(VIDIOC_EXT_DQBUF), valid_ioctls);
>> +		if (ops->vidioc_create_bufs || ops->vidioc_ext_create_bufs)
>> +			set_bit(_IOC_NR(VIDIOC_EXT_CREATE_BUFS), valid_ioctls);
>> +		if (ops->vidioc_prepare_buf || ops->vidioc_ext_prepare_buf)
>> +			set_bit(_IOC_NR(VIDIOC_EXT_PREPARE_BUF), valid_ioctls);
>> +	}
>> +
>>  	if (is_vid || is_vbi || is_sdr || is_tch || is_meta) {
>>  		/* ioctls valid for video, vbi, sdr, touch and metadata */
>>  		SET_VALID_IOCTL(ops, VIDIOC_REQBUFS, vidioc_reqbufs);
>> -		SET_VALID_IOCTL(ops, VIDIOC_QUERYBUF, vidioc_querybuf);
>> -		SET_VALID_IOCTL(ops, VIDIOC_QBUF, vidioc_qbuf);
>>  		SET_VALID_IOCTL(ops, VIDIOC_EXPBUF, vidioc_expbuf);
>> -		SET_VALID_IOCTL(ops, VIDIOC_DQBUF, vidioc_dqbuf);
>> -		SET_VALID_IOCTL(ops, VIDIOC_CREATE_BUFS, vidioc_create_bufs);
>> -		SET_VALID_IOCTL(ops, VIDIOC_PREPARE_BUF, vidioc_prepare_buf);
>> +		if (ops->vidioc_querybuf || ops->vidioc_ext_querybuf)
>> +			set_bit(_IOC_NR(VIDIOC_QUERYBUF), valid_ioctls);
>> +		if (ops->vidioc_qbuf || ops->vidioc_ext_qbuf)
>> +			set_bit(_IOC_NR(VIDIOC_QBUF), valid_ioctls);
>> +		if (ops->vidioc_dqbuf || ops->vidioc_ext_dqbuf)
>> +			set_bit(_IOC_NR(VIDIOC_DQBUF), valid_ioctls);
>> +		if (ops->vidioc_create_bufs || ops->vidioc_ext_create_bufs)
>> +			set_bit(_IOC_NR(VIDIOC_CREATE_BUFS), valid_ioctls);
>> +		if (ops->vidioc_prepare_buf || ops->vidioc_ext_prepare_buf)
>> +			set_bit(_IOC_NR(VIDIOC_PREPARE_BUF), valid_ioctls);
>>  		SET_VALID_IOCTL(ops, VIDIOC_STREAMON, vidioc_streamon);
>>  		SET_VALID_IOCTL(ops, VIDIOC_STREAMOFF, vidioc_streamoff);
>>  	}
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 3b77433f6c32b..5ddd57939c49c 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -527,6 +527,26 @@ static void v4l_print_buffer(const void *arg, bool write_only)
>>  			tc->type, tc->flags, tc->frames, *(__u32 *)tc->userbits);
>>  }
>>  
>> +static void v4l_print_ext_buffer(const void *arg, bool write_only)
>> +{
>> +	const struct v4l2_ext_buffer *e = arg;
>> +	const struct v4l2_ext_plane *plane;
>> +	unsigned int i;
>> +
>> +	pr_cont("%lld index=%d, type=%s, flags=0x%08x, field=%s, sequence=%d, memory=%s\n",
>> +		e->timestamp, e->index, prt_names(e->type, v4l2_type_names),
>> +		e->flags, prt_names(e->field, v4l2_field_names),
>> +		e->sequence, prt_names(e->memory, v4l2_memory_names));
>> +
>> +	for (i = 0; i < VIDEO_MAX_PLANES &&
>> +		    e->planes[i].buffer_length; i++) {
>> +		plane = &e->planes[i];
>> +		pr_debug("plane %d: buffer_length=%d, plane_length=%d offset=0x%08x\n",
>> +			 i, plane->buffer_length, plane->plane_length,
>> +			 plane->offset);
>> +	}
>> +}
>> +
>>  static void v4l_print_exportbuffer(const void *arg, bool write_only)
>>  {
>>  	const struct v4l2_exportbuffer *p = arg;
>> @@ -546,6 +566,15 @@ static void v4l_print_create_buffers(const void *arg, bool write_only)
>>  	v4l_print_format(&p->format, write_only);
>>  }
>>  
>> +static void v4l_print_ext_create_buffers(const void *arg, bool write_only)
>> +{
>> +	const struct v4l2_ext_create_buffers *p = arg;
>> +
>> +	pr_cont("index=%d, count=%d, memory=%s, ", p->index, p->count,
>> +		prt_names(p->memory, v4l2_memory_names));
>> +	v4l_print_ext_pix_format(&p->format, write_only);
>> +}
>> +
>>  static void v4l_print_streamparm(const void *arg, bool write_only)
>>  {
>>  	const struct v4l2_streamparm *p = arg;
>> @@ -1214,6 +1243,139 @@ int v4l2_format_to_ext_pix_format(const struct v4l2_format *f,
>>  }
>>  EXPORT_SYMBOL_GPL(v4l2_format_to_ext_pix_format);
>>  
>> +/*
>> + * If mplane_cap is true, b->m.planes should have a valid pointer of a
>> + * struct v4l2_plane array, and b->length with its size
>> + */
>> +int v4l2_ext_buffer_to_buffer(const struct v4l2_ext_buffer *e,
>> +			      struct v4l2_buffer *b, bool mplane_cap)
>> +{
>> +	unsigned int planes_array_size = b->length;
>> +	struct v4l2_plane *planes = b->m.planes;
>> +	u64 nsecs;
>> +
>> +	if (!mplane_cap && e->planes[1].buffer_length != 0)
>> +		return -EINVAL;
>> +
>> +	memset(b, 0, sizeof(*b));
>> +
>> +	b->index = e->index;
>> +	b->flags = e->flags;
>> +	b->field = e->field;
>> +	b->sequence = e->sequence;
>> +	b->memory = e->memory;
>> +	b->request_fd = e->request_fd;
>> +	b->timestamp.tv_sec = div64_u64_rem(e->timestamp, NSEC_PER_SEC, &nsecs);
>> +	b->timestamp.tv_usec = (u32)nsecs / NSEC_PER_USEC;
>> +
>> +	if (mplane_cap) {
>> +		unsigned int i;
>> +
>> +		if (!planes || !planes_array_size)
>> +			return -EINVAL;
>> +
>> +		b->m.planes = planes;
>> +
>> +		if (e->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
>> +			b->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>> +		else
>> +			b->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>> +
>> +		for (i = 0; i < VIDEO_MAX_PLANES && i < planes_array_size &&
>> +			    e->planes[i].buffer_length; i++) {
>> +
>> +			if (b->memory != V4L2_MEMORY_MMAP && e->planes[i].offset)
>> +				return -EINVAL;
>> +
>> +			memset(&b->m.planes[i], 0, sizeof(b->m.planes[i]));
>> +
>> +			if (b->memory == V4L2_MEMORY_MMAP)
>> +				b->m.planes[i].m.mem_offset = e->planes[i].offset;
>> +			else if (b->memory == V4L2_MEMORY_DMABUF)
>> +				b->m.planes[i].m.fd = e->planes[i].m.dmabuf_fd;
>> +			else
>> +				b->m.planes[i].m.userptr = e->planes[i].m.userptr;
>> +
>> +			b->m.planes[i].bytesused = e->planes[i].plane_length;
>> +			b->m.planes[i].length = e->planes[i].buffer_length;
>> +		}
>> +		/* In multi-planar, length contain the number of planes */
>> +		b->length = i;
>> +	} else {
>> +		b->type = e->type;
>> +		b->bytesused = e->planes[0].plane_length;
>> +		b->length = e->planes[0].buffer_length;
>> +
>> +		if (b->memory != V4L2_MEMORY_MMAP && e->planes[0].offset)
>> +			return -EINVAL;
>> +
>> +		if (b->memory == V4L2_MEMORY_MMAP)
>> +			b->m.offset = e->planes[0].offset;
>> +		else if (b->memory == V4L2_MEMORY_DMABUF)
>> +			b->m.fd = e->planes[0].m.dmabuf_fd;
>> +		else
>> +			b->m.userptr = e->planes[0].m.userptr;
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_ext_buffer_to_buffer);
>> +
>> +int v4l2_buffer_to_ext_buffer(const struct v4l2_buffer *b,
>> +			      struct v4l2_ext_buffer *e)
>> +{
>> +	memset(e, 0, sizeof(*e));
>> +
>> +	e->index = b->index;
>> +	e->flags = b->flags;
>> +	e->field = b->field;
>> +	e->sequence = b->sequence;
>> +	e->memory = b->memory;
>> +	e->request_fd = b->request_fd;
>> +	e->timestamp = b->timestamp.tv_sec * NSEC_PER_SEC +
>> +		b->timestamp.tv_usec * NSEC_PER_USEC;
>> +	if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
>> +		unsigned int i;
>> +
>> +		if (!b->m.planes)
>> +			return -EINVAL;
>> +
>> +		if (b->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
>> +			e->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>> +		else
>> +			e->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
>> +
>> +		/* In multi-planar, length contain the number of planes */
>> +		for (i = 0; i < b->length; i++) {
>> +			if (b->memory == V4L2_MEMORY_MMAP)
>> +				e->planes[i].offset = b->m.planes[i].m.mem_offset;
>> +			else if (b->memory == V4L2_MEMORY_DMABUF)
>> +				e->planes[i].m.dmabuf_fd = b->m.planes[i].m.fd;
>> +			else
>> +				e->planes[i].m.userptr = b->m.planes[i].m.userptr;
>> +
>> +			e->planes[i].buffer_length = b->m.planes[i].length;
>> +			e->planes[i].plane_length = b->m.planes[i].bytesused;
>> +			if (b->m.planes[i].data_offset)
>> +				pr_warn("Ignoring data_offset value %d\n",
>> +					b->m.planes[i].data_offset);
>> +		}
>> +	} else {
>> +		e->type = b->type;
>> +		e->planes[0].plane_length = b->bytesused;
>> +		e->planes[0].buffer_length = b->length;
>> +		if (b->memory == V4L2_MEMORY_MMAP)
>> +			e->planes[0].offset = b->m.offset;
>> +		else if (b->memory == V4L2_MEMORY_DMABUF)
>> +			e->planes[0].m.dmabuf_fd = b->m.fd;
>> +		else
>> +			e->planes[0].m.userptr = b->m.userptr;
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_buffer_to_ext_buffer);
>> +
>>  static int v4l_querycap(const struct v4l2_ioctl_ops *ops,
>>  				struct file *file, void *fh, void *arg)
>>  {
>> @@ -2467,31 +2629,112 @@ static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops,
>>  	return ops->vidioc_reqbufs(file, fh, p);
>>  }
>>  
>> +static int v4l_do_buf_op(int (*op)(struct file *, void *,
>> +				   struct v4l2_buffer *),
>> +			 int (*ext_op)(struct file *, void *,
>> +				       struct v4l2_ext_buffer *),
>> +			 struct file *file, void *fh, struct v4l2_buffer *b)
>> +{
>> +	struct v4l2_ext_buffer e;
>> +	int ret;
>> +
>> +	ret = check_fmt(file, b->type);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (op)
>> +		return op(file, fh, b);
>> +
>> +	ret = v4l2_buffer_to_ext_buffer(b, &e);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = ext_op(file, fh, &e);
>> +	if (ret)
>> +		return ret;
>> +
>> +	v4l2_ext_buffer_to_buffer(&e, b, V4L2_TYPE_IS_MULTIPLANAR(b->type));
>> +	return 0;
>> +}
>> +
>> +static int v4l_do_ext_buf_op(int (*op)(struct file *, void *,
>> +				       struct v4l2_buffer *),
>> +			     int (*ext_op)(struct file *, void *,
>> +					   struct v4l2_ext_buffer *),
>> +			     struct file *file, void *fh,
>> +			     struct v4l2_ext_buffer *e)
>> +{
>> +	struct video_device *vdev = video_devdata(file);
>> +	struct v4l2_plane planes[VIDEO_MAX_PLANES];
>> +	struct v4l2_buffer b;
>> +	bool mplane_cap;
>> +	int ret;
>> +
>> +	ret = check_fmt(file, e->type);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (ext_op)
>> +		return ext_op(file, fh, e);
>> +
>> +	mplane_cap = !!(vdev->device_caps &
>> +			(V4L2_CAP_VIDEO_CAPTURE_MPLANE |
>> +			 V4L2_CAP_VIDEO_OUTPUT_MPLANE |
>> +			 V4L2_CAP_VIDEO_M2M_MPLANE));
>> +	b.m.planes = planes;
>> +	b.length = VIDEO_MAX_PLANES;
>> +	ret = v4l2_ext_buffer_to_buffer(e, &b, mplane_cap);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = op(file, fh, &b);
>> +	if (ret)
>> +		return ret;
>> +
>> +	v4l2_buffer_to_ext_buffer(&b, e);
>> +	return 0;
>> +}
>> +
>>  static int v4l_querybuf(const struct v4l2_ioctl_ops *ops,
>> -				struct file *file, void *fh, void *arg)
>> +			struct file *file, void *fh, void *arg)
>>  {
>> -	struct v4l2_buffer *p = arg;
>> -	int ret = check_fmt(file, p->type);
>> +	return v4l_do_buf_op(ops->vidioc_querybuf, ops->vidioc_ext_querybuf,
>> +			     file, fh, arg);
>> +}
>>  
>> -	return ret ? ret : ops->vidioc_querybuf(file, fh, p);
>> +static int v4l_ext_querybuf(const struct v4l2_ioctl_ops *ops,
>> +			    struct file *file, void *fh, void *arg)
>> +{
>> +	return v4l_do_ext_buf_op(ops->vidioc_querybuf,
>> +				 ops->vidioc_ext_querybuf, file, fh, arg);
>>  }
>>  
>>  static int v4l_qbuf(const struct v4l2_ioctl_ops *ops,
>> -				struct file *file, void *fh, void *arg)
>> +		    struct file *file, void *fh, void *arg)
>>  {
>> -	struct v4l2_buffer *p = arg;
>> -	int ret = check_fmt(file, p->type);
>> +	return v4l_do_buf_op(ops->vidioc_qbuf, ops->vidioc_ext_qbuf,
>> +			     file, fh, arg);
>> +}
>>  
>> -	return ret ? ret : ops->vidioc_qbuf(file, fh, p);
>> +static int v4l_ext_qbuf(const struct v4l2_ioctl_ops *ops,
>> +			struct file *file, void *fh, void *arg)
>> +{
>> +	return v4l_do_ext_buf_op(ops->vidioc_qbuf, ops->vidioc_ext_qbuf,
>> +				 file, fh, arg);
>>  }
>>  
>>  static int v4l_dqbuf(const struct v4l2_ioctl_ops *ops,
>> -				struct file *file, void *fh, void *arg)
>> +		     struct file *file, void *fh, void *arg)
>>  {
>> -	struct v4l2_buffer *p = arg;
>> -	int ret = check_fmt(file, p->type);
>> +	return v4l_do_buf_op(ops->vidioc_dqbuf, ops->vidioc_ext_dqbuf,
>> +			     file, fh, arg);
>> +}
>>  
>> -	return ret ? ret : ops->vidioc_dqbuf(file, fh, p);
>> +static int v4l_ext_dqbuf(const struct v4l2_ioctl_ops *ops,
>> +			 struct file *file, void *fh, void *arg)
>> +{
>> +	return v4l_do_ext_buf_op(ops->vidioc_dqbuf, ops->vidioc_ext_dqbuf,
>> +				 file, fh, arg);
>>  }
>>  
>>  static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
>> @@ -2507,7 +2750,27 @@ static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
>>  
>>  	v4l_sanitize_format(&create->format);
>>  
>> -	ret = ops->vidioc_create_bufs(file, fh, create);
>> +	if (ops->vidioc_create_bufs) {
>> +		ret = ops->vidioc_create_bufs(file, fh, create);
>> +	} else {
>> +		struct v4l2_ext_create_buffers ecreate = {
>> +			.count = create->count,
>> +			.memory = create->memory,
>> +		};
>> +
>> +		ret = v4l2_format_to_ext_pix_format(&create->format,
>> +						    &ecreate.format, true);
>> +		if (ret)
>> +			return ret;
>> +
>> +		ret = ops->vidioc_ext_create_bufs(file, fh, &ecreate);
>> +		if (ret)
>> +			return ret;
>> +
>> +		create->index = ecreate.index;
>> +		create->count = ecreate.count;
>> +		create->capabilities = ecreate.capabilities;
>> +	}
>>  
>>  	if (create->format.type == V4L2_BUF_TYPE_VIDEO_CAPTURE ||
>>  	    create->format.type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
>> @@ -2516,13 +2779,60 @@ static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
>>  	return ret;
>>  }
>>  
>> +static int v4l_ext_create_bufs(const struct v4l2_ioctl_ops *ops,
>> +			       struct file *file, void *fh, void *arg)
>> +{
>> +	struct v4l2_ext_create_buffers *ecreate = arg;
>> +	struct video_device *vdev = video_devdata(file);
>> +	struct v4l2_create_buffers create = {
>> +		.count = ecreate->count,
>> +		.memory = ecreate->memory,
>> +		.flags = ecreate->flags,
>> +	};
>> +	bool mplane_cap;
>> +	int ret;
>> +
>> +	ret = check_fmt(file, ecreate->format.type);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (ops->vidioc_ext_create_bufs)
>> +		return ops->vidioc_ext_create_bufs(file, fh, ecreate);
>> +
>> +	mplane_cap = !!(vdev->device_caps &
>> +			(V4L2_CAP_VIDEO_CAPTURE_MPLANE |
>> +			 V4L2_CAP_VIDEO_OUTPUT_MPLANE |
>> +			 V4L2_CAP_VIDEO_M2M_MPLANE));
>> +	ret = v4l2_ext_pix_format_to_format(&ecreate->format,
>> +					    &create.format, mplane_cap, true);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = v4l_create_bufs(ops, file, fh, &create);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ecreate->index = create.index;
>> +	ecreate->count = create.count;
>> +	ecreate->capabilities = create.capabilities;
>> +
>> +	return 0;
>> +}
>> +
>>  static int v4l_prepare_buf(const struct v4l2_ioctl_ops *ops,
>> -				struct file *file, void *fh, void *arg)
>> +			   struct file *file, void *fh, void *arg)
>>  {
>> -	struct v4l2_buffer *b = arg;
>> -	int ret = check_fmt(file, b->type);
>> +	return v4l_do_buf_op(ops->vidioc_prepare_buf,
>> +			     ops->vidioc_ext_prepare_buf,
>> +			     file, fh, arg);
>> +}
>>  
>> -	return ret ? ret : ops->vidioc_prepare_buf(file, fh, b);
>> +static int v4l_ext_prepare_buf(const struct v4l2_ioctl_ops *ops,
>> +			       struct file *file, void *fh, void *arg)
>> +{
>> +	return v4l_do_ext_buf_op(ops->vidioc_prepare_buf,
>> +				 ops->vidioc_ext_prepare_buf,
>> +				 file, fh, arg);
>>  }
>>  
>>  static int v4l_g_parm(const struct v4l2_ioctl_ops *ops,
>> @@ -3196,12 +3506,15 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
>>  	IOCTL_INFO(VIDIOC_S_EXT_PIX_FMT, v4l_s_ext_pix_fmt, v4l_print_ext_pix_format, INFO_FL_PRIO),
>>  	IOCTL_INFO(VIDIOC_REQBUFS, v4l_reqbufs, v4l_print_requestbuffers, INFO_FL_PRIO | INFO_FL_QUEUE),
>>  	IOCTL_INFO(VIDIOC_QUERYBUF, v4l_querybuf, v4l_print_buffer, INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_buffer, length)),
>> +	IOCTL_INFO(VIDIOC_EXT_QUERYBUF, v4l_ext_querybuf, v4l_print_ext_buffer, INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_ext_buffer, planes)),
>>  	IOCTL_INFO(VIDIOC_G_FBUF, v4l_stub_g_fbuf, v4l_print_framebuffer, 0),
>>  	IOCTL_INFO(VIDIOC_S_FBUF, v4l_stub_s_fbuf, v4l_print_framebuffer, INFO_FL_PRIO),
>>  	IOCTL_INFO(VIDIOC_OVERLAY, v4l_overlay, v4l_print_u32, INFO_FL_PRIO),
>>  	IOCTL_INFO(VIDIOC_QBUF, v4l_qbuf, v4l_print_buffer, INFO_FL_QUEUE),
>>  	IOCTL_INFO(VIDIOC_EXPBUF, v4l_stub_expbuf, v4l_print_exportbuffer, INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_exportbuffer, flags)),
>> +	IOCTL_INFO(VIDIOC_EXT_QBUF, v4l_ext_qbuf, v4l_print_ext_buffer, INFO_FL_QUEUE),
>>  	IOCTL_INFO(VIDIOC_DQBUF, v4l_dqbuf, v4l_print_buffer, INFO_FL_QUEUE),
>> +	IOCTL_INFO(VIDIOC_EXT_DQBUF, v4l_ext_dqbuf, v4l_print_ext_buffer, INFO_FL_QUEUE),
>>  	IOCTL_INFO(VIDIOC_STREAMON, v4l_streamon, v4l_print_buftype, INFO_FL_PRIO | INFO_FL_QUEUE),
>>  	IOCTL_INFO(VIDIOC_STREAMOFF, v4l_streamoff, v4l_print_buftype, INFO_FL_PRIO | INFO_FL_QUEUE),
>>  	IOCTL_INFO(VIDIOC_G_PARM, v4l_g_parm, v4l_print_streamparm, INFO_FL_CLEAR(v4l2_streamparm, type)),
>> @@ -3266,7 +3579,9 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
>>  	IOCTL_INFO(VIDIOC_SUBSCRIBE_EVENT, v4l_subscribe_event, v4l_print_event_subscription, 0),
>>  	IOCTL_INFO(VIDIOC_UNSUBSCRIBE_EVENT, v4l_unsubscribe_event, v4l_print_event_subscription, 0),
>>  	IOCTL_INFO(VIDIOC_CREATE_BUFS, v4l_create_bufs, v4l_print_create_buffers, INFO_FL_PRIO | INFO_FL_QUEUE),
>> +	IOCTL_INFO(VIDIOC_EXT_CREATE_BUFS, v4l_ext_create_bufs, v4l_print_ext_create_buffers, INFO_FL_PRIO | INFO_FL_QUEUE),
>>  	IOCTL_INFO(VIDIOC_PREPARE_BUF, v4l_prepare_buf, v4l_print_buffer, INFO_FL_QUEUE),
>> +	IOCTL_INFO(VIDIOC_EXT_PREPARE_BUF, v4l_ext_prepare_buf, v4l_print_ext_buffer, INFO_FL_QUEUE),
>>  	IOCTL_INFO(VIDIOC_ENUM_DV_TIMINGS, v4l_stub_enum_dv_timings, v4l_print_enum_dv_timings, INFO_FL_CLEAR(v4l2_enum_dv_timings, pad)),
>>  	IOCTL_INFO(VIDIOC_QUERY_DV_TIMINGS, v4l_stub_query_dv_timings, v4l_print_dv_timings, INFO_FL_ALWAYS_COPY),
>>  	IOCTL_INFO(VIDIOC_DV_TIMINGS_CAP, v4l_stub_dv_timings_cap, v4l_print_dv_timings_cap, INFO_FL_CLEAR(v4l2_dv_timings_cap, pad)),
>> diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
>> index 525ce86725260..524caedebab3d 100644
>> --- a/include/media/v4l2-ioctl.h
>> +++ b/include/media/v4l2-ioctl.h
>> @@ -169,16 +169,26 @@ struct v4l2_fh;
>>   *	:ref:`VIDIOC_REQBUFS <vidioc_reqbufs>` ioctl
>>   * @vidioc_querybuf: pointer to the function that implements
>>   *	:ref:`VIDIOC_QUERYBUF <vidioc_querybuf>` ioctl
>> + * @vidioc_ext_querybuf: pointer to the function that implements
>> + *	:ref:`VIDIOC_EXT_QUERYBUF <vidioc_ext_querybuf>` ioctl
>>   * @vidioc_qbuf: pointer to the function that implements
>>   *	:ref:`VIDIOC_QBUF <vidioc_qbuf>` ioctl
>> + * @vidioc_ext_qbuf: pointer to the function that implements
>> + *	:ref:`VIDIOC_EXT_QBUF <vidioc_ext_qbuf>` ioctl
>>   * @vidioc_expbuf: pointer to the function that implements
>>   *	:ref:`VIDIOC_EXPBUF <vidioc_expbuf>` ioctl
>>   * @vidioc_dqbuf: pointer to the function that implements
>>   *	:ref:`VIDIOC_DQBUF <vidioc_qbuf>` ioctl
>> + * @vidioc_ext_dqbuf: pointer to the function that implements
>> + *	:ref:`VIDIOC_EXT_DQBUF <vidioc_ext_qbuf>` ioctl
>>   * @vidioc_create_bufs: pointer to the function that implements
>>   *	:ref:`VIDIOC_CREATE_BUFS <vidioc_create_bufs>` ioctl
>> + * @vidioc_ext_create_bufs: pointer to the function that implements
>> + *	:ref:`VIDIOC_EXT_CREATE_BUFS <vidioc_ext_create_bufs>` ioctl
>>   * @vidioc_prepare_buf: pointer to the function that implements
>>   *	:ref:`VIDIOC_PREPARE_BUF <vidioc_prepare_buf>` ioctl
>> + * @vidioc_ext_prepare_buf: pointer to the function that implements
>> + *	:ref:`VIDIOC_EXT_PREPARE_BUF <vidioc_ext_prepare_buf>` ioctl
>>   * @vidioc_overlay: pointer to the function that implements
>>   *	:ref:`VIDIOC_OVERLAY <vidioc_overlay>` ioctl
>>   * @vidioc_g_fbuf: pointer to the function that implements
>> @@ -439,17 +449,27 @@ struct v4l2_ioctl_ops {
>>  			      struct v4l2_requestbuffers *b);
>>  	int (*vidioc_querybuf)(struct file *file, void *fh,
>>  			       struct v4l2_buffer *b);
>> +	int (*vidioc_ext_querybuf)(struct file *file, void *fh,
>> +				   struct v4l2_ext_buffer *b);
>>  	int (*vidioc_qbuf)(struct file *file, void *fh,
>>  			   struct v4l2_buffer *b);
>> +	int (*vidioc_ext_qbuf)(struct file *file, void *fh,
>> +			       struct v4l2_ext_buffer *b);
>>  	int (*vidioc_expbuf)(struct file *file, void *fh,
>>  			     struct v4l2_exportbuffer *e);
>>  	int (*vidioc_dqbuf)(struct file *file, void *fh,
>>  			    struct v4l2_buffer *b);
>> +	int (*vidioc_ext_dqbuf)(struct file *file, void *fh,
>> +				struct v4l2_ext_buffer *b);
>>  
>>  	int (*vidioc_create_bufs)(struct file *file, void *fh,
>>  				  struct v4l2_create_buffers *b);
>> +	int (*vidioc_ext_create_bufs)(struct file *file, void *fh,
>> +				      struct v4l2_ext_create_buffers *b);
>>  	int (*vidioc_prepare_buf)(struct file *file, void *fh,
>>  				  struct v4l2_buffer *b);
>> +	int (*vidioc_ext_prepare_buf)(struct file *file, void *fh,
>> +				      struct v4l2_ext_buffer *b);
>>  
>>  	int (*vidioc_overlay)(struct file *file, void *fh, unsigned int i);
>>  	int (*vidioc_g_fbuf)(struct file *file, void *fh,
>> @@ -758,6 +778,12 @@ int v4l2_ext_pix_format_to_format(const struct v4l2_ext_pix_format *e,
>>  				  struct v4l2_format *f,
>>  				  bool mplane_cap, bool strict);
>>  
>> +int v4l2_ext_buffer_to_buffer(const struct v4l2_ext_buffer *e,
>> +			      struct v4l2_buffer *b,
>> +			      bool mplane_cap);
>> +int v4l2_buffer_to_ext_buffer(const struct v4l2_buffer *b,
>> +			      struct v4l2_ext_buffer *e);
>> +
>>  /*
>>   * The user space interpretation of the 'v4l2_event' differs
>>   * based on the 'time_t' definition on 32-bit architectures, so
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index fc04c81ce7713..f4906adddc280 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -994,6 +994,37 @@ struct v4l2_plane {
>>  	__u32			reserved[11];
>>  };
>>  
>> +/**
>> + * struct v4l2_ext_plane - extended plane buffer info
>> + * @buffer_length:	size of the entire buffer in bytes, should fit
>> + *			@offset + @plane_length
>> + * @plane_length:	size of the plane in bytes.
>> + * @userptr:		when memory is V4L2_MEMORY_USERPTR, a userspace pointer pointing
>> + *			to this plane.
>> + * @dmabuf_fd:		when memory is V4L2_MEMORY_DMABUF, a userspace file descriptor
>> + *			associated with this plane.
>> + * @offset:		offset in the memory buffer where the plane starts. If
>> + *			V4L2_MEMORY_MMAP is used, then it can be a "cookie" that
>> + *			should be passed to mmap() called on the video node.
> 
> I wouldn't overload this field. Just keep a mem_offset field in the union m.
> 
> The offset field itself is still valid, even for MMAPed planes.

ack

> 
>> + * @reserved:		extra space reserved for future fields, must be set to 0.
>> + *
>> + *
>> + * Buffers consist of one or more planes, e.g. an YCbCr buffer with two planes
>> + * can have one plane for Y, and another for interleaved CbCr components.
>> + * Each plane can reside in a separate memory buffer, or even in
>> + * a completely separate memory node (e.g. in embedded devices).
>> + */
>> +struct v4l2_ext_plane {
>> +	__u32 buffer_length;
>> +	__u32 plane_length;
>> +	union {
>> +		__u64 userptr;
>> +		__s32 dmabuf_fd;
>> +	} m;
>> +	__u32 offset;
>> +	__u32 reserved[4];
>> +};
>> +
>>  /**
>>   * struct v4l2_buffer - video buffer info
>>   * @index:	id number of the buffer
>> @@ -1055,6 +1086,36 @@ struct v4l2_buffer {
>>  	};
>>  };
>>  
>> +/**
>> + * struct v4l2_ext_buffer - extended video buffer info
>> + * @index:	id number of the buffer
>> + * @type:	V4L2_BUF_TYPE_VIDEO_CAPTURE or V4L2_BUF_TYPE_VIDEO_OUTPUT
>> + * @flags:	buffer informational flags
>> + * @field:	enum v4l2_field; field order of the image in the buffer
>> + * @timestamp:	frame timestamp
>> + * @sequence:	sequence count of this frame
>> + * @memory:	enum v4l2_memory; the method, in which the actual video data is
>> + *		passed
>> + * @planes:	per-plane buffer information
>> + * @request_fd:	fd of the request that this buffer should use
>> + * @reserved:	extra space reserved for future fields, must be set to 0
>> + *
>> + * Contains data exchanged by application and driver using one of the Streaming
>> + * I/O methods.
>> + */
>> +struct v4l2_ext_buffer {
>> +	__u32 index;
>> +	__u32 type;
>> +	__u32 flags;
> 
> Make this a u64: we have quite a few flags already.

ack

> 
>> +	__u32 field;
>> +	__u64 timestamp;
> 
> We need a second timestamp here, i.e. the time at which the buffer was finalized
> and returned to userspace. This is needed to let userspace make a timeline between
> events and buffers. Each v4l2_event has a timestamp but it can't be used to
> see if a buffer was returned before or after that event. It's something that's
> been annoying me for some time now.

I'll let Nicolas comment on this, but it seems synchronizing buffer and events
in userspace is a bit more complicated.
We could also add this later with the reserved fields when we have a clearer view
and a PoC with userspace.

Regards,
Helen

> 
> A '__u64 seq_timestamp' seems like a decent name.
> 
> Regards,
> 
> 	Hans
> 
>> +	__u32 sequence;
>> +	__u32 memory;
>> +	__u32 request_fd;
>> +	struct v4l2_ext_plane planes[VIDEO_MAX_PLANES];
>> +	__u32 reserved[4];
>> +};
>> +
>>  #ifndef __KERNEL__
>>  /**
>>   * v4l2_timeval_to_ns - Convert timeval to nanoseconds
>> @@ -2520,6 +2581,29 @@ struct v4l2_create_buffers {
>>  	__u32			reserved[6];
>>  };
>>  
>> +/**
>> + * struct v4l2_ext_create_buffers - VIDIOC_EXT_CREATE_BUFS argument
>> + * @index:	on return, index of the first created buffer
>> + * @count:	entry: number of requested buffers,
>> + *		return: number of created buffers
>> + * @memory:	enum v4l2_memory; buffer memory type
>> + * @capabilities: capabilities of this buffer type.
>> + * @format:	frame format, for which buffers are requested
>> + * @flags:	additional buffer management attributes (ignored unless the
>> + *		queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS capability
>> + *		and configured for MMAP streaming I/O).
>> + * @reserved:	extra space reserved for future fields, must be set to 0
>> + */
>> +struct v4l2_ext_create_buffers {
>> +	__u32				index;
>> +	__u32				count;
>> +	__u32				memory;
>> +	struct v4l2_ext_pix_format	format;
>> +	__u32				capabilities;
>> +	__u32				flags;
>> +	__u32 reserved[4];
>> +};
>> +
>>  /*
>>   *	I O C T L   C O D E S   F O R   V I D E O   D E V I C E S
>>   *
>> @@ -2623,6 +2707,11 @@ struct v4l2_create_buffers {
>>  #define VIDIOC_G_EXT_PIX_FMT	_IOWR('V', 104, struct v4l2_ext_pix_format)
>>  #define VIDIOC_S_EXT_PIX_FMT	_IOWR('V', 105, struct v4l2_ext_pix_format)
>>  #define VIDIOC_TRY_EXT_PIX_FMT	_IOWR('V', 106, struct v4l2_ext_pix_format)
>> +#define VIDIOC_EXT_CREATE_BUFS	_IOWR('V', 107, struct v4l2_ext_create_buffers)
>> +#define VIDIOC_EXT_QUERYBUF	_IOWR('V', 108, struct v4l2_ext_buffer)
>> +#define VIDIOC_EXT_QBUF		_IOWR('V', 109, struct v4l2_ext_buffer)
>> +#define VIDIOC_EXT_DQBUF	_IOWR('V', 110, struct v4l2_ext_buffer)
>> +#define VIDIOC_EXT_PREPARE_BUF	_IOWR('V', 111, struct v4l2_ext_buffer)
>>  
>>  /* Reminder: when adding new ioctls please add support for them to
>>     drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
>>
> 
