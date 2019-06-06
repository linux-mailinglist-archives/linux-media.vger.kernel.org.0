Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A127237BF4
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 20:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729329AbfFFSNl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 14:13:41 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37879 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727559AbfFFSNl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 14:13:41 -0400
Received: by mail-lf1-f68.google.com with SMTP id m15so857516lfh.4
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2019 11:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ggnefm8GoTx16T2yX6WclEh14K1emJeBB1AZ2q7flTg=;
        b=YNbG/OQQVerH3mFBIhKeKoyY3B+QPP6WnWu05cy4ptZIf5o9VlveX1fCM1lVajoSMj
         GEjomoMBSff2vWpYJeuTInzS0QdP4938/5p7z4koPH9Ya3C5JwRjkbvjS8aiRFrsEeUH
         pFul3g38rO6srAZh7gjmcACznvVH3d57x1nkrFrf1VfxAG8rpBAE9PrH8TOCYvAnI53x
         To0vpDgq23p2xrZ9soLRKGW0gbgeYNRN8cdstjt6skpRkqGcfCZr5AUjhU90mXLt+ihj
         pY7V1D/4YKd4ofDd+j9qj6fpmCWHhvFa2cAIsD3rmahZFkXIzUf0JYfO1msKkUrSl/+Z
         opZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ggnefm8GoTx16T2yX6WclEh14K1emJeBB1AZ2q7flTg=;
        b=cpQ8555L1SDl/hvodwX+462/6FencHcadVFf/8voen8azGcdKI8ZB5v08a8q01YtxL
         qNSChFcbwiqquJ1LyFPxTSbLQO1/vNpFvHKCGijQKKfBcXpUz0B6Y90cdzgG/FLlzvqI
         AB6lUqa5FhWocQFwUjW9JjKmWWB0FZjcBkt8hWLNwMZ5by++NsAIYhNKoMdENynXJct9
         CWoX57sQt7Dp6pg1WhniuWH5UC6TxlRhHzetwMmo1ZIymZQlsbrdHYbOePpE6SMTXSN/
         LS+E62ZhHpURvkLExxjUMS+6ZpeQXNJQq7nI7V+o40N3V9WYzg8DL2HXYgf7xLy6psw7
         1JKA==
X-Gm-Message-State: APjAAAVXCppJu1bR5QQskE1dPia6uqb/tCwLCXfNS9MUIcx1qejnm+zj
        sYUds5YXiKS4KkjdCtpm1dE=
X-Google-Smtp-Source: APXvYqy+lfXQGuZHNaGZ65ENpm5iYDdAONU9LkZZXLxbDXE2/lsoxhkBV6JCzA9gq0CiuTdDbR0O8g==
X-Received: by 2002:ac2:4d17:: with SMTP id r23mr18573445lfi.130.1559844818747;
        Thu, 06 Jun 2019 11:13:38 -0700 (PDT)
