Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB57926300B
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 16:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730178AbgIIMaS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Sep 2020 08:30:18 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:58769 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729822AbgIIM3V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Sep 2020 08:29:21 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id FzCOkisxWXgwIFzCPkZQR2; Wed, 09 Sep 2020 14:27:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1599654462; bh=QWSvI7oE8nBZTw6jhNeYqdKKHEX1GlF8vmEnzfvaM0Y=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=dTIH3jjsjHbgnnkHMjFG5cWZbmKd7EPX5AVdsSVBppdtE1Yw2+7VOKUTZ8QkkW/8C
         GXth2eKQVibtp8SuJR0s9LfanUA0dhH3e6bM5I5NSJ1/o8H5htzYflpmoMvfLmb5Zg
         /11VEnfjstIU+6+AinEABHn0JV9xo+HazJxxF3z3F5bd1CSlVfs8BwpYYRoVy2asAq
         wcPsMAxVNlP3LBIHbLrixqhn8nJrCMeKKXKuFcB1KeCATXCIKf+qom6LrNSPesQ/yF
         RRCgycG9aowEwzvaUeMIRCutvd9HEg40LUCAlPvCm6UOtORA4P+XdrvhCHV+agx2Qr
         T9MLzy5WUj7Ow==
Subject: Re: [PATCH v5 2/7] media: v4l2: Add extended buffer operations
To:     Helen Koike <helen.koike@collabora.com>, mchehab@kernel.org,
        hans.verkuil@cisco.com, laurent.pinchart@ideasonboard.com,
        sakari.ailus@iki.fi, linux-media@vger.kernel.org
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        tfiga@chromium.org, hiroh@chromium.org, nicolas@ndufresne.ca,
        Brian.Starkey@arm.com, kernel@collabora.com,
        narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
        frkoenig@chromium.org, mjourdan@baylibre.com,
        stanimir.varbanov@linaro.org
References: <20200804192939.2251988-1-helen.koike@collabora.com>
 <20200804192939.2251988-3-helen.koike@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b8a08145-c54e-3d06-dd61-78ce99a812d5@xs4all.nl>
Date:   Wed, 9 Sep 2020 14:27:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200804192939.2251988-3-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfF6quRZ32DFG2WMn1st86Tu6VK4vve1ajszW4Kc9nHHN9Clxx/x5a+QsRnP6xBk58QyU+YLrfAmf0dOF9GENv+DidXYOE2dC1kpEwnAaow/3CuL+1EcQ
 t0XU6zfldcuEJak5KZYssPaUEsbluO68Cf8w24b2RDUirbY485FQ72R5NObhK+9kzj497e+Iuk3J1S5/hGLFC5Y1DACRfrUVi1UcIvnCmv7dmjo03MxDlsa2
 hlrxuTMQVpFV7P10/MNcbORnd8Go6F7xqAj885wc/vbGUO8/+c6l/sWcOY12uTC3Hv3U1qws6DmHSwe677uhtq2/JIPPKWhyHLqncytFEza6CLfhDAqNpLht
 7LC4t0qITWz2cFmxi398cs+LwOhA6MoW7+EMwFPZQyX2N2TEPyUnIx5p9+u6xoK3ORKD7ikBZ6A8D8aiDpVsLBQzMJAL/GWEjIdP5Wm7bIcD/l1rsjTZrIMX
 b+FKUZKOimskwN1V0G+ufnpcxIoHHAOaD5oss0x21FcGD9PTAK+ozrWF2QKrb3RL93T0dE/zJ4JQyKuKYXAjku9pnqWGP871zpRbKU/z4SY/6qfCtZqWuvTj
 OmOyQ5thJzjvT42O+vEn26AGkcobkK5WXHnu8RVY53Cd97JDFMXAVBha9Q9wm2Z/neABOnKmwsb2kZePc+C0GYWrhFSZ+ac4hNJHrLYkb1Jrb3H2Z6DNKKUU
 IKcKy5SbzRldPuBHWVetZuiMdJrMCtHksOaeF3CgChmlF/kQDJ0dYy1Y5HowqFRcxEf11s1Yk+I48TeZnlXOKvv3RPDrwCP3EuEobxrBcSFDKg9tPqr5TLY8
 gQ7J8oEIFSFm2IE87AY=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

Again I'm just reviewing the uAPI.

