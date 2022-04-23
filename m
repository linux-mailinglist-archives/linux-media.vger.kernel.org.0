Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3497450CD8D
	for <lists+linux-media@lfdr.de>; Sat, 23 Apr 2022 23:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237103AbiDWVVX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Apr 2022 17:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232418AbiDWVVW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Apr 2022 17:21:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60EEA3A72E
        for <linux-media@vger.kernel.org>; Sat, 23 Apr 2022 14:18:23 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 96FEA2F2;
        Sat, 23 Apr 2022 23:18:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650748700;
        bh=Ly36mHFOXofzVEx5Y/LnTVi5jbNuO1FDrdJ+eRABcbA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QJBjks46fJB3GSIl4Yt0GM3kHBBQOTYXUVD5/+/HoGAZ8QBGGk7W8xe8w9zmKGGc1
         AhH6+r809LSQlED4OtltIWHZAFak1D8cHcJjkImDcjfEJ4J9Ch9qfXBOW9GS7L7oZ+
         PFJJpZg8KrTGIjV0lrIt3Zwq5/K/qGZIa1v2nP1Y=
Date:   Sun, 24 Apr 2022 00:18:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     mchehab@kernel.org, rmfrfs@gmail.com, linux-media@vger.kernel.org,
        agust@denx.de, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 1/2] media: platform: imx-mipi-csis: Remove unneeded
 'default n'
Message-ID: <YmRtHByhbohcuivs@pendragon.ideasonboard.com>
References: <20220422143130.1697636-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220422143130.1697636-1-festevam@gmail.com>
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

On Fri, Apr 22, 2022 at 11:31:29AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> There is no need to pass 'default n' in Kconfig, as by default the
> CONFIG_VIDEO_IMX_MIPI_CSIS option is not selected.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
> index 5afa373e534f..a0810df751dc 100644
> --- a/drivers/media/platform/nxp/Kconfig
> +++ b/drivers/media/platform/nxp/Kconfig
> @@ -11,7 +11,6 @@ config VIDEO_IMX_MIPI_CSIS
>  	select MEDIA_CONTROLLER
>  	select V4L2_FWNODE
>  	select VIDEO_V4L2_SUBDEV_API
> -	default n
>  	help
>  	  Video4Linux2 sub-device driver for the MIPI CSI-2 CSIS receiver
>  	  v3.3/v3.6.3 found on some i.MX7 and i.MX8 SoCs.

-- 
Regards,

Laurent Pinchart
