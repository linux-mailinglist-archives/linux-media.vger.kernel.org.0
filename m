Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 725E94208C3
	for <lists+linux-media@lfdr.de>; Mon,  4 Oct 2021 11:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232511AbhJDJx5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Oct 2021 05:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232161AbhJDJxy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Oct 2021 05:53:54 -0400
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E61EC061745;
        Mon,  4 Oct 2021 02:52:05 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id XKdcmnv1F3tiGXKdfmh3ub; Mon, 04 Oct 2021 11:52:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1633341123; bh=jjjbHSRCzSKAoGrG3LZ+H1GwUgiF12YdUyd+tANEgpA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=OHkO0ehIDm0GCJvHZb1mAFotVuC1zni2EBQwsvvSjexqnlh2tUMQqLe6ij3XiJlPL
         0SaIESHJlDnqOyZbxTql+KzD6FE5YL5Ku5jWkg5BE2Whl0I/TgJ9lJebCu4KNA2Yoy
         m+nKONTkZhQKGhDhCJ9U4IrDRQ400APOl+dYyzmCtFcCZID8Gibbs1BZG7P4W1O4cd
         7N3petlrMdpy6GCskA9LeC+mbJI13Az7v/9qsyKsGj8BcvTxzw0Ca8llzctjBkukpS
         kSqDFLSPb77D9Com0jfZgmHYaFm3tnEKEuWFpx0SwYovbTpj1vX7EWBz1OJgYGaoor
         e2kjimkgaXdAw==
Subject: Re: [PATCH] media: imx-jpeg: Add pm-runtime support for imx-jpeg
To:     Mirela Rabulea <mirela.rabulea@nxp.com>, mchehab@kernel.org,
        robert.chiras@nxp.com, laurentiu.palcu@nxp.com
Cc:     linux-imx@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20210927185547.3094607-1-mirela.rabulea@nxp.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <bf028428-9bac-2477-13cb-498ddc762ced@xs4all.nl>
Date:   Mon, 4 Oct 2021 11:52:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210927185547.3094607-1-mirela.rabulea@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKXR5ji+D5RJ2O1OT2xzqijXMeKkGlN9xUU4aPWDBkOqDciL0ICRVCknWsYwjNk2MAxEM/r7ee9O1TQfWSN1xCcMAa+7xUrE0TioH5uyUWoIo/5eOIWb
 n5pENOi17ecAbhtLKzozKCcyQFO1y2Cjq/lV28y1GFuVsO+rfiddzZ2+RLAquSyBSEX+7YgcE2WTkhQ208MUMt1SUTCRhlW1oYvJk05PCtuUgc6Fy1VFK7py
 BZd+d3l/7zmd0WtATNgEQzLAcVUEHxlZTUaWu8kQxSkeuAV30Abu54jzisF3+T2Q0d2u316JmTP44MeZ8ZnW3ItCib5JAEaoP1qCiq99RJdBrs1qYrqroCjm
 LgbcpaWFq4RIuSwWHmuwW91ffTVqusxdP5ltAvJndwdNu77SzA+FGFMX/4NWrX6VmHyZf8BBBSzCLwc7+0LmzlcKOsekKGSD489R79KXM1yB581PwfxdakHv
 AfIvGNsGJATuSL+V11zLr5zbUHz7r6OulI6ukOaQM/bS5cpd/uQ0ZYkRzRsIfBUdy8btNnxHJ0kivCwDCtoxfIWaIccSFOyJW49VcXTqICH6KOEDWootFT4d
 Fmk=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/09/2021 20:55, Mirela Rabulea wrote:
> From: Mirela Rabulea <mirela.rabulea@oss.nxp.com>
> 
> Save some power by disabling/enabling the jpeg clocks with
> every stream stop/start.
> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea@oss.nxp.com>
> ---
>  drivers/media/platform/imx-jpeg/mxc-jpeg.c | 79 +++++++++++++++++++++-
>  drivers/media/platform/imx-jpeg/mxc-jpeg.h |  2 +
>  2 files changed, 80 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
> index 73e73b6f2e5b..2e1fef88cdf0 100644
> --- a/drivers/media/platform/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
> @@ -49,6 +49,7 @@
>  #include <linux/slab.h>
>  #include <linux/irqreturn.h>
>  #include <linux/interrupt.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/pm_domain.h>
>  #include <linux/string.h>
>  
> @@ -1058,10 +1059,17 @@ static int mxc_jpeg_start_streaming(struct vb2_queue *q, unsigned int count)
>  {
>  	struct mxc_jpeg_ctx *ctx = vb2_get_drv_priv(q);
>  	struct mxc_jpeg_q_data *q_data = mxc_jpeg_get_q_data(ctx, q->type);
> +	int ret;
>  
>  	dev_dbg(ctx->mxc_jpeg->dev, "Start streaming ctx=%p", ctx);
>  	q_data->sequence = 0;
>  
> +	ret = pm_runtime_get_sync(ctx->mxc_jpeg->dev);

Use pm_runtime_resume_and_get instead of pm_runtime_get_sync(). pm_runtime_get_sync()
doesn't call pm_runtime_put_noidle() on error, which is unexpected. pm_runtime_resume_and_get()
handles this situation correctly.

> +	if (ret < 0) {
> +		dev_err(ctx->mxc_jpeg->dev, "Failed to power up jpeg\n");
> +		return ret;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -1079,9 +1087,10 @@ static void mxc_jpeg_stop_streaming(struct vb2_queue *q)
>  		else
>  			vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
>  		if (!vbuf)
> -			return;
> +			break;
>  		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
>  	}
> +	pm_runtime_put_sync(&ctx->mxc_jpeg->pdev->dev);
>  }
>  
>  static int mxc_jpeg_valid_comp_id(struct device *dev,
> @@ -1461,6 +1470,12 @@ static int mxc_jpeg_open(struct file *file)
>  		goto free;
>  	}
>  
> +	ret = pm_runtime_get_sync(mxc_jpeg->dev);

