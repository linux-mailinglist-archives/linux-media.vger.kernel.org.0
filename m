Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED07206E9E
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 10:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388818AbgFXIHp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 04:07:45 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:42289 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387732AbgFXIHo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 04:07:44 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 9C81CE0009;
        Wed, 24 Jun 2020 08:07:38 +0000 (UTC)
Date:   Wed, 24 Jun 2020 10:11:06 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 03/10] media: i2c: ov6650: Use new
 [get|set]_mbus_config ops
Message-ID: <20200624081106.njf535vhbwb3fhwk@uno.localdomain>
References: <20200616141244.49407-1-jacopo+renesas@jmondi.org>
 <20200616141244.49407-4-jacopo+renesas@jmondi.org>
 <1837100.yKVeVyVuyW@z50>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1837100.yKVeVyVuyW@z50>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Janusz,
   thanks for your quick reply

On Sun, Jun 21, 2020 at 01:38:46PM +0200, Janusz Krzysztofik wrote:
> Hi Jacopo,
>
> Thanks for bringing my attention to this patch.
>
> On Tuesday, June 16, 2020 4:12:38 P.M. CEST Jacopo Mondi wrote:
> > Use the new get_mbus_config and set_mbus_config pad operations in place
> > of the video operations currently in use.
> >
> > Compared to other drivers where the same conversion has been performed,
> > ov6650 proved to be a bit more tricky, as the existing g_mbus_config
> > implementation did not report the currently applied configuration but
> > the set of all possible configuration options.
>
> Assuming that was in line with officially supported semantics of the old API,
> not a misinterpretation, I would really like to see that limitation of the new
> API actually compensated with V4L2_SUBDEV_FORMAT_TRY support added to it.
>

I'm not sure this is a limitation, it's more by design that the new
get_mbus_config() only reports the current configuration.

To be honest, compared to the other users of the old g_mbus_config()
this driver was the only one implementing the operation in this way,
maybe as it's the sole user of s_mbus_config() left out of staging ?

I would however consider supporting FORMAT_TRY even if I'm not
actually sure if fully makes sense. For the format operations
(get/set_format()) FORMAT_TRY is used for concurrent applications to
test a format without stepping on each other toes.
get|set_mbus_config() are kAPI only, and I'm not sure we need to stay
safe against concurrent configuration attempts... I'll think about
this a bit more. Seems a development that could go on top, right ?

