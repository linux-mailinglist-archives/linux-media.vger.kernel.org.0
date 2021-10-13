Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89E5A42CEDC
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 00:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231231AbhJMWwi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 18:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbhJMWwh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 18:52:37 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF551C061746
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 15:50:33 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id r17so4152051qtx.10
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 15:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xM1fMd37P0GkH+ZlVvAIHq/XlgyRCHndX09GA3o6I2w=;
        b=sV74+qP2MQF6w9NmafHoTpTolVfVwa0rljewKiYT94oDqfz0A5uHEVwWv2+SmELSHc
         tWi6VdT69T4pL6mhUtsPnJwakwfrCd8tASkny/rtRx3bV5bZnliB+S91yJtXbcd4cJsP
         CEhnBkaQthmsfom4VTyB5PDG8CoKhTHAi0ufvApv/LElVrWx/9vAwQnuQ4FIx80EIjgr
         yeORRy5s1q4pLKS0K3IRbLLUlzgFwOrD4yiBCTNTw7+G6ykXocghAiFCj3U3+GBI2e/7
         5awydk+SNqULo5yRmsVegI6pH+Cn83rFSzSS36NqX0k3ET+lDcgZ6BH/8i5vOlv2eUAo
         Kakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xM1fMd37P0GkH+ZlVvAIHq/XlgyRCHndX09GA3o6I2w=;
        b=feCqo+GM4ASJ3OIwqdJ6LTWjrFPOXCEXbVjtVQ1bLD10zYKaqrWxJs5lly8ABHSzcJ
         zoNPt3BYQCbgyaFR/+iPO+UZO+HHkMFXNBxkkqSq9yEukVVhcCgj82ImBUcfmrPkH+iX
         pWzTRqFOoJ9yHMQISHe+dOP4wj1fkQ9OZM0SynyiLVMUKb9sLNR0kxuJGkUzJFGLqIZr
         CAZo+ocl60gaiHlpTkY+4LjbFrqLq0augwBgkmHcl+gqy4gDk9FNsb3xO/IESF4glFkN
         2Vn9Rxpo4Uiw+/If+oQK2ze9+jD1Uh8vQxY1aZySvwVWoCbPIc45Tg9n/onI78Q8MyHH
         LvYw==
X-Gm-Message-State: AOAM5328DS8dGHNSboLkEHDJ/szLs4aJIFMjFsoQ161D7oUhaLy2SRCo
        awzl0jCggkd77MrEgUfUqZ7bxA==
X-Google-Smtp-Source: ABdhPJyMyktfWBfUtcNLXQN+ND/84ayn5d3dsHNkBD7ZxYgHVbjL6ZghrpM+UN8x+hQpM+G+IwpnBw==
X-Received: by 2002:ac8:7f44:: with SMTP id g4mr2516291qtk.130.1634165432864;
        Wed, 13 Oct 2021 15:50:32 -0700 (PDT)
Received: from fedora ([196.32.91.248])
        by smtp.gmail.com with ESMTPSA id g11sm606454qko.31.2021.10.13.15.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 15:50:31 -0700 (PDT)
Date:   Wed, 13 Oct 2021 19:50:27 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: rkvdec: Constify static struct
 v4l2_m2m_ops
Message-ID: <YWdis9cj3OyLFNaR@fedora>
References: <20211012221144.30638-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211012221144.30638-1-rikard.falkeborn@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 13, 2021 at 12:11:44AM +0200, Rikard Falkeborn wrote:
> The only usage of rkvdec_m2m_ops is to pass its address to v4l2_m2m_init(),
> which takes a pointer to const v4l2_m2m_ops as argument. Make it const
> to allow the compiler to put it in read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index bf00fe6534a3..28aab5c7fe33 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -677,7 +677,7 @@ static void rkvdec_device_run(void *priv)
>  		rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);
>  }
>  
> -static struct v4l2_m2m_ops rkvdec_m2m_ops = {
> +static const struct v4l2_m2m_ops rkvdec_m2m_ops = {
>  	.device_run = rkvdec_device_run,
>  };
>  
> -- 
> 2.33.0
> 
