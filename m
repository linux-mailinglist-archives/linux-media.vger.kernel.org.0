Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2728A20E6C
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 20:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729014AbfEPSIM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 14:08:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42518 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbfEPSIM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 14:08:12 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E7642FD;
        Thu, 16 May 2019 20:08:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1558030089;
        bh=eWCXSKHOHEngty68if/3YlUTp+Pd3Dl5VIJ2q5ZxWT4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=suBBfI3Q7kJw3bGTbjzMEaAE5X+SHEQ/OVmNeS3utGOZaFsBDbD7s1cpNvfrWwzeO
         DC+EMVFx7xUAXIuezM4g45Wr4LNDzESDAmAEGANWP1q9Iq3l3N36XO1E03ZV7dYsHI
         DGzDCpPXQdJx54sFtktIo30oGIKgEWUcM5QaTvhc=
Date:   Thu, 16 May 2019 21:07:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH v6 12/13] media: tvp5150: add support to limit tv norms
 on connector
Message-ID: <20190516180753.GS14820@pendragon.ideasonboard.com>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
 <20190415124413.18456-13-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190415124413.18456-13-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,

Thank you for the patch.

On Mon, Apr 15, 2019 at 02:44:12PM +0200, Marco Felsch wrote:
> The tvp5150 accepts NTSC(M,J,4.43), PAL (B,D,G,H,I,M,N) and SECAM video
> data and is able to auto-detect the input signal. The auto-detection
> does not work if the connector does not receive an input signal and the
> tvp5150 might not be configured correctly. This misconfiguration leads
> into wrong decoded video streams if the tvp5150 gets powered on before
> the video signal is present.
> 
> Limit the supported tv norms according to the actual selected connector
> to avoid a misconfiguration.

This seems a bit of a hack to me. In particular, on what grounds would
you specify a particular configuration in DT ? Also, this issue affects
non-DT systems, and should be solved globally.

> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> [1] https://patchwork.kernel.org/cover/10794703/
> 
> v5:
> - probe() initialize supported tv-norms according the given connectors
>   if they are available.
> - check if media-controller is used. Don't limit the norm if it isn't
>   used.
> - add more logic to be smarter during connector changing so it is
>   intuitiver for the user space.
> 
> v2-v4:
> - nothing since the patch was squashed from series [1] into this
>   series.
> 
>  drivers/media/i2c/tvp5150.c | 69 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 67 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> index cd54715eb641..c0ee08546643 100644
> --- a/drivers/media/i2c/tvp5150.c
> +++ b/drivers/media/i2c/tvp5150.c
> @@ -32,6 +32,13 @@
>  #define TVP5150_MBUS_FMT	MEDIA_BUS_FMT_UYVY8_2X8
>  #define TVP5150_FIELD		V4L2_FIELD_ALTERNATE
>  #define TVP5150_COLORSPACE	V4L2_COLORSPACE_SMPTE170M
> +#define TVP5150_STD_MASK	(V4L2_STD_NTSC     | \
> +				 V4L2_STD_NTSC_443 | \
> +				 V4L2_STD_PAL      | \
> +				 V4L2_STD_PAL_M    | \
> +				 V4L2_STD_PAL_N    | \
> +				 V4L2_STD_PAL_Nc   | \
> +				 V4L2_STD_SECAM)
>  
>  MODULE_DESCRIPTION("Texas Instruments TVP5150A/TVP5150AM1/TVP5151 video decoder driver");
>  MODULE_AUTHOR("Mauro Carvalho Chehab");
> @@ -66,6 +73,7 @@ struct tvp5150 {
>  	/* media-ctl properties */
>  	struct media_pad pads[TVP5150_NUM_PADS];
>  	struct tvp5150_connector *connectors;
> +	struct tvp5150_connector *cur_connector;
>  	int connectors_num;
>  
>  	struct v4l2_ctrl_handler hdl;
> @@ -785,17 +793,28 @@ static int tvp5150_g_std(struct v4l2_subdev *sd, v4l2_std_id *std)
>  static int tvp5150_s_std(struct v4l2_subdev *sd, v4l2_std_id std)
>  {
>  	struct tvp5150 *decoder = to_tvp5150(sd);
> +	struct tvp5150_connector *cur_con = decoder->cur_connector;
> +	v4l2_std_id supported_norms = cur_con ?
> +		cur_con->base.connector.analog.supported_tvnorms : V4L2_STD_ALL;
>  
>  	if (decoder->norm == std)
>  		return 0;
>  
> +	/*
> +	 * check if requested std or group of std's is/are supported by the
> +	 * connector
> +	 */
> +	if ((supported_norms & std) == 0)
> +		return -EINVAL;
> +
>  	/* Change cropping height limits */
>  	if (std & V4L2_STD_525_60)
>  		decoder->rect.height = TVP5150_V_MAX_525_60;
>  	else
>  		decoder->rect.height = TVP5150_V_MAX_OTHERS;
>  
> -	decoder->norm = std;
> +	/* set only the specific supported std in case of group of std's */
> +	decoder->norm = supported_norms & std;
>  
>  	return tvp5150_set_std(sd, std);
>  }
> @@ -1347,6 +1366,8 @@ static int tvp5150_link_setup(struct media_entity *entity,
>  			  TVP5150_BLACK_SCREEN, 0);
>  
>  	if (flags & MEDIA_LNK_FL_ENABLED) {
> +		u32 new_norm;
> +
>  		/*
>  		 * S-Video connector is conneted to both ports AIP1A and AIP1B.
>  		 * Both links must be enabled in one-shot regardless which link
> @@ -1358,6 +1379,26 @@ static int tvp5150_link_setup(struct media_entity *entity,
>  			if (err)
>  				return err;
>  		}
> +
> +		/* Update the current connector */
> +		decoder->cur_connector =
> +			container_of(remote, struct tvp5150_connector, pad);
> +
> +		/*
> +		 * Do nothing if the new connector supports the same tv-norms as
> +		 * the old one.
> +		 */
> +		new_norm = decoder->norm &
> +			decoder->cur_connector->base.connector.analog.supported_tvnorms;
> +		if (decoder->norm == new_norm)
> +			return 0;
> +
> +		/*
> +		 * Fallback to the new connector tv-norms if we can't find any
> +		 * common between the current tv-norm and the new one.
> +		 */
> +		tvp5150_s_std(sd, new_norm ? new_norm :
> +			decoder->cur_connector->base.connector.analog.supported_tvnorms);
>  	}
>  
>  	return 0;
> @@ -1576,6 +1617,9 @@ static int tvp5150_registered(struct v4l2_subdev *sd)
>  				TVP5150_COMPOSITE1;
>  
>  			tvp5150_selmux(sd);
> +			decoder->cur_connector = &decoder->connectors[i];
> +			tvp5150_s_std(sd,
> +				decoder->connectors[i].base.connector.analog.supported_tvnorms);
>  		}
>  	}
>  #endif
> @@ -1903,6 +1947,11 @@ static int tvp5150_parse_dt(struct tvp5150 *decoder, struct device_node *np)
>  				ret = -EINVAL;
>  				goto err;
>  			}
> +			if (!(c.connector.analog.supported_tvnorms &
> +			    TVP5150_STD_MASK))
> +				dev_warn(dev,
> +					"Unsupported tv-norm on connector %s.\n",
> +					c.label);
>  			in++;
>  			break;
>  		case TVP5150_PAD_VID_OUT:
> @@ -2011,7 +2060,23 @@ static int tvp5150_probe(struct i2c_client *c,
>  	if (res < 0)
>  		goto err_cleanup_dt;
>  
> -	core->norm = V4L2_STD_ALL;	/* Default is autodetect */
> +	/*
> +	 * Iterate over all available connectors in case they are supported and
> +	 * successfully parsed. Fallback to default autodetect in case they
> +	 * aren't supported.
> +	 */
> +	if (core->connectors) {
> +		struct v4l2_fwnode_connector *con;
> +		int i;
> +
> +		for (i = 0; i < core->connectors_num; i++) {
> +			con = &core->connectors[i].base;
> +			core->norm |= con->connector.analog.supported_tvnorms;
> +		}
> +	} else {
> +		core->norm = V4L2_STD_ALL;
> +	}
> +
>  	core->detected_norm = V4L2_STD_UNKNOWN;
>  	core->input = TVP5150_COMPOSITE1;
>  	core->enable = true;
> -- 
> 2.20.1
> 

-- 
Regards,

Laurent Pinchart
