Return-Path: <linux-media+bounces-1634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B63804C1F
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 09:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87B58281707
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 08:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8B13C067;
	Tue,  5 Dec 2023 08:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NG5AsM1W"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE21ABA;
	Tue,  5 Dec 2023 00:20:10 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0071D4DB;
	Tue,  5 Dec 2023 09:19:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701764369;
	bh=as9eWJPgC11SsS4l6Lvvaa+kNs5Pv8jA5yRszHq/yuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NG5AsM1WDj/dpFyJXpfYG2U5Wk/Q8d2hWl9HP/Fi8TetGLkByR35i57owTTYVsXyF
	 /Cjng5whpC2Ol5A6X4s58FNdlkLFMBUrWBwElrEja5csvQigusRNURPuNXtYd0zVV4
	 +2EHuUz31Bv8ROLQhwOtdRTqg3lF3O4FVjhJgoDs=
Date: Tue, 5 Dec 2023 10:20:16 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	kieran.bingham@ideasonboard.com, umang.jain@ideasonboard.com,
	aford173@gmail.com, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] media: rkisp1: Fix IRQ handling due to shared
 interrupts
Message-ID: <20231205082016.GA17394@pendragon.ideasonboard.com>
References: <20231205-rkisp-irq-fix-v1-0-f4045c74ba45@ideasonboard.com>
 <20231205-rkisp-irq-fix-v1-3-f4045c74ba45@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231205-rkisp-irq-fix-v1-3-f4045c74ba45@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Tue, Dec 05, 2023 at 10:09:34AM +0200, Tomi Valkeinen wrote:
> The driver requests the interrupts as IRQF_SHARED, so the interrupt
> handlers can be called at any time. If such a call happens while the ISP
> is powered down, the SoC will hang as the driver tries to access the
> ISP registers.

Is IRQF_SHARED actually needed ?

> Fix this by adding a new field, 'irqs_enabled', which is used to bail
> out from the interrupt handler when the ISP is not operational.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../media/platform/rockchip/rkisp1/rkisp1-capture.c |  3 +++
>  .../media/platform/rockchip/rkisp1/rkisp1-common.h  |  2 ++
>  drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c |  3 +++
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 21 +++++++++++++++++++++
>  drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c |  3 +++
>  5 files changed, 32 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index b50b044d22af..e92067897f28 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -779,6 +779,9 @@ irqreturn_t rkisp1_capture_isr(int irq, void *ctx)
>  	unsigned int i;
>  	u32 status;
>  
> +	if (!rkisp1->irqs_enabled)
> +		return IRQ_NONE;
> +
>  	status = rkisp1_read(rkisp1, RKISP1_CIF_MI_MIS);
>  	if (!status)
>  		return IRQ_NONE;
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index ec28907d978e..7f97fdf6e24c 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -465,6 +465,7 @@ struct rkisp1_debug {
>   * @debug:	   debug params to be exposed on debugfs
>   * @info:	   version-specific ISP information
>   * @irqs:          IRQ line numbers
> + * @irqs_enabled:  the hardware is enabled and can cause interrupts
>   */
>  struct rkisp1_device {
>  	void __iomem *base_addr;
> @@ -488,6 +489,7 @@ struct rkisp1_device {
>  	struct rkisp1_debug debug;
>  	const struct rkisp1_info *info;
>  	int irqs[RKISP1_NUM_IRQS];
> +	bool irqs_enabled;
>  };
>  
>  /*
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
> index 47f4353a1784..f6b54654b435 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
> @@ -184,6 +184,9 @@ irqreturn_t rkisp1_csi_isr(int irq, void *ctx)
>  	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
>  	u32 val, status;
>  
> +	if (!rkisp1->irqs_enabled)
> +		return IRQ_NONE;
> +
>  	status = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_MIS);
>  	if (!status)
>  		return IRQ_NONE;
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index 1d60f4b8bd09..fbe03f7864e3 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -306,6 +306,23 @@ static int __maybe_unused rkisp1_runtime_suspend(struct device *dev)
>  {
>  	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
>  
> +	rkisp1->irqs_enabled = false;
> +	/* Make sure the IRQ handler will see the above */
> +	mb();
> +
> +	/*
> +	 * Wait until any running IRQ handler has returned. The IRQ handler
> +	 * may get called even after this (as it's a shared interrupt line)
> +	 * but the 'irqs_enabled' flag will make the handler return immediately.
> +	 */
> +	for (unsigned int i = 0; i < RKISP1_NUM_IRQS; ++i) {
> +		if (rkisp1->irqs[i] == -1)
> +			continue;
> +
> +		if (i == 0 || rkisp1->irqs[i - 1] != rkisp1->irqs[i])
> +			synchronize_irq(rkisp1->irqs[i]);
> +	}
> +
>  	clk_bulk_disable_unprepare(rkisp1->clk_size, rkisp1->clks);
>  	return pinctrl_pm_select_sleep_state(dev);
>  }
> @@ -322,6 +339,10 @@ static int __maybe_unused rkisp1_runtime_resume(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> +	rkisp1->irqs_enabled = true;
> +	/* Make sure the IRQ handler will see the above */
> +	mb();
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index dafbfd230542..d6b8786661ad 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -1082,6 +1082,9 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
>  	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
>  	u32 status, isp_err;
>  
> +	if (!rkisp1->irqs_enabled)
> +		return IRQ_NONE;
> +
>  	status = rkisp1_read(rkisp1, RKISP1_CIF_ISP_MIS);
>  	if (!status)
>  		return IRQ_NONE;

-- 
Regards,

Laurent Pinchart

