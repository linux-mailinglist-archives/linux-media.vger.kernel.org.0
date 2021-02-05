Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3DA310BC8
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 14:28:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbhBEN0o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 08:26:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbhBENXu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 08:23:50 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17F0FC0613D6
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 05:23:09 -0800 (PST)
Received: from [IPv6:2003:c7:cf1c:ce00:c5f9:7f5:ebcd:ea47] (p200300c7cf1cce00c5f907f5ebcdea47.dip0.t-ipconnect.de [IPv6:2003:c7:cf1c:ce00:c5f9:7f5:ebcd:ea47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8131B1F466B9;
        Fri,  5 Feb 2021 13:23:07 +0000 (GMT)
Subject: Re: [PATCH RFC 06/11] media: rockchip: rkisp1: allow separate
 interrupts
To:     Heiko Stuebner <heiko@sntech.de>, ezequiel@collabora.com,
        helen.koike@collabora.com, Laurent.pinchart@ideasonboard.com
Cc:     linux-rockchip@lists.infradead.org,
        christoph.muellner@theobroma-systems.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
References: <20210108193311.3423236-1-heiko@sntech.de>
 <20210108193311.3423236-7-heiko@sntech.de>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <584c3ef0-b7af-0c36-3747-ca3ebd0a0cca@collabora.com>
Date:   Fri, 5 Feb 2021 14:23:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210108193311.3423236-7-heiko@sntech.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

Am 08.01.21 um 20:33 schrieb Heiko Stuebner:
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
>   .../platform/rockchip/rkisp1/rkisp1-capture.c |  9 ++-
>   .../platform/rockchip/rkisp1/rkisp1-common.h  |  7 ++-
>   .../platform/rockchip/rkisp1/rkisp1-dev.c     | 58 ++++++++++++++-----
>   .../platform/rockchip/rkisp1/rkisp1-isp.c     | 16 +++--
>   4 files changed, 69 insertions(+), 21 deletions(-)
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
> index 038c303a8aed..44f333bf5d6a 100644
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
> @@ -460,9 +461,9 @@ void rkisp1_params_configure(struct rkisp1_params *params,
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
> index 68da1eed753d..96afc1d1a914 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -389,18 +389,15 @@ static int rkisp1_entities_register(struct rkisp1_device *rkisp1)
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

I remember we had a patch that check if all the rkisp1_*_isr calls return IRQ_NONE then we also return IRQ_NONE from here
instead of always returning IRQ_HANDLED. I think now it is the opportunity to add this.
Maybe better in a separate patch before this one, where you only change the rkisp1_*_isr signatures and return
the right value from rkisp1_isr

Thanks,
Dafna

>   }
> @@ -481,15 +478,50 @@ static int rkisp1_probe(struct platform_device *pdev)
>   	if (IS_ERR(rkisp1->base_addr))
>   		return PTR_ERR(rkisp1->base_addr);
>   
> -	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0)
> +	irq = platform_get_irq_byname_optional(pdev, "mi");
> +	if (irq == -EPROBE_DEFER) {
>   		return irq;
> +	} else if (irq < 0) {
> +		irq = platform_get_irq(pdev, 0);
> +		if (irq < 0)
> +			return irq;
> +
> +		ret = devm_request_irq(dev, irq, rkisp1_isr, IRQF_SHARED,
> +				       dev_driver_string(dev), dev);
> +		if (ret) {
> +			dev_err(dev, "request irq failed: %d\n", ret);
> +			return ret;
> +		}
> +	} else {
> +		/* we test-got the MI (capture) interrupt */
> +		ret = devm_request_irq(dev, irq, rkisp1_capture_isr, IRQF_SHARED,
> +				       dev_driver_string(dev), dev);
> +		if (ret) {
> +			dev_err(dev, "request mi irq failed: %d\n", ret);
> +			return ret;
> +		}
>   
> -	ret = devm_request_irq(dev, irq, rkisp1_isr, IRQF_SHARED,
> -			       dev_driver_string(dev), dev);
> -	if (ret) {
> -		dev_err(dev, "request irq failed: %d\n", ret);
> -		return ret;
> +		irq = platform_get_irq_byname_optional(pdev, "mipi");
> +		if (irq < 0)
> +			return irq;
> +
> +		ret = devm_request_irq(dev, irq, rkisp1_mipi_isr, IRQF_SHARED,
> +				       dev_driver_string(dev), dev);
> +		if (ret) {
> +			dev_err(dev, "request mipi irq failed: %d\n", ret);
> +			return ret;
> +		}
> +
> +		irq = platform_get_irq_byname_optional(pdev, "isp");
> +		if (irq < 0)
> +			return irq;
> +
> +		ret = devm_request_irq(dev, irq, rkisp1_isp_isr, IRQF_SHARED,
> +				       dev_driver_string(dev), dev);
> +		if (ret) {
> +			dev_err(dev, "request isp irq failed: %d\n", ret);
> +			return ret;
> +		}
>   	}
>   
>   	rkisp1->irq = irq;
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 889982d8ca41..84440aa71210 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -1056,13 +1056,15 @@ void rkisp1_isp_unregister(struct rkisp1_device *rkisp1)
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
> @@ -1097,6 +1099,8 @@ void rkisp1_mipi_isr(struct rkisp1_device *rkisp1)
>   	} else {
>   		rkisp1->debug.mipi_error++;
>   	}
> +
> +	return IRQ_HANDLED;
>   }
>   
>   static void rkisp1_isp_queue_event_sof(struct rkisp1_isp *isp)
> @@ -1109,13 +1113,15 @@ static void rkisp1_isp_queue_event_sof(struct rkisp1_isp *isp)
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
> @@ -1157,4 +1163,6 @@ void rkisp1_isp_isr(struct rkisp1_device *rkisp1)
>   		 */
>   		rkisp1_params_isr(rkisp1);
>   	}
> +
> +	return IRQ_HANDLED;
>   }
> 
