Return-Path: <linux-media+bounces-5329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CAA858E65
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 10:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 208A7282CDF
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 09:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672E91D546;
	Sat, 17 Feb 2024 09:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWPrW+Az"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85C51D526;
	Sat, 17 Feb 2024 09:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708162939; cv=none; b=p5T1G5Vf7xQieEY0BbKEH3/SzUEf/92gF95bXK5IwWgpKTscs6eh4xZS7wS0Ian3pSaDWIaZY7uF7oniNt5oRR1pUjal8+nKp3SPAswSPF4vwV2NLAc2J6ZKKerJzi4Bi3rKi5z0/Q+wbw7Xu8+miUTJa0kHIuLQwSF+6u0q8nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708162939; c=relaxed/simple;
	bh=8n6Rvi7T+KQYz0S74HRP4+7U2f++euLXASjVg6xtyyg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZHjOqkjga73YeZwX5g2+7i68JOGBlfzMiNSwAufFvWI5UG6ZgrJoeYJVz+ry5m5J1rSRt7dfmK1xLCAK8DbU4Lp2T38iKmsXtLwvb/qOul++1EsZwCH0xnCGTKK+GYO6MH64COExn9n4VoGzOhKPS5c1g6on/ltyDxlgxV0P0nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWPrW+Az; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C10BCC43390;
	Sat, 17 Feb 2024 09:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708162939;
	bh=8n6Rvi7T+KQYz0S74HRP4+7U2f++euLXASjVg6xtyyg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SWPrW+AzkkvjCzzNM/Wx08TIgyx6ebbkIkKOhHu5hhfbQlpFtPsC3P/uco0ASVywx
	 42zNFMYnH6oaTwTtbMMQ4WscY1mnWpyvcNfhoQFcl0NfhbNzFkf8cV1miN9ogGODj2
	 Jh2X4x5VdTGajpbRjCckmPKG3iQM+relC0neLslNZLSEEYzwv7PJYDNhtAJpWdnmxB
	 UbjduOsHhqXOX4yEkO/uGtBeIa0SMKAFFQfgnnKQOuA5VH6wAS/eH/cR9WKaCyGP8O
	 29HPJvcvqlM5atQZNVy30ZRCgbkBUaGaHCuVLQ1GkDUaoqWvXT5ZBicBHMGIWg/7lF
	 a+bj8p19hx7TA==
Date: Sat, 17 Feb 2024 10:42:12 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: hverkuil@xs4all.nl, sakari.ailus@iki.fi, tfiga@chromium.org,
 m.szyprowski@samsung.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v12 07/15] media: v4l2: Add audio capture and output
 support
Message-ID: <20240217104212.32f07e3a@coco.lan>
In-Reply-To: <1705581128-4604-8-git-send-email-shengjiu.wang@nxp.com>
References: <1705581128-4604-1-git-send-email-shengjiu.wang@nxp.com>
	<1705581128-4604-8-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 18 Jan 2024 20:32:00 +0800
Shengjiu Wang <shengjiu.wang@nxp.com> escreveu:

> Audio signal processing has the requirement for memory to
> memory similar as Video.
> 
> This patch is to add this support in v4l2 framework, defined
> new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
> V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
> for audio case usage.
> 
> The created audio device is named "/dev/v4l-audioX".
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../userspace-api/media/v4l/buffer.rst        |  6 ++
>  .../media/v4l/dev-audio-mem2mem.rst           | 71 +++++++++++++++++++
>  .../userspace-api/media/v4l/devices.rst       |  1 +
>  .../media/v4l/vidioc-enum-fmt.rst             |  2 +
>  .../userspace-api/media/v4l/vidioc-g-fmt.rst  |  4 ++
>  .../media/videodev2.h.rst.exceptions          |  2 +
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  4 ++
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c |  9 +++
>  drivers/media/v4l2-core/v4l2-dev.c            | 17 +++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          | 53 ++++++++++++++
>  include/media/v4l2-dev.h                      |  2 +
>  include/media/v4l2-ioctl.h                    | 34 +++++++++
>  include/uapi/linux/videodev2.h                | 17 +++++
>  13 files changed, 222 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
> index 52bbee81c080..a3754ca6f0d6 100644
> --- a/Documentation/userspace-api/media/v4l/buffer.rst
> +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> @@ -438,6 +438,12 @@ enum v4l2_buf_type
>      * - ``V4L2_BUF_TYPE_META_OUTPUT``
>        - 14