> >
> > Adapt the driver to support the semantic of the two newly introducedV4L2_SUBDEV_FORMAT_TRY
> > operations:
> > - get_mbus_config reports the current media bus configuration
> > - set_mbus_config applies only changes explicitly requested and updates
> >   the provided cfg parameter to report what has actually been applied to
> >   the hardware.
> >
> > Compile-tested only.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/i2c/ov6650.c | 56 ++++++++++++++++++++++++++------------
> >  1 file changed, 39 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
> > index 91906b94f978..d2e7a8556ed7 100644
> > --- a/drivers/media/i2c/ov6650.c
> > +++ b/drivers/media/i2c/ov6650.c
> > @@ -921,46 +921,68 @@ static const struct v4l2_subdev_core_ops ov6650_core_ops = {
> >  };
> >
> >  /* Request bus settings on camera side */
> > -static int ov6650_g_mbus_config(struct v4l2_subdev *sd,
> > -				struct v4l2_mbus_config *cfg)
> > +static int ov6650_get_mbus_config(struct v4l2_subdev *sd,
> > +				  unsigned int pad,
> > +				  struct v4l2_mbus_config *cfg)
> >  {
> > +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> > +	u8 comj, comf;
> > +	int ret;
> > +
> > +	ret = ov6650_reg_read(client, REG_COMJ, &comj);
> > +	if (ret)
> > +		return ret;
> >
> > -	cfg->flags = V4L2_MBUS_MASTER |
> > -		V4L2_MBUS_PCLK_SAMPLE_RISING | V4L2_MBUS_PCLK_SAMPLE_FALLING |
> > -		V4L2_MBUS_HSYNC_ACTIVE_HIGH | V4L2_MBUS_HSYNC_ACTIVE_LOW |
> > -		V4L2_MBUS_VSYNC_ACTIVE_HIGH | V4L2_MBUS_VSYNC_ACTIVE_LOW |
> > -		V4L2_MBUS_DATA_ACTIVE_HIGH;
> > +	ret = ov6650_reg_read(client, REG_COMF, &comf);
> > +	if (ret)
> > +		return ret;
> > +
> > +	cfg->flags = V4L2_MBUS_MASTER
> > +		   | ((comj & COMJ_VSYNC_HIGH)  ? V4L2_MBUS_VSYNC_ACTIVE_HIGH
> > +						: V4L2_MBUS_VSYNC_ACTIVE_LOW)
> > +		   | ((comf & COMF_HREF_LOW)    ? V4L2_MBUS_HSYNC_ACTIVE_LOW
> > +						: V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> > +		   | ((comj & COMJ_PCLK_RISING) ? V4L2_MBUS_PCLK_SAMPLE_RISING
> > +						: V4L2_MBUS_PCLK_SAMPLE_FALLING);
>
> You probably missed hardware default V4L2_MBUS_DATA_ACTIVE_HIGH.
>

Indeed I did :/

Thanks for spotting

> >  	cfg->type = V4L2_MBUS_PARALLEL;
> >
> >  	return 0;
> >  }
> >
> >  /* Alter bus settings on camera side */
> > -static int ov6650_s_mbus_config(struct v4l2_subdev *sd,
> > -				const struct v4l2_mbus_config *cfg)
> > +static int ov6650_set_mbus_config(struct v4l2_subdev *sd,
> > +				  unsigned int pad,
> > +				  struct v4l2_mbus_config *cfg)
> >  {
> >  	struct i2c_client *client = v4l2_get_subdevdata(sd);
> > -	int ret;
> > +	int ret = 0;
> >
> >  	if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> >  		ret = ov6650_reg_rmw(client, REG_COMJ, COMJ_PCLK_RISING, 0);
> > -	else
> > +	else if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
>
> Have you thought of extending v4l2_subdev_call_pad_wrappers with a check for
> only one of mutually exclusive flags specified by user?
>

Good question, but I wonder if this shouldn't be an accepted
behaviour. The caller can provide all settings it want to allow the
callee to chose which one to apply. The operation returns what has
been actually applied by the callee, so that the caller can adjust
itself to what the callee chose.

Alternatively, it's up to the caller to specify its preference without
mutually exclusive options, and the callee tries to adjust to what has
been requested. Also in this case the operation returns what has
actually been applied, so the caller can later adjust if it could.

Seems like a small difference, but it might be good to exapnd the
operations description to describe this to avoid each single
implementer going in slightly different directions ?

> >  		ret = ov6650_reg_rmw(client, REG_COMJ, 0, COMJ_PCLK_RISING);
> >  	if (ret)
> > -		return ret;
> > +		goto error;
> >
> >  	if (cfg->flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
> >  		ret = ov6650_reg_rmw(client, REG_COMF, COMF_HREF_LOW, 0);
> > -	else
> > +	else if (cfg->flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> >  		ret = ov6650_reg_rmw(client, REG_COMF, 0, COMF_HREF_LOW);
> >  	if (ret)
> > -		return ret;
> > +		goto error;
> >
> >  	if (cfg->flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
> >  		ret = ov6650_reg_rmw(client, REG_COMJ, COMJ_VSYNC_HIGH, 0);
> > -	else
> > +	else if (cfg->flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> >  		ret = ov6650_reg_rmw(client, REG_COMJ, 0, COMJ_VSYNC_HIGH);
> >
> > +error:
> > +	/*
> > +	 * Update the configuration to report what is actually applied to
> > +	 * the hardware.
> > +	 */
> > +	ov6650_get_mbus_config(sd, pad, cfg);
>
> Populating cfg->flags by ov6650_get_mbus_config() without checking for a
> potential error it may return can result in invalid data silently returned to
> user.  Maybe it would be better to fetch current hardware status first, fail on
> error, then update the result with successfully performed hardware state
> modifications.

I'm not sure I got what you mean 8)

Would if be enough to check for the return value of
ov6650_get_mbus_config() (or actually returning it directly at the end
of this function).

Thanks
   j

>
> Thanks,
> Janusz
>
> > +
> >  	return ret;
> >  }
> >
> > @@ -968,8 +990,6 @@ static const struct v4l2_subdev_video_ops ov6650_video_ops = {
> >  	.s_stream	= ov6650_s_stream,
> >  	.g_frame_interval = ov6650_g_frame_interval,
> >  	.s_frame_interval = ov6650_s_frame_interval,
> > -	.g_mbus_config	= ov6650_g_mbus_config,
> > -	.s_mbus_config	= ov6650_s_mbus_config,
> >  };
> >
> >  static const struct v4l2_subdev_pad_ops ov6650_pad_ops = {
> > @@ -978,6 +998,8 @@ static const struct v4l2_subdev_pad_ops ov6650_pad_ops = {
> >  	.set_selection	= ov6650_set_selection,
> >  	.get_fmt	= ov6650_get_fmt,
> >  	.set_fmt	= ov6650_set_fmt,
> > +	.get_mbus_config = ov6650_get_mbus_config,
> > +	.set_mbus_config = ov6650_set_mbus_config,
> >  };
> >
> >  static const struct v4l2_subdev_ops ov6650_subdev_ops = {
> >
>
>
>
>
