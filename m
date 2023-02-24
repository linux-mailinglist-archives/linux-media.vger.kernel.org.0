Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2DB96A206A
	for <lists+linux-media@lfdr.de>; Fri, 24 Feb 2023 18:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbjBXRU4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Feb 2023 12:20:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbjBXRUz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Feb 2023 12:20:55 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65ABE43468
        for <linux-media@vger.kernel.org>; Fri, 24 Feb 2023 09:20:52 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id eg37so53695406edb.12
        for <linux-media@vger.kernel.org>; Fri, 24 Feb 2023 09:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=43BdNtqkhRt7ydw1eNLylWAPt+kg2A/KY5UgQrdODn8=;
        b=E1blK/fxhOAhrdGIqHM4ZCx/aOEz9q+cx7Eam4rYzuWF47VKomm5FISptGN0dZDQkG
         urMp3VEMCHUCudvoe+ri5DGVL7dRhrwTZT1VCDOZvsPKBmn6jsQTKWtvpzRUZA/r0rKK
         dvQe9T3HTOFnQ0/tnr5EHZC8MN5RfTWhsTLqwh+rx4q5p18XCQ70/d6bilZx0GIH32MX
         YhBou+C8RH81QXpPKosR0RzctFVj6Y8R8xnGq44gnhh+NisE0bBr8zXq4VKwAg+zjDj0
         G5R4Oij6qEr/L+YLqPi5U6N6kJn/uJXRDuRNScpaSiv8faNmc7ZytKyXghEZArtukM9X
         KzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=43BdNtqkhRt7ydw1eNLylWAPt+kg2A/KY5UgQrdODn8=;
        b=lYZsn46xzpLGGhX0wHW8i9reh3aQiUWbZ5Ug0UJLk//zpyPuNWuHJv4HepI+qqpSn+
         pqVCLmVFObUtFN0RDaqrYVRv6zUg/inUW3sgU1PwqJNC2W9+WQ3Ce+UK6TYwDinyRGgK
         cIilq3qBakE9R74Yad+9Ex2cumyW5Fq6toAxdvFlZmB7lAu9rl3zyXwJkUlzZUHngyXX
         8uIfiLieUHAR6hBMr50Q6E3+lSSCExhQC2iBmzq556t3n2ODTqAKLiZEgrVXanmw7QuA
         izJI8Yv/SKGcOBBZl6+/5ChNwss8HYINqu6J5D5Ki+wm6acmD/ZwmS5nQay/pgEEhhra
         9bmg==
X-Gm-Message-State: AO0yUKUOnuQnRyAANtErBzHES8Fni/n77JwSB7UQlUptzx98cbbFOhwU
        Y7EilFetA3xMpjXFO0bmG64/IA==
X-Google-Smtp-Source: AK7set8d98ZV+WnfBZ5UdUXhQhmnPNw2xySvttE9tEK/pWHDzRYH9S1I18eLi6OtcnuC3qxqVDZbDA==
X-Received: by 2002:a17:906:af1a:b0:880:a42d:dfb4 with SMTP id lx26-20020a170906af1a00b00880a42ddfb4mr23190595ejb.16.1677259250880;
        Fri, 24 Feb 2023 09:20:50 -0800 (PST)