>        - Buffer for metadata output, see :ref:`metadata`.
> +    * - ``V4L2_BUF_TYPE_AUDIO_CAPTURE``
> +      - 15
> +      - Buffer for audio capture, see :ref:`audio`.
> +    * - ``V4L2_BUF_TYPE_AUDIO_OUTPUT``
> +      - 16

Hmm... alsa APi define input/output as:
	enum {
	        SNDRV_PCM_STREAM_PLAYBACK = 0,
	        SNDRV_PCM_STREAM_CAPTURE,
	        SNDRV_PCM_STREAM_LAST = SNDRV_PCM_STREAM_CAPTURE,
	};


I would use a namespace as close as possible to the
ALSA API. Also, we're not talking about V4L2, but, instead
audio. so, not sure if I like the prefix to start with
V4L2_. Maybe ALSA_?

So, a better namespace would be:

	${prefix}_BUF_TYPE_PCM_STREAM_PLAYBACK
and
	${prefix}_BUF_TYPE_PCM_STREAM_CAPTURE

> +      - Buffer for audio output, see :ref:`audio`.
>  
>  
>  .. _buffer-flags:
> diff --git a/Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst b/Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst
> new file mode 100644
> index 000000000000..68faecfe3a02
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst
> @@ -0,0 +1,71 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _audiomem2mem:
> +
> +********************************
> +Audio Memory-To-Memory Interface
> +********************************
> +
> +An audio memory-to-memory device can compress, decompress, transform, or
> +otherwise convert audio data from one format into another format, in memory.
> +Such memory-to-memory devices set the ``V4L2_CAP_AUDIO_M2M`` capability.
> +Examples of memory-to-memory devices are audio codecs, audio preprocessing,
> +audio postprocessing.
> +
> +A memory-to-memory audio node supports both output (sending audio frames from
> +memory to the hardware) and capture (receiving the processed audio frames
> +from the hardware into memory) stream I/O. An application will have to
> +setup the stream I/O for both sides and finally call
> +:ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>` for both capture and output to
> +start the hardware.
> +
> +Memory-to-memory devices function as a shared resource: you can
> +open the audio node multiple times, each application setting up their
> +own properties that are local to the file handle, and each can use
> +it independently from the others. The driver will arbitrate access to
> +the hardware and reprogram it whenever another file handler gets access.
> +
> +Audio memory-to-memory devices are accessed through character device
> +special files named ``/dev/v4l-audio``
> +
> +Querying Capabilities
> +=====================
> +
> +Device nodes supporting the audio memory-to-memory interface set the
> +``V4L2_CAP_AUDIO_M2M`` flag in the ``device_caps`` field of the
> +:c:type:`v4l2_capability` structure returned by the :c:func:`VIDIOC_QUERYCAP`
> +ioctl.
> +
> +Data Format Negotiation
> +=======================
> +
> +The audio device uses the :ref:`format` ioctls to select the capture format.
> +The audio buffer content format is bound to that selected format. In addition
> +to the basic :ref:`format` ioctls, the :c:func:`VIDIOC_ENUM_FMT` ioctl must be
> +supported as well.
> +
> +To use the :ref:`format` ioctls applications set the ``type`` field of the
> +:c:type:`v4l2_format` structure to ``V4L2_BUF_TYPE_AUDIO_CAPTURE`` or to
> +``V4L2_BUF_TYPE_AUDIO_OUTPUT``. Both drivers and applications must set the
> +remainder of the :c:type:`v4l2_format` structure to 0.
> +
> +.. c:type:: v4l2_audio_format
> +
> +.. tabularcolumns:: |p{1.4cm}|p{2.4cm}|p{13.5cm}|
> +
> +.. flat-table:: struct v4l2_audio_format
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u32
> +      - ``pixelformat``
> +      - The sample format, set by the application. see :ref:`pixfmt-audio`

pixelformat doesn't make any sense for audio: there are no pixels on a
PCM stream. Please use call it, instead: `snd_pcm_format`, making it match
the values for snd_pcm_format_t.

Yet, I would keep defining it as u32 (or u64?) instead of using a
typedef int field there (snd_pcm_format_t), as the size of integer
is different on 32 and 64 bit kernels.


> +    * - __u32
> +      - ``channels``
> +      - The channel number, set by the application. channel number range is
> +        [1, 32].

Why not start on zero?

> +    * - __u32
> +      - ``buffersize``
> +      - Maximum buffer size in bytes required for data. The value is set by the
> +        driver.
> diff --git a/Documentation/userspace-api/media/v4l/devices.rst b/Documentation/userspace-api/media/v4l/devices.rst
> index 8bfbad65a9d4..758bd90f1c26 100644
> --- a/Documentation/userspace-api/media/v4l/devices.rst
> +++ b/Documentation/userspace-api/media/v4l/devices.rst
> @@ -24,3 +24,4 @@ Interfaces
>      dev-event
>      dev-subdev
>      dev-meta
> +    dev-audio-mem2mem
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> index 000c154b0f98..42deb07f4ff4 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> @@ -96,6 +96,8 @@ the ``mbus_code`` field is handled differently:
>  	``V4L2_BUF_TYPE_VIDEO_OVERLAY``,
>  	``V4L2_BUF_TYPE_SDR_CAPTURE``,
>  	``V4L2_BUF_TYPE_SDR_OUTPUT``,
> +	``V4L2_BUF_TYPE_AUDIO_CAPTURE``,
> +	``V4L2_BUF_TYPE_AUDIO_OUTPUT``,
>  	``V4L2_BUF_TYPE_META_CAPTURE`` and
>  	``V4L2_BUF_TYPE_META_OUTPUT``.
>  	See :c:type:`v4l2_buf_type`.
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst
> index 675c385e5aca..528fd9df41aa 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst
> @@ -130,6 +130,10 @@ The format as returned by :ref:`VIDIOC_TRY_FMT <VIDIOC_G_FMT>` must be identical
>        - ``meta``
>        - Definition of a metadata format, see :ref:`meta-formats`, used by
>  	metadata capture devices.
> +    * - struct :c:type:`v4l2_audio_format`
> +      - ``audio``
> +      - Definition of a audio data format, see :ref:`audiomem2mem`, used by
> +        audio memory-to-memory devices
>      * - __u8
>        - ``raw_data``\ [200]
>        - Place holder for future extensions.
> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> index da6d0b8e4c2c..e61152bb80d1 100644
> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> @@ -29,6 +29,8 @@ replace symbol V4L2_FIELD_SEQ_TB :c:type:`v4l2_field`
>  replace symbol V4L2_FIELD_TOP :c:type:`v4l2_field`
>  
>  # Documented enum v4l2_buf_type
> +replace symbol V4L2_BUF_TYPE_AUDIO_CAPTURE :c:type:`v4l2_buf_type`
> +replace symbol V4L2_BUF_TYPE_AUDIO_OUTPUT :c:type:`v4l2_buf_type`
>  replace symbol V4L2_BUF_TYPE_META_CAPTURE :c:type:`v4l2_buf_type`
>  replace symbol V4L2_BUF_TYPE_META_OUTPUT :c:type:`v4l2_buf_type`
>  replace symbol V4L2_BUF_TYPE_SDR_CAPTURE :c:type:`v4l2_buf_type`
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 54d572c3b515..16ab204d15b0 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -791,6 +791,10 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>  	case V4L2_BUF_TYPE_META_OUTPUT:
>  		requested_sizes[0] = f->fmt.meta.buffersize;
>  		break;
> +	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> +	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> +		requested_sizes[0] = f->fmt.audio.buffersize;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> index 8c07400bd280..5e94db8dfdae 100644
> --- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> +++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> @@ -101,6 +101,7 @@ struct v4l2_format32 {
>  		struct v4l2_sliced_vbi_format	sliced;
>  		struct v4l2_sdr_format	sdr;
>  		struct v4l2_meta_format	meta;
> +		struct v4l2_audio_format	audio;
>  		__u8	raw_data[200];        /* user-defined */
>  	} fmt;
>  };
> @@ -166,6 +167,10 @@ static int get_v4l2_format32(struct v4l2_format *p64,
>  	case V4L2_BUF_TYPE_META_OUTPUT:
>  		return copy_from_user(&p64->fmt.meta, &p32->fmt.meta,
>  				      sizeof(p64->fmt.meta)) ? -EFAULT : 0;
> +	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> +	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> +		return copy_from_user(&p64->fmt.audio, &p32->fmt.audio,
> +				      sizeof(p64->fmt.audio)) ? -EFAULT : 0;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -216,6 +221,10 @@ static int put_v4l2_format32(struct v4l2_format *p64,
>  	case V4L2_BUF_TYPE_META_OUTPUT:
>  		return copy_to_user(&p32->fmt.meta, &p64->fmt.meta,
>  				    sizeof(p64->fmt.meta)) ? -EFAULT : 0;
> +	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> +	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> +		return copy_to_user(&p32->fmt.audio, &p64->fmt.audio,
> +				    sizeof(p64->fmt.audio)) ? -EFAULT : 0;
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index d13954bd31fd..bac008fcedc6 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -553,6 +553,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  	bool is_tch = vdev->vfl_type == VFL_TYPE_TOUCH;
>  	bool is_meta = vdev->vfl_type == VFL_TYPE_VIDEO &&
>  		       (vdev->device_caps & meta_caps);
> +	bool is_audio = vdev->vfl_type == VFL_TYPE_AUDIO;
>  	bool is_rx = vdev->vfl_dir != VFL_DIR_TX;
>  	bool is_tx = vdev->vfl_dir != VFL_DIR_RX;
>  	bool is_io_mc = vdev->device_caps & V4L2_CAP_IO_MC;
> @@ -666,6 +667,19 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_meta_out);
>  		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_meta_out);
>  	}
> +	if (is_audio && is_rx) {
> +		/* audio capture specific ioctls */
> +		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_audio_cap);
> +		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_audio_cap);
> +		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_audio_cap);
> +		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_audio_cap);
> +	} else if (is_audio && is_tx) {
> +		/* audio output specific ioctls */
> +		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_audio_out);
> +		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_audio_out);
> +		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_audio_out);
> +		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_audio_out);
> +	}
>  	if (is_vbi) {
>  		/* vbi specific ioctls */
>  		if ((is_rx && (ops->vidioc_g_fmt_vbi_cap ||
> @@ -929,6 +943,9 @@ int __video_register_device(struct video_device *vdev,
>  	case VFL_TYPE_TOUCH:
>  		name_base = "v4l-touch";
>  		break;
> +	case VFL_TYPE_AUDIO:
> +		name_base = "v4l-audio";
> +		break;
>  	default:
>  		pr_err("%s called with unknown type: %d\n",
>  		       __func__, type);
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 33076af4dfdb..e7be7c2f302d 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -188,6 +188,8 @@ const char *v4l2_type_names[] = {
>  	[V4L2_BUF_TYPE_SDR_OUTPUT]         = "sdr-out",
>  	[V4L2_BUF_TYPE_META_CAPTURE]       = "meta-cap",
>  	[V4L2_BUF_TYPE_META_OUTPUT]	   = "meta-out",
> +	[V4L2_BUF_TYPE_AUDIO_CAPTURE]      = "audio-cap",
> +	[V4L2_BUF_TYPE_AUDIO_OUTPUT]	   = "audio-out",
>  };
>  EXPORT_SYMBOL(v4l2_type_names);
>  
> @@ -276,6 +278,7 @@ static void v4l_print_format(const void *arg, bool write_only)
>  	const struct v4l2_sliced_vbi_format *sliced;
>  	const struct v4l2_window *win;
>  	const struct v4l2_meta_format *meta;
> +	const struct v4l2_audio_format *audio;
>  	u32 pixelformat;
>  	u32 planes;
>  	unsigned i;
> @@ -346,6 +349,13 @@ static void v4l_print_format(const void *arg, bool write_only)
>  		pr_cont(", dataformat=%p4cc, buffersize=%u\n",
>  			&pixelformat, meta->buffersize);
>  		break;
> +	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> +	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> +		audio = &p->fmt.audio;
> +		pixelformat = audio->audioformat;
> +		pr_cont(", format=%p4cc, channels=%u, buffersize=%u\n",
> +			&pixelformat, audio->channels, audio->buffersize);
> +		break;
>  	}
>  }
>  
> @@ -927,6 +937,7 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
>  	bool is_tch = vfd->vfl_type == VFL_TYPE_TOUCH;
>  	bool is_meta = vfd->vfl_type == VFL_TYPE_VIDEO &&
>  		       (vfd->device_caps & meta_caps);
> +	bool is_audio = vfd->vfl_type == VFL_TYPE_AUDIO;
>  	bool is_rx = vfd->vfl_dir != VFL_DIR_TX;
>  	bool is_tx = vfd->vfl_dir != VFL_DIR_RX;
>  
> @@ -992,6 +1003,14 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
>  		if (is_meta && is_tx && ops->vidioc_g_fmt_meta_out)
>  			return 0;
>  		break;
> +	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> +		if (is_audio && is_rx && ops->vidioc_g_fmt_audio_cap)
> +			return 0;
> +		break;
> +	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> +		if (is_audio && is_tx && ops->vidioc_g_fmt_audio_out)
> +			return 0;
> +		break;
>  	default:
>  		break;
>  	}
> @@ -1597,6 +1616,16 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
>  			break;
>  		ret = ops->vidioc_enum_fmt_meta_out(file, fh, arg);
>  		break;
> +	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> +		if (unlikely(!ops->vidioc_enum_fmt_audio_cap))
> +			break;
> +		ret = ops->vidioc_enum_fmt_audio_cap(file, fh, arg);
> +		break;
> +	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> +		if (unlikely(!ops->vidioc_enum_fmt_audio_out))
> +			break;
> +		ret = ops->vidioc_enum_fmt_audio_out(file, fh, arg);
> +		break;
>  	}
>  	if (ret == 0)
>  		v4l_fill_fmtdesc(p);
> @@ -1673,6 +1702,10 @@ static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
>  		return ops->vidioc_g_fmt_meta_cap(file, fh, arg);
>  	case V4L2_BUF_TYPE_META_OUTPUT:
>  		return ops->vidioc_g_fmt_meta_out(file, fh, arg);
> +	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> +		return ops->vidioc_g_fmt_audio_cap(file, fh, arg);
> +	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> +		return ops->vidioc_g_fmt_audio_out(file, fh, arg);
>  	}
>  	return -EINVAL;
>  }
> @@ -1784,6 +1817,16 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
>  			break;
>  		memset_after(p, 0, fmt.meta);
>  		return ops->vidioc_s_fmt_meta_out(file, fh, arg);
> +	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> +		if (unlikely(!ops->vidioc_s_fmt_audio_cap))
> +			break;
> +		memset_after(p, 0, fmt.audio);
> +		return ops->vidioc_s_fmt_audio_cap(file, fh, arg);
> +	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> +		if (unlikely(!ops->vidioc_s_fmt_audio_out))
> +			break;
> +		memset_after(p, 0, fmt.audio);
> +		return ops->vidioc_s_fmt_audio_out(file, fh, arg);
>  	}
>  	return -EINVAL;
>  }
> @@ -1892,6 +1935,16 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
>  			break;
>  		memset_after(p, 0, fmt.meta);
>  		return ops->vidioc_try_fmt_meta_out(file, fh, arg);
> +	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> +		if (unlikely(!ops->vidioc_try_fmt_audio_cap))
> +			break;
> +		memset_after(p, 0, fmt.audio);
> +		return ops->vidioc_try_fmt_audio_cap(file, fh, arg);
> +	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> +		if (unlikely(!ops->vidioc_try_fmt_audio_out))
> +			break;
> +		memset_after(p, 0, fmt.audio);
> +		return ops->vidioc_try_fmt_audio_out(file, fh, arg);
>  	}
>  	return -EINVAL;
>  }
> diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> index d82dfdbf6e58..82b63f82d43f 100644
> --- a/include/media/v4l2-dev.h
> +++ b/include/media/v4l2-dev.h
> @@ -30,6 +30,7 @@
>   * @VFL_TYPE_SUBDEV:	for V4L2 subdevices
>   * @VFL_TYPE_SDR:	for Software Defined Radio tuners
>   * @VFL_TYPE_TOUCH:	for touch sensors
> + * @VFL_TYPE_AUDIO:	for audio memory-to-memory devices
>   * @VFL_TYPE_MAX:	number of VFL types, must always be last in the enum
>   */
>  enum vfl_devnode_type {
> @@ -39,6 +40,7 @@ enum vfl_devnode_type {
>  	VFL_TYPE_SUBDEV,
>  	VFL_TYPE_SDR,
>  	VFL_TYPE_TOUCH,
> +	VFL_TYPE_AUDIO,
>  	VFL_TYPE_MAX /* Shall be the last one */
>  };
>  
> diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
> index edb733f21604..f840cf740ce1 100644
> --- a/include/media/v4l2-ioctl.h
> +++ b/include/media/v4l2-ioctl.h
> @@ -45,6 +45,12 @@ struct v4l2_fh;
>   * @vidioc_enum_fmt_meta_out: pointer to the function that implements
>   *	:ref:`VIDIOC_ENUM_FMT <vidioc_enum_fmt>` ioctl logic
>   *	for metadata output
> + * @vidioc_enum_fmt_audio_cap: pointer to the function that implements
> + *	:ref:`VIDIOC_ENUM_FMT <vidioc_enum_fmt>` ioctl logic
> + *	for audio capture
> + * @vidioc_enum_fmt_audio_out: pointer to the function that implements
> + *	:ref:`VIDIOC_ENUM_FMT <vidioc_enum_fmt>` ioctl logic
> + *	for audio output
>   * @vidioc_g_fmt_vid_cap: pointer to the function that implements
>   *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for video capture
>   *	in single plane mode
> @@ -79,6 +85,10 @@ struct v4l2_fh;
>   *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for metadata capture
>   * @vidioc_g_fmt_meta_out: pointer to the function that implements
>   *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for metadata output
> + * @vidioc_g_fmt_audio_cap: pointer to the function that implements
> + *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for audio capture
> + * @vidioc_g_fmt_audio_out: pointer to the function that implements
> + *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for audio output
>   * @vidioc_s_fmt_vid_cap: pointer to the function that implements
>   *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for video capture
>   *	in single plane mode
> @@ -113,6 +123,10 @@ struct v4l2_fh;
>   *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for metadata capture
>   * @vidioc_s_fmt_meta_out: pointer to the function that implements
>   *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for metadata output
> + * @vidioc_s_fmt_audio_cap: pointer to the function that implements
> + *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for audio capture
> + * @vidioc_s_fmt_audio_out: pointer to the function that implements
> + *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for audio output
>   * @vidioc_try_fmt_vid_cap: pointer to the function that implements
>   *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for video capture
>   *	in single plane mode
> @@ -149,6 +163,10 @@ struct v4l2_fh;
>   *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for metadata capture
>   * @vidioc_try_fmt_meta_out: pointer to the function that implements
>   *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for metadata output
> + * @vidioc_try_fmt_audio_cap: pointer to the function that implements
> + *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for audio capture
> + * @vidioc_try_fmt_audio_out: pointer to the function that implements
> + *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for audio output
>   * @vidioc_reqbufs: pointer to the function that implements
>   *	:ref:`VIDIOC_REQBUFS <vidioc_reqbufs>` ioctl
>   * @vidioc_querybuf: pointer to the function that implements
> @@ -315,6 +333,10 @@ struct v4l2_ioctl_ops {
>  					struct v4l2_fmtdesc *f);
>  	int (*vidioc_enum_fmt_meta_out)(struct file *file, void *fh,
>  					struct v4l2_fmtdesc *f);
> +	int (*vidioc_enum_fmt_audio_cap)(struct file *file, void *fh,
> +					 struct v4l2_fmtdesc *f);
> +	int (*vidioc_enum_fmt_audio_out)(struct file *file, void *fh,
> +					 struct v4l2_fmtdesc *f);
>  
>  	/* VIDIOC_G_FMT handlers */
>  	int (*vidioc_g_fmt_vid_cap)(struct file *file, void *fh,
> @@ -345,6 +367,10 @@ struct v4l2_ioctl_ops {
>  				     struct v4l2_format *f);
>  	int (*vidioc_g_fmt_meta_out)(struct file *file, void *fh,
>  				     struct v4l2_format *f);
> +	int (*vidioc_g_fmt_audio_cap)(struct file *file, void *fh,
> +				      struct v4l2_format *f);
> +	int (*vidioc_g_fmt_audio_out)(struct file *file, void *fh,
> +				      struct v4l2_format *f);
>  
>  	/* VIDIOC_S_FMT handlers */
>  	int (*vidioc_s_fmt_vid_cap)(struct file *file, void *fh,
> @@ -375,6 +401,10 @@ struct v4l2_ioctl_ops {
>  				     struct v4l2_format *f);
>  	int (*vidioc_s_fmt_meta_out)(struct file *file, void *fh,
>  				     struct v4l2_format *f);
> +	int (*vidioc_s_fmt_audio_cap)(struct file *file, void *fh,
> +				      struct v4l2_format *f);
> +	int (*vidioc_s_fmt_audio_out)(struct file *file, void *fh,
> +				      struct v4l2_format *f);
>  
>  	/* VIDIOC_TRY_FMT handlers */
>  	int (*vidioc_try_fmt_vid_cap)(struct file *file, void *fh,
> @@ -405,6 +435,10 @@ struct v4l2_ioctl_ops {
>  				       struct v4l2_format *f);
>  	int (*vidioc_try_fmt_meta_out)(struct file *file, void *fh,
>  				       struct v4l2_format *f);
> +	int (*vidioc_try_fmt_audio_cap)(struct file *file, void *fh,
> +					struct v4l2_format *f);
> +	int (*vidioc_try_fmt_audio_out)(struct file *file, void *fh,
> +					struct v4l2_format *f);
>  
>  	/* Buffer handlers */
>  	int (*vidioc_reqbufs)(struct file *file, void *fh,
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 6cd65969c2b5..57c82eb158f1 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -153,6 +153,8 @@ enum v4l2_buf_type {
>  	V4L2_BUF_TYPE_SDR_OUTPUT           = 12,
>  	V4L2_BUF_TYPE_META_CAPTURE         = 13,
>  	V4L2_BUF_TYPE_META_OUTPUT	   = 14,
> +	V4L2_BUF_TYPE_AUDIO_CAPTURE        = 15,
> +	V4L2_BUF_TYPE_AUDIO_OUTPUT         = 16,
>  	/* Deprecated, do not use */
>  	V4L2_BUF_TYPE_PRIVATE              = 0x80,
>  };
> @@ -169,6 +171,7 @@ enum v4l2_buf_type {
>  	 || (type) == V4L2_BUF_TYPE_VBI_OUTPUT			\
>  	 || (type) == V4L2_BUF_TYPE_SLICED_VBI_OUTPUT		\
>  	 || (type) == V4L2_BUF_TYPE_SDR_OUTPUT			\
> +	 || (type) == V4L2_BUF_TYPE_AUDIO_OUTPUT		\
>  	 || (type) == V4L2_BUF_TYPE_META_OUTPUT)
>  
>  #define V4L2_TYPE_IS_CAPTURE(type) (!V4L2_TYPE_IS_OUTPUT(type))
> @@ -2423,6 +2426,18 @@ struct v4l2_meta_format {
>  	__u32				buffersize;
>  } __attribute__ ((packed));
>  
> +/**
> + * struct v4l2_audio_format - audio data format definition
> + * @audioformat:	little endian four character code (fourcc)

Don't use fourcc here. Instead, use the types defined at snd_pcm_format_t.

> + * @channels:		channel numbers
> + * @buffersize:		maximum size in bytes required for data
> + */
> +struct v4l2_audio_format {
> +	__u32				audioformat;
> +	__u32				channels;
> +	__u32				buffersize;
> +} __attribute__ ((packed));
> +
>  /**
>   * struct v4l2_format - stream data format
>   * @type:	enum v4l2_buf_type; type of the data stream
> @@ -2431,6 +2446,7 @@ struct v4l2_meta_format {
>   * @win:	definition of an overlaid image
>   * @vbi:	raw VBI capture or output parameters
>   * @sliced:	sliced VBI capture or output parameters
> + * @audio:	definition of an audio format
>   * @raw_data:	placeholder for future extensions and custom formats
>   * @fmt:	union of @pix, @pix_mp, @win, @vbi, @sliced, @sdr, @meta
>   *		and @raw_data
> @@ -2445,6 +2461,7 @@ struct v4l2_format {
>  		struct v4l2_sliced_vbi_format	sliced;  /* V4L2_BUF_TYPE_SLICED_VBI_CAPTURE */
>  		struct v4l2_sdr_format		sdr;     /* V4L2_BUF_TYPE_SDR_CAPTURE */
>  		struct v4l2_meta_format		meta;    /* V4L2_BUF_TYPE_META_CAPTURE */
> +		struct v4l2_audio_format	audio;   /* V4L2_BUF_TYPE_AUDIO_CAPTURE */
>  		__u8	raw_data[200];                   /* user-defined */
>  	} fmt;
>  };



Thanks,
Mauro

