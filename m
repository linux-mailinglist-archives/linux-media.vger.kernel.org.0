Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95DE64C1D19
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 21:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241142AbiBWUZu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 15:25:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235991AbiBWUZu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 15:25:50 -0500
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACB914D620
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 12:25:21 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 411BE2004E;
        Wed, 23 Feb 2022 22:25:17 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1645647917;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=aKxt5ss5Y0L0wJjyLwNnxKuP48kzUt2Z7YAj1s0sy3U=;
        b=Xvm1lJJdnpec7rc8dGuuGkgunYAM0P0+ZHhSMtMEZgkitPpcnAoxMCIApg2GHbHnou6W8h
        Uu/INtxOBkCyOdyuku6DhM4rLE0ggeuWTITaCw51ut5NB/Ymq4CBDboyngcck80XcuV1HT
        FeD4q76NjoWg2VbRJsvE5Qh2ylLj7ks=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 75095634C90;
        Wed, 23 Feb 2022 22:25:14 +0200 (EET)
Date:   Wed, 23 Feb 2022 22:25:14 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
        mirela.rabulea@nxp.com, xavier.roumegue@oss.nxp.com,
        tomi.valkeinen@ideasonboard.com, hugues.fruchet@st.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aford173@gmail.com,
        festevam@gmail.com, Eugen.Hristev@microchip.com,
        jbrunet@baylibre.com, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 18/27] media: ov5640: Implement init_cfg
Message-ID: <YhaYKpI88/1k1fbE@valkosipuli.retiisi.eu>
References: <20220223145603.121603-1-jacopo@jmondi.org>
 <20220223145603.121603-19-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223145603.121603-19-jacopo@jmondi.org>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1645647917; a=rsa-sha256; cv=none;
        b=toP+0v7Bt+wuZn4dcf1X1DzVAAjkq2APRoi+tJX4Ag7TLrE9RoXWaTwmj8r7yHXkXtTeMi
        Kpo5p0cNLOor7GmQf2qc1RPdzg/Znj2ClrI8f+3O1uCsInlLS6/0Z0aWEDRfdmSGDtiqzQ
        B8mU14fWPzql2WBn1fDk+uZjn/pe2kI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1645647917;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=aKxt5ss5Y0L0wJjyLwNnxKuP48kzUt2Z7YAj1s0sy3U=;
        b=Ga6Va0GP9D4+MClT1oJUvUSZC5t7k0bz9e4t7Rwlx62i81nHxlbEOZkyskkLUYBEzxtC8b
        7E05WDKLBIbU8WV0/3r913Zghu9zc6mPbwYRi9GiMLnJLqFCQKt+kk7+vH6SkYQQPy2kFe
        GhV0dVFzyjHLblSAN4/SSWS9q6Zmx1k=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Wed, Feb 23, 2022 at 03:55:54PM +0100, Jacopo Mondi wrote:
> Implement the init_cfg pad operation to initialize the subdev state
> format to the default one.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5640.c | 34 ++++++++++++++++++++++++----------
>  1 file changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 6c2c76b61140..c1fc2ab1e0cf 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -408,6 +408,18 @@ static inline bool ov5640_is_csi2(const struct ov5640_dev *sensor)
>   * over i2c.
>   */
>  /* YUV422 UYVY VGA@30fps */
> +
> +static const struct v4l2_mbus_framefmt ov5640_default_fmt = {
> +	.code = MEDIA_BUS_FMT_UYVY8_2X8,
> +	.width = 640,
> +	.height = 480,
> +	.colorspace = V4L2_COLORSPACE_SRGB,
> +	.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SRGB),
> +	.quantization = V4L2_QUANTIZATION_FULL_RANGE,
> +	.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SRGB),
> +	.field = V4L2_FIELD_NONE,
> +};
> +
>  static const struct reg_value ov5640_init_setting[] = {
>  	{0x3103, 0x11, 0, 0}, {0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 0},
>  	{0x3103, 0x03, 0, 0}, {0x3630, 0x36, 0, 0},
> @@ -3515,6 +3527,16 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
>  	return ret;
>  }
>  
> +static int ov5640_init_cfg(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_mbus_framefmt *fmt = v4l2_subdev_get_try_format(sd, state, 0);

Could you run

	$ ./scripts/checkpatch.pl --strict --max-line-length=80

on the entire set, and see what else is trivial to fix?

> +
> +	*fmt = ov5640_default_fmt;
> +
> +	return 0;
> +}
> +
>  static const struct v4l2_subdev_core_ops ov5640_core_ops = {
>  	.s_power = ov5640_s_power,
>  	.log_status = v4l2_ctrl_subdev_log_status,

-- 
Regards,

Sakari Ailus