Received: from localhost (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.gmail.com with ESMTPSA id f13-20020a170906738d00b008e6bd130b14sm3503174ejl.64.2023.02.24.09.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 09:20:50 -0800 (PST)
Date:   Fri, 24 Feb 2023 18:20:49 +0100
From:   niklas soderlund <niklas.soderlund@ragnatech.se>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>
Subject: Re: [PATCH v1 3/3] media: ti: cal: add multiplexed streams support
Message-ID: <Y/jx8euxuxg07C08@sleipner.dyn.berto.se>
References: <20230222125630.421020-1-tomi.valkeinen@ideasonboard.com>
 <20230222125630.421020-4-tomi.valkeinen@ideasonboard.com>
 <20230224154855.kmiwg2h5b3vq272l@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230224154855.kmiwg2h5b3vq272l@uno.localdomain>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On 2023-02-24 16:48:55 +0100, Jacopo Mondi wrote:
> Hi Tomi
> 
> On Wed, Feb 22, 2023 at 02:56:30PM +0200, Tomi Valkeinen wrote:
> > Add routing and stream_config support to CAL driver.
> >
> > Add multiplexed streams support. CAL has 8 dma-engines and can capture 8
> > separate streams at the same time.
> >
> > Add 8 video device nodes, each representing a single dma-engine, and set
> > the number of source pads on camerarx to 8. Each video node can be
> > connected to any of the source pads on either of the camerarx instances
> > using media links. Camerarx internal routing is used to route the
> > incoming CSI-2 streams to one of the 8 source pads.
> >
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > ---
> >  drivers/media/platform/ti/cal/cal-camerarx.c | 233 ++++++++++++++-----
> >  drivers/media/platform/ti/cal/cal-video.c    | 146 +++++++++---
> >  drivers/media/platform/ti/cal/cal.c          |  65 ++++--
> >  drivers/media/platform/ti/cal/cal.h          |   4 +-
> >  4 files changed, 342 insertions(+), 106 deletions(-)
> >
> > diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
> > index faafbd0e9240..49ae29065cd1 100644
> > --- a/drivers/media/platform/ti/cal/cal-camerarx.c
> > +++ b/drivers/media/platform/ti/cal/cal-camerarx.c
> > @@ -49,21 +49,41 @@ static s64 cal_camerarx_get_ext_link_freq(struct cal_camerarx *phy)
> >  {
> >  	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2 = &phy->endpoint.bus.mipi_csi2;
> >  	u32 num_lanes = mipi_csi2->num_data_lanes;
> > -	const struct cal_format_info *fmtinfo;
> >  	struct v4l2_subdev_state *state;
> > -	struct v4l2_mbus_framefmt *fmt;
> >  	u32 bpp;
> >  	s64 freq;
> >
> > -	state = v4l2_subdev_get_locked_active_state(&phy->subdev);
> > +	/*
> > +	 * v4l2_get_link_freq() uses V4L2_CID_LINK_FREQ first, and falls back
> > +	 * to V4L2_CID_PIXEL_RATE if V4L2_CID_LINK_FREQ is not available.
> > +	 *
> > +	 * With multistream input there is no single pixel rate, and thus we
> > +	 * cannot use V4L2_CID_PIXEL_RATE, so we pass 0 as the bpp which
> > +	 * causes v4l2_get_link_freq() to return an error if it falls back to
> > +	 * V4L2_CID_PIXEL_RATE.
> > +	 */
> 
> To recap a bit of our offline discussion:
> - max9286 GMSL deserializer (as a comparison for a multiplexed
>   transmitter) use PIXEL_RATE to report the cumulative pixel rate of
>   enabled transmitters. This is because the R-Car CSI-2 receiver on
>   which use PIXEL_RATE to compute the link freq [1]
> 
> - according to [2]
>   pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample (on D-PHY)
> 
>   from which:
>   link_freq = pixel_rate * bits_per_sample / (2 * nr_of_lanes)
> 
>   This works as long the reported pixel rate includes visible and
>   blankings, something I'm not sure how many transmitters handle
>   correctly as PIXEL_RATE control is meant to report the visible pixel
>   sampling rate on the pixel array.
> 
> I guess we should go towards mandating LINK_FREQ for transmitters.
> 
> cc-Niklas for opinions on R-Car CSI-2 rcsi2_calc_mbps()

Thanks for the ping.

The choice to use the PIXEL_RATE instead of the LINK_FREQ control for 
the R-Car CSI-2 was originally because the ADV748x which was the first 
CSI-2 transmitter used during development.

AFIK the ADV748x adjusts the CSI-2 TX link frequency to match the pixel 
clock. This results in quiet a big range of possible values that need to 
be communicated between the two sub devices. The V4L2_CID_LINK_FREQ 
control is a V4L2_CTRL_TYPE_INTEGER_MENU which do not render itself to 
report the large range of values needed.

When we added MAX9286 and friends to the mix, we built on-top of this by 
reporting the total pixel rate of all streams being transmitted on the 
CSI-2 link. IMHO the v4l2_get_link_freq() was an OK middle ground on how 
to align the two use-cases.

I agree that situation is not ideal. And in a perfect world a control 
other then PIXEL_RATE would be used for the R-Car CSI-2 driver, but no 
such control exists. And chancing the control type of LINK_FREQ is not a 
good idea as that is usually specified in as a list in DT.

Adding a new control DYNAMIC_LINK_FREQ and wire that into 
v4l2_get_link_freq() ?

> 
> [1] https://elixir.bootlin.com/linux/v6.2/source/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c#L608
> [2] https://www.kernel.org/doc/html/latest/driver-api/media/tx-rx.html#csi-2-transmitter-drivers
> 

-- 
Kind Regards,
Niklas Söderlund