On 04/08/2020 21:29, Helen Koike wrote:
> From: Hans Verkuil <hans.verkuil@cisco.com>
> 
> Those extended buffer ops have several purpose:
> 1/ Fix y2038 issues by converting the timestamp into an u64 counting
>    the number of ns elapsed since 1970
> 2/ Unify single/multiplanar handling
> 3/ Add a new start offset field to each v4l2 plane buffer info struct
>    to support the case where a single buffer object is storing all
>    planes data, each one being placed at a different offset
> 
> New hooks are created in v4l2_ioctl_ops so that drivers can start using
> these new objects.
> 
> The core takes care of converting new ioctls requests to old ones
> if the driver does not support the new hooks, and vice versa.
> 
> Note that the timecode field is gone, since there doesn't seem to be
> in-kernel users. We can be added back in the reserved area if needed or
> use the Request API to collect more metadata information from the
> frame.
> 
> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> ---
> Changes in v5:
> - migrate memory from v4l2_ext_buffer to v4l2_ext_plane
> - return mem_offset to struct v4l2_ext_plane
> - change sizes and reorder fields to avoid holes in the struct and make
>   it the same for 32 and 64 bits
> 
> Changes in v4:
> - Use v4l2_ext_pix_format directly in the ioctl, drop v4l2_ext_format,
> making V4L2_BUF_TYPE_VIDEO_[OUTPUT,CAPTURE] the only valid types.
> - Drop VIDIOC_EXT_EXPBUF, since the only difference from VIDIOC_EXPBUF
> was that with VIDIOC_EXT_EXPBUF we could export multiple planes at once.
> I think we can add this later, so I removed it from this RFC to simplify it.
> - Remove num_planes field from struct v4l2_ext_buffer
> - Add flags field to struct v4l2_ext_create_buffers
> - Reformulate struct v4l2_ext_plane
> - Fix some bugs caught by v4l2-compliance
> - Rebased on top of media/master (post 5.8-rc1)
> 
> Changes in v3:
> - Rebased on top of media/master (post 5.4-rc1)
> 
> Changes in v2:
> - Add reserved space to v4l2_ext_buffer so that new fields can be added
>   later on
> ---
>  drivers/media/v4l2-core/v4l2-dev.c   |  29 ++-
>  drivers/media/v4l2-core/v4l2-ioctl.c | 353 +++++++++++++++++++++++++--
>  include/media/v4l2-ioctl.h           |  26 ++
>  include/uapi/linux/videodev2.h       |  90 +++++++
>  4 files changed, 476 insertions(+), 22 deletions(-)
> 

<snip>

> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 7123c6a4d9569..334cafdd2be97 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -996,6 +996,41 @@ struct v4l2_plane {
>  	__u32			reserved[11];
>  };
>  
> +/**
> + * struct v4l2_ext_plane - extended plane buffer info
> + * @buffer_length:	size of the entire buffer in bytes, should fit
> + *			@offset + @plane_length
> + * @plane_length:	size of the plane in bytes.
> + * @mem_offset:		If V4L2_MEMORY_MMAP is used, then it can be a "cookie"
> + *			that should be passed to mmap() called on the video node.
> + * @userptr:		when memory is V4L2_MEMORY_USERPTR, a userspace pointer pointing
> + *			to this plane.
> + * @dmabuf_fd:		when memory is V4L2_MEMORY_DMABUF, a userspace file descriptor
> + *			associated with this plane.
> + * @offset:		offset in the memory buffer where the plane starts.
> + * @memory:		enum v4l2_memory; the method, in which the actual video
> + *			data is passed
> + * @reserved:		extra space reserved for future fields, must be set to 0.
> + *
> + *
> + * Buffers consist of one or more planes, e.g. an YCbCr buffer with two planes
> + * can have one plane for Y, and another for interleaved CbCr components.
> + * Each plane can reside in a separate memory buffer, or even in
> + * a completely separate memory node (e.g. in embedded devices).
> + */
> +struct v4l2_ext_plane {
> +	__u32 buffer_length;
> +	__u32 plane_length;
> +	union {
> +		__u32 mem_offset;
> +		__u64 userptr;
> +		__s32 dmabuf_fd;
> +	} m;
> +	__u32 offset;

I'd rename this plane_offset. I think some reordering would make this struct easier
to understand:

struct v4l2_ext_plane {
	__u32 buffer_length;
	__u32 plane_offset;
	__u32 plane_length;
	__u32 memory;
	union {
		__u32 mem_offset;
		__u64 userptr;
		__s32 dmabuf_fd;
	} m;
	__u32 reserved[4];
};

> +	__u32 memory;
> +	__u32 reserved[4];
> +};

What is not clear is how to tell the different between a single buffer containing
multiple planes, and using a separate buffer per plane. E.g. what would this look
like for V4L2_PIX_FMT_YVU420, V4L2_PIX_FMT_YUV420M and a theoretical variant of
V4L2_PIX_FMT_YUV420M where the luma plane has its own buffer and the two chroma
planes are also combined in a single buffer?

I would guess that the m union is set to 0 if the plane is part of the buffer
defined in the previous plane?

