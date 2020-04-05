Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A650C19ED07
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2020 19:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727336AbgDERhl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Apr 2020 13:37:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58534 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726901AbgDERhk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Apr 2020 13:37:40 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA699312;
        Sun,  5 Apr 2020 19:37:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586108259;
        bh=ZQWKLRFLqaB6y8h40ZOQQg4QRgKiWbBcLWj0Rf8puRo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ffMOekwKKlooi4wmaPsXW9ALE8YHOfiqcH5DeCMQtHdySyjTv8EIRg3cCO8I9Q2Ir
         wz4I5ht0VRJfKaQkD5gwbWi4w3HQsIl/c4T0DRpVbZyRULtiNQJCXW4hjqDlLryYbW
         tM+hdKZzu2661IhJjmtxRRzxLzK/PXh7UVYXr7ac=
Date:   Sun, 5 Apr 2020 20:37:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
Subject: Re: [PATCH 3/3] media: staging: rkisp1: cap: enable RGB capture
 format with YUV media bus
Message-ID: <20200405173729.GJ5846@pendragon.ideasonboard.com>
References: <20200328105606.13660-1-dafna.hirschfeld@collabora.com>
 <20200328105606.13660-4-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200328105606.13660-4-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna

Thank you for the patch.

On Sat, Mar 28, 2020 at 11:56:06AM +0100, Dafna Hirschfeld wrote:
> In selfpath, RGB capture formats are received in the sink pad as YUV
> and are converted to RGB only when writing to memory. So the validation
> function should accept YUV bus formats with RGB capture encoding.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index b7681b806b4c..3abf38362f5a 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -1227,6 +1227,9 @@ static int rkisp1_capture_link_validate(struct media_link *link)
>  		media_entity_to_v4l2_subdev(link->source->entity);
>  	struct rkisp1_capture *cap = video_get_drvdata(vdev);
>  	struct rkisp1_isp *isp = &cap->rkisp1->isp;
> +	enum rkisp1_fmt_pix_type cap_fmt =
> +		rkisp1_pixel_enc_to_fmt_pix(cap->pix.info);
> +	enum rkisp1_fmt_pix_type isp_fmt = isp->src_fmt->fmt_type;
>  	struct v4l2_subdev_format sd_fmt;
>  	int ret;
>  
> @@ -1237,8 +1240,8 @@ static int rkisp1_capture_link_validate(struct media_link *link)
>  		return -EPIPE;
>  	}
>  
> -	if (rkisp1_pixel_enc_to_fmt_pix(cap->pix.info) !=
> -	    isp->src_fmt->fmt_type) {
> +	if ((cap_fmt == RKISP1_FMT_BAYER && isp_fmt == RKISP1_FMT_YUV) ||
> +	    (cap_fmt != RKISP1_FMT_BAYER && isp_fmt == RKISP1_FMT_BAYER)) {

How about listing the supported options instead of the unsupported
options ?

	if (!(isp_fmt == cap_fmt) &&
	    !(isp_fmt == RKISP1_FMT_YUV && cap_fmt == RKISP1_FMT_RGB))

This would also reject RKISP1_FMT_JPEG (which isn't used yet, true), and
generally (in my opinion at least) be more readable.

>  		dev_err(cap->rkisp1->dev,
>  			"format type mismatch in link '%s:%d->%s:%d'\n",
>  			link->source->entity->name, link->source->index,

-- 
Regards,

Laurent Pinchart
