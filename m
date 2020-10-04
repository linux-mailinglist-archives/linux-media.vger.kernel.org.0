Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E744282C0D
	for <lists+linux-media@lfdr.de>; Sun,  4 Oct 2020 19:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgJDRrR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Oct 2020 13:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbgJDRrR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 4 Oct 2020 13:47:17 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55ECBC0613CF
        for <linux-media@vger.kernel.org>; Sun,  4 Oct 2020 10:47:17 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id y15so6539369wmi.0
        for <linux-media@vger.kernel.org>; Sun, 04 Oct 2020 10:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YJw0Qj8f58FIAtl0HsmWyiR6HhSRiM/PepYpAhE8SIQ=;
        b=G2w7BLthMK8XOVUbuQNX+ETbYdp9nLRFsABHXqzwiXLBYVDqmPQJwS0/V/Qax9eToz
         aECEibwJRXNUX1wesEI4JuGUw5wp1oQczjNijB10v5B3X11ppj7/qfxcuXJRin75nNLx
         Yf3u1f6ym6GcQvMSBYcMjhfOs82ZJUhh/Q2k79HWZ7ydhelqKcX9DPmZOaIUhrF3wh1l
         Psfb/tidTOoci+8LjzI9Qgdn+H6VF3XFds1TVbW08YAs6fBJ5aZmZ08UDT6jzgFQhpFI
         C8cNckxeMz9IYiXKfUzc4XgqBnIix50c0wnNp/0VNTZzkgytfJDxDW37GF/MGeu4M70j
         OA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YJw0Qj8f58FIAtl0HsmWyiR6HhSRiM/PepYpAhE8SIQ=;
        b=keq6W9QDalRqWNmRvxrKyu/nCGBQol5SeTZZQHuuQTF+SvvzQMbyfU9fomKtcf5eVW
         zSWZZ1YCweUcHZO5kRN0SC964zpITgMssjbLM9XznS/TeUEi318WcrXbCnmKb+EUVSxJ
         t7rRcs3QWi24TWtg5nShTu20ytjssPWzKcsmVo5tQf9Yy5vFatidWs++S0cJ/7HOFU6I
         AjYAWqOOlTi6RCZ26yUNoKt9eOk8ksUZ7OgLNVrde+DyHcgjO9c9q7+EUm84Pp1uf5dO
         mxJTBRItY9ycmluRS7pEBrm3F/MIsOuNL+e+OsERkENd0lZB4qVK4/oaWHm9vIzmCzEc
         1APg==
X-Gm-Message-State: AOAM5319MzkHccHjoe8b9NNh9PhicEzNKQtJCX9FA/43s4b4cfOy7VWk
        ohpUxCwBje0amYXdWsfoTdzgNTeR2UXKqw==
X-Google-Smtp-Source: ABdhPJyCAM/U61j94aX364UfmH0bOJAsed17TsUxcQOQ9Q3xz+SXTURUA5Z4Zqh+8EEXEHXY+qMV6Q==
X-Received: by 2002:a7b:cb8c:: with SMTP id m12mr13421369wmi.12.1601833636064;
        Sun, 04 Oct 2020 10:47:16 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id m3sm10682841wme.3.2020.10.04.10.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 10:47:15 -0700 (PDT)
Date:   Sun, 4 Oct 2020 19:47:13 +0200
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH] media: zoran.rst: place it at the right place this time
Message-ID: <20201004174713.GB28143@Red>
References: <0cef13d883e4644b4cf9b521d3f3e45355e60566.1601827201.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cef13d883e4644b4cf9b521d3f3e45355e60566.1601827201.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Oct 04, 2020 at 06:00:30PM +0200, Mauro Carvalho Chehab wrote:
> I was too quick moving zoran.rst... it ends that the original
> patch didn't do the right thing and forgot to update the files
> that references it.
> 
> Fix it.
> 
> Fixes: 6b90346919d4 ("media: zoran: move documentation file to the right place")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../driver-api/media/drivers/{v4l-drivers => }/zoran.rst        | 0
>  MAINTAINERS                                                     | 2 +-
>  drivers/staging/media/zoran/Kconfig                             | 2 +-
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename Documentation/driver-api/media/drivers/{v4l-drivers => }/zoran.rst (100%)
> 
> diff --git a/Documentation/driver-api/media/drivers/v4l-drivers/zoran.rst b/Documentation/driver-api/media/drivers/zoran.rst
> similarity index 100%
> rename from Documentation/driver-api/media/drivers/v4l-drivers/zoran.rst
> rename to Documentation/driver-api/media/drivers/zoran.rst
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ba5eb1dff9c2..7a12633747c8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19247,7 +19247,7 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	http://mjpeg.sourceforge.net/driver-zoran/
>  Q:	https://patchwork.linuxtv.org/project/linux-media/list/
> -F:	Documentation/media/v4l-drivers/zoran.rst
> +F:	Documentation/driver-api/media/drivers/zoran.rst
>  F:	drivers/staging/media/zoran/
>  
>  ZPOOL COMPRESSED PAGE STORAGE API
> diff --git a/drivers/staging/media/zoran/Kconfig b/drivers/staging/media/zoran/Kconfig
> index 492507030276..7874842033ca 100644
> --- a/drivers/staging/media/zoran/Kconfig
> +++ b/drivers/staging/media/zoran/Kconfig
> @@ -8,7 +8,7 @@ config VIDEO_ZORAN
>  	  36057/36067 PCI controller chipset. This includes the Iomega
>  	  Buz, Pinnacle DC10+ and the Linux Media Labs LML33. There is
>  	  a driver homepage at <http://mjpeg.sf.net/driver-zoran/>. For
> -	  more information, check <file:Documentation/media/v4l-drivers/zoran.rst>.
> +	  more information, check <file:Documentation/driver-api/media/drivers/zoran.rst>.
>  
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called zr36067.
> -- 
> 2.26.2
> 
Hello

Acked-by: Corentin Labbe <clabbe@baylibre.com>

Thanks
