Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45A08280B80
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 02:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733131AbgJBAG3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 20:06:29 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58108 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731525AbgJBAG3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Oct 2020 20:06:29 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B58660;
        Fri,  2 Oct 2020 02:06:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1601597187;
        bh=0J7iAt+Nb3bI48G/ac/yPMZNn2hMwS0Lj5HnC8rUelY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ws2c3yi3y2f4g9O0w7n15UkYXvMSVrQn+JsPgWyHlTAdZ5vNkAMBLlBT6u9ESWMHf
         ResZCtfXJF/WIp/dBVjfuITRs2Z6yUlA2XD8gXj7q+dvjhWj11+6qF/ILedqOONnqu
         4tOUFRKclkn1Sonnxj8MAuqVkEoa6NO/fgcGMNdA=
Date:   Fri, 2 Oct 2020 03:05:49 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Stefan Riedmueller <s.riedmueller@phytec.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dirk Bender <d.bender@phytec.de>
Subject: Re: [PATCH v2 5/5] media: mt9p031: Fix corrupted frame after
 restarting stream
Message-ID: <20201002000549.GK3722@pendragon.ideasonboard.com>
References: <20200930105133.139981-1-s.riedmueller@phytec.de>
 <20200930105133.139981-5-s.riedmueller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200930105133.139981-5-s.riedmueller@phytec.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stefan,

Thank you for the patch.

On Wed, Sep 30, 2020 at 12:51:33PM +0200, Stefan Riedmueller wrote:
> From: Dirk Bender <d.bender@phytec.de>
> 
> To prevent corrupted frames after starting and stopping the sensor it's

s/it's/its/

> datasheet specifies a specific pause sequence to follow:
> 
> Stopping:
> 	Set Pause_Restart Bit -> Set Restart Bit -> Set Chip_Enable Off
> 
> Restarting:
> 	Set Chip_Enable On -> Clear Pause_Restart Bit
> 
> The Restart Bit is cleared automatically and must not be cleared
> manually as this would cause undefined behavior.
> 
> Signed-off-by: Dirk Bender <d.bender@phytec.de>
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
> No changes in v2
> ---
>  drivers/media/i2c/mt9p031.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index d10457361e6c..d59f66e3dcf3 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -80,6 +80,8 @@
>  #define		MT9P031_PIXEL_CLOCK_SHIFT(n)		((n) << 8)
>  #define		MT9P031_PIXEL_CLOCK_DIVIDE(n)		((n) << 0)
>  #define MT9P031_FRAME_RESTART				0x0b
> +#define		MT9P031_FRAME_RESTART_SET		(1 << 0)
> +#define		MT9P031_FRAME_PAUSE_RESTART_SET		(1 << 1)

The fields are named Restart and Pause_Restart, I would drop _SET. Could
you also sort them from MSB to LSB as for the other registers ? Using
BIT() would be good too, although this could be done as an additional
patch to convert all the existing macros.

>  #define MT9P031_SHUTTER_DELAY				0x0c
>  #define MT9P031_RST					0x0d
>  #define		MT9P031_RST_ENABLE			1
> @@ -483,9 +485,25 @@ static int mt9p031_set_params(struct mt9p031 *mt9p031)
>  static int mt9p031_s_stream(struct v4l2_subdev *subdev, int enable)
>  {
>  	struct mt9p031 *mt9p031 = to_mt9p031(subdev);
> +	struct i2c_client *client = v4l2_get_subdevdata(subdev);
> +	int val;
>  	int ret;
>  
>  	if (!enable) {
> +		val = mt9p031_read(client, MT9P031_FRAME_RESTART);

Do you need to read the register ? Can't you write
MT9P031_FRAME_PAUSE_RESTART_SET and then MT9P031_FRAME_PAUSE_RESTART_SET
| MT9P031_FRAME_RESTART_SET ? And actually, can't we just write both
bits in one go, do we need two writes ?

> +
> +		/* enable pause restart */
> +		val |= MT9P031_FRAME_PAUSE_RESTART_SET;
> +		ret = mt9p031_write(client, MT9P031_FRAME_RESTART, val);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* enable restart + keep pause restart set */
> +		val |= MT9P031_FRAME_RESTART_SET;
> +		ret = mt9p031_write(client, MT9P031_FRAME_RESTART, val);
> +		if (ret < 0)
> +			return ret;
> +
>  		/* Stop sensor readout */
>  		ret = mt9p031_set_output_control(mt9p031,
>  						 MT9P031_OUTPUT_CONTROL_CEN, 0);
> @@ -505,6 +523,13 @@ static int mt9p031_s_stream(struct v4l2_subdev *subdev, int enable)
>  	if (ret < 0)
>  		return ret;
>  
> +	val = mt9p031_read(client, MT9P031_FRAME_RESTART);
> +	/* disable reset + pause restart */
> +	val &= ~MT9P031_FRAME_PAUSE_RESTART_SET;

Same here, I think you can simply write MT9P031_FRAME_PAUSE_RESTART_SET.

> +	ret = mt9p031_write(client, MT9P031_FRAME_RESTART, val);
> +	if (ret < 0)
> +		return ret;
> +
>  	return mt9p031_pll_enable(mt9p031);
>  }
>  

-- 
Regards,

Laurent Pinchart
