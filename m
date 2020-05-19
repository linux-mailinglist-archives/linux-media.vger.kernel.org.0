Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF5C11D9D1A
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 18:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729406AbgESQon (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 12:44:43 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55172 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728689AbgESQon (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 12:44:43 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 25BE32A23FD
Subject: Re: [PATCH 2/2] media: staging: rkisp1: stats: don't set stats flags
 in rkisp1_stats_send_measurement
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     ezequiel@collabora.com, dafna3@gmail.com, kernel@collabora.com,
        hverkuil@xs4all.nl, sakari.ailus@linux.intel.com,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
References: <20200509152904.26348-1-dafna.hirschfeld@collabora.com>
 <20200509152904.26348-2-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <ffacc00e-6bf7-2905-4f2b-7cff139bffde@collabora.com>
Date:   Tue, 19 May 2020 13:44:33 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200509152904.26348-2-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/9/20 12:29 PM, Dafna Hirschfeld wrote:
> The flags that indicate which statistics are read are already
> set in the functions that read them so there is no need to
> set them in the function rkisp1_stats_send_measurement.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

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
> 
