Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8CC11B43D3
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 14:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728072AbgDVMBq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 08:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727974AbgDVMBq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 08:01:46 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ED5EC03C1A8;
        Wed, 22 Apr 2020 05:01:45 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id d15so466135wrx.3;
        Wed, 22 Apr 2020 05:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iOKXRpXv+gkEgofK4WVWRQKy9tlZ8yvYUK75eISMHWM=;
        b=czKi7qn21POWgr44WAv0KdcLxI/rxgkVzrlB/1C4Xw4WEoR6ftneGr4rQ2iMCyufUz
         pcFMo829elw+M1gPwGJq7n4Hefkg1pBL6KAzY2pV5y11GBX/Bfv5BMxdQP/CUSD3OSJ4
         3Idb9AILqcpMVQScuFr+q0G9QEVExG4DmMAsfTAkfunYXiVH5SpQm73iGD2o7iKwx5Lt
         9Lxv9S+u09drWbnwxBQxzneFd7z7DKPHYdYEhZDcCr1rGDPXAcfcBb7eFJczltlqofnX
         xsmgXDx9NvO/yYeemtjZoyn8VdN9ZMIXMgIc0z8EjaUGD5MewXNrSiMiL9mg3BhyIy24
         rT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iOKXRpXv+gkEgofK4WVWRQKy9tlZ8yvYUK75eISMHWM=;
        b=nsWobq/dRrfBf0Uzle5BGWmaCbk4jb85NYaL6fmFQgPm8DNRgGWfx93HOF76koWR9h
         G+oYJcGFbtfWKWJCy2oWbkdGIpgeST+qi2yExG89e+cOrGSgqMl4LvmN/tMK3iy7ZVPI
         2XzS6VV4hHOm1S6dqMwQ2CZzHddx05wyq6qxHmRA+z61NS4hef0f9UTzGSuOeJPaSMP9
         +1uEHVhhLaj8XHcLNYpa0iJaNM2TGTcjj82WpKm1LzdigVeAxl6wPCZb+72sw63vX9jc
         Uss8Aq0+jZn4jLBFg9GcUrsx1OODkgwcK3SV7pkMrOyoTARjtm8Oyi8+hl3hsDFffDXG
         AC8Q==
X-Gm-Message-State: AGi0PuZkmR+rBg/aAmSkaaQeqnk1Tm72TKdrXhcE0DkQTYrQPN5A1tpi
        qo9DkO3/khwAzaYjR7Q8bMk=
X-Google-Smtp-Source: APiQypL1hXf3hE8tEvLggJJTkHpQZJynplGAtPQGFoM6V+qOP/gFDPqiGq8QGze8PKklHkmiSsjBVQ==
X-Received: by 2002:adf:82cf:: with SMTP id 73mr28979371wrc.411.1587556904428;
        Wed, 22 Apr 2020 05:01:44 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id s18sm8576749wra.94.2020.04.22.05.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2020 05:01:43 -0700 (PDT)
Subject: Re: [PATCH] media: MAINTAINERS: Fix Hantro, Rga and Rkvdec entries
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Heiko Stuebner <heiko@sntech.de>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
References: <20200422111403.19114-1-ezequiel@collabora.com>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <73d3d8c1-1952-aeb1-5bc0-829503cf29bd@gmail.com>
Date:   Wed, 22 Apr 2020 14:01:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200422111403.19114-1-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On 4/22/20 1:14 PM, Ezequiel Garcia wrote:
> It seems recent merges introduced a couple issues
> here, so let's fix them all. Also, reorder Rockchip
> video decoder as per parse-maintainers.pl script
> and add linux-rockchip mailing list.
> 
> Reported-by: Johan Jonker <jbx6244@gmail.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  MAINTAINERS | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 09e0137df61d..4d5b06c6fe0f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7460,7 +7460,7 @@ L:	linux-media@vger.kernel.org
>  L:	linux-rockchip@lists.infradead.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> -F:	Documentation/devicetree/bindings/media/rockchip-vpu.txt
> +F:	Documentation/devicetree/bindings/media/rockchip-vpu.yaml
>  F:	drivers/staging/media/hantro/
>  
>  HARD DRIVE ACTIVE PROTECTION SYSTEM (HDAPS) DRIVER
> @@ -14465,13 +14465,6 @@ F:	Documentation/ABI/*/sysfs-driver-hid-roccat*
>  F:	drivers/hid/hid-roccat*
>  F:	include/linux/hid-roccat*
>  
> -ROCKCHIP VIDEO DECODER DRIVER
> -M:	Ezequiel Garcia <ezequiel@collabora.com>
> -L:	linux-media@vger.kernel.org
> -S:	Maintained
> -F:	drivers/staging/media/rkvdec/
> -F:	Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> -
>  ROCKCHIP ISP V1 DRIVER
>  M:	Helen Koike <helen.koike@collabora.com>
>  L:	linux-media@vger.kernel.org

L:	linux-rockchip@lists.infradead.org

> @@ -14483,12 +14476,19 @@ ROCKCHIP RASTER 2D GRAPHIC ACCELERATION UNIT DRIVER
>  M:	Jacob Chen <jacob-chen@iotwrt.com>
>  M:	Ezequiel Garcia <ezequiel@collabora.com>
>  L:	linux-media@vger.kernel.org
> +L:	linux-rockchip@lists.infradead.org
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
>  F:	Documentation/devicetree/bindings/media/rockchip-rga.yaml
> -F:	Documentation/devicetree/bindings/media/rockchip-vpu.yaml
>  F:	drivers/media/platform/rockchip/rga/
>  
> +ROCKCHIP VIDEO DECODER DRIVER
> +M:	Ezequiel Garcia <ezequiel@collabora.com>
> +L:	linux-media@vger.kernel.org
> +L:	linux-rockchip@lists.infradead.org
> +S:	Maintained

> +F:	drivers/staging/media/rkvdec/
> +F:	Documentation/devicetree/bindings/media/rockchip,vdec.yaml

When I look at the other entries 'drivers/' is sort below 'Documentation/'.

./scripts/parse-maintainers.pl --input=MAINTAINERS --output=MAINTAINERS
--order

> +
>  ROCKER DRIVER
>  M:	Jiri Pirko <jiri@resnulli.us>
>  L:	netdev@vger.kernel.org
> 

