Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECB522DBF9
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 13:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbfE2LfC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 07:35:02 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52198 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbfE2LfC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 07:35:02 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 22ABD2804FB;
        Wed, 29 May 2019 12:35:00 +0100 (BST)
Date:   Wed, 29 May 2019 13:34:56 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 4/9] media: hantro: make irq names configurable
Message-ID: <20190529133456.0096a6a4@collabora.com>
In-Reply-To: <20190529095424.23614-5-p.zabel@pengutronix.de>
References: <20190529095424.23614-1-p.zabel@pengutronix.de>
        <20190529095424.23614-5-p.zabel@pengutronix.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 29 May 2019 11:54:19 +0200
Philipp Zabel <p.zabel@pengutronix.de> wrote:

> The i.MX8MQ bindings will use different IRQ names ("g1" instead of
> "vdpu", and "g2"), so make them configurable. This also allows to
> register more than two IRQs, which will be required for i.MX8MM support
> later (it will add "h1" instead of "vepu").
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> Changes since v1 [1]:
>  - Rebased onto "[PATCH v6] Add MPEG-2 decoding to Rockchip VPU" series.
> 
> [1] https://patchwork.linuxtv.org/patch/56285/
> ---
>  drivers/staging/media/hantro/hantro.h        | 11 ++++---
>  drivers/staging/media/hantro/hantro_drv.c    | 31 +++++++-------------
>  drivers/staging/media/hantro/rk3288_vpu_hw.c |  5 ++--
>  drivers/staging/media/hantro/rk3399_vpu_hw.c |  9 ++++--
>  4 files changed, 26 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> index 296b9ffad547..6b90fe48bcdf 100644
> --- a/drivers/staging/media/hantro/hantro.h
> +++ b/drivers/staging/media/hantro/hantro.h
> @@ -26,6 +26,7 @@
>  #include "hantro_hw.h"
>  
>  #define HANTRO_MAX_CLOCKS		4
> +#define HANTRO_MAX_IRQS			3
>  
>  #define MPEG2_MB_DIM			16
>  #define MPEG2_MB_WIDTH(w)		DIV_ROUND_UP(w, MPEG2_MB_DIM)
> @@ -57,8 +58,9 @@ struct hantro_codec_ops;
>   * @codec_ops:			Codec ops.
>   * @init:			Initialize hardware.
>   * @runtime_resume:		reenable hardware after power gating
> - * @vepu_irq:			encoder interrupt handler
> - * @vdpu_irq:			decoder interrupt handler
> + * @irq_handlers:		interrupt handlers, same order as irq names
> + * @irq_names:			array of irq names
> + * @num_irqs:			number of irqs in the arrays
>   * @clk_names:			array of clock names
>   * @num_clocks:			number of clocks in the array
>   */
> @@ -73,8 +75,9 @@ struct hantro_variant {
>  	const struct hantro_codec_ops *codec_ops;
>  	int (*init)(struct hantro_dev *vpu);
>  	int (*runtime_resume)(struct hantro_dev *vpu);
> -	irqreturn_t (*vepu_irq)(int irq, void *priv);
> -	irqreturn_t (*vdpu_irq)(int irq, void *priv);
> +	irqreturn_t (*irq_handlers[HANTRO_MAX_IRQS])(int irq, void *priv);
> +	const char *irq_names[HANTRO_MAX_IRQS];

Can we have a struct instead of an array for all handlers and another
array for irq names:

	struct {
		const char *name;
		irqreturn_t (*handler)(int irq, void *priv);
	} irqs[HANTRO_MAX_IRQS];

> +	int num_irqs;

Or we could have the struct defined outside of hantro_variant and get
rid of HANTRO_MAX_IRQS (I find it annoying to have to update the MAX
value every time a new variant needs more than what was previously
defined as MAX):

struct hantro_irq {
	const char *name;
	irqreturn_t (*handler)(int irq, void *priv);
};

struct hantro_variant {
	...
	unsigned int num_irqs;
	const struct hantro_irq *irqs;
};

static const struct hantro_irq xxxx_irqs[] = {
	{ ... },
	{ ... },

};

static const struct hantro_variant xxxx_variant = {
	.num_irqs = ARRAY_SIZE(xxxx_irqs),
	.irqs = xxxx_irqs,
};
