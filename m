Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1232E18C31B
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 23:42:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727313AbgCSWm2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 18:42:28 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53066 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbgCSWm2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 18:42:28 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02JMgORA115080;
        Thu, 19 Mar 2020 17:42:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584657744;
        bh=a02nQnO614mrWiJ9aXZcjNFOOp7htJQD+O4nnaUQmYg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=DVnxMpTOqn1zV8ebxzg6ROpIQ/FBjFOCxQuHVOGBVVa4FUICVnCuyUbA/BKe7YwOI
         vtI6TZXKFP5GQ8iIPBgAQnvll7OSPlFNoNNRJij6UBqcZGLvytMXNsOJemFRuj5rhg
         oqzzOPcjActRobIm3ajVjpyXrOR75fhkDyVXnyt0=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02JMgOj6124353
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Mar 2020 17:42:24 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 17:42:24 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 17:42:24 -0500
Received: from [10.250.87.129] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JMgN9p053136;
        Thu, 19 Mar 2020 17:42:23 -0500
Subject: Re: [PATCH v2 12/19] media: ti-vpe: cal: cleanup CIO power
 enable/disable
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        <linux-media@vger.kernel.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <20200319075023.22151-1-tomi.valkeinen@ti.com>
 <20200319075023.22151-13-tomi.valkeinen@ti.com>
From:   Benoit Parrot <bparrot@ti.com>
Message-ID: <603fff60-d10c-400b-7cf6-c4c076f02323@ti.com>
Date:   Thu, 19 Mar 2020 17:42:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319075023.22151-13-tomi.valkeinen@ti.com>
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
> Move the code to enable and disable ComplexIO power to its own function.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Benoit Parrot <bparrot@ti.com>

> ---
>  drivers/media/platform/ti-vpe/cal.c | 67 +++++++++++++----------------
>  1 file changed, 31 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 5208dfde6fb5..ed32b199aabe 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -733,11 +733,39 @@ static void disable_irqs(struct cal_ctx *ctx)
>  	reg_write(ctx->dev, CAL_CSI2_VC_IRQENABLE(1), 0);
>  }
>  
> +static void csi2_cio_power(struct cal_ctx *ctx, bool enable)
> +{
> +	u32 target_state;
> +	unsigned int i;
> +
> +	target_state = enable ? CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_ON :
> +		       CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_OFF;
> +
> +	reg_write_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
> +			target_state, CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);
> +
> +	for (i = 0; i < 10; i++) {
> +		u32 current_state;
> +
> +		current_state = reg_read_field(ctx->dev,
> +					       CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
> +					       CAL_CSI2_COMPLEXIO_CFG_PWR_STATUS_MASK);
> +
> +		if (current_state == target_state)
> +			break;
> +
> +		usleep_range(1000, 1100);
> +	}
> +
> +	if (i == 10)
> +		ctx_err(ctx, "Failed to power %s complexio\n",
> +			enable ? "up" : "down");
> +}
> +
>  static void csi2_phy_config(struct cal_ctx *ctx);
>  
>  static void csi2_phy_init(struct cal_ctx *ctx)
>  {
> -	int i;
>  	u32 val;
>  
>  	/* Steps
> @@ -792,23 +820,7 @@ static void csi2_phy_init(struct cal_ctx *ctx)
>  		reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port)));
>  
>  	/* E. Power up the PHY using the complex IO */
> -	reg_write_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
> -			CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_ON,
> -			CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);
> -
> -	/* F. Wait for power up completion */
> -	for (i = 0; i < 10; i++) {
> -		if (reg_read_field(ctx->dev,
> -				   CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
> -				   CAL_CSI2_COMPLEXIO_CFG_PWR_STATUS_MASK) ==
> -		    CAL_CSI2_COMPLEXIO_CFG_PWR_STATUS_STATE_ON)
> -			break;
> -		usleep_range(1000, 1100);
> -	}
> -	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Powered UP %s\n",
> -		ctx->csi2_port,
> -		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)),
> -		(i >= 10) ? "(timeout)" : "");
> +	csi2_cio_power(ctx, true);
>  }
>  
>  static void csi2_wait_for_phy(struct cal_ctx *ctx)
> @@ -867,24 +879,7 @@ static void csi2_phy_deinit(struct cal_ctx *ctx)
>  {
>  	int i;
>  
> -	/* Power down the PHY using the complex IO */
> -	reg_write_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
> -			CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_OFF,
> -			CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);
> -
> -	/* Wait for power down completion */
> -	for (i = 0; i < 10; i++) {
> -		if (reg_read_field(ctx->dev,
> -				   CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
> -				   CAL_CSI2_COMPLEXIO_CFG_PWR_STATUS_MASK) ==
> -		    CAL_CSI2_COMPLEXIO_CFG_PWR_STATUS_STATE_OFF)
> -			break;
> -		usleep_range(1000, 1100);
> -	}
> -	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Powered Down %s\n",
> -		ctx->csi2_port,
> -		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)),
> -		(i >= 10) ? "(timeout)" : "");
> +	csi2_cio_power(ctx, false);
>  
>  	/* Assert Comple IO Reset */
>  	reg_write_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
> 
