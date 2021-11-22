Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED78B458C08
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 11:05:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239070AbhKVKIZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 05:08:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbhKVKIZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 05:08:25 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3834BC061574;
        Mon, 22 Nov 2021 02:05:19 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5955F14C3;
        Mon, 22 Nov 2021 11:05:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637575517;
        bh=BnJ1OE8sPEd3GFyPi5npQ4579IAO0jVbtPBmvlOTi7Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZkmLdXncuv7rc2RBDirGWt60jxXQz2TEorlZikQMLXAIWt2ML8QQz1h1+FXIiI/oj
         EaoHzpt+nlN33OJ4N7g5PaJwDrJ1eWyk2P5xiFXCPYJBRcviil96jWGiCJ0wpgGbAY
         b4m7Z8euj16OBTXqcDWGPWh4tZ/LKODcpAHnqJ6g=
Date:   Mon, 22 Nov 2021 12:04:54 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH 10/10] media: omap3isp: avoid warnings at
 IS_OUT_OF_BOUNDS()
Message-ID: <YZtrRufHmGbQ9mCP@pendragon.ideasonboard.com>
References: <cover.1637573097.git.mchehab+huawei@kernel.org>
 <b70f819b11e024649f113be1158f34b24914a1ed.1637573097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b70f819b11e024649f113be1158f34b24914a1ed.1637573097.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thank you for the patch.

On Mon, Nov 22, 2021 at 09:26:12AM +0000, Mauro Carvalho Chehab wrote:
> Clang with W=1 produces the following warnings:
> 
> drivers/media/platform/omap3isp/isph3a_af.c:173:6: error: result of comparison of constant 256 with expression of type '__u8' (aka 'unsigned char') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>         if (IS_OUT_OF_BOUNDS(paxel_cfg->height, OMAP3ISP_AF_PAXEL_HEIGHT_MIN,
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/media/platform/omap3isp/isph3a_af.c:24:33: note: expanded from macro 'IS_OUT_OF_BOUNDS'
>         (((value) < (min)) || ((value) > (max)))
>                                ~~~~~~~ ^ ~~~~~
> drivers/media/platform/omap3isp/isph3a_af.c:179:6: error: result of comparison of constant 256 with expression of type '__u8' (aka 'unsigned char') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>         if (IS_OUT_OF_BOUNDS(paxel_cfg->width, OMAP3ISP_AF_PAXEL_WIDTH_MIN,
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/media/platform/omap3isp/isph3a_af.c:24:33: note: expanded from macro 'IS_OUT_OF_BOUNDS'
>         (((value) < (min)) || ((value) > (max)))
>                                ~~~~~~~ ^ ~~~~~
> 2 errors generated.
> 
> Use a typecast to avoid such warnings.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/10] at: https://lore.kernel.org/all/cover.1637573097.git.mchehab+huawei@kernel.org/
> 
>  drivers/media/platform/omap3isp/isph3a_af.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/omap3isp/isph3a_af.c b/drivers/media/platform/omap3isp/isph3a_af.c
> index a65cfdfa9637..de7b116d0122 100644
> --- a/drivers/media/platform/omap3isp/isph3a_af.c
> +++ b/drivers/media/platform/omap3isp/isph3a_af.c
> @@ -21,7 +21,7 @@
>  #include "ispstat.h"
>  
>  #define IS_OUT_OF_BOUNDS(value, min, max)		\
> -	(((value) < (min)) || ((value) > (max)))
> +	((((unsigned int)value) < (min)) || (((unsigned int)value) > (max)))

It could have been a good occasion to replace the macro with an inline
function.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  static void h3a_af_setup_regs(struct ispstat *af, void *priv)
>  {

-- 
Regards,

Laurent Pinchart
