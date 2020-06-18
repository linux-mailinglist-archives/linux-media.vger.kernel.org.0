Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C32501FFB07
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 20:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728230AbgFRS3D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 14:29:03 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:58874 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727801AbgFRS3B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 14:29:01 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05IISwZa049999;
        Thu, 18 Jun 2020 13:28:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592504938;
        bh=y8Wik9TPQ15BvS7BQ24xmM0RSvXq59QCd0iqVO7pMm0=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=H+GVKcBAZURPHStVAq3yRql8/uGRVxwfWNg6GwQDPy8I1rgRx7MTcSlRK8rqt6v76
         NIZwTvjLcoUwE/Bv/7G5H+6+6BEqdieneCAn45CkJaQWmAZUVnXufCjg8IuDOoRoxy
         L7G2DL4hjCZidxG+PgBHtUnw/wrmvrn7SMDhNXBY=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05IISw9V045899
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 18 Jun 2020 13:28:58 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 18
 Jun 2020 13:28:58 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 18 Jun 2020 13:28:58 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id 05IISukE038043;
        Thu, 18 Jun 2020 13:28:57 -0500
Date:   Thu, 18 Jun 2020 13:28:55 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v1 030/107] media: ti-vpe: cal: Use dev_* print macros
Message-ID: <20200618182855.xdx64prbc54ifn5k@ti.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
 <20200614235944.17716-31-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200614235944.17716-31-laurent.pinchart@ideasonboard.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks you for the patch.

Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote on Mon [2020-Jun-15 02:58:27 +0300]:
> Use the dev_* print macros instead of the v4l2_* print macros. This
> prepares for a common print infrastructure that will also support the
> cal_camerarx instances.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index e40967751aa4..e62089832713 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -53,19 +53,22 @@ static unsigned debug;
>  module_param(debug, uint, 0644);
>  MODULE_PARM_DESC(debug, "activates debug info");
>  
> -#define cal_dbg(level, cal, fmt, arg...)	\
> -		v4l2_dbg(level, debug, &cal->v4l2_dev, fmt, ##arg)
> +#define cal_dbg(level, cal, fmt, arg...)				\
> +	do {								\
> +		if (debug >= (level))					\
> +			dev_dbg(&(cal)->pdev->dev, fmt, ##arg);		\
> +	} while (0)

The problem here with using dev_dbg is that you loose the ability to enable
or disable debug log at runtime. Which I find highly convenient.

With dev_dbg you have to compile with DEBUG defined or at the very least
DYNAMIC_DEBUG.

Benoit

>  #define cal_info(cal, fmt, arg...)	\
> -		v4l2_info(&cal->v4l2_dev, fmt, ##arg)
> +	dev_info(&(cal)->pdev->dev, fmt, ##arg)
>  #define cal_err(cal, fmt, arg...)	\
> -		v4l2_err(&cal->v4l2_dev, fmt, ##arg)
> +	dev_err(&(cal)->pdev->dev, fmt, ##arg)
>  
>  #define ctx_dbg(level, ctx, fmt, arg...)	\
> -		v4l2_dbg(level, debug, &ctx->v4l2_dev, fmt, ##arg)
> +	cal_dbg(level, (ctx)->cal, "ctx%u: " fmt, (ctx)->csi2_port, ##arg)
>  #define ctx_info(ctx, fmt, arg...)	\
> -		v4l2_info(&ctx->v4l2_dev, fmt, ##arg)
> +	cal_info((ctx)->cal, "ctx%u: " fmt, (ctx)->csi2_port, ##arg)
>  #define ctx_err(ctx, fmt, arg...)	\
> -		v4l2_err(&ctx->v4l2_dev, fmt, ##arg)
> +	cal_err((ctx)->cal, "ctx%u: " fmt, (ctx)->csi2_port, ##arg)
>  
>  #define CAL_NUM_CONTEXT 2
>  
> -- 
> Regards,
> 
> Laurent Pinchart
> 
