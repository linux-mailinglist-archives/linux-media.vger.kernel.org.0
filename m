Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A615082329
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2019 18:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729787AbfHEQxh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 12:53:37 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:35327 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726779AbfHEQxg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 5 Aug 2019 12:53:36 -0400
Received: from [10.125.143.226] ([138.219.197.106])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ugEbhXhd3AffAugEgh0jRq; Mon, 05 Aug 2019 18:53:33 +0200
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [RFC PATCH 3/5] media: v4l2: Add m2m codec helpers
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20190805094827.11205-1-boris.brezillon@collabora.com>
 <20190805094827.11205-4-boris.brezillon@collabora.com>
Message-ID: <bca63b3d-7254-99db-bcf4-cb3f2511c69a@xs4all.nl>
Date:   Mon, 5 Aug 2019 13:53:20 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190805094827.11205-4-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDX7TKpPWU3h+UnX/VoOmM397+pqRNZIJX0FzLz+C3NEzgw2l3k5fyY//6YFqIXVLhcqdWxg2xvC2ceL6poGV9GqdGi7WvUbIV75aDyVp7YvIJkS6UyE
 rvSPOwLF5cLpOMgUracIM1xuOcS6+U8JdbF2gjYREsyGgq38ZHqicVhJIGqOTi34HCbjouJzLqfdpnJayOpxE7c4iHyQLTp1H7cMU5Jn7JMi3J+4gTx9jbkS
 wrbffpOEsIs0S5iERqZPGfROAnQ4fxXSWaL40AojJJFNr640iwyp9MwLI9L86EKD5YXUTeNmN+BGbq1RwchC9exptxHbAHuPS2hR3M+0Pay74wbnx7jYvVVF
 Ufb7gWs/SZMsg/I03kTQ7D+tYXc+FpYacdj1VeMC4VtGvs7s6BAwIHtE2TsvJ6Y8KaUg5b9GlHnhqzkcBdOYk0M990O5lEOWk3YmNZT+rMJxCc/8XzffwijY
 AfmqW4GQfYHHVmUYaF4MmwMNlnXJEwEA7QrKuGd+SldumozFtHZzYfw+ElSYZjHvxmJMXwlNLzeXj0d2m2mQDfzeGwRc9zopMq4lIN8PvfJ3kAnWKtZ246s4
 OyvQU1nidBADtEAiy2YDyR3sIB+c5OIy/DsT6onJ3sjau/09QY16OhG/i4hPmUgTI6GgylqtGmA8tFoJir8XWnDPkkMSNDmzTMbGvNRKNTPpK4k6gsLR5R/Z
 ybWL1Iyh0Iy/o9pRifSe8FmIUmcyTeEsVmlQ71s/cx3x//98VkmD2g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/5/19 6:48 AM, Boris Brezillon wrote:
> Most codec drivers do the same thing, let's extract those generic bits
> and provide them as m2m_codec helpers.
> 
> Each compressed-format will have its own set of sub-helpers.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>   drivers/media/v4l2-core/Kconfig              |    4 +
>   drivers/media/v4l2-core/Makefile             |    1 +
>   drivers/media/v4l2-core/v4l2-mem2mem-codec.c | 1170 ++++++++++++++++++
>   include/media/v4l2-mem2mem-codec.h           |  317 +++++
>   4 files changed, 1492 insertions(+)
>   create mode 100644 drivers/media/v4l2-core/v4l2-mem2mem-codec.c
>   create mode 100644 include/media/v4l2-mem2mem-codec.h
> 

<snip>

