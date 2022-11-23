Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43B7B6359B3
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 11:23:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237314AbiKWKXs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 05:23:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237487AbiKWKWI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 05:22:08 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 777F1102D
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 02:08:35 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id b12so14815316wrn.2
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 02:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ouhGwXSeaVgRDyF6aOYlnUe1G6PkcJ3a2Ia2veN59q8=;
        b=hbEPWRnyHRthni9llQ/pko59L9nujUbe07hiTRM2D3CWbFk2ap18EHe7YEPo5XTCEk
         dd4eQD3AdJsZoMCZrJjRUwPRKv/xQkJS7WttM6KeWBd8UFu2Runk2FKMdYFHk3LkgfZR
         ybYR3pbyVXD/b2cQMkSgaTquIo8exnsfE0Teg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouhGwXSeaVgRDyF6aOYlnUe1G6PkcJ3a2Ia2veN59q8=;
        b=toOzA+ud+cRomqJRnAWME+BirhD4/Q/rWTa/07uQkBwsZedNUtFBcidUP6L0Wq28M8
         EEQA0LN42JkEZ5eLTcrNMIl33jGXHDXwjh6h8jaTiR5QKKelpTToJUpqmOZq1ZuWRt+N
         0BR2rS4MHbGYfRV6pkIItM8iE/LILPFOFyy0rw+NIXS2tU01n/XoMZPNbp5pEc9a4o5o
         +zjYn064qg5M3JmUixEwB6JRFfgx13Y3gI9VqmA5olkg083tJUXHetD7lwRmqFQIacYu
         cXLVrekCWNic933P4/1WHJLa1JZnT3YWbrTrCniz4avmhmTRXIvaYqTOk1MlwBIcjSWg
         qv1A==
X-Gm-Message-State: ANoB5pkdrOk2MbHrK8dt8492K1WQuW9Zo8PKVv8Xh/n2s28J4NxpkeL3
        TQ5usGz1+raNcIhKWEAqWNXu2g==
X-Google-Smtp-Source: AA0mqf7JmrwWXtMFx88k5iciiSy2ZO2SDkDIGgwo8kBY1Ny7RPhvVd5HvnuLpUfi2CdI/K9sJvysrA==
X-Received: by 2002:adf:fb0e:0:b0:241:87cb:6e0c with SMTP id c14-20020adffb0e000000b0024187cb6e0cmr6841150wrr.166.1669198114044;
        Wed, 23 Nov 2022 02:08:34 -0800 (PST)
Received: from tom-ThinkPad-T14s-Gen-2i (net-188-217-55-94.cust.vodafonedsl.it. [188.217.55.94])
        by smtp.gmail.com with ESMTPSA id m66-20020a1c2645000000b003cf9bf5208esm1695004wmm.19.2022.11.23.02.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 02:08:33 -0800 (PST)
Date:   Wed, 23 Nov 2022 11:08:31 +0100
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend] media: staging: stkwebcam: Restore
 MEDIA_{USB,CAMERA}_SUPPORT dependencies
Message-ID: <20221123100831.GE39395@tom-ThinkPad-T14s-Gen-2i>
References: <a50fa46075fb760d8409ff6ea2232b2ddb7a102b.1669046259.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a50fa46075fb760d8409ff6ea2232b2ddb7a102b.1669046259.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

On Mon, Nov 21, 2022 at 04:58:33PM +0100, Geert Uytterhoeven wrote:
> By moving support for the USB Syntek DC1125 Camera to staging, the
> dependencies on MEDIA_USB_SUPPORT and MEDIA_CAMERA_SUPPORT were lost.
> 
> Fixes: 56280c64ecacc971 ("media: stkwebcam: deprecate driver, move to staging")

Patch itself looks good but we have some style issue. Applying this
patch I got the following warning from checkpatchl:

WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: 56280c64ecac ("media: stkwebcam: deprecate driver, move to staging")'
#10: 

You have to pass only the first 12 chars of the sha1 commit into Fixes
msg:

Use:

 Fixes: 56280c64ecac ("media: stkwebcam: deprecate driver, move to staging")

Instead of:

 Fixes: 56280c64ecacc971 ("media: stkwebcam: deprecate driver, move to staging")

Thanks & Regards,
Tommaso

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/staging/media/deprecated/stkwebcam/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/deprecated/stkwebcam/Kconfig b/drivers/staging/media/deprecated/stkwebcam/Kconfig
> index 4450403dff41fb64..7234498e634ac61c 100644
> --- a/drivers/staging/media/deprecated/stkwebcam/Kconfig
> +++ b/drivers/staging/media/deprecated/stkwebcam/Kconfig
> @@ -2,7 +2,7 @@
>  config VIDEO_STKWEBCAM
>  	tristate "USB Syntek DC1125 Camera support (DEPRECATED)"
>  	depends on VIDEO_DEV
> -	depends on USB
> +	depends on MEDIA_USB_SUPPORT && MEDIA_CAMERA_SUPPORT
>  	help
>  	  Say Y here if you want to use this type of camera.
>  	  Supported devices are typically found in some Asus laptops,
> -- 
> 2.25.1
> 

-- 
Tommaso Merciai
Embedded Linux Engineer
tommaso.merciai@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via Le Canevare 30, 31100 Treviso, Veneto, IT
T. +39 042 243 5310
info@amarulasolutions.com
www.amarulasolutions.com
