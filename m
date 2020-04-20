Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED8C01AFFA6
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 04:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbgDTCAr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 22:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725953AbgDTCAq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 22:00:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB1ABC061A0C;
        Sun, 19 Apr 2020 19:00:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E101E528;
        Mon, 20 Apr 2020 04:00:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587348045;
        bh=5ZReel+i0fByTwyl9duKlOyfqeyTANyBVMUdg7eklMU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kZWjSXXZyq8d9/GtbBwJyKXDeFsig2bpG7UO1V6Hi0QIj36yh53sbntESwcp6lrUX
         u21PhvlyAnHHmc9350lPHyF2zdBYnVhmDCx974uQRGXBsdDFeLEHdIJ5kdGa/5THDS
         wf+OS7U7D/DlxN0wtRNyT2ZEgZCSOfQwqjoHZyRE=
Date:   Mon, 20 Apr 2020 05:00:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 5/6] media: i2c: adv748x: Implement get_mbus_config
Message-ID: <20200420020030.GE15673@pendragon.ideasonboard.com>
References: <20200415105004.2497356-1-jacopo+renesas@jmondi.org>
 <20200415105004.2497356-6-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200415105004.2497356-6-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, Apr 15, 2020 at 12:50:02PM +0200, Jacopo Mondi wrote:
> Implement the newly introduced get_mbus_config operation to report the
> number of currently used data lanes on the MIPI CSI-2 interface.
> 
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/adv748x/adv748x-csi2.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> index 2091cda50935..f13563da3ff3 100644
> --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> @@ -214,9 +214,24 @@ static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
>  	return ret;
>  }
>  
> +static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
> +					struct v4l2_mbus_pad_config *config)
> +{
> +	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
> +
> +	if (pad != ADV748X_CSI2_SOURCE)
> +		return -EINVAL;
> +
> +	config->type = V4L2_MBUS_CSI2_DPHY;
> +	config->csi2_dphy.data_lanes = tx->active_lanes;
> +
> +	return 0;

This looks fine, but raises a few questions whose answers need to be
documented in 1/6 I think.

- Is the caller expected to zero the config struct ?
- What are the allowed returned values for this operation, and under
  what circumstances ?

These are generic questions for the API. For this patch,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +}
> +
>  static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
>  	.get_fmt = adv748x_csi2_get_format,
>  	.set_fmt = adv748x_csi2_set_format,
> +	.get_mbus_config = adv748x_csi2_get_mbus_config,
>  };
>  
>  /* -----------------------------------------------------------------------------

-- 
Regards,

Laurent Pinchart
