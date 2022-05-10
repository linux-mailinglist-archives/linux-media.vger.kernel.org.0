Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF78D522033
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 17:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346522AbiEJP6j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 11:58:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347161AbiEJP5R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 11:57:17 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 659EA28FEB3
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 08:49:42 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id bv19so33840077ejb.6
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 08:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nPO0Ir5x3z8pPdUWHCzDY9V2vGiVy3I+wbHW6u9yff4=;
        b=OUAYLdCYN4Tvi1RldOSVMHK/cWGhr7tQEU/3OM7dBVYPOhkCzRkA14QrshZxGUaFcA
         5hTVnM3BHhoyMY8uSujWJ93TDr7SK+XiRaSSM6olw730/d7w6bfwEH64t5WwcHhdUTrK
         yxXbZ2yTvW+dRxNEzAqhaZD/doM6SVChinKF3SSiM7aO0vN3wGQm4ReANIpQfGKlUprH
         VmvTU9mwiD+ZnRRAx8tpBAIPi+E+bh3CLqpkLOCXrVfY78lBGcQCc1wrLbYtvzNQkYO0
         AyjCd+QcUta+xCJVVLuoU1Ub5nCXQARIFOoihqMedfShuU7D7HZTlupsRFwX2YZ+s7FE
         P27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nPO0Ir5x3z8pPdUWHCzDY9V2vGiVy3I+wbHW6u9yff4=;
        b=KU4PbkVCBKm10H+ufnz3aFOMxKdFQfkMVVYuE1U1SWf3aD9oJRqAaDdYouXiDQjsUK
         MgbXcRz+AI279P2RBQ0tQQIbWUHxn98yTJ+kEhqsdKt22rIkG9LC4Aye9YO9TStRPxCu
         1PbDcQ/GRqyyIlQK53eHF5ueTMvpMVG0J8Bt75CyTPccJdIuJHWLgFDc1uN1XwTiRbgB
         sHZOXyrDl5wZqm+j3TvAi6wm0SWaTz5IXyj2qrPUNfCT8WbqUstJkTpVSBjq8jvQbxmv
         D8NYCh11EF3eoutut58NWvisnmEapdU4WJLL9fgVpZ5JGATtgDyEJYZcv7hDKs4Qy3Pz
         0WqA==
X-Gm-Message-State: AOAM533JSe1vgccBF3+r1vxXD52X3iGrJ4kp+j3jKKW3pwJwkmbKS/aP
        50mU91SAE2yNWCFlPsqYOT0=
X-Google-Smtp-Source: ABdhPJyGByUrRaGajKkImcISdDLz7fha5YqSnpY3nZxfHB9fIEKFilcIIG19fsfTMVlRuVwZsh3xJw==
X-Received: by 2002:a17:907:7ea7:b0:6f4:7a72:da92 with SMTP id qb39-20020a1709077ea700b006f47a72da92mr19766342ejc.348.1652197780600;
        Tue, 10 May 2022 08:49:40 -0700 (PDT)
