Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A24D81FF436
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 16:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730555AbgFROId (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 10:08:33 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59192 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730360AbgFROIc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 10:08:32 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05IE8TmV089330;
        Thu, 18 Jun 2020 09:08:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592489309;
        bh=cUl1J+1rQIQ8I+UEKMJILV8prK4+px9i+hBjWLy4CZI=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=fHJ8vQyzo0aLapTEO7gE+KtusIQefuOIhKo5gJet8Doivapoeg/VYWAQU1IAAoksn
         /4uQOYOglc4ECDYx60DAyjUXjtx139ssSwhdEkdA5XToOFCR6dV7rc9y+38pgrob1f
         El1u26abe4r72ai8wFWJ1Dq6TZDFfFTkoMLPG75I=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05IE8TPw053327
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 18 Jun 2020 09:08:29 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 18
 Jun 2020 09:08:29 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 18 Jun 2020 09:08:29 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with SMTP id 05IE8LYS096767;
        Thu, 18 Jun 2020 09:08:26 -0500
Date:   Thu, 18 Jun 2020 09:08:20 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v1 028/107] media: ti-vpe: cal: Remove internal phy
 structure from cal_camerarx
Message-ID: <20200618140817.jkuxfv7x7hajno5s@ti.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
 <20200614235944.17716-29-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200614235944.17716-29-laurent.pinchart@ideasonboard.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Never mind my last comment then.... sigh

Benoit

Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote on Mon [2020-Jun-15 02:58:25 +0300]:
> The cal_camerarx structure describes the PHY, there's no need for an
> internal structure named phy. Removed that level of indirection.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 27 ++++++++++++---------------
>  1 file changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 8864a00a22b0..9b905b61148f 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -324,10 +324,7 @@ struct cal_camerarx {
>  	void __iomem		*base;
>  	struct resource		*res;
>  	struct platform_device	*pdev;
> -
> -	struct {
> -		struct regmap_field *fields[F_MAX_FIELDS];
> -	} phy;
> +	struct regmap_field	*fields[F_MAX_FIELDS];
>  };
>  
>  struct cal_dev {
> @@ -491,12 +488,12 @@ static int cal_camerarx_regmap_init(struct cal_dev *cal,
>  		 * Here we update the reg offset with the
>  		 * value found in DT
>  		 */
> -		phy->phy.fields[i] = devm_regmap_field_alloc(&cal->pdev->dev,
> -							     cal->syscon_camerrx,
> -							     field);
> -		if (IS_ERR(phy->phy.fields[i])) {
> +		phy->fields[i] = devm_regmap_field_alloc(&cal->pdev->dev,
> +							 cal->syscon_camerrx,
> +							 field);
> +		if (IS_ERR(phy->fields[i])) {
>  			cal_err(cal, "Unable to allocate regmap fields\n");
> -			return PTR_ERR(phy->phy.fields[i]);
> +			return PTR_ERR(phy->fields[i]);
>  		}
>  	}
>  
> @@ -543,14 +540,14 @@ static void camerarx_phy_enable(struct cal_ctx *ctx)
>  	struct cal_camerarx *phy = ctx->cal->phy[phy_id];
>  	u32 max_lanes;
>  
> -	regmap_field_write(phy->phy.fields[F_CAMMODE], 0);
> +	regmap_field_write(phy->fields[F_CAMMODE], 0);
>  	/* Always enable all lanes at the phy control level */
>  	max_lanes = (1 << cal_data_get_phy_max_lanes(ctx)) - 1;
> -	regmap_field_write(phy->phy.fields[F_LANEENABLE], max_lanes);
> +	regmap_field_write(phy->fields[F_LANEENABLE], max_lanes);
>  	/* F_CSI_MODE is not present on every architecture */
> -	if (phy->phy.fields[F_CSI_MODE])
> -		regmap_field_write(phy->phy.fields[F_CSI_MODE], 1);
> -	regmap_field_write(phy->phy.fields[F_CTRLCLKEN], 1);
> +	if (phy->fields[F_CSI_MODE])
> +		regmap_field_write(phy->fields[F_CSI_MODE], 1);
> +	regmap_field_write(phy->fields[F_CTRLCLKEN], 1);
>  }
>  
>  static void camerarx_phy_disable(struct cal_ctx *ctx)
> @@ -558,7 +555,7 @@ static void camerarx_phy_disable(struct cal_ctx *ctx)
>  	u32 phy_id = ctx->csi2_port;
>  	struct cal_camerarx *phy = ctx->cal->phy[phy_id];
>  
> -	regmap_field_write(phy->phy.fields[F_CTRLCLKEN], 0);
> +	regmap_field_write(phy->fields[F_CTRLCLKEN], 0);
>  }
>  
>  /*
> -- 
> Regards,
> 
> Laurent Pinchart
> 
