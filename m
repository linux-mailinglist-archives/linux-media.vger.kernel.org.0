Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2313142C2EA
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 16:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236703AbhJMOZY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 10:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235709AbhJMOZW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 10:25:22 -0400
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27C04C061749
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 07:23:17 -0700 (PDT)
Received: by mail-ua1-x935.google.com with SMTP id u5so4749618uao.13
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 07:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7w/SpwqUg1NtXlESs19PovhWHJiT5rNlJWgKAzuzlAE=;
        b=NXN3/6opbxMONUbmwhMTGJ45Wx47wxNTSTy8tiZ9DEIwTDESJrVNdX3Ebsqu+YcY6M
         D0gmdJ0nCNdGbmaNxXCMbvk3Kk1gkte52sQG2mM9czGZejuGOUgWpz60bd7Rs7OLIicG
         a3I8ARXHglmgKNd+4AB/JAQi4+1GPYohAzugS953pzmSHoOKXqjbmsTHEenoc4XJr91J
         cCPmlhJaFaMZD3T5b3CoV8/bu3jWISwQhGhRc5zi4dBudCBs+efvkphULFwtNhrgA2Jx
         muPKfNAzyCGOmCyvzG0tTgYeBcMycflCLzXfCHRm9SsMsGbjvwLB7sFlDqJAZ6EdMk92
         dAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7w/SpwqUg1NtXlESs19PovhWHJiT5rNlJWgKAzuzlAE=;
        b=NJN/+WT3bsY2sqBWuC98/whOlZob7ssrs9zsc4VFfIrXowX+dNTYxaDF6EAc8hQ6qJ
         LrEqNP5EtyKGCiwwXNDzPj7dC9qY1gBFPAzTCtwBpeFkkXsaGscTHtftoYzudFxVdPob
         UuanNHNrg0nmlqLpZ0BHkEAp9MPRXIpjwxrhpo1sRmcDGUItSSgLOgEs1r4hHL4ml5wo
         6TBK851+tguxe78eJ7AEM0/AOW3l3wTQJ0uku96PRhOAQssPxygCd/mQrg5NBCTFXjlS
         GQ5iuj5EJ6HCgVwrJV2yiAVTODAz1suMw+ywbapB5RlR9QGr2C/S5jHf1S5Buw2srpXU
         oVpg==
X-Gm-Message-State: AOAM532RXEoYoBrubfG9WHqPYpgJZjKdhp2hUNfqnoCsu+myclwuFE8r
        py4GmXRROxsjXWRQkE5ZVkfjkw==
X-Google-Smtp-Source: ABdhPJwTqgTV9HIXGGN+anjhVzoBSubJf8so1ONfQF8nBDLgW3FrUf6as8wCjY9HYniJ1jC0Ebnrvw==
X-Received: by 2002:a67:d189:: with SMTP id w9mr38724521vsi.55.1634134996280;
        Wed, 13 Oct 2021 07:23:16 -0700 (PDT)
Received: from fedora ([196.32.91.248])
        by smtp.gmail.com with ESMTPSA id q26sm6243875vkn.40.2021.10.13.07.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 07:23:15 -0700 (PDT)
Date:   Wed, 13 Oct 2021 11:23:11 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Chen-Yu Tsai <wenst@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        stable@vger.kernel.org
Subject: Re: [PATCH 1/2] media: rkvdec: Do not override sizeimage for output
 format
Message-ID: <YWbrz/+gZE7z+Ab5@fedora>
References: <20211008100423.739462-1-wenst@chromium.org>
 <20211008100423.739462-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211008100423.739462-2-wenst@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Chen-Yu,

On Fri, Oct 08, 2021 at 06:04:22PM +0800, Chen-Yu Tsai wrote:
> The rkvdec H.264 decoder currently overrides sizeimage for the output
> format. This causes issues when userspace requires and requests a larger
> buffer, but ends up with one of insufficient size.
> 
> Instead, only provide a default size if none was requested. This fixes
> the video_decode_accelerator_tests from Chromium failing on the first
> frame due to insufficient buffer space. It also aligns the behavior
> of the rkvdec driver with the Hantro and Cedrus drivers.
> 
> Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks for taking care of this!

Ezequiel

> ---
>  drivers/staging/media/rkvdec/rkvdec-h264.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
> index 76e97cbe2512..951e19231da2 100644
> --- a/drivers/staging/media/rkvdec/rkvdec-h264.c
> +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
> @@ -1015,8 +1015,9 @@ static int rkvdec_h264_adjust_fmt(struct rkvdec_ctx *ctx,
>  	struct v4l2_pix_format_mplane *fmt = &f->fmt.pix_mp;
>  
>  	fmt->num_planes = 1;
> -	fmt->plane_fmt[0].sizeimage = fmt->width * fmt->height *
> -				      RKVDEC_H264_MAX_DEPTH_IN_BYTES;
> +	if (!fmt->plane_fmt[0].sizeimage)
> +		fmt->plane_fmt[0].sizeimage = fmt->width * fmt->height *
> +					      RKVDEC_H264_MAX_DEPTH_IN_BYTES;
>  	return 0;
>  }
>  
> -- 
> 2.33.0.882.g93a45727a2-goog
> 
