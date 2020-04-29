Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43C241BD6CB
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 10:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgD2IGn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 04:06:43 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:54083 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbgD2IGm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 04:06:42 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id B858BFF805;
        Wed, 29 Apr 2020 08:06:38 +0000 (UTC)
Date:   Wed, 29 Apr 2020 10:09:49 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        andrey.konovalov@linaro.org, laurent.pinchart@ideasonboard.com,
        Hans Verkuil <hans.verkuil@cisco.com>
Subject: Re: [PATCH v5 5/6] v4l2-subdev: add VIDIOC_SUBDEV_QUERYCAP ioctl
Message-ID: <20200429080949.walimwkrth3ixn2o@uno.localdomain>
References: <20200428210609.6793-1-jacopo@jmondi.org>
 <20200428210609.6793-6-jacopo@jmondi.org>
 <20200428212858.GC5381@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200428212858.GC5381@paasikivi.fi.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Apr 29, 2020 at 12:28:58AM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Tue, Apr 28, 2020 at 11:06:08PM +0200, Jacopo Mondi wrote:
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
> > index f3fe515b8ccb..b8c0071aa4d0 100644
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
> > @@ -331,6 +332,17 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
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
> > index 03970ce30741..89dc8f2ba6b3 100644
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
> How do you intend to address additional fields being added to the struct in
> the future? Something else than what's been done in V4L2 traditionally?
>

I'm not sure I get what you mean here, so I assume I don't know what
"has been done in V4L2 traditionally" and why what I have here goes
against it...
