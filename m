Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB167157BB
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 09:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbjE3H5E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 03:57:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjE3H5D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 03:57:03 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20DACD9
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 00:56:49 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-30af0aa4812so893140f8f.1
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 00:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685433407; x=1688025407;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hOkyt++obknMAdUoR1HkZssbFe+S0uKdNsu7DgM6qoY=;
        b=btQae2D2snkJMEm8OvlA+L+ippqTpq6OaChu6XKHNcpbLgdgnOv5GiXIKGUr59NPqV
         7wI69VCyHoza8rSmc/S7RzyP/mg6jFXXt3Dhe7m4FZBB1t4846DGtyfbw3sIgccKbyQ7
         7xGIi+WC+9EqtNqsaFj22WKsmLxicg/QqxohLaYrGW8B9SwfcAx9Cowm4Yo5sL2Bq0pb
         bCLAU9sqGOr8jxBnl8Vrab/o6C35N5O6T+rWgAJaj/XtL8iklU6MZURZzYqJWXYuXHSu
         /aNQd+ROKxZzIA5Nr+ZQCbBt2kC2jx5WJDD7B3UpLpUwBQAtei493IS+z3STvT4FAvlU
         Mv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685433407; x=1688025407;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOkyt++obknMAdUoR1HkZssbFe+S0uKdNsu7DgM6qoY=;
        b=RYI71QVS7DGpXLFZ06prAXRTz2hmBkUT30efp2SKzyViDPnBFjQ0QztFx3JTFQPg/z
         vL0SYLW77JT9YxOQO5LG+D/NmY7QdT3YtROwhb0FbLJE4weng3JpoP/wtzfr3NH26X+H
         oECz1p1LVANQwwQMmyt3Gxbu+0FyxyEAn7/+9rN00Y3jQrWpGB16J4fSy4HOCzq9g+4G
         qP0gu8PG09w/wCrgFRikEiIQtonP/TMSHN0G53G5yA26hX1EKgjDNn64fhHdH01oaUCt
         bBP/FmvbgJtIs7kFcWcoLPGRyFELPBCazydIkRdvIkI/kMJq9uwMrKLvLGlTFdcYg6mO
         Y+Yg==
X-Gm-Message-State: AC+VfDwZ5pA1dINcBJdSu0ywjLnnJZbm63HUgeyq0rsDfTLCnsH8g0n6
        H1AQwizNZUKJNarg2oVIj4gQ6w==
X-Google-Smtp-Source: ACHHUZ527BEd9W17BCh7+KKOflVutvSkWTXt78jWoRTvcqjTOOKk8VyjcoBT1fszno3ZhA8V7T1Fqg==
X-Received: by 2002:adf:eecc:0:b0:30a:e465:5b29 with SMTP id a12-20020adfeecc000000b0030ae4655b29mr802765wrp.57.1685433407570;
        Tue, 30 May 2023 00:56:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4294:2221:d2df:9e87? ([2a01:e0a:982:cbb0:4294:2221:d2df:9e87])
        by smtp.gmail.com with ESMTPSA id x13-20020a5d54cd000000b003063db8f45bsm2369381wrv.23.2023.05.30.00.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 00:56:47 -0700 (PDT)
Message-ID: <fa29f85b-c837-ef84-74bd-00c7365e2fbf@linaro.org>
Date:   Tue, 30 May 2023 09:56:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 1/3] media: rc: meson-ir: sort Meson IR Controller
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
 <20230517115635.31565-2-zelong.dong@amlogic.com>
Organization: Linaro Developer Services
In-Reply-To: <20230517115635.31565-2-zelong.dong@amlogic.com>
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
> For defining clearly, sort register macros and let address and bit
> macros as a set.
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>   drivers/media/rc/meson-ir.c | 35 +++++++++++++++++------------------
>   1 file changed, 17 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
> index 4b769111f78e..a32d034b33aa 100644
> --- a/drivers/media/rc/meson-ir.c
> +++ b/drivers/media/rc/meson-ir.c
> @@ -19,44 +19,43 @@
>   
>   #define DRIVER_NAME		"meson-ir"
>   
> -/* valid on all Meson platforms */
>   #define IR_DEC_LDR_ACTIVE	0x00
> +
>   #define IR_DEC_LDR_IDLE		0x04
> +
>   #define IR_DEC_LDR_REPEAT	0x08
> +

You add those blank lines here, but remove them on next patch.

>   #define IR_DEC_BIT_0		0x0c
> -#define IR_DEC_REG0		0x10
> -#define IR_DEC_FRAME		0x14
> -#define IR_DEC_STATUS		0x18
> -#define IR_DEC_REG1		0x1c
> -/* only available on Meson 8b and newer */
> -#define IR_DEC_REG2		0x20
>   
> +#define IR_DEC_REG0		0x10
>   #define REG0_RATE_MASK		GENMASK(11, 0)
>   
> -#define DECODE_MODE_NEC		0x0
> -#define DECODE_MODE_RAW		0x2
> +#define IR_DEC_FRAME		0x14
> +
> +#define IR_DEC_STATUS		0x18
> +#define STATUS_IR_DEC_IN	BIT(8)
>   
> -/* Meson 6b uses REG1 to configure the mode */
> +#define IR_DEC_REG1		0x1c
> +#define REG1_TIME_IV_MASK	GENMASK(28, 16)
> +#define REG1_ENABLE		BIT(15)
>   #define REG1_MODE_MASK		GENMASK(8, 7)
>   #define REG1_MODE_SHIFT		7
> +#define REG1_IRQSEL_MASK	GENMASK(3, 2)
> +#define REG1_RESET		BIT(0)
>   
> -/* Meson 8b / GXBB use REG2 to configure the mode */
> +/* The following regs are only available on Meson 8b and newer */
> +#define IR_DEC_REG2		0x20
>   #define REG2_MODE_MASK		GENMASK(3, 0)
>   #define REG2_MODE_SHIFT		0
>   
> -#define REG1_TIME_IV_MASK	GENMASK(28, 16)
> +#define DECODE_MODE_NEC		0x0
> +#define DECODE_MODE_RAW		0x2
>   
> -#define REG1_IRQSEL_MASK	GENMASK(3, 2)
>   #define REG1_IRQSEL_NEC_MODE	0
>   #define REG1_IRQSEL_RISE_FALL	1
>   #define REG1_IRQSEL_FALL	2
>   #define REG1_IRQSEL_RISE	3
>   
> -#define REG1_RESET		BIT(0)
> -#define REG1_ENABLE		BIT(15)
> -
> -#define STATUS_IR_DEC_IN	BIT(8)
> -
>   #define MESON_TRATE		10	/* us */
>   
>   struct meson_ir {

Without the blank lines:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
