Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 872D22A91A2
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 09:41:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbgKFIlO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 03:41:14 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:38469 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgKFIlO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Nov 2020 03:41:14 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 23DB820015;
        Fri,  6 Nov 2020 08:41:07 +0000 (UTC)
Date:   Fri, 6 Nov 2020 09:41:08 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Naushir Patuck <naush@raspberrypi.com>, erosca@de.adit-jv.com
Subject: Re: [PATCH v2 16/30] media: ov5647: Rename SBGGR8 VGA mode
Message-ID: <20201106084108.uamrti3jrz76563k@uno.localdomain>
References: <20201104103622.595908-1-jacopo@jmondi.org>
 <20201104103622.595908-17-jacopo@jmondi.org>
 <CAPY8ntBc35oF+5SUirENbtL5s9HhsWuV3wN+g3z1R1L647utgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntBc35oF+5SUirENbtL5s9HhsWuV3wN+g3z1R1L647utgQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Wed, Nov 04, 2020 at 02:52:17PM +0000, Dave Stevenson wrote:
> Hi Jacopo
>
> On Wed, 4 Nov 2020 at 10:37, Jacopo Mondi <jacopo@jmondi.org> wrote:
> >
> > Before adding new modes, rename the only existing one to report
> > the media bus format in the name to distinguish it from future
> > additions.
>
> You are aware that if flips get added into the mix then they alter the
> Bayer order, and therefore the media bus format will change?
> Adding the bit depth makes sense, but adding the Bayer order less so.

mmm, adding the sensor's Bayer pattern to the modes list has a limited
value and might be misleading, you're right.

I'll drop it, thanks


>
>   Dave
>
> > While at it, briefly describe the mode.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/i2c/ov5647.c | 13 +++++++------
> >  1 file changed, 7 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> > index 65fcd86dcba96..9cbe3b675fb52 100644
> > --- a/drivers/media/i2c/ov5647.c
> > +++ b/drivers/media/i2c/ov5647.c
> > @@ -115,7 +115,7 @@ static struct regval_list sensor_oe_enable_regs[] = {
> >         {0x3002, 0xe4},
> >  };
> >
> > -static const struct regval_list ov5647_640x480[] = {
> > +static const struct regval_list ov5647_640x480_sbggr8[] = {
> >         {0x0100, 0x00},
> >         {0x0103, 0x01},
> >         {0x3034, 0x08},
> > @@ -205,7 +205,8 @@ static const struct regval_list ov5647_640x480[] = {
> >         {0x0100, 0x01},
> >  };
> >
> > -static const struct ov5647_mode ov5647_8bit_modes[] = {
> > +static const struct ov5647_mode ov5647_sbggr8_modes[] = {
> > +       /* 8-bit VGA mode: Uncentred crop 2x2 binned 1296x972 image. */
> >         {
> >                 .format = {
> >                         .code           = MEDIA_BUS_FMT_SBGGR8_1X8,
> > @@ -220,16 +221,16 @@ static const struct ov5647_mode ov5647_8bit_modes[] = {
> >                         .width          = 1280,
> >                         .height         = 960,
> >                 },
> > -               .reg_list       = ov5647_640x480,
> > -               .num_regs       = ARRAY_SIZE(ov5647_640x480)
> > +               .reg_list       = ov5647_640x480_sbggr8,
> > +               .num_regs       = ARRAY_SIZE(ov5647_640x480_sbggr8)
> >         },
> >  };
> >
> >  static const struct ov5647_format_list ov5647_formats[] = {
> >         {
> >                 .mbus_code      = MEDIA_BUS_FMT_SBGGR8_1X8,
> > -               .modes          = ov5647_8bit_modes,
> > -               .num_modes      = ARRAY_SIZE(ov5647_8bit_modes),
> > +               .modes          = ov5647_sbggr8_modes,
> > +               .num_modes      = ARRAY_SIZE(ov5647_sbggr8_modes),
> >         },
> >  };
> >
> > --
> > 2.29.1
> >
