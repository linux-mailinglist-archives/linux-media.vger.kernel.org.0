Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CEAC382DC2
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 15:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235632AbhEQNqJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 09:46:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:60104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235085AbhEQNqJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 09:46:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5477460FD8;
        Mon, 17 May 2021 13:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621259093;
        bh=k11JsfpDj2dEpY2+InXSRMOEVYdB4rJJhnckyRs29oI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=t80f/h3pzTYPPrK1EESIpcvM/bauPBDV0p2VOcMavaGPtH1rCvXi3TG1zJ0+y61ML
         1LhtEUNgs7xH/tHqudstWPX2pbgN8pPmY6+DeFmlHc/IVNYWpcChr8lt2GmWbzx9zU
         Jz5d62NS9+FwxFZlHklyMneFDSKzjBT/kRcMO1QYIjKWkGfYZebhK9ym2Wy05c5W5E
         QDfzZ2JMcTiFhWGMMIY/jIcdnRETvenLoNXctm02KHUDq8EHPI5EubykVT22hX59g1
         BPONzmShWyCSu3DElSD4ilxvfQXpQaj4t9fPYyJedakrqxKBJbYUZjE7sLWMNBiPF1
         sjTBVAt+QFRSA==
Date:   Mon, 17 May 2021 15:44:48 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Deepak R Varma <drv@mailo.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/9] staging: media: atomisp: use __func__ over
 function names
Message-ID: <20210517154448.7bb8be17@coco.lan>
In-Reply-To: <ff72157dce3b0b3f317ffb399362af7ee23109a3.1619630709.git.drv@mailo.com>
References: <cover.1619630709.git.drv@mailo.com>
        <ff72157dce3b0b3f317ffb399362af7ee23109a3.1619630709.git.drv@mailo.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 28 Apr 2021 23:37:54 +0530
Deepak R Varma <drv@mailo.com> escreveu:

> Replace hard coded function names from the debug print strings by
> standard __func__ predefined identifier. This resolves following
> checkpatch script WARNING:
> Prefer using '"%s...", __func__' to using function's name, in a string.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> 
> Changes since v3:
>    - None.
> Changes since v2:
>    - None.
> Changes since v1:
>    - None.

Huh? Why are you sending a new version when there's no difference
from the past ones?

> 
>  .../staging/media/atomisp/i2c/atomisp-gc0310.c   |  2 +-
>  .../staging/media/atomisp/i2c/atomisp-gc2235.c   |  2 +-
>  .../staging/media/atomisp/i2c/atomisp-lm3554.c   |  2 +-
>  .../staging/media/atomisp/i2c/atomisp-ov2680.c   | 16 ++++++++--------
>  .../staging/media/atomisp/i2c/atomisp-ov2722.c   |  2 +-
>  5 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> index d68a2bcc9ae1..b572551f1a0d 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> @@ -1292,7 +1292,7 @@ static int gc0310_remove(struct i2c_client *client)
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>  	struct gc0310_device *dev = to_gc0310_sensor(sd);
>  
> -	dev_dbg(&client->dev, "gc0310_remove...\n");
> +	dev_dbg(&client->dev, "%s...\n", __func__);
>  

As Dan already pointed, please delete this and other
dev_dbg() that are just tracing functions without any other
real meaning. If one needs that, ftrace could be used.



