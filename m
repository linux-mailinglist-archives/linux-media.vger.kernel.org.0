Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F17036CA425
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 14:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232225AbjC0Mbv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 08:31:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232467AbjC0Mbu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 08:31:50 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA4D140EB
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 05:31:48 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id t14so8835745ljd.5
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 05:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679920307;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bu/lxvT2KaSD2GMUVzzvNMSdz4ucFQV7venpvrr8mFQ=;
        b=MTuNzzG2C5InfTyHnjn/U5uh47yZ17eSTDqMUwnE6nBIduN19Lr5QCAbrmqASEMvTs
         j1jvQ8GNBw0ZffeheoiWCYp9wk8G3XSLH4taztWEPkkuNl08a+Mqg9G8tPZrmTDAXWNO
         dMXA+BSXKibJMc8Q0W/6yHYmEzN8e/tCejcL67TEyu/+d+Ej61uorSTx9yKb7wxaeBHM
         jpqaYU7+bj+LTsZbIGosxkYPWKV9G1UNCtq+CFqTvWtzh2KDfuYalSGSyW1jdJOE6kDi
         LzRoeGbYcRoStFOA9H6FZDamHE8xQP06zJI1K0PgIX+c9amGs2WVCAIF8fNvNO6sie+B
         vvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679920307;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bu/lxvT2KaSD2GMUVzzvNMSdz4ucFQV7venpvrr8mFQ=;
        b=ryGOdOOcm1RPus3OdQE/rBfVlDKrwwPYN9WyvsTwyAAHftUa4FG3wTeAFJQbZQn1Hj
         KoWnj4Mq4PeX7YUoN9f7oZjmyw453IEFX+e5kjv2Dv9BNiDbQCN+GjpGcn4/2LU4TVNY
         IGddTO8pYWe/ofPpkQu0TQxrQHZZjcse4HzwPauwKYz9MYnQwGMbssYstMUXXctRKbcz
         nMK1hib29gtAP/SMfv1Pn5/MHA5ZLBxZLraOjeb23UKJm9DfbPkaoWDSLXZ4a6ABNQAP
         0mSodmklsjXlG5ioBxz8q3eIURm7+mk7BzEtZYlbjg5F5f836rUG8qBh8UkRkGarROzY
         QbuQ==
X-Gm-Message-State: AAQBX9cO2HBMx6Ks50bTJRM/o/8x5jdaXAWO/w2he2Khv1AVnkp/mPeT
        njug3eIbCnLbGFH7+/cLUAY=
X-Google-Smtp-Source: AKy350a7HzDXoJ5dLGxPGsJhdOTqk0zoIuOiqefrUKq/8V5f5wG3EWmGjMyrBjAI7jJMRqsU5x611Q==
X-Received: by 2002:a05:651c:54e:b0:295:a08c:12a1 with SMTP id q14-20020a05651c054e00b00295a08c12a1mr4420396ljp.0.1679920306863;
        Mon, 27 Mar 2023 05:31:46 -0700 (PDT)
Received: from [192.168.0.192] ([194.146.248.75])
        by smtp.gmail.com with ESMTPSA id y1-20020a2eb001000000b002986854f27dsm4609023ljk.23.2023.03.27.05.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 05:31:46 -0700 (PDT)
Message-ID: <18d8a2cb-91c4-a77c-4802-1ebef62a8077@gmail.com>
Date:   Mon, 27 Mar 2023 14:31:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 070/117] media: jpeg-core: Convert to platform remove
 callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-73-u.kleine-koenig@pengutronix.de>
From:   Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
In-Reply-To: <20230326143224.572654-73-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Uwe,

W dniu 26.03.2023 o 16:31, Uwe Kleine-König pisze:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>

> ---
>   drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> index 55814041b8d8..c3c7e48f1b6e 100644
> --- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> +++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> @@ -2991,7 +2991,7 @@ static int s5p_jpeg_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> -static int s5p_jpeg_remove(struct platform_device *pdev)
> +static void s5p_jpeg_remove(struct platform_device *pdev)
>   {
>   	struct s5p_jpeg *jpeg = platform_get_drvdata(pdev);
>   	int i;
> @@ -3008,8 +3008,6 @@ static int s5p_jpeg_remove(struct platform_device *pdev)
>   		for (i = jpeg->variant->num_clocks - 1; i >= 0; i--)
>   			clk_disable_unprepare(jpeg->clocks[i]);
>   	}
> -
> -	return 0;
>   }
>   
>   #ifdef CONFIG_PM
> @@ -3164,7 +3162,7 @@ static void *jpeg_get_drv_data(struct device *dev)
>   
>   static struct platform_driver s5p_jpeg_driver = {
>   	.probe = s5p_jpeg_probe,
> -	.remove = s5p_jpeg_remove,
> +	.remove_new = s5p_jpeg_remove,
>   	.driver = {
>   		.of_match_table	= of_match_ptr(samsung_jpeg_match),
>   		.name		= S5P_JPEG_M2M_NAME,
