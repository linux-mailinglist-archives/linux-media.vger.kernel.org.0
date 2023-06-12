Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2463072BB9E
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 11:04:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbjFLJE3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 05:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230412AbjFLJD5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 05:03:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0225C1A1
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 02:00:31 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC85F891;
        Mon, 12 Jun 2023 11:00:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686560401;
        bh=Lm9+FvnB0exEtgUWBr8fURberZIF3dmdMvBmrdajoUM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=omFrhoy9rrjJ0k6njRwEdCaWTBz7ejUKZ3VpHVNCDEzES8Tywc67qXFbKpZFqYSvi
         +bbhSXCPgiGDw+6ZNYHzJl0OfLvyeuIBNLRXreWxgsovj38unowWKNfm3RkOft4wDh
         Qxzf5f1llLgN3Y+3Ihu5/VV/s8nyJV8ONT0QrZ28=
Date:   Mon, 12 Jun 2023 12:00:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Dan Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 03/28] media: ov2680: Fix vflip / hflip set functions
Message-ID: <20230612090030.GB17519@pendragon.ideasonboard.com>
References: <20230607164712.63579-1-hdegoede@redhat.com>
 <20230607164712.63579-4-hdegoede@redhat.com>
 <a128069f-bd3c-5170-68aa-0f196d48205f@ideasonboard.com>
 <ea37f7cf-499a-3514-dd5b-cc8c69992875@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea37f7cf-499a-3514-dd5b-cc8c69992875@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 12, 2023 at 10:06:09AM +0200, Hans de Goede wrote:
> On 6/12/23 09:32, Dan Scally wrote:
> > Hello Hans (and everybody else)
> > 
> > On 07/06/2023 17:46, Hans de Goede wrote:
> >> ov2680_vflip_disable() / ov2680_hflip_disable() pass BIT(0) instead of
> >> 0 as value to ov2680_mod_reg().
> >>
> >> While fixing this also:
> >>
> >> 1. Stop having separate enable/disable functions for hflip / vflip
> >> 2. Move the is_streaming check, which is unique to hflip / vflip
> >>     into the ov2680_set_?flip() functions.
> > 
> > I think the code in the patch is good, but I wonder about the right
> > way to deal with the changed pixel ordering following a flip/mirror.
> > None of the other Omnivision sensor drivers I've looked at disallow
> > a flip/mirror whilst streaming, but of course doing so wrecks the
> > colours. I don't think that there's any reason we couldn't make the
> > equivalent calculation to ov2680_set_bayer_order() within libcamera
> > though and configure the ipu3-imgu appropriately, and so properly
> > support a flip-whilst-streaming...but quite possibly I'm missing
> > something. So I'm leaning towards "let's just drop the is_streaming
> > check", but I'm interested in what everyone else thinks.
> 
> So the story wrt flipping on the ov2680 is complicated.

The story of flipping is complicated, period :-)

We made a mistake in V4L2 when adding support for Bayer formats. We
should have created RAW{8,10,12,...} media bus codes and pixel formats,
regardless of the CFA pattern, and conveyed the pattern information
out-of-band. This would have allowed changing the CFA pattern during
streaming.

As a result of this bad decision, various sensor drivers have decided to
move the crop rectangle by one pixel when flipping, in order to preserve
the CFA pattern. In some cases, this crop rectangle adjustement is even
performed by the camera sensor itself (and I've seen OV sensors where
this behaviour is configurable, you can disable the auto-adjustment
through a register). Other drivers change their reported CFA pattern
when flipping, and disable flipping changes during streaming.

TL;DR: It's a mess. It's probably not too late to fix that, and move
towards RAW media bus codes, but it won't be easy.

