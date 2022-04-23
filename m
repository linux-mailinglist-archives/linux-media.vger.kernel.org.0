Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CD8950CD8F
	for <lists+linux-media@lfdr.de>; Sat, 23 Apr 2022 23:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232418AbiDWV3Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Apr 2022 17:29:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232432AbiDWV3X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Apr 2022 17:29:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 523441C933
        for <linux-media@vger.kernel.org>; Sat, 23 Apr 2022 14:26:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 048022F2;
        Sat, 23 Apr 2022 23:26:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650749183;
        bh=9Iubgzx0SSrc+CWw8fK4CJpPnyfEp21y89HQGFp9hoE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lhCnNUEOF0kvoLS0tFEorBCiwMdGNDHKfjdE5FXioM4h93cu37Ehb8toTNB8AA+Bn
         2oxBRaCSAVTeS3qWIScqDoVe1jUSS4zwb3CpLRqyAbFbEMiwbGXRqkJs4GyC0rbzVf
         M5GkbLLVJgZOEh5n6g/bPjAX8Jlt6mOM28qyT2q0=
Date:   Sun, 24 Apr 2022 00:26:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     mchehab@kernel.org, rmfrfs@gmail.com, linux-media@vger.kernel.org,
        agust@denx.de, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 2/2] media: platform: video-viu: Do not select it by
 default
Message-ID: <YmRu/q3ptXuybi60@pendragon.ideasonboard.com>
References: <20220422143130.1697636-1-festevam@gmail.com>
 <20220422143130.1697636-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220422143130.1697636-2-festevam@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

Thank you for the patch.

On Fri, Apr 22, 2022 at 11:31:30AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The video viu driver is not a vital one for booting purposes.
> 
> Remove the unneeded 'default y' option.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
> index a0810df751dc..1ac0a6e91111 100644
> --- a/drivers/media/platform/nxp/Kconfig
> +++ b/drivers/media/platform/nxp/Kconfig
> @@ -20,7 +20,6 @@ config VIDEO_VIU
>  	depends on V4L_PLATFORM_DRIVERS
>  	depends on VIDEO_DEV && (PPC_MPC512x || COMPILE_TEST) && I2C
>  	select VIDEOBUF_DMA_CONTIG
> -	default y
>  	help
>  	  Support for Freescale VIU video driver. This device captures
>  	  video data, or overlays video on DIU frame buffer.

-- 
Regards,

Laurent Pinchart
