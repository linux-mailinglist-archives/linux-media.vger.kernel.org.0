Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1ECA3AD04A
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 18:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235860AbhFRQZr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 12:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231898AbhFRQZq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 12:25:46 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28494C061574;
        Fri, 18 Jun 2021 09:23:37 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 16AEEC6349; Fri, 18 Jun 2021 17:23:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1624033415; bh=VfhVbPXrQhz15aT35OF2OeDGJStIgIPbTgfIyCuz4v8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LIAjpLTZv7KObNNRiut3PDEZZxlryIKppcffIVE5PmTEM9oMt3N+9LFIkjdipetEg
         sQ3ukliAzsrO0o0gI8o1dukNkCcIWhIi/BvPw56Etin7X9FMWAxV9a5hCw0WWz5K+L
         mV1PDSBXspzttXo37niSJVBu6qHIzOnR/FWIKvRm0DwRCcCUVYzPTxt8uFEbGxsUfN
         i59keJRVZdfzSuo+hhkjCZbaXNhc0ypGLgsrdrBeeX7sssTZPBJt1WoBxdeHWwUo0m
         myTSiIloGy4IK/+5y2Op9fjAZlv1fsbDUTWl1MpS28+7AzQlAd7UHvO37+IIPNl2nv
         JpMGaJ22kTuHw==
Date:   Fri, 18 Jun 2021 17:23:34 +0100
From:   Sean Young <sean@mess.org>
To:     Lecopzer Chen <lecopzer.chen@mediatek.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, yj.chiang@mediatek.com
Subject: Re: [PATCH] media: Kconfig: Fix DVB_CORE can't be selected as module
Message-ID: <20210618162334.GA31513@gofer.mess.org>
References: <20210608101451.9301-1-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608101451.9301-1-lecopzer.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 08, 2021 at 06:14:51PM +0800, Lecopzer Chen wrote:
> The DVB_CORE now depends on MEDIA_DIGITAL_TV_SUPPORT and
> default MEDIA_DIGITAL_TV_SUPPORT, and this makes it can never be =m
> since the type of MEDIA_DIGITAL_TV_SUPPORT is bool.

First of all, the distributions carrry dvb_core as a module, so clearly
it possible to set DVB_CORE=m.

As far as I can see, if MEDIA_SUPPORT=m, then DVB_CORE=m. 

So it is possible.


Sean


> Change MEDIA_DIGITAL_TV_SUPPORT to tristate so it's possible to set
> DVB_CORE as =m.
> 
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> ---
>  drivers/media/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> index b07812657cee..c3baf92b4d02 100644
> --- a/drivers/media/Kconfig
> +++ b/drivers/media/Kconfig
> @@ -88,7 +88,7 @@ config MEDIA_ANALOG_TV_SUPPORT
>  		will disable support for them.
>  
>  config MEDIA_DIGITAL_TV_SUPPORT
> -	bool
> +	tristate
>  	prompt "Digital TV" if MEDIA_SUPPORT_FILTER
>  	default y if !MEDIA_SUPPORT_FILTER
>  	help
> -- 
> 2.18.0
