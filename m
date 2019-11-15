Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6D3EFE8D5
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2019 00:47:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727324AbfKOXrj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Nov 2019 18:47:39 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39087 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbfKOXrj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Nov 2019 18:47:39 -0500
Received: by mail-lj1-f196.google.com with SMTP id p18so12442820ljc.6
        for <linux-media@vger.kernel.org>; Fri, 15 Nov 2019 15:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=wq0FKKq1atp635bavpnq8g/MSpw7UB4P2UbU/d6xdlQ=;
        b=q+InC5jKMBgxRBl2/8AD4b889ZP6Wh7JtDQCuSYrQaRle8xkTutXbsDch+lCB+Yio4
         7JWYaZ6pHpHAvgQcTM4zS2+hOga2T9sy4wa2NTSggKPMyY9WtsLVm/VtaeBJwDMiy1hm
         wqY9QJYzXwHJtj9y03Z+24itvo7Kt4OWDfGaQBSh1VbfTKVJEqIUau5VjKV/79BL8CmX
         tvLq93lU1kZNFmT3LThTHqcXawwJlS/uIWGACJJjpxJZq0kyCW7UGyjb+OSsG6PVMwYz
         zxXYkxT9DhbCZey6a3I6EQkfcOk0ryiAnrXFqIoH+R7zL0MiH4ddf9K5GYqHWCeTH7zA
         t48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=wq0FKKq1atp635bavpnq8g/MSpw7UB4P2UbU/d6xdlQ=;
        b=YvrfhLxA7/TV47hHcWCW3PIY4toRpRx8gQpUR8pXKmFdWPRwaqATSOIyQqugtXEGUb
         9w/LYMZ18z6gLm1FZpfJUL0M/rU737VltcfP7grDeSJObs6cOr961Pz8gctyZ3JdDesI
         jUzHALCRqZ7puUh9j+m7Hml8qHx4oJY2ARj8gQkuAy7xx72NnDlEJtlsHIhAoSFU6fSN
         vdXfkWw9psdfIgIy66WmZU4ziqVx8BPA9LX4WRP+AyhaPwarE/Gig5Cxdlrmz5lzthmt
         bAG2g8DKAVLC5SVcRa7xsy20hFfYePq+adpYOo5Oep/Mz1HVphYJ6hB90ddv5byF3rqq
         QqLg==
X-Gm-Message-State: APjAAAVHPWlKTSvSJd7eWUfUjjBhaNmQ+BxW2vYdoUhpTZKUF1lXNhWZ
        M9BMBTGyxc2DskG3h1UJCfb2AXu5GiU=
X-Google-Smtp-Source: APXvYqwVVV8Etfej2hjdSVKGprYr/6ZYP5Md0uhs+apSNaF7Q4TpAvQr/NuHmBkmUelvQqntWTQshw==
X-Received: by 2002:a2e:b5b8:: with SMTP id f24mr12594988ljn.188.1573861657009;
        Fri, 15 Nov 2019 15:47:37 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id z3sm5391738lji.36.2019.11.15.15.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 15:47:36 -0800 (PST)
Date:   Sat, 16 Nov 2019 00:47:35 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
Message-ID: <20191115234735.GL7353@bigcity.dyn.berto.se>
References: <20191015143552.317669-1-niklas.soderlund+renesas@ragnatech.se>
 <20191015143552.317669-2-niklas.soderlund+renesas@ragnatech.se>
 <accb1fbe-5358-e8a8-9305-ebe75285d655@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <accb1fbe-5358-e8a8-9305-ebe75285d655@xs4all.nl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for your feedback.

