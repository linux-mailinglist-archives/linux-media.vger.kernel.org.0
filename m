Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14AA018C32D
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 23:45:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbgCSWpQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 18:45:16 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:34608 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726856AbgCSWpP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 18:45:15 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02JMjCnL042205;
        Thu, 19 Mar 2020 17:45:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584657912;
        bh=r/7qGD8TDkA90jlAdFsLpCQue5CCfLxjo21MeabY2sE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=RxSjdskkuMoJsS89XmDiI/JXfY8J9Gfa6Z0AaQ6eSoPl0609FT2yk/AdtUhlhkMhV
         CfeR8SovcqeYGuHxjpHpQPZggTdiCBTf9SHorxK+wfY/fQoVUcFELMh44mXhWMJTF9
         j70dZtKaEBweBLRntMJPk1ItnUuH9nNK2TsRP3hc=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JMjC5a089589;
        Thu, 19 Mar 2020 17:45:12 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 17:45:12 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 17:45:12 -0500
Received: from [10.250.87.129] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JMjBXX059919;
        Thu, 19 Mar 2020 17:45:11 -0500
Subject: Re: [PATCH v2 16/19] media: ti-vpe: cal: move code to separate
 functions
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        <linux-media@vger.kernel.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <20200319075023.22151-1-tomi.valkeinen@ti.com>
 <20200319075023.22151-17-tomi.valkeinen@ti.com>
From:   Benoit Parrot <bparrot@ti.com>
Message-ID: <69246307-f4f8-af41-926b-16cada611637@ti.com>
Date:   Thu, 19 Mar 2020 17:45:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319075023.22151-17-tomi.valkeinen@ti.com>
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
> To make csi2_wait_for_phy() more readable, move code to separate
> functions.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Benoit Parrot <bparrot@ti.com>

> ---
>  drivers/media/platform/ti-vpe/cal.c | 38 ++++++++++++++++++++---------
>  1 file changed, 26 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index b1b9616b12b6..ed68ad58121e 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -823,20 +823,10 @@ static void csi2_phy_init(struct cal_ctx *ctx)
>  	csi2_cio_power(ctx, true);
>  }
>  
> -static void csi2_wait_for_phy(struct cal_ctx *ctx)
> +static void csi2_wait_complexio_reset(struct cal_ctx *ctx)
>  {
>  	int i;
>  
> -	/* Steps
> -	 *  2. Wait for completion of reset
> -	 *          Note if the external sensor is not sending byte clock,
> -	 *          the reset will timeout
> -	 *  4.Force FORCERXMODE
> -	 *      G. Wait for all enabled lane to reach stop state
> -	 *      H. Disable pull down using pad control
> -	 */
> -
> -	/* 2. Wait for reset completion */
>  	for (i = 0; i < 250; i++) {
>  		if (reg_read_field(ctx->dev,
>  				   CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
> @@ -855,7 +845,12 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
>  			   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED)
>  		ctx_err(ctx, "Timeout waiting for Complex IO reset done\n");
>  
> -	/* 4. G. Wait for all enabled lane to reach stop state */
> +}
> +
> +static void csi2_wait_stop_state(struct cal_ctx *ctx)
> +{
> +	int i;
> +
>  	for (i = 0; i < 10; i++) {
>  		if (reg_read_field(ctx->dev,
>  				   CAL_CSI2_TIMING(ctx->csi2_port),
> @@ -867,9 +862,28 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
>  		ctx->csi2_port,
>  		reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port)),
>  		(i >= 10) ? "(timeout)" : "");
> +
>  	if (reg_read_field(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port),
>  			   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) != 0)
>  		ctx_err(ctx, "Timeout waiting for stop state\n");
> +}
> +
> +static void csi2_wait_for_phy(struct cal_ctx *ctx)
> +{
> +	/* Steps
> +	 *  2. Wait for completion of reset
> +	 *          Note if the external sensor is not sending byte clock,
> +	 *          the reset will timeout
> +	 *  4.Force FORCERXMODE
> +	 *      G. Wait for all enabled lane to reach stop state
> +	 *      H. Disable pull down using pad control
> +	 */
> +
> +	/* 2. Wait for reset completion */
> +	csi2_wait_complexio_reset(ctx);
> +
> +	/* 4. G. Wait for all enabled lane to reach stop state */
> +	csi2_wait_stop_state(ctx);
>  
>  	ctx_dbg(1, ctx, "CSI2_%d_REG1 = 0x%08x (Bit(31,28) should be set!)\n",
>  		(ctx->csi2_port - 1), reg_read(ctx->cc, CAL_CSI2_PHY_REG1));
> 
