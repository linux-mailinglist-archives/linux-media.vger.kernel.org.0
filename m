Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E99210C2B3
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2019 04:06:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbfK1DG4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Nov 2019 22:06:56 -0500
Received: from vps.xff.cz ([195.181.215.36]:35758 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727088AbfK1DGz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Nov 2019 22:06:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1574910414; bh=s0u7Q5tCoSp3oxGSwaQ6izZaVYzIABS3Gf4oK5gp2yU=;
        h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
        b=EJ6mTm1/QSIj38AlCpaIu9dxOOeQ2Z1nlrGPfD1zFEvciSHY1yBzlpO3QM1y9NjgR
         KS5/RS7PPDNcmYlcu/biPoRkj1E95jMk6VJZmGT79Gty4wlY7WVBmgMlTHaeQNWnrB
         OQOLgbyXx+HWhDpWjzfGcHLi/22e1f+rGS2+4F2E=
Date:   Thu, 28 Nov 2019 04:06:53 +0100
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Yong <yong.deng@magewell.com>
Cc:     linux-sunxi@googlegroups.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        "open list:CSI DRIVERS FOR ALLWINNER V3s" 
        <linux-media@vger.kernel.org>,
        "moderated list:ARM/Allwinner sunXi SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [linux-sunxi] [PATCH] media: sun6i-csi: Fix incorrect
 HSYNC/VSYNC/PCLK polarity configuration
Message-ID: <20191128030653.5fhcolvib6tzf4zc@core.my.home>
Mail-Followup-To: Yong <yong.deng@magewell.com>,
        linux-sunxi@googlegroups.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        "open list:CSI DRIVERS FOR ALLWINNER V3s" <linux-media@vger.kernel.org>,
        "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20191128020259.1338188-1-megous@megous.com>
 <20191128102608.035cbb996c8681a6fb035336@magewell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191128102608.035cbb996c8681a6fb035336@magewell.com>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Thu, Nov 28, 2019 at 10:26:08AM +0800, Yong wrote:
> Hi Ondrej,
> 
> This has been discussed.
> And Maxime sent a patch for this: 
> https://www.mail-archive.com/linux-media@vger.kernel.org/msg127149.html

Thanks for pointing to the previous patch. But that patch doesn't make any
sense, and breaks things for me, and doesn't even match BSP code, which 
has no such reversal, and works fine with about 30 cam drivers.

Also how do you explain my findings?

My camera is sending correct signals, verified by looking at them actually (see
below), and CSI is not receiving the image. I have to flip HSYNC/VSYNC to be
oposite of that what CSI driver expects and I get a noisy image and if I fix
PCLK polarity too, the noise goes away, which means now I'm also sampling when
the data are stable and not when they're changing.

Here: (output from my cam, that I configured to have VSYNC ACTIVE LOW, HSYNC
ACTIVE LOW) And the signal is clearly that, as you can see yourself:

  https://megous.com/dl/tmp/98df81b7ed0126ec.png

The above signals are received with CSI driver configured with
V4L2_MBUS_VSYNC_ACTIVE_HIGH V4L2_MBUS_HSYNC_ACTIVE_HIGH. So CSI driver is
clearly wrong.

I think this is pretty clear the driver is buggy. At least for A83T SoC.

I'm not sure what Maxime found out, but he should probably re-check his
findings. Maxime, can you comment on this?

regards,
	o.

> On Thu, 28 Nov 2019 03:02:59 +0100
> Ondrej Jirman <megous@megous.com> wrote:
> 
> > This was discovered by writing a new camera driver and wondering, why
> > hsync/vsync polarity setting behaves in reverse to what would be
> > expected. Verified by looking at the actual signals and the SoC
> > user manual.
> > 
> > Fixes: 5cc7522d8965 ("media: sun6i: Add support for Allwinner CSI V3s")
> > Signed-off-by: Ondrej Jirman <megous@megous.com>
> > ---
> >  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > index f17e5550602d..98bbcca59a90 100644
> > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > @@ -417,12 +417,12 @@ static void sun6i_csi_setup_bus(struct sun6i_csi_dev *sdev)
> >  		if (flags & V4L2_MBUS_FIELD_EVEN_LOW)
> >  			cfg |= CSI_IF_CFG_FIELD_POSITIVE;
> >  
> > -		if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> > +		if (flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
> >  			cfg |= CSI_IF_CFG_VREF_POL_POSITIVE;
> > -		if (flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
> > +		if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> >  			cfg |= CSI_IF_CFG_HREF_POL_POSITIVE;
> >  
> > -		if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> > +		if (flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
> >  			cfg |= CSI_IF_CFG_CLK_POL_FALLING_EDGE;
> >  		break;
> >  	case V4L2_MBUS_BT656:
> > -- 
> > 2.24.0
> > 
> > -- 
> > You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> > To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/20191128020259.1338188-1-megous%40megous.com.
> 
> 
> Thanks,
> Yong
