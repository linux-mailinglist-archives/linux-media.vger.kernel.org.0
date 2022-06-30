Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDF05562149
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 19:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236187AbiF3RaZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 13:30:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233100AbiF3RaY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 13:30:24 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0A106546
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 10:30:21 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-101bb9275bcso136801fac.8
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 10:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eJY5MsxNfTnDTBWpRfYuGIpnJMS3h7qwIGokJXZf/SU=;
        b=4qpE9Xqlh8LCVZjAhVL6VmJW8gFDr5tVr6AffUScIOD0NsVctK6XwJvGUEQbj1bggv
         Zi0cl94d3kOceYChCHUi9cy7jPTzSvkjIuyReTX5OOfsDLigMNzFrWVth51sbRrvG8SV
         8C0OlVewUuJSoOvXCplJX6YbhSnE9L6+rzL2q3xwpEAOA3L1cCy+RW4vruhvVxUSKEsZ
         LlUg7Xn+IVTwD5Mageii8ELu3At8wUEi36cZ+YxZG/krL/dS65fGTsaZhMqvMI8ExxTV
         QcPxhJebo5cepb+WQclHIKyfnLNpfbHDHoN23kwA9dQnpMqDWxhZw7MmjHFTN2OOMaUp
         qdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eJY5MsxNfTnDTBWpRfYuGIpnJMS3h7qwIGokJXZf/SU=;
        b=awhxjCm4BznztepW1XSBdJN7sENQB3JO8ujN5XBYRilQ1Ju4ClHcjp+keXD4FC6ivc
         BSkAJcouQ8XoAJIYisYxSSGSE/5yeuNaAiw4MmwfGJROXWxEQB63MtquaHwPYv7SELvc
         vwjo9TSNPMP82Ah9aBV2cCf5Gd9FNjyDYou83asxPAGGjP9RRUm2KhybtDX3jOAnYqUV
         PCE2tyt3FyLKJr8nk+h4wcH3kCiG1R/exsvTS+6jP0BSU7MLbGBtuto0p+eJM3z6k7kp
         ZqTgSh2DF6NsCHpNl+fEsx4Bv32NopqrpasBmE8T5XCk1zRaKJ6RLXACe4riSTtACps1
         k/Sw==
X-Gm-Message-State: AJIora/nYcUOPTE1I2wHHNNjAEdnMofmCEMpNS7Ty8+mGrhs5TK5eE9r
        YYhudIie5K/4iGKAhJWFY5u11w==
X-Google-Smtp-Source: AGRyM1t4nWwAndTq5PNsUK2pyU0AyCgAgapJSJwk+PMvmJlVrviN4+sLMJ1Qy/YsZCdRe9kj2u2IwQ==
X-Received: by 2002:a05:6870:e2ce:b0:101:a7c3:49cb with SMTP id w14-20020a056870e2ce00b00101a7c349cbmr7105251oad.197.1656610221161;
        Thu, 30 Jun 2022 10:30:21 -0700 (PDT)
Received: from eze-laptop ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id r10-20020a056808210a00b00325cda1ff8esm10445255oiw.13.2022.06.30.10.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 10:30:20 -0700 (PDT)
Date:   Thu, 30 Jun 2022 14:30:13 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        nicolas.dufresne@collabora.com, andrzej.p@collabora.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel@collabora.com
Subject: Re: [PATCH 1/7] media: hantro: Store HEVC bit depth in context
Message-ID: <Yr3dpT/hQHM56c8o@eze-laptop>
References: <20220617115802.396442-1-benjamin.gaignard@collabora.com>
 <20220617115802.396442-2-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617115802.396442-2-benjamin.gaignard@collabora.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

Thanks for the patch.

On Fri, Jun 17, 2022 at 01:57:56PM +0200, Benjamin Gaignard wrote:
> Store HEVC bit depth in context.
> Bit depth is equal to hevc sps bit_depth_luma_minus8 + 8.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/staging/media/hantro/hantro_hevc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/media/hantro/hantro_hevc.c b/drivers/staging/media/hantro/hantro_hevc.c
> index 5984c5fa6f83..dcb5c8703b6e 100644
> --- a/drivers/staging/media/hantro/hantro_hevc.c
> +++ b/drivers/staging/media/hantro/hantro_hevc.c
> @@ -163,6 +163,8 @@ int hantro_hevc_validate_sps(struct hantro_ctx *ctx, const struct v4l2_ctrl_hevc
>  		/* Only 8-bit is supported */
>  		return -EINVAL;
>  
> +	ctx->bit_depth = sps->bit_depth_luma_minus8 + 8;
> +

This should set in hantro_hevc_s_ctrl.

Thanks!
Ezequiel

>  	/*
>  	 * for tile pixel format check if the width and height match
>  	 * hardware constraints
> -- 
> 2.32.0
> 
