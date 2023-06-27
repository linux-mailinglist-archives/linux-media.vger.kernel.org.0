Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25DB873FF26
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 17:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231421AbjF0PBJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 11:01:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbjF0PBI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 11:01:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 023B012C
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 08:01:07 -0700 (PDT)
Received: from ideasonboard.com (unknown [193.85.242.128])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D609556;
        Tue, 27 Jun 2023 17:00:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687878026;
        bh=g1ZpkwL1q/1fbrCfaaBK0VDzIeV5fF4w7xiRqlFM1N8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Agw+3IK0eZydX0YVrdJq8ZtjYkB3zKlAjrAoTmUq+wJ7o8A6QMXEejx++RTK46SK7
         /wb/lIq8u0jW15jO/n5r1ASAZLoThMkMCZjHXUANOSj+yG45M/izYx9/M1Ha3Nhjl0
         TRBydB05rcvd/kugGDjrC+Z2bewSbEXC70GaO5vM=
Date:   Tue, 27 Jun 2023 17:01:02 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 03/29] media: ov2680: Fix vflip / hflip set functions
Message-ID: <snkf7qpunhhfosb7l5c2roihrrhmoy6b3kh774vkthygupeixp@ijgcl62d6cnv>
References: <20230627131830.54601-1-hdegoede@redhat.com>
 <20230627131830.54601-4-hdegoede@redhat.com>
 <swuf2k4tatjfsjjta2ul36ph7xncs3l5vq2jby4hf2zww3s4k5@6lqbvl2vkxkc>
 <16943f0e-c00f-92c8-d29b-4fa3708e7ef8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <16943f0e-c00f-92c8-d29b-4fa3708e7ef8@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On Tue, Jun 27, 2023 at 04:38:50PM +0200, Hans de Goede wrote:
> Hi Jacopo,
>
> On 6/27/23 16:35, Jacopo Mondi wrote:
> > Hi Hans
> >
> > On Tue, Jun 27, 2023 at 03:18:04PM +0200, Hans de Goede wrote:
> >> ov2680_vflip_disable() / ov2680_hflip_disable() pass BIT(0) instead of
> >> 0 as value to ov2680_mod_reg().
> >>
> >> While fixing this also:
> >>
> >> 1. Stop having separate enable/disable functions for hflip / vflip
> >> 2. Move the is_streaming check, which is unique to hflip / vflip
> >>    into the ov2680_set_?flip() functions.
> >
> > The patch looks good, but one little question on the controls update
> > procedure.
> >
> > Usually s_ctrl() handlers checks for the sensor power state, like the
> > driver here is already doing by testing the is_enabled[*] flag, but they
> > usually call __v4l2_ctrl_handler_setup() unconditionally at
> > s_stream(1) time, not only if a new mode has been applied by calling
> > s_fmt(). Controls could be updated by userspace while the sensor is
> > powered off, and new values should be applied regardless if a new mode,
> > has been applied or not.
> >
> > Does it make sense to you ?
> >
> > [*] or better, if the sensor is ported to use pm_runtime first (by
> > dropping support for the deprecated .s_power(), or do you need
> > s_power() on your platform ?) you can use pm_runtime_get_if_in_use()
> > instead of keeping track manually of the is_enabled flag.
>
> What you are describing above is pretty much exactly what is done
> later in this patchset.
>
> Patches 1-8 are there to fix some glaring bugs, with the possibility
> of backporting the fixes which is why they are the first patches
> in the set.
>
> Then after patch 9 the real work to get this driver into shape begins :)

Now that I see "media: ov2680: Add runtime-pm support" in the series
it all makes sense :)

Thanks and sorry for the noise!

(not adding my redundant tags, just skimming through the patches)

>
> Regards,
>
> Hans
>
>
>
>
>
> >> for a nice code cleanup.
> >>
> >> Fixes: 3ee47cad3e69 ("media: ov2680: Add Omnivision OV2680 sensor driver")
> >> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> >> Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>  drivers/media/i2c/ov2680.c | 50 ++++++++++----------------------------
> >>  1 file changed, 13 insertions(+), 37 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> >> index 2001e08253ef..c93810f84ed7 100644
> >> --- a/drivers/media/i2c/ov2680.c
> >> +++ b/drivers/media/i2c/ov2680.c
> >> @@ -328,11 +328,15 @@ static void ov2680_set_bayer_order(struct ov2680_dev *sensor)
> >>  	sensor->fmt.code = ov2680_hv_flip_bayer_order[hv_flip];
> >>  }
> >>
> >> -static int ov2680_vflip_enable(struct ov2680_dev *sensor)
> >> +static int ov2680_set_vflip(struct ov2680_dev *sensor, s32 val)
> >>  {
> >>  	int ret;
> >>
> >> -	ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT1, BIT(2), BIT(2));
> >> +	if (sensor->is_streaming)
> >> +		return -EBUSY;
> >> +
> >> +	ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT1,
> >> +			     BIT(2), val ? BIT(2) : 0);
> >>  	if (ret < 0)
> >>  		return ret;
> >>
> >> @@ -340,33 +344,15 @@ static int ov2680_vflip_enable(struct ov2680_dev *sensor)
> >>  	return 0;
> >>  }
> >>
> >> -static int ov2680_vflip_disable(struct ov2680_dev *sensor)
> >> +static int ov2680_set_hflip(struct ov2680_dev *sensor, s32 val)
> >>  {
> >>  	int ret;
> >>
> >> -	ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT1, BIT(2), BIT(0));
> >> -	if (ret < 0)
> >> -		return ret;
> >> +	if (sensor->is_streaming)
> >> +		return -EBUSY;
> >>
> >> -	return ov2680_bayer_order(sensor);
> >> -}
> >> -
> >> -static int ov2680_hflip_enable(struct ov2680_dev *sensor)
> >> -{
> >> -	int ret;
> >> -
> >> -	ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT2, BIT(2), BIT(2));
> >> -	if (ret < 0)
> >> -		return ret;
> >> -
> >> -	return ov2680_bayer_order(sensor);
> >> -}
> >> -
> >> -static int ov2680_hflip_disable(struct ov2680_dev *sensor)
> >> -{
> >> -	int ret;
> >> -
> >> -	ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT2, BIT(2), BIT(0));
> >> +	ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT2,
> >> +			     BIT(2), val ? BIT(2) : 0);
> >>  	if (ret < 0)
> >>  		return ret;
> >>
> >> @@ -720,19 +706,9 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
> >>  	case V4L2_CID_EXPOSURE:
> >>  		return ov2680_exposure_set(sensor, ctrl->val);
> >>  	case V4L2_CID_VFLIP:
> >> -		if (sensor->is_streaming)
> >> -			return -EBUSY;
> >> -		if (ctrl->val)
> >> -			return ov2680_vflip_enable(sensor);
> >> -		else
> >> -			return ov2680_vflip_disable(sensor);
> >> +		return ov2680_set_vflip(sensor, ctrl->val);
> >>  	case V4L2_CID_HFLIP:
> >> -		if (sensor->is_streaming)
> >> -			return -EBUSY;
> >> -		if (ctrl->val)
> >> -			return ov2680_hflip_enable(sensor);
> >> -		else
> >> -			return ov2680_hflip_disable(sensor);
> >> +		return ov2680_set_hflip(sensor, ctrl->val);
> >>  	case V4L2_CID_TEST_PATTERN:
> >>  		return ov2680_test_pattern_set(sensor, ctrl->val);
> >>  	default:
> >> --
> >> 2.41.0
> >>
> >
>
