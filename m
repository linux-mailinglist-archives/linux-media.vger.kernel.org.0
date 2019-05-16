Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB1622077A
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 15:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727235AbfEPNBB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 09:01:01 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34743 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbfEPNBB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 09:01:01 -0400
Received: by mail-lj1-f194.google.com with SMTP id j24so3052962ljg.1
        for <linux-media@vger.kernel.org>; Thu, 16 May 2019 06:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=4JQ0cAkm/H+WCmXGpjQHXu6SVKneQy0K3H4IOCbSexI=;
        b=vnZPXK73jhhfloxa0nmgb4TyoBFzZKYnOSDuq6+fwdBe3iklUIDK/w/IZapy1cf/GF
         xVGYVvLfXwir/Z/o+mTYDLGYkvpF9p5Kx+iVDxFaqJ9XQuCHC9TtJXumyLcZN3R1R6Pc
         3akI3hu6SPIEd+aIn/mhBl1ynuO1uOkuXvApnHJ/h4MXgrCIU4Vm5bo9JQgSahViUFAq
         g1m/2ulyo5hO09pN0ZqG4cunuKxQRWWSTUaGhmL+3XYH5cAn1sO91xr4rBrwVK15yT/+
         62uyc0if+NVae18S+2xlqXUUIKcqy7chON+anf0yBZuaLBQdpgOGJDw+6g9hbQe293bs
         Jxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=4JQ0cAkm/H+WCmXGpjQHXu6SVKneQy0K3H4IOCbSexI=;
        b=nc1ywQwhXELoCTuDDbKG9i6POYjQ2UtzQJq+s7bONfY6RAXyl44Bc3XXG2WZ4gU/aU
         7iZLgOFXFn+sOR6v+lit57QMVb9LvWg9HTCW1O327Tu34fKHisvszGnRls+vEMB7R1Iz
         sNxoS+945o9lWEzRvTaUa8NwG9inwlNWyG3tGbRZOE4OhI5DfmoiA95KatjLVEhC+HIQ
         sOJwyZRGibLMjxYOmjle2IMNrbC+yh0JKxuUG/lQPlrFtbF70mmxis4JtdflyNz7W3JO
         GXD4mLH8rEK+zhTLaCeci2hyYAhCaDxlYATnSVWWmJnUaKHcWmb/P+PlKdB7s+FvMM4u
         A7ww==
X-Gm-Message-State: APjAAAWhDkwETe60FsQJL00HN3nzaqjRo5J74qHoCQw3mRsKaGGyO9Oo
        k/DocnGEvNNhrHgIruPBcyhRSTzsLJc=
X-Google-Smtp-Source: APXvYqzalSNSTN5MrqGzlp7ZZ956b+RJC5qohYwGb94Qs84rvqSYrX+nK7hKCjo+COUtsp5u9of6KQ==
X-Received: by 2002:a2e:85c9:: with SMTP id h9mr11278859ljj.110.1558011658748;
        Thu, 16 May 2019 06:00:58 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id d23sm892502ljj.38.2019.05.16.06.00.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 May 2019 06:00:57 -0700 (PDT)
From:   "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
X-Google-Original-From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date:   Thu, 16 May 2019 15:00:57 +0200
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] rcar-vin: Add support for RGB formats with alpha
 component
Message-ID: <20190516130057.GC31788@bigcity.dyn.berto.se>
References: <20190516004746.3794-1-niklas.soderlund+renesas@ragnatech.se>
 <20190516004746.3794-4-niklas.soderlund+renesas@ragnatech.se>
 <20190516100822.GC4995@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190516100822.GC4995@pendragon.ideasonboard.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for your feedback.

