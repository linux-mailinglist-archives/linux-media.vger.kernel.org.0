Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 515F54857E4
	for <lists+linux-media@lfdr.de>; Wed,  5 Jan 2022 19:05:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242710AbiAESFC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jan 2022 13:05:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242711AbiAESE3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jan 2022 13:04:29 -0500
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9807C061245
        for <linux-media@vger.kernel.org>; Wed,  5 Jan 2022 10:04:28 -0800 (PST)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id CBB40201E7;
        Wed,  5 Jan 2022 20:04:24 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1641405864;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=D6JKEUyk1h45e2hzJe1Dq4YTYoDOj5f1dnIGBzf/+Gc=;
        b=YKTJsWMpy6ETFyCVpI/SUHfzyrBFlUFdUGoAR9FKvcSsZXr8+DnLkUwhJIL0/NTp1iWsId
        LCGddCGGP2bSBHA+CnFe5952SKg1xTlAuDHDnS0rk+IZQTmvpeMQEWlZ1mdxSdqKfCOrWC
        M7xV4dQxcg8VdbPN1mjByXUXkk3aVAI=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5D1FE634C90;
        Wed,  5 Jan 2022 20:04:24 +0200 (EET)
Date:   Wed, 5 Jan 2022 20:04:24 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [RFC PATCH 2/8] media: i2c: ov6650: Drop implementation of
 .set_mbus_config()
Message-ID: <YdXdqJLKzDduVdex@valkosipuli.retiisi.eu>
References: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220103162414.27723-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220103162414.27723-3-laurent.pinchart+renesas@ideasonboard.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1641405864; a=rsa-sha256; cv=none;
        b=duFVSUAwaPfigf+3SLO6VL0FVdCi6xQ5c4lAXDTTDrozVKBI4RqiFftFjTSDggxOMUJFQ9
        YA7p1PYzDVdNDLZRhqXYezBSbCAZnmisPfU5YJYQuFugIgM/etLxQnULfoZosoJnJXuE7P
        nl2clvAZ4ensvtsYE/ztKDqEbLNU/vM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1641405864;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=D6JKEUyk1h45e2hzJe1Dq4YTYoDOj5f1dnIGBzf/+Gc=;
        b=S2C1J6oKEwoftUtHn0dIBNm4ZhQUcRGakvjuV5JypyRik89BUiNl9G+s4uwFBUYiLX5A13
        8qkX4WaWZY3c4pGP87ut28H4w0abOc2xdZgbmaC7io0MfBn2GbPBl2CG6qQyFQIyNG4j8x
        v+6Qks38Vqxhw2zmqW4rRV+QRrVwoUA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for the set.

On Mon, Jan 03, 2022 at 06:24:08PM +0200, Laurent Pinchart wrote:
> The subdev .set_mbus_config() operation is deprecated. No code in the
> kernel calls it, so drop its implementation from the ov6650 driver.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/i2c/ov6650.c | 37 -------------------------------------
>  1 file changed, 37 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
> index f67412150b16..455a627e35a0 100644
> --- a/drivers/media/i2c/ov6650.c
> +++ b/drivers/media/i2c/ov6650.c
> @@ -944,42 +944,6 @@ static int ov6650_get_mbus_config(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> -/* Alter bus settings on camera side */
> -static int ov6650_set_mbus_config(struct v4l2_subdev *sd,
> -				  unsigned int pad,
> -				  struct v4l2_mbus_config *cfg)
> -{
> -	struct i2c_client *client = v4l2_get_subdevdata(sd);
> -	int ret = 0;
> -
> -	if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> -		ret = ov6650_reg_rmw(client, REG_COMJ, COMJ_PCLK_RISING, 0);
> -	else if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
> -		ret = ov6650_reg_rmw(client, REG_COMJ, 0, COMJ_PCLK_RISING);

I think this configuration should come from the endpoint which the driver
currently does not parse. In fact, there are no even DT bindings for the
device.

I wonder what kind of environment it is used in --- assuming it works
somewhere.

> -	if (ret)
> -		return ret;
> -
> -	if (cfg->flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
> -		ret = ov6650_reg_rmw(client, REG_COMF, COMF_HREF_LOW, 0);
> -	else if (cfg->flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> -		ret = ov6650_reg_rmw(client, REG_COMF, 0, COMF_HREF_LOW);
> -	if (ret)
> -		return ret;
> -
> -	if (cfg->flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
> -		ret = ov6650_reg_rmw(client, REG_COMJ, COMJ_VSYNC_HIGH, 0);
> -	else if (cfg->flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> -		ret = ov6650_reg_rmw(client, REG_COMJ, 0, COMJ_VSYNC_HIGH);
> -	if (ret)
> -		return ret;
> -
> -	/*
> -	 * Update the configuration to report what is actually applied to
> -	 * the hardware.
> -	 */
> -	return ov6650_get_mbus_config(sd, pad, cfg);
> -}
> -
>  static const struct v4l2_subdev_video_ops ov6650_video_ops = {
>  	.s_stream	= ov6650_s_stream,
>  	.g_frame_interval = ov6650_g_frame_interval,
> @@ -993,7 +957,6 @@ static const struct v4l2_subdev_pad_ops ov6650_pad_ops = {
>  	.get_fmt	= ov6650_get_fmt,
>  	.set_fmt	= ov6650_set_fmt,
>  	.get_mbus_config = ov6650_get_mbus_config,
> -	.set_mbus_config = ov6650_set_mbus_config,
>  };
>  
>  static const struct v4l2_subdev_ops ov6650_subdev_ops = {

-- 
Kind regards,

Sakari Ailus
