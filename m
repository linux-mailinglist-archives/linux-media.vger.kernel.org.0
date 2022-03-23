Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 663FA4E4F5E
	for <lists+linux-media@lfdr.de>; Wed, 23 Mar 2022 10:29:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237178AbiCWJax (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Mar 2022 05:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243270AbiCWJaw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Mar 2022 05:30:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFAEF606F0
        for <linux-media@vger.kernel.org>; Wed, 23 Mar 2022 02:29:23 -0700 (PDT)
Received: from pyrite.rasen.tech (h175-177-042-148.catv02.itscom.jp [175.177.42.148])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B39D0FFD;
        Wed, 23 Mar 2022 10:29:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1648027762;
        bh=+s9oFNjgpNxTF5FBFdp1N7dy3J/8OdbUbo7jXudflTQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HRXQsZKS31fFkD3h67BWcVOGPPXODcxo68CVn5fkM/Hm0yrYScChSpHSmQZhtec7L
         s0VC54mIvrgHqQMAxZgxLBV2CEK/p118xvaOW371ZJIklBWrg23u4Ho7zh2dCf8vrv
         QW49Fc9Cxfa1b8LBiJxkykqhzIJKQacRt++9SnZw=
Date:   Wed, 23 Mar 2022 18:29:13 +0900
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: Re: [PATCH] media: nxp: Restrict VIDEO_IMX_MIPI_CSIS to ARCH_MXC or
 COMPILE_TEST
Message-ID: <20220323092913.GC3212506@pyrite.rasen.tech>
References: <20220318203735.5923-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318203735.5923-1-laurent.pinchart+renesas@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Mar 18, 2022 at 10:37:35PM +0200, Laurent Pinchart wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> The imx-mipi-csis driver is specific to NXP platforms. Restrict it to
> those by default, and enable compilation with COMPILE_TEST to keep a
> wide test coverage.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
> index 7473096f5885..28f2bafc14d2 100644
> --- a/drivers/media/platform/nxp/Kconfig
> +++ b/drivers/media/platform/nxp/Kconfig
> @@ -6,6 +6,7 @@ comment "NXP media platform drivers"
>  
>  config VIDEO_IMX_MIPI_CSIS
>  	tristate "NXP MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
> +	depends on ARCH_MXC || COMPILE_TEST
>  	select MEDIA_CONTROLLER
>  	select V4L2_FWNODE
>  	select VIDEO_V4L2_SUBDEV_API
> 
> base-commit: 71e6d0608e4d1b79069990c7dacb3600ced28a3b
> -- 
> Regards,
> 
> Laurent Pinchart
> 
