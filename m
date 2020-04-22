Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6555E1B509C
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 01:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgDVXB2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 19:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725846AbgDVXB2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 19:01:28 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 179C1C03C1A9
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2020 16:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=rR07T5mKmj+1m3EPPFve+GXZLCzpG/z3+BmNKZR8jcM=; b=NBJnnE9yBsQHHQxmmWRxLjYHXx
        T6MuR2zOepirps5IUi2bSY24W5gyceMDUKOFT4UGrADla3SngTK4V0Fsj73CJItJUgz9qlKChN5BO
        7/llc32xlIN6o7aAd+Pl3MoPsw02EvCBuDX5doPmw3ch5UXOJOottWuMtn0qQShQYJdD/+ZEcGxaj
        dgpuBRIUnpt6ghKMPjTZZj2tbvYxRaaT6ReEOg2JJ5bF5gxRjDnaTP65EZQ6Lz3xt94JH1NT1JpRM
        gYu6p+k5yNokwjLQyLr2tZTyvPj08srXuBtUKg6yRiuZ6kvo1WlREyp8zUNI0C6U9pJrbRsTYawUO
        8X7xsNMQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jROMr-0002tM-5K; Wed, 22 Apr 2020 23:01:21 +0000
Subject: Re: [PATCH] media: tuners: Kconfig: add some missing VIDEO_V4L2
 dependencies
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Stefan Agner <stefan@agner.ch>
References: <02b11864f5d4b2ae6de47ea41ed25c3dd0a25cf0.1587588963.git.mchehab+huawei@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4962024a-96de-59a5-a865-3e227e0a0bd0@infradead.org>
Date:   Wed, 22 Apr 2020 16:01:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <02b11864f5d4b2ae6de47ea41ed25c3dd0a25cf0.1587588963.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/22/20 1:56 PM, Mauro Carvalho Chehab wrote:
> There are three tuners that depend on some functions inside
> V4L2 core:
> 
> 	$ git grep -l -E 'v4l2_[0-9a-zA-Z_]+\(' drivers/media/tuners/
> 	drivers/media/tuners/e4000.c
> 	drivers/media/tuners/fc2580.c
> 	drivers/media/tuners/msi001.c
> 
> Make them dependent of VIDEO_V4L2, as otherwise, this would happen:
> 
> 	on x86_64:
> 	CONFIG_VIDEO_V4L2=m
> 	CONFIG_MEDIA_TUNER_E4000=y
> 
> 	ld: drivers/media/tuners/e4000.o: in function `e4000_remove':
> 	e4000.c:(.text+0x34): undefined reference to `v4l2_ctrl_handler_free'
> 	ld: drivers/media/tuners/e4000.o: in function `e4000_probe':
> 	e4000.c:(.text+0x16c1): undefined reference to `v4l2_ctrl_handler_init_class'
> 	ld: e4000.c:(.text+0x16eb): undefined reference to `v4l2_ctrl_new_std'
> 	ld: e4000.c:(.text+0x1731): undefined reference to `v4l2_ctrl_new_std'
> 	ld: e4000.c:(.text+0x1762): undefined reference to `v4l2_ctrl_auto_cluster'
> 	ld: e4000.c:(.text+0x178c): undefined reference to `v4l2_ctrl_new_std'
> 	ld: e4000.c:(.text+0x17d6): undefined reference to `v4l2_ctrl_new_std'
> 	ld: e4000.c:(.text+0x1804): undefined reference to `v4l2_ctrl_auto_cluster'
> 	ld: e4000.c:(.text+0x182e): undefined reference to `v4l2_ctrl_new_std'
> 	ld: e4000.c:(.text+0x1878): undefined reference to `v4l2_ctrl_new_std'
> 	ld: e4000.c:(.text+0x18a6): undefined reference to `v4l2_ctrl_auto_cluster'
> 	ld: e4000.c:(.text+0x18d0): undefined reference to `v4l2_ctrl_new_std'
> 	ld: e4000.c:(.text+0x191a): undefined reference to `v4l2_ctrl_new_std'
> 	ld: e4000.c:(.text+0x1948): undefined reference to `v4l2_ctrl_auto_cluster'
> 	ld: e4000.c:(.text+0x1972): undefined reference to `v4l2_ctrl_new_std'
> 	ld: e4000.c:(.text+0x19a6): undefined reference to `v4l2_ctrl_handler_free'
> 	ld: e4000.c:(.text+0x1a2a): undefined reference to `v4l2_i2c_subdev_init'
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/media/tuners/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/tuners/Kconfig b/drivers/media/tuners/Kconfig
> index 2368b0e230e5..4605bb377574 100644
> --- a/drivers/media/tuners/Kconfig
> +++ b/drivers/media/tuners/Kconfig
> @@ -223,7 +223,7 @@ config MEDIA_TUNER_TDA18212
>  
>  config MEDIA_TUNER_E4000
>  	tristate "Elonics E4000 silicon tuner"
> -	depends on MEDIA_SUPPORT && I2C
> +	depends on MEDIA_SUPPORT && I2C && VIDEO_V4L2
>  	select REGMAP_I2C
>  	default m if !MEDIA_SUBDRV_AUTOSELECT
>  	help
> @@ -231,7 +231,7 @@ config MEDIA_TUNER_E4000
>  
>  config MEDIA_TUNER_FC2580
>  	tristate "FCI FC2580 silicon tuner"
> -	depends on MEDIA_SUPPORT && I2C
> +	depends on MEDIA_SUPPORT && I2C && VIDEO_V4L2
>  	select REGMAP_I2C
>  	default m if !MEDIA_SUBDRV_AUTOSELECT
>  	help
> 


-- 
~Randy
