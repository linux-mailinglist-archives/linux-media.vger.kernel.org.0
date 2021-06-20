Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DAF13ADD6C
	for <lists+linux-media@lfdr.de>; Sun, 20 Jun 2021 09:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbhFTHZR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Jun 2021 03:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbhFTHZQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Jun 2021 03:25:16 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C0FEC061574;
        Sun, 20 Jun 2021 00:23:04 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 0F85A1F41AB5
Subject: Re: [PATCH v6 06/10] media: rockchip: rkisp1: make some isp-stats
 functions variable
To:     Heiko Stuebner <heiko@sntech.de>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     ezequiel@collabora.com, helen.koike@collabora.com,
        Laurent.pinchart@ideasonboard.com,
        linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
References: <20210618130238.4171196-1-heiko@sntech.de>
 <20210618130238.4171196-7-heiko@sntech.de>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <a1423726-d970-5310-e2b0-88c139b60ced@collabora.com>
Date:   Sun, 20 Jun 2021 10:22:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210618130238.4171196-7-heiko@sntech.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 18.06.21 16:02, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> The isp block evolved in subsequent socs, so some functions
> will behave differently on newer variants.
> 
> Therefore make it possible to override the needed stats functions.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

> ---
>   .../media/platform/rockchip/rkisp1/rkisp1-common.h | 11 +++++++++++
>   .../media/platform/rockchip/rkisp1/rkisp1-stats.c  | 14 +++++++++++---
>   2 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 74ddd8256366..d7f93547fab6 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -236,6 +236,16 @@ struct rkisp1_capture {
>   	} pix;
>   };
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
>   /*
>    * struct rkisp1_stats - ISP Statistics device
>    *
> @@ -248,6 +258,7 @@ struct rkisp1_capture {
>   struct rkisp1_stats {
>   	struct rkisp1_vdev_node vnode;
>   	struct rkisp1_device *rkisp1;
> +	struct rkisp1_stats_ops *ops;
>   
>   	spinlock_t lock; /* locks the buffers list 'stats' */
>   	struct list_head stat;
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> index c1d07a2e8839..f68a5e78e54a 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> @@ -287,6 +287,12 @@ static void rkisp1_stats_get_bls_meas(struct rkisp1_stats *stats,
>   	}
>   }
>   
> +static struct rkisp1_stats_ops rkisp1_stats_ops = {
> +	.get_awb_meas = rkisp1_stats_get_awb_meas,
> +	.get_aec_meas = rkisp1_stats_get_aec_meas,
> +	.get_hst_meas = rkisp1_stats_get_hst_meas,
> +};
> +
>   static void
>   rkisp1_stats_send_measurement(struct rkisp1_stats *stats, u32 isp_ris)
>   {
> @@ -309,18 +315,18 @@ rkisp1_stats_send_measurement(struct rkisp1_stats *stats, u32 isp_ris)
>   		(struct rkisp1_stat_buffer *)(cur_buf->vaddr);
>   
>   	if (isp_ris & RKISP1_CIF_ISP_AWB_DONE)
> -		rkisp1_stats_get_awb_meas(stats, cur_stat_buf);
> +		stats->ops->get_awb_meas(stats, cur_stat_buf);
>   
>   	if (isp_ris & RKISP1_CIF_ISP_AFM_FIN)
>   		rkisp1_stats_get_afc_meas(stats, cur_stat_buf);
>   
>   	if (isp_ris & RKISP1_CIF_ISP_EXP_END) {
> -		rkisp1_stats_get_aec_meas(stats, cur_stat_buf);
> +		stats->ops->get_aec_meas(stats, cur_stat_buf);
>   		rkisp1_stats_get_bls_meas(stats, cur_stat_buf);
>   	}
>   
>   	if (isp_ris & RKISP1_CIF_ISP_HIST_MEASURE_RDY)
> -		rkisp1_stats_get_hst_meas(stats, cur_stat_buf);
> +		stats->ops->get_hst_meas(stats, cur_stat_buf);
>   
>   	vb2_set_plane_payload(&cur_buf->vb.vb2_buf, 0,
>   			      sizeof(struct rkisp1_stat_buffer));
> @@ -354,6 +360,8 @@ static void rkisp1_init_stats(struct rkisp1_stats *stats)
>   		V4L2_META_FMT_RK_ISP1_STAT_3A;
>   	stats->vdev_fmt.fmt.meta.buffersize =
>   		sizeof(struct rkisp1_stat_buffer);
> +
> +	stats->ops = &rkisp1_stats_ops;
>   }
>   
>   int rkisp1_stats_register(struct rkisp1_device *rkisp1)
> 
