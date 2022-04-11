Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54C864FC2AE
	for <lists+linux-media@lfdr.de>; Mon, 11 Apr 2022 18:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348607AbiDKQtL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Apr 2022 12:49:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237884AbiDKQtJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Apr 2022 12:49:09 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACD69393E2
        for <linux-media@vger.kernel.org>; Mon, 11 Apr 2022 09:46:53 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id DF3121BF206;
        Mon, 11 Apr 2022 16:46:47 +0000 (UTC)
Date:   Mon, 11 Apr 2022 18:46:46 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hugues FRUCHET - FOSS <hugues.fruchet@foss.st.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 06/27] media: ov5640: Update pixel_rate and link_freq
Message-ID: <20220411164646.q6ydhjwiud2tp3mq@uno.localdomain>
References: <20220224094313.233347-1-jacopo@jmondi.org>
 <20220224094313.233347-7-jacopo@jmondi.org>
 <1d891351-3bb5-1c31-9303-1330f28a45ec@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1d891351-3bb5-1c31-9303-1330f28a45ec@foss.st.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues,

On Thu, Apr 07, 2022 at 06:25:57PM +0200, Hugues FRUCHET - FOSS wrote:
> Hi Jacopo,
>
> Issue with link frequency value reported, see below.
>
> On 2/24/22 10:42 AM, Jacopo Mondi wrote:
> > After having set a new format re-calculate the pixel_rate and link_freq
> > control values and update them when in MIPI mode.
> >
> > Take into account the limitation of the link frequency having to be
> > strictly smaller than 1GHz when computing the desired link_freq, and
> > adjust the resulting pixel_rate acounting for the clock tree
> > configuration.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >   drivers/media/i2c/ov5640.c | 66 ++++++++++++++++++++++++++++++++++++--
> >   1 file changed, 64 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index f9763edf2422..791694bfed41 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -31,6 +31,8 @@
> >   #define OV5640_DEFAULT_SLAVE_ID 0x3c
> > +#define OV5640_LINK_RATE_MAX		490000000U
> > +
> >   #define OV5640_REG_SYS_RESET02		0x3002
> >   #define OV5640_REG_SYS_CLOCK_ENABLE02	0x3006
> >   #define OV5640_REG_SYS_CTRL0		0x3008
> > @@ -2412,6 +2414,66 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
> >   	return 0;
> >   }
> > +static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
> > +{
> > +	const struct ov5640_mode_info *mode = sensor->current_mode;
> > +	struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
> > +	enum ov5640_pixel_rate_id pixel_rate_id = mode->pixel_rate;
> > +	unsigned int i = 0;
> > +	u32 pixel_rate;
> > +	s64 link_freq;
> > +	u32 num_lanes;
> > +	u32 bpp;
> > +
> > +	/*
> > +	 * Update the pixel rate control value.
> > +	 *
> > +	 * For DVP mode, maintain the pixel rate calculation using fixed FPS.
> > +	 */
> > +	if (!ov5640_is_csi2(sensor)) {
> > +		__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
> > +					 ov5640_calc_pixel_rate(sensor));
> > +
> > +		return 0;
> > +	}
> > +
> > +	/*
> > +	 * The MIPI CSI-2 link frequency should comply with the CSI-2
> > +	 * specification and be lower than 1GHz.
> > +	 *
> > +	 * Start from the suggested pixel_rate for the current mode and
> > +	 * progressively slow it down if it exceeds 1GHz.
> > +	 */
> > +	num_lanes = sensor->ep.bus.mipi_csi2.num_data_lanes;
> > +	bpp = ov5640_code_to_bpp(fmt->code);
> > +	do {
> > +		pixel_rate = ov5640_pixel_rates[pixel_rate_id];
> > +		link_freq = pixel_rate * bpp / (2 * num_lanes);
> > +	} while (link_freq >= 1000000000U &&
> > +		 ++pixel_rate_id < OV5640_NUM_PIXEL_RATES);
> > +
> > +	/*
> > +	 * Higher link rates require the clock tree to be programmed with
> > +	 * 'mipi_div' = 1; this has the effect of halving the actual output
> > +	 * pixel rate in the MIPI domain.
> > +	 *
> > +	 * Adjust the pixel rate control value to report it correctly to
> > +	 * userspace.
> > +	 */
> > +	if (link_freq > OV5640_LINK_RATE_MAX)
> > +		pixel_rate /= 2;
>
> Need to divide also the link_frequency (st-mipid02 bridge interfacing is
> broken here). Patch proposal below:
>
> +	sensor->current_link_freq = link_freq;
> +
> +	 * Adjust the pixel rate & link frequency control value to report it
> +	 * correctly to userspace.
>  	 */
> -	if (link_freq > OV5640_LINK_RATE_MAX)
> +	if (link_freq > OV5640_LINK_RATE_MAX) {
>  		pixel_rate /= 2;
> +		link_freq /= 2;
> +	}

This has been my headache for a long time and I'm still not 100%
convinced what I have here is the best solution, but at least works
for more much modes than what it used to.

Can I ask how did you get to the conclusion that link_rate should be
halved ? Is your receiver driver complaining ? Have you sampled the
actual link frequency ?

I tried applying your patch and

1) on imx8mp with mipi-csis receiver your patch breaks a few modes but
   still works for most of them. The system seems unstable compared to
   the original version, and sometimes I get hangs/segfauls for high
   resolution modes. The receiver driver is the mipi-csis one [1]

   [1] drivers/media/platform/imx/imx-mipi-csis.c

