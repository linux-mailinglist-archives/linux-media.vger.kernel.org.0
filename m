Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 956CE77A753
	for <lists+linux-media@lfdr.de>; Sun, 13 Aug 2023 17:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbjHMPW6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Aug 2023 11:22:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjHMPW5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Aug 2023 11:22:57 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29B60E54
        for <linux-media@vger.kernel.org>; Sun, 13 Aug 2023 08:22:59 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99c1f6f3884so487450166b.0
        for <linux-media@vger.kernel.org>; Sun, 13 Aug 2023 08:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691940177; x=1692544977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOYu2IPoVjQ+GlOQpp/sc735FXMDqqp74Kxel4PS4WY=;
        b=a3PZcVhzZuz5/aDJbeO8G0equz5aNJ+edAoIRlJjEa99ZpM3dCVO/TpUK25mSTOXab
         3sqpNEHvolDXdsdXNLJSsUaetXUgPWrkqohq4kgUcf55FeGpM+9lRE5pmTpaL4KVqJn6
         Xm9beVm89diSQBbDlPpADDpOP7ElHW4OOs/oOrPCPjfzMbw7eklGXVqGqpvj6awDrNbU
         LTFQzv0NC7+qLReKpxc+HhdEm+3OCMsK2miRC9MvlG3YsIPrdvswTs3fFaR1FGGAWD/4
         0FdA+FgPFyWSWqPZYL/X8LfJ0xsjMKv8W040Y4fklkjudmbAUHGM6y3tIkq71oLOm1+I
         Y5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691940177; x=1692544977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xOYu2IPoVjQ+GlOQpp/sc735FXMDqqp74Kxel4PS4WY=;
        b=gOLix0ItpNm6P+ozgsWxjH91orPqynaOARPvrkCHDlPyDmVocDItEmOa9x+G3DlNbU
         HkTblCDSWirQVGS0HdHjDeVZcVrgK4cKMrhS8seo/bKwiBlyqH2TqxZd+C7oCm4FvcuC
         WnSE/wwVMuCCm0dVETqdRQCtv32/G+u84FTXWCP1AWndqWmgJ8K54iMLw3MiptIkZxdA
         v0xUhcyZdRp2Z9bcqJWoJrUAS3N7CJHtXaK4GitGjC3Bvg77EKk3RkQdAHGsf4JkcolH
         m5kxqg9I7Aq3Ge2GVNiSzg3ixZ4kSFRRL913jGV+K/AcUhpkiVMGix+duLLQxqvvG7Ki
         MmHg==
X-Gm-Message-State: AOJu0Yz71lZHDwP8dLY5oFo1WDe1rby6KMKRMsHgnigxwKz8/FrB4cw+
        anCap1/gRR/8MqvCu7KHub8=
X-Google-Smtp-Source: AGHT+IEiqZ/AH2dkvv+d1Un7SV0dOkHEcRzNWsuK/wOuO/Tj+4wEfa+y+RQkJrzGLHdjNr5/Y97sXA==
X-Received: by 2002:a17:906:32d6:b0:99d:5adc:fdff with SMTP id k22-20020a17090632d600b0099d5adcfdffmr6179021ejk.45.1691940177122;
        Sun, 13 Aug 2023 08:22:57 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id y12-20020a17090629cc00b0099bccb03eadsm4656049eje.205.2023.08.13.08.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 08:22:56 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     TheSven73@gmail.com, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com,
        mchehab@kernel.org, wens@csie.org, samuel@sholland.org,
        linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     ruanjinjie@huawei.com
Subject: Re: [PATCH -next 2/2] media: staging: media: sunxi: cedrus: Remove redundant
 of_match_ptr()
Date:   Sun, 13 Aug 2023 17:22:55 +0200
Message-ID: <5698814.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20230811024945.2256437-3-ruanjinjie@huawei.com>
References: <20230811024945.2256437-1-ruanjinjie@huawei.com>
 <20230811024945.2256437-3-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne petek, 11. avgust 2023 ob 04:49:45 CEST je Ruan Jinjie napisal(a):
> The driver depends on CONFIG_OF, it is not necessary to use
> of_match_ptr() here.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c
> b/drivers/staging/media/sunxi/cedrus/cedrus.c index
> 8e248d4a0aec..f52df6836045 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -708,7 +708,7 @@ static struct platform_driver cedrus_driver = {
>  	.remove_new	= cedrus_remove,
>  	.driver		= {
>  		.name		= CEDRUS_NAME,
> -		.of_match_table	= of_match_ptr(cedrus_dt_match),
> +		.of_match_table	= cedrus_dt_match,
>  		.pm		= &cedrus_dev_pm_ops,
>  	},
>  };




