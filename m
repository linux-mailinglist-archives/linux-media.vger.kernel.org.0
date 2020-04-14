Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7337A1A7D63
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 15:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731122AbgDNNWX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 09:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730762AbgDNNWI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 09:22:08 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A69AC061A0C;
        Tue, 14 Apr 2020 06:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=/xO2y+KNj9hON1JQS+bVaVwriQ+uSAmHmyINi2Kj5o0=; b=N02kaKONjn1f6k0idk0j63Nywn
        SASFBsupwu7J40Pphkl+3WdP4ZHkPO1FsGZRs5i98yHpfhsIKSN3+1c38KshDZDiKcaILE4i0fCnT
        Mc3eAn3IO+FRmJgVq3mztFMaOQUgm97lfqI2EoMStKuX1etLkYPFj/b2cHBrqfrSafT/pPeRrYcD0
        DvwoMhFUIsmug067CtFasKN5zcznA7LzQ440N/sFWAXDNp97AWNkDgAU1Ndhq6kp/0Zktb18dv84b
        7LxC3NffP3fuNduC9OTiwBaCCCB+bCkGQlOPol/9R9McKFSMoHTAYqPA67suimwS40Xs18IBePvsN
        mI5JfHFA==;
Received: from ip5f5ad4d8.dynamic.kabel-deutschland.de ([95.90.212.216] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jOLVh-00028b-06; Tue, 14 Apr 2020 13:21:53 +0000
Date:   Tue, 14 Apr 2020 15:21:47 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH] media: Kconfig: Don't expose API options
Message-ID: <20200414152147.053b4b29@coco.lan>
In-Reply-To: <20200414130210.18970-1-ezequiel@collabora.com>
References: <20200414130210.18970-1-ezequiel@collabora.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 14 Apr 2020 10:02:10 -0300
Ezequiel Garcia <ezequiel@collabora.com> escreveu:

> There is no need to expose API options; instead,
> drivers that support a given API are expected to just select it.
> 
> Happily, this is currently the case, so simply stop
> exposing the options.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/media/Kconfig           | 2 +-
>  drivers/media/mc/Kconfig        | 3 +--
>  drivers/media/v4l2-core/Kconfig | 2 +-
>  3 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> index a8def1591352..eef4c6761ffb 100644
> --- a/drivers/media/Kconfig
> +++ b/drivers/media/Kconfig
> @@ -173,7 +173,7 @@ config VIDEO_DEV
>  	  radio devices and by some input devices.
>  
>  config MEDIA_CONTROLLER
> -	bool "Media Controller API"
> +	bool

This is not true here... non-embedded drivers like DVB and UVC can work
with or without the media controller. For them, the API is experimental.

>  	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_PLATFORM_SUPPORT
>  	help
>  	  Enable the media controller API used to query media devices internal
> diff --git a/drivers/media/mc/Kconfig b/drivers/media/mc/Kconfig
> index 002a918c4c75..0cdf885ce24d 100644
> --- a/drivers/media/mc/Kconfig
> +++ b/drivers/media/mc/Kconfig
> @@ -2,7 +2,6 @@
>  
>  #
>  # Media controller
> -#	Selectable only for webcam/grabbers, as other drivers don't use it
>  #
>  
>  config MEDIA_CONTROLLER_DVB
> @@ -14,7 +13,7 @@ config MEDIA_CONTROLLER_DVB
>  	  This is currently experimental.
>  
>  config MEDIA_CONTROLLER_REQUEST_API
> -	bool "Enable Media controller Request API (EXPERIMENTAL)"
> +	bool

This sounds OK.

The only reason why I didn't make this change is because of the 
"EXPERIMENTAL" warning. 

At least while this API is considered experimental, it sounds
wise to have a warning.

Perhaps we could apply this hunk, and add something like 
this to media/Kconfig:

comment "Please notice that the enabled Media controller Request API is EXPERIMENTAL"
	depends on MEDIA_CONTROLLER_REQUEST_API

Regards,
Mauro

>  	depends on MEDIA_CONTROLLER && STAGING_MEDIA
>  	help
>  	  DO NOT ENABLE THIS OPTION UNLESS YOU KNOW WHAT YOU'RE DOING.
> diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
> index 3fa75352d04c..d034185856bb 100644
> --- a/drivers/media/v4l2-core/Kconfig
> +++ b/drivers/media/v4l2-core/Kconfig
> @@ -17,7 +17,7 @@ config VIDEO_V4L2_I2C
>  	default y
>  
>  config VIDEO_V4L2_SUBDEV_API
> -	bool "V4L2 sub-device userspace API"
> +	bool
>  	depends on VIDEO_DEV && MEDIA_CONTROLLER
>  	help
>  	  Enables the V4L2 sub-device pad-level userspace API used to configure



Thanks,
Mauro
