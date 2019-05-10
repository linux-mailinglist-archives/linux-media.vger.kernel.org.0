Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6564A19D78
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 14:55:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727247AbfEJMzN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 08:55:13 -0400
Received: from mga01.intel.com ([192.55.52.88]:57276 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727071AbfEJMzN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 08:55:13 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 May 2019 05:55:12 -0700
X-ExtLoop1: 1
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga005.fm.intel.com with ESMTP; 10 May 2019 05:55:11 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 2C90F20800; Fri, 10 May 2019 15:55:10 +0300 (EEST)
Date:   Fri, 10 May 2019 15:55:10 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] media: v4l2-subdev: Verify arguments of
 v4l2_subdev_call()
Message-ID: <20190510125509.ov2dnesdgohreyxs@paasikivi.fi.intel.com>
References: <20190509220901.19737-1-jmkrzyszt@gmail.com>
 <b62cd091-06a2-d19c-25ad-3af959f50d1f@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b62cd091-06a2-d19c-25ad-3af959f50d1f@xs4all.nl>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Janusz,

On Fri, May 10, 2019 at 02:24:45PM +0200, Hans Verkuil wrote:
> On 5/10/19 12:09 AM, Janusz Krzysztofik wrote:
> > Correctness of format type (try or active) and pad number parameters
> > passed to subdevice operation callbacks is now verified only for IOCTL
> > calls.  However, those callbacks are also used by drivers, e.g., V4L2
> > host interfaces.
> > 
> > Since both subdev_do_ioctl() and drivers are using v4l2_subdev_call()
> > macro while calling subdevice operations, move those parameter checks
> > from subdev_do_ioctl() to v4l2_subdev_call() so we can avoid
> > reimplementing those checks inside drivers.
> > 
> > Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> 
> I'm very much opposed to this as it creates one horrible macro.
> 
> The checks must be done for ioctls, since that's called by userspace and
> it is therefor untrusted. But v4l2_subdev_call is just an internal
> function call, and if you pass wrong arguments, then that's a driver bug.

It's a driver bug, but there are bugs in drivers. It'd be better to be able
to catch them. As the sub-device API grows, this will become even more
important going forward.

> 
> If you want to avoid code duplication, then a much better approach is to
> create helpers functions such as check_format() in e.g. v4l2-common.c that
> can be called from wherever it is needed.

I think we could, as an alternative, add wrapper functions for calling V4L2
sub-device ops. Beyond checking that the arguments are valid, the compiler
would also perform type checking which would help catching bugs as well.
The IOCTL handlers could depend on the same checks so there would be no
code duplication.

