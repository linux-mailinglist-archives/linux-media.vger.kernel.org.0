Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4FFC2F277B
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 06:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbhALFEi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 00:04:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbhALFEi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 00:04:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8604C061575;
        Mon, 11 Jan 2021 21:03:57 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3FD843E;
        Tue, 12 Jan 2021 06:03:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610427836;
        bh=U3CevzdoTdtXaFu4sGTrYB1yTAhMQ5L12XCm1hJWmJc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rS62t8sruwohGJTnDBdaL4QJPskoO4XrYQzjhOa9Q1ceJqc+URe8pBstARaUr0/Yq
         4gjbkBSJE2gtrULVPWvzpxDpchvr1IEPbbNQBAM3pa/N324kyF97PlTJVh4om3nZTd
         etlOh7U11DtBPKlr2tMINzbdXJu9JXuESbNgzj/4=
Date:   Tue, 12 Jan 2021 07:03:42 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com
Subject: Re: [PATCH v6 5/5] media: i2c: max9286: Configure reverse channel
 amplitude
Message-ID: <X/0triYZZJiXaf07@pendragon.ideasonboard.com>
References: <20201215170957.92761-1-jacopo+renesas@jmondi.org>
 <20201215170957.92761-6-jacopo+renesas@jmondi.org>
 <X9pCSfxE722rnPHE@pendragon.ideasonboard.com>
 <20210111104311.e6nyxhzhvlyjjxxw@uno.localdomain>
 <X/wvc26LXz2VsCkp@pendragon.ideasonboard.com>
 <20210111112023.brrhxgfedo5fer53@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210111112023.brrhxgfedo5fer53@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Jan 11, 2021 at 12:20:23PM +0100, Jacopo Mondi wrote:
