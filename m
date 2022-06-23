Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05118557A5F
	for <lists+linux-media@lfdr.de>; Thu, 23 Jun 2022 14:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbiFWMdw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jun 2022 08:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbiFWMdv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jun 2022 08:33:51 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6F183EF31
        for <linux-media@vger.kernel.org>; Thu, 23 Jun 2022 05:33:48 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id k24so25101781oij.2
        for <linux-media@vger.kernel.org>; Thu, 23 Jun 2022 05:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dNqUpGIkazgI1G/xTOBCokaS1cA/C7hlMGZihEpbr18=;
        b=LWndc5Zz9eBxN2qs6g8VMn5NCvfTMG+lKoC45CRCfl94dsfnW+zyQib5Na8Zmkcq8t
         gObaISAJ2hJeQTUzcNj8kgnmfXiUK4vsmEc7T2TcBU+zR+LUhc/KSN6vQ8TtW0+ME9Ay
         UhCQK5c79sCUDS+W1gYLLO4vLcOKPLUNurWSsE927KGW1+4JtpRfCDAWva5pt5hIMtT2
         BWyOi59keijbr1wsihTDAVrnBRHunszqoGNi7PNIQbtmyo1U4uBKnTaeWjH6qW8vHMuo
         3OKHrckhHN1g1sxU5Jha3zipbIZZwo1lRY4FE7v/Bk9ljiZ0px8xBtvpatSuegUEdbAI
         rrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dNqUpGIkazgI1G/xTOBCokaS1cA/C7hlMGZihEpbr18=;
        b=XGS8twcWaisEcr2u11zPhwpK7lsV7VRtbQn8VCs3xcdNXYX1S/OldzSZ0UYmp5zxAM
         J/XB2pkt0qUEtqoP+ohRU5jkXGnP7j7ASiwcUARUB5152uf60NAmkrQAYuVyjNtPFLH9
         h5cVOnIYvgVOqyV9aq3RZOyBEDUaX39iXwNUGl6Ne4imOALSf28ERtdw48I8PJvBMY7D
         uN74ecUju+cJQJ6WVBxq0t40jjQOJ5Gdx/9ZqvVt3Y6osV+vl4nDzpbWNFn9KyxR8Xw6
         rCIfthvj80Ahowex0CVnHdtmY1UL8qDPfgB1q6LgBn0CTp92d61BQDxbwq6gP3V089Xy
         19Qg==
X-Gm-Message-State: AJIora/pepVunNXgNQiYgaOBaWDSk/siKgPdHIbEDiHQWkyp5SNq9I1r
        T5KOjq/18NAinq7LE7UQ8AzREDyt7wfUDA==
X-Google-Smtp-Source: AGRyM1s9FcVC1NW7gZWT3vN5b0Bs2NgDaFVAPAcG8Z0JDlZ+wqrdn1qqjhyeSjnT61whJunN/FGkFw==
X-Received: by 2002:a05:6808:16a1:b0:2f9:bfea:e5f3 with SMTP id bb33-20020a05680816a100b002f9bfeae5f3mr2200402oib.28.1655987628238;
        Thu, 23 Jun 2022 05:33:48 -0700 (PDT)
Received: from eze-laptop ([186.13.97.222])
        by smtp.gmail.com with ESMTPSA id s24-20020a056808209800b0032e6b8e8aefsm13771077oiw.17.2022.06.23.05.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 05:33:47 -0700 (PDT)
Date:   Thu, 23 Jun 2022 09:33:41 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-media@vger.kernel.org, p.zabel@pengutronix.de,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        benjamin.gaignard@collabora.com
Subject: Re: [PATCH] hantro_v4l2: ignore enum_framesizes for non-coded
 formats without postproc
Message-ID: <YrRdpUhCUo+RajkP@eze-laptop>
References: <20220620223150.3885812-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620223150.3885812-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On Tue, Jun 21, 2022 at 12:31:50AM +0200, Michael Grzeschik wrote:
> When codec_mode is HANTRO_MODE_NONE, then vidioc_enum_framesizes should
> return with -EINVAL. At least when hantro_needs_postproc returns false.
> Which is the case for encoders. But with the latest postproc scaling
> patch this is not the case anymore. This patch is fixing this.
> 

The fix looks correct, but the commit description looks a bit confusing,
do you think you could reword it and make it more readable?

For commits that fix regressions, it's often handy to include the word "fix"
in the commit subject. How about:

  hantro: fix VIDIOC_ENUM_FRAMESIZES for non-coded formats without postproc

> Fixes: 79c987de8b35 ("media: hantro: Use post processor scaling capacities")
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks,
Ezequiel

> ---
>  drivers/staging/media/hantro/hantro_v4l2.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> index 22ad182ee972ca..0eb0873d383678 100644
> --- a/drivers/staging/media/hantro/hantro_v4l2.c
> +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> @@ -124,8 +124,11 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
>  	}
>  
>  	/* For non-coded formats check if postprocessing scaling is possible */
> -	if (fmt->codec_mode == HANTRO_MODE_NONE && hantro_needs_postproc(ctx, fmt)) {
> -		return hanto_postproc_enum_framesizes(ctx, fsize);
> +	if (fmt->codec_mode == HANTRO_MODE_NONE) {
> +		if (hantro_needs_postproc(ctx, fmt))
> +			return hanto_postproc_enum_framesizes(ctx, fsize);
> +		else
> +			return -EINVAL;
>  	} else if (fsize->index != 0) {
>  		vpu_debug(0, "invalid frame size index (expected 0, got %d)\n",
>  			  fsize->index);
> -- 
> 2.30.2
> 
