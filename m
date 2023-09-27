Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78D3F7B02B0
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 13:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbjI0LW7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 07:22:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjI0LW5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 07:22:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 971E7194
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 04:22:54 -0700 (PDT)
Received: from pendragon.ideasonboard.com (unknown [95.214.66.65])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D772B18BF;
        Wed, 27 Sep 2023 13:21:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695813671;
        bh=fU4HCFTqK8F3Dk72E9XX0CUrAEHemIXWwF5HKIQs1QQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HPFVANVtRXa8Vz+v/VgrGS5I5dmXSVzO9f6Axs7CTKPsHdD1rO7clu+kiroqFowEQ
         uVZyZrTH/VwRzkUTNCgHXkzk8zn8KOhew3rGbbaYA9fPfWhy+nCnl0PM0Kw8Vvgbxm
         7q63U/sA/yafGpPJQJPMX4nOa4AzRnPsIdpz4/i8=
Date:   Wed, 27 Sep 2023 14:23:01 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Max Schulze <max.schulze@online.de>, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH] read ov9281 sensor-id in 2-steps in case the firmware
 locks
Message-ID: <20230927112301.GR5854@pendragon.ideasonboard.com>
References: <918ce2ca-55ff-aff8-ea6c-0c17f566d59d@online.de>
 <CAPY8ntCDtrNJ7HCgQy7ZHxRpaK7brQicOQX_j99U0hX0PDS-6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntCDtrNJ7HCgQy7ZHxRpaK7brQicOQX_j99U0hX0PDS-6A@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 27, 2023 at 11:38:21AM +0100, Dave Stevenson wrote:
> On Wed, 27 Sept 2023 at 09:56, Max Schulze wrote:
> >
> > The ov9281 produced by vision-components does not support
> > auto-incremented reads, so read the id in 2 separate steps
> > to circumvent the error:
> >   kernel: ov9282 10-0060: chip id mismatch: 9281!=92ff
> >   kernel: ov9282 10-0060: failed to find sensor: -6

If I recall correctly, the issue isn't that it doesn't support
auto-increment at all, but that it then will output one 0xff byte first.
Or maybe that was with a different firmware version ?

> > Signed-off-by: Max Schulze <max.schulze@online.de>
> > Tested-by: Max Schulze <max.schulze@online.de>
> > Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> > This was tested on rpi cm4 with two ov9281 at the same time,
> > one from vc, one from inno-maker.
> >
> > The rpi kernel supported ov9281 out-of-tree until kernel 6.1.
> > It carried this change originally made by Dave to support the vc
> > sensor. Switching to mainline now broke support for it.
> >
> > I could not find a single-commit for the original change to which I
> > could link, only squashed ones, i.e.
> >
> > https://github.com/raspberrypi/linux/commit/eb00efc993d8cd835221255b44e9019a31708abe
> 
> The single commit was on the rpi-5.10.y branch
> https://github.com/raspberrypi/linux/commit/e19e5fa998c7dfaa9942a494499e37788365ccec
> 
> >  media: i2c: ov9281: Read chip ID via 2 reads
> >
> >  Vision Components have made an OV9281 module which blocks reading
> >  back the majority of registers to comply with NDAs, and in doing
> >  so doesn't allow auto-increment register reading as used when
> >  reading the chip ID.
> 
> I know that Laurent has previously made comments on potentially nicer
> ways to handle these annoying Vision Components sensors before, but in
> the absence of anything solid then I have no issues with this patch.
> It's not going to cause an issue with standard modules, and makes them
> work with the VC ones.

I'd rather handle this in a common layer, with a DT property to indicate
that multi-reads are broken. A good candidate would be regmap, v4l2-cci
being another possible option.

I don't want to see this kind of change made in lots of sensor drivers
because one vendor got it wrong.

> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> > ---
> >  drivers/media/i2c/ov9282.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index 068c7449f50e..3b687f6d4581 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -1078,13 +1078,16 @@ static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
> >  static int ov9282_detect(struct ov9282 *ov9282)
> >  {
> >         int ret;
> > -       u32 val;
> > +       u32 val = 0, id_msb = 0;
> >
> > -       ret = ov9282_read_reg(ov9282, OV9282_REG_ID, 2, &val);
> > -       if (ret)
> > -               return ret;
> > +       // some firmware limits auto-increment register writes, so do it separately
> > +       ret = ov9282_read_reg(ov9282, OV9282_REG_ID + 1, 1, &val);
> > +       if (!ret)
> > +               ret = ov9282_read_reg(ov9282, OV9282_REG_ID, 1, &id_msb);
> > +
> > +       val |= (id_msb << 8);
> >
> > -       if (val != OV9282_ID) {
> > +       if (ret || val != OV9282_ID) {
> >                 dev_err(ov9282->dev, "chip id mismatch: %x!=%x",
> >                         OV9282_ID, val);
> 
> Minor nit: you'll print this error message if one of the transfers
> failed, whereas previously it would have just returned the error code.
> 
> >                 return -ENXIO;

-- 
Regards,

Laurent Pinchart
