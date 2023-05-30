Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 314617157BE
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 09:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbjE3H5u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 03:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjE3H5t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 03:57:49 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E047790
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 00:57:45 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3078cc99232so3906789f8f.3
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 00:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685433464; x=1688025464;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jbV3N0ycjw87JVFX5RR+NdqMKuAcPpiZ58zQNaW5p50=;
        b=BCGMqawU0eogewqQq63aT0WFndPTjmmgETnRtWqrMB/HjCus60k1h9+QzYj2Op6Z9T
         315zWLiZF9E1Bd+h3Mbk61OymwhVWzn1szKOnaBM3gcGqrIFb6v07TydKRsMtTnHDi8V
         2RjfmUiF6urmDDxURaGAhI5ILE87r3FHqITDKuJ4p/OuaIKFOqmrlwtKaeRGOJlzMueS
         jBN8xLr1e5gZfC4Xj1UEH6Ez73B44PSjp6gobeUuUrccIBXOh8uWvxFmxQGtz2CccR3E
         QmbddYnRgKhNJq/tJjFRWAY4mMOtO12BSEBXIETOcQpO07K0NG/cAcS11u6aDT41YlPi
         VhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685433464; x=1688025464;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jbV3N0ycjw87JVFX5RR+NdqMKuAcPpiZ58zQNaW5p50=;
        b=EurqCZ80WT7A/oUodHSY+Hc4VXeRNR11bVcRalZlU4lY2gjzf7igMnOR7IWLU1WEPJ
         izHC7vQ5DY4NuHLVUSz3eIWHOo98dYkPPPZ3N7GFIWdYY/QbfYtKae11AplLSgLf7zbA
         y1G4WedzDsrxNqxyzR586aADt4QYHskOOeQ8jrkNdncqXIlnPCqiUjUbshZi78z9b8Wi
         IvN/DPolnWn3kEvNf9MeFMFmONOddu8GYU+l9krcc+LzVylvDuXg/Blwr0bDOJcsDEUh
         lWTO/tvu+GG8RE2luAI2cS5JFWYjxjUOn44aHss91rNp8K+WGv6h/hmvbOqIvzS61PLu
         AtcA==
X-Gm-Message-State: AC+VfDxQBx/8+WsHDQRlTG1YEhiqTlDSLSUQhqlyTqheCQCioWhwAxNm
        +p4U85p2XNOxTlcJTN8QynXSjA==
X-Google-Smtp-Source: ACHHUZ6cV+EMsavNN6U2e69iCMVRS7YYBLa+tLoNkjXbcz0OjR5+D+hlXVoexIWfVqqsVUt1sJQcmA==
X-Received: by 2002:a5d:6382:0:b0:306:2f91:302e with SMTP id p2-20020a5d6382000000b003062f91302emr1321232wru.21.1685433464262;
        Tue, 30 May 2023 00:57:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4294:2221:d2df:9e87? ([2a01:e0a:982:cbb0:4294:2221:d2df:9e87])
        by smtp.gmail.com with ESMTPSA id b21-20020a05600c4e1500b003f4283f5c1bsm29093553wmq.2.2023.05.30.00.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 00:57:43 -0700 (PDT)
Message-ID: <417cfe9a-4dfa-42ab-0397-ce59a2566d8d@linaro.org>
Date:   Tue, 30 May 2023 09:57:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/3] media: rc: meson-ir: rename Meson IR Controller
 register macros
Content-Language: en-US
To:     zelong dong <zelong.dong@amlogic.com>, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com,
        kelvin.zhang@amlogic.com
References: <20230517115635.31565-1-zelong.dong@amlogic.com>
 <20230517115635.31565-3-zelong.dong@amlogic.com>
