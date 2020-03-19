Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF06318C311
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 23:40:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727488AbgCSWkr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 18:40:47 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:52898 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727178AbgCSWkr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 18:40:47 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02JMeh6Q114612;
        Thu, 19 Mar 2020 17:40:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584657643;
        bh=NIkFSJ/3aKdm8L1HeD5lEXCGSxT4qHDe4qtdBD3g3xo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=CsotN64pCs8JBU58m+HuiBObzDVHLTSv3Zczw8AWT2qS1JF/XRKFlfx/Zfnb/pvx2
         kjKl6nfBtTK0wiI5grSCl81f84aQbblYHb3r38alaMC/DeEOd1SVBtja0YjLjdntf/
         Sz4zcejWkfx85Npk/3nY3CAsmTexY1WNUuqKuryE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JMehuc083887;
        Thu, 19 Mar 2020 17:40:43 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 17:40:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 17:40:43 -0500
Received: from [10.250.87.129] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JMegdk049635;
        Thu, 19 Mar 2020 17:40:42 -0500
Subject: Re: [PATCH v2 10/19] media: ti-vpe: cal: remove useless IRQ defines
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        <linux-media@vger.kernel.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <20200319075023.22151-1-tomi.valkeinen@ti.com>
 <20200319075023.22151-11-tomi.valkeinen@ti.com>
From:   Benoit Parrot <bparrot@ti.com>
Message-ID: <429e9f7e-4506-a6aa-fe66-85da49ed5db8@ti.com>
Date:   Thu, 19 Mar 2020 17:40:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319075023.22151-11-tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tomi,

Thanks for the patch.

On 3/19/20 2:50 AM, Tomi Valkeinen wrote:
> Remove a bunch of IRQ defines, of which only CAL_HL_IRQ_ENABLE and
> CAL_HL_IRQ_CLEAR are used, and these defines only end up obfuscating
> code.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Benoit Parrot <bparrot@ti.com>

> ---
>  drivers/media/platform/ti-vpe/cal.c      | 8 ++++----
>  drivers/media/platform/ti-vpe/cal_regs.h | 6 ------
>  2 files changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 53072afbaf4e..979f9027a232 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -701,11 +701,11 @@ static void enable_irqs(struct cal_ctx *ctx)
>  
>  	/* Enable IRQ_WDMA_END 0/1 */
>  	val = 0;
> -	set_field(&val, CAL_HL_IRQ_ENABLE, CAL_HL_IRQ_MASK(ctx->csi2_port));
> +	set_field(&val, 1, CAL_HL_IRQ_MASK(ctx->csi2_port));
>  	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(2), val);
>  	/* Enable IRQ_WDMA_START 0/1 */
>  	val = 0;
> -	set_field(&val, CAL_HL_IRQ_ENABLE, CAL_HL_IRQ_MASK(ctx->csi2_port));
> +	set_field(&val, 1, CAL_HL_IRQ_MASK(ctx->csi2_port));
>  	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(3), val);
>  	/* Todo: Add VC_IRQ and CSI2_COMPLEXIO_IRQ handling */
>  	reg_write(ctx->dev, CAL_CSI2_VC_IRQENABLE(1), 0xFF000000);
> @@ -723,11 +723,11 @@ static void disable_irqs(struct cal_ctx *ctx)
>  
>  	/* Disable IRQ_WDMA_END 0/1 */
>  	val = 0;
> -	set_field(&val, CAL_HL_IRQ_CLEAR, CAL_HL_IRQ_MASK(ctx->csi2_port));
> +	set_field(&val, 1, CAL_HL_IRQ_MASK(ctx->csi2_port));
>  	reg_write(ctx->dev, CAL_HL_IRQENABLE_CLR(2), val);
>  	/* Disable IRQ_WDMA_START 0/1 */
>  	val = 0;
> -	set_field(&val, CAL_HL_IRQ_CLEAR, CAL_HL_IRQ_MASK(ctx->csi2_port));
> +	set_field(&val, 1, CAL_HL_IRQ_MASK(ctx->csi2_port));
>  	reg_write(ctx->dev, CAL_HL_IRQENABLE_CLR(3), val);
>  	/* Todo: Add VC_IRQ and CSI2_COMPLEXIO_IRQ handling */
>  	reg_write(ctx->dev, CAL_CSI2_VC_IRQENABLE(1), 0);
> diff --git a/drivers/media/platform/ti-vpe/cal_regs.h b/drivers/media/platform/ti-vpe/cal_regs.h
> index 3b3150aaf343..6a235abc25b1 100644
> --- a/drivers/media/platform/ti-vpe/cal_regs.h
> +++ b/drivers/media/platform/ti-vpe/cal_regs.h
> @@ -142,12 +142,6 @@
>  #define CAL_HL_IRQ_EOI_LINE_NUMBER_EOI0			0
>  
>  #define CAL_HL_IRQ_MASK(m)			BIT((m) - 1)
> -#define CAL_HL_IRQ_NOACTION				0x0
> -#define CAL_HL_IRQ_ENABLE				0x1
> -#define CAL_HL_IRQ_CLEAR				0x1
> -#define CAL_HL_IRQ_DISABLED				0x0
> -#define CAL_HL_IRQ_ENABLED				0x1
> -#define CAL_HL_IRQ_PENDING				0x1
>  
>  #define CAL_HL_IRQ_OCPO_ERR_MASK		BIT(6)
>  
> 
