Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3491B3807
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 08:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbgDVGyp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 02:54:45 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:55955 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725786AbgDVGyp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 02:54:45 -0400
X-Originating-IP: 87.3.55.240
Received: from uno.localdomain (host240-55-dynamic.3-87-r.retail.telecomitalia.it [87.3.55.240])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 084E41BF204;
        Wed, 22 Apr 2020 06:54:38 +0000 (UTC)
Date:   Wed, 22 Apr 2020 08:57:46 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        andrey.konovalov@linaro.org, Hans Verkuil <hans.verkuil@cisco.com>
Subject: Re: [PATCH v4 4/5] v4l2-subdev: add VIDIOC_SUBDEV_QUERYCAP ioctl
Message-ID: <20200422065746.wuaiv3tr7eqe6pwv@uno.localdomain>
References: <20200418103216.140572-1-jacopo@jmondi.org>
 <20200418103216.140572-5-jacopo@jmondi.org>
 <20200421214958.GD5381@paasikivi.fi.intel.com>
 <20200421234232.GI5983@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200421234232.GI5983@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Apr 22, 2020 at 02:42:32AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
>
> On Wed, Apr 22, 2020 at 12:49:58AM +0300, Sakari Ailus wrote:
> > On Sat, Apr 18, 2020 at 12:32:15PM +0200, Jacopo Mondi wrote:
> > > From: Hans Verkuil <hans.verkuil@cisco.com>
> > >
> > > While normal video/radio/vbi/swradio nodes have a proper QUERYCAP ioctl
> > > that apps can call to determine that it is indeed a V4L2 device, there
> > > is currently no equivalent for v4l-subdev nodes. Adding this ioctl will
> > > solve that, and it will allow utilities like v4l2-compliance to be used
> > > with these devices as well.
> > >
> > > SUBDEV_QUERYCAP currently returns the version and subdev_caps of the
> > > subdevice. Define as the initial set of subdev_caps the read-only or
> > > read/write flags, to signal to userspace which set of IOCTLs are
> > > available on the subdevice.
> > >
> > > Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-subdev.c | 12 ++++++++++++
> > >  include/uapi/linux/v4l2-subdev.h      | 15 +++++++++++++++
> > >  2 files changed, 27 insertions(+)
> > >
> > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > index 1dc263c2ca0a..ca0aa54429c5 100644
> > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > @@ -15,6 +15,7 @@
> > >  #include <linux/types.h>
> > >  #include <linux/videodev2.h>
> > >  #include <linux/export.h>
> > > +#include <linux/version.h>
> > >
> > >  #include <media/v4l2-ctrls.h>
> > >  #include <media/v4l2-device.h>
> > > @@ -336,6 +337,17 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
> > >  	int rval;
> > >
> > >  	switch (cmd) {
> > > +	case VIDIOC_SUBDEV_QUERYCAP: {
> > > +		struct v4l2_subdev_capability *cap = arg;
> > > +
> > > +		memset(cap, 0, sizeof(*cap));
> > > +		cap->version = LINUX_VERSION_CODE;
> > > +		cap->subdev_caps |= ro_subdev ? V4L2_SUBDEV_CAP_RO_SUBDEV
> > > +					      : V4L2_SUBDEV_CAP_RW_SUBDEV;
> > > +
> > > +		return 0;
> > > +	}
> > > +
> > >  	case VIDIOC_QUERYCTRL:
> > >  		/*
> > >  		 * TODO: this really should be folded into v4l2_queryctrl (this
> > > diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> > > index 03970ce30741..0886f88be193 100644
> > > --- a/include/uapi/linux/v4l2-subdev.h
> > > +++ b/include/uapi/linux/v4l2-subdev.h
> > > @@ -155,9 +155,24 @@ struct v4l2_subdev_selection {
> > >  	__u32 reserved[8];
> > >  };
> > >
> > > +/**
> > > + * struct v4l2_subdev_capability - subdev capabilities
> > > + * @device_caps: the subdev capabilities, see V4L2_SUBDEV_CAP_*.
> > > + */
> > > +struct v4l2_subdev_capability {
> > > +	__u32 version;
> > > +	__u32 subdev_caps;
> >
> > No reserved fields? Is the intent to extend this later on based on the size
> > of the IOCTL argument?
>
> That would be my preferred option.
>

That would be my preferred opinion as well, we would have versioning
and would not be tied to the available reserved fields.
