Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFBCC363570
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 15:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhDRNPV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 09:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbhDRNPU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 09:15:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6C6AC06174A
        for <linux-media@vger.kernel.org>; Sun, 18 Apr 2021 06:14:52 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 571AE499;
        Sun, 18 Apr 2021 15:14:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618751690;
        bh=NWkTXUJvh6ZBJy9chgfAQ2obFKnraXFHxkeaReIBCjs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VF8NbGwUmR1VzwkeUcdSyDsvzxkBRTaYQB+salUBEU00fqM654ctOdDlqFvXV4iey
         y4LtvD1iv5piEO3zXJl7wfPhAAZwPJ4rU0ARxtJJX2+4MCcX18QNeR9zzqPSe6U8RE
         zEJ7j7n7IKHGZSqo20wtY9508U9gJRetZtEky1XM=
Date:   Sun, 18 Apr 2021 16:14:47 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 23/28] media: ti-vpe: cal: fix typo in a comment
Message-ID: <YHwwx0x0Zl3j8K+R@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-24-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412113457.328012-24-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Apr 12, 2021 at 02:34:52PM +0300, Tomi Valkeinen wrote:
> Fix a typo in a comment in cal_camerarx_sd_set_fmt().
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/ti-vpe/cal-camerarx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
> index 880261d53a1d..25f4692d210e 100644
> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
> @@ -695,7 +695,7 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
>  		return cal_camerarx_sd_get_fmt(sd, cfg, format);
>  
>  	/*
> -	 * Default to the first format is the requested media bus code isn't
> +	 * Default to the first format if the requested media bus code isn't
>  	 * supported.
>  	 */
>  	fmtinfo = cal_format_by_code(format->format.code);

-- 
Regards,

Laurent Pinchart
