Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBC062FA855
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 19:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407433AbhARSHF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 13:07:05 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46636 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406664AbhARSGo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 13:06:44 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id DC4431F449C2
Subject: Re: [PATCH RFC 09/11] media: rockchip: rkisp1: make some isp-stats
 functions variable
To:     Heiko Stuebner <heiko@sntech.de>, ezequiel@collabora.com,
        dafna.hirschfeld@collabora.com, Laurent.pinchart@ideasonboard.com
Cc:     linux-rockchip@lists.infradead.org,
        christoph.muellner@theobroma-systems.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
References: <20210108193311.3423236-1-heiko@sntech.de>
 <20210108193311.3423236-10-heiko@sntech.de>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <e39838d8-6eec-1845-0f4b-2baf945577a9@collabora.com>
Date:   Mon, 18 Jan 2021 15:05:52 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210108193311.3423236-10-heiko@sntech.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/8/21 4:33 PM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> The isp block evolved in subsequent socs, so some functions
> will behave differently on newer variants.
> 
> Therefore make it possible to override the needed stats functions.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>  .../platform/rockchip/rkisp1/rkisp1-common.h  | 17 +++++++++++++
>  .../platform/rockchip/rkisp1/rkisp1-stats.c   | 24 +++++++++++++++----
>  2 files changed, 36 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 4034a05ef9d2..be0ae02165c9 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -240,6 +240,21 @@ struct rkisp1_capture {
>  	} pix;
>  };
>  
> +struct rkisp1_stats;
> +struct rkisp1_stats_ops {
> +	void (*get_awb_meas)(struct rkisp1_stats *stats,
> +			     struct rkisp1_stat_buffer *pbuf);
> +	void (*get_aec_meas)(struct rkisp1_stats *stats,
> +			     struct rkisp1_stat_buffer *pbuf);
> +	void (*get_hst_meas)(struct rkisp1_stats *stats,
> +			     struct rkisp1_stat_buffer *pbuf);
> +};
> +
> +struct rkisp1_stats_config {
> +	const int ae_mean_max;
> +	const int hist_bin_n_max;
> +};
> +
>  /*
>   * struct rkisp1_stats - ISP Statistics device
>   *
> @@ -252,6 +267,8 @@ struct rkisp1_capture {
>  struct rkisp1_stats {
>  	struct rkisp1_vdev_node vnode;
>  	struct rkisp1_device *rkisp1;
> +	struct rkisp1_stats_ops *ops;
> +	struct rkisp1_stats_config *config;
>  
>  	spinlock_t lock; /* locks the buffers list 'stats' */
>  	struct list_head stat;
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> index 3ddab8fa8f2d..7136292039f6 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> @@ -203,7 +203,7 @@ static void rkisp1_stats_get_aec_meas(struct rkisp1_stats *stats,
>  	unsigned int i;
>  
>  	pbuf->meas_type |= RKISP1_CIF_ISP_STAT_AUTOEXP;
> -	for (i = 0; i < RKISP1_CIF_ISP_AE_MEAN_MAX; i++)
> +	for (i = 0; i < stats->config->ae_mean_max; i++)
>  		pbuf->params.ae.exp_mean[i] =
>  			(u8)rkisp1_read(rkisp1,
>  					RKISP1_CIF_ISP_EXP_MEAN_00 + i * 4);
> @@ -233,7 +233,7 @@ static void rkisp1_stats_get_hst_meas(struct rkisp1_stats *stats,
>  	unsigned int i;
>  
>  	pbuf->meas_type |= RKISP1_CIF_ISP_STAT_HIST;
> -	for (i = 0; i < RKISP1_CIF_ISP_HIST_BIN_N_MAX; i++)
> +	for (i = 0; i < stats->config->hist_bin_n_max; i++)
>  		pbuf->params.hist.hist_bins[i] =
>  			(u8)rkisp1_read(rkisp1,
>  					RKISP1_CIF_ISP_HIST_BIN_0 + i * 4);
> @@ -286,6 +286,17 @@ static void rkisp1_stats_get_bls_meas(struct rkisp1_stats *stats,
>  	}
>  }
>  
> +static struct rkisp1_stats_ops rkisp1_stats_ops = {
> +	.get_awb_meas = rkisp1_stats_get_awb_meas,
> +	.get_aec_meas = rkisp1_stats_get_aec_meas,
> +	.get_hst_meas = rkisp1_stats_get_hst_meas,
> +};
> +
> +static struct rkisp1_stats_config rkisp1_stats_config = {
> +	.ae_mean_max = 25,
> +	.hist_bin_n_max = 16,
> +};
> +
>  static void
>  rkisp1_stats_send_measurement(struct rkisp1_stats *stats, u32 isp_ris)
>  {
> @@ -308,18 +319,18 @@ rkisp1_stats_send_measurement(struct rkisp1_stats *stats, u32 isp_ris)
>  		(struct rkisp1_stat_buffer *)(cur_buf->vaddr);
>  
>  	if (isp_ris & RKISP1_CIF_ISP_AWB_DONE)
> -		rkisp1_stats_get_awb_meas(stats, cur_stat_buf);
> +		stats->ops->get_awb_meas(stats, cur_stat_buf);
>  
>  	if (isp_ris & RKISP1_CIF_ISP_AFM_FIN)
>  		rkisp1_stats_get_afc_meas(stats, cur_stat_buf);
>  
>  	if (isp_ris & RKISP1_CIF_ISP_EXP_END) {
> -		rkisp1_stats_get_aec_meas(stats, cur_stat_buf);
> +		stats->ops->get_aec_meas(stats, cur_stat_buf);
>  		rkisp1_stats_get_bls_meas(stats, cur_stat_buf);
>  	}
>  
>  	if (isp_ris & RKISP1_CIF_ISP_HIST_MEASURE_RDY)
> -		rkisp1_stats_get_hst_meas(stats, cur_stat_buf);
> +		stats->ops->get_hst_meas(stats, cur_stat_buf);
>  
>  	vb2_set_plane_payload(&cur_buf->vb.vb2_buf, 0,
>  			      sizeof(struct rkisp1_stat_buffer));
> @@ -353,6 +364,9 @@ static void rkisp1_init_stats(struct rkisp1_stats *stats)
>  		V4L2_META_FMT_RK_ISP1_STAT_3A;
>  	stats->vdev_fmt.fmt.meta.buffersize =
>  		sizeof(struct rkisp1_stat_buffer);
> +
> +	stats->ops = &rkisp1_stats_ops;
> +	stats->config = &rkisp1_stats_config;
>  }
>  
>  int rkisp1_stats_register(struct rkisp1_device *rkisp1)
> 
