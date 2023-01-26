Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2846867CE24
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 15:31:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231754AbjAZObz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 09:31:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbjAZOby (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 09:31:54 -0500
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBAEC3C3E
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 06:31:53 -0800 (PST)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 12CEA20195;
        Thu, 26 Jan 2023 16:31:51 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1674743511;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=OmSd5qWSQDoZROwRvFTsb2VWRcx6Q+h8j7y/8qcVXy4=;
        b=m9Xwb75afBVvrIO/MHIy3nnmJg8YjgdoBgDp9aYreBENPHzu30k+NNx3STor383pk3v+Nd
        lBqf8zzYQn4xKMXRy4XHTWXD35IAd9pFKnUX7bP8eX/Ao6NMzDs4134nWoQ3V/zBL0n9nU
        gqp+2qP1oH6HUQVabf+kH7Djo2Z/KVw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1674743511;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=OmSd5qWSQDoZROwRvFTsb2VWRcx6Q+h8j7y/8qcVXy4=;
        b=PJbaT84X7nBqMDvTUXzERvBIojq7JkrpWn1OWizZkdct9Em+PTpEk9+G4tWxbvP0c/1MqG
        Wm2IYL+bdNF2VBeseGaUdAMR8tfAZ5Q5jiUiexJGPJFxUSDLHPUIg+upRDL8TKl98l3UK3
        6ggPF2bRn1YgjTrTplx77STvLQf0IjA=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1674743511; a=rsa-sha256; cv=none;
        b=dER5ZgpVRX3CKiGEP0fhkb0V1fu0xWSqrQmMx1BHSAk3/LOrM4n9QkoauOOmQsGTtUHJWF
        62a1BX2YOpJ5YZA5UI8B4AnCgWeebKaF+jnicKnc6QZJ0ILxi1QB2W9N9sxUrl/mUOU5bT
        2CuSIJwcL+Vlw/6332eIBOursQUT1Dc=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 4F968634C91;
        Thu, 26 Jan 2023 16:31:44 +0200 (EET)
Date:   Thu, 26 Jan 2023 16:31:43 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Luca Weiss <luca@z3ntu.xyz>, laurent.pinchart@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 7/9] media: i2c: ov5670: Implement init_cfg
Message-ID: <Y9KOz9zSmJ1id7EY@valkosipuli.retiisi.eu>
References: <20230126124632.45842-1-jacopo.mondi@ideasonboard.com>
 <20230126124632.45842-8-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126124632.45842-8-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Thu, Jan 26, 2023 at 01:46:30PM +0100, Jacopo Mondi wrote:
> Implement the .init_cfg() pad operation and initialize the default
> format with the default full resolution mode 2592x1944.
> 
> With .init_cfg() pad operation implemented the deprecated .open()
> internal operation can now be dropped.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5670.c | 46 +++++++++++++++++---------------------
>  1 file changed, 20 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> index 12091a5c992e..8f4350898b36 100644
> --- a/drivers/media/i2c/ov5670.c
> +++ b/drivers/media/i2c/ov5670.c
> @@ -1962,27 +1962,6 @@ static int ov5670_write_reg_list(struct ov5670 *ov5670,
>  	return ov5670_write_regs(ov5670, r_list->regs, r_list->num_of_regs);
>  }
>  
> -/* Open sub-device */
> -static int ov5670_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> -{
> -	struct ov5670 *ov5670 = to_ov5670(sd);
> -	struct v4l2_mbus_framefmt *try_fmt =
> -				v4l2_subdev_get_try_format(sd, fh->state, 0);
> -
> -	mutex_lock(&ov5670->mutex);
> -
> -	/* Initialize try_fmt */
> -	try_fmt->width = ov5670->cur_mode->width;
> -	try_fmt->height = ov5670->cur_mode->height;
> -	try_fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> -	try_fmt->field = V4L2_FIELD_NONE;
> -
> -	/* No crop or compose */
> -	mutex_unlock(&ov5670->mutex);
> -
> -	return 0;
> -}
> -
>  static int ov5670_update_digital_gain(struct ov5670 *ov5670, u32 d_gain)
>  {
>  	int ret;
> @@ -2182,6 +2161,25 @@ static int ov5670_init_controls(struct ov5670 *ov5670)
>  	return ret;
>  }
>  
> +static int ov5670_init_cfg(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_mbus_framefmt *fmt =
> +				v4l2_subdev_get_try_format(sd, state, 0);

Where do you need fmt?

> +	const struct ov5670_mode *default_mode = &supported_modes[0];
> +
> +	fmt->width = default_mode->width;
> +	fmt->height = default_mode->height;
> +	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +	fmt->field = V4L2_FIELD_NONE;
> +	fmt->colorspace = V4L2_COLORSPACE_SRGB;
> +	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SRGB);
> +	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SRGB);
> +
> +	return 0;
> +}
> +
>  static int ov5670_enum_mbus_code(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_mbus_code_enum *code)
> @@ -2512,6 +2510,7 @@ static const struct v4l2_subdev_video_ops ov5670_video_ops = {
>  };
>  
>  static const struct v4l2_subdev_pad_ops ov5670_pad_ops = {
> +	.init_cfg = ov5670_init_cfg,
>  	.enum_mbus_code = ov5670_enum_mbus_code,
>  	.get_fmt = ov5670_get_pad_format,
>  	.set_fmt = ov5670_set_pad_format,
> @@ -2533,10 +2532,6 @@ static const struct media_entity_operations ov5670_subdev_entity_ops = {
>  	.link_validate = v4l2_subdev_link_validate,
>  };
>  
> -static const struct v4l2_subdev_internal_ops ov5670_internal_ops = {
> -	.open = ov5670_open,
> -};

Nice!

> -
>  static int ov5670_regulators_probe(struct ov5670 *ov5670)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(&ov5670->sd);
> @@ -2645,7 +2640,6 @@ static int ov5670_probe(struct i2c_client *client)
>  		goto error_mutex_destroy;
>  	}
>  
> -	ov5670->sd.internal_ops = &ov5670_internal_ops;
>  	ov5670->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
>  			    V4L2_SUBDEV_FL_HAS_EVENTS;
>  	ov5670->sd.entity.ops = &ov5670_subdev_entity_ops;
> -- 
> 2.39.0
> 

-- 
Sakari Ailus
