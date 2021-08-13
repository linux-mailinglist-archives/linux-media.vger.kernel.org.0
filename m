Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97E973EBA32
	for <lists+linux-media@lfdr.de>; Fri, 13 Aug 2021 18:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234367AbhHMQig (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Aug 2021 12:38:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233827AbhHMQig (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Aug 2021 12:38:36 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A6FBC061756
        for <linux-media@vger.kernel.org>; Fri, 13 Aug 2021 09:38:09 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id a20so12762600plm.0
        for <linux-media@vger.kernel.org>; Fri, 13 Aug 2021 09:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rKvd8GPFgFZOtNQzzws03kml/1ydB9Y6K/jtiteL0wc=;
        b=mkunRimklcu7tq5sSrKfl+MZalwCsCE4vJGGtvK/+ezuV7gNnMBYCay5kpiCcnF0DR
         r07bEiI8kfE2zFDR77solHFcAHg4UcjgdwcGYlr7CUxBh3a2rlLuN9NjGkRit/PgLxIK
         fApuGfKI4bNzgewxf98oGVyAj4fiqfE+NFY3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rKvd8GPFgFZOtNQzzws03kml/1ydB9Y6K/jtiteL0wc=;
        b=HpEarsOiGCGoLMskvv9vgdWKpbTjM/o3vh/3Vt/3HNY623dszJGlBWxgrtAbkQqkJg
         uue1Exdt0nksZouFfm+aMxD4/JOofWRIPK/dT4xwW0RrzcUT+Nz7q0fD97oKT6wBgfYw
         v0SOB2qaQ8WgX4Tv8Q/875euez9KRQgR1HyBZKysFGaBIQtxWG8GeGlm8Wr2tT51KNVJ
         xQ6U/qQPOGmbQYc7kld7kqvTh2QBkNZ4bJIXTnvlxRJISNtyih5SgwZG6u4zDXz3ggFv
         9owv9rkXV3xz27meSB1j3GmDvyL3WLgqE9lH2aisnMsPwjPzOQf+ijniAToTmVKwd8sC
         mk+g==
X-Gm-Message-State: AOAM531wK3wPB1WMhDRiEuRMtAHjuJDVEHEISxdvGFjCZt4CSssQ0sTN
        WBAULuMO8Fq+9WQfbB6eWIamNg==
X-Google-Smtp-Source: ABdhPJwWTb+EHLsKayUYtAvOSVOUAdQtjnMHIwfubJ7iDXxddJbwYUHITnIGBY+2pLtZ3MYHoMtp7g==
X-Received: by 2002:a62:6042:0:b029:3e0:86b4:51b with SMTP id u63-20020a6260420000b02903e086b4051bmr3241725pfb.62.1628872688791;
        Fri, 13 Aug 2021 09:38:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q5sm2291199pjo.7.2021.08.13.09.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 09:38:08 -0700 (PDT)
Date:   Fri, 13 Aug 2021 09:38:07 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Skripkin <paskripkin@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: restore missing 'return' statement
Message-ID: <202108130937.7848F6B318@keescook>
References: <20210802143820.1150099-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802143820.1150099-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 02, 2021 at 04:38:14PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The input_system_configure_channel_sensor() function lost its final
> return code in a previous patch:
> 
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c: In function 'input_system_configure_channel_sensor':
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1649:1: error: control reaches end of non-void function [-Werror=return-type]
> 
> Restore what was there originally.
> 
> Fixes: 728a5c64ae5f ("media: atomisp: remove dublicate code")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I hit this too. Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  .../media/atomisp/pci/hive_isp_css_common/host/input_system.c   | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> index 8e085dda0c18..712e01c37870 100644
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> @@ -1646,6 +1646,8 @@ static input_system_err_t input_system_configure_channel_sensor(
>  	default:
>  		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
>  	}
> +
> +	return INPUT_SYSTEM_ERR_NO_ERROR;
>  }
>  
>  // Test flags and set structure.
> -- 
> 2.29.2
> 

-- 
Kees Cook
