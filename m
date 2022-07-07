Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C28AC56A3DD
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 15:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235578AbiGGNj2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 09:39:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235464AbiGGNj1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 09:39:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FAC218349
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 06:39:26 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240121080.bbtec.net [36.240.121.80])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4675D00;
        Thu,  7 Jul 2022 15:39:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657201164;
        bh=9o5f52gj+OiuUlbsS6G+FJFbB78gobFdd6/cQ9WKYak=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mmu6GSuIV4ZrsOD2oy0uDCOF/Xs726kLM7+mVyPIs4RevktzmDX2Iz2IAuWnugrgH
         DtkEEya//2qlqkVb3opOMRsHyfZZSJcCDz/uAPAeYj56fAoj86RhatcelUPYnNy6ML
         YMWdoZZ1Iw9d7STUAgvQNH9Vg3dTojXGs/1yAWcc=
Date:   Thu, 7 Jul 2022 22:39:14 +0900
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH v2 07/55] media: rkisp1: Read the ID register at probe
 time instead of streamon
Message-ID: <20220707133914.GJ3886060@pyrite.rasen.tech>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
 <20220630230713.10580-8-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630230713.10580-8-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Jul 01, 2022 at 02:06:25AM +0300, Laurent Pinchart wrote:
> There's no need to read the ID register every time streaming is started.
> Do it once, at probe time.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 10 ++++++++++
>  drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c |  4 ----
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index 248f0172ca62..ba773c0784fb 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -467,6 +467,7 @@ static int rkisp1_probe(struct platform_device *pdev)
>  	struct v4l2_device *v4l2_dev;
>  	unsigned int i;
>  	int ret, irq;
> +	u32 cif_id;
>  
>  	match_data = of_device_get_match_data(&pdev->dev);
>  	if (!match_data)
> @@ -509,6 +510,15 @@ static int rkisp1_probe(struct platform_device *pdev)
>  
>  	pm_runtime_enable(&pdev->dev);
>  
> +	ret = pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret)
> +		goto err_pm_runtime_disable;
> +
> +	cif_id = rkisp1_read(rkisp1, RKISP1_CIF_VI_ID);
> +	dev_dbg(rkisp1->dev, "CIF_ID 0x%08x\n", cif_id);
> +
> +	pm_runtime_put(&pdev->dev);
> +
>  	rkisp1->media_dev.hw_revision = match_data->isp_ver;
>  	strscpy(rkisp1->media_dev.model, RKISP1_DRIVER_NAME,
>  		sizeof(rkisp1->media_dev.model));
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index a97c145bad98..bc94a51124b0 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -473,12 +473,8 @@ static int rkisp1_config_path(struct rkisp1_device *rkisp1)
>  /* Hardware configure Entry */
>  static int rkisp1_config_cif(struct rkisp1_device *rkisp1)
>  {
> -	u32 cif_id;
>  	int ret;
>  
> -	cif_id = rkisp1_read(rkisp1, RKISP1_CIF_VI_ID);
> -	dev_dbg(rkisp1->dev, "CIF_ID 0x%08x\n", cif_id);
> -
>  	ret = rkisp1_config_isp(rkisp1);
>  	if (ret)
>  		return ret;
