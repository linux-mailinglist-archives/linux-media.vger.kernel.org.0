Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43C15521CC6
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 16:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245074AbiEJOtm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 10:49:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344972AbiEJOt0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 10:49:26 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09A906CF47
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 07:09:07 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id j6so33186629ejc.13
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 07:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=L9uDAmV4B8dnYfNAzN4+q0c6FElnen+qa2BC0dKtKT0=;
        b=HjDCr5bjlrlzCN5M4E2QsuACLPhBSkTTDopEGQhubgTyYk4F9zijK30DiKYPbn9qsh
         P086BGO3gMAKuy/IjqHjEujiTzA2BT+Gh/h9PFBovxESPlQDcosaHp30G+i1fOd6NAMx
         MbO5E+pwAS7MR1rSft1GVs+r+3tRdsqMQPuE84Le7a8HPJiKEEVIgzXFmse9omrgEJ+P
         OF3Qy30Dc4k8bbJlYieiDAaplDH37PrMT2dxYRf2dgHKvghMYIaN47jjHxJrWD7MJTdt
         er3gZg3/XDC9mRkSjuO6ozZlLNspyf1F7N7B7KfrznJrCF2ErNkdAPNG92yis90D6iw+
         QT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L9uDAmV4B8dnYfNAzN4+q0c6FElnen+qa2BC0dKtKT0=;
        b=OxeJlai78uVso44QxDJVmnB44vXIOL7lpLCrXS78P1/FYpSQnKfjKJyOlK3X0/QVLZ
         LcpY5a9MDxMVNbL5TYFUea++PtMyscjwd/RK5S0aC1ycf44M0zVP27Nkv9WJKc7hM2Ky
         GoDjZZphYgXIULVF6v0Ly8ijMXxUz+jI/VAHCQjJyCaX3q8BFuM22a/dQbTwgAp+FvIu
         YjL/XRoRNlZSdPcX1HUQtVDT5p5UuyPsWiiU10k+x7giAEHSEhb4Y78XpxUq1LF5cInj
         6fwPMhvAceXBzTtSzPLGLfJJSYYcLH8JHDc6ZUejZptYF9tt+Ci+J36CzHzG4/39sJKn
         0S3A==
X-Gm-Message-State: AOAM533EDnyngMZKjF17Inwsj9E035Py4Bc9JV7TYvhpXhxD53MCT8bV
        llbnNFLRWcKBWE8n489gW8Q=
X-Google-Smtp-Source: ABdhPJzicSJeEDQq9NhewRTqa4GLs4wmkYMrD62TM1EvO0PqnsIWUAmmr7Fo3qEUxaG9zj7SDu/Ddg==
X-Received: by 2002:a17:907:c22:b0:6f4:2cb6:7ba9 with SMTP id ga34-20020a1709070c2200b006f42cb67ba9mr20368462ejc.29.1652191745524;
        Tue, 10 May 2022 07:09:05 -0700 (PDT)
Received: from arch-thunder (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id gz14-20020a170907a04e00b006f3ef214e62sm6172069ejc.200.2022.05.10.07.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:09:04 -0700 (PDT)
Date:   Tue, 10 May 2022 15:09:02 +0100
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
Subject: Re: [PATCH 02/50] staging: media: imx: imx7-media-csi: Split
 imx_media_dev from probe()
Message-ID: <20220510140902.wzf4jxf2miqpqa5q@arch-thunder>
References: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
 <20220510115859.19777-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510115859.19777-3-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, May 10, 2022 at 02:58:11PM +0300, Laurent Pinchart wrote:
> Prepare for the decoupling of the imx7-media-csi driver from the
> IPUv3-based drivers by moving the imx_media_dev handling from probe()
> function to separate functions.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 71 +++++++++++++---------
>  1 file changed, 42 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index 893620e8fc03..d7c65b8bb3c9 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -1175,11 +1175,45 @@ static int imx7_csi_async_register(struct imx7_csi *csi)
>  	return v4l2_async_register_subdev(&csi->sd);
>  }
>  
> +static void imx7_csi_media_cleanup(struct imx7_csi *csi)
> +{
> +	struct imx_media_dev *imxmd = csi->imxmd;

I know that later on we embed this media dev in csi, but meanwhile we
can reach here where csi->imxmd is NULL, because...

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

here we get out and later remove() is called, or...

> +
> +	ret = imx_media_of_add_csi(imxmd, csi->dev->of_node);
> +	if (ret < 0 && ret != -ENODEV && ret != -EEXIST) {
> +		imx7_csi_media_cleanup(csi);

here we only set csi->imxmd = imxmd bellow.

> +		return ret;
> +	}
> +
> +	ret = imx_media_dev_notifier_register(imxmd, NULL);
> +	if (ret < 0) {
> +		imx7_csi_media_cleanup(csi);

ditto

> +		return ret;
> +	}
> +
> +	csi->imxmd = imxmd;
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
> @@ -1193,6 +1227,7 @@ static int imx7_csi_probe(struct platform_device *pdev)
>  	spin_lock_init(&csi->irqlock);
>  	mutex_init(&csi->lock);
>  
> +	/* Acquire resources and install interrupt handler. */
>  	csi->mclk = devm_clk_get(&pdev->dev, "mclk");
>  	if (IS_ERR(csi->mclk)) {
>  		ret = PTR_ERR(csi->mclk);
> @@ -1214,7 +1249,6 @@ static int imx7_csi_probe(struct platform_device *pdev)
>  
>  	csi->model = (enum imx_csi_model)(uintptr_t)of_device_get_match_data(&pdev->dev);
>  
> -	/* install interrupt handler */
>  	ret = devm_request_irq(dev, csi->irq, imx7_csi_irq_handler, 0, "csi",
>  			       (void *)csi);
>  	if (ret < 0) {
> @@ -1222,22 +1256,11 @@ static int imx7_csi_probe(struct platform_device *pdev)
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
> @@ -1269,11 +1292,7 @@ static int imx7_csi_probe(struct platform_device *pdev)
>  	v4l2_async_nf_cleanup(&csi->notifier);
>  
>  cleanup:
> -	v4l2_async_nf_unregister(&imxmd->notifier);
> -	v4l2_async_nf_cleanup(&imxmd->notifier);

Didn't this notifier got dropped in cleanup() function? or am I
missing something?

Cheers,
     Rui
> -	v4l2_device_unregister(&imxmd->v4l2_dev);
> -	media_device_unregister(&imxmd->md);
> -	media_device_cleanup(&imxmd->md);
> +	imx7_csi_media_cleanup(csi);
>  
>  destroy_mutex:
>  	mutex_destroy(&csi->lock);
> @@ -1285,14 +1304,8 @@ static int imx7_csi_remove(struct platform_device *pdev)
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
