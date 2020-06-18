Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 197201FF429
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 16:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbgFROGT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 10:06:19 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58996 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgFROGS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 10:06:18 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05IE6GX5088786;
        Thu, 18 Jun 2020 09:06:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592489176;
        bh=Y7XgFIiunb+i6fMeK5QPhkb7/ixV2o/tXHbFLUUKlPM=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=A4vux3O+SWnQhlhRzvdS5nDqBTAcqTbj7R089fA7BjDnl50iW4+VQfBifI7R9XRHb
         f4BUdq8cbRmPVylblZhWqDqY9o5OXBQ57qecwoL+jTvrrIgfh0hBG1xMLAlONcnk2g
         YVrDMbHNauO2Mndsq6PgalMdeoOJYl6SIgcTRT38=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05IE6GUj050185
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 18 Jun 2020 09:06:16 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 18
 Jun 2020 09:06:16 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 18 Jun 2020 09:06:16 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id 05IE6Abe071709;
        Thu, 18 Jun 2020 09:06:12 -0500
Date:   Thu, 18 Jun 2020 09:06:09 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v1 027/107] media: ti-vpe: cal: Name all cal_camerarx
 pointers consistently
Message-ID: <20200618140607.szxzcr6m6dztlelr@ti.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
 <20200614235944.17716-28-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200614235944.17716-28-laurent.pinchart@ideasonboard.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank you for the patch.

Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote on Mon [2020-Jun-15 02:58:24 +0300]:
> Name all variables htat point to a cal_camerax instance 'phy' instead of
> 'cc'. The name 'cc' refers to Camera Core, but is not commonly used in
> the driver or in datasheets.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 102 ++++++++++++++--------------
>  1 file changed, 51 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 615e9d97e61f..8864a00a22b0 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -312,7 +312,8 @@ static const struct cal_data am654_cal_data = {
>   * the CAMERARX instances. Instances of struct cal_dev are named cal through the
>   * driver.
>   *
> - * The cal_camerarx structure represents one CAMERARX instance.
> + * The cal_camerarx structure represents one CAMERARX instance. Instances of
> + * cal_camerarx are named phy through the driver.
>   *
>   * The cal_ctx structure represents the combination of one CSI-2 context, one
>   * processing context and one DMA context. Instance of struct cal_ctx are named
> @@ -344,7 +345,7 @@ struct cal_dev {
>  	u32			syscon_camerrx_offset;
>  
>  	/* Camera Core Module handle */
> -	struct cal_camerarx	*cc[CAL_NUM_CSI2_PORTS];
> +	struct cal_camerarx	*phy[CAL_NUM_CSI2_PORTS];
>  
>  	struct cal_ctx		*ctx[CAL_NUM_CONTEXT];
>  };
> @@ -361,7 +362,7 @@ struct cal_ctx {
>  	struct v4l2_fwnode_endpoint	endpoint;
>  
>  	struct cal_dev		*cal;
> -	struct cal_camerarx	*cc;
> +	struct cal_camerarx	*phy;
>  
>  	/* v4l2_ioctl mutex */
>  	struct mutex		mutex;
> @@ -468,7 +469,7 @@ static u32 cal_data_get_num_csi2_phy(struct cal_dev *cal)
>  }
>  
>  static int cal_camerarx_regmap_init(struct cal_dev *cal,
> -				    struct cal_camerarx *cc,
> +				    struct cal_camerarx *phy,
>  				    unsigned int idx)
>  {
>  	const struct cal_camerarx_data *phy_data;
> @@ -490,12 +491,12 @@ static int cal_camerarx_regmap_init(struct cal_dev *cal,
>  		 * Here we update the reg offset with the
>  		 * value found in DT
>  		 */
> -		cc->phy.fields[i] = devm_regmap_field_alloc(&cal->pdev->dev,
> -							    cal->syscon_camerrx,
> -							    field);
> -		if (IS_ERR(cc->phy.fields[i])) {
> +		phy->phy.fields[i] = devm_regmap_field_alloc(&cal->pdev->dev,
> +							     cal->syscon_camerrx,
> +							     field);

So we end up with these construct phy->phy.
Is that really more readable?

Benoit
