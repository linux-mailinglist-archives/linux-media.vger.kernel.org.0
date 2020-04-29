Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ACFA1BDA31
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 13:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgD2LAH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 07:00:07 -0400
Received: from mga01.intel.com ([192.55.52.88]:26013 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726426AbgD2LAH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 07:00:07 -0400
IronPort-SDR: P7ldT9/qeSGEnTnKOeMRAAPY1ueXaDLFJPVb+bNebTABH7qOTj66IDyuloYskYv2f98nkoXgyZ
 MJtqatGFNZuA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 04:00:07 -0700
IronPort-SDR: 0d1/HVOJClYNeyj6JTmEp2xuWS76tsilnSrhnRkXiSGrdC0ZBQ3vVYtgZa1Ly7iMPhJELku0b8
 7Ms+15A1d6eA==
X-IronPort-AV: E=Sophos;i="5.73,331,1583222400"; 
   d="scan'208";a="405006917"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 04:00:05 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id B2391202AE; Wed, 29 Apr 2020 14:00:02 +0300 (EEST)
Date:   Wed, 29 Apr 2020 14:00:02 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        andrey.konovalov@linaro.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v5.1] media: v4l2-subdev: Guard whole fops and ioctl hdlr
Message-ID: <20200429110002.GE9190@paasikivi.fi.intel.com>
References: <20200428210609.6793-5-jacopo@jmondi.org>
 <20200429085855.186273-1-jacopo@jmondi.org>
 <20200429094949.GD9190@paasikivi.fi.intel.com>
 <20200429101600.pkw3i5igq5lla5ev@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429101600.pkw3i5igq5lla5ev@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 29, 2020 at 12:16:00PM +0200, Jacopo Mondi wrote:
> Hi Sakari,
> 
> On Wed, Apr 29, 2020 at 12:49:49PM +0300, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > Thanks for the update.
> >
> > On Wed, Apr 29, 2020 at 10:58:55AM +0200, Jacopo Mondi wrote:
> > > A sub-device device node can be registered in user space only if the
> > > CONFIG_V4L2_SUBDEV_API Kconfig option is selected. Currently the
> > > open/close file operations and the ioctl handler have some parts of their
> > > implementations guarded by #if defined(CONFIG_V4L2_SUBDEV_API), while
> > > they are actually not accessible without a video device node registered
> > > to user space.
> > >
> > > Guard the whole open, close and ioctl handler and provide stubs if the
> > > V4L2_SUBDEV_API Kconfig option is not selected.
> > >
> > > This slightly reduces the kernel size when the option is not selected
> > > and simplifies the file ops and ioctl implementations.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > > A different approach compared to v5, which was anyway buggy and not a proper
> > > solution.
> > >
> > > Sending out for comments, while waiting for consensus on v5 [5/6] (reserved
> > > space in the ioctl argument vs versioning based on structure size)
> > >
> > > Compile tested with and without V4L2_SUBDEV_API Kconfig option enabled and
> > > with drivers that depends on it built-in or as modules.
> > >
> > > ---
> > >  drivers/media/v4l2-core/v4l2-subdev.c | 39 +++++++++++++++++++++------
> > >  1 file changed, 31 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > index 1dc263c2ca0a..6fef52880c99 100644
> > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > @@ -22,24 +22,22 @@
> > >  #include <media/v4l2-fh.h>
> > >  #include <media/v4l2-event.h>
> > >
> > > +#if defined(CONFIG_V4L2_SUBDEV_API)
> > >  static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
> > >  {
> > > -#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> > >  	if (sd->entity.num_pads) {
> > >  		fh->pad = v4l2_subdev_alloc_pad_config(sd);
> > >  		if (fh->pad == NULL)
> > >  			return -ENOMEM;
> > >  	}
> > > -#endif
> > > +
> > >  	return 0;
> > >  }
> > >
> > >  static void subdev_fh_free(struct v4l2_subdev_fh *fh)
> > >  {
> > > -#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> > >  	v4l2_subdev_free_pad_config(fh->pad);
> > >  	fh->pad = NULL;
> > > -#endif
> > >  }
> > >
> > >  static int subdev_open(struct file *file)
> > > @@ -111,6 +109,17 @@ static int subdev_close(struct file *file)
> > >
> > >  	return 0;
> > >  }
> > > +#else /* CONFIG_V4L2_SUBDEV_API */
> > > +static int subdev_open(struct file *file)
> > > +{
> > > +	return 0;
> >
> > Perhaps:
> >
> > return -ENODEV;
> >
> > And I'd use inline functions in the header.

Um, as they're only used here, they indeed should remain here, not in
the header. I missed that while commenting.

> 
> There is no way this functions gets called if no device node is
> registered to userspace, I think. These are only here to please the
> compiler. Am I mistaken ?

The fops struct is still there. It shouldn't be called, no, but if that
happens, then providing the right return value is helpful.

> 
> Also, these function are not exported by any headers, but only the
> file_operations structure that contains them is:
> 
> include/media/v4l2-subdev.h
>         extern const struct v4l2_file_operations v4l2_subdev_fops;

Right, agreed.

-- 
Regards,

Sakari Ailus
