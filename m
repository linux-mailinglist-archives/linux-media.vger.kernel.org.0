Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64EBE56A3E5
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 15:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235179AbiGGNkf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 09:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235729AbiGGNkc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 09:40:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4897B2870C
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 06:40:31 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240121080.bbtec.net [36.240.121.80])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D57BD00;
        Thu,  7 Jul 2022 15:40:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657201230;
        bh=ucBhqRbq0ktIklt+KDeu83HkAm0H58VeKW/iuaLHbHg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C89uxBL2zjzxIthQjjtmXMvaIuIJxWnZMlpGrghMohsJ7ApnlIgGj0u7gIgX5x7lP
         QKa+QI87EWdB1b6JxADdxqpnL0eVNBrpSjsc4FyhwKb/YCUMif7HA7lVoHA6qC75ZT
         ISa/ITK8Pec/s3/WUyr6jMMtJvDAe/ayFvYeXm10=
Date:   Thu, 7 Jul 2022 22:40:20 +0900
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH v2 05/55] media: rkisp1: Enable compilation on ARCH_MXC
Message-ID: <20220707134020.GL3886060@pyrite.rasen.tech>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
 <20220630230713.10580-6-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630230713.10580-6-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Jul 01, 2022 at 02:06:23AM +0300, Laurent Pinchart wrote:
> The ISP used by the Rockchip RK3399 is also found in the NXP i.MX8MP.
> Enable compilation of the driver for the MXC architecture in addition to
> ARCH_ROCKCHIP.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/media/platform/rockchip/rkisp1/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/Kconfig b/drivers/media/platform/rockchip/rkisp1/Kconfig
> index dabd7e42c193..731c9acbf6ef 100644
> --- a/drivers/media/platform/rockchip/rkisp1/Kconfig
> +++ b/drivers/media/platform/rockchip/rkisp1/Kconfig
> @@ -3,7 +3,7 @@ config VIDEO_ROCKCHIP_ISP1
>  	tristate "Rockchip Image Signal Processing v1 Unit driver"
>  	depends on V4L_PLATFORM_DRIVERS
>  	depends on VIDEO_DEV && OF
> -	depends on ARCH_ROCKCHIP || COMPILE_TEST
> +	depends on ARCH_ROCKCHIP || ARCH_MXC || COMPILE_TEST
>  	select MEDIA_CONTROLLER
>  	select VIDEO_V4L2_SUBDEV_API
>  	select VIDEOBUF2_DMA_CONTIG
