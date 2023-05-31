Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB0677185B8
	for <lists+linux-media@lfdr.de>; Wed, 31 May 2023 17:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232329AbjEaPJB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 May 2023 11:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231565AbjEaPJA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 May 2023 11:09:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAF5A12B;
        Wed, 31 May 2023 08:08:43 -0700 (PDT)
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:72c3:346:a663:c82d])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B6A6844;
        Wed, 31 May 2023 17:08:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685545701;
        bh=rsjutLoj9HsjTjgT+CJdMDGMtQbtEd/Z0JQJWRbfXSI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m3gr3Qweo3xG2TANqOhn1CqZtVZEKJETh+rAa2YNEJksYTt81mmXnFcSqNcA12o0Q
         vNgoXJ9iURKI3ZFgWsG1tVghJk6VbTYd5vo/RBE8a/jcWpM6lv9vnQc99Jh6VKRsLT
         6+ZdmApQetRAd4EBRZjLtjrPH/odYLv5KoiBUWR4=
Date:   Wed, 31 May 2023 17:08:38 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/21] media: i2c: imx258: Remove unused defines
Message-ID: <lfityhh7rhnreyru2raxscxqdd4jphxz5lkfzgk3v4fauvmkbo@cpnvzvo4xoud>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
 <20230530173000.3060865-2-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230530173000.3060865-2-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave

On Tue, May 30, 2023 at 06:29:40PM +0100, Dave Stevenson wrote:
> The IMX258_FLL_* defines are unused. Remove them.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/i2c/imx258.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index 85d73b186111..6028579393b5 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -29,12 +29,6 @@
>  #define IMX258_VTS_30FPS_VGA		0x034c
>  #define IMX258_VTS_MAX			0xffff
>
> -/*Frame Length Line*/
> -#define IMX258_FLL_MIN			0x08a6
> -#define IMX258_FLL_MAX			0xffff
> -#define IMX258_FLL_STEP			1
> -#define IMX258_FLL_DEFAULT		0x0c98
> -
>  /* HBLANK control - read only */
>  #define IMX258_PPL_DEFAULT		5352
>
> --
> 2.25.1
>
