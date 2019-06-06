Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5A08375CA
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 15:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728010AbfFFN4q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 09:56:46 -0400
Received: from mga14.intel.com ([192.55.52.115]:23719 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726693AbfFFN4q (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jun 2019 09:56:46 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Jun 2019 06:56:46 -0700
X-ExtLoop1: 1
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006.jf.intel.com with ESMTP; 06 Jun 2019 06:56:44 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id F3568208DD; Thu,  6 Jun 2019 16:56:42 +0300 (EEST)
Date:   Thu, 6 Jun 2019 16:56:42 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        m.felsch@pengutronix.de
Subject: Re: [RFC 1/1] v4l2-subdev: Rework subdev format and selection macros
 to work without MC
Message-ID: <20190606135642.2fctrsymqmuxsxol@paasikivi.fi.intel.com>
References: <20190604175731.20596-1-sakari.ailus@linux.intel.com>
 <1846727.Tl316bQTBL@z50>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1846727.Tl316bQTBL@z50>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Janusz,

On Wed, Jun 05, 2019 at 09:33:41PM +0200, Janusz Krzysztofik wrote:
> Hi Sakari,
> 
> On Tuesday, June 4, 2019 7:57:31 PM CEST Sakari Ailus wrote:
> > Rework the macros for accessing subdev try formats to work meaningfully
> > and relatively safely without V4L2 sub-device uAPI (and without MC). This
> > is done by simply reverting to accessing the pad number zero if
> > CONFIG_VIDEO_V4L2_SUBDEV_API isn't enabled, and emitting a kernel warning
> > if the pad is non-zero in that case.
> > 
> > The functions are seen useful if subdev uAPI is disabled for drivers that
> > can work without the Kconfig option but benefit from the option if it's
> > enabled.
> 
> I'm not sure which drivers you (we) consider valid users of those functions.  
> Subdevice drivers only? Or other drivers which interact with subdevices as 
> well?  An answer to that question determines my possible other comments.

These functions are only by drivers for the devices they control directly
only.

> 
> Thanks,
> Janusz
> 
> > As a by-product, the patch simplifies individual inline functions by
> > removing two lines of code from each of them and moving the functionality
> > to a common macro.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > Hi guys,
> > 
> > This might not be pretty but should provide some comfort for drivers
> > working with different Kconfig options. Comments are welcome...
> > 
> >  include/media/v4l2-subdev.h | 24 ++++++++++++++----------
> >  1 file changed, 14 insertions(+), 10 deletions(-)
> > 
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index e1e3c18c3fd6..3328f302326b 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -930,6 +930,17 @@ struct v4l2_subdev_fh {
> >  	container_of(fh, struct v4l2_subdev_fh, vfh)
> >  
> >  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> > +#define __v4l2_subdev_get_try_field(__sd, __cfg, __pad, __field)	\
> > +	(WARN_ON(!(__cfg)) ? NULL :		\
> > +	 ((__sd)->entity.graph_obj.mdev ?				
> \
> > +	  (WARN_ON((__pad) >= (__sd)->entity.num_pads) ?		\
> > +	   NULL : &(__cfg)[__pad].__field) :				
> \
> > +	  &(__cfg)[WARN_ON(__pad) && 0].__field))
> > +#else /* CONFIG_VIDEO_V4L2_SUBDEV_API */
> > +#define __v4l2_subdev_get_try_field(__sd, __cfg, __pad, __field)	\
> > +	(WARN_ON(!(__cfg)) ? NULL :				
> 	\
> > +	 &(__cfg)[WARN_ON(__pad) && 0].__field)
> > +#endif /* !CONFIG_VIDEO_V4L2_SUBDEV_API */
> >  
> >  /**
> >   * v4l2_subdev_get_try_format - ancillary routine to call
> > @@ -944,9 +955,7 @@ static inline struct v4l2_mbus_framefmt
> >  			    struct v4l2_subdev_pad_config *cfg,
> >  			    unsigned int pad)
> >  {
> > -	if (WARN_ON(pad >= sd->entity.num_pads))
> > -		pad = 0;
> > -	return &cfg[pad].try_fmt;
> > +	return __v4l2_subdev_get_try_field(sd, cfg, pad, try_fmt);
> >  }
> >  
> >  /**
> > @@ -962,9 +971,7 @@ static inline struct v4l2_rect
> >  			  struct v4l2_subdev_pad_config *cfg,
> >  			  unsigned int pad)
> >  {
> > -	if (WARN_ON(pad >= sd->entity.num_pads))
> > -		pad = 0;
> > -	return &cfg[pad].try_crop;
> > +	return __v4l2_subdev_get_try_field(sd, cfg, pad, try_crop);
> >  }
> >  
> >  /**
> > @@ -980,11 +987,8 @@ static inline struct v4l2_rect
> >  			     struct v4l2_subdev_pad_config *cfg,
> >  			     unsigned int pad)
> >  {
> > -	if (WARN_ON(pad >= sd->entity.num_pads))
> > -		pad = 0;
> > -	return &cfg[pad].try_compose;
> > +	return __v4l2_subdev_get_try_field(sd, cfg, pad, try_compose);
> >  }
> > -#endif
> >  
> >  extern const struct v4l2_file_operations v4l2_subdev_fops;
> >  
> > 
> 
> 
> 
> 

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
