Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FCA819D2F
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 14:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727463AbfEJMYv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 08:24:51 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:41253 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727464AbfEJMYu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 08:24:50 -0400
Received: from [IPv6:2001:983:e9a7:1:2dea:e21e:760a:b215] ([IPv6:2001:983:e9a7:1:2dea:e21e:760a:b215])
        by smtp-cloud9.xs4all.net with ESMTPA
        id P4Zxhe4LosDWyP4ZyhcPOl; Fri, 10 May 2019 14:24:46 +0200
Subject: Re: [RFC PATCH] media: v4l2-subdev: Verify arguments of
 v4l2_subdev_call()
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190509220901.19737-1-jmkrzyszt@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <b62cd091-06a2-d19c-25ad-3af959f50d1f@xs4all.nl>
Date:   Fri, 10 May 2019 14:24:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509220901.19737-1-jmkrzyszt@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBNwtw475t0bY4gPeVTlq/qEK2bGksdu8dKgC1Ju+gMug7LKuYQlBwpP6hBIuxkozWHlIHz3hzhowz8rcm/4qoHhAUoWjkMhGPmVspu86aeU/pB9eygA
 D6sqN09F7YUB22AjNw3W4tgZDYMjMOmfE1jphwNJP0FZpklvLtnKuVtNGY/gfxPT5zKLFK7ZLmv/85olNrX/y3cu1MFaCejKBXS1B4iedK7awgAzV/EvaQf2
 U5kn+q7+KRCAknJ9jBDvRngyeQvYyx2nGqhDFJwEIRByjuUJUIcJ+81i4c5cmJWeguKK7Tqk7mvtJ5fprEVAdLftqBoWG07Wty3dqHpNl8lhaJCVQXwxCfU+
 iQPY69qcTKQR6nBILvCQpcEOztAqYtyCu/2WOW+cEonDX9W7GeFxpqUoouzWg+OF4bIurX/R8hhpo+nDxkQjiUBDPF3/dw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/10/19 12:09 AM, Janusz Krzysztofik wrote:
> Correctness of format type (try or active) and pad number parameters
> passed to subdevice operation callbacks is now verified only for IOCTL
> calls.  However, those callbacks are also used by drivers, e.g., V4L2
> host interfaces.
> 
> Since both subdev_do_ioctl() and drivers are using v4l2_subdev_call()
> macro while calling subdevice operations, move those parameter checks
> from subdev_do_ioctl() to v4l2_subdev_call() so we can avoid
> reimplementing those checks inside drivers.
> 
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

I'm very much opposed to this as it creates one horrible macro.

The checks must be done for ioctls, since that's called by userspace and
it is therefor untrusted. But v4l2_subdev_call is just an internal
function call, and if you pass wrong arguments, then that's a driver bug.

If you want to avoid code duplication, then a much better approach is to
create helpers functions such as check_format() in e.g. v4l2-common.c that
can be called from wherever it is needed.

