Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E25A51B3397
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 01:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbgDUXmu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 19:42:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52048 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgDUXmt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 19:42:49 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E9516528;
        Wed, 22 Apr 2020 01:42:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587512567;
        bh=24GSLSwcx7mBs0pvWOGY5eUgfCS4JvoAB/r4rouU9R8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hb8KprDt7MA9HXoQ/fWMElE+CTco+coA7bu7hO0e/3rdM6OeSv8QkH4/QgbDU5qMF
         knOeL5CC7gSzQGIwcAtZG7nELZADDwOftDYLkvp0Xs6KVDt/KeO0i34p6AZjtlnE/X
         Y/qKrnpt5UeAcoxBpXiYUJm2WaDX0UX0sTGYL7i8=
Date:   Wed, 22 Apr 2020 02:42:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, andrey.konovalov@linaro.org,
        Hans Verkuil <hans.verkuil@cisco.com>
Subject: Re: [PATCH v4 4/5] v4l2-subdev: add VIDIOC_SUBDEV_QUERYCAP ioctl
Message-ID: <20200421234232.GI5983@pendragon.ideasonboard.com>
References: <20200418103216.140572-1-jacopo@jmondi.org>
 <20200418103216.140572-5-jacopo@jmondi.org>
 <20200421214958.GD5381@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200421214958.GD5381@paasikivi.fi.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Apr 22, 2020 at 12:49:58AM +0300, Sakari Ailus wrote:
> On Sat, Apr 18, 2020 at 12:32:15PM +0200, Jacopo Mondi wrote:
> > From: Hans Verkuil <hans.verkuil@cisco.com>
> > 
> > While normal video/radio/vbi/swradio nodes have a proper QUERYCAP ioctl
> > that apps can call to determine that it is indeed a V4L2 device, there
> > is currently no equivalent for v4l-subdev nodes. Adding this ioctl will
> > solve that, and it will allow utilities like v4l2-compliance to be used
> > with these devices as well.
> > 
> > SUBDEV_QUERYCAP currently returns the version and subdev_caps of the
> > subdevice. Define as the initial set of subdev_caps the read-only or
> > read/write flags, to signal to userspace which set of IOCTLs are
> > available on the subdevice.
> > 
> > Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 12 ++++++++++++
> >  include/uapi/linux/v4l2-subdev.h      | 15 +++++++++++++++
> >  2 files changed, 27 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 1dc263c2ca0a..ca0aa54429c5 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/types.h>
> >  #include <linux/videodev2.h>
> >  #include <linux/export.h>
> > +#include <linux/version.h>
> >  
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-device.h>
> > @@ -336,6 +337,17 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
> >  	int rval;
> >  
> >  	switch (cmd) {
> > +	case VIDIOC_SUBDEV_QUERYCAP: {
> > +		struct v4l2_subdev_capability *cap = arg;
> > +
> > +		memset(cap, 0, sizeof(*cap));
> > +		cap->version = LINUX_VERSION_CODE;
> > +		cap->subdev_caps |= ro_subdev ? V4L2_SUBDEV_CAP_RO_SUBDEV
> > +					      : V4L2_SUBDEV_CAP_RW_SUBDEV;
> > +
> > +		return 0;
> > +	}
> > +
> >  	case VIDIOC_QUERYCTRL:
> >  		/*
> >  		 * TODO: this really should be folded into v4l2_queryctrl (this
> > diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> > index 03970ce30741..0886f88be193 100644
> > --- a/include/uapi/linux/v4l2-subdev.h
> > +++ b/include/uapi/linux/v4l2-subdev.h
> > @@ -155,9 +155,24 @@ struct v4l2_subdev_selection {
> >  	__u32 reserved[8];
> >  };
> >  
> > +/**
> > + * struct v4l2_subdev_capability - subdev capabilities
> > + * @device_caps: the subdev capabilities, see V4L2_SUBDEV_CAP_*.
> > + */
> > +struct v4l2_subdev_capability {
> > +	__u32 version;
> > +	__u32 subdev_caps;
> 
> No reserved fields? Is the intent to extend this later on based on the size
> of the IOCTL argument?

That would be my preferred option.

> > +};
> > +
> > +/* The v4l2 sub-device video device node is registered in read-only mode. */
> > +#define V4L2_SUBDEV_CAP_RO_SUBDEV		(1 << 0)
> 
> 1U << 0

BIT(0)

> 
> > +/* The v4l2 sub-device video device node is registered in read/write mode. */
> > +#define V4L2_SUBDEV_CAP_RW_SUBDEV		(1 << 1)
> 
> 1U << 1

BIT(1)

> > +
> >  /* Backwards compatibility define --- to be removed */
> >  #define v4l2_subdev_edid v4l2_edid
> >  
> > +#define VIDIOC_SUBDEV_QUERYCAP			_IOR('V',  0, struct v4l2_subdev_capability)
> >  #define VIDIOC_SUBDEV_G_FMT			_IOWR('V',  4, struct v4l2_subdev_format)
> >  #define VIDIOC_SUBDEV_S_FMT			_IOWR('V',  5, struct v4l2_subdev_format)
> >  #define VIDIOC_SUBDEV_G_FRAME_INTERVAL		_IOWR('V', 21, struct v4l2_subdev_frame_interval)

-- 
Regards,

Laurent Pinchart
