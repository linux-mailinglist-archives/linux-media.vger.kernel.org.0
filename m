Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23CB518F25F
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 11:07:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbgCWKHk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 06:07:40 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43644 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727788AbgCWKHk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 06:07:40 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41DB2308;
        Mon, 23 Mar 2020 11:07:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584958057;
        bh=fWJlKDyP773jm9IT+4RlkxQybpLpeZI58xgB096yzwc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mQbGTsWM4OYs7pxNq3TXirM9Mjk00oiU67Ns43C3O8Fc2MmsEZbI/mNw6zCeRpx7q
         XlpMJSvzzKMNnPAQJAlf6aWR6JrXrRAwghg8Q1OCEKPh+jMrGCqUmjOsCpL7tz2j5g
         lX11ZejPS6Kr8JZaa5Qz8D/NMKimvhB0U0K9GErM=
Date:   Mon, 23 Mar 2020 12:07:27 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v6 2/5] media: v4l2: Extend VIDIOC_ENUM_FMT to support
 MC-centric devices
Message-ID: <20200323100727.GA4768@pendragon.ideasonboard.com>
References: <20200319004701.30416-1-laurent.pinchart@ideasonboard.com>
 <20200319004701.30416-3-laurent.pinchart@ideasonboard.com>
 <20200323100328.GA20664@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200323100328.GA20664@kekkonen.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Mon, Mar 23, 2020 at 12:03:28PM +0200, Sakari Ailus wrote:
> On Thu, Mar 19, 2020 at 02:46:58AM +0200, Laurent Pinchart wrote:
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
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> I'd address setting the reserved fields explicitly in a separate patch,
> simply by removing them. As another field in the struct is assigned, the
> memory is zeroed and explicit assignment is redundant.

I'm not sure to follow you, what code are you referring to ?

> > ---
> >  .../media/uapi/v4l/vidioc-enum-fmt.rst        | 19 +++++++++++++++----
> >  drivers/media/v4l2-core/v4l2-ioctl.c          | 13 +++++++++++--
> >  include/uapi/linux/videodev2.h                |  3 ++-
> >  3 files changed, 28 insertions(+), 7 deletions(-)
> > 
> > diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> > index 8ca6ab701e4a..82792d8e910b 100644
> > --- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> > +++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> > @@ -48,10 +48,21 @@ one until ``EINVAL`` is returned. If applicable, drivers shall return
> >  formats in preference order, where preferred formats are returned before
> >  (that is, with lower ``index`` value) less-preferred formats.
> >  
> > -.. note::
> > -
> > -   After switching input or output the list of enumerated image
> > -   formats may be different.
> > +If the driver doesn't advertise the ``V4L2_CAP_IO_MC``
> > +:ref:`device-capabilities <capability>`, applications shall initialize the
> > +``mbus_code`` field to zero. Drivers shall enumerate all image formats supported
> > +by the device. The enumerated formats may depend on the active input or output
> > +of the device.
> > +
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
> > index 3545a8adf844..b55603964abd 100644
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
> > @@ -1467,12 +1468,20 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
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
> > @@ -2752,7 +2761,7 @@ DEFINE_V4L_STUB_FUNC(dv_timings_cap)
> >  
> >  static const struct v4l2_ioctl_info v4l2_ioctls[] = {
> >  	IOCTL_INFO(VIDIOC_QUERYCAP, v4l_querycap, v4l_print_querycap, 0),
> > -	IOCTL_INFO(VIDIOC_ENUM_FMT, v4l_enum_fmt, v4l_print_fmtdesc, INFO_FL_CLEAR(v4l2_fmtdesc, type)),
> > +	IOCTL_INFO(VIDIOC_ENUM_FMT, v4l_enum_fmt, v4l_print_fmtdesc, 0),
> >  	IOCTL_INFO(VIDIOC_G_FMT, v4l_g_fmt, v4l_print_format, 0),
> >  	IOCTL_INFO(VIDIOC_S_FMT, v4l_s_fmt, v4l_print_format, INFO_FL_PRIO),
> >  	IOCTL_INFO(VIDIOC_REQBUFS, v4l_reqbufs, v4l_print_requestbuffers, INFO_FL_PRIO | INFO_FL_QUEUE),
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index c793263a3705..0ece960844a5 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -779,7 +779,8 @@ struct v4l2_fmtdesc {
> >  	__u32               flags;
> >  	__u8		    description[32];   /* Description string */
> >  	__u32		    pixelformat;       /* Format fourcc      */
> > -	__u32		    reserved[4];
> > +	__u32		    mbus_code;		/* Media bus code    */
> > +	__u32		    reserved[3];
> >  };
> >  
> >  #define V4L2_FMT_FLAG_COMPRESSED		0x0001

-- 
Regards,

Laurent Pinchart
