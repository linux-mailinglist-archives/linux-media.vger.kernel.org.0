Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 700535BCF47
	for <lists+linux-media@lfdr.de>; Mon, 19 Sep 2022 16:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbiISOlM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 10:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbiISOky (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 10:40:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 702D633A0D
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 07:40:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18C539BA;
        Mon, 19 Sep 2022 16:40:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1663598439;
        bh=x1wmD1d97CV+AmupYVn9q4uP2qh1YCDXPY7gc8sStEg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Sqr+l5XillYQ6Mq3pvBLLkwmyWq22Ec79jsyhwkz+H8njfTgDNGPTGOvYXyI7oGYE
         1Up/BFA8v32PuLf04nitLljJo/3miuhydpvr2MF+3Zu6ZgAWUOmXdT9611Q9KbHjY8
         6ThUZF4tXorjkA781PxAyDPk19RzVDBsWMuznoho=
Date:   Mon, 19 Sep 2022 17:40:25 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, pavel@ucw.cz,
        sakari.ailus@linux.intel.com, sean@mess.org
Subject: Re: [PATCH -next 05/13] media: platform: mtk_mdp_comp: Switch to use
 dev_err_probe() helper
Message-ID: <Yyh/Wblw1hY+EkBs@pendragon.ideasonboard.com>
References: <20220915150324.688062-1-yangyingliang@huawei.com>
 <20220915150324.688062-6-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220915150324.688062-6-yangyingliang@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yang,

Thank you for the patch.

On Thu, Sep 15, 2022 at 11:03:16PM +0800, Yang Yingliang wrote:
> In the probe path, dev_err() can be replace with dev_err_probe()
> which will check if error code is -EPROBE_DEFER.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/mediatek/mdp/mtk_mdp_comp.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_comp.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_comp.c
> index 1e3833f1c9ae..ad5fab2d8bfa 100644
> --- a/drivers/media/platform/mediatek/mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_comp.c
> @@ -52,9 +52,8 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
>  	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
>  		comp->clk[i] = of_clk_get(node, i);
>  		if (IS_ERR(comp->clk[i])) {
> -			if (PTR_ERR(comp->clk[i]) != -EPROBE_DEFER)
> -				dev_err(dev, "Failed to get clock\n");
> -			ret = PTR_ERR(comp->clk[i]);
> +			ret = dev_err_probe(dev, PTR_ERR(comp->clk[i]),
> +					    "Failed to get clock\n");
>  			goto put_dev;
>  		}
>  

-- 
Regards,

Laurent Pinchart
