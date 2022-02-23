Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B528A4C1D16
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 21:23:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241053AbiBWUX4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 15:23:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235991AbiBWUXy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 15:23:54 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A0474D266
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 12:23:25 -0800 (PST)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 34D851B00043;
        Wed, 23 Feb 2022 22:23:20 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1645647800;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=g86j9AUNRvz6BvAY9B1aCUW2TxXSxLgI/vA+PiMyxi8=;
        b=HIp47NXLSOY6CWCxRoPRzXo17b3zCijgLYA7feqixMPgSqh6NngWeqpE1R3Wv/OvhIhtXD
        2JQ/MgP6k0Ji9P3JE1nHovXzhsFP6IpBkhskyYT9GJqmy7BooN7OSSL8FCG0sWpUOhUpMe
        j4S1ldXv4UrqbxL9Us6qQw3MJ+erxXPlOv9D/jgPszn5bBl4lEp3f8mX2pbUoinagfwNQq
        tA2DXmKmk4WdHCObkfBhshJ+EL0Q6/FjQ+QJONuinq3Zp+wIvu54FGiYnz47NYhxntOE4L
        URMhHP5b0YFmiwzS2miH7jlNvi1qZfoYzjckSBEyDcp1rsDH1iHFj+v7DhgV/g==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id BE340634C91;
        Wed, 23 Feb 2022 22:23:19 +0200 (EET)
Date:   Wed, 23 Feb 2022 22:23:19 +0200
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
Subject: Re: [PATCH v4 16/27] media: ov5640: Add VBLANK control
Message-ID: <YhaXtyHqVY00WWpn@valkosipuli.retiisi.eu>
References: <20220223145603.121603-1-jacopo@jmondi.org>
 <20220223145603.121603-17-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223145603.121603-17-jacopo@jmondi.org>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1645647800; a=rsa-sha256;
        cv=none;
        b=VoY1NHnNSEEbTzBZyxu1Uuy+5XWeTx8Qz1cjpAcnCvpZQPoOfF2gCZkmaWuZvDlv0e3sqQ
        e6Dtd+9EXfnlz/R/mNNkz6K5CCgRTWAGSjxwvKvQEmhNGPvkx3VfzRSMlg+YbGSG5h5qrL
        juX+UjweJixZCbgH04gspfilcsIEwoJTH7ohVDzCDDIkiImjj/wF9sE5SjvhKsZ1fGFK5g
        cnj1uzlZbT+7+BjfbhROsgC1dLgBSlek3QR0VhfLwWnnyMqW37t8GiR8F6b5SSjKml8Oeo
        jFVDX0woC8fqTLU7gsRXdzP3MSQoBPwyZIIx9YP2CoXDxQEobboyuLqqB5w+og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1645647800;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=g86j9AUNRvz6BvAY9B1aCUW2TxXSxLgI/vA+PiMyxi8=;
        b=LyX6isvBSLqgM2NhhJRTYbXr5+YO9QxQTpVkXbdLtpnSnKO8jgIBRUbsU1qsuAGWluQbng
        ML5r6sQbQRg+1lSD1KapTq4uULFZxfSddIAOCQX8H/PVovTK98+cdXk0sKq4QI+7aIxofF
        +ocLmUB4Vwpm1Eu7uJMopVGgxRhf/kGuBjncWHTw8igx7qUc7sfib2L+A1VMkg2GwERC68
        JD4AmEZcOVbu1PcHTdXUJisuDmnO/MB4JYGWBw70QBySxWDlzSSasr+Selue1sXB+olPnn
        vu5oe57w6PEGM0Ez4naNvCk/8lnxEkPM26vObfGe92Lr9JyYxzchj2XW3k0ucg==
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