>  	dev->platform_data->csi_cfg(sd, 0);
>  
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> index e722c639b60d..548c572d3b57 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -1034,7 +1034,7 @@ static int gc2235_remove(struct i2c_client *client)
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>  	struct gc2235_device *dev = to_gc2235_sensor(sd);
>  
> -	dev_dbg(&client->dev, "gc2235_remove...\n");
> +	dev_dbg(&client->dev, "%s...\n", __func__);
>  
>  	dev->platform_data->csi_cfg(sd, 0);
>  
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
> index 7ca7378b1859..ab10fd98dbc0 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
> @@ -680,7 +680,7 @@ static int lm3554_detect(struct v4l2_subdev *sd)
>  	int ret;
>  
>  	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA)) {
> -		dev_err(&client->dev, "lm3554_detect i2c error\n");
> +		dev_err(&client->dev, "%s i2c error\n", __func__);
>  		return -ENODEV;
>  	}
>  
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> index f167781e258a..a51ad9843d39 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -146,7 +146,7 @@ static int ov2680_g_bin_factor_x(struct v4l2_subdev *sd, s32 *val)
>  	struct ov2680_device *dev = to_ov2680_sensor(sd);
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
>  
> -	dev_dbg(&client->dev,  "++++ov2680_g_bin_factor_x\n");
> +	dev_dbg(&client->dev,  "++++%s\n", __func__);
>  	*val = ov2680_res[dev->fmt_idx].bin_factor_x;
>  
>  	return 0;
> @@ -158,7 +158,7 @@ static int ov2680_g_bin_factor_y(struct v4l2_subdev *sd, s32 *val)
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
>  
>  	*val = ov2680_res[dev->fmt_idx].bin_factor_y;
> -	dev_dbg(&client->dev,  "++++ov2680_g_bin_factor_y\n");
> +	dev_dbg(&client->dev,  "++++%s\n", __func__);
>  	return 0;
>  }
>  
> @@ -173,7 +173,7 @@ static int ov2680_get_intg_factor(struct i2c_client *client,
>  	u16 reg_val;
>  	int ret;
>  
> -	dev_dbg(&client->dev,  "++++ov2680_get_intg_factor\n");
> +	dev_dbg(&client->dev,  "++++%s\n", __func__);
>  	if (!info)
>  		return -EINVAL;
>  
> @@ -251,8 +251,8 @@ static long __ov2680_set_exposure(struct v4l2_subdev *sd, int coarse_itg,
>  	int ret, exp_val;
>  
>  	dev_dbg(&client->dev,
> -		"+++++++__ov2680_set_exposure coarse_itg %d, gain %d, digitgain %d++\n",
> -		coarse_itg, gain, digitgain);
> +		"+++++++%s coarse_itg %d, gain %d, digitgain %d++\n",
> +		__func__, coarse_itg, gain, digitgain);

This one for instance, is not a plain trace, so it could make
sense to be kept, but please remove those "+++..."  sequences
from the string, as this has no meaning. So, just:

 	dev_dbg(&client->dev,
		"%s: coarse_itg %d, gain %d, digitgain %d\n",
		__func__, coarse_itg, gain, digitgain);

would be enough.

>  
>  	vts = ov2680_res[dev->fmt_idx].lines_per_frame;
>  
> @@ -1060,9 +1060,9 @@ static int ov2680_s_stream(struct v4l2_subdev *sd, int enable)
>  
>  	mutex_lock(&dev->input_lock);
>  	if (enable)
> -		dev_dbg(&client->dev, "ov2680_s_stream one\n");
> +		dev_dbg(&client->dev, "%s one\n", __func__);

There's a typo here:

	one -> on

Please fix.

>  	else
> -		dev_dbg(&client->dev, "ov2680_s_stream off\n");
> +		dev_dbg(&client->dev, "%s off\n", __func__);

Btw, the entire logic above could be re-written as:

	dev_dbg(&client->dev, "%s: %s\n", __func__,
		enable ? "on" : "off");

>  
>  	ret = ov2680_write_reg(client, 1, OV2680_SW_STREAM,
>  			       enable ? OV2680_START_STREAMING :
> @@ -1226,7 +1226,7 @@ static int ov2680_remove(struct i2c_client *client)
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>  	struct ov2680_device *dev = to_ov2680_sensor(sd);
>  
> -	dev_dbg(&client->dev, "ov2680_remove...\n");
> +	dev_dbg(&client->dev, "%s...\n", __func__);
>  
>  	dev->platform_data->csi_cfg(sd, 0);
>  
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> index d046a9804f63..69409f8447b5 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> @@ -1175,7 +1175,7 @@ static int ov2722_remove(struct i2c_client *client)
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>  	struct ov2722_device *dev = to_ov2722_sensor(sd);
>  
> -	dev_dbg(&client->dev, "ov2722_remove...\n");
> +	dev_dbg(&client->dev, "%s...\n", __func__);
>  
>  	dev->platform_data->csi_cfg(sd, 0);
>  	v4l2_ctrl_handler_free(&dev->ctrl_handler);



Thanks,
Mauro
