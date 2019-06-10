Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6443BB57
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2019 19:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388130AbfFJRti (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jun 2019 13:49:38 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33165 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388052AbfFJRth (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jun 2019 13:49:37 -0400
Received: by mail-lf1-f65.google.com with SMTP id y17so7274466lfe.0
        for <linux-media@vger.kernel.org>; Mon, 10 Jun 2019 10:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8UUl6ahGnr7c+6PWkqKikTXVQmYpvSxXuE2hR5jzwAI=;
        b=UTgZZLr4KIQDGV75NmlPzdGAWL627Ka22lvYfmXoI57Vm80fQk47ZmIpviRM/N4j5/
         mVc+GhGdrBbjvee1ZTMp2VjdZ1E/WVvEUqW23J1sQ8rQudLH9wv9iM/R4ENLTISq0ZQV
         sN9bG9g09UsIqlAijv9xhqkFG8wEz3NQlJyax7snA/diNZW2D9sUD3zILRdRu/QZg259
         n/C2DkEZbVYxomunYuKYRZsgqTV6nzdrrfgs6fG+SQb4X/XHcnzKWT40Q3uDTt2O6h5E
         h9iEUrTm9jMBsS0ana0detzSY5G5QaAjmVaFA6hnEAxcP4G5aHM31mXgDSfXARhcyhCZ
         IynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8UUl6ahGnr7c+6PWkqKikTXVQmYpvSxXuE2hR5jzwAI=;
        b=DLi/ZB/1f/43vI71cUe/SpuPYEyP5y2+K1Nx9ifdMm3pJLlrOgUNOCNCIPTSRmRCGg
         qNWC+oKzs1v/JW3EeDXqO84eNcCkLxUjDjXNIYRAPQG8jnkGNs1n7YjUTVI1O/V922GI
         kMI7al/DuOfxBBtyZs5bC0TUh0QndUSNNX/AI6DJngtSwq1+byW/aYRm35PDuZf66IFa
         5BozFjQ26nrNt5PiRaUIF64zNpZgEV8kO2xgs6mC6aemXGZMclr/S89eUXzvswWMzv01
         hT6imIv95QASdVFSfBhrba1Y0VU/0nP9KjDrByOrSmOj+wJor26UoX4VJcTlQgCX1F20
         1cqQ==
X-Gm-Message-State: APjAAAUhVXlqUKvPYcfyZh8ObCreIV1JGp8RqwIQtOkIUAOr5CaS+QwM
        C/qG6ratmrryiECOvk0Fjew=
X-Google-Smtp-Source: APXvYqwN7KV15mJu2ELI+8LPKnq8z9A7TnK2w1XgvOgf5VK+u76pB4G2El077r0NhHAcPG7++pVSYQ==
X-Received: by 2002:a19:5044:: with SMTP id z4mr34037784lfj.80.1560188974926;
        Mon, 10 Jun 2019 10:49:34 -0700 (PDT)
Received: from z50.localnet (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id g76sm1334235lje.43.2019.06.10.10.49.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 10:49:34 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        m.felsch@pengutronix.de, Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [RFC 1/1] v4l2-subdev: Rework subdev format and selection macros to work without MC
Date:   Mon, 10 Jun 2019 19:49:32 +0200
Message-ID: <1565475.m9sZUypsIq@z50>
In-Reply-To: <20190610085443.mdwxw6pehfr2o5e4@mara.localdomain>
References: <20190604175731.20596-1-sakari.ailus@linux.intel.com> <60014338.tBqkIJZrQe@z50> <20190610085443.mdwxw6pehfr2o5e4@mara.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Monday, June 10, 2019 10:54:44 AM CEST Sakari Ailus wrote:
> Hi Janusz,
> 
> On Thu, Jun 06, 2019 at 08:13:36PM +0200, Janusz Krzysztofik wrote:
> > Hi Sakari,
> > 
> > On Thursday, June 6, 2019 3:56:42 PM CEST Sakari Ailus wrote:
> > > Hi Janusz,
> > > 
> > > On Wed, Jun 05, 2019 at 09:33:41PM +0200, Janusz Krzysztofik wrote:
> > > > Hi Sakari,
> > > > 
> > > > On Tuesday, June 4, 2019 7:57:31 PM CEST Sakari Ailus wrote:
> > > > > Rework the macros for accessing subdev try formats to work
> > > > > meaningfully
> > > > > and relatively safely without V4L2 sub-device uAPI (and without MC).
> > > > > This
> > > > > is done by simply reverting to accessing the pad number zero if
> > > > > CONFIG_VIDEO_V4L2_SUBDEV_API isn't enabled, and emitting a kernel
> > > > > warning
> > > > > if the pad is non-zero in that case.
> > > > > 
> > > > > The functions are seen useful if subdev uAPI is disabled for drivers
> > > > > that
> > > > > can work without the Kconfig option but benefit from the option if
> > > > > it's
> > > > > enabled.
> > > > 
> > > > I'm not sure which drivers you (we) consider valid users of those
> > > > functions. Subdevice drivers only? Or other drivers which interact
> > > > with subdevices as well?  An answer to that question determines my
> > > > possible other comments.> > 
> > > These functions are only by drivers for the devices they control
> > > directly
> > > only.
> > 
> > That's what I expected.
> > 
> > Exposing those functions to drivers not supporting V4L2 subdev uAPI is
> > not a bad idea but it would make more sense to me if we also updated
> > potential users.  Otherwise I just don't believe anyone will care for as
> > long as a driver is not refreshed to support MC and V4L2 subdev uAPI.
> 
> The primary users of these functions are drivers that do support subdev
> uAPI. Some drivers can function that disabled, so making these functions
> usable to those drivers in all cases simplifies those drivers.

Indeed.  I didn't take that group of drivers into account.

> > > > ...
> > > > 
> > > > > As a by-product, the patch simplifies individual inline functions by
> > > > > removing two lines of code from each of them and moving the
> > > > > functionality
> > > > > to a common macro.
> > > > > 
> > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > ---
> > > > > Hi guys,
> > > > > 
> > > > > This might not be pretty but should provide some comfort for drivers
> > > > > working with different Kconfig options. Comments are welcome...
> > > > > 
> > > > >  include/media/v4l2-subdev.h | 24 ++++++++++++++----------
> > > > >  1 file changed, 14 insertions(+), 10 deletions(-)
> > > > > 
> > > > > diff --git a/include/media/v4l2-subdev.h
> > > > > b/include/media/v4l2-subdev.h
> > > > > index e1e3c18c3fd6..3328f302326b 100644
> > > > > --- a/include/media/v4l2-subdev.h
> > > > > +++ b/include/media/v4l2-subdev.h
> > > > > @@ -930,6 +930,17 @@ struct v4l2_subdev_fh {
> > > > > 
> > > > >  	container_of(fh, struct v4l2_subdev_fh, vfh)
> > > > >  
> > > > >  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> > > > > 
> > > > > +#define __v4l2_subdev_get_try_field(__sd, __cfg, __pad, __field)	
\
> > > > > +	(WARN_ON(!(__cfg)) ? NULL :		\
> > > > > +	 ((__sd)->entity.graph_obj.mdev ?
> > > > 
> > > > \strange
> > > > 
> > > > > +	  (WARN_ON((__pad) >= (__sd)->entity.num_pads) ?		\
> > > > 
> > > > > +	   NULL : &(__cfg)[__pad].__field) :
> > > > \
> > > > 
> > > > > +	  &(__cfg)[WARN_ON(__pad) && 0].__field))
> > > > > +#else /* CONFIG_VIDEO_V4L2_SUBDEV_API */
> > > > > +#define __v4l2_subdev_get_try_field(__sd, __cfg, __pad, __field)	
\
> > > > 	
> > > > > +	(WARN_ON(!(__cfg)) ? NULL :
> > > > 	\
> > > > 	
> > > > > +	 &(__cfg)[WARN_ON(__pad) && 0].__field)
> > > > > +#endif /* !CONFIG_VIDEO_V4L2_SUBDEV_API */
> > 
> > I think that as long as we already have in place the same checks performed
> > by v4l2_subdev_call() which seems the only user entry point to a
> > subdevice driver, invalid cfg or pad values you are trying to catch here
> > will never be passed unless the driver performs unusual operations and,
> > moreover, is internally broken.
> 
> You can't rely on checks done by the v4l2_subdev_call macro as these
> parameters do not come from the caller; they are set by the driver itself.

If that' the case, you are right.

It looks like I'm missing some knowledge on V4L2 framework needed to provide a 
valuable review of your change, please ignore my comments.

Thanks,
Janusz


