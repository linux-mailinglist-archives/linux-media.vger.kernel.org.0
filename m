Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80AC91DA63F
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 02:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgETAPz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 20:15:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgETAPz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 20:15:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 451F9C061A0E
        for <linux-media@vger.kernel.org>; Tue, 19 May 2020 17:15:55 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B085A9CD;
        Wed, 20 May 2020 02:15:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589933753;
        bh=X0vGRkhaIf+BhiALonI906blgtiTU7WszKwlMOGnPHk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VSNUIJy1sDBFU9JRMNg507BenvpsTQ9Utq22zhVOG4ahzMr+7xhD6BAYpkdIcmJwl
         Vy0U6yKDwvoT/AWnbh43eFg1HeVXN+e3xd7tVyGoeyw2bC8fh0cTiruDTGM7TtQOGM
         MjfvUKIqsQJHom799c3fqIcCXR2imP/ZKI4HpuZo=
Date:   Wed, 20 May 2020 03:15:43 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        helen.koike@collabora.com, ezequiel@collabora.com,
        dafna3@gmail.com, kernel@collabora.com, hverkuil@xs4all.nl,
        sakari.ailus@linux.intel.com, mchehab@kernel.org
Subject: Re: [PATCH 1/2] media: staging: rkisp1 stats: set a measure flag
 with '|=' instead of '='
Message-ID: <20200520001543.GM3820@pendragon.ideasonboard.com>
References: <20200509152904.26348-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200509152904.26348-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thank you for the patch.

On Sat, May 09, 2020 at 05:29:03PM +0200, Dafna Hirschfeld wrote:
> The flag RKISP1_CIF_ISP_STAT_AFM_FIN that indicates a type of
> statistics is mistakenly set with '=' instead of '|='
> this might set off previous flags.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/media/rkisp1/rkisp1-stats.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
> index 6dfcbdc3deb8..8351bda0be03 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-stats.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
> @@ -253,7 +253,7 @@ static void rkisp1_stats_get_afc_meas(struct rkisp1_stats *stats,
>  	struct rkisp1_device *rkisp1 = stats->rkisp1;
>  	struct rkisp1_cif_isp_af_stat *af;
>  
> -	pbuf->meas_type = RKISP1_CIF_ISP_STAT_AFM_FIN;
> +	pbuf->meas_type |= RKISP1_CIF_ISP_STAT_AFM_FIN;
>  
>  	af = &pbuf->params.af;
>  	af->window[0].sum = rkisp1_read(rkisp1, RKISP1_CIF_ISP_AFM_SUM_A);

-- 
Regards,

Laurent Pinchart
