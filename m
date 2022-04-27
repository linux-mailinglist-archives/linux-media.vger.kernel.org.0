Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FFB1511AB4
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 16:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236462AbiD0Nj0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 09:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236217AbiD0NjT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 09:39:19 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0E774B1DA
        for <linux-media@vger.kernel.org>; Wed, 27 Apr 2022 06:36:03 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id E9C891B0004C;
        Wed, 27 Apr 2022 16:36:01 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1651066562;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DV3RZ+u+U8i5YGkftbygBL2CJF0CAe9+lSVG4ClZy4M=;
        b=nHyQORs/XIx/IChgGiATMpQBhdf7+gZOWKQi/2MdoSBagqBz6El2qRQBKdEDtpNMO+DCrE
        ebE/7gUfBErbdj+ZsFBo3Q9uWfhq8iMwHp3MYtPiaLtbF5MgRmt2mZ7mcFz+XLT/RZJlM5
        Dic8i4OMdxBnCFJLfVTFRc6Odxsvxuf9Ln226CSjIOkcT29284UhbjWXOwsPX4FeweuNrO
        VzANROGaJimwISHpGDfPYnHnB4hfeGYNJ5f0Hp6i/ACqVkty2tQR7YupaGz/ZuJQ5PiWPI
        UApmg63e6bs9AO6eof1zOFr7rT4h3Opn1KJtWguJeQM3d4r50n2M8wH0IvoGWQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5E535634C91;
        Wed, 27 Apr 2022 16:36:01 +0300 (EEST)
Date:   Wed, 27 Apr 2022 16:36:01 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
        otavio@ossystems.com.br, linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: adv7180: Add support for the test patterns
Message-ID: <YmlGwTkOZ08RkTRu@valkosipuli.retiisi.eu>
References: <20220427130706.3019409-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427130706.3019409-1-festevam@gmail.com>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1651066562; a=rsa-sha256;
        cv=none;
        b=rnBak6fFVvs9lglbS6oedi1mjbJ9iVxFjIh9U+yyCDj1/OAb/E3ACYCEJK83rOSAZaarc7
        Wnq/AFulMRo+kylXbXlwcj6VStk7s9SaTW5jEdMse/9NEeGNUU92PiLJjxDcPxED3BqRxK
        rmMZ2Tu13XvPG+YyPaETkAVUyLNRRRw/JxNlP6jT3AHIKOz3EmfjqZ/dB5a9XTCcUBIEIa
        ed5pMg7+uT6WK2XN8xRvnaOpV5/pqAhxzoKrFC6qoiC0XxNIfRDu07vw2gO/UReJXBiklV
        tCDWSdon+D/VRR4EsxUiMNhyEf6FEj0DBZMFq6kpZ49k1bVw8RI1LPpILKHJ3Q==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1651066562;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DV3RZ+u+U8i5YGkftbygBL2CJF0CAe9+lSVG4ClZy4M=;
        b=GGQFTfbWK0Pk27JIv/7wdkn6Le5HrOwUGehpksigI+dF3SqKeC4BZKz8p5OxonyB/MSYSv
        S3l+L6WwttQZfdUIkKth4ij0f3qTf5b0HYaKxhmlZsBKpJvomGjJvGBRFi5jR/2v20RE5P
        ILfQ5KV7T0/uPJLnbqQxUcIZd7udPF5pExA/+ytjRtedpaY5d9Mkg8wlj9SAzd65QqK9Z4
        6EtBtUrwc9fSVNoiz+TQ3x/bxrVVp0i7k9TZKnrmrRMOl08r/W1jYT9yPp6K0sGQZxQiF4
        AZ6YHxjgUcq1OKWjZ6owzxIGGE/gOFeNg2kAiXuM3VzMoytdU7s5yoWshDjoqw==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On Wed, Apr 27, 2022 at 10:07:06AM -0300, Fabio Estevam wrote:
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
> 	3:	"Boundary box"
> 	4:	"Disable"
> 
> Tested on a imx6q board with an ADV7280.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Remove the unused options from the test pattern (Sakari).
> - Remove v4l_info() (Sakari).
> - Forced the default value to be disabled.
> 
>  drivers/media/i2c/adv7180.c | 45 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> index 4f5db195e66d..df4ad45ebffb 100644
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
> @@ -549,6 +552,40 @@ static int adv7180_s_power(struct v4l2_subdev *sd, int on)
>  	return ret;
>  }
>  
> +static const char * const test_pattern_menu[] = {
> +	"Single color",
> +	"Color bars",
> +	"Luma ramp",
> +	"Boundary box",
> +	"Disable",
> +};
> +
> +static int adv7180_test_pattern(struct adv7180_state *state, int value)
> +{
> +	unsigned int reg;
> +
> +	/* Map menu value into register value */
> +	if (value < 3)
> +		reg = value;
> +	if (value == 3)
> +		reg = 5;
> +
> +	adv7180_write(state, ADV7180_REG_ANALOG_CLAMP_CTL, reg);

ret is undefined here for values greater than 4.

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
> @@ -592,6 +629,9 @@ static int adv7180_s_ctrl(struct v4l2_ctrl *ctrl)
>  			adv7180_write(state, ADV7180_REG_FLCONTROL, 0x00);
>  		}
>  		break;
> +	case V4L2_CID_TEST_PATTERN:
> +		ret = adv7180_test_pattern(state, val);
> +		break;
>  	default:
>  		ret = -EINVAL;
>  	}
> @@ -632,6 +672,11 @@ static int adv7180_init_controls(struct adv7180_state *state)
>  			  ADV7180_HUE_MAX, 1, ADV7180_HUE_DEF);
>  	v4l2_ctrl_new_custom(&state->ctrl_hdl, &adv7180_ctrl_fast_switch, NULL);
>  
> +	v4l2_ctrl_new_std_menu_items(&state->ctrl_hdl, &adv7180_ctrl_ops,
> +				      V4L2_CID_TEST_PATTERN,
> +				      ARRAY_SIZE(test_pattern_menu) - 1,
> +				      0, 4, test_pattern_menu);

How about making default depend on ARRAY_SIZE(), just as the mask does?

> +
>  	state->sd.ctrl_handler = &state->ctrl_hdl;
>  	if (state->ctrl_hdl.error) {
>  		int err = state->ctrl_hdl.error;

-- 
Kind regards,

Sakari Ailus
