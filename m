Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6C320698
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 14:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727238AbfEPMEQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 08:04:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35190 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727136AbfEPMEP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 08:04:15 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5BD5F2FD;
        Thu, 16 May 2019 14:04:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1558008254;
        bh=dR3XDLIGc7rc9HXuFwI7NktLRrJ2TjkEfnK7C204gqw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rV7bLHrMKLyfbNEglvtlY0PoLMIvhCmEYk5tOTEmQYzjOQqaf54Lmb0mZBgpJ6JH2
         4VWLiA2Mah52RiwUtGZvUNNVm42Ez7hyV+mGmBLE2WuCekh+kKfa7kjvukQHEwKBFc
         CvCUPeqDda9zR52VPCu/vf8y6KkEst6sK5neQxXE=
Date:   Thu, 16 May 2019 15:03:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 3/4] media: vsp1: Split out pre-filter calculation
Message-ID: <20190516120350.GJ14820@pendragon.ideasonboard.com>
References: <20190513201355.994-1-kieran.bingham+renesas@ideasonboard.com>
 <20190513201355.994-4-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190513201355.994-4-kieran.bingham+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Mon, May 13, 2019 at 09:13:54PM +0100, Kieran Bingham wrote:
> The 'mp' value is used through several calculations in determining the
> scaling factors of the UDS. This determines the pre-scaling filter
> binning value. Factor this out so that it can be reused in further
> calculations, and also ensure that if the BLADV control is ever changed
> only a single function needs to be modified.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/vsp1/vsp1_uds.c | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/vsp1/vsp1_uds.c b/drivers/media/platform/vsp1/vsp1_uds.c
> index 27012af973b2..effebfc0c862 100644
> --- a/drivers/media/platform/vsp1/vsp1_uds.c
> +++ b/drivers/media/platform/vsp1/vsp1_uds.c
> @@ -46,6 +46,22 @@ void vsp1_uds_set_alpha(struct vsp1_entity *entity, struct vsp1_dl_body *dlb,
>  		       alpha << VI6_UDS_ALPVAL_VAL0_SHIFT);
>  }
>  
> +/*
> + * Determine the pre-filter binning divider.
> + *
> + * The UDS uses a two stage filter scaler process. This determines the
> + * rate at which pixels are reduced for large down-scaling ratios before

I would say "reduced by binning". Apart from this,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> + * being fed into the bicubic filter.
> + *
> + * This calculation assumes that the BLADV bit is unset.
> + */
> +static unsigned int uds_pre_scaling_divisor(int ratio)
> +{
> +	unsigned int mp = ratio / 4096;
> +
> +	return mp < 4 ? 1 : (mp < 8 ? 2 : 4);
> +}
> +
>  /*
>   * uds_output_size - Return the output size for an input size and scaling ratio
>   * @input: input size in pixels
> @@ -55,10 +71,7 @@ static unsigned int uds_output_size(unsigned int input, unsigned int ratio)
>  {
>  	if (ratio > 4096) {
>  		/* Down-scaling */
> -		unsigned int mp;
> -
> -		mp = ratio / 4096;
> -		mp = mp < 4 ? 1 : (mp < 8 ? 2 : 4);
> +		unsigned int mp = uds_pre_scaling_divisor(ratio);
>  
>  		return (input - 1) / mp * mp * 4096 / ratio + 1;
>  	} else {
> @@ -88,10 +101,7 @@ static unsigned int uds_passband_width(unsigned int ratio)
>  {
>  	if (ratio >= 4096) {
>  		/* Down-scaling */
> -		unsigned int mp;
> -
> -		mp = ratio / 4096;
> -		mp = mp < 4 ? 1 : (mp < 8 ? 2 : 4);
> +		unsigned int mp = uds_pre_scaling_divisor(ratio);
>  
>  		return 64 * 4096 * mp / ratio;
>  	} else {

-- 
Regards,

Laurent Pinchart