Regards,

	Hans

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 121 +++-----------------------
>  include/media/v4l2-subdev.h           |  79 +++++++++++++++++
>  2 files changed, 89 insertions(+), 111 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index d75815ab0d7b..186749d31abf 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -121,53 +121,17 @@ static int subdev_close(struct file *file)
>  }
>  
>  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> -static int check_format(struct v4l2_subdev *sd,
> -			struct v4l2_subdev_format *format)
> +void *v4l2_subdev_call_va_arg(int n, ...)
>  {
> -	if (format->which != V4L2_SUBDEV_FORMAT_TRY &&
> -	    format->which != V4L2_SUBDEV_FORMAT_ACTIVE)
> -		return -EINVAL;
> -
> -	if (format->pad >= sd->entity.num_pads)
> -		return -EINVAL;
> -
> -	return 0;
> -}
> -
> -static int check_crop(struct v4l2_subdev *sd, struct v4l2_subdev_crop *crop)
> -{
> -	if (crop->which != V4L2_SUBDEV_FORMAT_TRY &&
> -	    crop->which != V4L2_SUBDEV_FORMAT_ACTIVE)
> -		return -EINVAL;
> -
> -	if (crop->pad >= sd->entity.num_pads)
> -		return -EINVAL;
> -
> -	return 0;
> -}
> -
> -static int check_selection(struct v4l2_subdev *sd,
> -			   struct v4l2_subdev_selection *sel)
> -{
> -	if (sel->which != V4L2_SUBDEV_FORMAT_TRY &&
> -	    sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
> -		return -EINVAL;
> -
> -	if (sel->pad >= sd->entity.num_pads)
> -		return -EINVAL;
> -
> -	return 0;
> -}
> -
> -static int check_edid(struct v4l2_subdev *sd, struct v4l2_subdev_edid *edid)
> -{
> -	if (edid->pad >= sd->entity.num_pads)
> -		return -EINVAL;
> -
> -	if (edid->blocks && edid->edid == NULL)
> -		return -EINVAL;
> -
> -	return 0;
> +	va_list ap;
> +	int i;
> +	void *p;
> +
> +	va_start(ap, n);
> +	for (i = 9; i < n; i++)
> +		p = va_arg(ap, void *);
> +	va_end(ap);
> +	return p;
>  }
>  #endif
>  
> @@ -292,10 +256,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  	case VIDIOC_SUBDEV_G_FMT: {
>  		struct v4l2_subdev_format *format = arg;
>  
> -		rval = check_format(sd, format);
> -		if (rval)
> -			return rval;
> -
>  		memset(format->reserved, 0, sizeof(format->reserved));
>  		memset(format->format.reserved, 0, sizeof(format->format.reserved));
>  		return v4l2_subdev_call(sd, pad, get_fmt, subdev_fh->pad, format);
> @@ -304,10 +264,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  	case VIDIOC_SUBDEV_S_FMT: {
>  		struct v4l2_subdev_format *format = arg;
>  
> -		rval = check_format(sd, format);
> -		if (rval)
> -			return rval;
> -
>  		memset(format->reserved, 0, sizeof(format->reserved));
>  		memset(format->format.reserved, 0, sizeof(format->format.reserved));
>  		return v4l2_subdev_call(sd, pad, set_fmt, subdev_fh->pad, format);
> @@ -317,10 +273,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  		struct v4l2_subdev_crop *crop = arg;
>  		struct v4l2_subdev_selection sel;
>  
> -		rval = check_crop(sd, crop);
> -		if (rval)
> -			return rval;
> -
>  		memset(crop->reserved, 0, sizeof(crop->reserved));
>  		memset(&sel, 0, sizeof(sel));
>  		sel.which = crop->which;
> @@ -340,10 +292,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  		struct v4l2_subdev_selection sel;
>  
>  		memset(crop->reserved, 0, sizeof(crop->reserved));
> -		rval = check_crop(sd, crop);
> -		if (rval)
> -			return rval;
> -
>  		memset(&sel, 0, sizeof(sel));
>  		sel.which = crop->which;
>  		sel.pad = crop->pad;
> @@ -361,13 +309,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  	case VIDIOC_SUBDEV_ENUM_MBUS_CODE: {
>  		struct v4l2_subdev_mbus_code_enum *code = arg;
>  
> -		if (code->which != V4L2_SUBDEV_FORMAT_TRY &&
> -		    code->which != V4L2_SUBDEV_FORMAT_ACTIVE)
> -			return -EINVAL;
> -
> -		if (code->pad >= sd->entity.num_pads)
> -			return -EINVAL;
> -
>  		memset(code->reserved, 0, sizeof(code->reserved));
>  		return v4l2_subdev_call(sd, pad, enum_mbus_code, subdev_fh->pad,
>  					code);
> @@ -376,13 +317,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  	case VIDIOC_SUBDEV_ENUM_FRAME_SIZE: {
>  		struct v4l2_subdev_frame_size_enum *fse = arg;
>  
> -		if (fse->which != V4L2_SUBDEV_FORMAT_TRY &&
> -		    fse->which != V4L2_SUBDEV_FORMAT_ACTIVE)
> -			return -EINVAL;
> -
> -		if (fse->pad >= sd->entity.num_pads)
> -			return -EINVAL;
> -
>  		memset(fse->reserved, 0, sizeof(fse->reserved));
>  		return v4l2_subdev_call(sd, pad, enum_frame_size, subdev_fh->pad,
>  					fse);
> @@ -391,9 +325,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  	case VIDIOC_SUBDEV_G_FRAME_INTERVAL: {
>  		struct v4l2_subdev_frame_interval *fi = arg;
>  
> -		if (fi->pad >= sd->entity.num_pads)
> -			return -EINVAL;
> -
>  		memset(fi->reserved, 0, sizeof(fi->reserved));
>  		return v4l2_subdev_call(sd, video, g_frame_interval, arg);
>  	}
> @@ -401,9 +332,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  	case VIDIOC_SUBDEV_S_FRAME_INTERVAL: {
>  		struct v4l2_subdev_frame_interval *fi = arg;
>  
> -		if (fi->pad >= sd->entity.num_pads)
> -			return -EINVAL;
> -
>  		memset(fi->reserved, 0, sizeof(fi->reserved));
>  		return v4l2_subdev_call(sd, video, s_frame_interval, arg);
>  	}
> @@ -411,13 +339,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  	case VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL: {
>  		struct v4l2_subdev_frame_interval_enum *fie = arg;
>  
> -		if (fie->which != V4L2_SUBDEV_FORMAT_TRY &&
> -		    fie->which != V4L2_SUBDEV_FORMAT_ACTIVE)
> -			return -EINVAL;
> -
> -		if (fie->pad >= sd->entity.num_pads)
> -			return -EINVAL;
> -
>  		memset(fie->reserved, 0, sizeof(fie->reserved));
>  		return v4l2_subdev_call(sd, pad, enum_frame_interval, subdev_fh->pad,
>  					fie);
> @@ -426,10 +347,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  	case VIDIOC_SUBDEV_G_SELECTION: {
>  		struct v4l2_subdev_selection *sel = arg;
>  
> -		rval = check_selection(sd, sel);
> -		if (rval)
> -			return rval;
> -
>  		memset(sel->reserved, 0, sizeof(sel->reserved));
>  		return v4l2_subdev_call(
>  			sd, pad, get_selection, subdev_fh->pad, sel);
> @@ -438,10 +355,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  	case VIDIOC_SUBDEV_S_SELECTION: {
>  		struct v4l2_subdev_selection *sel = arg;
>  
> -		rval = check_selection(sd, sel);
> -		if (rval)
> -			return rval;
> -
>  		memset(sel->reserved, 0, sizeof(sel->reserved));
>  		return v4l2_subdev_call(
>  			sd, pad, set_selection, subdev_fh->pad, sel);
> @@ -450,38 +363,24 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  	case VIDIOC_G_EDID: {
>  		struct v4l2_subdev_edid *edid = arg;
>  
> -		rval = check_edid(sd, edid);
> -		if (rval)
> -			return rval;
> -
>  		return v4l2_subdev_call(sd, pad, get_edid, edid);
>  	}
>  
>  	case VIDIOC_S_EDID: {
>  		struct v4l2_subdev_edid *edid = arg;
>  
> -		rval = check_edid(sd, edid);
> -		if (rval)
> -			return rval;
> -
>  		return v4l2_subdev_call(sd, pad, set_edid, edid);
>  	}
>  
>  	case VIDIOC_SUBDEV_DV_TIMINGS_CAP: {
>  		struct v4l2_dv_timings_cap *cap = arg;
>  
> -		if (cap->pad >= sd->entity.num_pads)
> -			return -EINVAL;
> -
>  		return v4l2_subdev_call(sd, pad, dv_timings_cap, cap);
>  	}
>  
>  	case VIDIOC_SUBDEV_ENUM_DV_TIMINGS: {
>  		struct v4l2_enum_dv_timings *dvt = arg;
>  
> -		if (dvt->pad >= sd->entity.num_pads)
> -			return -EINVAL;
> -
>  		return v4l2_subdev_call(sd, pad, enum_dv_timings, dvt);
>  	}
>  
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index a7fa5b80915a..a0ad8c6f588b 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1091,6 +1091,82 @@ void v4l2_subdev_free_pad_config(struct v4l2_subdev_pad_config *cfg);
>  void v4l2_subdev_init(struct v4l2_subdev *sd,
>  		      const struct v4l2_subdev_ops *ops);
>  
> +#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> +void *v4l2_subdev_call_va_arg(int n, ...);
> +
> +#define v4l2_subdev_call_chk_args(sd, o, f, args...)			\
> +({									\
> +	__u32 __which = V4L2_SUBDEV_FORMAT_ACTIVE;			\
> +	__u32 __pad = 0;						\
> +	if ((void *)&sd->ops->o == &sd->ops->pad) {			\
> +		if ((void *)&sd->ops->o->f == &sd->ops->pad->get_fmt ||	\
> +		    (void *)&sd->ops->o->f == &sd->ops->pad->set_fmt) {	\
> +			struct v4l2_subdev_format *__fmt;		\
> +			__fmt = v4l2_subdev_call_va_arg(2, ##args);	\
> +			__which = __fmt->which;				\
> +			__pad = __fmt->pad;				\
> +		} else if ((void *)&sd->ops->o->f ==			\
> +				   &sd->ops->pad->enum_mbus_code) {	\
> +			struct v4l2_subdev_mbus_code_enum *__code;	\
> +			__code = v4l2_subdev_call_va_arg(2, ##args);	\
> +			__which = __code->which;			\
> +			__pad = __code->pad;				\
> +		} else if ((void *)&sd->ops->o->f ==			\
> +				   &sd->ops->pad->enum_frame_size) {	\
> +			struct v4l2_subdev_frame_size_enum *__fse;	\
> +			__fse = v4l2_subdev_call_va_arg(2, ##args);	\
> +			__which = __fse->which;				\
> +			__pad = __fse->pad;				\
> +		} else if ((void *)&sd->ops->o->f ==			\
> +				   &sd->ops->pad->enum_frame_interval) {\
> +			struct v4l2_subdev_frame_interval_enum *__fie;	\
> +			__fie = v4l2_subdev_call_va_arg(2, ##args);	\
> +			__which = __fie->which;				\
> +			__pad = __fie->pad;				\
> +		} else if ((void *)&sd->ops->o->f ==			\
> +				   &sd->ops->pad->get_selection ||	\
> +			   (void *)&sd->ops->o->f ==			\
> +				   &sd->ops->pad->set_selection) {	\
> +			struct v4l2_subdev_selection *__sel;		\
> +			__sel = v4l2_subdev_call_va_arg(2, ##args);	\
> +			__which = __sel->which;				\
> +			__pad = __sel->pad;				\
> +		} else if ((void *)&sd->ops->o->f ==			\
> +				   &sd->ops->pad->get_edid ||		\
> +			   (void *)&sd->ops->o->f ==			\
> +				   &sd->ops->pad->set_edid) {		\
> +			struct v4l2_subdev_edid *__edid;		\
> +			__edid = v4l2_subdev_call_va_arg(1, ##args);	\
> +			__pad = __edid->pad;				\
> +		} else if ((void *)&sd->ops->o->f ==			\
> +				   &sd->ops->pad->dv_timings_cap) {	\
> +			struct v4l2_dv_timings_cap *__cap;		\
> +			__cap = v4l2_subdev_call_va_arg(1, ##args);	\
> +			__pad = __cap->pad;				\
> +		} else if ((void *)&sd->ops->o->f ==			\
> +				   &sd->ops->pad->enum_dv_timings) {	\
> +			struct v4l2_enum_dv_timings *__dvt;		\
> +			__dvt = v4l2_subdev_call_va_arg(1, ##args);	\
> +			__pad = __dvt->pad;				\
> +		}							\
> +	} else if ((void *)&sd->ops->o == &sd->ops->video) {		\
> +		if ((void *)&sd->ops->o->f ==				\
> +			    &sd->ops->video->g_frame_interval ||	\
> +		    (void *)&sd->ops->o->f ==				\
> +			    &sd->ops->video->s_frame_interval) {	\
> +			struct v4l2_subdev_frame_interval *__fi;	\
> +			__fi = v4l2_subdev_call_va_arg(1, ##args);	\
> +			__pad = __fi->pad;				\
> +		}							\
> +	}								\
> +	(__which == V4L2_SUBDEV_FORMAT_ACTIVE ||			\
> +	 __which == V4L2_SUBDEV_FORMAT_TRY) &&				\
> +	__pad < (sd->entity.num_pads ? : 1) ? 0 : -EINVAL;		\
> +})
> +#else
> +#define v4l2_subdev_call_chk_args(sd, o, f, args...) 0
> +#endif
> +
>  /**
>   * v4l2_subdev_call - call an operation of a v4l2_subdev.
>   *
> @@ -1112,6 +1188,9 @@ void v4l2_subdev_init(struct v4l2_subdev *sd,
>  			__result = -ENODEV;				\
>  		else if (!(__sd->ops->o && __sd->ops->o->f))		\
>  			__result = -ENOIOCTLCMD;			\
> +		else if (v4l2_subdev_call_chk_args(sd, o, f, ##args))	\
> +			__result = v4l2_subdev_call_chk_args(sd, o, f,	\
> +							     ##args);	\
>  		else							\
>  			__result = __sd->ops->o->f(__sd, ##args);	\
>  		__result;						\
> 

