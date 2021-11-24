Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03E8E45D011
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 23:27:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344522AbhKXWaL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 17:30:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344457AbhKXWaK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 17:30:10 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B2A9C061574;
        Wed, 24 Nov 2021 14:27:00 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FB4290E;
        Wed, 24 Nov 2021 23:26:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637792818;
        bh=MhpUrhVW+9QPh2Furlp0JZjdfxALMVDTKEaY5FshAys=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hUmZ+pWDZ5FtHXjmNnznCKybWeFSFPzvHPps2vGdP/FlVszrGZp8I8HxtB24JuZ4r
         i5vsJkyBfJcKZpod6HdLyBkSZD4b/vPUhSlK0bcyuQfATxLTyzuzi2/67o/Vg55y0A
         OPK3nwBV2eVFR1pMiIOzVedq4h7Ie0n89XA8vYik=
Date:   Thu, 25 Nov 2021 00:26:35 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vaibhav Hiremath <hvaibhav@ti.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Dominic Curran <dcurran@ti.com>,
        David Cohen <dacohen@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] media: omap3isp: fix out-of-range warning
Message-ID: <YZ68G09viJA/vkby@pendragon.ideasonboard.com>
References: <20211124192430.74541-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211124192430.74541-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

Thank you for the patch.

On Wed, Nov 24, 2021 at 08:24:15PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang points out that the 8-bit height/width values never exceed
> the range of that type when building with 'make W=1 LLVM=1':
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
> 
> Add a cast to 32-bit to avoid the warning. Checking just the lower bounds
> would be sufficient as well, but it seems more consistent to use
> the IS_OUT_OF_BOUNDS() check for all members.

Mauro has submitted a fix that handles the cast in the
IS_OUT_OF_BOUNDS() macro, see
https://lore.kernel.org/all/b70f819b11e024649f113be1158f34b24914a1ed.1637573097.git.mchehab+huawei@kernel.org/.

> Fixes: 68e342b3068c ("[media] omap3isp: Statistics")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/platform/omap3isp/isph3a_af.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/omap3isp/isph3a_af.c b/drivers/media/platform/omap3isp/isph3a_af.c
> index a65cfdfa9637..c544d9c812b0 100644
> --- a/drivers/media/platform/omap3isp/isph3a_af.c
> +++ b/drivers/media/platform/omap3isp/isph3a_af.c
> @@ -170,13 +170,13 @@ static int h3a_af_validate_params(struct ispstat *af, void *new_conf)
>  			     OMAP3ISP_AF_PAXEL_VERTICAL_COUNT_MAX))
>  		return -EINVAL;
>  
> -	if (IS_OUT_OF_BOUNDS(paxel_cfg->height, OMAP3ISP_AF_PAXEL_HEIGHT_MIN,
> +	if (IS_OUT_OF_BOUNDS((u32)paxel_cfg->height, OMAP3ISP_AF_PAXEL_HEIGHT_MIN,
>  			     OMAP3ISP_AF_PAXEL_HEIGHT_MAX) ||
>  	    paxel_cfg->height % 2)
>  		return -EINVAL;
>  
>  	/* Check width */
> -	if (IS_OUT_OF_BOUNDS(paxel_cfg->width, OMAP3ISP_AF_PAXEL_WIDTH_MIN,
> +	if (IS_OUT_OF_BOUNDS((u32)paxel_cfg->width, OMAP3ISP_AF_PAXEL_WIDTH_MIN,
>  			     OMAP3ISP_AF_PAXEL_WIDTH_MAX) ||
>  	    paxel_cfg->width % 2)
>  		return -EINVAL;

-- 
Regards,

Laurent Pinchart