Received: from arch-thunder (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id og47-20020a1709071def00b006f3ef214e61sm6254212ejc.199.2022.05.10.08.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 08:49:40 -0700 (PDT)
Date:   Tue, 10 May 2022 16:49:37 +0100
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        kernel@pengutronix.de
Subject: Re: [PATCH v1.1 02/50] staging: media: imx: imx7-media-csi: Split
 imx_media_dev from probe()
Message-ID: <20220510154937.mvw5m7sjpqw2uswa@arch-thunder>
References: <20220510115859.19777-3-laurent.pinchart@ideasonboard.com>
 <20220510152518.4063-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510152518.4063-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Laurent,
On Tue, May 10, 2022 at 06:25:18PM +0300, Laurent Pinchart wrote:
> Prepare for the decoupling of the imx7-media-csi driver from the
> IPUv3-based drivers by moving the imx_media_dev handling from probe()
> function to separate functions.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
   Rui

> ---
> Changes since v1:
> 
> - Set csi->imxmd earlier in imx7_csi_media_init()
> - Unregister and cleanup notifier in imx7_csi_media_cleanup()
> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 74 +++++++++++++---------
>  1 file changed, 45 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index 893620e8fc03..3246a5826cb2 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -1175,11 +1175,48 @@ static int imx7_csi_async_register(struct imx7_csi *csi)
>  	return v4l2_async_register_subdev(&csi->sd);
>  }
>  
> +static void imx7_csi_media_cleanup(struct imx7_csi *csi)
> +{
> +	struct imx_media_dev *imxmd = csi->imxmd;
> +
> +	v4l2_async_nf_unregister(&imxmd->notifier);
> +	v4l2_async_nf_cleanup(&imxmd->notifier);
> +
> +	v4l2_device_unregister(&imxmd->v4l2_dev);
> +	media_device_unregister(&imxmd->md);
> +	media_device_cleanup(&imxmd->md);
> +}
> +
> +static int imx7_csi_media_init(struct imx7_csi *csi)
> +{
> +	struct imx_media_dev *imxmd;
> +	int ret;
> +
> +	/* add media device */
> +	imxmd = imx_media_dev_init(csi->dev, NULL);
> +	if (IS_ERR(imxmd))
> +		return PTR_ERR(imxmd);
> +
> +	csi->imxmd = imxmd;
> +
> +	ret = imx_media_of_add_csi(imxmd, csi->dev->of_node);
> +	if (ret < 0 && ret != -ENODEV && ret != -EEXIST) {
> +		imx7_csi_media_cleanup(csi);
> +		return ret;
> +	}
> +
> +	ret = imx_media_dev_notifier_register(imxmd, NULL);
> +	if (ret < 0) {
> +		imx7_csi_media_cleanup(csi);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int imx7_csi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct device_node *node = dev->of_node;
> -	struct imx_media_dev *imxmd;
>  	struct imx7_csi *csi;
>  	int i, ret;
>  
> @@ -1193,6 +1230,7 @@ static int imx7_csi_probe(struct platform_device *pdev)
>  	spin_lock_init(&csi->irqlock);
>  	mutex_init(&csi->lock);
>  
> +	/* Acquire resources and install interrupt handler. */
>  	csi->mclk = devm_clk_get(&pdev->dev, "mclk");
>  	if (IS_ERR(csi->mclk)) {
>  		ret = PTR_ERR(csi->mclk);
> @@ -1214,7 +1252,6 @@ static int imx7_csi_probe(struct platform_device *pdev)
>  
>  	csi->model = (enum imx_csi_model)(uintptr_t)of_device_get_match_data(&pdev->dev);
>  
> -	/* install interrupt handler */
>  	ret = devm_request_irq(dev, csi->irq, imx7_csi_irq_handler, 0, "csi",
>  			       (void *)csi);
>  	if (ret < 0) {
> @@ -1222,22 +1259,11 @@ static int imx7_csi_probe(struct platform_device *pdev)
>  		goto destroy_mutex;
>  	}
>  
> -	/* add media device */
> -	imxmd = imx_media_dev_init(dev, NULL);
> -	if (IS_ERR(imxmd)) {
> -		ret = PTR_ERR(imxmd);
> +	/* Initialize all the media device infrastructure. */
> +	ret = imx7_csi_media_init(csi);
> +	if (ret)
>  		goto destroy_mutex;
> -	}
>  
> -	ret = imx_media_of_add_csi(imxmd, node);
> -	if (ret < 0 && ret != -ENODEV && ret != -EEXIST)
> -		goto cleanup;
> -
> -	ret = imx_media_dev_notifier_register(imxmd, NULL);
> -	if (ret < 0)
> -		goto cleanup;
> -
> -	csi->imxmd = imxmd;
>  	v4l2_subdev_init(&csi->sd, &imx7_csi_subdev_ops);
>  	v4l2_set_subdevdata(&csi->sd, csi);
>  	csi->sd.internal_ops = &imx7_csi_internal_ops;
> @@ -1269,11 +1295,7 @@ static int imx7_csi_probe(struct platform_device *pdev)
>  	v4l2_async_nf_cleanup(&csi->notifier);
>  
>  cleanup:
> -	v4l2_async_nf_unregister(&imxmd->notifier);
> -	v4l2_async_nf_cleanup(&imxmd->notifier);
> -	v4l2_device_unregister(&imxmd->v4l2_dev);
> -	media_device_unregister(&imxmd->md);
> -	media_device_cleanup(&imxmd->md);
> +	imx7_csi_media_cleanup(csi);
>  
>  destroy_mutex:
>  	mutex_destroy(&csi->lock);
> @@ -1285,14 +1307,8 @@ static int imx7_csi_remove(struct platform_device *pdev)
>  {
>  	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
>  	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
> -	struct imx_media_dev *imxmd = csi->imxmd;
>  
> -	v4l2_async_nf_unregister(&imxmd->notifier);
> -	v4l2_async_nf_cleanup(&imxmd->notifier);
> -
> -	media_device_unregister(&imxmd->md);
> -	v4l2_device_unregister(&imxmd->v4l2_dev);
> -	media_device_cleanup(&imxmd->md);
> +	imx7_csi_media_cleanup(csi);
>  
>  	v4l2_async_nf_unregister(&csi->notifier);
>  	v4l2_async_nf_cleanup(&csi->notifier);
> -- 
> Regards,
> 
> Laurent Pinchart
> 