On Wed, Feb 23, 2022 at 03:55:52PM +0100, Jacopo Mondi wrote:
> Add the VBLANK control which allows to select the duration of the
> frame vertical blankings and allows to control the framerate.
> 
> The VBLANK control also modifies the exposure time range, which cannot
> exceed the maximum frame length.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5640.c | 57 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index bf84f32436b1..134129fc13ae 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -36,6 +36,10 @@
>  #define OV5640_PIXEL_ARRAY_WIDTH	2592
>  #define OV5640_PIXEL_ARRAY_HEIGHT	1944
>  
> +/* FIXME: not documented. */
> +#define OV5640_MIN_VBLANK	24
> +#define OV5640_MAX_VTS		1968
> +
>  #define OV5640_DEFAULT_SLAVE_ID 0x3c
>  
>  #define OV5640_LINK_RATE_MAX		490000000U
> @@ -321,6 +325,7 @@ struct ov5640_ctrls {
>  	struct v4l2_ctrl *pixel_rate;
>  	struct v4l2_ctrl *link_freq;
>  	struct v4l2_ctrl *hblank;
> +	struct v4l2_ctrl *vblank;
>  	struct {
>  		struct v4l2_ctrl *auto_exp;
>  		struct v4l2_ctrl *exposure;
> @@ -2693,6 +2698,7 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
>  	struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
>  	enum ov5640_pixel_rate_id pixel_rate_id = mode->pixel_rate;
>  	const struct ov5640_timings *timings;
> +	s64 exposure_val, exposure_max;
>  	unsigned int hblank;
>  	unsigned int i = 0;
>  	u32 pixel_rate;
> @@ -2751,6 +2757,20 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
>  	__v4l2_ctrl_modify_range(sensor->ctrls.hblank,
>  				 hblank, hblank, 1, hblank);
>  
> +	__v4l2_ctrl_modify_range(sensor->ctrls.vblank,
> +				 OV5640_MIN_VBLANK,
> +				 OV5640_MAX_VTS - mode->height, 1,
> +				 timings->vblank_def);
> +	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, timings->vblank_def);
> +
> +	exposure_max = timings->crop.height + timings->vblank_def - 4;
> +	exposure_val = clamp((s64)sensor->ctrls.exposure->val,
> +			     (s64)sensor->ctrls.exposure->minimum,

No need for casting here.

Do you need 64-bit values here? The control value is a signed 32-bit
number.

> +			     (s64)exposure_max);
> +	__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
> +				 sensor->ctrls.exposure->minimum,
> +				 exposure_max, 1, exposure_val);
> +
>  	return 0;
>  }
>  
> @@ -3123,6 +3143,15 @@ static int ov5640_set_ctrl_vflip(struct ov5640_dev *sensor, int value)
>  			      (BIT(2) | BIT(1)) : 0);
>  }
>  
> +static int ov5640_set_ctrl_vblank(struct ov5640_dev *sensor, int value)
> +{
> +	const struct ov5640_mode_info *mode = sensor->current_mode;
> +
> +	/* Update the VTOT timing register value. */
> +	return ov5640_write_reg16(sensor, OV5640_REG_TIMING_VTS,
> +				  mode->height + value);
> +}
> +
>  static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
> @@ -3153,10 +3182,29 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
>  	struct ov5640_dev *sensor = to_ov5640_dev(sd);
> +	const struct ov5640_mode_info *mode = sensor->current_mode;
> +	const struct ov5640_timings *timings;
> +	unsigned int exp_max;
>  	int ret;
>  
>  	/* v4l2_ctrl_lock() locks our own mutex */
>  
> +	if (ov5640_is_csi2(sensor))
> +		timings = &mode->csi2_timings;
> +	else
> +		timings = &mode->dvp_timings;

Could you use ov5640_timings() here?

> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_VBLANK:
> +		/* Update the exposure range to the newly programmed vblank. */
> +		exp_max = mode->height + ctrl->val - 4;
> +		__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
> +					 sensor->ctrls.exposure->minimum,
> +					 exp_max, sensor->ctrls.exposure->step,
> +					 timings->vblank_def);
> +		break;
> +	}
> +
>  	/*
>  	 * If the device is not powered up by the host driver do
>  	 * not apply any controls to H/W at this time. Instead
> @@ -3196,6 +3244,9 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_VFLIP:
>  		ret = ov5640_set_ctrl_vflip(sensor, ctrl->val);
>  		break;
> +	case V4L2_CID_VBLANK:
> +		ret = ov5640_set_ctrl_vblank(sensor, ctrl->val);
> +		break;
>  	default:
>  		ret = -EINVAL;
>  		break;
> @@ -3216,6 +3267,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>  	struct ov5640_ctrls *ctrls = &sensor->ctrls;
>  	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
>  	const struct ov5640_timings *timings;
> +	unsigned int max_vblank;
>  	unsigned int hblank;
>  	int ret;
>  
> @@ -3241,6 +3293,11 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>  	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK, hblank,
>  					  hblank, 1, hblank);
>  
> +	max_vblank = OV5640_MAX_VTS - mode->height;
> +	ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
> +					  OV5640_MIN_VBLANK, max_vblank,
> +					  1, timings->vblank_def);
> +
>  	/* Auto/manual white balance */
>  	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
>  					   V4L2_CID_AUTO_WHITE_BALANCE,
> -- 
> 2.35.0
> 

-- 
Sakari Ailus
