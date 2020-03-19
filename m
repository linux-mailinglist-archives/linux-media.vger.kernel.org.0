Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ECBD18C309
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 23:38:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727488AbgCSWiJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 18:38:09 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:52578 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727091AbgCSWiJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 18:38:09 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02JMc56I114061;
        Thu, 19 Mar 2020 17:38:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584657485;
        bh=poAMfrh5hh75lOTE5PewUt2iSdohGzcad/I/N+MZpM0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=uiQ23u6rpHyaizAFtg1ARvK3KUwPICFwFSwTmByyq37BehC3LGu+B2fmJRv8k63xg
         TwWWJaNgzK9ylSods075FB+A2t0iBQay+yY5h6Wx/izofEwPDf32J3QbXU7PvGdFcP
         28uTJPJb8HWpgrc2C7ynNYRg+sOT8U6o1kICWR9o=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02JMc5sc109010
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Mar 2020 17:38:05 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 17:38:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 17:38:05 -0500
Received: from [10.250.87.129] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JMc4YJ054625;
        Thu, 19 Mar 2020 17:38:04 -0500
Subject: Re: [PATCH v2 07/19] media: ti-vpe: cal: print errors on timeouts
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        <linux-media@vger.kernel.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <20200319075023.22151-1-tomi.valkeinen@ti.com>
 <20200319075023.22151-8-tomi.valkeinen@ti.com>
From:   Benoit Parrot <bparrot@ti.com>
Message-ID: <5bbc5890-c623-6913-5ad4-dbe7fe1abfee@ti.com>
Date:   Thu, 19 Mar 2020 17:38:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319075023.22151-8-tomi.valkeinen@ti.com>
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
> The driver does not print any errors on ComplexIO reset timeout or when
> waiting for stop-state, making it difficult to debug and notice
> problems.
> 
> Add error prints for these cases.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 838215a3f230..b070c56f8d80 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -844,6 +844,11 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
>  		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)), i,
>  		(i >= 250) ? "(timeout)" : "");
>  
> +	if (reg_read_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
> +			   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) !=
> +			   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED)
> +		ctx_err(ctx, "Timeout waiting for Complex IO reset done\n");
> +

Since you are promoting these from debug to error event then removing the related
ctx_dbg statement would make sense then.

I was using these as debug statement before but they are now useless if an error
trace is generated instead.

>  	/* 4. G. Wait for all enabled lane to reach stop state */
>  	for (i = 0; i < 10; i++) {
>  		if (reg_read_field(ctx->dev,
> @@ -857,6 +862,9 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
>  		ctx->csi2_port,
>  		reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port)),
>  		(i >= 10) ? "(timeout)" : "");

Same here.

But with that, 

Reviewed-by: Benoit Parrot <bparrot@ti.com>

> +	if (reg_read_field(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port),
> +			   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) != 0)
> +		ctx_err(ctx, "Timeout waiting for stop state\n");
>  
>  	ctx_dbg(1, ctx, "CSI2_%d_REG1 = 0x%08x (Bit(31,28) should be set!)\n",
>  		(ctx->csi2_port - 1), reg_read(ctx->cc, CAL_CSI2_PHY_REG1));
> 
