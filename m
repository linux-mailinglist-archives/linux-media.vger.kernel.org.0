Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E89AB6E5A7A
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 09:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231160AbjDRHax (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 03:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbjDRHat (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 03:30:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 222B349EF;
        Tue, 18 Apr 2023 00:30:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9104802;
        Tue, 18 Apr 2023 09:30:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681803039;
        bh=N2RAsXnKKbSvTXYA+VEQ4koe2CzC24y374E9fAr8EnE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=thA+27Ke1RQzc6Y4Uch2aYEuVL2bZwhtM6SWwl/VggcKs175CElwr71srNWrq6bDi
         INOVR3Af7iU+0B2ZUfxXRNn/C5ajulHVDae/vNR6lL3gmFVEmwB/phkY3Bgkfc8Hko
         gzAGJL4jXrLYWMdWly2GKUC5u3X/Dj3Z0aGwH6K8=
Date:   Tue, 18 Apr 2023 10:30:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Guoniu Zhou <guoniu.zhou@nxp.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Christian Hemp <c.hemp@phytec.de>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: nxp: ignore unused suspend operations
Message-ID: <20230418073057.GD4703@pendragon.ideasonboard.com>
References: <20230418071605.2971866-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230418071605.2971866-1-arnd@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

Thank you for the patch.

On Tue, Apr 18, 2023 at 09:15:51AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc warns about some functions being unused when CONFIG_PM is
> disabled:
> 
> drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c:328:12: error: 'mxc_isi_pm_resume' defined but not used [-Werror=unused-function]
>   328 | static int mxc_isi_pm_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~
> drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c:314:12: error: 'mxc_isi_pm_suspend' defined but not used [-Werror=unused-function]
>   314 | static int mxc_isi_pm_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~
> 
> Use the modern SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS() helpers in place
> of the old SET_SYSTEM_SLEEP_PM_OPS()/SET_RUNTIME_PM_OPS() ones, and add
> a pm_ptr() check to ensure they get dropped by the compiler.

I've also sent a patch for this one :-) See
https://lore.kernel.org/linux-media/20230417053949.7395-2-laurent.pinchart@ideasonboard.com/T/#u.

Your patch looks better, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 238521622b75..253e77189b69 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -378,8 +378,8 @@ static int mxc_isi_runtime_resume(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops mxc_isi_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(mxc_isi_pm_suspend, mxc_isi_pm_resume)
> -	SET_RUNTIME_PM_OPS(mxc_isi_runtime_suspend, mxc_isi_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(mxc_isi_pm_suspend, mxc_isi_pm_resume)
> +	RUNTIME_PM_OPS(mxc_isi_runtime_suspend, mxc_isi_runtime_resume, NULL)
>  };
>  
>  /* -----------------------------------------------------------------------------
> @@ -528,7 +528,7 @@ static struct platform_driver mxc_isi_driver = {
>  	.driver = {
>  		.of_match_table = mxc_isi_of_match,
>  		.name		= MXC_ISI_DRIVER_NAME,
> -		.pm		= &mxc_isi_pm_ops,
> +		.pm		= pm_ptr(&mxc_isi_pm_ops),
>  	}
>  };
>  module_platform_driver(mxc_isi_driver);

-- 
Regards,

Laurent Pinchart
