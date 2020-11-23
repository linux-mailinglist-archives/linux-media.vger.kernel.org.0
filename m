Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 743C02C16CA
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 21:50:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728721AbgKWUd3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 15:33:29 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38018 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727448AbgKWUd2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 15:33:28 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id DF66D1F448F1
Subject: Re: [PATCH v5 2/7] media: v4l2: Add extended buffer operations
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     mchehab@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        linux-media@vger.kernel.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        hiroh@chromium.org, nicolas@ndufresne.ca, Brian.Starkey@arm.com,
        kernel@collabora.com, narmstrong@baylibre.com,
        linux-kernel@vger.kernel.org, frkoenig@chromium.org,
        mjourdan@baylibre.com, stanimir.varbanov@linaro.org
References: <20200804192939.2251988-1-helen.koike@collabora.com>
 <20200804192939.2251988-3-helen.koike@collabora.com>
 <20201120111403.GB841224@chromium.org>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <164584fc-a0c3-7988-fc43-8b3f19d46988@collabora.com>
Date:   Mon, 23 Nov 2020 17:33:16 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120111403.GB841224@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,


On 11/20/20 8:14 AM, Tomasz Figa wrote:
> Hi Helen,
> 
> On Tue, Aug 04, 2020 at 04:29:34PM -0300, Helen Koike wrote:
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
> 
> Thanks for the patch. Please see my comments inline.

Thank you for your detailed review, please see my comments below.

> 
>> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>> ---
>> Changes in v5:
>> - migrate memory from v4l2_ext_buffer to v4l2_ext_plane
>> - return mem_offset to struct v4l2_ext_plane
>> - change sizes and reorder fields to avoid holes in the struct and make
>>   it the same for 32 and 64 bits
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
>>   later on
>> ---
>>  drivers/media/v4l2-core/v4l2-dev.c   |  29 ++-
>>  drivers/media/v4l2-core/v4l2-ioctl.c | 353 +++++++++++++++++++++++++--
>>  include/media/v4l2-ioctl.h           |  26 ++
>>  include/uapi/linux/videodev2.h       |  90 +++++++
>>  4 files changed, 476 insertions(+), 22 deletions(-)
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
> 
> nit: Could we stick to the SET_VALID_IOCTL() macro and just call it twice,
> once for the new and once for the legacy callback?

Ack.

> 
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
> 
> Is it valid to check the new callbacks for devices that the new API is not
> valid for (e.g. vbi)? Perhaps we could call SET_VALID_IOCTL(ops, <ioctl>,
> vidioc_ext_*) in the upper if added in this patch and keep the code above
> as is?

Just to be clear, the only valid type should be VFL_TYPE_VIDEO right?
Ext but API won't support touch devices for instance, right?


> 
>>  		SET_VALID_IOCTL(ops, VIDIOC_STREAMON, vidioc_streamon);
>>  		SET_VALID_IOCTL(ops, VIDIOC_STREAMOFF, vidioc_streamoff);
>>  	}
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 14a0def50f8ea..7ecdd9cc1bf48 100644
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
>> +	pr_cont("%lld index=%d, type=%s, flags=0x%08x, field=%s, sequence=%d\n",
>> +		e->timestamp, e->index, prt_names(e->type, v4l2_type_names),
>> +		e->flags, prt_names(e->field, v4l2_field_names), e->sequence);
> 
> Should we also print the request FD?

Yes, I'll update this for next version.