2) on i.MX6 I spent quite some time debugging why high-res modes do
   not work there with my series, and my understanding is that the i.MX6
   CSI-2 receiver only supports a total bandwidth of 1Gbps/lane, which
   the high res modes of the ov5640 sensor exceeds, having a clock rate
   frequency of 672 MHz.  (Unrelated: the limitation of 1Gbps might be due
   to the fact the i.MX6 receiver implements the v1.0 version of the
   CSI-2 specs, but I found nowhere a confirmation that v1.0 is limited
   to 1Gbps compared to the 1.5Gbps limit of v1.1).

   If I apply your patch I can capture 1080p and full res, but the
   images are crippled. The pixels are repeated multiple times in the final
   image, I cannot tell if that's an issue on the receiver or due to the
   link rate being actually faster than what reported with your change.

Could you on how you got to halve the reported pixel rate ?

Others have tested with other csi-2 receivers which sample link freq
using v4l2_get_link_freq() as well, and they have not reported issues
afaict.

(Please note that using a link_freq that doesn't come from the control
in ov5640_set_mipi_pclk() makes it harder to tune the pixel rate from
userspace to accommodate more configurations, as I suggested we should
do in reply to "[PATCH v5 16/27] media: ov5640: Add VBLANK control"
but it might still be doable).

Thanks a lot for testing!
   j


[2] That's what I have applied

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index faca36dc4187..910b58fb1e08 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -461,6 +461,7 @@ struct ov5640_dev {

        bool pending_mode_change;
        bool streaming;
+       s64 current_link_freq;
 };

 static inline struct ov5640_dev *to_ov5640_dev(struct v4l2_subdev *sd)
@@ -1439,7 +1440,7 @@ static int ov5640_set_mipi_pclk(struct ov5640_dev *sensor)
        int ret;

        /* Use the link frequency computed at ov5640_update_pixel_rate() time. */
-       link_freq = ov5640_csi2_link_freqs[sensor->ctrls.link_freq->cur.val];
+       link_freq = sensor->current_link_freq;

        /*
         * - mipi_div - Additional divider for the MIPI lane clock.
@@ -2836,6 +2837,8 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
        } while (link_freq >= 1000000000U &&
                 ++pixel_rate_id < OV5640_NUM_PIXEL_RATES);

+       sensor->current_link_freq = link_freq;
+
        /*
         * Higher link rates require the clock tree to be programmed with
         * 'mipi_div' = 1; this has the effect of halving the actual output
@@ -2844,8 +2847,10 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
         * Adjust the pixel rate control value to report it correctly to
         * userspace.
         */
-       if (link_freq > OV5640_LINK_RATE_MAX)
+       if (link_freq > OV5640_LINK_RATE_MAX) {
                pixel_rate /= 2;
+               link_freq /= 2;
+       }

        for (i = 0; i < ARRAY_SIZE(ov5640_csi2_link_freqs); ++i) {
                if (ov5640_csi2_link_freqs[i] == link_freq)
@@ -3777,6 +3782,7 @@ static int ov5640_probe(struct i2c_client *client)
        sensor->current_mode =
                &ov5640_mode_data[OV5640_MODE_VGA_640_480];
        sensor->last_mode = sensor->current_mode;
+       sensor->current_link_freq = OV5640_DEFAULT_LINK_FREQ;

        sensor->ae_target = 52;




>
>
> Doing so we cannot relay anymore on link_frequency control reading in
> ov5640_set_mipi_pclk(), use current_link_freq variable instead
>
> @@ -1440,7 +1453,7 @@ static int ov5640_set_mipi_pclk(struct ov5640_dev
> *sensor)
>  	int ret;
>
>  	/* Use the link freq computed at ov5640_update_pixel_rate() time. */
> -	link_freq = ov5640_csi2_link_freqs[sensor->ctrls.link_freq->cur.val];
> +	link_freq = sensor->current_link_freq;
>
> @@ -3782,6 +3811,7 @@ static int ov5640_probe(struct i2c_client *client)
>  	sensor->current_mode =
>  		&ov5640_mode_data[OV5640_MODE_VGA_640_480];
>  	sensor->last_mode = sensor->current_mode;
> +	sensor->current_link_freq = OV5640_DEFAULT_LINK_FREQ;
>
>
>
>
> > +
> > +	for (i = 0; i < ARRAY_SIZE(ov5640_csi2_link_freqs); ++i) {
> > +		if (ov5640_csi2_link_freqs[i] == link_freq)
> > +			break;
> > +	}
> > +
> > +	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate, pixel_rate);
> > +	__v4l2_ctrl_s_ctrl(sensor->ctrls.link_freq, i);
> > +
> > +	return 0;
> > +}
> > +
> >   static int ov5640_set_fmt(struct v4l2_subdev *sd,
> >   			  struct v4l2_subdev_state *sd_state,
> >   			  struct v4l2_subdev_format *format)
> > @@ -2451,8 +2513,8 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
> >   	/* update format even if code is unchanged, resolution might change */
> >   	sensor->fmt = *mbus_fmt;
> > -	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
> > -				 ov5640_calc_pixel_rate(sensor));
> > +	ov5640_update_pixel_rate(sensor);
> > +
> >   out:
> >   	mutex_unlock(&sensor->lock);
> >   	return ret;
> >
>
> Hugues.
