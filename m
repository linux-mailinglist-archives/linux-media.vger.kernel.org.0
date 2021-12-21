Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56EF147C5C5
	for <lists+linux-media@lfdr.de>; Tue, 21 Dec 2021 19:07:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240927AbhLUSHh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Dec 2021 13:07:37 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41208 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240898AbhLUSHf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Dec 2021 13:07:35 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B121881;
        Tue, 21 Dec 2021 19:07:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1640110053;
        bh=/EAbN7PvJY0uxVeHPALlIpyBAdVWKv8cVpzdpx6vnX4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h7JVj6IziYONALoz69FYZBFNjkiSvrYuztwN4GddEQiRkQpi/w0UvLvP9oxQ/itZp
         EAPTWsbppyDUW0hHGp+Zxb4GPtkhu4PWVz9MJec+D3JoaP8Vhz/cjcaWmgr0JisOtz
         N/0vHhC5bTKC96tjzCzTJ67oRqG66ODKb9/rW8+c=
Date:   Tue, 21 Dec 2021 20:07:30 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v10 26/38] media: add V4L2_SUBDEV_CAP_MPLEXED
Message-ID: <YcIX4vqG1i79CX07@pendragon.ideasonboard.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
 <20211130141536.891878-27-tomi.valkeinen@ideasonboard.com>
 <20211214083950.yfp6ss6hdsjejtla@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211214083950.yfp6ss6hdsjejtla@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 14, 2021 at 09:39:50AM +0100, Jacopo Mondi wrote:
> On Tue, Nov 30, 2021 at 04:15:24PM +0200, Tomi Valkeinen wrote:
> > Add a subdev capability flag to expose to userspace if a subdev supports
> > multiplexed streams.
> >
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 4 +++-
> >  include/uapi/linux/v4l2-subdev.h      | 3 +++
> >  2 files changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 2053fe1cd67d..721148e35624 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -419,7 +419,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
> >
> >  		memset(cap->reserved, 0, sizeof(cap->reserved));
> >  		cap->version = LINUX_VERSION_CODE;
> > -		cap->capabilities = ro_subdev ? V4L2_SUBDEV_CAP_RO_SUBDEV : 0;
> > +		cap->capabilities =
> > +			(ro_subdev ? V4L2_SUBDEV_CAP_RO_SUBDEV : 0) |
> > +			((sd->flags & V4L2_SUBDEV_FL_MULTIPLEXED) ? V4L2_SUBDEV_CAP_MPLEXED : 0);
> 
> I had been suggested to go for:
> 
> 	bool ro_subdev = test_bit(V4L2_FL_SUBDEV_RO_DEVNODE, &vdev->flags);
> 
> when introducing V4L2_SUBDEV_CAP_RO_SUBDEV.
> 
> To me it doesn't make much difference
> 
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> >
> >  		return 0;
> >  	}
> > diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> > index 658106f5b5dc..d91ab6f22fa7 100644
> > --- a/include/uapi/linux/v4l2-subdev.h
> > +++ b/include/uapi/linux/v4l2-subdev.h
> > @@ -188,6 +188,9 @@ struct v4l2_subdev_capability {
> >  /* The v4l2 sub-device video device node is registered in read-only mode. */
> >  #define V4L2_SUBDEV_CAP_RO_SUBDEV		0x00000001
> >
> > +/* The v4l2 sub-device supports multiplexed streams. */
> > +#define V4L2_SUBDEV_CAP_MPLEXED			0x00000002

We have V4L2_SUBDEV_FL_MULTIPLEXED vs. V4L2_SUBDEV_CAP_MPLEXED, can we
try to standardize naming ? V4L2 is notoriously bad in this area
(VIDIOC_ENUM_FMT vs. VIDIOC_ENUMSTD, v4l2_fmtdesc vs. v4l2_format, ...).
It would be nice to avoid repeating the same mistakes all the time, my
OCD is suffering :-( (and this also really hinders development, when one
has to always remember which abbreviation has been used in a given
context).

> > +
> >  /* Backwards compatibility define --- to be removed */
> >  #define v4l2_subdev_edid v4l2_edid
> >

-- 
Regards,

Laurent Pinchart