> diff --git a/include/media/v4l2-mem2mem-codec.h b/include/media/v4l2-mem2mem-codec.h
> new file mode 100644
> index 000000000000..2c3e21d53f9e
> --- /dev/null
> +++ b/include/media/v4l2-mem2mem-codec.h
> @@ -0,0 +1,317 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Memory-to-memory codec framework for Video for Linux 2.
> + *
> + * Helper functions for codec devices that use memory buffers for both source
> + * and destination.
> + *
> + * Copyright (c) 2019 Collabora Ltd.
> + *
> + * Author:
> + *	Boris Brezillon <boris.brezillon@collabora.com>
> + */
> +
> +#ifndef _MEDIA_V4L2_MEM2MEM_CODEC_H
> +#define _MEDIA_V4L2_MEM2MEM_CODEC_H
> +
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-dev.h>
> +#include <media/v4l2-fh.h>
> +#include <media/v4l2-mem2mem.h>
> +
> +struct v4l2_m2m_codec_ctx;
> +
> +/**
> + * struct v4l2_m2m_codec_ctrl_desc - Codec control description
> + * @per_request: set to true if the control is expected to be set everytime a
> + *		 decoding/encoding request is queued
> + * @mandatory: set to true if the control is mandatory
> + * @cfg: control configuration
> + */
> +struct v4l2_m2m_codec_ctrl_desc {
> +	u32 per_request : 1;
> +	u32 mandatory : 1;
> +	struct v4l2_ctrl_config cfg;
> +};
> +
> +/**
> + * struct v4l2_m2m_codec_ctrls - Codec controls
> + * @ctrls: array of control descriptions
> + * @num_ctrls: size of the ctrls array
> + *
> + * Structure used to declare codec specific controls.
> + */
> +struct v4l2_m2m_codec_ctrls {
> +	const struct v4l2_m2m_codec_ctrl_desc *ctrls;
> +	unsigned int num_ctrls;
> +};
> +
> +#define V4L2_M2M_CODEC_CTRLS(_name, ...)						\
> +	struct v4l2_m2m_codec_ctrls _name = {						\
> +		.ctrls = (const struct v4l2_m2m_codec_ctrl_desc[]){__VA_ARGS__},	\
> +		.num_ctrls = sizeof((struct v4l2_m2m_codec_ctrl_desc[]){__VA_ARGS__}) /	\
> +			     sizeof(struct v4l2_m2m_codec_ctrl_desc),			\
> +	}
> +
> +/**
> + * struct v4l2_m2m_codec_decoded_fmt_desc - Decoded format description
> + * @fourcc: the 4CC code of the decoded format
> + * @priv: driver private data to associate to this decoded format
> + *
> + * Structure used to describe decoded formats.
> + */
> +struct v4l2_m2m_codec_decoded_fmt_desc {
> +	u32 fourcc;
> +	const void *priv;
> +};
> +
> +/**
> + * struct v4l2_m2m_codec_coded_fmt_ops - Coded format methods
> + * @adjust_fmt: adjust a coded format before passing it back to userspace.
> + *		Particularly useful when one wants to tweak any of the
> + *		params set by the core (sizeimage, width, height, ...)
> + * @start: called when vb2_ops->start_streaming() is called. Any coded-format
> + *	   specific context initialization should happen here
> + * @stop: called when vb2_ops->stop_streaming() is called. Any coded-format
> + *	  specific context cleanup should happen here
> + * @run: called when v4l2_m2m_ops->device_run() is called. This method should
> + *	 issue the encoding/decoding request
> + */
> +struct v4l2_m2m_codec_coded_fmt_ops {
> +	int (*adjust_fmt)(struct v4l2_m2m_codec_ctx *ctx,
> +			  struct v4l2_format *f);
> +	int (*start)(struct v4l2_m2m_codec_ctx *ctx);
> +	void (*stop)(struct v4l2_m2m_codec_ctx *ctx);
> +	int (*run)(struct v4l2_m2m_codec_ctx *ctx);
> +};
> +
> +/**
> + * struct v4l2_m2m_codec_coded_fmt_desc - Coded format description
> + * @fourcc: 4CC code describing this coded format
> + * @requires_request: set to true if the codec requires a media request object
> + *		      to process encoding/decoding requests
> + * @frmsize: frame size constraint. Can be NULL if the codec does not have any
> + *	     alignment/min/max size constraints for this coded format
> + * @ctrls: controls attached to this coded format
> + * @ops: coded format ops
> + * @priv: driver private data
> + */
> +struct v4l2_m2m_codec_coded_fmt_desc {
> +	u32 fourcc;
> +	u32 requires_requests : 1;
> +	const struct v4l2_frmsize_stepwise *frmsize;
> +	const struct v4l2_m2m_codec_ctrls *ctrls;
> +	const struct v4l2_m2m_codec_coded_fmt_ops *ops;
> +	const void *priv;
> +};
> +
> +#define V4L2_M2M_CODEC_CODED_FMTS(_fmt_array)		\
> +	.num_coded_fmts = ARRAY_SIZE(_fmt_array),	\
> +	.coded_fmts = _fmt_array
> +
> +#define V4L2_M2M_CODEC_DECODED_FMTS(_fmt_array)		\
> +	.num_decoded_fmts = ARRAY_SIZE(_fmt_array),	\
> +	.decoded_fmts = _fmt_array
> +
> +/**
> + * struct v4l2_m2m_codec_caps - Codec capabilities
> + * @coded_fmts: array of supported coded formats
> + * @num_coded_fmts: size of the coded_fmts array
> + * @decoded_fmts: array of supported decoded formats
> + * @num_decoded_fmts: size of the decoded_fmts array
> + *
> + * This structure is describing the formats supported by the codec.
> + */
> +struct v4l2_m2m_codec_caps {
> +	const struct v4l2_m2m_codec_coded_fmt_desc *coded_fmts;
> +	unsigned int num_coded_fmts;
> +	const struct v4l2_m2m_codec_decoded_fmt_desc *decoded_fmts;
> +	unsigned int num_decoded_fmts;
> +};
> +
> +/**
> + * enum v4l2_m2m_codec_type - Codec type
> + * @V4L2_M2M_ENCODER: encoder
> + * @V4L2_M2M_DECODER: decoder
> + */
> +enum v4l2_m2m_codec_type {
> +	V4L2_M2M_ENCODER,
> +	V4L2_M2M_DECODER,
> +};
> +
> +/**
> + * struct v4l2_m2m_codec_ops - Codec methods
> + * @queue_init: called by the v4l2_m2m_codec_queue_init() helper to let the
> + *		driver initialize the src/dst queues
> + */
> +struct v4l2_m2m_codec_ops {
> +	int (*queue_init)(struct v4l2_m2m_codec_ctx *ctx,
> +			  struct vb2_queue *src_vq,
> +			  struct vb2_queue *dst_vq);
> +};
> +
> +/**
> + * struct v4l2_m2m_codec - Codec object
> + * @vdev: video device exposed by the codec
> + * @type: type of codec
> + * @m2m_dev: m2m device this codec is attached to
> + * @caps: codec capabilities
> + * @ops: codec operations
> + */
> +struct v4l2_m2m_codec {
> +	struct video_device vdev;
> +	enum v4l2_m2m_codec_type type;
> +	struct v4l2_m2m_dev *m2m_dev;
> +	const struct v4l2_m2m_codec_caps *caps;
> +	const struct v4l2_m2m_codec_ops *ops;
> +};

