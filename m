Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F49A19ED4C
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2020 20:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbgDESKz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Apr 2020 14:10:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60874 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgDESKz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Apr 2020 14:10:55 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F9E5312;
        Sun,  5 Apr 2020 20:10:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586110253;
        bh=+lR0IcKKhe1sfU9YYKeeibLNhH3C1DjLrhJ7I6zdJNs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MYIf/GTIX4ORyvFtC6ykKBYXZw6V0kP8KdGI8FVVTj6WcNsMEjMwThuIImwgNLSmY
         6OGpO9o7SU9neqD0Z/Sh5PbI8HoRGI7OT45hrrw+QgbJgUd9E9qlV9COJmQK4IQVm+
         sl010dYYoJUrc03YSnnOl7TlBweLvrVh5j72VrBU=
Date:   Sun, 5 Apr 2020 21:10:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 2/5] media: staging: rkisp1: cap: fix value written to
 uv swap register in selfpath
Message-ID: <20200405181044.GO5846@pendragon.ideasonboard.com>
References: <20200402190419.15155-1-dafna.hirschfeld@collabora.com>
 <20200402190419.15155-3-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200402190419.15155-3-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thank you for the patch.

On Thu, Apr 02, 2020 at 09:04:16PM +0200, Dafna Hirschfeld wrote:
> The value RKISP1_CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP should be
> set to the register instead of masking with ~BIT(1)
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index 5700d7be2819..84a3cf565106 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -469,8 +469,8 @@ static void rkisp1_sp_config(struct rkisp1_capture *cap)
>  	if (cap->pix.cfg->uv_swap) {
>  		u32 reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
>  
> -		rkisp1_write(rkisp1, reg & ~BIT(1),
> -			     RKISP1_CIF_MI_XTD_FORMAT_CTRL);
> +		reg = reg | RKISP1_CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP;
> +		rkisp1_write(rkisp1, reg, RKISP1_CIF_MI_XTD_FORMAT_CTRL);

This indeed simplifies the code, but I think the logic is wrong in the
first place. Shouldn't this be

	reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
	if (cap->pix.cfg->uv_swap)
		reg |= RKISP1_CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP;
	else
		reg &= ~RKISP1_CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP;
	rkisp1_write(rkisp1, reg, RKISP1_CIF_MI_XTD_FORMAT_CTRL);

? Same for patch 1/5.

>  	}
>  
>  	rkisp1_mi_config_ctrl(cap);

-- 
Regards,

Laurent Pinchart
