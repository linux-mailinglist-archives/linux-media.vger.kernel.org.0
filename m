Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC1751175F
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 14:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233251AbiD0L7f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 07:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233257AbiD0L7f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 07:59:35 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C9530F4E
        for <linux-media@vger.kernel.org>; Wed, 27 Apr 2022 04:56:23 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id BF7072029D;
        Wed, 27 Apr 2022 14:56:21 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1651060581;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9hu2Hnsa27yiyRBTnwPcxbq2cjN+1Vpl/ArOoErOcsg=;
        b=knc+YKOqImVcuHLHvVqTBUxlZhkNIfWcTp9pQV6EWVbPIYZap5/yrJUUL+vesbmM0O7td+
        Bsiwosjr9g+/JsJOKI5Av9cktAMpgrM0j6dG1DGMxXnu0LddTCmFdpXnw9GtARiRHYLIJn
        Ua3/qysb84FdAbNmYapjWGhiLmCMYF8=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5791F634C91;
        Wed, 27 Apr 2022 14:56:21 +0300 (EEST)
Date:   Wed, 27 Apr 2022 14:56:21 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
        otavio@ossystems.com.br, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: adv7180: Add support for the test patterns
Message-ID: <YmkvZR+Fwmvh0vx8@valkosipuli.retiisi.eu>
References: <20220426191441.2666653-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426191441.2666653-1-festevam@gmail.com>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1651060581;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9hu2Hnsa27yiyRBTnwPcxbq2cjN+1Vpl/ArOoErOcsg=;
        b=HpvI6Pgs5n5+fa5yGlaRQa4lcNH2lrbDZHUIatz5q1OXOmI4AFFg90lbnyz+1ZjyMAtOtX
        g7GuQDJoe5dUafIBj+FHarFZuzSoqScpf16HvWXJzzcyAcLW0OCcbu25TeHRbjgRnMtQwQ
        dqw+SDR3+mWlwkLp15Hd81ANrTclm0s=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1651060581; a=rsa-sha256; cv=none;
        b=wkY5I0DqxGcvNkqhDk6tEGV9HFFW2UWagTZVsK4E1TxrHyJKcEaXfKqRqiJsSpI0yrY3zZ
        K02F/1Qjs1ItUvZOtl9KDgviQ55FdGqy0s0KGyPpkVgc3+j19tAtb6sujFx4yfUa2tjoDQ
        iqkOg6d+x5sasqRIEEHoUOJ4j0Pgvr8=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

Thanks for the patch.

On Tue, Apr 26, 2022 at 04:14:41PM -0300, Fabio Estevam wrote:
> ADV7180 has a built-in mechanism to generate some video patterns,
> which is very useful for debug/bring-up activities.
> 
> Add support for it.
> 
> The test_pattern parameter can be one of the following values:
> 
> 	0:	"Single color"
> 	1:	"Color bars"
> 	2:	"Luma ramp"
> 	5:	"Boundary box"
> 	6	"Disable"
> 
> Tested on a imx6q board with an ADV7280.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/media/i2c/adv7180.c | 42 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> index 4f5db195e66d..09e01ef99694 100644
> --- a/drivers/media/i2c/adv7180.c
> +++ b/drivers/media/i2c/adv7180.c
> @@ -66,6 +66,9 @@
>  #define ADV7180_HUE_DEF		0
>  #define ADV7180_HUE_MAX		128
>  
> +#define ADV7180_REG_DEF_VALUE_Y	0x000c
> +#define ADV7180_DEF_VAL_EN		0x1
> +#define ADV7180_DEF_VAL_AUTO_EN	0x2
>  #define ADV7180_REG_CTRL		0x000e
>  #define ADV7180_CTRL_IRQ_SPACE		0x20
>  
> @@ -549,6 +552,37 @@ static int adv7180_s_power(struct v4l2_subdev *sd, int on)
>  	return ret;
>  }
>  
> +static const char * const test_pattern_menu[] = {
> +	"Single color",
> +	"Color bars",
> +	"Luma ramp",
> +	"reserved",
> +	"reserved",

Why are there reserved options in the menu? These should probably be simply
removed from the menu, or at masked out if you think you would later on add
support for them. Please tell which one you intend to do.

> +	"Boundary box",
> +	"Disable",
> +};
> +
> +static int adv7180_test_pattern(struct adv7180_state *state, int value)
> +{
> +	unsigned int reg;
> +
> +	v4l_info(state->client, "Testing pattern: %s\n", test_pattern_menu[value]);

This could be on debug level but I would simply remove it.

> +	adv7180_write(state, ADV7180_REG_ANALOG_CLAMP_CTL, value);
> +
> +	if (value == ARRAY_SIZE(test_pattern_menu) - 1) {
> +		reg = adv7180_read(state, ADV7180_REG_DEF_VALUE_Y);
> +		reg &= ~ADV7180_DEF_VAL_EN;
> +		adv7180_write(state, ADV7180_REG_DEF_VALUE_Y, reg);
> +		return 0;
> +	}
> +
> +	reg = adv7180_read(state, ADV7180_REG_DEF_VALUE_Y);
> +	reg |= ADV7180_DEF_VAL_EN | ADV7180_DEF_VAL_AUTO_EN;
> +	adv7180_write(state, ADV7180_REG_DEF_VALUE_Y, reg);
> +
> +	return 0;
> +}
> +
>  static int adv7180_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct v4l2_subdev *sd = to_adv7180_sd(ctrl);
> @@ -592,6 +626,9 @@ static int adv7180_s_ctrl(struct v4l2_ctrl *ctrl)
>  			adv7180_write(state, ADV7180_REG_FLCONTROL, 0x00);
>  		}
>  		break;
> +	case V4L2_CID_TEST_PATTERN:
> +		ret = adv7180_test_pattern(state, val);
> +		break;
>  	default:
>  		ret = -EINVAL;
>  	}
> @@ -632,6 +669,11 @@ static int adv7180_init_controls(struct adv7180_state *state)
>  			  ADV7180_HUE_MAX, 1, ADV7180_HUE_DEF);
>  	v4l2_ctrl_new_custom(&state->ctrl_hdl, &adv7180_ctrl_fast_switch, NULL);
>  
> +	v4l2_ctrl_new_std_menu_items(&state->ctrl_hdl, &adv7180_ctrl_ops,
> +				      V4L2_CID_TEST_PATTERN,
> +				      ARRAY_SIZE(test_pattern_menu) - 1,
> +				      0, 0, test_pattern_menu);
> +
>  	state->sd.ctrl_handler = &state->ctrl_hdl;
>  	if (state->ctrl_hdl.error) {
>  		int err = state->ctrl_hdl.error;

-- 
Kind regards,

Sakari Ailus
