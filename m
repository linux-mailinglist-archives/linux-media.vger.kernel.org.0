Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF972DB90
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 13:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbfE2LST (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 07:18:19 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52062 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbfE2LSS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 07:18:18 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 72A1E2804FB;
        Wed, 29 May 2019 12:18:17 +0100 (BST)
Date:   Wed, 29 May 2019 13:18:14 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 3/9] media: hantro: add PM runtime resume callback
Message-ID: <20190529131814.6d8d14cc@collabora.com>
In-Reply-To: <20190529095424.23614-4-p.zabel@pengutronix.de>
References: <20190529095424.23614-1-p.zabel@pengutronix.de>
        <20190529095424.23614-4-p.zabel@pengutronix.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 29 May 2019 11:54:18 +0200
Philipp Zabel <p.zabel@pengutronix.de> wrote:

> It seems that on i.MX8MQ the power domain controller does not propagate
> resets to the VPU cores on resume. Add a callback to allow implementing
> manual reset of the VPU cores after ungating the power domain.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/staging/media/hantro/hantro.h     |  2 ++
>  drivers/staging/media/hantro/hantro_drv.c | 13 +++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> index 14e685428203..296b9ffad547 100644
> --- a/drivers/staging/media/hantro/hantro.h
> +++ b/drivers/staging/media/hantro/hantro.h
> @@ -56,6 +56,7 @@ struct hantro_codec_ops;
>   * @codec:			Supported codecs
>   * @codec_ops:			Codec ops.
>   * @init:			Initialize hardware.
> + * @runtime_resume:		reenable hardware after power gating
>   * @vepu_irq:			encoder interrupt handler
>   * @vdpu_irq:			decoder interrupt handler
>   * @clk_names:			array of clock names
> @@ -71,6 +72,7 @@ struct hantro_variant {
>  	unsigned int codec;
>  	const struct hantro_codec_ops *codec_ops;
>  	int (*init)(struct hantro_dev *vpu);
> +	int (*runtime_resume)(struct hantro_dev *vpu);
>  	irqreturn_t (*vepu_irq)(int irq, void *priv);
>  	irqreturn_t (*vdpu_irq)(int irq, void *priv);
>  	const char *clk_names[HANTRO_MAX_CLOCKS];
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index e4390aa5c213..fb5f140dbaae 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -831,9 +831,22 @@ static int hantro_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_PM
> +static int hantro_runtime_resume(struct device *dev)
> +{
> +	struct hantro_dev *vpu = dev_get_drvdata(dev);
> +
> +	if (vpu->variant->runtime_resume)
> +		return vpu->variant->runtime_resume(vpu);
> +
> +	return 0;
> +}
> +#endif
> +
>  static const struct dev_pm_ops hantro_pm_ops = {
>  	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>  				pm_runtime_force_resume)
> +	SET_RUNTIME_PM_OPS(NULL, hantro_runtime_resume, NULL)
>  };
>  
>  static struct platform_driver hantro_driver = {

