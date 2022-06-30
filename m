Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8921256216B
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 19:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236426AbiF3RlB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 13:41:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236417AbiF3Rk7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 13:40:59 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA09933A3F
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 10:40:58 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 7-20020a9d0107000000b00616935dd045so15215266otu.6
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 10:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=L5LM24Isd3avLAri00yP0uUJEwQfm2+0rT9x5MHEIdM=;
        b=CYPltZ+rQkyqU6YuIXsNiiWskIjHVxrB/8nXlilwqtOY2j444buUx9aqaDKXm/seRU
         Lbic5cyhoH2aORYYmQ2gZmLolgdIdEaxhuVAkwt4pUiyPHYFa1grN4ivgvQ51gbFE+cl
         K3xLj9DTg/GOvfhYfVbmCZ6GI2LZCKR2qm1YQKWpbkPgLiT20hi+22ftMucyg3cMND1U
         6Nqh8uB3nR8nMPdKOvTpXdABL2MnL/VqskpxgNbM83/dTVbfLoMXD53KXFsWn+tZSN9d
         jSfB2MTv4STv28slG+Eut8KsVG6q+0dRV+AxOCjVqKTlS9Y1qpz5VUHJiigVcxNwJbWH
         nuyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L5LM24Isd3avLAri00yP0uUJEwQfm2+0rT9x5MHEIdM=;
        b=Joc0ZdF/XuL5ceSsaCyESBfmRmpZUtd3eMaF/UGJuXUAsCIo9I/A4Yfpm4wahIBjTQ
         OWOxLuUNL2o1Ve9KsUkhdjz6lNxzCzbHQd+pO4A5QetL/7qzImf1qGoxENI94jQR6d4G
         0r7ELCeckLZIxAkTNBs5WZ/stlq888lAfRMIbfgo3chY3cMiDQi2iPm1J1Qw9+4KIATO
         DbfTdtYF5sFHwfEHdgjuIizEPqfvQ/S4EbrCho+aoomhg9fqCDHVoiVszyaxHwMRCzeG
         5vdgZE1dHR40ulrZ/1KOR/1XsRQoPHKUVYQ5b0stRGg9BNpUTN78kjnTwaTOfF2yIZVA
         cRIA==
X-Gm-Message-State: AJIora+ZuKyIGSPTJfzneWr0HvXpoQOdVtQ0MMfv7+dsooP5+x5Ao1/Z
        bhUdPqzmU6kkL+OzhTpwCYYZ0A==
X-Google-Smtp-Source: AGRyM1tFASk+uZEoikN/WRKV1KRqzG4udU6NKGy6hPh5tqzDkXxffJW3Qzy6XpqeMuezapvfPhGgZA==
X-Received: by 2002:a9d:3f1:0:b0:616:80b3:47e8 with SMTP id f104-20020a9d03f1000000b0061680b347e8mr4387751otf.213.1656610858062;
        Thu, 30 Jun 2022 10:40:58 -0700 (PDT)
Received: from eze-laptop ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id c68-20020a4a4f47000000b0035f6cf71391sm11153701oob.43.2022.06.30.10.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 10:40:57 -0700 (PDT)
Date:   Thu, 30 Jun 2022 14:40:51 -0300
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
Subject: Re: [PATCH 7/7] media: hantro: Allows luma and chroma depth to be
 different
Message-ID: <Yr3gI8L/o9DIYPWK@eze-laptop>
References: <20220617115802.396442-1-benjamin.gaignard@collabora.com>
 <20220617115802.396442-8-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617115802.396442-8-benjamin.gaignard@collabora.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 17, 2022 at 01:58:02PM +0200, Benjamin Gaignard wrote:
> Luma and chroma depth are set on different hardware registers.
> Even if they aren't identical the bitstream can be compliant
> to HEVC specifications and decoded by the hardware.
> 
> With this patch TSUNEQBD_A_MAIN10_Technicolor_2 conformance test
> is successfully decoded.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks,
Ezequiel

> ---
>  drivers/staging/media/hantro/hantro_hevc.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_hevc.c b/drivers/staging/media/hantro/hantro_hevc.c
> index 85688a4df166..26b1329893f7 100644
> --- a/drivers/staging/media/hantro/hantro_hevc.c
> +++ b/drivers/staging/media/hantro/hantro_hevc.c
> @@ -156,9 +156,6 @@ static int tile_buffer_reallocate(struct hantro_ctx *ctx)
>  
>  int hantro_hevc_validate_sps(struct hantro_ctx *ctx, const struct v4l2_ctrl_hevc_sps *sps)
>  {
> -	if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
> -		/* Luma and chroma bit depth mismatch */
> -		return -EINVAL;
>  	if (sps->bit_depth_luma_minus8 != 0 && sps->bit_depth_luma_minus8 != 2)
>  		/* Only 8-bit and 10-bit is supported */
>  		return -EINVAL;
> -- 
> 2.32.0
> 
