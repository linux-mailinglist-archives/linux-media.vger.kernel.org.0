Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3188A269A04
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 02:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbgIOABr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 20:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbgIOABn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 20:01:43 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B770BC06178A
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2020 17:01:42 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id x69so1176987lff.3
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2020 17:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Hu//T2azdvRyVHxl3mRyjvYW4R0wVlKthLELBcPcxho=;
        b=Ta5+k+o3qxoWahciS/gM9Q0JPi/6tGLQJDl2f0MbKgfVn+TEoZU0FHUZ7tvLeOK/LG
         JRhqNv0bZN6QN17CBmPGk5wPYZpAOjVBt3iveJkAT/hXrI9mB0q1mLY6QZRY6JL69eaU
         gc2BpQW9pCDcvaNFbnXuLrUFolq2eA9cYGe0q3xAqiWmBGVEMNjjsQ3K0RnlkhicPqwZ
         Erkr5nDB9EIqqKbUeWPX1ddG1/8gAiOrFhVjoCNibnUXv+osIBujau0I4CiuvK0n+IMz
         6dfrivdBiGvPlgY8fmE/KsgbHYQXvaM1CA/6Tcq54UNvWXdXxgM2uRpLyt+QWgM1kqHp
         qSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Hu//T2azdvRyVHxl3mRyjvYW4R0wVlKthLELBcPcxho=;
        b=V+WXNIMFXMFZRT7p/543fiqK5p/1SLFqEDrL9eFq8bSi1UucAAHddvtP3MIFo85nfo
         p0kJKsxYF43B6WuyAd/tNFRPQ+ck/bF/9td2TD40AQVg7RcjVUZKeaSv5HlDHdilxf/P
         RsuzPMBF53bh5lHsGCT0+cx9ouuQHQk8UkLEsYxy8Z/oONyg3vVA1+eEUQBX5pzFOliM
         n+mhXP/aDSK5ILXHjAMC1c2Y+OGupF9w+yw6MZeTkWCHZun63lPYUw0OP27R/FUHdTtc
         eC/uC2KKmRnl0jpFcvKsFRpMvJ7H33CCNoprFoLlCL3oL0Lua6J09CzuQ+EVKYB05CPk
         wlhw==
X-Gm-Message-State: AOAM532qzeR2esA8aLLZV1hY6Zte2qUN+0g6I/KzhefRoueZpCtC0Rvr
        Kh/gnxkyFVO2BZGMmEo46Y+vVA==
X-Google-Smtp-Source: ABdhPJxE4wrwdhDsZhPb4g6plz/u3j9wzWSM9urqjqX+TyGUyhx9V4jowwrjtXRGzShWsaP3Ld7uIg==
X-Received: by 2002:a19:3f0d:: with SMTP id m13mr5929891lfa.91.1600128101125;
        Mon, 14 Sep 2020 17:01:41 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id f25sm3658798lfh.120.2020.09.14.17.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 17:01:40 -0700 (PDT)
Date:   Tue, 15 Sep 2020 02:01:40 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v3] media: rcar-vin: Enable YDS bit depending on
 bus_width and data_shift
Message-ID: <20200915000140.GA1698816@oden.dyn.berto.se>
References: <20200913181608.32077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200914234532.GI15543@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200914234532.GI15543@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lad,

Thanks for your work.