> 
>> +
>> +	for (i = 0; i < VIDEO_MAX_PLANES &&
>> +		    e->planes[i].buffer_length; i++) {
>> +		plane = &e->planes[i];
>> +		pr_debug("plane %d: buffer_length=%d, plane_length=%d offset=0x%08x, memory=%s\n",
>> +			 i, plane->buffer_length, plane->plane_length,
>> +			 plane->offset,
>> +			 prt_names(plane->memory, v4l2_memory_names));
> 
> Should we also print mem_offset/userptr/dmabuf_fd?

I see they are not printed by v4l_print_buffer(), since these fields are in an
union, the value of two of them will be invalid (I wonder if this can bring
confusion).
I also wondered if printing them can't cause a security issue.

But I can add those prints if you think it make sense.

> 
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
> 
> Should we also print capabilities and flags?

I just saw these prints are called after the ioctl handler, and not before,
to I guess it make sense.

It is not printed by v4l_print_create_buffers(), I think we can add in both then.

> 
>> +}
>> +
>>  static void v4l_print_streamparm(const void *arg, bool write_only)
>>  {
>>  	const struct v4l2_streamparm *p = arg;
>> @@ -1220,6 +1249,143 @@ int v4l2_format_to_ext_pix_format(const struct v4l2_format *f,
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
>> +	b->memory = e->planes[0].memory;
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
> 
> planes was initialized to b->m.planes at declaration time. Should we
> perhaps move its declaration to within this block to make it more clear and
> remove this assignment?

The variable "planes" is saving the pointer of b->m.planes before we do
memset(b, 0, sizeof(*b)), so I can reassing it back if it make sense.

I can add a comment to make this more clear.

> 
>> +
>> +		if (e->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
>> +			b->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>> +		else
>> +			b->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>> +
>> +		for (i = 0; i < VIDEO_MAX_PLANES && i < planes_array_size &&
>> +			    e->planes[i].buffer_length; i++) {
>> +
>> +			if (e->planes[0].memory != e->planes[i].memory)
>> +				return -EINVAL;
>> +
>> +			if (e->planes[i].offset)
>> +				return -EINVAL;
> 
> Is it really invalid to have a non-zero offset? Shouldn't the data_offset
> field of the legacy struct be populated instead, in the cases where it was
> defined to be valid?

My understanding of data_offset, is that it is used when the hardware can
write/read a header to/from the buffer.

But this doesn't seem to be used by any driver, so there is an attempt to
repourpose it here:

    https://patchwork.linuxtv.org/project/linux-media/patch/1429040689-23808-2-git-send-email-laurent.pinchart@ideasonboard.com/

But this wans't merged.

So in the current API, there is no way to specify an offset in the buffer.

I guess we can repurpose data_offset first, what do you think?

> 
>> +
>> +			memset(&b->m.planes[i], 0, sizeof(b->m.planes[i]));
>> +
>> +			if (b->memory == V4L2_MEMORY_MMAP)
>> +				b->m.planes[i].m.mem_offset = e->planes[i].m.mem_offset;
>> +			else if (b->memory == V4L2_MEMORY_DMABUF)
>> +				b->m.planes[i].m.fd = e->planes[i].m.dmabuf_fd;
>> +			else
>> +				b->m.planes[i].m.userptr = e->planes[i].m.userptr;
>> +
>> +			b->m.planes[i].bytesused = e->planes[i].plane_length;
> 
> I might be getting the meaning of plane_length wrong, but doesn't this
> depend on the direction? If the userspace gives a CAPTURE buffer, it would
> have bytesused = 0, but if the kernel returns it, it would have bytesused =
> <size of the payload>.

You are right, it depends on the direction, thanks for catching this.

Also, in the Ext api, we don't have the <size of the payload>, so I'm using the
plane_length instead, I'm not sure if there is a better way.

> 
>> +			b->m.planes[i].length = e->planes[i].buffer_length;
>> +		}
>> +		/* In multi-planar, length contain the number of planes */
>> +		b->length = i;
>> +	} else {
>> +		b->type = e->type;
>> +		b->bytesused = e->planes[0].plane_length;
>> +		b->length = e->planes[0].buffer_length;
>> +
>> +		if (e->planes[0].offset)
>> +			return -EINVAL;
> 
> Ditto.

Ack.

> 
>> +
>> +		if (b->memory == V4L2_MEMORY_MMAP)
>> +			b->m.offset = e->planes[0].m.mem_offset;
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
> 
> The design of the new struct implies that the planes describe color planes
> and not memory planes, so this code is incorrect, because for non-M format
> variants it would fill in only the first plane of the new struct.

Yes, as discussed in 1/7, the handling of planes is wrong, I'll correct
this for next version.

> 
>> +			if (b->memory == V4L2_MEMORY_MMAP)
>> +				e->planes[i].m.mem_offset = b->m.planes[i].m.mem_offset;
>> +			else if (b->memory == V4L2_MEMORY_DMABUF)
>> +				e->planes[i].m.dmabuf_fd = b->m.planes[i].m.fd;
>> +			else
>> +				e->planes[i].m.userptr = b->m.planes[i].m.userptr;
>> +
>> +			e->planes[i].memory = b->memory;
>> +			e->planes[i].buffer_length = b->m.planes[i].length;
>> +			e->planes[i].plane_length = b->m.planes[i].bytesused;
>> +			if (b->m.planes[i].data_offset)
>> +				pr_warn("Ignoring data_offset value %d\n",
>> +					b->m.planes[i].data_offset);
> 
> Why? As per my comment above, there are valid use cases defined in the spec.

Please see my comment about about data_offset.

> 
>> +		}
>> +	} else {
>> +		e->type = b->type;
>> +		e->planes[0].memory = b->memory;
>> +		e->planes[0].plane_length = b->bytesused;
>> +		e->planes[0].buffer_length = b->length;
>> +		if (b->memory == V4L2_MEMORY_MMAP)
>> +			e->planes[0].m.mem_offset = b->m.offset;
>> +		else if (b->memory == V4L2_MEMORY_DMABUF)
>> +			e->planes[0].m.dmabuf_fd = b->m.fd;
>> +		else
>> +			e->planes[0].m.userptr = b->m.userptr;
> 
> Similar to the MULTIPLANAR case, we should fill in the planes[] entries
> corresponding to the number of color planes of the format, e.g. 2 for NV12.

Ack.

> 
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_buffer_to_ext_buffer);
>> +
>>  static int v4l_querycap(const struct v4l2_ioctl_ops *ops,
>>  				struct file *file, void *fh, void *arg)
>>  {
>> @@ -2473,31 +2639,112 @@ static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops,
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
>> @@ -2513,7 +2760,27 @@ static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
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
>> @@ -2522,13 +2789,60 @@ static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
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
>> @@ -3202,12 +3516,15 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
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
> 
> Looking at the other entries, shouldn't this one be 1 line higher?

Yes.

> 
> That said, I wonder if it wouldn't look cleaner if we just put all the
> EXT ioctls together at the bottom.

I can move them and we can see if it is better or not.

> 
>>  	IOCTL_INFO(VIDIOC_DQBUF, v4l_dqbuf, v4l_print_buffer, INFO_FL_QUEUE),
>> +	IOCTL_INFO(VIDIOC_EXT_DQBUF, v4l_ext_dqbuf, v4l_print_ext_buffer, INFO_FL_QUEUE),
>>  	IOCTL_INFO(VIDIOC_STREAMON, v4l_streamon, v4l_print_buftype, INFO_FL_PRIO | INFO_FL_QUEUE),
>>  	IOCTL_INFO(VIDIOC_STREAMOFF, v4l_streamoff, v4l_print_buftype, INFO_FL_PRIO | INFO_FL_QUEUE),
>>  	IOCTL_INFO(VIDIOC_G_PARM, v4l_g_parm, v4l_print_streamparm, INFO_FL_CLEAR(v4l2_streamparm, type)),
>> @@ -3272,7 +3589,9 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
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
>> index 8bbcb74d8ee31..75996657ad1ba 100644
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
>> index 7123c6a4d9569..334cafdd2be97 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -996,6 +996,41 @@ struct v4l2_plane {
>>  	__u32			reserved[11];
>>  };
>>  
>> +/**
>> + * struct v4l2_ext_plane - extended plane buffer info
>> + * @buffer_length:	size of the entire buffer in bytes, should fit
>> + *			@offset + @plane_length
> 
> Do we actually need this buffer_length at all? We have 3 memory types:
> 
> 1) MMAP - here vb2 already knows the buffer size, because it created it.
> 
> 2) DMABUF - the DMA-buf kAPI provides the information about buffer size.
> 
> 3) USERPTR - this might actually benefit from buffer_length, because there
>    are additional alignmnent requirements for the user memory, e.g. the
>    offset and size must be cacheline aligned.
> 
> Arguably, 1) and 2) are the main usage scenarios, while the user space that
> uses them would have to suffer from added complexity, because of the
> legacy/niche case 3).
> 
> Could we make this field valid only for USERPTR?

I think so, make sense, I'll implement this for next version.

> 
>> + * @plane_length:	size of the plane in bytes.
>> + * @mem_offset:		If V4L2_MEMORY_MMAP is used, then it can be a "cookie"
>> + *			that should be passed to mmap() called on the video node.
>> + * @userptr:		when memory is V4L2_MEMORY_USERPTR, a userspace pointer pointing
>> + *			to this plane.
>> + * @dmabuf_fd:		when memory is V4L2_MEMORY_DMABUF, a userspace file descriptor
>> + *			associated with this plane.
>> + * @offset:		offset in the memory buffer where the plane starts.
>> + * @memory:		enum v4l2_memory; the method, in which the actual video
>> + *			data is passed
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
>> +		__u32 mem_offset;
>> +		__u64 userptr;
>> +		__s32 dmabuf_fd;
>> +	} m;
>> +	__u32 offset;
>> +	__u32 memory;
>> +	__u32 reserved[4];
>> +};
> 
> Don't we also need bytesused? Or would plane_length essentially mean the
> amount of space or payload, depending on the usage context?

In my understanding, plane_length is the max amount of data the plane can
occupy, othersize it can overflow the buffer or mess with another plane
that is in the same buffer on a different offset.

I'm probably wrong, but I don't really see why the payload size is usefull,
unless if we set a plane_legth that is much bigger then the data it can carry,
that can impact performance.
Payload can also be calculated from the format.

I can add it back if it is usefull. Please let me know your thoughts.

> 
> Similarly, the original data_offset was useful as a return field, which
> some drivers use to indicate that the beginning of the plane is occupied by
> some header or otherwise irrelevant data, which must be skipped. Would the
> offset field be used for this purpose now?

I didn't add an equivalent of the data_offset, since it seemed to be
unused (please see my comments about this above).

> 
>> +
>>  /**
>>   * struct v4l2_buffer - video buffer info
>>   * @index:	id number of the buffer
>> @@ -1057,6 +1092,33 @@ struct v4l2_buffer {
>>  	};
>>  };
>>  
>> +/**
>> + * struct v4l2_ext_buffer - extended video buffer info
>> + * @index:	id number of the buffer
>> + * @type:	V4L2_BUF_TYPE_VIDEO_CAPTURE or V4L2_BUF_TYPE_VIDEO_OUTPUT
>> + * @flags:	buffer informational flags
> 
> nit: The order of comments doesn't match the order of fields in the struct.

Ack.

> 
>> + * @field:	enum v4l2_field; field order of the image in the buffer
>> + * @timestamp:	frame timestamp
>> + * @sequence:	sequence count of this frame
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
>> +	__u32 field;
>> +	__u32 sequence;
>> +	__u64 flags;
>> +	__u64 timestamp;
> 
> What's the unit? How does this play with the other UAPI that the user space
> may use, e.g. clock_gettime() which returns struct timespec?

The unity is nsec:

	e->timestamp = b->timestamp.tv_sec * NSEC_PER_SEC +
		b->timestamp.tv_usec * NSEC_PER_USEC;

I can clarify in the docs, is this ok?

> 
>> +	struct v4l2_ext_plane planes[VIDEO_MAX_PLANES];
>> +	__s32 request_fd;
>> +	__u32 reserved[9];
>> +};
>> +
>>  #ifndef __KERNEL__
>>  /**
>>   * v4l2_timeval_to_ns - Convert timeval to nanoseconds
>> @@ -2523,6 +2585,29 @@ struct v4l2_create_buffers {
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
> 
> Do we need to say that it is ignored here? I'd consider this to be a
> per-flag decision.

flags field was removed from v4l2_create_buffers, so I'm removing it from
v4l2_ext_create_buffers for the same reason.


Thanks,
Helen

> 
> Best regards,
> Tomasz
> 