Ditto.

> +	if (ret < 0) {
> +		dev_err(ctx->mxc_jpeg->dev, "Failed to power up jpeg\n");
> +		goto error_pm;
> +	}
> +
>  	v4l2_fh_init(&ctx->fh, mxc_vfd);
>  	file->private_data = &ctx->fh;
>  	v4l2_fh_add(&ctx->fh);
> @@ -1487,8 +1502,10 @@ static int mxc_jpeg_open(struct file *file)
>  	return 0;
>  
>  error:
> +	pm_runtime_put_sync(mxc_jpeg->dev);
>  	v4l2_fh_del(&ctx->fh);
>  	v4l2_fh_exit(&ctx->fh);
> +error_pm:
>  	mutex_unlock(&mxc_jpeg->lock);
>  free:
>  	kfree(ctx);
> @@ -1875,6 +1892,7 @@ static int mxc_jpeg_release(struct file *file)
>  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>  	v4l2_fh_del(&ctx->fh);
>  	v4l2_fh_exit(&ctx->fh);
> +	pm_runtime_put_sync(mxc_jpeg->dev);
>  	kfree(ctx);
>  	mutex_unlock(&mxc_jpeg->lock);
>  
> @@ -2005,6 +2023,19 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
>  	jpeg->dev = dev;
>  	jpeg->mode = mode;
>  
> +	/* Get clocks */
> +	jpeg->clk_ipg = devm_clk_get(dev, "ipg");
> +	if (IS_ERR(jpeg->clk_ipg)) {
> +		dev_err(dev, "failed to get clock: ipg\n");
> +		goto err_clk;
> +	}
> +
> +	jpeg->clk_per = devm_clk_get(dev, "per");
> +	if (IS_ERR(jpeg->clk_per)) {
> +		dev_err(dev, "failed to get clock: per\n");
> +		goto err_clk;
> +	}
> +
>  	ret = mxc_jpeg_attach_pm_domains(jpeg);
>  	if (ret < 0) {
>  		dev_err(dev, "failed to attach power domains %d\n", ret);
> @@ -2073,6 +2104,7 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
>  			  jpeg->dec_vdev->minor);
>  
>  	platform_set_drvdata(pdev, jpeg);
> +	pm_runtime_enable(dev);
>  
>  	return 0;
>  
> @@ -2089,9 +2121,52 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
>  	mxc_jpeg_detach_pm_domains(jpeg);
>  
>  err_irq:
> +err_clk:
>  	return ret;
>  }
>  
> +#ifdef CONFIG_PM
> +static int mxc_jpeg_runtime_resume(struct device *dev)
> +{
> +	struct mxc_jpeg_dev *jpeg = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(jpeg->clk_ipg);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable clock: ipg\n");
> +		goto err_ipg;
> +	}
> +
> +	ret = clk_prepare_enable(jpeg->clk_per);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable clock: per\n");
> +		goto err_per;
> +	}
> +
> +	return 0;
> +
> +err_per:
> +	clk_disable_unprepare(jpeg->clk_ipg);
> +err_ipg:
> +	return ret;
> +}
> +
> +static int mxc_jpeg_runtime_suspend(struct device *dev)
> +{
> +	struct mxc_jpeg_dev *jpeg = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(jpeg->clk_ipg);
> +	clk_disable_unprepare(jpeg->clk_per);
> +
> +	return 0;
> +}
> +#endif
> +
> +static const struct dev_pm_ops	mxc_jpeg_pm_ops = {
> +	SET_RUNTIME_PM_OPS(mxc_jpeg_runtime_suspend,
> +			   mxc_jpeg_runtime_resume, NULL)
> +};
> +
>  static int mxc_jpeg_remove(struct platform_device *pdev)
>  {
>  	unsigned int slot;
> @@ -2100,6 +2175,7 @@ static int mxc_jpeg_remove(struct platform_device *pdev)
>  	for (slot = 0; slot < MXC_MAX_SLOTS; slot++)
>  		mxc_jpeg_free_slot_data(jpeg, slot);
>  
> +	pm_runtime_disable(&pdev->dev);
>  	video_unregister_device(jpeg->dec_vdev);
>  	v4l2_m2m_release(jpeg->m2m_dev);
>  	v4l2_device_unregister(&jpeg->v4l2_dev);
> @@ -2116,6 +2192,7 @@ static struct platform_driver mxc_jpeg_driver = {
>  	.driver = {
>  		.name = "mxc-jpeg",
>  		.of_match_table = mxc_jpeg_match,
> +		.pm = &mxc_jpeg_pm_ops,
>  	},
>  };
>  module_platform_driver(mxc_jpeg_driver);
> diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/imx-jpeg/mxc-jpeg.h
> index 4c210852e876..9fb2a5aaa941 100644
> --- a/drivers/media/platform/imx-jpeg/mxc-jpeg.h
> +++ b/drivers/media/platform/imx-jpeg/mxc-jpeg.h
> @@ -109,6 +109,8 @@ struct mxc_jpeg_dev {
>  	spinlock_t			hw_lock; /* hardware access lock */
>  	unsigned int			mode;
>  	struct mutex			lock; /* v4l2 ioctls serialization */
> +	struct clk			*clk_ipg;
> +	struct clk			*clk_per;
>  	struct platform_device		*pdev;
>  	struct device			*dev;
>  	void __iomem			*base_reg;
> 

Regards,

	Hans
