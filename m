Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B35B1DA641
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 02:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbgETAQN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 20:16:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgETAQN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 20:16:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36C7AC061A0E
        for <linux-media@vger.kernel.org>; Tue, 19 May 2020 17:16:13 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB7BE9CD;
        Wed, 20 May 2020 02:16:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589933771;
        bh=kNTzsKsJx+6g7jMtDq1n/OJWUGzETmvJHDPbq0LJg70=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M9YQyzvLGLU/iQxCAJ+y68yX+I19svaXWho1aNo8PkT+Bs+TJGvKx2wjLB4pCcOeN
         i+2e8GYNIebs/NVqO4MmDFZ5mWKKfRj0Zr3alAfOeym0flF2RKjlY0zRAl4xNsPVhR
         3I92zoIETt9I4y2JPnVf0XlUcMhxfCS2W+WVJPDI=
Date:   Wed, 20 May 2020 03:16:01 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        helen.koike@collabora.com, ezequiel@collabora.com,
        dafna3@gmail.com, kernel@collabora.com, hverkuil@xs4all.nl,
        sakari.ailus@linux.intel.com, mchehab@kernel.org
Subject: Re: [PATCH 2/2] media: staging: rkisp1: stats: don't set stats flags
 in rkisp1_stats_send_measurement
Message-ID: <20200520001601.GN3820@pendragon.ideasonboard.com>
References: <20200509152904.26348-1-dafna.hirschfeld@collabora.com>
 <20200509152904.26348-2-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200509152904.26348-2-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thank you for the patch.

On Sat, May 09, 2020 at 05:29:04PM +0200, Dafna Hirschfeld wrote:
> The flags that indicate which statistics are read are already
> set in the functions that read them so there is no need to
> set them in the function rkisp1_stats_send_measurement.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/media/rkisp1/rkisp1-stats.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
> index 8351bda0be03..0616793ae395 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-stats.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
> @@ -356,26 +356,19 @@ rkisp1_stats_send_measurement(struct rkisp1_stats *stats,
>  	cur_stat_buf =
>  		(struct rkisp1_stat_buffer *)(cur_buf->vaddr[0]);
>  
> -	if (meas_work->isp_ris & RKISP1_CIF_ISP_AWB_DONE) {
> +	if (meas_work->isp_ris & RKISP1_CIF_ISP_AWB_DONE)
>  		rkisp1_stats_get_awb_meas(stats, cur_stat_buf);
> -		cur_stat_buf->meas_type |= RKISP1_CIF_ISP_STAT_AWB;
> -	}
>  
> -	if (meas_work->isp_ris & RKISP1_CIF_ISP_AFM_FIN) {
> +	if (meas_work->isp_ris & RKISP1_CIF_ISP_AFM_FIN)
>  		rkisp1_stats_get_afc_meas(stats, cur_stat_buf);
> -		cur_stat_buf->meas_type |= RKISP1_CIF_ISP_STAT_AFM_FIN;
> -	}
>  
>  	if (meas_work->isp_ris & RKISP1_CIF_ISP_EXP_END) {
>  		rkisp1_stats_get_aec_meas(stats, cur_stat_buf);
>  		rkisp1_stats_get_bls_meas(stats, cur_stat_buf);
> -		cur_stat_buf->meas_type |= RKISP1_CIF_ISP_STAT_AUTOEXP;
>  	}
>  
> -	if (meas_work->isp_ris & RKISP1_CIF_ISP_HIST_MEASURE_RDY) {
> +	if (meas_work->isp_ris & RKISP1_CIF_ISP_HIST_MEASURE_RDY)
>  		rkisp1_stats_get_hst_meas(stats, cur_stat_buf);
> -		cur_stat_buf->meas_type |= RKISP1_CIF_ISP_STAT_HIST;
> -	}
>  
>  	vb2_set_plane_payload(&cur_buf->vb.vb2_buf, 0,
>  			      sizeof(struct rkisp1_stat_buffer));

-- 
Regards,

Laurent Pinchart
