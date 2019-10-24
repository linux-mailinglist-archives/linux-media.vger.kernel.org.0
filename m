Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F1A1E319B
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 13:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409260AbfJXL57 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 07:57:59 -0400
Received: from mga11.intel.com ([192.55.52.93]:36153 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726298AbfJXL57 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 07:57:59 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Oct 2019 04:57:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,224,1569308400"; 
   d="scan'208";a="210141714"
Received: from jjackiew-mobl1.ger.corp.intel.com (HELO mara.localdomain) ([10.249.148.206])
  by fmsmga001.fm.intel.com with ESMTP; 24 Oct 2019 04:57:55 -0700
Received: from sailus by mara.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1iNbli-00013M-EZ; Thu, 24 Oct 2019 14:59:06 +0300
Date:   Thu, 24 Oct 2019 14:59:05 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     mchehab@kernel.org, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH v11 11/15] media: tvp5150: add s_power callback
Message-ID: <20191024115905.GB3966@mara.localdomain>
References: <20190930093900.16524-1-m.felsch@pengutronix.de>
 <20190930093900.16524-12-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190930093900.16524-12-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,

On Mon, Sep 30, 2019 at 11:38:56AM +0200, Marco Felsch wrote:
> Don't en-/disable the interrupts during s_stream because someone can
> disable the stream but wants to get informed if the stream is locked
> again. So keep the interrupts enabled the whole time the pipeline is
> opened.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/media/i2c/tvp5150.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> index dda9f0a2995f..4afe2093b950 100644
> --- a/drivers/media/i2c/tvp5150.c
> +++ b/drivers/media/i2c/tvp5150.c
> @@ -1356,11 +1356,26 @@ static const struct media_entity_operations tvp5150_sd_media_ops = {
>  /****************************************************************************
>  			I2C Command
>   ****************************************************************************/
> +static int tvp5150_s_power(struct  v4l2_subdev *sd, int on)
> +{
> +	struct tvp5150 *decoder = to_tvp5150(sd);
> +	unsigned int val = 0;
> +
> +	if (on)
> +		val = TVP5150_INT_A_LOCK;
> +
> +	if (decoder->irq)
> +		/* Enable / Disable lock interrupt */
> +		regmap_update_bits(decoder->regmap, TVP5150_INT_ENABLE_REG_A,
> +				   TVP5150_INT_A_LOCK, val);

Could you use runtime PM to do this instead?

> +
> +	return 0;
> +}
>  
>  static int tvp5150_s_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct tvp5150 *decoder = to_tvp5150(sd);
> -	unsigned int mask, val = 0, int_val = 0;
> +	unsigned int mask, val = 0;
>  
>  	mask = TVP5150_MISC_CTL_YCBCR_OE | TVP5150_MISC_CTL_SYNC_OE |
>  	       TVP5150_MISC_CTL_CLOCK_OE;
> @@ -1373,15 +1388,10 @@ static int tvp5150_s_stream(struct v4l2_subdev *sd, int enable)
>  			val = decoder->lock ? decoder->oe : 0;
>  		else
>  			val = decoder->oe;
> -		int_val = TVP5150_INT_A_LOCK;
>  		v4l2_subdev_notify_event(&decoder->sd, &tvp5150_ev_fmt);
>  	}
>  
>  	regmap_update_bits(decoder->regmap, TVP5150_MISC_CTL, mask, val);
> -	if (decoder->irq)
> -		/* Enable / Disable lock interrupt */
> -		regmap_update_bits(decoder->regmap, TVP5150_INT_ENABLE_REG_A,
> -				   TVP5150_INT_A_LOCK, int_val);
>  
>  	return 0;
>  }
> @@ -1580,6 +1590,7 @@ static const struct v4l2_subdev_core_ops tvp5150_core_ops = {
>  	.g_register = tvp5150_g_register,
>  	.s_register = tvp5150_s_register,
>  #endif
> +	.s_power = tvp5150_s_power,
>  };
>  
>  static const struct v4l2_subdev_tuner_ops tvp5150_tuner_ops = {
> -- 
> 2.20.1
> 

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