> On Mon, Jan 11, 2021 at 12:58:59PM +0200, Laurent Pinchart wrote:
> > On Mon, Jan 11, 2021 at 11:43:11AM +0100, Jacopo Mondi wrote:
> >> On Wed, Dec 16, 2020 at 07:22:17PM +0200, Laurent Pinchart wrote:
> >>> On Tue, Dec 15, 2020 at 06:09:57PM +0100, Jacopo Mondi wrote:
> >>>> Adjust the initial reverse channel amplitude parsing from
> >>>> firmware interface the 'maxim,reverse-channel-microvolt'
> >>>> property.
> >>>>
> >>>> This change is required for both rdacm20 and rdacm21 camera
> >>>> modules to be correctly probed when used in combination with
> >>>> the max9286 deserializer.
> >>>>
> >>>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >>>> ---
> >>>>  drivers/media/i2c/max9286.c | 23 ++++++++++++++++++++++-
> >>>>  1 file changed, 22 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> >>>> index 021309c6dd6f..9b40a4890c4d 100644
> >>>> --- a/drivers/media/i2c/max9286.c
> >>>> +++ b/drivers/media/i2c/max9286.c
> >>>> @@ -163,6 +163,8 @@ struct max9286_priv {
> >>>>  	unsigned int mux_channel;
> >>>>  	bool mux_open;
> >>>>
> >>>> +	u32 reverse_channel_mv;
> >>>> +
> >>>>  	struct v4l2_ctrl_handler ctrls;
> >>>>  	struct v4l2_ctrl *pixelrate;
> >>>>
> >>>> @@ -557,10 +559,14 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
> >>>>  	 * All enabled sources have probed and enabled their reverse control
> >>>>  	 * channels:
> >>>>  	 *
> >>>> +	 * - Increase the reverse channel amplitude to compensate for the
> >>>> +	 *   remote ends high threshold, if not done already
> >>>>  	 * - Verify all configuration links are properly detected
> >>>>  	 * - Disable auto-ack as communication on the control channel are now
> >>>>  	 *   stable.
> >>>>  	 */
> >>>> +	if (priv->reverse_channel_mv < 170)
> >>>> +		max9286_reverse_channel_setup(priv, 170);
> >>>
> >>> I'm beginning to wonder if there will be a need in the future to not
> >>> increase the reverse channel amplitude (keeping the threshold low on the
> >>> remote side). An increased amplitude increases power consumption, and if
> >>> the environment isn't noisy, a low amplitude would work. The device tree
> >>> would then need to specify both the initial amplitude required by the
> >>> remote side, and the desired amplitude after initialization. What do you
> >>> think ? Is it overkill ? We don't have to implement this now, so
> >>>
> >>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>
> >>> but if this feature could be required later, we may want to take into
> >>> account in the naming of the new DT property to reflect the fact that it
> >>> is the initial value.
> >>
> >> I had the same thought when I initially proposed
> >> "maxim,initial-reverse-channel-mV"
> >>
> >> Having to use the standard unit suffix that would have become
> >> "maxim,initial-reverse-channel-microvolt"
> >> which is extremely long.
> >>
> >> I can't tell if there will be any need to adjust the amplitude later.
> >> In any case, I would not rely on a DTS property to do so, as once we
> >> have probed the remote we have a subdev where to call
> >> 'get_mbus_config()' on, and from there we can report the high threshold
> >> status of the serializer and adjust the deser amplitude accordingly.
> >
> > I don't think that's the point. The threshold of the serializer is
> > something we can configure at runtime. What voltage level to use after
> 
> How so ? I mean, we can add an API for this, but currently it's
> configured at probe time and that's it. Its configuration might as
> well come from a DT property like we do on the deserializer here but I
> fail to see why it's different. Both settings depends on the required
> noise immunity of th system.

The voltage level configuration need to match between the tserializer
(transmitter) and the deserializer (receiver). The serializer is
configured with a voltage level, and the deserializer needs to be
configured with a corresponding threshold.

The voltage level of the serializer is configurable on the camera side
when the system is powered up. The RDACM20 has a microcontroller which
can configure the serializer, and other cameras may have similar
mechanisms. As the deserializer can't query the information from the
serializer (communication is unreliable if the threshold has an
incorrect value), we need a DT property to tell the deserializer what
threshold is initially used by the camera when it gets powered up.

This only covers initialization. A camera could boot up with a low
voltage level, but we may want to increase the voltage level (and thus
the threshold on the deserializer side) to increase noise immunity. Or,
if the system environment isn't noisy, we may want to keep a low voltage
level, or even decrease it if the camera boots up with a high voltage
level. This runtime voltage level depends on the system design and its
susceptibility to noise, and is thus a system property. Should we want
to make it configurable, it should be specified in DT, and it's separate
from the initial voltage level that is used to establish communication.

> > initialization time is a system property as it depends on noise
> > immunity, so we'll have to specify it in DT.
> 
> I don't see it differently than what happens on the serializer. We can
> add an API if we want to, but it's configured at probe time (initial
> value) and later can be adjusted in reponse to the serializer
> configuration setting.
> 
> I feel like we're on different pages :/
> 
> >> The property documentation clearly says the there specified amplitude
> >> is 'initial' many times, so I don't think it is strictly necessary to
> >> report it in the name too.
> >>
> >> Would this work for you ?
> >
> > I don't mind either way.
> >
> >>>>  	max9286_check_config_link(priv, priv->source_mask);
> >>>>
> >>>>  	/*
> >>>> @@ -967,7 +973,7 @@ static int max9286_setup(struct max9286_priv *priv)
> >>>>  	 * only. This should be disabled after the mux is initialised.
> >>>>  	 */
> >>>>  	max9286_configure_i2c(priv, true);
> >>>> -	max9286_reverse_channel_setup(priv, 170);
> >>>> +	max9286_reverse_channel_setup(priv, priv->reverse_channel_mv);
> >>>>
> >>>>  	/*
> >>>>  	 * Enable GMSL links, mask unused ones and autodetect link
> >>>> @@ -1131,6 +1137,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
> >>>>  	struct device_node *i2c_mux;
> >>>>  	struct device_node *node = NULL;
> >>>>  	unsigned int i2c_mux_mask = 0;
> >>>> +	u32 reverse_channel_microvolt;
> >>>>
> >>>>  	/* Balance the of_node_put() performed by of_find_node_by_name(). */
> >>>>  	of_node_get(dev->of_node);
> >>>> @@ -1221,6 +1228,20 @@ static int max9286_parse_dt(struct max9286_priv *priv)
> >>>>  	}
> >>>>  	of_node_put(node);
> >>>>
> >>>> +	/*
> >>>> +	 * Parse the initial value of the reverse channel amplitude from
> >>>> +	 * the firmware interface and convert it to millivolts.
> >>>> +	 *
> >>>> +	 * Default it to 170mV for backward compatibility with DTBs that do not
> >>>> +	 * provide the property.
> >>>> +	 */
> >>>> +	if (of_property_read_u32(dev->of_node,
> >>>> +				 "maxim,reverse-channel-microvolt",
> >>>> +				 &reverse_channel_microvolt))
> >>>> +		priv->reverse_channel_mv = 170;
> >>>> +	else
> >>>> +		priv->reverse_channel_mv = reverse_channel_microvolt / 1000U;
> >>>> +
> >>>>  	priv->route_mask = priv->source_mask;
> >>>>
> >>>>  	return 0;

-- 
Regards,

Laurent Pinchart