On 2020-09-15 02:45:32 +0300, Laurent Pinchart wrote:
> Hi Prabhakar,
> 
> Thank you for the patch.
> 
> On Sun, Sep 13, 2020 at 07:16:08PM +0100, Lad Prabhakar wrote:
> > Enable YDS bit if bus_width and data_shift is set to 8 in parallel mode
> > for MEDIA_BUS_FMT_UYVY8_2X8 format.
> > 
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > Changes for v3:
> > * Dropped BIT macro
> > * Introduced struct v4l2_fwnode_bus_parallel
> > 
> > Changes for v2:
> > * Dropped DT binding documentation patch
> > * Select the data pins depending on bus-width and data-shift
> > 
> > v1 -
> > https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=323799
> > ---
> >  drivers/media/platform/rcar-vin/rcar-core.c |  9 ++++-----
> >  drivers/media/platform/rcar-vin/rcar-dma.c  | 17 ++++++++++++++---
> >  drivers/media/platform/rcar-vin/rcar-vin.h  |  5 +++--
> >  3 files changed, 21 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> > index 7440c8965d27..1149ab76cf5c 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > @@ -626,12 +626,11 @@ static int rvin_parallel_parse_v4l2(struct device *dev,
> >  
> >  	switch (vin->parallel->mbus_type) {
> >  	case V4L2_MBUS_PARALLEL:
> > -		vin_dbg(vin, "Found PARALLEL media bus\n");
> > -		vin->parallel->mbus_flags = vep->bus.parallel.flags;
> > -		break;
> >  	case V4L2_MBUS_BT656:
> > -		vin_dbg(vin, "Found BT656 media bus\n");
> > -		vin->parallel->mbus_flags = 0;
> > +		vin_dbg(vin, "Found %s media bus\n",
> > +			vin->parallel->mbus_type == V4L2_MBUS_PARALLEL ?
> > +			"PARALLEL" : "BT656");
> 
> I'd write "parallel" and "BT.656".

I agree with this change.

> 
> > +		vin->parallel->bus = vep->bus.parallel;
> >  		break;
> >  	default:
> >  		vin_err(vin, "Unknown media bus type\n");
> > diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> > index a5dbb90c5210..d067439b0b0d 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> > @@ -125,6 +125,7 @@
> >  #define VNDMR2_VPS		(1 << 30)
> >  #define VNDMR2_HPS		(1 << 29)
> >  #define VNDMR2_CES		(1 << 28)
> > +#define VNDMR2_YDS		(1 << 22)
> >  #define VNDMR2_FTEV		(1 << 17)
> >  #define VNDMR2_VLV(n)		((n & 0xf) << 12)
> >  
> > @@ -698,16 +699,26 @@ static int rvin_setup(struct rvin_dev *vin)
> >  
> >  	if (!vin->is_csi) {
> >  		/* Hsync Signal Polarity Select */
> > -		if (!(vin->parallel->mbus_flags & V4L2_MBUS_HSYNC_ACTIVE_LOW))
> > +		if (!(vin->parallel->bus.flags & V4L2_MBUS_HSYNC_ACTIVE_LOW))
> >  			dmr2 |= VNDMR2_HPS;
> >  
> >  		/* Vsync Signal Polarity Select */
> > -		if (!(vin->parallel->mbus_flags & V4L2_MBUS_VSYNC_ACTIVE_LOW))
> > +		if (!(vin->parallel->bus.flags & V4L2_MBUS_VSYNC_ACTIVE_LOW))
> >  			dmr2 |= VNDMR2_VPS;
> >  
> >  		/* Data Enable Polarity Select */
> > -		if (vin->parallel->mbus_flags & V4L2_MBUS_DATA_ENABLE_LOW)
> > +		if (vin->parallel->bus.flags & V4L2_MBUS_DATA_ENABLE_LOW)
> >  			dmr2 |= VNDMR2_CES;
> > +
> > +		switch (vin->mbus_code) {
> > +		case MEDIA_BUS_FMT_UYVY8_2X8:
> > +			if (vin->parallel->bus.bus_width == 8 &&
> 
> You can possibly drop this check, as UYVY8_2X8 implies a bus_width equal
> to 8. Apart from that,

I agree here as well, I think the check for UYVY8_2X8 may be dropped.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > +			    vin->parallel->bus.data_shift == 8)
> > +				dmr2 |= VNDMR2_YDS;
> > +			break;
> > +		default:
> > +			break;
> > +		}
> >  	}
> >  
> >  	/*
> > diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
> > index c19d077ce1cb..8396e0e45478 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> > +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> > @@ -19,6 +19,7 @@
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-dev.h>
> >  #include <media/v4l2-device.h>
> > +#include <media/v4l2-fwnode.h>
> >  #include <media/videobuf2-v4l2.h>
> >  
> >  /* Number of HW buffers */
> > @@ -92,7 +93,7 @@ struct rvin_video_format {
> >   * @asd:	sub-device descriptor for async framework
> >   * @subdev:	subdevice matched using async framework
> >   * @mbus_type:	media bus type
> > - * @mbus_flags:	media bus configuration flags
> > + * @bus:	media bus parallel configuration
> >   * @source_pad:	source pad of remote subdevice
> >   * @sink_pad:	sink pad of remote subdevice
> >   *
> > @@ -102,7 +103,7 @@ struct rvin_parallel_entity {
> >  	struct v4l2_subdev *subdev;
> >  
> >  	enum v4l2_mbus_type mbus_type;
> > -	unsigned int mbus_flags;
> > +	struct v4l2_fwnode_bus_parallel bus;

I think you could break this change (and the fallout) out to a separate 
patch to make the functional change clearer.

> >  
> >  	unsigned int source_pad;
> >  	unsigned int sink_pad;
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Regards,
Niklas Söderlund
