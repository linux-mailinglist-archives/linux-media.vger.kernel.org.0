Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5F01281BFA
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 21:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388434AbgJBT1W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 15:27:22 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42364 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388367AbgJBT1V (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 15:27:21 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE3182A2;
        Fri,  2 Oct 2020 21:27:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1601666840;
        bh=cmo0Ui1cTTW5EkjJwBRgGy1Vl56HrIU+LdP8JmauseA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BjBgaPnPJyIaTs+wz7WtnLDui0MLxxrZM6ZF8UO25bOFwPMR5nDWibSs/6mMVdDxd
         heYHOGcI43BpV6eEFYcd9B3xWOyOdUMx5HnogX1qIDFjPl9BXyh3pPo/rXVgdatauO
         W0zgOie5NllnmKhbLVYDBoD60gkRzPqT8AvHYKpg=
Date:   Fri, 2 Oct 2020 22:26:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: Re: [PATCH 6/6] media: staging: rkisp1: cap: add warning when link
 validation fails
Message-ID: <20201002192642.GG3933@pendragon.ideasonboard.com>
References: <20201002184222.7094-1-dafna.hirschfeld@collabora.com>
 <20201002184222.7094-7-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201002184222.7094-7-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thank you for the patch.

On Fri, Oct 02, 2020 at 08:42:22PM +0200, Dafna Hirschfeld wrote:
> The link validation between the capture and resizer might
> fail because of various reasons. Add an informative warning
> to make it easier to debug.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index 9b4a12e13f13..75321280ebf0 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -1269,8 +1269,16 @@ static int rkisp1_capture_link_validate(struct media_link *link)
>  
>  	if (sd_fmt.format.height != cap->pix.fmt.height ||
>  	    sd_fmt.format.width != cap->pix.fmt.width ||
> -	    sd_fmt.format.code != fmt->mbus)
> +	    sd_fmt.format.code != fmt->mbus) {
> +		dev_warn(cap->rkisp1->dev,

I'd make this dev_dbg().

> +			 "%s: failed for '%s' sd:cap: height %u:%u, width %u:%u mbus: 0x%x:0x%x\n",
> +			 __func__,
> +			 cap->vnode.vdev.name,
> +			 sd_fmt.format.height, cap->pix.fmt.height,
> +			 sd_fmt.format.width, cap->pix.fmt.width,
> +			 sd_fmt.format.code, fmt->mbus);
>  		return -EPIPE;
> +	}
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart
