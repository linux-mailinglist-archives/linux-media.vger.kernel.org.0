Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9216C0275
	for <lists+linux-media@lfdr.de>; Sun, 19 Mar 2023 15:44:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbjCSOo1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Mar 2023 10:44:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjCSOoZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Mar 2023 10:44:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B14AF20
        for <linux-media@vger.kernel.org>; Sun, 19 Mar 2023 07:44:24 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-162-78-nat.elisa-mobile.fi [85.76.162.78])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 113971858;
        Sun, 19 Mar 2023 15:44:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679237062;
        bh=d09yNTdUb3qfEJb88jToLSS3b8Vg2mIGpOToAOzkCKk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ATnLiHbJArx3qplv/KqeNF/DRJ1pJkiqMGrN07xAZMwr9EXtqwR+Ey8l1IB8W5/YW
         1prTeCZBcFwvQxua1+MKKZ21cdboyn+sXQDZw9A/FkABZ2wWwQ9jtORk+7HJFaLvD1
         bDFdtDJYfUIEZxqmXIYKypcVOLC36BWWMhANh1/U=
Date:   Sun, 19 Mar 2023 16:44:24 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx290: care CONFIG_PM
Message-ID: <20230319144424.GP10144@pendragon.ideasonboard.com>
References: <87edpp1t7j.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87edpp1t7j.wl-kuninori.morimoto.gx@renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Morimoto-san,

Thank you for the patch.

On Wed, Mar 15, 2023 at 11:38:08PM +0000, Kuninori Morimoto wrote:
> It is using SET_RUNTIME_PM_OPS(), thus we need to care about CONFIG_PM.
> Otherwise, we will get below error without it.
> 
> ${Linux}/drivers/media/i2c/imx290.c:1090:12: error:\
>  'imx290_runtime_suspend' defined but not used [-Werror=unused-function]
>  1090 | static int imx290_runtime_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~
> ${Linux}/drivers/media/i2c/imx290.c:1082:12: error: \
>  'imx290_runtime_resume' defined but not used [-Werror=unused-function]
>  1082 | static int imx290_runtime_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Arnd has sent a patch to fix the same issue already, see
https://lore.kernel.org/linux-media/20230207161316.293923-1-arnd@kernel.org.
It has been merged in the fixes branch of Sakari's tree, I expect it to
hit v6.3 soon.

> ---
>  drivers/media/i2c/imx290.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 49d6c8bdec41..5f15b51dfdd3 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -1079,6 +1079,7 @@ static void imx290_power_off(struct imx290 *imx290)
>  	regulator_bulk_disable(ARRAY_SIZE(imx290->supplies), imx290->supplies);
>  }
>  
> +#ifdef CONFIG_PM
>  static int imx290_runtime_resume(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> @@ -1096,6 +1097,7 @@ static int imx290_runtime_suspend(struct device *dev)
>  
>  	return 0;
>  }
> +#endif
>  
>  static const struct dev_pm_ops imx290_pm_ops = {
>  	SET_RUNTIME_PM_OPS(imx290_runtime_suspend, imx290_runtime_resume, NULL)

-- 
Regards,

Laurent Pinchart