On 2019-10-16 15:56:20 +0200, Hans Verkuil wrote:
> On 10/15/19 4:35 PM, Niklas Söderlund wrote:
> > Add a video device capability flag to indicate that its inputs and/or
> > outputs are controlled by the Media Controller instead of the V4L2 API.
> > When this flag is set, ioctls for get, set and enum inputs and outputs
> > are automatically enabled and programmed to call helper function
> > 
> > Signed-off-by: Helen Koike <helen.koike@collabora.com>
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  .../media/uapi/v4l/vidioc-querycap.rst        |  3 +
> >  .../media/videodev2.h.rst.exceptions          |  1 +
> >  drivers/media/v4l2-core/v4l2-dev.c            | 24 +++--
> >  drivers/media/v4l2-core/v4l2-ioctl.c          | 87 ++++++++++++++++++-
> >  include/uapi/linux/videodev2.h                |  2 +
> >  5 files changed, 107 insertions(+), 10 deletions(-)
> > 
> > diff --git a/Documentation/media/uapi/v4l/vidioc-querycap.rst b/Documentation/media/uapi/v4l/vidioc-querycap.rst
> > index 5f9930195d624c73..8b621ecb906afe96 100644
> > --- a/Documentation/media/uapi/v4l/vidioc-querycap.rst
> > +++ b/Documentation/media/uapi/v4l/vidioc-querycap.rst
> > @@ -264,6 +264,9 @@ specification the ioctl returns an ``EINVAL`` error code.
> >      * - ``V4L2_CAP_TOUCH``
> >        - 0x10000000
> >        - This is a touch device.
> > +    * - ``V4L2_CAP_IO_MC``
> > +      - 0x20000000
> > +      - The inputs and/or outputs of this device are controlled by the Media Controller see :ref:`media_controller`.
> >      * - ``V4L2_CAP_DEVICE_CAPS``
> >        - 0x80000000
> >        - The driver fills the ``device_caps`` field. This capability can
> > diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
> > index b58e381bdf7bd38a..6c78a79fa45de283 100644
> > --- a/Documentation/media/videodev2.h.rst.exceptions
> > +++ b/Documentation/media/videodev2.h.rst.exceptions
> > @@ -173,6 +173,7 @@ replace define V4L2_CAP_STREAMING device-capabilities
> >  replace define V4L2_CAP_META_OUTPUT device-capabilities
> >  replace define V4L2_CAP_DEVICE_CAPS device-capabilities
> >  replace define V4L2_CAP_TOUCH device-capabilities
> > +replace define V4L2_CAP_IO_MC device-capabilities
> >  
> >  # V4L2 pix flags
> >  replace define V4L2_PIX_FMT_PRIV_MAGIC :c:type:`v4l2_pix_format`
> > diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> > index 4037689a945a5330..851e645414600941 100644
> > --- a/drivers/media/v4l2-core/v4l2-dev.c
> > +++ b/drivers/media/v4l2-core/v4l2-dev.c
> > @@ -702,22 +702,34 @@ static void determine_valid_ioctls(struct video_device *vdev)
> >  		SET_VALID_IOCTL(ops, VIDIOC_G_STD, vidioc_g_std);
> >  		if (is_rx) {
> >  			SET_VALID_IOCTL(ops, VIDIOC_QUERYSTD, vidioc_querystd);
> > -			SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
> > -			SET_VALID_IOCTL(ops, VIDIOC_G_INPUT, vidioc_g_input);
> > -			SET_VALID_IOCTL(ops, VIDIOC_S_INPUT, vidioc_s_input);
> >  			SET_VALID_IOCTL(ops, VIDIOC_ENUMAUDIO, vidioc_enumaudio);
> >  			SET_VALID_IOCTL(ops, VIDIOC_G_AUDIO, vidioc_g_audio);
> >  			SET_VALID_IOCTL(ops, VIDIOC_S_AUDIO, vidioc_s_audio);
> >  			SET_VALID_IOCTL(ops, VIDIOC_QUERY_DV_TIMINGS, vidioc_query_dv_timings);
> >  			SET_VALID_IOCTL(ops, VIDIOC_S_EDID, vidioc_s_edid);
> > +			if (vdev->device_caps & V4L2_CAP_IO_MC) {
> > +				set_bit(_IOC_NR(VIDIOC_ENUMINPUT), valid_ioctls);
> > +				set_bit(_IOC_NR(VIDIOC_G_INPUT), valid_ioctls);
> > +				set_bit(_IOC_NR(VIDIOC_S_INPUT), valid_ioctls);
> > +			} else {
> > +				SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
> > +				SET_VALID_IOCTL(ops, VIDIOC_G_INPUT, vidioc_g_input);
> > +				SET_VALID_IOCTL(ops, VIDIOC_S_INPUT, vidioc_s_input);
> > +			}
> >  		}
> >  		if (is_tx) {
> > -			SET_VALID_IOCTL(ops, VIDIOC_ENUMOUTPUT, vidioc_enum_output);
> > -			SET_VALID_IOCTL(ops, VIDIOC_G_OUTPUT, vidioc_g_output);
> > -			SET_VALID_IOCTL(ops, VIDIOC_S_OUTPUT, vidioc_s_output);
> >  			SET_VALID_IOCTL(ops, VIDIOC_ENUMAUDOUT, vidioc_enumaudout);
> >  			SET_VALID_IOCTL(ops, VIDIOC_G_AUDOUT, vidioc_g_audout);
> >  			SET_VALID_IOCTL(ops, VIDIOC_S_AUDOUT, vidioc_s_audout);
> > +			if (vdev->device_caps & V4L2_CAP_IO_MC) {
> > +				set_bit(_IOC_NR(VIDIOC_ENUMOUTPUT), valid_ioctls);
> > +				set_bit(_IOC_NR(VIDIOC_G_OUTPUT), valid_ioctls);
> > +				set_bit(_IOC_NR(VIDIOC_S_OUTPUT), valid_ioctls);
> > +			} else {
> > +				SET_VALID_IOCTL(ops, VIDIOC_ENUMOUTPUT, vidioc_enum_output);
> > +				SET_VALID_IOCTL(ops, VIDIOC_G_OUTPUT, vidioc_g_output);
> > +				SET_VALID_IOCTL(ops, VIDIOC_S_OUTPUT, vidioc_s_output);
> > +			}
> >  		}
> >  		if (ops->vidioc_g_parm || (vdev->vfl_type == VFL_TYPE_GRABBER &&
> >  					ops->vidioc_g_std))
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 51b912743f0f4f6f..e4d2ec4ccd49f65e 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1075,6 +1075,72 @@ static int v4l_querycap(const struct 
> > v4l2_ioctl_ops *ops,
> >  	return ret;
> >  }
> >  
> > +static int v4l2_ioctl_enum_input_mc(struct file *file, void *priv,
> > +				    struct v4l2_input *i)
> > +{
> > +	struct video_device *vfd = video_devdata(file);
> > +
> > +	if (i->index > 0)
> > +		return -EINVAL;
> > +
> > +	memset(i, 0, sizeof(*i));
> > +	strlcpy(i->name, vfd->name, sizeof(i->name));
> > +	i->type = V4L2_INPUT_TYPE_CAMERA;
> 
> Does this...
> 
> > +
> > +	return 0;
> > +}
> > +
> > +static int v4l2_ioctl_enum_output_mc(struct file *file, void *priv,
> > +				     struct v4l2_output *o)
> > +{
> > +	struct video_device *vfd = video_devdata(file);
> > +
> > +	if (o->index > 0)
> > +		return -EINVAL;
> > +
> > +	memset(o, 0, sizeof(*o));
> > +	strlcpy(o->name, vfd->name, sizeof(o->name));
> > +	o->type = V4L2_OUTPUT_TYPE_ANALOG;
> 
> ... and this make sense for devices like this?
> 
> I was wondering if we shouldn't make aliases:
> 
> 	V4L2_INPUT_TYPE_VIDEO = V4L2_INPUT_TYPE_CAMERA,
> 
> and
> 
> 	V4L2_OUTPUT_TYPE_VIDEO = V4L2_OUTPUT_TYPE_ANALOG,
> 
> This wouldn't change the API, but it avoids using these really outdated
> CAMERA/ANALOG words.
> 
> But it is perhaps something for a separate patch.

I like it, but I think it is indeed something for another patch. I made 
a note of this and will get back to this on top of this series, if 
someone don't beat me to it.

> 
> > +
> > +	return 0;
> > +}
> > +
> > +static int v4l2_ioctl_g_input_mc(struct file *file, void *priv, unsigned int *i)
> > +{
> > +	*i = 0;
> > +	return 0;
> > +}
> > +#define v4l2_ioctl_g_output_mc v4l2_ioctl_g_input_mc
> > +
> > +static int v4l2_ioctl_s_input_mc(struct file *file, void *priv, unsigned int i)
> > +{
> > +	return i ? -EINVAL : 0;
> > +}
> 
> These could be exported: it is very common to have just one input or output,
> and many drivers have such trivial implementations.
> 
> Calling it v4l2_ioctl_g/s_single_input and making it available for everyone would
> be nice.
> 
> Alternatively (and perhaps even better?) drivers can just leave ops_vidioc_g/s_in/output
> to NULL and in that case the core assumes that there is just a single input/output.

