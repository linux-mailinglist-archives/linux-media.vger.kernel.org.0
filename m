Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2C0457232
	for <lists+linux-media@lfdr.de>; Fri, 19 Nov 2021 16:53:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236083AbhKSP4q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Nov 2021 10:56:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234297AbhKSP4q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Nov 2021 10:56:46 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72BCDC061574;
        Fri, 19 Nov 2021 07:53:44 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id u1so18875157wru.13;
        Fri, 19 Nov 2021 07:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kHaNRUFisXjYgHBC5B676Xg2I2fpmEyhpkjhdGVDAKM=;
        b=ZdsrF1YMpdZEaLIT879zO5XP/0/GIL8TxMBkQ+oBsQDHC1XffTe15Xo3zOi3CfQsIW
         SfVZp4yHJp3z6FO0MsoJXz0l5pt72hEQWvDyTiTNXJ65m72213zH2YphOawDgUHrqFZg
         tf1fwGadrOC01WL4AAOUCOhNnAIBOhdtZDBp3yH4MwsBVM9OKuO6vgyh1H8JHe9c3xY1
         UcZo8yTpxG5QeCXLSEf6W72WVbX+H0+LNvX6UNtwHB7Trtj91sRqcosYwE/7fDXi08aS
         XGvGFyrXuKCwi0OFOk6jB9JJC6OpJTiJYJKoFXtDW03cMkWwti8iZlRh1DJ1Q3TKYKQR
         epJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kHaNRUFisXjYgHBC5B676Xg2I2fpmEyhpkjhdGVDAKM=;
        b=X5VuDoz3JHL8C6Le9YgZzV08TolGKWpu3HaH5FNrza8JQKRu3YoRbovjxtLLBUKjEm
         n0Lm72c7kCSej9Y+UeNBmoVKV4C4lJgbyEQcLC6PnVJZLB7T+PFZ5faaEa2HoItmtBg1
         daYONpXWG9hgV84yTonu3klK5MgxP0TldOhpDLBNdSdw61rUhXcRexA4HeKYmhThAwTy
         +mObJt1Ev/ZsyL2u+pH9sjO3U+urYZRnqNUSo9OeM4cXk9DfM2ZT5kcQy4CuKMSSOTZG
         XQFrFXuc4iFJr2LXcRt3th85Xp2BP2FV05pxzUs8rjcadfoxKeQk+OZcsdyyATTemQpK
         gPYQ==
X-Gm-Message-State: AOAM532M51xYYZdu3wbB86icRJwvmQfOnItdfzdZ0BLkv27UFr9bUmxE
        dNOqXgwuf818XaNtlD5h0pg=
X-Google-Smtp-Source: ABdhPJwoTWQYUCPa9Te8PwG+K8gFrG5i33W0fugyKvlgWtaRFt6efNHW+zbBPrEgEzqCPEArSG3Bvw==
X-Received: by 2002:a5d:69ce:: with SMTP id s14mr8340988wrw.25.1637337222991;
        Fri, 19 Nov 2021 07:53:42 -0800 (PST)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id m2sm12397317wml.15.2021.11.19.07.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 07:53:42 -0800 (PST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Samuel Holland <samuel@sholland.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev,
        Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/2] media: cedrus: Add support for the D1 variant
Date:   Fri, 19 Nov 2021 16:53:41 +0100
Message-ID: <5766379.lOV4Wx5bFT@kista>
In-Reply-To: <20211119031519.23430-2-samuel@sholland.org>
References: <20211119031519.23430-1-samuel@sholland.org> <20211119031519.23430-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Samuel!

Dne petek, 19. november 2021 ob 04:15:18 CET je Samuel Holland napisal(a):
> D1 has a unique variant of the video engine, which appears to drop the
> VP8 support found on most earlier variants.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/
media/sunxi/cedrus/cedrus.c
> index c76fc97d97a0..4a4b714b0f26 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -580,6 +580,14 @@ static const struct cedrus_variant 
sun8i_r40_cedrus_variant = {
>  	.mod_rate	= 297000000,
>  };
>  
> +static const struct cedrus_variant sun20i_d1_cedrus_variant = {
> +	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
> +			  CEDRUS_CAPABILITY_MPEG2_DEC |
> +			  CEDRUS_CAPABILITY_H264_DEC |
> +			  CEDRUS_CAPABILITY_H265_DEC,

Did you check if VP8 really doesn't work? It would be strange because it 
shares decoding blocks with H264 and VP8 is present in (almost) all SoCs.

Best regards,
Jernej

> +	.mod_rate	= 432000000,
> +};
> +
>  static const struct cedrus_variant sun50i_a64_cedrus_variant = {
>  	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
>  			  CEDRUS_CAPABILITY_MPEG2_DEC |
> @@ -637,6 +645,10 @@ static const struct of_device_id cedrus_dt_match[] = {
>  		.compatible = "allwinner,sun8i-r40-video-engine",
>  		.data = &sun8i_r40_cedrus_variant,
>  	},
> +	{
> +		.compatible = "allwinner,sun20i-d1-video-engine",
> +		.data = &sun20i_d1_cedrus_variant,
> +	},
>  	{
>  		.compatible = "allwinner,sun50i-a64-video-engine",
>  		.data = &sun50i_a64_cedrus_variant,
> -- 
> 2.32.0
> 
> 


