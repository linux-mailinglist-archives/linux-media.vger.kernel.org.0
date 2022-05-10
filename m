Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46CDA521D93
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 17:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234695AbiEJPL7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 11:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345439AbiEJPKu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 11:10:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B102510E3F4
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 07:42:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E3A0D18;
        Tue, 10 May 2022 16:42:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652193754;
        bh=6yEl1Tq2M/e+lYK+Pws3ZzirUdWBH8IUbth9AnxI9H8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fBOcEN1H3jcWOPYts0Yvu7UB7diHGdgZcElpWXCuUhlsAFi1hGeiy0nFUQGOyarxc
         JiFfgDNC/+/InNTNXT5Wn+FR6OVqSaaWMLuEsZSEhr8VgEyNzz26K9Ih0n14NVSb8T
         1u4o7BGJ90h69C00RFp+ZDgnyutVYDSsPVk/d6Js=
Date:   Tue, 10 May 2022 17:42:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>
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
Message-ID: <Ynp51fDIqojsUwLW@pendragon.ideasonboard.com>
References: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
 <20220510115859.19777-3-laurent.pinchart@ideasonboard.com>
 <20220510140902.wzf4jxf2miqpqa5q@arch-thunder>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220510140902.wzf4jxf2miqpqa5q@arch-thunder>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rui,

