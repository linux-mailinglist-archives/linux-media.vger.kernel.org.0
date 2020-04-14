Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEB561A7817
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 12:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438127AbgDNKG6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 06:06:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2438121AbgDNKGy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 06:06:54 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 183D0C061A0C
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 03:06:54 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id m8so11832984lji.1
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 03:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=AzSuiQVo3QVAmmqd5jkxqej4F+HvCL25012lHHj7jNY=;
        b=PwFNAfwdkfICyzMdBCqPMciFUcT/uZY97Kni/Xm9VXistXAaa/LU75uq3Six4V/Spl
         0foDkxEfqpLGpMvCPOG4dkMolPiiwCbzOdY880j5dEUlYjy/7JQn4aAV5MIAjbDJ0J3c
         NN5H4sD+IkrQBx6V0NflJ+1DC11qoklAc08//Y+WGDzMbocx1tbI73dWx89Cj0CBWIom
         jRwg0BJ1ckF+njEotJ3ozAHrlV1NtBITmf2/EAMSFUltTDo89QiVVpIxKQw9spiOP7zf
         OwjIQ1W3cjL/vMiT9zeQ/5E9EhjCCL2kNEEHCyIllFP/DHY/7OE5XQ9TEbZYTb7OOr+j
         UsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=AzSuiQVo3QVAmmqd5jkxqej4F+HvCL25012lHHj7jNY=;
        b=kv6CrHD0UfRPuImBcBmB4ln1hlmbvwGrxz2vKzQcNy0aoHXFJq+gaStAFkwV5KeVBP
         BYfA9yWpeS6DcreJapwKqhZuCA0yoMMHZqiGkAIgRnoPjJ3z98z99ZOq+OB3hxYfxYId
         uef/R5CuEt0QhrLblwP3J3XVy9p7nA7iqCKiiwPb7oF1Cxcicq676Z9UHU/8ZN9krIbm
         NBWxyCO8YnPqzu0FXcc79Pz8OH0Zayj0siEKht8Q63M8fvmUcdPbZVhma9zzoAbLRbyy
         LtX9jQAG28hGAkOZWvmZ0lED7RkNryRbnYz9zh4dv7RfOd8OXEkxK5/puGzvQsRV6uc3
         51uw==
X-Gm-Message-State: AGi0PuYRaveM8mslJbyL/q3NeAbaK6a/T4Cn3K8mTIbHVDqVozDNL1g9
        0ywktH/26/V3RbKoL9Eo3vSMeMIFfrE=
X-Google-Smtp-Source: APiQypKj6jVw5tOE0roCFoFW3ozqj02MiSe5ZyZklKWZpAVm2mjObWzlqJfGDvpbhmXzehF3zbg4Ow==
X-Received: by 2002:a2e:6a08:: with SMTP id f8mr925356ljc.8.1586858812475;
        Tue, 14 Apr 2020 03:06:52 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id u8sm8876863ljk.58.2020.04.14.03.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 03:06:51 -0700 (PDT)
Date:   Tue, 14 Apr 2020 12:06:51 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v7 3/6] media: v4l2: Extend VIDIOC_ENUM_FMT to support
 MC-centric devices
Message-ID: <20200414100651.GA265434@oden.dyn.berto.se>
References: <20200413202351.1359754-1-niklas.soderlund+renesas@ragnatech.se>
 <20200413202351.1359754-4-niklas.soderlund+renesas@ragnatech.se>
 <20200414094049.GE19819@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200414094049.GE19819@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 2020-04-14 12:40:49 +0300, Laurent Pinchart wrote:
> Hi Niklas,
> 
> On Mon, Apr 13, 2020 at 10:23:48PM +0200, Niklas Söderlund wrote:
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > The VIDIOC_ENUM_FMT ioctl enumerates all formats supported by a video
> > node. For MC-centric devices, its behaviour has always been ill-defined,
> > with drivers implementing one of the following behaviours:
> > 
> > - No support for VIDIOC_ENUM_FMT at all
> > - Enumerating all formats supported by the video node, regardless of the
> >   configuration of the pipeline
> > - Enumerating formats supported by the video node for the active
> >   configuration of the connected subdevice
> > 
> > The first behaviour is obviously useless for applications. The second
> > behaviour provides the most information, but doesn't offer a way to find
> > what formats are compatible with a given pipeline configuration. The
> > third behaviour fixes that, but with the drawback that applications
> > can't enumerate all supported formats anymore, and have to modify the
> > active configuration of the pipeline to enumerate formats.
> > 
> > The situation is messy as none of the implemented behaviours are ideal,
> > and userspace can't predict what will happen as the behaviour is
> > driver-specific.
> > 
> > To fix this, let's extend the VIDIOC_ENUM_FMT with a missing capability:
> > enumerating pixel formats for a given media bus code. The media bus code
> > is passed through the v4l2_fmtdesc structure in a new mbus_code field
> > (repurposed from the reserved fields). With this capability in place,
> > applications can enumerate pixel formats for a given media bus code
> > without modifying the active configuration of the device.
> > 
> > The current behaviour of the ioctl is preserved when the new mbus_code
> > field is set to 0, ensuring compatibility with existing userspace. The
> > API extension is documented as mandatory for MC-centric devices (as
> > advertised through the V4L2_CAP_IO_MC capability), allowing applications
> > and compliance tools to easily determine the availability of the
> > VIDIOC_ENUM_FMT extension.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Should this carry a tag from you ? :-)

