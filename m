Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3A8839BA45
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 15:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbhFDNyx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 09:54:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35204 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbhFDNyw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 09:54:52 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 610502A3;
        Fri,  4 Jun 2021 15:53:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622814785;
        bh=DF7LUFuzEtfG+KUIk8LtdqAAm8kg6HRELz/cWRBm3ls=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k9xhKUpCErdOy93CP6xx1YxXWvo/+WMKEwRZyWy0hNIHGvFF+V5YzD8c42B5uvV3S
         diWhhpofDHHEw3Dp/isjl4WxqnVNmqLfGoeqVaiVsGQaDjG9noHS7hzE/wyIx+CVYL
         RPatrGG9097rx1r0UId3if9OsB0BiHTGi4rX7fBg=
Date:   Fri, 4 Jun 2021 16:52:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Pratyush Yadav <p.yadav@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 29/38] media: ti-vpe: cal: cleanup phy iteration in
 cal_remove
Message-ID: <YLowNIDAkEsxUuNm@pendragon.ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
 <20210524110909.672432-30-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210524110909.672432-30-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, May 24, 2021 at 02:09:00PM +0300, Tomi Valkeinen wrote:
> Most of the driver has moved from ARRAY_SIZE(cal->phy) to
> cal->data->num_csi2_phy, but we have one place left in cal_remove. Also,
> checking for cal->phy[i] != NULL is not needed as we always have all the
> phys instantiated.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/ti-vpe/cal.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index d43972c392fc..bb99d0ce796f 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -1173,10 +1173,8 @@ static int cal_remove(struct platform_device *pdev)
>  
>  	cal_media_unregister(cal);
>  
> -	for (i = 0; i < ARRAY_SIZE(cal->phy); i++) {
> -		if (cal->phy[i])
> -			cal_camerarx_disable(cal->phy[i]);
> -	}
> +	for (i = 0; i < cal->data->num_csi2_phy; i++)
> +		cal_camerarx_disable(cal->phy[i]);
>  
>  	cal_media_cleanup(cal);
>  

-- 
Regards,

Laurent Pinchart
