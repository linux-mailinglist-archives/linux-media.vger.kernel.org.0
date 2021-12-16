Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39BA8476B12
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 08:33:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232138AbhLPHdY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 02:33:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbhLPHdX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 02:33:23 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36843C061574
        for <linux-media@vger.kernel.org>; Wed, 15 Dec 2021 23:33:23 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id z8so37102071ljz.9
        for <linux-media@vger.kernel.org>; Wed, 15 Dec 2021 23:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=aSgutWPTCcATr98yGj7KVkZJEMsLEmRpgDqJ2f91vgY=;
        b=cfUIEGS/I+5GHzfC4E3lftXN7Jo0JtgOJtwAWKPABolJfB7oQ0eqjpTV4dvH5xKQsM
         WoSWNQ8LFQqLY5oDU3n8YKnpbvZbhIkVds5ijjrYm07fC8SWVgs3/HRDLHMrBzIz57aa
         yaDdxUMPvXYTZEWDrdEYo7QUax1T6fc01GqvXFsyZCtIIyf6A6UGPQPBVA8aAm2To7MW
         LCrZt0uI/PQzoOVhkRUCpHfOLMMAOksaJwhKiYEtra4HtXgMAzagSzpc/UYTwfyTA/sl
         MsI9QFJG6PI4pcrkOGWFjQmXT08qchvRFxkF4T0XsEBLtJxOnOJkkm4Ap3rDzRwZMFGB
         ai9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=aSgutWPTCcATr98yGj7KVkZJEMsLEmRpgDqJ2f91vgY=;
        b=kWAw36Kb+X6u6Pypv6poAU/QZXqKwLTq21E4WsrcwmUBIb7EtZmDEETY1M9uGIYMHE
         6tqkb37KA6j7mBBlCBP+UF3K9iRz8dipif4CCnwbgPkz8ClnYJkj6OiU1XE3WsK4V7gj
         wqX2TzUYF9K/v+lj7rFUff7m7tkLTLQnX2qBME6mZRZtGLnShvX+9az2XC5GZFMBIeQd
         /UDL1CEdi9Wei7nIrLkAJ3SpX06ccifWZHDbUbJ8c17zLGSdJh/j9M1pXmTohKm6RDX8
         kaNKW0PCJuTGHKofQnnv6n//zXgUeabMkXh6MAJELwauHQ0jvszbSOBSCFk9bu/4j7jK
         StMQ==
X-Gm-Message-State: AOAM533EZy49iso1boAkHD2IVIG3DGGsPVxThD79MkjqftgFMn5uGxwO
        lM9hxuft1PvfakzkMgtYvcMaGQ==
X-Google-Smtp-Source: ABdhPJx3a4mUsG7Yiz80YHUr7Tx6vHgC33oQymymvfH9MqlFHD69rMz5hQCPTo1324t1x4EVM8jDbw==
X-Received: by 2002:a2e:a311:: with SMTP id l17mr13653507lje.9.1639640001300;
        Wed, 15 Dec 2021 23:33:21 -0800 (PST)
Received: from localhost (h-46-59-90-226.A463.priv.bahnhof.se. [46.59.90.226])
        by smtp.gmail.com with ESMTPSA id f15sm722384lfa.233.2021.12.15.23.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 23:33:20 -0800 (PST)
Date:   Thu, 16 Dec 2021 08:33:20 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Julian Braha <julianbraha@gmail.com>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        sakari.ailus@linux.intel.com,
        kieran.bingham+renesas@ideasonboard.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        failyildiran@gmail.com
Subject: Re: [PATCH] media: max96712: fix unmet dependency on VIDEO_DEV for
 VIDEO_V4L2_SUBDEV_API
Message-ID: <YbrrwOx0Ayf/2/+z@oden.dyn.berto.se>
References: <20211215233543.163578-1-julianbraha@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211215233543.163578-1-julianbraha@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Julian,

Thanks for your work.

The issue is already fixed in [1].

1. https://git.linuxtv.org/media_stage.git/commit/?id=8cc464fdcaaef1a38423c79c29df96db397d8b69

On 2021-12-15 18:35:43 -0500, Julian Braha wrote:
> When VIDEO_MAX96712 is selected,
> and VIDEO_DEV is not selected,
> Kbuild gives the following warning:
> 
> WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
>   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
>   Selected by [y]:
>   - VIDEO_MAX96712 [=y] && STAGING [=y] && STAGING_MEDIA [=y] && MEDIA_SUPPORT [=y] && I2C [=y] && OF_GPIO [=y]
> 
> This is because VIDEO_MAX96712 selects VIDEO_V4L2_SUBDEV_API,
> without selecting or depending on VIDEO_DEV, despite
> VIDEO_V4L2_SUBDEV_API depending on VIDEO_DEV.
> 
> This unmet dependency bug was detected by Kismet,
> a static analysis tool for Kconfig. Please advise
> if this is not the appropriate solution.
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
>  drivers/staging/media/max96712/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/max96712/Kconfig b/drivers/staging/media/max96712/Kconfig
> index 258d47644cbd..117fadf81bd0 100644
> --- a/drivers/staging/media/max96712/Kconfig
> +++ b/drivers/staging/media/max96712/Kconfig
> @@ -3,6 +3,7 @@ config VIDEO_MAX96712
>  	tristate "Maxim MAX96712 Quad GMSL2 Deserializer support"
>  	depends on I2C
>  	depends on OF_GPIO
> +	depends on VIDEO_DEV
>  	select V4L2_FWNODE
>  	select VIDEO_V4L2_SUBDEV_API
>  	select MEDIA_CONTROLLER
> -- 
> 2.32.0
> 

-- 
Kind Regards,
Niklas Söderlund
