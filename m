Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 183C13D126F
	for <lists+linux-media@lfdr.de>; Wed, 21 Jul 2021 17:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239799AbhGUOuL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jul 2021 10:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239869AbhGUOuG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jul 2021 10:50:06 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 743CFC061757
        for <linux-media@vger.kernel.org>; Wed, 21 Jul 2021 08:30:42 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id q16so3767759lfa.5
        for <linux-media@vger.kernel.org>; Wed, 21 Jul 2021 08:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Z7unYwn55jnXDQQu8jt2zbz9VWoS1Hb8e9CfJmGr4DU=;
        b=xsFfjM/y5u4YvX3E7YZWe+UCNHc3FGQM87xUPYylpOgTn/2e9RF20e+YSWRBXKoC/M
         8ec+bL5zHDNfUw+s1oLC7HBtynj8Uyw8P71vOKvJNWdBCeAt5456IrMeRYEiT+0wjR7G
         ASJRQwUw7qkNykCrPu/J7KwWEUUnJy8mXeo9IQ648pctfhXeLx+pYNNiUWbt7si035xm
         W8kWm9jTBQa8sZPw8tC71k03zaaEfNplkoHcp/wwW1I/frxmUb5J8KQtgi/RufQXj3Jk
         TXR8m4TOpeFh6INeUyki/PzjTexdB2pzzN0ethC8RlMsgzHBqmf6aUFYqG+2DuZyLEfa
         dlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Z7unYwn55jnXDQQu8jt2zbz9VWoS1Hb8e9CfJmGr4DU=;
        b=Xzk+wUU0Wq18KSx/KVC7EthEv+vjO7m/vC+oo9RL0kd795g8aiMFJJBMNGNlfOu4XW
         /HLgnjsooBme3nBcTNtiYnMmZYNl3cTCvRSsgnFl5rHvFPZWEDU+jHvPmiLnGtbH01k6
         3hYJhO831UYdKm2OAGMe3GG/Duj/2OWbfz61ibQS1LUrs9Eb//TJl0mVlYbNzfvx0lKh
         ggMYU2qL3XQMtTJSSHlupskyS8EUTWoBcojkr0rrHYmDsvHz5tEEjNfNnGiQ31NjI40v
         Df0dgxAvfFFLLW4RZy/Cw4CNcf9TglKXQ6n0Xgc02YrhGCzo1RAY77YyX4TxCT0EjXFf
         AwhQ==
X-Gm-Message-State: AOAM532kUchmKJtj2Woa14AHHSf8r/UXlqM+MyR2t+kyOVU51L3ZOdGX
        DvQ49iAd9U2nBrWczmUtxeePzhBPoSAq9w==
X-Google-Smtp-Source: ABdhPJx99qhuuX+hob4lpg1lV5u5N+4Mnlby8FOR/yXbil2gtuzBRuPswy3hLK+1ifkN0KXdV2xnJw==
X-Received: by 2002:ac2:5e75:: with SMTP id a21mr26316341lfr.429.1626881440816;
        Wed, 21 Jul 2021 08:30:40 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id x7sm1768883lfu.17.2021.07.21.08.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 08:30:40 -0700 (PDT)
Date:   Wed, 21 Jul 2021 17:30:39 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        geert+renesas@glider.be, prabhakar.mahadev-lad.rj@bp.renesas.com,
        Arnd Bergmann <arnd@arndb.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rcar_drif: select CONFIG_V4L2_ASYNC
Message-ID: <YPg9n3QsD/I7ciQS@oden.dyn.berto.se>
References: <20210721152522.2928952-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210721152522.2928952-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

On 2021-07-21 17:24:59 +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Without this, I see a randconfig link failure:
> 
> aarch64-linux-ld: drivers/media/platform/rcar_drif.o: in function `rcar_drif_remove':
> rcar_drif.c:(.text+0x2a8): undefined reference to `v4l2_async_notifier_unregister'
> aarch64-linux-ld: rcar_drif.c:(.text+0x2b0): undefined reference to `v4l2_async_notifier_cleanup'
> aarch64-linux-ld: drivers/media/platform/rcar_drif.o: in function `rcar_drif_sdr_probe':
> rcar_drif.c:(.text+0x1444): undefined reference to `v4l2_async_notifier_init'
> aarch64-linux-ld: rcar_drif.c:(.text+0x14a0): undefined reference to `v4l2_async_notifier_register'
> aarch64-linux-ld: rcar_drif.c:(.text+0x14d8): undefined reference to `v4l2_async_notifier_cleanup'
> aarch64-linux-ld: rcar_drif.c:(.text+0x15a8): undefined reference to `__v4l2_async_notifier_add_fwnode_subdev'
> 
> I could not easily figure out when this was introduced, as this code
> has not changed in a while but I only saw the problem recently.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 157c924686e4..c5d1c83bd582 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -635,6 +635,7 @@ config VIDEO_RCAR_DRIF
>  	depends on VIDEO_V4L2
>  	depends on ARCH_RENESAS || COMPILE_TEST
>  	select VIDEOBUF2_VMALLOC
> +	select V4L2_ASYNC
>  	help
>  	  Say Y if you want to enable R-Car Gen3 DRIF support. DRIF is Digital
>  	  Radio Interface that interfaces with an RF front end chip. It is a
> -- 
> 2.29.2
> 

-- 
Regards,
Niklas Söderlund