Yes :-)

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> > ---
> >  .../media/uapi/v4l/vidioc-enum-fmt.rst          | 17 ++++++++++++++---
> >  drivers/media/v4l2-core/v4l2-ioctl.c            | 13 +++++++++++--
> >  include/uapi/linux/videodev2.h                  |  3 ++-
> >  3 files changed, 27 insertions(+), 6 deletions(-)
> > 
> > diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> > index 8ca6ab701e4ab99c..82792d8e910b2313 100644
> > --- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> > +++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> > @@ -48,10 +48,21 @@ one until ``EINVAL`` is returned. If applicable, drivers shall return
> >  formats in preference order, where preferred formats are returned before
> >  (that is, with lower ``index`` value) less-preferred formats.
> >  
> > -.. note::
> > +If the driver doesn't advertise the ``V4L2_CAP_IO_MC``
> > +:ref:`device-capabilities <capability>`, applications shall initialize the
> > +``mbus_code`` field to zero. Drivers shall enumerate all image formats supported
> > +by the device. The enumerated formats may depend on the active input or output
> > +of the device.
> >  
> > -   After switching input or output the list of enumerated image
> > -   formats may be different.
> > +If the driver advertises the ``V4L2_CAP_IO_MC`` :ref:`device-capabilities
> > +<capability>`, applications may initialize the ``mbus_code`` to a valid
> > +:ref:`v4l2_mbus_pixelcode <media bus format code>`. If the ``mbus_code` field
> > +is not zero, drivers shall restrict enumeration to only the image formats that
> > +can produce (for video output devices) or be produced from (for video capture
> > +devices) that media bus code. Regardless of the value of the ``mbus_code``
> > +field, the enumerated image formats shall not depend on the active
> > +configuration of the video device or device pipeline. Enumeration shall
> > +otherwise operate as previously described.
> >  
> >  
> >  .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index afd1f427df557f71..3e7b99fa415222c6 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -264,12 +264,13 @@ static void v4l_print_fmtdesc(const void *arg, bool write_only)
> >  {
> >  	const struct v4l2_fmtdesc *p = arg;
> >  
> > -	pr_cont("index=%u, type=%s, flags=0x%x, pixelformat=%c%c%c%c, description='%.*s'\n",
> > +	pr_cont("index=%u, type=%s, flags=0x%x, pixelformat=%c%c%c%c, mbus_code=0x%04x, description='%.*s'\n",
> >  		p->index, prt_names(p->type, v4l2_type_names),
> >  		p->flags, (p->pixelformat & 0xff),
> >  		(p->pixelformat >>  8) & 0xff,
> >  		(p->pixelformat >> 16) & 0xff,
> >  		(p->pixelformat >> 24) & 0xff,
> > +		p->mbus_code,
> >  		(int)sizeof(p->description), p->description);
> >  }
> >  
> > @@ -1472,12 +1473,20 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
> >  	struct video_device *vdev = video_devdata(file);
> >  	struct v4l2_fmtdesc *p = arg;
> >  	int ret = check_fmt(file, p->type);
> > +	u32 mbus_code;
> >  	u32 cap_mask;
> >  
> >  	if (ret)
> >  		return ret;
> >  	ret = -EINVAL;
> >  
> > +	if (p->mbus_code && !(vdev->device_caps & V4L2_CAP_IO_MC))
> > +		return -EINVAL;
> > +
> > +	mbus_code = p->mbus_code;
> > +	CLEAR_AFTER_FIELD(p, type);
> > +	p->mbus_code = mbus_code;
> > +
> >  	switch (p->type) {
> >  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> >  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> > @@ -2757,7 +2766,7 @@ DEFINE_V4L_STUB_FUNC(dv_timings_cap)
> >  
> >  static const struct v4l2_ioctl_info v4l2_ioctls[] = {
> >  	IOCTL_INFO(VIDIOC_QUERYCAP, v4l_querycap, v4l_print_querycap, 0),
> > -	IOCTL_INFO(VIDIOC_ENUM_FMT, v4l_enum_fmt, v4l_print_fmtdesc, INFO_FL_CLEAR(v4l2_fmtdesc, type)),
> > +	IOCTL_INFO(VIDIOC_ENUM_FMT, v4l_enum_fmt, v4l_print_fmtdesc, 0),
> >  	IOCTL_INFO(VIDIOC_G_FMT, v4l_g_fmt, v4l_print_format, 0),
> >  	IOCTL_INFO(VIDIOC_S_FMT, v4l_s_fmt, v4l_print_format, INFO_FL_PRIO),
> >  	IOCTL_INFO(VIDIOC_REQBUFS, v4l_reqbufs, v4l_print_requestbuffers, INFO_FL_PRIO | INFO_FL_QUEUE),
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index b18f3f7cde31c2e4..c3a1cf1c507f5506 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -784,7 +784,8 @@ struct v4l2_fmtdesc {
> >  	__u32               flags;
> >  	__u8		    description[32];   /* Description string */
> >  	__u32		    pixelformat;       /* Format fourcc      */
> > -	__u32		    reserved[4];
> > +	__u32		    mbus_code;		/* Media bus code    */
> > +	__u32		    reserved[3];
> >  };
> >  
> >  #define V4L2_FMT_FLAG_COMPRESSED		0x0001
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Regards,
Niklas Söderlund
