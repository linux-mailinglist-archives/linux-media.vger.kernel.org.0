Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86955485C3
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 16:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728217AbfFQOkn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 10:40:43 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46377 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbfFQOkn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 10:40:43 -0400
Received: by mail-lj1-f196.google.com with SMTP id v24so9523740ljg.13
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2019 07:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=sBhJXtjhhGYfvak2Ql4ZCKHLWpoHHyX5XFg1FhgWspg=;
        b=HBlrvLvwQxLhN7Ha2jxdZMdMr3bisJjwoVdwdp7fvzpBDJTVgyNx7K6yYnZ/2T33CB
         0Bs3mmdaUSrai9GrbfoTzM1J3tBlbSEWIm6JjeIoGDf9cna422z4i2wtqLmlF6t8h9+B
         5SCUs43m7bd+jI19qpStu01ZCUMy9zaIfTYtJDhGNExs8LCC8NszFJXsSSjti25wyg9q
         7hzoYN1efktYqLanKy0KQ5NEWBXRZ52NbhWmaHypFNkwvONbQnEVCmtLao9ilBo6Txnc
         hB7BwC8hulsOYUw+S4cjE3nQqVX6/BmKm3SyC9Z3WEvi1ld8FUxZAUY5cHc+LQCpR0cu
         BfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=sBhJXtjhhGYfvak2Ql4ZCKHLWpoHHyX5XFg1FhgWspg=;
        b=OT/WQj9RMnpkZAqJ47uKRtc4CywVae+i8AlHgs5CUweIesafIN1WmFQB5Up6dCoscC
         NB+9tyeex1vm3sBDaDyY1SGYj0KtHaUasPLXdwZnETipIL1ri12M45NHxasOWtUWb/1x
         XQ2Memo3Oi8zb1TqAtHppTsMa1ZlNkVAFZ/Mz5UBxAw3addChkps9aT5OF20eXpT0O3q
         YA0jV8EqYfA0BCI7J93CXCnHnAzWK4OILMELFagfmUKKN0YhiRjYWAHAly7zoSEKoY/e
         niO/IOdFzoE3ZuFg6ETq7c9FIeOo0eeemoH1txTDNnmX9Mjnc+VcMyPd8GM++ZZIdg2Q
         MZxQ==
X-Gm-Message-State: APjAAAWx2Yz1MtGKX4MwnLT41N4sIqET9CYe0AsWce9kDjLuwOgdt/4Y
        hgWuCSFJVyrYOTRdXZu0tAwY9A==
X-Google-Smtp-Source: APXvYqzczxwOpQDSH32zhOqEDA0VGHd5k2452jJ6AAqpl5dpeXGWquxvO4GuoiFMoilEhVl6pXOP/g==
X-Received: by 2002:a2e:9a87:: with SMTP id p7mr11190109lji.133.1560782441184;
        Mon, 17 Jun 2019 07:40:41 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id b4sm1806912lfp.33.2019.06.17.07.40.40
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 07:40:40 -0700 (PDT)
Date:   Mon, 17 Jun 2019 16:40:40 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] rcar-vin: Add support for RGB formats with alpha
 component
Message-ID: <20190617144040.GF20468@bigcity.dyn.berto.se>
References: <20190613000439.28746-1-niklas.soderlund+renesas@ragnatech.se>
 <20190613000439.28746-4-niklas.soderlund+renesas@ragnatech.se>
 <20190617143341.GC4777@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190617143341.GC4777@pendragon.ideasonboard.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for your feedback.

On 2019-06-17 17:33:41 +0300, Laurent Pinchart wrote:
> Hi Niklas,
> 
> Thank you for the patch.
> 
> On Thu, Jun 13, 2019 at 02:04:39AM +0200, Niklas Söderlund wrote:
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
> >  {
> > +	u32 dmr;
> > +
> >  	vin->alpha = alpha;
> > +
> > +	if (vin->state == STOPPED)
> 
> The state is protected by the vin->qlock spinlock. Is it safe to check
> it here without holding the spinlock ? The answer may be yes if you can
> guarantee that no code patch will race except for the IRQ handler, and
> guarantee that the race with the IRQ handler isn't an issue.

This is just a optimization to not try and write to the hardware if it's 
stopped and switched off. I assume this could race and a lock of 
vin->qlock could be added, if races worst case it writes the alpha value 
to HW when it don't need to. I will add the lock in the next version.

> 
> Additionally, what happens if the control is set and streaming is then
> started ? I don't see in call to v4l2_ctrl_handler_setup() in 2/3 or
> 3/3.

This is a good point, I have recently reworked part of the driver for 
gen2 which already had controls without considering gen3 will gain 
controls with this series. I will fix this and send a new version.

> 
> > +		return;
> > +
> > +	switch (vin->format.pixelformat) {
> > +	case V4L2_PIX_FMT_ARGB555:
> > +		dmr = rvin_read(vin, VNDMR_REG) & ~VNDMR_ABIT;
> > +		if (vin->alpha)
> > +			dmr |= VNDMR_ABIT;
> > +		break;
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
