Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2E6367186
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 19:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242267AbhDURlF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 13:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242202AbhDURlA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 13:41:00 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17785C06138B
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 10:40:27 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id y62so5730369pfg.4
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 10:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h/beBkqWPWtq3+yl17G4GLEbQfDSlnnJp5RXRR66KYE=;
        b=cE0ORofprgoov158xmxjlX5mEid/m5laCX19wY+7OZffLWMAyu4RXrrYeIEa7iS9mW
         zSNDddWAs9KTix7ZcMvjMulSqHoNTB3r6cgSok/jUsVlVoYId3I8bcU4kfTnDPzWnXIU
         QbgdAPoqeRzIEGzsjsCiO8HMSyRXKLHi4ZBag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h/beBkqWPWtq3+yl17G4GLEbQfDSlnnJp5RXRR66KYE=;
        b=DiKqztKNZpA+TZE42g7wSssA+afcAn+uvBaFaT62HnDLqCE5DsMqIqehOCQQyy7yav
         LtDLk4HAtCArgF9hEqqVf9+Mw1EM5FwoOOQ983HYuotHEiaFL2aixy9wHprp8BRsH3Ob
         DBJqN9gg4xWcOF4WRWRtnxV9sUdt4l8/VL6qw/PF7xsGBirtLKEAo7SaxpqStpKmYGqv
         OM3Vns4W0HakTyiSK2/LMMCcNJ4xCr1EXoTjga1gdCz5KDn9lNqQ4r+RXOvZf0xZsKBo
         aQKTU9nMdn8CH/C9IZ6yOQZbz7y0VW1LeqvJuvOO3hul//zUF8zfImKwgqalwR/Wa2QX
         SUUQ==
X-Gm-Message-State: AOAM532xu7lsmaHaHyVnCbFfU3B1obApp3NDW3xGqJ0QyfM3hMMNhnYM
        SCvDFR88Fvu94uhUBLBBxusIYg==
X-Google-Smtp-Source: ABdhPJw2VsFXVVPmA45ixsygoh7TW76jWkUpmaK+0w/xbWIpwp9qQGUbnQTlZg9rcsnkVLbLcnJhXQ==
X-Received: by 2002:a63:5b5c:: with SMTP id l28mr22480973pgm.363.1619026826588;
        Wed, 21 Apr 2021 10:40:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m9sm58735pgt.65.2021.04.21.10.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 10:40:25 -0700 (PDT)
Date:   Wed, 21 Apr 2021 10:40:24 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ralph Metzler <rjkm@metzlerbros.de>,
        Matthias Benesch <twoof7@freenet.de>,
        Oliver Endriss <o.endriss@gmx.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] media: ngene: Fix out-of-bounds bug in
 ngene_command_config_free_buf()
Message-ID: <202104211039.31E9785@keescook>
References: <20210420001631.GA45456@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210420001631.GA45456@embeddedor>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 19, 2021 at 07:16:31PM -0500, Gustavo A. R. Silva wrote:
> Fix an 11-year old bug in ngene_command_config_free_buf() while
> addressing the following warnings caught with -Warray-bounds:
> 
> arch/alpha/include/asm/string.h:22:16: warning: '__builtin_memcpy' offset [12, 16] from the object at 'com' is out of the bounds of referenced subobject 'config' with type 'unsigned char' at offset 10 [-Warray-bounds]
> arch/x86/include/asm/string_32.h:182:25: warning: '__builtin_memcpy' offset [12, 16] from the object at 'com' is out of the bounds of referenced subobject 'config' with type 'unsigned char' at offset 10 [-Warray-bounds]
> 
> The problem is that the original code is trying to copy 6 bytes of
> data into a one-byte size member _config_ of the wrong structue
> FW_CONFIGURE_BUFFERS, in a single call to memcpy(). This causes a
> legitimate compiler warning because memcpy() overruns the length
> of &com.cmd.ConfigureBuffers.config. It seems that the right
> structure is FW_CONFIGURE_FREE_BUFFERS, instead, because it contains
> 6 more members apart from the header _hdr_. Also, the name of
> the function ngene_command_config_free_buf() suggests that the actual
> intention is to ConfigureFreeBuffers, instead of ConfigureBuffers
> (which configuration takes place in the function ngene_command_config_buf(),
> above).
> 
> Fix this by enclosing those 6 members of struct FW_CONFIGURE_FREE_BUFFERS
> into new struct config, and use &com.cmd.ConfigureFreeBuffers.config as
> the destination address, instead of &com.cmd.ConfigureBuffers.config,
> when calling memcpy().
> 
> This also helps with the ongoing efforts to globally enable
> -Warray-bounds and get us closer to being able to tighten the
> FORTIFY_SOURCE routines on memcpy().
> 
> Link: https://github.com/KSPP/linux/issues/109
> Fixes: dae52d009fc9 ("V4L/DVB: ngene: Initial check-in")
> Cc: stable@vger.kernel.org
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Nice find! Yeah, this looks like a copy/paste bug but it went unnoticed
because it's occupying the same memory via the union. Heh.

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  drivers/media/pci/ngene/ngene-core.c |  2 +-
>  drivers/media/pci/ngene/ngene.h      | 14 ++++++++------
>  2 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/pci/ngene/ngene-core.c b/drivers/media/pci/ngene/ngene-core.c
> index 07f342db6701..7481f553f959 100644
> --- a/drivers/media/pci/ngene/ngene-core.c
> +++ b/drivers/media/pci/ngene/ngene-core.c
> @@ -385,7 +385,7 @@ static int ngene_command_config_free_buf(struct ngene *dev, u8 *config)
>  
>  	com.cmd.hdr.Opcode = CMD_CONFIGURE_FREE_BUFFER;
>  	com.cmd.hdr.Length = 6;
> -	memcpy(&com.cmd.ConfigureBuffers.config, config, 6);
> +	memcpy(&com.cmd.ConfigureFreeBuffers.config, config, 6);
>  	com.in_len = 6;
>  	com.out_len = 0;
>  
> diff --git a/drivers/media/pci/ngene/ngene.h b/drivers/media/pci/ngene/ngene.h
> index 84f04e0e0cb9..3d296f1998a1 100644
> --- a/drivers/media/pci/ngene/ngene.h
> +++ b/drivers/media/pci/ngene/ngene.h
> @@ -407,12 +407,14 @@ enum _BUFFER_CONFIGS {
>  
>  struct FW_CONFIGURE_FREE_BUFFERS {
>  	struct FW_HEADER hdr;
> -	u8   UVI1_BufferLength;
> -	u8   UVI2_BufferLength;
> -	u8   TVO_BufferLength;
> -	u8   AUD1_BufferLength;
> -	u8   AUD2_BufferLength;
> -	u8   TVA_BufferLength;
> +	struct {
> +		u8   UVI1_BufferLength;
> +		u8   UVI2_BufferLength;
> +		u8   TVO_BufferLength;
> +		u8   AUD1_BufferLength;
> +		u8   AUD2_BufferLength;
> +		u8   TVA_BufferLength;
> +	} __packed config;
>  } __attribute__ ((__packed__));
>  
>  struct FW_CONFIGURE_UART {
> -- 
> 2.27.0
> 

-- 
Kees Cook
