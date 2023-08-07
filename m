Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 972B3772624
	for <lists+linux-media@lfdr.de>; Mon,  7 Aug 2023 15:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233568AbjHGNkl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Aug 2023 09:40:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233295AbjHGNk2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Aug 2023 09:40:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A587019A6
        for <linux-media@vger.kernel.org>; Mon,  7 Aug 2023 06:40:02 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CF0F600;
        Mon,  7 Aug 2023 15:38:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1691415520;
        bh=0AdOvZBNwkDUJZUX9tu1JbqzwIBlgI5omgieKNl0zTU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lQb/3+IHHonlwDVzgfTvgYfrCqHQ1QrW2OgAY+hFhZVLP4b1+yhqVWhWemi2dNhTM
         99/feDsVNIkEzrpTpNCyXgnQ+Jg7BWvekExhB8msSp7qqXpBCyz6YTxP6DHpLEDSuP
         yg+irMmzwuw2tGsMFNCsfcTsn35qeAFh9unGAOk8=
Date:   Mon, 7 Aug 2023 16:39:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH 1/2] media: Kconfig: imx290: Correct CCI dependency
Message-ID: <20230807133952.GA7718@pendragon.ideasonboard.com>
References: <20230729104050.1187715-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230729104050.1187715-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Sat, Jul 29, 2023 at 01:40:49PM +0300, Sakari Ailus wrote:
> The Kconfig parts of the original patch converting the IMX290 to use V4L2
> CCI was mis-merged. Correct this.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202307271517.dPa1bTSi-lkp@intel.com/
> Fixes: be02a09c84ad ("media: imx290: Convert to new CCI register access helpers")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 24cbf35c6fe1..f3453a5da970 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -125,6 +125,7 @@ config VIDEO_IMX274
>  config VIDEO_IMX290
>  	tristate "Sony IMX290 sensor support"
>  	select REGMAP_I2C

I think you can also drop REGMAP_I2C, as that's now internal to the CCI
helpers.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	select V4L2_CCI_I2C
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX290 camera sensor.
> @@ -934,7 +935,6 @@ config VIDEO_ADV748X
>  	select VIDEO_V4L2_SUBDEV_API
>  	select REGMAP_I2C
>  	select V4L2_FWNODE
> -	select V4L2_CCI_I2C
>  	help
>  	  V4L2 subdevice driver for the Analog Devices
>  	  ADV7481 and ADV7482 HDMI/Analog video decoders.

-- 
Regards,

Laurent Pinchart
