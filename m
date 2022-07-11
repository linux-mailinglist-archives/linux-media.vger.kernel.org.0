Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C190562152
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 19:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235346AbiF3RdS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 13:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236446AbiF3RdR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 13:33:17 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E03AD27CF7
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 10:33:15 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id r8-20020a4abf08000000b00425b1256454so1981197oop.13
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 10:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GV7rma6+T6KQeNRvTDv+srtDNdvqlj7JPB6xqwy+fxk=;
        b=ckqrfpEM/4gKBJjhBatJ51K90/WUgBhZtqvKDzA88Flf40NTPMPJ3eZDAlYNVMscNR
         Z04iE7NbvH+6wmJDcGoO0YcWZSxZ5v4kO4QOu/HcG9Y2XfVgQCyfsYK385Gcry0OEqk8
         ZtoAWYW+qF/6z3/W+NP1hXY9zVBQOgHhNxaNxkQ2ardLLkmiymDOST7wRfi6+XiPFHAW
         Y0e3rnUyJG2xSx2ya0qjfSS71MBMskruUftE+5LWofxOYujh+WBbydgzqeOtIXXL2pxo
         B8Td0OnpEnoLQd4+stuufZP1dCAIEox1NYiPQK8Y8dsDRVwiuC60fECu6q+awcJxHQvh
         Fo0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GV7rma6+T6KQeNRvTDv+srtDNdvqlj7JPB6xqwy+fxk=;
        b=b6/1lpv9+Zok2DkS5dr+hS26E4mbTUva2+Ve35bx5raUK5xroV5K+2UaXH+Sa9V07r
         d5L2eDi4JhW0sty/2aQovGC9DCLV+H2y1ABRF/H7OLGH/DWgcgrWV4UeCgDUBrprn7Xd
         C6kf6YW0K2nYIPBhgmvvBdh/fI0P84MCd38+el8EuaWpoqeYPL6nU5x8xeBG/v9mQ2KJ
         dLhRdtIM6Abii3PuvWG5X62yiXQT56JNsbaLcqx06nM29cUpIu9v/R7VSxhv5GJUmwAO
         aUn1ZAlEmtzm1n4GDMZiHJXPvxPKE4hwodzx0uJKy2C6FK5JCdXJC8PEK7NXjCx8pMka
         9jSw==
X-Gm-Message-State: AJIora8ztxO6yEMHjSyZz/oAOt5Ez5N8+GOOybRk7ovbWvE4bGiN/uwT
        i4uBc+PfE7+bUf2MVCvScsK4UQ==
X-Google-Smtp-Source: AGRyM1uHmEh/OuQKMNNKJwNpcvuxZiUW4pitk9X+/dijUMypH48J/IY4d7OKUiVi0cZ1jQhEP0B37w==
X-Received: by 2002:a4a:49d0:0:b0:425:708a:224 with SMTP id z199-20020a4a49d0000000b00425708a0224mr4367978ooa.18.1656610395166;
        Thu, 30 Jun 2022 10:33:15 -0700 (PDT)
Received: from eze-laptop ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id z18-20020a056808065200b0032ba1b363d2sm10323115oih.55.2022.06.30.10.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 10:33:14 -0700 (PDT)
Date:   Thu, 30 Jun 2022 14:33:08 -0300
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
Subject: Re: [PATCH 2/7] media: hantro: HEVC: Fix auxilary buffer size
 calculation
Message-ID: <Yr3eVDFjPBrvi5Td@eze-laptop>
References: <20220617115802.396442-1-benjamin.gaignard@collabora.com>
 <20220617115802.396442-3-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617115802.396442-3-benjamin.gaignard@collabora.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Fri, Jun 17, 2022 at 01:57:57PM +0200, Benjamin Gaignard wrote:
> SAO and FILTER buffers size depend of the bit depth.
> Make sure we have enough space for 10bit bitstreams.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks,
Ezequiel

> ---
>  drivers/staging/media/hantro/hantro_hevc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_hevc.c b/drivers/staging/media/hantro/hantro_hevc.c
> index dcb5c8703b6e..e06837108a09 100644
> --- a/drivers/staging/media/hantro/hantro_hevc.c
> +++ b/drivers/staging/media/hantro/hantro_hevc.c
> @@ -104,7 +104,7 @@ static int tile_buffer_reallocate(struct hantro_ctx *ctx)
>  		hevc_dec->tile_bsd.cpu = NULL;
>  	}
>  
> -	size = VERT_FILTER_RAM_SIZE * height64 * (num_tile_cols - 1);
> +	size = (VERT_FILTER_RAM_SIZE * height64 * (num_tile_cols - 1) * ctx->bit_depth) / 8;
>  	hevc_dec->tile_filter.cpu = dma_alloc_coherent(vpu->dev, size,
>  						       &hevc_dec->tile_filter.dma,
>  						       GFP_KERNEL);
> @@ -112,7 +112,7 @@ static int tile_buffer_reallocate(struct hantro_ctx *ctx)
>  		goto err_free_tile_buffers;
>  	hevc_dec->tile_filter.size = size;
>  
> -	size = VERT_SAO_RAM_SIZE * height64 * (num_tile_cols - 1);
> +	size = (VERT_SAO_RAM_SIZE * height64 * (num_tile_cols - 1) * ctx->bit_depth) / 8;
>  	hevc_dec->tile_sao.cpu = dma_alloc_coherent(vpu->dev, size,
>  						    &hevc_dec->tile_sao.dma,
>  						    GFP_KERNEL);
> -- 
> 2.32.0

> 