Organization: Linaro Developer Services
In-Reply-To: <20230517115635.31565-3-zelong.dong@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/05/2023 13:56, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> There are more registers to come in the next Meson IR Controller.
> For defining clearly, rename register macros.
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>   drivers/media/rc/meson-ir.c | 80 ++++++++++++++++++-------------------
>   1 file changed, 40 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
> index a32d034b33aa..7ab6304f7184 100644
> --- a/drivers/media/rc/meson-ir.c
> +++ b/drivers/media/rc/meson-ir.c
> @@ -20,43 +20,39 @@
>   #define DRIVER_NAME		"meson-ir"
>   
>   #define IR_DEC_LDR_ACTIVE	0x00
> -
>   #define IR_DEC_LDR_IDLE		0x04
> -
>   #define IR_DEC_LDR_REPEAT	0x08
> -
>   #define IR_DEC_BIT_0		0x0c
>   
>   #define IR_DEC_REG0		0x10
> -#define REG0_RATE_MASK		GENMASK(11, 0)
> +#define IR_DEC_REG0_BASE_TIME	GENMASK(11, 0)
>   
>   #define IR_DEC_FRAME		0x14
>   
>   #define IR_DEC_STATUS		0x18
> -#define STATUS_IR_DEC_IN	BIT(8)
> +#define IR_DEC_STATUS_PULSE	BIT(8)
>   
>   #define IR_DEC_REG1		0x1c
> -#define REG1_TIME_IV_MASK	GENMASK(28, 16)
> -#define REG1_ENABLE		BIT(15)
> -#define REG1_MODE_MASK		GENMASK(8, 7)
> -#define REG1_MODE_SHIFT		7
> -#define REG1_IRQSEL_MASK	GENMASK(3, 2)
> -#define REG1_RESET		BIT(0)
> +#define IR_DEC_REG1_TIME_IV	GENMASK(28, 16)
> +#define IR_DEC_REG1_ENABLE	BIT(15)
> +#define IR_DEC_REG1_MODE	GENMASK(8, 7)
> +#define IR_DEC_REG1_IRQSEL	GENMASK(3, 2)
> +#define IR_DEC_REG1_RESET	BIT(0)
>   
>   /* The following regs are only available on Meson 8b and newer */
>   #define IR_DEC_REG2		0x20
> -#define REG2_MODE_MASK		GENMASK(3, 0)
> -#define REG2_MODE_SHIFT		0
> +#define IR_DEC_REG2_MODE	GENMASK(3, 0)
>   
> -#define DECODE_MODE_NEC		0x0
> -#define DECODE_MODE_RAW		0x2
> +#define DEC_MODE_NEC		0x0
> +#define DEC_MODE_RAW		0x2
>   
> -#define REG1_IRQSEL_NEC_MODE	0
> -#define REG1_IRQSEL_RISE_FALL	1
> -#define REG1_IRQSEL_FALL	2
> -#define REG1_IRQSEL_RISE	3
> +#define IRQSEL_NEC_MODE		0
> +#define IRQSEL_RISE_FALL	1
> +#define IRQSEL_FALL		2
> +#define IRQSEL_RISE		3
>   
> -#define MESON_TRATE		10	/* us */
> +#define MESON_RAW_TRATE		10	/* us */
> +#define MESON_HW_TRATE		20	/* us */
>   
>   struct meson_ir {
>   	void __iomem	*reg;
> @@ -84,11 +80,11 @@ static irqreturn_t meson_ir_irq(int irqno, void *dev_id)
>   	spin_lock(&ir->lock);
>   
>   	duration = readl_relaxed(ir->reg + IR_DEC_REG1);
> -	duration = FIELD_GET(REG1_TIME_IV_MASK, duration);
> -	rawir.duration = duration * MESON_TRATE;
> +	duration = FIELD_GET(IR_DEC_REG1_TIME_IV, duration);
> +	rawir.duration = duration * MESON_RAW_TRATE;
>   
>   	status = readl_relaxed(ir->reg + IR_DEC_STATUS);
> -	rawir.pulse = !!(status & STATUS_IR_DEC_IN);
> +	rawir.pulse = !!(status & IR_DEC_STATUS_PULSE);
>   
>   	ir_raw_event_store_with_timeout(ir->rc, &rawir);
>   
> @@ -130,7 +126,7 @@ static int meson_ir_probe(struct platform_device *pdev)
>   	map_name = of_get_property(node, "linux,rc-map-name", NULL);
>   	ir->rc->map_name = map_name ? map_name : RC_MAP_EMPTY;
>   	ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
> -	ir->rc->rx_resolution = MESON_TRATE;
> +	ir->rc->rx_resolution = MESON_RAW_TRATE;
>   	ir->rc->min_timeout = 1;
>   	ir->rc->timeout = IR_DEFAULT_TIMEOUT;
>   	ir->rc->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
> @@ -152,24 +148,27 @@ static int meson_ir_probe(struct platform_device *pdev)
>   	}
>   
>   	/* Reset the decoder */
> -	meson_ir_set_mask(ir, IR_DEC_REG1, REG1_RESET, REG1_RESET);
> -	meson_ir_set_mask(ir, IR_DEC_REG1, REG1_RESET, 0);
> +	meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_RESET,
> +			  IR_DEC_REG1_RESET);
> +	meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_RESET, 0);
>   
>   	/* Set general operation mode (= raw/software decoding) */
>   	if (of_device_is_compatible(node, "amlogic,meson6-ir"))
> -		meson_ir_set_mask(ir, IR_DEC_REG1, REG1_MODE_MASK,
> -				  FIELD_PREP(REG1_MODE_MASK, DECODE_MODE_RAW));
> +		meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_MODE,
> +				  FIELD_PREP(IR_DEC_REG1_MODE, DEC_MODE_RAW));
>   	else
> -		meson_ir_set_mask(ir, IR_DEC_REG2, REG2_MODE_MASK,
> -				  FIELD_PREP(REG2_MODE_MASK, DECODE_MODE_RAW));
> +		meson_ir_set_mask(ir, IR_DEC_REG2, IR_DEC_REG2_MODE,
> +				  FIELD_PREP(IR_DEC_REG2_MODE, DEC_MODE_RAW));
>   
>   	/* Set rate */
> -	meson_ir_set_mask(ir, IR_DEC_REG0, REG0_RATE_MASK, MESON_TRATE - 1);
> +	meson_ir_set_mask(ir, IR_DEC_REG0, IR_DEC_REG0_BASE_TIME,
> +			  MESON_RAW_TRATE - 1);
>   	/* IRQ on rising and falling edges */
> -	meson_ir_set_mask(ir, IR_DEC_REG1, REG1_IRQSEL_MASK,
> -			  FIELD_PREP(REG1_IRQSEL_MASK, REG1_IRQSEL_RISE_FALL));
> +	meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_IRQSEL,
> +			  FIELD_PREP(IR_DEC_REG1_IRQSEL, IRQSEL_RISE_FALL));
>   	/* Enable the decoder */
> -	meson_ir_set_mask(ir, IR_DEC_REG1, REG1_ENABLE, REG1_ENABLE);
> +	meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_ENABLE,
> +			  IR_DEC_REG1_ENABLE);
>   
>   	dev_info(dev, "receiver initialized\n");
>   
> @@ -183,7 +182,7 @@ static int meson_ir_remove(struct platform_device *pdev)
>   
>   	/* Disable the decoder */
>   	spin_lock_irqsave(&ir->lock, flags);
> -	meson_ir_set_mask(ir, IR_DEC_REG1, REG1_ENABLE, 0);
> +	meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_ENABLE, 0);
>   	spin_unlock_irqrestore(&ir->lock, flags);
>   
>   	return 0;
> @@ -203,14 +202,15 @@ static void meson_ir_shutdown(struct platform_device *pdev)
>   	 * bootloader a chance to power the system back on
>   	 */
>   	if (of_device_is_compatible(node, "amlogic,meson6-ir"))
> -		meson_ir_set_mask(ir, IR_DEC_REG1, REG1_MODE_MASK,
> -				  DECODE_MODE_NEC << REG1_MODE_SHIFT);
> +		meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_MODE,
> +				  FIELD_PREP(IR_DEC_REG1_MODE, DEC_MODE_NEC));
>   	else
> -		meson_ir_set_mask(ir, IR_DEC_REG2, REG2_MODE_MASK,
> -				  DECODE_MODE_NEC << REG2_MODE_SHIFT);
> +		meson_ir_set_mask(ir, IR_DEC_REG2, IR_DEC_REG2_MODE,
> +				  FIELD_PREP(IR_DEC_REG2_MODE, DEC_MODE_NEC));
>   
>   	/* Set rate to default value */
> -	meson_ir_set_mask(ir, IR_DEC_REG0, REG0_RATE_MASK, 0x13);
> +	meson_ir_set_mask(ir, IR_DEC_REG0, IR_DEC_REG0_BASE_TIME,
> +			  MESON_HW_TRATE - 1);
>   
>   	spin_unlock_irqrestore(&ir->lock, flags);
>   }

Without the unneded removed blank lines:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