> 
> Regards,
> 
> 	Hans
> 
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 121 +++-----------------------
> >  include/media/v4l2-subdev.h           |  79 +++++++++++++++++
> >  2 files changed, 89 insertions(+), 111 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index d75815ab0d7b..186749d31abf 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -121,53 +121,17 @@ static int subdev_close(struct file *file)
> >  }
> >  
> >  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> > -static int check_format(struct v4l2_subdev *sd,
> > -			struct v4l2_subdev_format *format)
> > +void *v4l2_subdev_call_va_arg(int n, ...)
> >  {
> > -	if (format->which != V4L2_SUBDEV_FORMAT_TRY &&
> > -	    format->which != V4L2_SUBDEV_FORMAT_ACTIVE)
> > -		return -EINVAL;
> > -
> > -	if (format->pad >= sd->entity.num_pads)
> > -		return -EINVAL;
> > -
> > -	return 0;
> > -}
> > -
> > -static int check_crop(struct v4l2_subdev *sd, struct v4l2_subdev_crop *crop)
> > -{
> > -	if (crop->which != V4L2_SUBDEV_FORMAT_TRY &&
> > -	    crop->which != V4L2_SUBDEV_FORMAT_ACTIVE)
> > -		return -EINVAL;
> > -
> > -	if (crop->pad >= sd->entity.num_pads)
> > -		return -EINVAL;
> > -
> > -	return 0;
> > -}
> > -
> > -static int check_selection(struct v4l2_subdev *sd,
> > -			   struct v4l2_subdev_selection *sel)
> > -{
> > -	if (sel->which != V4L2_SUBDEV_FORMAT_TRY &&
> > -	    sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
> > -		return -EINVAL;
> > -
> > -	if (sel->pad >= sd->entity.num_pads)
> > -		return -EINVAL;
> > -
> > -	return 0;
> > -}
> > -
> > -static int check_edid(struct v4l2_subdev *sd, struct v4l2_subdev_edid *edid)
> > -{
> > -	if (edid->pad >= sd->entity.num_pads)
> > -		return -EINVAL;
> > -
> > -	if (edid->blocks && edid->edid == NULL)
> > -		return -EINVAL;
> > -
> > -	return 0;
> > +	va_list ap;
> > +	int i;
> > +	void *p;
> > +
> > +	va_start(ap, n);
> > +	for (i = 9; i < n; i++)
> > +		p = va_arg(ap, void *);
> > +	va_end(ap);
> > +	return p;
> >  }
> >  #endif
> >  
> > @@ -292,10 +256,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
> >  	case VIDIOC_SUBDEV_G_FMT: {
> >  		struct v4l2_subdev_format *format = arg;
> >  
> > -		rval = check_format(sd, format);
> > -		if (rval)
> > -			return rval;
> > -
> >  		memset(format->reserved, 0, sizeof(format->reserved));
> >  		memset(format->format.reserved, 0, sizeof(format->format.reserved));
> >  		return v4l2_subdev_call(sd, pad, get_fmt, subdev_fh->pad, format);
> > @@ -304,10 +264,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
> >  	case VIDIOC_SUBDEV_S_FMT: {
> >  		struct v4l2_subdev_format *format = arg;
> >  
> > -		rval = check_format(sd, format);
> > -		if (rval)
> > -			return rval;
> > -
> >  		memset(format->reserved, 0, sizeof(format->reserved));
> >  		memset(format->format.reserved, 0, sizeof(format->format.reserved));
> >  		return v4l2_subdev_call(sd, pad, set_fmt, subdev_fh->pad, format);
> > @@ -317,10 +273,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
> >  		struct v4l2_subdev_crop *crop = arg;
> >  		struct v4l2_subdev_selection sel;
> >  
> > -		rval = check_crop(sd, crop);
> > -		if (rval)
> > -			return rval;
> > -
> >  		memset(crop->reserved, 0, sizeof(crop->reserved));
> >  		memset(&sel, 0, sizeof(sel));
> >  		sel.which = crop->which;
> > @@ -340,10 +292,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
> >  		struct v4l2_subdev_selection sel;
> >  
> >  		memset(crop->reserved, 0, sizeof(crop->reserved));
> > -		rval = check_crop(sd, crop);
> > -		if (rval)
> > -			return rval;
> > -
> >  		memset(&sel, 0, sizeof(sel));
> >  		sel.which = crop->which;
> >  		sel.pad = crop->pad;
> > @@ -361,13 +309,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
> >  	case VIDIOC_SUBDEV_ENUM_MBUS_CODE: {
> >  		struct v4l2_subdev_mbus_code_enum *code = arg;
> >  
> > -		if (code->which != V4L2_SUBDEV_FORMAT_TRY &&
> > -		    code->which != V4L2_SUBDEV_FORMAT_ACTIVE)
> > -			return -EINVAL;
> > -
> > -		if (code->pad >= sd->entity.num_pads)
> > -			return -EINVAL;
> > -
> >  		memset(code->reserved, 0, sizeof(code->reserved));
> >  		return v4l2_subdev_call(sd, pad, enum_mbus_code, subdev_fh->pad,
> >  					code);
> > @@ -376,13 +317,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
> >  	case VIDIOC_SUBDEV_ENUM_FRAME_SIZE: {
> >  		struct v4l2_subdev_frame_size_enum *fse = arg;
> >  
> > -		if (fse->which != V4L2_SUBDEV_FORMAT_TRY &&
> > -		    fse->which != V4L2_SUBDEV_FORMAT_ACTIVE)
> > -			return -EINVAL;
> > -
> > -		if (fse->pad >= sd->entity.num_pads)
> > -			return -EINVAL;
> > -
> >  		memset(fse->reserved, 0, sizeof(fse->reserved));
> >  		return v4l2_subdev_call(sd, pad, enum_frame_size, subdev_fh->pad,
> >  					fse);
> > @@ -391,9 +325,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
> >  	case VIDIOC_SUBDEV_G_FRAME_INTERVAL: {
> >  		struct v4l2_subdev_frame_interval *fi = arg;
> >  
> > -		if (fi->pad >= sd->entity.num_pads)
> > -			return -EINVAL;
> > -
> >  		memset(fi->reserved, 0, sizeof(fi->reserved));
> >  		return v4l2_subdev_call(sd, video, g_frame_interval, arg);
> >  	}
> > @@ -401,9 +332,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
> >  	case VIDIOC_SUBDEV_S_FRAME_INTERVAL: {
> >  		struct v4l2_subdev_frame_interval *fi = arg;
> >  
> > -		if (fi->pad >= sd->entity.num_pads)
> > -			return -EINVAL;
> > -
> >  		memset(fi->reserved, 0, sizeof(fi->reserved));
> >  		return v4l2_subdev_call(sd, video, s_frame_interval, arg);
> >  	}
> > @@ -411,13 +339,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
> >  	case VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL: {
> >  		struct v4l2_subdev_frame_interval_enum *fie = arg;
> >  
> > -		if (fie->which != V4L2_SUBDEV_FORMAT_TRY &&
> > -		    fie->which != V4L2_SUBDEV_FORMAT_ACTIVE)
> > -			return -EINVAL;
> > -
> > -		if (fie->pad >= sd->entity.num_pads)
> > -			return -EINVAL;
> > -
> >  		memset(fie->reserved, 0, sizeof(fie->reserved));
> >  		return v4l2_subdev_call(sd, pad, enum_frame_interval, subdev_fh->pad,
> >  					fie);
> > @@ -426,10 +347,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
> >  	case VIDIOC_SUBDEV_G_SELECTION: {
> >  		struct v4l2_subdev_selection *sel = arg;
> >  
> > -		rval = check_selection(sd, sel);
> > -		if (rval)
> > -			return rval;
> > -
> >  		memset(sel->reserved, 0, sizeof(sel->reserved));
> >  		return v4l2_subdev_call(
> >  			sd, pad, get_selection, subdev_fh->pad, sel);
> > @@ -438,10 +355,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
> >  	case VIDIOC_SUBDEV_S_SELECTION: {
> >  		struct v4l2_subdev_selection *sel = arg;
> >  
> > -		rval = check_selection(sd, sel);
> > -		if (rval)
> > -			return rval;
> > -
> >  		memset(sel->reserved, 0, sizeof(sel->reserved));
> >  		return v4l2_subdev_call(
> >  			sd, pad, set_selection, subdev_fh->pad, sel);
> > @@ -450,38 +363,24 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
> >  	case VIDIOC_G_EDID: {
> >  		struct v4l2_subdev_edid *edid = arg;
> >  
> > -		rval = check_edid(sd, edid);
> > -		if (rval)
> > -			return rval;
> > -
> >  		return v4l2_subdev_call(sd, pad, get_edid, edid);
> >  	}
> >  
> >  	case VIDIOC_S_EDID: {
> >  		struct v4l2_subdev_edid *edid = arg;
> >  
> > -		rval = check_edid(sd, edid);
> > -		if (rval)
> > -			return rval;
> > -
> >  		return v4l2_subdev_call(sd, pad, set_edid, edid);
> >  	}
> >  
> >  	case VIDIOC_SUBDEV_DV_TIMINGS_CAP: {
> >  		struct v4l2_dv_timings_cap *cap = arg;
> >  
> > -		if (cap->pad >= sd->entity.num_pads)
> > -			return -EINVAL;
> > -
> >  		return v4l2_subdev_call(sd, pad, dv_timings_cap, cap);
> >  	}
> >  
> >  	case VIDIOC_SUBDEV_ENUM_DV_TIMINGS: {
> >  		struct v4l2_enum_dv_timings *dvt = arg;
> >  
> > -		if (dvt->pad >= sd->entity.num_pads)
> > -			return -EINVAL;
> > -
> >  		return v4l2_subdev_call(sd, pad, enum_dv_timings, dvt);
> >  	}
> >  
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index a7fa5b80915a..a0ad8c6f588b 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -1091,6 +1091,82 @@ void v4l2_subdev_free_pad_config(struct v4l2_subdev_pad_config *cfg);
> >  void v4l2_subdev_init(struct v4l2_subdev *sd,
> >  		      const struct v4l2_subdev_ops *ops);
> >  
> > +#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> > +void *v4l2_subdev_call_va_arg(int n, ...);
> > +
> > +#define v4l2_subdev_call_chk_args(sd, o, f, args...)			\
> > +({									\
> > +	__u32 __which = V4L2_SUBDEV_FORMAT_ACTIVE;			\
> > +	__u32 __pad = 0;						\
> > +	if ((void *)&sd->ops->o == &sd->ops->pad) {			\
> > +		if ((void *)&sd->ops->o->f == &sd->ops->pad->get_fmt ||	\
> > +		    (void *)&sd->ops->o->f == &sd->ops->pad->set_fmt) {	\
> > +			struct v4l2_subdev_format *__fmt;		\
> > +			__fmt = v4l2_subdev_call_va_arg(2, ##args);	\
> > +			__which = __fmt->which;				\
> > +			__pad = __fmt->pad;				\
> > +		} else if ((void *)&sd->ops->o->f ==			\
> > +				   &sd->ops->pad->enum_mbus_code) {	\
> > +			struct v4l2_subdev_mbus_code_enum *__code;	\
> > +			__code = v4l2_subdev_call_va_arg(2, ##args);	\
> > +			__which = __code->which;			\
> > +			__pad = __code->pad;				\
> > +		} else if ((void *)&sd->ops->o->f ==			\
> > +				   &sd->ops->pad->enum_frame_size) {	\
> > +			struct v4l2_subdev_frame_size_enum *__fse;	\
> > +			__fse = v4l2_subdev_call_va_arg(2, ##args);	\
> > +			__which = __fse->which;				\
> > +			__pad = __fse->pad;				\
> > +		} else if ((void *)&sd->ops->o->f ==			\
> > +				   &sd->ops->pad->enum_frame_interval) {\
> > +			struct v4l2_subdev_frame_interval_enum *__fie;	\
> > +			__fie = v4l2_subdev_call_va_arg(2, ##args);	\
> > +			__which = __fie->which;				\
> > +			__pad = __fie->pad;				\
> > +		} else if ((void *)&sd->ops->o->f ==			\
> > +				   &sd->ops->pad->get_selection ||	\
> > +			   (void *)&sd->ops->o->f ==			\
> > +				   &sd->ops->pad->set_selection) {	\
> > +			struct v4l2_subdev_selection *__sel;		\
> > +			__sel = v4l2_subdev_call_va_arg(2, ##args);	\
> > +			__which = __sel->which;				\
> > +			__pad = __sel->pad;				\
> > +		} else if ((void *)&sd->ops->o->f ==			\
> > +				   &sd->ops->pad->get_edid ||		\
> > +			   (void *)&sd->ops->o->f ==			\
> > +				   &sd->ops->pad->set_edid) {		\
> > +			struct v4l2_subdev_edid *__edid;		\
> > +			__edid = v4l2_subdev_call_va_arg(1, ##args);	\
> > +			__pad = __edid->pad;				\
> > +		} else if ((void *)&sd->ops->o->f ==			\
> > +				   &sd->ops->pad->dv_timings_cap) {	\
> > +			struct v4l2_dv_timings_cap *__cap;		\
> > +			__cap = v4l2_subdev_call_va_arg(1, ##args);	\
> > +			__pad = __cap->pad;				\
> > +		} else if ((void *)&sd->ops->o->f ==			\
> > +				   &sd->ops->pad->enum_dv_timings) {	\
> > +			struct v4l2_enum_dv_timings *__dvt;		\
> > +			__dvt = v4l2_subdev_call_va_arg(1, ##args);	\
> > +			__pad = __dvt->pad;				\
> > +		}							\
> > +	} else if ((void *)&sd->ops->o == &sd->ops->video) {		\
> > +		if ((void *)&sd->ops->o->f ==				\
> > +			    &sd->ops->video->g_frame_interval ||	\
> > +		    (void *)&sd->ops->o->f ==				\
> > +			    &sd->ops->video->s_frame_interval) {	\
> > +			struct v4l2_subdev_frame_interval *__fi;	\
> > +			__fi = v4l2_subdev_call_va_arg(1, ##args);	\
> > +			__pad = __fi->pad;				\
> > +		}							\
> > +	}								\
> > +	(__which == V4L2_SUBDEV_FORMAT_ACTIVE ||			\
> > +	 __which == V4L2_SUBDEV_FORMAT_TRY) &&				\
> > +	__pad < (sd->entity.num_pads ? : 1) ? 0 : -EINVAL;		\
> > +})
> > +#else
> > +#define v4l2_subdev_call_chk_args(sd, o, f, args...) 0
> > +#endif
> > +
> >  /**
> >   * v4l2_subdev_call - call an operation of a v4l2_subdev.
> >   *
> > @@ -1112,6 +1188,9 @@ void v4l2_subdev_init(struct v4l2_subdev *sd,
> >  			__result = -ENODEV;				\
> >  		else if (!(__sd->ops->o && __sd->ops->o->f))		\
> >  			__result = -ENOIOCTLCMD;			\
> > +		else if (v4l2_subdev_call_chk_args(sd, o, f, ##args))	\
> > +			__result = v4l2_subdev_call_chk_args(sd, o, f,	\
> > +							     ##args);	\
> >  		else							\
> >  			__result = __sd->ops->o->f(__sd, ##args);	\
> >  		__result;						\
> > 
> 

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