I have problems with this struct and...

> +
> +static inline struct v4l2_m2m_codec *
> +vdev_to_v4l2_m2m_codec(struct video_device *vdev)
> +{
> +	return container_of(vdev, struct v4l2_m2m_codec, vdev);
> +}
> +
> +static inline struct video_device *
> +v4l2_m2m_codec_to_vdev(struct v4l2_m2m_codec *codec)
> +{
> +	return &codec->vdev;
> +}
> +
> +static inline enum v4l2_m2m_codec_type
> +v4l2_m2m_codec_get_type(const struct v4l2_m2m_codec *codec)
> +{
> +	return codec->type;
> +}
> +
> +/**
> + * struct v4l2_m2m_codec_ctx - Codec context
> + * @fh: file handle
> + * @coded_fmt: current coded format
> + * @decoded_fmt: current decoded format
> + * @coded_fmt_desc: current coded format desc
> + * @decoded_fmt_desc: current decoded format desc
> + * @ctrl_hdl: control handler
> + * @codec: the codec that has created this context
> + */
> +struct v4l2_m2m_codec_ctx {
> +	struct v4l2_fh fh;
> +	struct v4l2_format coded_fmt;
> +	struct v4l2_format decoded_fmt;
> +	const struct v4l2_m2m_codec_coded_fmt_desc *coded_fmt_desc;
> +	const struct v4l2_m2m_codec_decoded_fmt_desc *decoded_fmt_desc;
> +	struct v4l2_ctrl_handler ctrl_hdl;
> +	struct v4l2_m2m_codec *codec;
> +};