On 2019-05-16 13:08:22 +0300, Laurent Pinchart wrote:
> Hi Niklas,
> 
> Thank you for the patch.
> 
> On Thu, May 16, 2019 at 02:47:46AM +0200, Niklas Söderlund wrote:
> > The R-Car VIN module supports V4L2_PIX_FMT_ARGB555 and
> > V4L2_PIX_FMT_ABGR32 pixel formats. Add the hardware register setup and
> > allow the alpha component to be changed while streaming using the
> > V4L2_CID_ALPHA_COMPONENT control.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-dma.c  | 30 +++++++++++++++++++++
> >  drivers/media/platform/rcar-vin/rcar-v4l2.c |  8 ++++++
> >  2 files changed, 38 insertions(+)
> > 
> > diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> > index 4e991cce5fb56a90..5c0ed27c5d05dd45 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> > @@ -111,8 +111,11 @@
> >  #define VNIE_EFE		(1 << 1)
> >  
> >  /* Video n Data Mode Register bits */
> > +#define VNDMR_A8BIT(n)		((n & 0xff) << 24)
> > +#define VNDMR_A8BIT_MASK	(0xff << 24)
> >  #define VNDMR_EXRGB		(1 << 8)
> >  #define VNDMR_BPSM		(1 << 4)
> > +#define VNDMR_ABIT		(1 << 2)
> >  #define VNDMR_DTMD_YCSEP	(1 << 1)
> >  #define VNDMR_DTMD_ARGB		(1 << 0)
> >  
> > @@ -730,6 +733,12 @@ static int rvin_setup(struct rvin_dev *vin)
> >  		/* Note: not supported on M1 */
> >  		dmr = VNDMR_EXRGB;
> >  		break;
> > +	case V4L2_PIX_FMT_ARGB555:
> > +		dmr = (vin->alpha ? VNDMR_ABIT : 0) | VNDMR_DTMD_ARGB;
> > +		break;
> > +	case V4L2_PIX_FMT_ABGR32:
> > +		dmr = VNDMR_A8BIT(vin->alpha) | VNDMR_EXRGB | VNDMR_DTMD_ARGB;
> > +		break;
> >  	default:
> >  		vin_err(vin, "Invalid pixelformat (0x%x)\n",
> >  			vin->format.pixelformat);
> > @@ -1346,5 +1355,26 @@ int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel)
> >  
> >  void rvin_set_alpha(struct rvin_dev *vin, unsigned int alpha)
> 
> OK, I now see why you added a rvin_set_alpha() function. It makes sense,
> but I think you need to protect this with a lock to avoid races between
> stream start and control set. Or are we already protected by a lock the
> serialises all V4L2 ioctls for the VIN video node ?

Yes we are protected by the ioctls lock in __video_do_ioctl(), at least 
that is my interpretation of the code I have not tried to force a race.

> 
> >  {
> > +	u32 dmr;
> > +
> >  	vin->alpha = alpha;
> > +
> > +	if (vin->state == STOPPED)
> > +		return;
> > +
> > +	switch (vin->format.pixelformat) {
> > +	case V4L2_PIX_FMT_ARGB555:
> > +		dmr = rvin_read(vin, VNDMR_REG) & ~VNDMR_ABIT;
> > +		if (vin->alpha)
> > +			dmr |= VNDMR_ABIT;
> > +		break;
> 
> Should you cache the DNDMR valid to avoid a hardware read ?

It is one possibility, as VNDMR is written to at other locations I would 
feel better to to this at a later point in time.

I'm currently trying to clean up the rcar-vin driver with regard to how 
it handles formats a bit different in the devnode and media centric code 
paths. Once that work is complete a generic way to cache register values 
could be added on top. I suspect there are other registers then VNDMR 
which could benefit from such a solution.

> 
> > +	case V4L2_PIX_FMT_ABGR32:
> > +		dmr = rvin_read(vin, VNDMR_REG) & ~VNDMR_A8BIT_MASK;
> > +		dmr |= VNDMR_A8BIT(vin->alpha);
> > +		break;
> > +	default:
> > +		return;
> > +	}
> > +
> > +	rvin_write(vin, dmr,  VNDMR_REG);
> >  }
> > diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > index 7cbdcbf9b090c638..bb2900f5d000f9a6 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > @@ -54,6 +54,14 @@ static const struct rvin_video_format rvin_formats[] = {
> >  		.fourcc			= V4L2_PIX_FMT_XBGR32,
> >  		.bpp			= 4,
> >  	},
> > +	{
> > +		.fourcc			= V4L2_PIX_FMT_ARGB555,
> > +		.bpp			= 2,
> > +	},
> > +	{
> > +		.fourcc			= V4L2_PIX_FMT_ABGR32,
> > +		.bpp			= 4,
> > +	},
> >  };
> >  
> >  const struct rvin_video_format *rvin_format_from_pixel(u32 pixelformat)
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Regards,
Niklas Söderlund
