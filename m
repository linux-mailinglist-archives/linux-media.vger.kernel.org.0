Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E01131B12B6
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 19:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbgDTRNH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 13:13:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726025AbgDTRNG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 13:13:06 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4B83C061A0C
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 10:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=Ty/naU03iZmbWM/6gv3QdvzTnmMZ/FSHVmjq/RU1rac=; b=cIQVWuUP/t9nL3v8jMk8ZYPWxg
        kCumKEP6zB8/mgY3iTKWge3UpCg52e8tXgZpW0QMqamAbFqSx5ixc9R5efTQuVvwihTjvJwK1CTFz
        1uqm7h8Jqt3fQV5xrlOgh0ERAKe3RIXQtwyuk7yNppoCM2g/qzT40o2x6m9Jy7x3XaAO/WT80rVbX
        fxCtxLE7t1NXtVyDloN1lByv/6ylygaCBQGu3SRhvI6mdWawgufMYIvEcKowKRUTgvYCHCcBHUqqO
        SbbKWPPTQ0I7sVzpmpbFrCfiy2XvVXWKlnXavzFG9SNllgURahKdrsFXRsE+wQiakJJV19C/RgcmD
        hm3kg66w==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jQZyi-0006v2-2e; Mon, 20 Apr 2020 17:13:04 +0000
Subject: Re: [PATCH] media: staging: rkisp1 Kconfig: depends on OF
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, Stephen Rothwell <sfr@canb.auug.org.au>
References: <56aaef4ea1c26d90952841fa32b2a14bcc27582a.1587401141.git.mchehab+huawei@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ec69a310-82c9-f52f-ea74-510c995101eb@infradead.org>
Date:   Mon, 20 Apr 2020 10:13:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <56aaef4ea1c26d90952841fa32b2a14bcc27582a.1587401141.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/20/20 9:45 AM, Mauro Carvalho Chehab wrote:
> building it with a random config causes a warning:
> 
> WARNING: unmet direct dependencies detected for PHY_ROCKCHIP_DPHY_RX0
>   Depends on [n]: STAGING [=y] && STAGING_MEDIA [=y] && MEDIA_SUPPORT [=y] && (ARCH_ROCKCHIP || COMPILE_TEST [=y]) && OF [=n]
>   Selected by [y]:
>   - VIDEO_ROCKCHIP_ISP1 [=y] && STAGING [=y] && STAGING_MEDIA [=y] && MEDIA_SUPPORT [=y] && VIDEO_V4L2 [=y] && (ARCH_ROCKCHIP || COMPILE_TEST [=y])
> 
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Works for me.  Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

> ---
>  drivers/staging/media/rkisp1/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkisp1/Kconfig b/drivers/staging/media/rkisp1/Kconfig
> index 5ecbefa0f5ec..07e4a6e4458e 100644
> --- a/drivers/staging/media/rkisp1/Kconfig
> +++ b/drivers/staging/media/rkisp1/Kconfig
> @@ -2,7 +2,7 @@
>  
>  config VIDEO_ROCKCHIP_ISP1
>  	tristate "Rockchip Image Signal Processing v1 Unit driver"
> -	depends on VIDEO_V4L2
> +	depends on VIDEO_V4L2 && OF
>  	depends on ARCH_ROCKCHIP || COMPILE_TEST
>  	select MEDIA_CONTROLLER
>  	select VIDEO_V4L2_SUBDEV_API
> 


-- 
~Randy