I really like this idea and will use it in v2.

> 
> > +#define v4l2_ioctl_s_output_mc v4l2_ioctl_s_input_mc
> > +
> > +
> > +static int v4l_g_input(const struct v4l2_ioctl_ops *ops,
> > +		       struct file *file, void *fh, void *arg)
> > +{
> > +	struct video_device *vfd = video_devdata(file);
> > +
> > +	if (vfd->device_caps & V4L2_CAP_IO_MC)
> > +		return v4l2_ioctl_g_input_mc(file, fh, arg);
> > +
> > +	return ops->vidioc_g_input(file, fh, arg);
> > +}
> > +
> > +static int v4l_g_output(const struct v4l2_ioctl_ops *ops,
> > +		       struct file *file, void *fh, void *arg)
> > +{
> > +	struct video_device *vfd = video_devdata(file);
> > +
> > +	if (vfd->device_caps & V4L2_CAP_IO_MC)
> > +		return v4l2_ioctl_g_output_mc(file, fh, arg);
> > +
> > +	return ops->vidioc_g_output(file, fh, arg);
> > +}
> > +
> >  static int v4l_s_input(const struct v4l2_ioctl_ops *ops,
> >  				struct file *file, void *fh, void *arg)
> >  {
> > @@ -1084,12 +1150,21 @@ static int v4l_s_input(const struct v4l2_ioctl_ops *ops,
> >  	ret = v4l_enable_media_source(vfd);
> >  	if (ret)
> >  		return ret;
> > +
> > +	if (vfd->device_caps & V4L2_CAP_IO_MC)
> > +		return v4l2_ioctl_s_input_mc(file, fh, *(unsigned int *)arg);
> > +
> >  	return ops->vidioc_s_input(file, fh, *(unsigned int *)arg);
> >  }
> >  
> >  static int v4l_s_output(const struct v4l2_ioctl_ops *ops,
> >  				struct file *file, void *fh, void *arg)
> >  {
> > +	struct video_device *vfd = video_devdata(file);
> > +
> > +	if (vfd->device_caps & V4L2_CAP_IO_MC)
> > +		return v4l2_ioctl_s_output_mc(file, fh, *(unsigned int *)arg);
> > +
> >  	return ops->vidioc_s_output(file, fh, *(unsigned int *)arg);
> >  }
> >  
> > @@ -1133,6 +1208,9 @@ static int v4l_enuminput(const struct v4l2_ioctl_ops *ops,
> >  	if (is_valid_ioctl(vfd, VIDIOC_S_STD))
> >  		p->capabilities |= V4L2_IN_CAP_STD;
> >  
> > +	if (vfd->device_caps & V4L2_CAP_IO_MC)
> > +		return v4l2_ioctl_enum_input_mc(file, fh, p);
> > +
> >  	return ops->vidioc_enum_input(file, fh, p);
> >  }
> >  
> > @@ -1151,6 +1229,9 @@ static int v4l_enumoutput(const struct v4l2_ioctl_ops *ops,
> >  	if (is_valid_ioctl(vfd, VIDIOC_S_STD))
> >  		p->capabilities |= V4L2_OUT_CAP_STD;
> >  
> > +	if (vfd->device_caps & V4L2_CAP_IO_MC)
> > +		return v4l2_ioctl_enum_output_mc(file, fh, p);
> > +
> >  	return ops->vidioc_enum_output(file, fh, p);
> >  }
> >  
> > @@ -2663,10 +2744,8 @@ DEFINE_V4L_STUB_FUNC(expbuf)
> >  DEFINE_V4L_STUB_FUNC(g_std)
> >  DEFINE_V4L_STUB_FUNC(g_audio)
> >  DEFINE_V4L_STUB_FUNC(s_audio)
> > -DEFINE_V4L_STUB_FUNC(g_input)
> >  DEFINE_V4L_STUB_FUNC(g_edid)
> >  DEFINE_V4L_STUB_FUNC(s_edid)
> > -DEFINE_V4L_STUB_FUNC(g_output)
> >  DEFINE_V4L_STUB_FUNC(g_audout)
> >  DEFINE_V4L_STUB_FUNC(s_audout)
> >  DEFINE_V4L_STUB_FUNC(g_jpegcomp)
> > @@ -2715,11 +2794,11 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
> >  	IOCTL_INFO(VIDIOC_S_AUDIO, v4l_stub_s_audio, v4l_print_audio, INFO_FL_PRIO),
> >  	IOCTL_INFO(VIDIOC_QUERYCTRL, v4l_queryctrl, v4l_print_queryctrl, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_queryctrl, id)),
> >  	IOCTL_INFO(VIDIOC_QUERYMENU, v4l_querymenu, v4l_print_querymenu, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_querymenu, index)),
> > -	IOCTL_INFO(VIDIOC_G_INPUT, v4l_stub_g_input, v4l_print_u32, 0),
> > +	IOCTL_INFO(VIDIOC_G_INPUT, v4l_g_input, v4l_print_u32, 0),
> >  	IOCTL_INFO(VIDIOC_S_INPUT, v4l_s_input, v4l_print_u32, INFO_FL_PRIO),
> >  	IOCTL_INFO(VIDIOC_G_EDID, v4l_stub_g_edid, v4l_print_edid, INFO_FL_ALWAYS_COPY),
> >  	IOCTL_INFO(VIDIOC_S_EDID, v4l_stub_s_edid, v4l_print_edid, INFO_FL_PRIO | INFO_FL_ALWAYS_COPY),
> > -	IOCTL_INFO(VIDIOC_G_OUTPUT, v4l_stub_g_output, v4l_print_u32, 0),
> > +	IOCTL_INFO(VIDIOC_G_OUTPUT, v4l_g_output, v4l_print_u32, 0),
> >  	IOCTL_INFO(VIDIOC_S_OUTPUT, v4l_s_output, v4l_print_u32, INFO_FL_PRIO),
> >  	IOCTL_INFO(VIDIOC_ENUMOUTPUT, v4l_enumoutput, v4l_print_enumoutput, INFO_FL_CLEAR(v4l2_output, index)),
> >  	IOCTL_INFO(VIDIOC_G_AUDOUT, v4l_stub_g_audout, v4l_print_audioout, 0),
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index b3c0961b62a0cba7..8c86f6f5b3d06b26 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -487,6 +487,8 @@ struct v4l2_capability {
> >  
> >  #define V4L2_CAP_TOUCH                  0x10000000  /* Is a touch device */
> >  
> > +#define V4L2_CAP_IO_MC			0x20000000  /* Is input/output controlled by the media controller */
> > +
> >  #define V4L2_CAP_DEVICE_CAPS            0x80000000  /* sets device capabilities field */
> >  
> >  /*
> > 
> 
> Regards,
> 
> 	Hans

-- 
Regards,
Niklas Söderlund
