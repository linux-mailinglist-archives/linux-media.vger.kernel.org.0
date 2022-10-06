Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDF435F6ADE
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 17:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbiJFPmi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 11:42:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbiJFPmh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 11:42:37 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47E01696EA
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 08:42:36 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4BBE12022A;
        Thu,  6 Oct 2022 18:42:33 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1665070953;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Zjth+6A8sq69W0kj5L+21qvmq6pUCB1yNtZNv88zG3I=;
        b=myMkolXMlexkMWj0AQtMGrhgOWC7WTdp+z5hYcmnzZwu1wI5i86b8i2wP7y7GJrcs4qA7m
        60ZnAx/yzL4bKZUFFAhrbdH3rUvbslrDYl5Foojrn3WdEz58hz6EZt4neqf0gdEphIu6f2
        KJNIf6yCPgUr2Vbo1Kpb4Yy5jf9fvZU=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id BE3A1634CBD;
        Thu,  6 Oct 2022 18:42:31 +0300 (EEST)
Date:   Thu, 6 Oct 2022 18:42:31 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 06/10] media: ar0521: Configure pixel rate using LINK_FREQ
Message-ID: <Yz73Z/Tes6k196pz@valkosipuli.retiisi.eu>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-7-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005190613.394277-7-jacopo@jmondi.org>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1665070953; a=rsa-sha256; cv=none;
        b=VZNwW2M3G0lvpDYqwl1EPFM9P4bJX4b9o+i8tPzUsaDqhkx7yWxp7OUNIfiVKtoF5MyGRq
        O6dHj9acP8qT8N5+eMLe2ux2fVGijd5M64GOG/y7sQLwlCL222zUGLrKfD9ku6t6W7f19G
        nKbiSy1Yr/GpfUNxJuntVGWcJWQzwOg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1665070953;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Zjth+6A8sq69W0kj5L+21qvmq6pUCB1yNtZNv88zG3I=;
        b=wJBmkny67CnnVsV9LkmGCEQ7lZUklDxHuDjx18E94tjwe0BIwCdZqUzFQHc/RdPVQVmlEm
        NWonW3XxR/oSioeYUMvJh0wHAJgBroFGBgxvpn3k52/jOopN5fAirIZOOvj7dDBdp8bW7k
        vFL7c2X1weZNrgpFBkIkeJcZbtck2ts=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Wed, Oct 05, 2022 at 09:06:09PM +0200, Jacopo Mondi wrote:
> Now that the V4L2_LINK_FREQUENCY control is available, use it to
> configure the sensor pixel rate.
> 
> Adjust the default pixel rate to match the first listed link_frequency.
> 
> Validated with:
> 
> $ v4l2-ctl -l -d /dev/v4l-subdev3
>  link_frequency 0x009f0901 (intmenu): min=0 max=1 default=0 value=0
>  pixel_rate 0x009f0902 (int64)  : min=168000000 max=414000000 step=1 default=414000000 value=207000000 flags=read-only
> 
> 26.493166 (30.78 fps) cam0-stream0 seq: 000008 bytesused: 1843200
> 26.525629 (30.80 fps) cam0-stream0 seq: 000009 bytesused: 1843200
> 
> $ yavta -w "0x009f0901 1" /dev/v4l-subdev3
> $ v4l2-ctl -l -d /dev/v4l-subdev3
>  link_frequency 0x009f0901 (intmenu): min=0 max=1 default=0 value=1
>  pixel_rate 0x009f0902 (int64)  : min=168000000 max=414000000 step=1 default=414000000 value=414000000 flags=read-only
> 
> 54.700859 (61.37 fps) cam0-stream0 seq: 000039 bytesused: 1843200
> 54.717192 (61.23 fps) cam0-stream0 seq: 000040 bytesused: 1843200
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ar0521.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> index c5410b091654..b1580c99f5e3 100644
> --- a/drivers/media/i2c/ar0521.c
> +++ b/drivers/media/i2c/ar0521.c
> @@ -24,7 +24,7 @@
>  #define AR0521_PLL_MAX		(1280 * 1000 * 1000)
>  
>  /* Effective pixel sample rate on the pixel array. */
> -#define AR0521_PIXEL_CLOCK_RATE	 (184 * 1000 * 1000)
> +#define AR0521_PIXEL_CLOCK_RATE	 (207 * 1000 * 1000)
>  #define AR0521_PIXEL_CLOCK_MIN	 (168 * 1000 * 1000)
>  #define AR0521_PIXEL_CLOCK_MAX	 (414 * 1000 * 1000)
>  
> @@ -91,7 +91,10 @@ static const char * const ar0521_supply_names[] = {
>  };
>  
>  static const s64 ar0521_link_frequencies[] = {
> -	184000000,
> +	/* 30 FPS at full resolution */
> +	207000000,
> +	/* 60 FPS at full resolution */
> +	414000000,
>  };
>  
>  struct ar0521_ctrls {
> @@ -330,10 +333,21 @@ static u32 calc_pll(struct ar0521_dev *sensor, u32 freq, u16 *pre_ptr, u16 *mult
>  static void ar0521_calc_mode(struct ar0521_dev *sensor)
>  {
>  	unsigned int pixel_clock;
> +	unsigned int link_freq;
> +	s64 frequency;
> +	u32 pixel_rate;
>  	u16 pre, mult;
>  	u32 vco;
>  	int bpp;
>  
> +	/* Update the PIXEL_RATE value using the desired link_frequency. */
> +	bpp = ar0521_code_to_bpp(sensor);
> +	link_freq = sensor->ctrls.link_freq->val;
> +	frequency = ar0521_link_frequencies[link_freq];
> +	pixel_rate = frequency * sensor->lane_count * 2 / bpp;
> +
> +	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixrate, pixel_rate);
> +
>  	/*
>  	 * PLL1 and PLL2 are computed equally even if the application note
>  	 * suggests a slower PLL1 clock. Maintain pll1 and pll2 divider and
> @@ -380,8 +394,7 @@ static void ar0521_calc_mode(struct ar0521_dev *sensor)
>  	 * VCO not to exceed the limits specified by the datasheet and
>  	 * consequentially reduce the obtained pixel clock.
>  	 */
> -	pixel_clock = AR0521_PIXEL_CLOCK_RATE * 2 / sensor->lane_count;
> -	bpp = ar0521_code_to_bpp(sensor);
> +	pixel_clock = pixel_rate * 2 / sensor->lane_count;
>  	sensor->pll.vt_pix = bpp / 2;
>  	vco = pixel_clock * sensor->pll.vt_pix;
>  

I checked how the driver validates the link frequencies and it seems this
one doesn't. It's also missing from DT bindings.

Would you be kind enough to add it?

Thanks.

-- 
Kind regards,

Sakari Ailus
