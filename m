Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D55228FF8D
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 09:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404903AbgJPHyp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 03:54:45 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:57869 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404864AbgJPHyp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 03:54:45 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id B3E9760003;
        Fri, 16 Oct 2020 07:54:40 +0000 (UTC)
Date:   Fri, 16 Oct 2020 11:54:25 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v2 5/7] media: i2c: max9286: Configure reverse channel
 amplitude
Message-ID: <20201016095425.ywmxsv5gjhoky7e2@uno.localdomain>
References: <20201015182710.54795-1-jacopo+renesas@jmondi.org>
 <20201015182710.54795-6-jacopo+renesas@jmondi.org>
 <daa257eb-62a7-1996-082b-eecda8251b61@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <daa257eb-62a7-1996-082b-eecda8251b61@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Thu, Oct 15, 2020 at 08:52:01PM +0100, Kieran Bingham wrote:
> Hi Jacopo,
>
> On 15/10/2020 19:27, Jacopo Mondi wrote:
> > Adjust reverse channel amplitude according to the presence of
> > the 'high-threshold" DTS property.
> >
> > If no high threshold compensation is required, start with a low
> > amplitude (100mV) and increase it after the remote serializers
> > have probed and have enabled noise immunity on their reverse
> > channels.
> >
> > If high threshold compensation is required, configure the reverse
> > channel with a 170mV amplitude before the remote serializers have
> > probed.
> >
> > This change is required for both rdacm20 and rdacm21 camera modules
> > to be correctly probed when used in combination with the max9286
> > deserializer.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/i2c/max9286.c | 74 +++++++++++++++++++++++--------------
> >  1 file changed, 47 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > index 163e102199e3..4b59a9e0228a 100644
> > --- a/drivers/media/i2c/max9286.c
> > +++ b/drivers/media/i2c/max9286.c
> > @@ -163,6 +163,8 @@ struct max9286_priv {
> >  	unsigned int mux_channel;
> >  	bool mux_open;
> >
> > +	bool high_threshold;
> > +
> >  	struct v4l2_ctrl_handler ctrls;
> >  	struct v4l2_ctrl *pixelrate;
> >
> > @@ -436,6 +438,32 @@ static int max9286_check_config_link(struct max9286_priv *priv,
> >  	return 0;
> >  }
> >
> > +static void max9286_reverse_channel_setup(struct max9286_priv *priv,
> > +					  unsigned int chan_amplitude)
>
> This looks like you're adding a new function - how about we add this
> function here, in the first place when you add it in 3/7
>

I'll move it up in 3/7

> > +{
> > +	/* Reverse channel transmission time: default to 1. */
> > +	u8 chan_config = MAX9286_REV_TRF(1);
> > +
> > +	/*
> > +	 * Reverse channel setup.
> > +	 *
> > +	 * - Enable custom reverse channel configuration (through register 0x3f)
> > +	 *   and set the first pulse length to 35 clock cycles.
> > +	 * - Adjust reverse channel amplitude: values > 130 are programmed
> > +	 *   using the additional +100mV REV_AMP_X boost flag
> > +	 */
> > +	max9286_write(priv, 0x3f, MAX9286_EN_REV_CFG | MAX9286_REV_FLEN(35));
> > +
> > +	if (chan_amplitude > 100) {
> > +		/* It is not possible express values (100 < x < 130) */
> > +		chan_amplitude = chan_amplitude < 130
> > +			       ? 30 : chan_amplitude - 100;
> > +		chan_config |= MAX9286_REV_AMP_X;
> > +	}
> > +	max9286_write(priv, 0x3b, chan_config | MAX9286_REV_AMP(chan_amplitude));
> > +	usleep_range(2000, 2500);
> > +}
> > +
> >  /* -----------------------------------------------------------------------------
> >   * V4L2 Subdev
> >   */
> > @@ -531,10 +559,14 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
> >  	 * All enabled sources have probed and enabled their reverse control
> >  	 * channels:
> >  	 *
> > +	 * - Increase the reverse channel amplitude to compensate for the
> > +	 *   remote ends high threshold, if not done already
> >  	 * - Verify all configuration links are properly detected
> >  	 * - Disable auto-ack as communication on the control channel are now
> >  	 *   stable.
> >  	 */
> > +	if (!priv->high_threshold)
> > +		max9286_reverse_channel_setup(priv, 170);
>
> is it troublesome to re-set it if it's already set? I guess it's just
> unnecessary. so that's fine.
>
> >  	max9286_check_config_link(priv, priv->source_mask);
> >
> >  	/*
> > @@ -906,32 +938,6 @@ static void max9286_v4l2_unregister(struct max9286_priv *priv)
> >   * Probe/Remove
> >   */
> >
> > -static void max9286_reverse_channel_setup(struct max9286_priv *priv,
> > -					  unsigned int chan_amplitude)
> > -{
> > -	/* Reverse channel transmission time: default to 1. */
> > -	u8 chan_config = MAX9286_REV_TRF(1);
> > -
> > -	/*
> > -	 * Reverse channel setup.
> > -	 *
> > -	 * - Enable custom reverse channel configuration (through register 0x3f)
> > -	 *   and set the first pulse length to 35 clock cycles.
> > -	 * - Adjust reverse channel amplitude: values > 130 are programmed
> > -	 *   using the additional +100mV REV_AMP_X boost flag
> > -	 */
> > -	max9286_write(priv, 0x3f, MAX9286_EN_REV_CFG | MAX9286_REV_FLEN(35));
> > -
> > -	if (chan_amplitude > 100) {
> > -		/* It is not possible express values (100 < x < 130) */
> > -		chan_amplitude = chan_amplitude < 130
> > -			       ? 30 : chan_amplitude - 100;
> > -		chan_config |= MAX9286_REV_AMP_X;
> > -	}
> > -	max9286_write(priv, 0x3b, chan_config | MAX9286_REV_AMP(chan_amplitude));
> > -	usleep_range(2000, 2500);
> > -}
> > -
> >  static int max9286_setup(struct max9286_priv *priv)
> >  {
> >  	/*
> > @@ -967,7 +973,15 @@ static int max9286_setup(struct max9286_priv *priv)
> >  	 * only. This should be disabled after the mux is initialised.
> >  	 */
> >  	max9286_configure_i2c(priv, true);
> > -	max9286_reverse_channel_setup(priv, 170);
> > +
> > +	/*
> > +	 * Compensate the remote end high threshold with a larger channel
> > +	 * amplitude if necessary.
> > +	 */
> > +	if (priv->high_threshold)
> > +		max9286_reverse_channel_setup(priv, 170);
> > +	else
> > +		max9286_reverse_channel_setup(priv, 100);
>
> Hrm... ternery is more concise here, but is it helpful?
>

Ternary is nicer, you're right!

>   max9286_reverse_channel_setup(priv, priv->high_threshold ? 170 : 100);
>
> The high-threshold could also be parsed in
> max9286_reverse_channel_setup(), but I like it being passed in.
>
> >
> >  	/*
> >  	 * Enable GMSL links, mask unused ones and autodetect link
> > @@ -1235,6 +1249,12 @@ static int max9286_parse_dt(struct max9286_priv *priv)
> >  	}
> >  	of_node_put(node);
> >
> > +	/*
> > +	 * Parse 'high_threshold' property to configure the reverse channel
> > +	 * amplitude.
> > +	 */
> > +	priv->high_threshold = device_property_present(dev, "high_threshold");
> > +
>
> Oh, I think I like this, it's a neat way to express what it needs to do
> from the DT depending on the attached cameras.
>
> It's sort of dependant upon the cameras though, I guess making this
> something that we query from the remote endpoint isn't so easy ...?

That's the real question. Is it fair to express as a deserializer
property a setting of the remote serializer(s) ? What if the remotes
have different configurations (we had to play with pre-programmed and
non-pre-programmed RDACM20s in the past iirc).

I've detailed a few possible way forward and their pros and cons in
the v1 cover letter [1] and I'm happy to discuss them as I'm not sure
this is the best possible way forward.

Thanks
  j

[1] For reference: https://www.spinics.net/lists/linux-renesas-soc/msg52886.html

>
>
>
> >  	priv->route_mask = priv->source_mask;
> >
> >  	return 0;
> >
>
