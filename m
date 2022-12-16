Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84D3664EC7C
	for <lists+linux-media@lfdr.de>; Fri, 16 Dec 2022 14:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230451AbiLPN7K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Dec 2022 08:59:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbiLPN7J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Dec 2022 08:59:09 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91CE020BE1;
        Fri, 16 Dec 2022 05:59:08 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A8F4A31;
        Fri, 16 Dec 2022 14:59:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671199146;
        bh=Vo7IZZjPPcmZJFIS4YMS5XdgYx17b6Gzvys3lWpbMrU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a9WPBavW8R3xY6xTADXyzRb4sOp+83CRi1Ntwke0JLg8ZjzSP7a8M13C8bGtv6Kzp
         K39OiKr8Kx5byaEHTsI3w26HWqp8SPJslEFaMAnXIKH74JRE7ksJTReMCh42hylmwJ
         yNLp1SiQg7UnVlLun9UZBvtRlR4EvHVbdseUjprQ=
Date:   Fri, 16 Dec 2022 15:59:02 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Yao Hao <yao.hao@intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 06/11] v4l: subdev: Make the v4l2-subdev core code
 enable/disable the privacy LED if present
Message-ID: <Y5x5pnI6SPlptl7t@pendragon.ideasonboard.com>
References: <20221216113013.126881-1-hdegoede@redhat.com>
 <20221216113013.126881-7-hdegoede@redhat.com>
 <Y5x5D4kTnEpcHzsT@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y5x5D4kTnEpcHzsT@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 16, 2022 at 03:56:33PM +0200, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Fri, Dec 16, 2022 at 12:30:08PM +0100, Hans de Goede wrote:
> > Extend the call_s_stream() wrapper to enable/disable sensor privacy LEDs
> > for sensors with a privacy LED, rather then having to duplicate this code
> > in all the sensor drivers.
> > 
> > Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 40 +++++++++++++++++++++++++++
> >  include/media/v4l2-subdev.h           |  3 ++
> >  2 files changed, 43 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 4988a25bd8f4..7344f6cd58b7 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -318,10 +318,44 @@ static int call_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
> >  	       sd->ops->pad->get_mbus_config(sd, pad, config);
> >  }
> >  
> > +#if IS_REACHABLE(CONFIG_LEDS_CLASS)
> > +#include <linux/leds.h>
> 
> Can this be moved to the top of the file ? It doesn't have to be
> conditionally compiled there.
> 
> > +
> > +static void call_s_stream_update_pled(struct v4l2_subdev *sd, int enable)
> > +{
> > +	if (!sd->dev)
> > +		return;
> > +
> > +	/* Try to get privacy-led once, at first s_stream() */
> > +	if (!sd->privacy_led)
> > +		sd->privacy_led = led_get(sd->dev, "privacy-led");
> 
> I'm not sure I like this much. If the LED provider isn't available
> (yet), the LED will stay off. That's a privacy concern.
> 
> > +
> > +	if (IS_ERR(sd->privacy_led))
> > +		return;
> > +
> > +	mutex_lock(&sd->privacy_led->led_access);
> > +
> > +	if (enable) {
> > +		led_sysfs_disable(sd->privacy_led);
> > +		led_trigger_remove(sd->privacy_led);
> > +		led_set_brightness(sd->privacy_led, sd->privacy_led->max_brightness);
> > +	} else {
> > +		led_set_brightness(sd->privacy_led, 0);
> > +		led_sysfs_enable(sd->privacy_led);
> 
> I don't think you should reenable control through sysfs here. I don't
> really see a use case, and you've removed the trigger anyway, so the
> behaviour would be quite inconsistent.

Also, I think it would be better if the LED device was marked as "no
sysfs" when it is registered.

> > +	}
> > +
> > +	mutex_unlock(&sd->privacy_led->led_access);
> > +}
> > +#else
> > +static void call_s_stream_update_pled(struct v4l2_subdev *sd, int enable) {}
> > +#endif
> > +
> >  static int call_s_stream(struct v4l2_subdev *sd, int enable)
> >  {
> >  	int ret;
> >  
> > +	call_s_stream_update_pled(sd, enable);
> > +
> >  	ret = sd->ops->video->s_stream(sd, enable);
> >  
> >  	if (!enable && ret < 0) {
> 
> You need to turn the LED off when enabling if .s_stream() fails.
> 
> > @@ -1050,6 +1084,11 @@ EXPORT_SYMBOL_GPL(__v4l2_subdev_init_finalize);
> >  
> >  void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
> >  {
> > +#if IS_REACHABLE(CONFIG_LEDS_CLASS)
> > +	if (!IS_ERR_OR_NULL(sd->privacy_led))
> > +		led_put(sd->privacy_led);
> > +#endif
> > +
> >  	__v4l2_subdev_state_free(sd->active_state);
> >  	sd->active_state = NULL;
> >  }
> > @@ -1090,6 +1129,7 @@ void v4l2_subdev_init(struct v4l2_subdev *sd, const struct v4l2_subdev_ops *ops)
> >  	sd->grp_id = 0;
> >  	sd->dev_priv = NULL;
> >  	sd->host_priv = NULL;
> > +	sd->privacy_led = NULL;
> >  #if defined(CONFIG_MEDIA_CONTROLLER)
> >  	sd->entity.name = sd->name;
> >  	sd->entity.obj_type = MEDIA_ENTITY_TYPE_V4L2_SUBDEV;
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index b15fa9930f30..0547313f98cc 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -38,6 +38,7 @@ struct v4l2_subdev;
> >  struct v4l2_subdev_fh;
> >  struct tuner_setup;
> >  struct v4l2_mbus_frame_desc;
> > +struct led_classdev;
> >  
> >  /**
> >   * struct v4l2_decode_vbi_line - used to decode_vbi_line
> > @@ -982,6 +983,8 @@ struct v4l2_subdev {
> >  	 * appropriate functions.
> >  	 */
> >  
> > +	struct led_classdev *privacy_led;
> > +
> >  	/*
> >  	 * TODO: active_state should most likely be changed from a pointer to an
> >  	 * embedded field. For the time being it's kept as a pointer to more

-- 
Regards,

Laurent Pinchart