...this struct.

So basically everything in this header :-)

I haven't done an in-depth review, but my main concern is that I
believe these structs and the helpers depending on them are too
high-level.

The helpers themselves often look reasonable, except that they could
be more generic if it wasn't for these high-level structs.

My feeling is that it would make more sense if you would create structs 
dealing just with formats and structs just for controls and don't try
to mix in things like struct video_device or struct v4l2_fh.

I think that will create a better balance between providing helpers
for codec drivers without hiding too much inside v4l2_m2m_codec_* structs.

Regards,

	Hans

> +
> +static inline struct v4l2_m2m_codec_ctx *
> +fh_to_v4l2_m2m_codec_ctx(struct v4l2_fh *fh)
> +{
> +	return container_of(fh, struct v4l2_m2m_codec_ctx, fh);
> +}
> +
> +static inline struct v4l2_m2m_codec_ctx *
> +file_to_v4l2_m2m_codec_ctx(struct file *file)
> +{
> +	return fh_to_v4l2_m2m_codec_ctx(file->private_data);
> +}
> +
> +static inline struct v4l2_m2m_ctx *
> +v4l2_m2m_codec_get_m2m_ctx(struct v4l2_m2m_codec_ctx *ctx)
> +{
> +	return ctx->fh.m2m_ctx;
> +}
> +
> +static inline struct v4l2_ctrl_handler *
> +v4l2_m2m_codec_get_ctrl_handler(struct v4l2_m2m_codec_ctx *ctx)
> +{
> +	return &ctx->ctrl_hdl;
> +}
> +
> +struct v4l2_m2m_codec_run {
> +	struct {
> +		struct vb2_v4l2_buffer *src;
> +		struct vb2_v4l2_buffer *dst;
> +	} bufs;
> +};
> +
> +int v4l2_m2m_codec_init(struct v4l2_m2m_codec *codec,
> +			enum v4l2_m2m_codec_type type,
> +			struct v4l2_m2m_dev *m2m_dev,
> +			struct v4l2_device *v4l2_dev,
> +			const struct v4l2_m2m_codec_caps *caps,
> +			const struct v4l2_m2m_codec_ops *ops,
> +			const struct v4l2_file_operations *vdev_fops,
> +			const struct v4l2_ioctl_ops *vdev_ioctl_ops,
> +			struct mutex *lock, const char *name, void *drvdata);
> +int v4l2_m2m_codec_ctx_init(struct v4l2_m2m_codec_ctx *ctx, struct file *file,
> +			    struct v4l2_m2m_codec *codec);
> +void v4l2_m2m_codec_ctx_cleanup(struct v4l2_m2m_codec_ctx *ctx);
> +void v4l2_m2m_codec_run_preamble(struct v4l2_m2m_codec_ctx *ctx,
> +				 struct v4l2_m2m_codec_run *run);
> +void v4l2_m2m_codec_run_postamble(struct v4l2_m2m_codec_ctx *ctx,
> +				  struct v4l2_m2m_codec_run *run);
> +void v4l2_m2m_codec_job_finish(struct v4l2_m2m_codec_ctx *ctx,
> +			       enum vb2_buffer_state state);
> +
> +static inline const struct v4l2_format *
> +v4l2_m2m_codec_get_coded_fmt(struct v4l2_m2m_codec_ctx *ctx)
> +{
> +	return &ctx->coded_fmt;
> +}
> +
> +static inline const struct v4l2_m2m_codec_coded_fmt_desc *
> +v4l2_m2m_codec_get_coded_fmt_desc(struct v4l2_m2m_codec_ctx *ctx)
> +{
> +	return ctx->coded_fmt_desc;
> +}
> +
> +static inline const struct v4l2_format *
> +v4l2_m2m_codec_get_decoded_fmt(struct v4l2_m2m_codec_ctx *ctx)
> +{
> +	return &ctx->decoded_fmt;
> +}
> +
> +static inline const struct v4l2_m2m_codec_decoded_fmt_desc *
> +v4l2_m2m_codec_get_decoded_fmt_desc(struct v4l2_m2m_codec_ctx *ctx)
> +{
> +	return ctx->decoded_fmt_desc;
> +}
> +
> +void v4l2_m2m_codec_reset_decoded_fmt(struct v4l2_m2m_codec_ctx *ctx);
> +const struct v4l2_m2m_codec_coded_fmt_desc *
> +v4l2_m2m_codec_find_coded_fmt_desc(struct v4l2_m2m_codec *codec, u32 fourcc);
> +int v4l2_m2m_codec_enum_framesizes(struct file *file, void *priv,
> +				   struct v4l2_frmsizeenum *fsize);
> +int v4l2_m2m_codec_enum_output_fmt(struct file *file, void *priv,
> +				   struct v4l2_fmtdesc *f);
> +int v4l2_m2m_codec_enum_capture_fmt(struct file *file, void *priv,
> +				    struct v4l2_fmtdesc *f);
> +int v4l2_m2m_codec_g_output_fmt(struct file *file, void *priv,
> +				struct v4l2_format *f);
> +int v4l2_m2m_codec_g_capture_fmt(struct file *file, void *priv,
> +				 struct v4l2_format *f);
> +int v4l2_m2m_codec_try_output_fmt(struct file *file, void *priv,
> +				  struct v4l2_format *f);
> +int v4l2_m2m_codec_try_capture_fmt(struct file *file, void *priv,
> +				   struct v4l2_format *f);
> +int v4l2_m2m_codec_s_output_fmt(struct file *file, void *priv,
> +				struct v4l2_format *f);
> +int v4l2_m2m_codec_s_capture_fmt(struct file *file, void *priv,
> +				 struct v4l2_format *f);
> +
> +int v4l2_m2m_codec_queue_setup(struct vb2_queue *vq, unsigned int *num_buffers,
> +			       unsigned int *num_planes, unsigned int sizes[],
> +			       struct device *alloc_devs[]);
> +void v4l2_m2m_codec_queue_cleanup(struct vb2_queue *vq, u32 state);
> +int v4l2_m2m_codec_buf_out_validate(struct vb2_buffer *vb);
> +int v4l2_m2m_codec_buf_prepare(struct vb2_buffer *vb);
> +void v4l2_m2m_codec_buf_queue(struct vb2_buffer *vb);
> +void v4l2_m2m_codec_buf_request_complete(struct vb2_buffer *vb);
> +int v4l2_m2m_codec_start_streaming(struct vb2_queue *q, unsigned int count);
> +void v4l2_m2m_codec_stop_streaming(struct vb2_queue *q);
> +
> +int v4l2_m2m_codec_request_validate(struct media_request *req);
> +int v4l2_m2m_codec_device_run(struct v4l2_m2m_codec_ctx *ctx);
> +
> +#endif /* _MEDIA_V4L2_MEM2MEM_CODEC_H */
> 