Received: from z50.localnet (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id j7sm520238lji.27.2019.06.06.11.13.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 11:13:37 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        m.felsch@pengutronix.de
Subject: Re: [RFC 1/1] v4l2-subdev: Rework subdev format and selection macros to work without MC
Date:   Thu, 06 Jun 2019 20:13:36 +0200
Message-ID: <60014338.tBqkIJZrQe@z50>
In-Reply-To: <20190606135642.2fctrsymqmuxsxol@paasikivi.fi.intel.com>
References: <20190604175731.20596-1-sakari.ailus@linux.intel.com> <1846727.Tl316bQTBL@z50> <20190606135642.2fctrsymqmuxsxol@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thursday, June 6, 2019 3:56:42 PM CEST Sakari Ailus wrote:
> Hi Janusz,
> 
> On Wed, Jun 05, 2019 at 09:33:41PM +0200, Janusz Krzysztofik wrote:
> > Hi Sakari,
> > 
> > On Tuesday, June 4, 2019 7:57:31 PM CEST Sakari Ailus wrote:
> > > Rework the macros for accessing subdev try formats to work meaningfully
> > > and relatively safely without V4L2 sub-device uAPI (and without MC). This
> > > is done by simply reverting to accessing the pad number zero if
> > > CONFIG_VIDEO_V4L2_SUBDEV_API isn't enabled, and emitting a kernel warning
> > > if the pad is non-zero in that case.
> > > 
> > > The functions are seen useful if subdev uAPI is disabled for drivers that
> > > can work without the Kconfig option but benefit from the option if it's
> > > enabled.
> > 
> > I'm not sure which drivers you (we) consider valid users of those functions.  
> > Subdevice drivers only? Or other drivers which interact with subdevices as 
> > well?  An answer to that question determines my possible other comments.
> 
> These functions are only by drivers for the devices they control directly
> only.

That's what I expected.

Exposing those functions to drivers not supporting V4L2 subdev uAPI is 
not a bad idea but it would make more sense to me if we also updated potential 
users.  Otherwise I just don't believe anyone will care for as long as a 
driver is not refreshed to support MC and V4L2 subdev uAPI.

> > ...
> > > As a by-product, the patch simplifies individual inline functions by
> > > removing two lines of code from each of them and moving the functionality
> > > to a common macro.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > > Hi guys,
> > > 
> > > This might not be pretty but should provide some comfort for drivers
> > > working with different Kconfig options. Comments are welcome...
> > > 
> > >  include/media/v4l2-subdev.h | 24 ++++++++++++++----------
> > >  1 file changed, 14 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > > index e1e3c18c3fd6..3328f302326b 100644
> > > --- a/include/media/v4l2-subdev.h
> > > +++ b/include/media/v4l2-subdev.h
> > > @@ -930,6 +930,17 @@ struct v4l2_subdev_fh {
> > >  	container_of(fh, struct v4l2_subdev_fh, vfh)
> > >  
> > >  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> > > +#define __v4l2_subdev_get_try_field(__sd, __cfg, __pad, __field)	\
> > > +	(WARN_ON(!(__cfg)) ? NULL :		\
> > > +	 ((__sd)->entity.graph_obj.mdev ?				
> > \strange
> > > +	  (WARN_ON((__pad) >= (__sd)->entity.num_pads) ?		\
> > > +	   NULL : &(__cfg)[__pad].__field) :				
> > \
> > > +	  &(__cfg)[WARN_ON(__pad) && 0].__field))
> > > +#else /* CONFIG_VIDEO_V4L2_SUBDEV_API */
> > > +#define __v4l2_subdev_get_try_field(__sd, __cfg, __pad, __field)	\
> > > +	(WARN_ON(!(__cfg)) ? NULL :				
> > 	\
> > > +	 &(__cfg)[WARN_ON(__pad) && 0].__field)
> > > +#endif /* !CONFIG_VIDEO_V4L2_SUBDEV_API */

I think that as long as we already have in place the same checks performed by 
v4l2_subdev_call() which seems the only user entry point to a subdevice 
driver, invalid cfg or pad values you are trying to catch here will never be 
passed unless the driver performs unusual operations and, moreover, is 
internally broken.

> > >  
> > >  /**
> > >   * v4l2_subdev_get_try_format - ancillary routine to call
> > > @@ -944,9 +955,7 @@ static inline struct v4l2_mbus_framefmt
> > >  			    struct v4l2_subdev_pad_config *cfg,
> > >  			    unsigned int pad)
> > >  {
> > > -	if (WARN_ON(pad >= sd->entity.num_pads))
> > > -		pad = 0;

Dropping this check from here and below makes sense to me anyway, for the same 
reason as explained above.

> > > -	return &cfg[pad].try_fmt;
> > > +	return __v4l2_subdev_get_try_field(sd, cfg, pad, try_fmt);

If we agree that correctness of cfg and pad has already been verified, this 
change and similar below, perfectly correct otherwise, seem of limited value 
to me.

Thanks,
Janusz

> > >  }
> > >  
> > >  /**
> > > @@ -962,9 +971,7 @@ static inline struct v4l2_rect
> > >  			  struct v4l2_subdev_pad_config *cfg,
> > >  			  unsigned int pad)
> > >  {
> > > -	if (WARN_ON(pad >= sd->entity.num_pads))
> > > -		pad = 0;
> > > -	return &cfg[pad].try_crop;
> > > +	return __v4l2_subdev_get_try_field(sd, cfg, pad, try_crop);
> > >  }
> > >  
> > >  /**
> > > @@ -980,11 +987,8 @@ static inline struct v4l2_rect
> > >  			     struct v4l2_subdev_pad_config *cfg,
> > >  			     unsigned int pad)
> > >  {
> > > -	if (WARN_ON(pad >= sd->entity.num_pads))
> > > -		pad = 0;
> > > -	return &cfg[pad].try_compose;
> > > +	return __v4l2_subdev_get_try_field(sd, cfg, pad, try_compose);
> > >  }
> > > -#endif
> > >  
> > >  extern const struct v4l2_file_operations v4l2_subdev_fops;
> > >  
> > > 
> > 
> > 
> > 
> > 
> 
> 