On Tue, May 10, 2022 at 03:09:02PM +0100, Rui Miguel Silva wrote:
> On Tue, May 10, 2022 at 02:58:11PM +0300, Laurent Pinchart wrote:
> > Prepare for the decoupling of the imx7-media-csi driver from the
> > IPUv3-based drivers by moving the imx_media_dev handling from probe()
> > function to separate functions.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/staging/media/imx/imx7-media-csi.c | 71 +++++++++++++---------
> >  1 file changed, 42 insertions(+), 29 deletions(-)
> > 
> > diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> > index 893620e8fc03..d7c65b8bb3c9 100644
> > --- a/drivers/staging/media/imx/imx7-media-csi.c
> > +++ b/drivers/staging/media/imx/imx7-media-csi.c
> > @@ -1175,11 +1175,45 @@ static int imx7_csi_async_register(struct imx7_csi *csi)
> >  	return v4l2_async_register_subdev(&csi->sd);
> >  }
> >  
> > +static void imx7_csi_media_cleanup(struct imx7_csi *csi)
> > +{
> > +	struct imx_media_dev *imxmd = csi->imxmd;
> 
> I know that later on we embed this media dev in csi, but meanwhile we
> can reach here where csi->imxmd is NULL, because...
> 
> > +
> > +	v4l2_device_unregister(&imxmd->v4l2_dev);
> > +	media_device_unregister(&imxmd->md);
> > +	media_device_cleanup(&imxmd->md);
> > +}
> > +
> > +static int imx7_csi_media_init(struct imx7_csi *csi)
> > +{
> > +	struct imx_media_dev *imxmd;
> > +	int ret;
> > +
> > +	/* add media device */
> > +	imxmd = imx_media_dev_init(csi->dev, NULL);
> > +	if (IS_ERR(imxmd))
> > +		return PTR_ERR(imxmd);
> 
> here we get out and later remove() is called, or...

This can't happen, as if probe() fails, remove() isn't called.

> > +
> > +	ret = imx_media_of_add_csi(imxmd, csi->dev->of_node);
> > +	if (ret < 0 && ret != -ENODEV && ret != -EEXIST) {
> > +		imx7_csi_media_cleanup(csi);
> 
> here we only set csi->imxmd = imxmd bellow.
> 
> > +		return ret;
> > +	}
> > +
> > +	ret = imx_media_dev_notifier_register(imxmd, NULL);
> > +	if (ret < 0) {
> > +		imx7_csi_media_cleanup(csi);
> 
> ditto

Those two are valid concerns. I'll fix them.

> > +		return ret;
> > +	}
> > +
> > +	csi->imxmd = imxmd;
> > +
> > +	return 0;
> > +}
> > +
> >  static int imx7_csi_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> > -	struct device_node *node = dev->of_node;
> > -	struct imx_media_dev *imxmd;
> >  	struct imx7_csi *csi;
> >  	int i, ret;
> >  
> > @@ -1193,6 +1227,7 @@ static int imx7_csi_probe(struct platform_device *pdev)
> >  	spin_lock_init(&csi->irqlock);
> >  	mutex_init(&csi->lock);
> >  
> > +	/* Acquire resources and install interrupt handler. */
> >  	csi->mclk = devm_clk_get(&pdev->dev, "mclk");
> >  	if (IS_ERR(csi->mclk)) {
> >  		ret = PTR_ERR(csi->mclk);
> > @@ -1214,7 +1249,6 @@ static int imx7_csi_probe(struct platform_device *pdev)
> >  
> >  	csi->model = (enum imx_csi_model)(uintptr_t)of_device_get_match_data(&pdev->dev);
> >  
> > -	/* install interrupt handler */
> >  	ret = devm_request_irq(dev, csi->irq, imx7_csi_irq_handler, 0, "csi",
> >  			       (void *)csi);
> >  	if (ret < 0) {
> > @@ -1222,22 +1256,11 @@ static int imx7_csi_probe(struct platform_device *pdev)
> >  		goto destroy_mutex;
> >  	}
> >  
> > -	/* add media device */
> > -	imxmd = imx_media_dev_init(dev, NULL);
> > -	if (IS_ERR(imxmd)) {
> > -		ret = PTR_ERR(imxmd);
> > +	/* Initialize all the media device infrastructure. */
> > +	ret = imx7_csi_media_init(csi);
> > +	if (ret)
> >  		goto destroy_mutex;
> > -	}
> >  
> > -	ret = imx_media_of_add_csi(imxmd, node);
> > -	if (ret < 0 && ret != -ENODEV && ret != -EEXIST)
> > -		goto cleanup;
> > -
> > -	ret = imx_media_dev_notifier_register(imxmd, NULL);
> > -	if (ret < 0)
> > -		goto cleanup;
> > -
> > -	csi->imxmd = imxmd;
> >  	v4l2_subdev_init(&csi->sd, &imx7_csi_subdev_ops);
> >  	v4l2_set_subdevdata(&csi->sd, csi);
> >  	csi->sd.internal_ops = &imx7_csi_internal_ops;
> > @@ -1269,11 +1292,7 @@ static int imx7_csi_probe(struct platform_device *pdev)
> >  	v4l2_async_nf_cleanup(&csi->notifier);
> >  
> >  cleanup:
> > -	v4l2_async_nf_unregister(&imxmd->notifier);
> > -	v4l2_async_nf_cleanup(&imxmd->notifier);
> 
> Didn't this notifier got dropped in cleanup() function? or am I
> missing something?

They should be kept in imx7_csi_media_cleanup() and removed later. I'll
fix it too.

> > -	v4l2_device_unregister(&imxmd->v4l2_dev);
> > -	media_device_unregister(&imxmd->md);
> > -	media_device_cleanup(&imxmd->md);
> > +	imx7_csi_media_cleanup(csi);
> >  
> >  destroy_mutex:
> >  	mutex_destroy(&csi->lock);
> > @@ -1285,14 +1304,8 @@ static int imx7_csi_remove(struct platform_device *pdev)
> >  {
> >  	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
> >  	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
> > -	struct imx_media_dev *imxmd = csi->imxmd;
> >  
> > -	v4l2_async_nf_unregister(&imxmd->notifier);
> > -	v4l2_async_nf_cleanup(&imxmd->notifier);
> > -
> > -	media_device_unregister(&imxmd->md);
> > -	v4l2_device_unregister(&imxmd->v4l2_dev);
> > -	media_device_cleanup(&imxmd->md);
> > +	imx7_csi_media_cleanup(csi);
> >  
> >  	v4l2_async_nf_unregister(&csi->notifier);
> >  	v4l2_async_nf_cleanup(&csi->notifier);

-- 
Regards,

Laurent Pinchart