> +
>  /**
>   * struct v4l2_buffer - video buffer info
>   * @index:	id number of the buffer
> @@ -1057,6 +1092,33 @@ struct v4l2_buffer {
>  	};
>  };
>  
> +/**
> + * struct v4l2_ext_buffer - extended video buffer info
> + * @index:	id number of the buffer
> + * @type:	V4L2_BUF_TYPE_VIDEO_CAPTURE or V4L2_BUF_TYPE_VIDEO_OUTPUT
> + * @flags:	buffer informational flags
> + * @field:	enum v4l2_field; field order of the image in the buffer
> + * @timestamp:	frame timestamp
> + * @sequence:	sequence count of this frame
> + * @planes:	per-plane buffer information
> + * @request_fd:	fd of the request that this buffer should use
> + * @reserved:	extra space reserved for future fields, must be set to 0
> + *
> + * Contains data exchanged by application and driver using one of the Streaming
> + * I/O methods.
> + */
> +struct v4l2_ext_buffer {
> +	__u32 index;
> +	__u32 type;
> +	__u32 field;
> +	__u32 sequence;
> +	__u64 flags;
> +	__u64 timestamp;
> +	struct v4l2_ext_plane planes[VIDEO_MAX_PLANES];
> +	__s32 request_fd;
> +	__u32 reserved[9];
> +};

Brainstorming:

Some ideas I have to make it easier to support mid stream resolution/colorimetry
changes:

Adding width and height would support resolution changes (requires the use of
CREATE_BUFS to ensure the allocated buffers are large enough, of course). If that
information is provided here, then there are no race conditions.

Same for adding the colorimetry fields here, this too can change on the fly (esp.
with HDMI), so reporting this information here avoids race conditions as well.

And thirdly, I would like to have a __u64 boot_timestamp field containing the
CLOCK_BOOTTIME of when the vb2_buffer_done() was called. The problem with 'timestamp'
is that for m2m devices it is just copied and that for other devices it can have
different meanings depending on the timestamp buffer flags.

There also have been requests for CLOCK_BOOTTIME support, so this might be a good time
to add support for this. That way you know exactly when the driver was finished with
the buffer and that helps in detecting missed frames or instrumentation.

> +
>  #ifndef __KERNEL__
>  /**
>   * v4l2_timeval_to_ns - Convert timeval to nanoseconds
> @@ -2523,6 +2585,29 @@ struct v4l2_create_buffers {
>  	__u32			reserved[6];
>  };
>  
> +/**
> + * struct v4l2_ext_create_buffers - VIDIOC_EXT_CREATE_BUFS argument
> + * @index:	on return, index of the first created buffer
> + * @count:	entry: number of requested buffers,
> + *		return: number of created buffers
> + * @memory:	enum v4l2_memory; buffer memory type
> + * @capabilities: capabilities of this buffer type.
> + * @format:	frame format, for which buffers are requested
> + * @flags:	additional buffer management attributes (ignored unless the
> + *		queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS capability
> + *		and configured for MMAP streaming I/O).
> + * @reserved:	extra space reserved for future fields, must be set to 0
> + */
> +struct v4l2_ext_create_buffers {
> +	__u32				index;
> +	__u32				count;
> +	__u32				memory;
> +	__u32				capabilities;
> +	struct v4l2_ext_pix_format	format;

The reality is that the only field that is ever used in the original v4l2_format
struct is sizeimage. So this can be replaced with:

	__u32				plane_size[VIDEO_MAX_PLANES];

(the field name I picked is debatable, but you get the idea)

The main purpose of CREATE_BUFS is to add new buffers with larger sizes than
is needed for the current format. The original idea of using struct v4l2_format
was that drivers would use the full format information to calculate the
memory size, but that was just much too complicated to implement and nobody
ever used that. Only the sizeimage field was ever used.

> +	__u32				flags;
> +	__u32 reserved[5];
> +};
> +
>  /*
>   *	I O C T L   C O D E S   F O R   V I D E O   D E V I C E S
>   *
> @@ -2626,6 +2711,11 @@ struct v4l2_create_buffers {
>  #define VIDIOC_G_EXT_PIX_FMT	_IOWR('V', 104, struct v4l2_ext_pix_format)
>  #define VIDIOC_S_EXT_PIX_FMT	_IOWR('V', 105, struct v4l2_ext_pix_format)
>  #define VIDIOC_TRY_EXT_PIX_FMT	_IOWR('V', 106, struct v4l2_ext_pix_format)
> +#define VIDIOC_EXT_CREATE_BUFS	_IOWR('V', 107, struct v4l2_ext_create_buffers)
> +#define VIDIOC_EXT_QUERYBUF	_IOWR('V', 108, struct v4l2_ext_buffer)
> +#define VIDIOC_EXT_QBUF		_IOWR('V', 109, struct v4l2_ext_buffer)
> +#define VIDIOC_EXT_DQBUF	_IOWR('V', 110, struct v4l2_ext_buffer)
> +#define VIDIOC_EXT_PREPARE_BUF	_IOWR('V', 111, struct v4l2_ext_buffer)
>  
>  /* Reminder: when adding new ioctls please add support for them to
>     drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
> 

Regards,

	Hans