> I have done quite a bit
> of testing wrt the flipping with the atomisp-ov2680.c version of the code and
> I have made the following observations:
> 
> 1. By default the ISP window is set to auto which means the ISP will set it so that
> the bayer order does NOT change when flipping. Except when trying to use the full
> native sensor resolution because then the ISP has no "room" to adjust the window to
> fixup the bayer order. So the whole ov2680_set_bayer_order() helper is only relevant
> when either using manual ISP settings or when using the full native resolution.
> Note the ISP here is the sensor's internal ISP (which has very little functionality
> on the ov2680).
> 
> 2. Independent of auto vs manual ISP window settings changing flipping during mid
> stream does not work. Instead of the colors getting messed up the sensor simply just
> stops streaming when changing the flipping mid stream.
> 
> Because of 2. I have decided to keep ov2680_set_bayer_order() and add support
> for manually setting the ISP window so that the full native size can be used.
> 
> Having the full native size available is important for the atomisp ISP since
> that expects the resolution outputted by the sensor to have some padding
> (minimum 12 / 14 pixels depending on bayer order) vs the resolution being
> output to userspace.
> 
> Manually setting the ISP window makes things actually work as the code
> expected before doing this (the manually setting the ISP window is also done
> in the commit adding the mode-dependent registers calculation).
> 
> 2. Also means we need to keep the is_streaming checks. Changing flipping
> while streaming simply does not work on this sensor (or at least I don't know
> how to make it work).
> 
> As Sakari already mentioned it seems that the current mainline driver has
> not seen much testing of things like the flip controls.
> 
> >> for a nice code cleanup.
> >>
> >> Fixes: 3ee47cad3e69 ("media: ov2680: Add Omnivision OV2680 sensor driver")
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>   drivers/media/i2c/ov2680.c | 48 +++++++++-----------------------------
> >>   1 file changed, 11 insertions(+), 37 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> >> index 9a9c90c8a949..c1b23c5b7818 100644
> >> --- a/drivers/media/i2c/ov2680.c
> >> +++ b/drivers/media/i2c/ov2680.c
> >> @@ -328,11 +328,14 @@ static void ov2680_set_bayer_order(struct ov2680_dev *sensor)
> >>       sensor->fmt.code = ov2680_hv_flip_bayer_order[hv_flip];
> >>   }
> >>   -static int ov2680_vflip_enable(struct ov2680_dev *sensor)
> >> +static int ov2680_set_vflip(struct ov2680_dev *sensor, s32 val)
> >>   {
> >>       int ret;
> >>   -    ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT1, BIT(2), BIT(2));
> >> +    if (sensor->is_streaming)
> >> +        return -EBUSY;
> >> +
> >> +    ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT1, BIT(2), val ? BIT(2) : 0);
> >>       if (ret < 0)
> >>           return ret;
> >>   @@ -340,33 +343,14 @@ static int ov2680_vflip_enable(struct ov2680_dev *sensor)
> >>       return 0;
> >>   }
> >>   -static int ov2680_vflip_disable(struct ov2680_dev *sensor)
> >> +static int ov2680_set_hflip(struct ov2680_dev *sensor, s32 val)
> >>   {
> >>       int ret;
> >>   -    ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT1, BIT(2), BIT(0));
> >> -    if (ret < 0)
> >> -        return ret;
> >> +    if (sensor->is_streaming)
> >> +        return -EBUSY;
> >>   -    return ov2680_bayer_order(sensor);
> >> -}
> >> -
> >> -static int ov2680_hflip_enable(struct ov2680_dev *sensor)
> >> -{
> >> -    int ret;
> >> -
> >> -    ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT2, BIT(2), BIT(2));
> >> -    if (ret < 0)
> >> -        return ret;
> >> -
> >> -    return ov2680_bayer_order(sensor);
> >> -}
> >> -
> >> -static int ov2680_hflip_disable(struct ov2680_dev *sensor)
> >> -{
> >> -    int ret;
> >> -
> >> -    ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT2, BIT(2), BIT(0));
> >> +    ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT2, BIT(2), val ? BIT(2) : 0);
> >>       if (ret < 0)
> >>           return ret;
> >>   @@ -719,19 +703,9 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
> >>       case V4L2_CID_EXPOSURE:
> >>           return ov2680_exposure_set(sensor, ctrl->val);
> >>       case V4L2_CID_VFLIP:
> >> -        if (sensor->is_streaming)
> >> -            return -EBUSY;
> >> -        if (ctrl->val)
> >> -            return ov2680_vflip_enable(sensor);
> >> -        else
> >> -            return ov2680_vflip_disable(sensor);
> >> +        return ov2680_set_vflip(sensor, ctrl->val);
> >>       case V4L2_CID_HFLIP:
> >> -        if (sensor->is_streaming)
> >> -            return -EBUSY;
> >> -        if (ctrl->val)
> >> -            return ov2680_hflip_enable(sensor);
> >> -        else
> >> -            return ov2680_hflip_disable(sensor);
> >> +        return ov2680_set_hflip(sensor, ctrl->val);
> >>       case V4L2_CID_TEST_PATTERN:
> >>           return ov2680_test_pattern_set(sensor, ctrl->val);
> >>       default:

-- 
Regards,

Laurent Pinchart
