Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1F63AC1C9
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 06:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbhFREK6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 00:10:58 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39532 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229466AbhFREK6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 00:10:58 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 652561F4466D
Subject: Re: [PATCH v5 04/10] media: rockchip: rkisp1: allow separate
 interrupts
To:     Heiko Stuebner <heiko@sntech.de>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     ezequiel@collabora.com, helen.koike@collabora.com,
        Laurent.pinchart@ideasonboard.com,
        linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
References: <20210617162745.4080975-1-heiko@sntech.de>
 <20210617162745.4080975-5-heiko@sntech.de>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <1a9ecd26-e1a4-9ae8-51c8-06664bc45427@collabora.com>
Date:   Fri, 18 Jun 2021 07:08:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210617162745.4080975-5-heiko@sntech.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 17.06.21 19:27, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> Depending on the per-soc implementation there can be one interrupt
> for isp, mipi and capture events or separate per-event interrupts.
> 
> So simply check for the presence of a named "mi" interrupt
> to differentiate between the two cases.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> ---
>   .../platform/rockchip/rkisp1/rkisp1-capture.c |  9 +++-
>   .../platform/rockchip/rkisp1/rkisp1-common.h  |  7 +--
>   .../platform/rockchip/rkisp1/rkisp1-dev.c     | 44 ++++++++++++-------
>   .../platform/rockchip/rkisp1/rkisp1-isp.c     | 16 +++++--
>   4 files changed, 53 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index 5f6c9d1623e4..f70c66c2a1d7 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -685,12 +685,17 @@ static void rkisp1_handle_buffer(struct rkisp1_capture *cap)
>   	spin_unlock(&cap->buf.lock);
>   }
>   
> -void rkisp1_capture_isr(struct rkisp1_device *rkisp1)
> +irqreturn_t rkisp1_capture_isr(int irq, void *ctx)
>   {
> +	struct device *dev = ctx;
> +	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
>   	unsigned int i;
>   	u32 status;
>   
>   	status = rkisp1_read(rkisp1, RKISP1_CIF_MI_MIS);
> +	if (!status)
> +		return IRQ_NONE;
> +
>   	rkisp1_write(rkisp1, status, RKISP1_CIF_MI_ICR);
>   
>   	for (i = 0; i < ARRAY_SIZE(rkisp1->capture_devs); ++i) {
> @@ -718,6 +723,8 @@ void rkisp1_capture_isr(struct rkisp1_device *rkisp1)
>   		cap->is_streaming = false;
>   		wake_up(&cap->done);
>   	}
> +
> +	return IRQ_HANDLED;
>   }
>   
>   /* ----------------------------------------------------------------------------
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index be8a350c7527..25dd5c93620e 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -12,6 +12,7 @@
>   #define _RKISP1_COMMON_H
>   
>   #include <linux/clk.h>
> +#include <linux/interrupt.h>
>   #include <linux/mutex.h>
>   #include <linux/rkisp1-config.h>
>   #include <media/media-device.h>
> @@ -459,9 +460,9 @@ void rkisp1_params_configure(struct rkisp1_params *params,
>   void rkisp1_params_disable(struct rkisp1_params *params);
>   
>   /* irq handlers */
> -void rkisp1_isp_isr(struct rkisp1_device *rkisp1);
> -void rkisp1_mipi_isr(struct rkisp1_device *rkisp1);
> -void rkisp1_capture_isr(struct rkisp1_device *rkisp1);
> +irqreturn_t rkisp1_isp_isr(int irq, void *ctx);
> +irqreturn_t rkisp1_mipi_isr(int irq, void *ctx);
> +irqreturn_t rkisp1_capture_isr(int irq, void *ctx);
>   void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris);
>   void rkisp1_params_isr(struct rkisp1_device *rkisp1);
>   
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index 7afa4c123834..a14a0bc39fb0 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -101,9 +101,16 @@
>    *  +-----------+    +-----------+
>    */
>   
> +struct rkisp1_isr_data {
> +	const char *name;
> +	irqreturn_t (*isr)(int irq, void *ctx);
> +};
> +
>   struct rkisp1_match_data {
>   	const char * const *clks;
>   	unsigned int size;

now that we have two arrays, maybe rename 'size' to 'clks_size'?

Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

> +	const struct rkisp1_isr_data *isrs;
> +	unsigned int isr_size;
>   	enum rkisp1_cif_isp_version isp_ver;
>   };
>   
> @@ -385,18 +392,15 @@ static int rkisp1_entities_register(struct rkisp1_device *rkisp1)
>   
>   static irqreturn_t rkisp1_isr(int irq, void *ctx)
>   {
> -	struct device *dev = ctx;
> -	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
> -
>   	/*
>   	 * Call rkisp1_capture_isr() first to handle the frame that
>   	 * potentially completed using the current frame_sequence number before
>   	 * it is potentially incremented by rkisp1_isp_isr() in the vertical
>   	 * sync.
>   	 */
> -	rkisp1_capture_isr(rkisp1);
> -	rkisp1_isp_isr(rkisp1);
> -	rkisp1_mipi_isr(rkisp1);
> +	rkisp1_capture_isr(irq, ctx);
> +	rkisp1_isp_isr(irq, ctx);
> +	rkisp1_mipi_isr(irq, ctx);
>   
>   	return IRQ_HANDLED;
>   }
> @@ -407,9 +411,15 @@ static const char * const rk3399_isp_clks[] = {
>   	"hclk",
>   };
>   
> +static const struct rkisp1_isr_data rk3399_isp_isrs[] = {
> +	{ NULL, rkisp1_isr },
> +};
> +
>   static const struct rkisp1_match_data rk3399_isp_match_data = {
>   	.clks = rk3399_isp_clks,
>   	.size = ARRAY_SIZE(rk3399_isp_clks),
> +	.isrs = rk3399_isp_isrs,
> +	.isr_size = ARRAY_SIZE(rk3399_isp_isrs),
>   	.isp_ver = RKISP1_V10,
>   };
>   
> @@ -478,15 +488,19 @@ static int rkisp1_probe(struct platform_device *pdev)
>   	if (IS_ERR(rkisp1->base_addr))
>   		return PTR_ERR(rkisp1->base_addr);
>   
> -	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0)
> -		return irq;
> -
> -	ret = devm_request_irq(dev, irq, rkisp1_isr, IRQF_SHARED,
> -			       dev_driver_string(dev), dev);
> -	if (ret) {
> -		dev_err(dev, "request irq failed: %d\n", ret);
> -		return ret;
> +	for (i = 0; i < match_data->isr_size; i++) {
> +		irq = (match_data->isrs[i].name) ?
> +				platform_get_irq_byname(pdev, match_data->isrs[i].name) :
> +				platform_get_irq(pdev, i);
> +		if (irq < 0)
> +			return irq;
> +
> +		ret = devm_request_irq(dev, irq, match_data->isrs[i].isr, IRQF_SHARED,
> +				       dev_driver_string(dev), dev);
> +		if (ret) {
> +			dev_err(dev, "request irq failed: %d\n", ret);
> +			return ret;
> +		}
>   	}
>   
>   	for (i = 0; i < match_data->size; i++)
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 2e5b57e3aedc..1de98e688008 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -1090,13 +1090,15 @@ void rkisp1_isp_unregister(struct rkisp1_device *rkisp1)
>    * Interrupt handlers
>    */
>   
> -void rkisp1_mipi_isr(struct rkisp1_device *rkisp1)
> +irqreturn_t rkisp1_mipi_isr(int irq, void *ctx)
>   {
> +	struct device *dev = ctx;
> +	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
>   	u32 val, status;
>   
>   	status = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_MIS);
>   	if (!status)
> -		return;
> +		return IRQ_NONE;
>   
>   	rkisp1_write(rkisp1, status, RKISP1_CIF_MIPI_ICR);
>   
> @@ -1131,6 +1133,8 @@ void rkisp1_mipi_isr(struct rkisp1_device *rkisp1)
>   	} else {
>   		rkisp1->debug.mipi_error++;
>   	}
> +
> +	return IRQ_HANDLED;
>   }
>   
>   static void rkisp1_isp_queue_event_sof(struct rkisp1_isp *isp)
> @@ -1143,13 +1147,15 @@ static void rkisp1_isp_queue_event_sof(struct rkisp1_isp *isp)
>   	v4l2_event_queue(isp->sd.devnode, &event);
>   }
>   
> -void rkisp1_isp_isr(struct rkisp1_device *rkisp1)
> +irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
>   {
> +	struct device *dev = ctx;
> +	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
>   	u32 status, isp_err;
>   
>   	status = rkisp1_read(rkisp1, RKISP1_CIF_ISP_MIS);
>   	if (!status)
> -		return;
> +		return IRQ_NONE;
>   
>   	rkisp1_write(rkisp1, status, RKISP1_CIF_ISP_ICR);
>   
> @@ -1191,4 +1197,6 @@ void rkisp1_isp_isr(struct rkisp1_device *rkisp1)
>   		 */
>   		rkisp1_params_isr(rkisp1);
>   	}
> +
> +	return IRQ_HANDLED;
>   }
> 
