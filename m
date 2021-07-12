Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA613C6515
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 22:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231542AbhGLUr4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 16:47:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230058AbhGLUr4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 16:47:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFF18C0613DD;
        Mon, 12 Jul 2021 13:45:07 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 477AFCC;
        Mon, 12 Jul 2021 22:45:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1626122706;
        bh=96POWrX+4MY4d12tL7G5sQBESwBqqSVQYSn0UPOlRZg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KAf4XnVMWT+sJkAC+LWridO3YAf1D1PWi0vioy6a422QRLm3OnwgH+6LcigQcLUD4
         tzuorw+U9Fa+Vy6FxDXlQbMAN+yL/c92YYMVcb0QZpPARdgwdWNcfBQjLrUwlhiNRz
         /9irSdCX/O8JVNglMpbosN6WsVMtl3k+Fn9Gc5AM=
Date:   Mon, 12 Jul 2021 23:44:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@collabora.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, linux-rockchip@lists.infradead.org,
        linux-media@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: Re: [PATCH v6 06/10] media: rockchip: rkisp1: make some isp-stats
 functions variable
Message-ID: <YOypoyWRXghmu6mg@pendragon.ideasonboard.com>
References: <20210618130238.4171196-1-heiko@sntech.de>
 <20210618130238.4171196-7-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210618130238.4171196-7-heiko@sntech.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Heiko,

Thank you for the patch.

On Fri, Jun 18, 2021 at 03:02:34PM +0200, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> The isp block evolved in subsequent socs, so some functions
> will behave differently on newer variants.
> 
> Therefore make it possible to override the needed stats functions.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> ---
>  .../media/platform/rockchip/rkisp1/rkisp1-common.h | 11 +++++++++++
>  .../media/platform/rockchip/rkisp1/rkisp1-stats.c  | 14 +++++++++++---
>  2 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 74ddd8256366..d7f93547fab6 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -236,6 +236,16 @@ struct rkisp1_capture {
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
>  /*
>   * struct rkisp1_stats - ISP Statistics device
>   *
> @@ -248,6 +258,7 @@ struct rkisp1_capture {
>  struct rkisp1_stats {
>  	struct rkisp1_vdev_node vnode;
>  	struct rkisp1_device *rkisp1;
> +	struct rkisp1_stats_ops *ops;

This should be const.

>  
>  	spinlock_t lock; /* locks the buffers list 'stats' */
>  	struct list_head stat;
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> index c1d07a2e8839..f68a5e78e54a 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> @@ -287,6 +287,12 @@ static void rkisp1_stats_get_bls_meas(struct rkisp1_stats *stats,
>  	}
>  }
>  
> +static struct rkisp1_stats_ops rkisp1_stats_ops = {

And this should be const too.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	.get_awb_meas = rkisp1_stats_get_awb_meas,
> +	.get_aec_meas = rkisp1_stats_get_aec_meas,
> +	.get_hst_meas = rkisp1_stats_get_hst_meas,
> +};
> +
>  static void
>  rkisp1_stats_send_measurement(struct rkisp1_stats *stats, u32 isp_ris)
>  {
> @@ -309,18 +315,18 @@ rkisp1_stats_send_measurement(struct rkisp1_stats *stats, u32 isp_ris)
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
> @@ -354,6 +360,8 @@ static void rkisp1_init_stats(struct rkisp1_stats *stats)
>  		V4L2_META_FMT_RK_ISP1_STAT_3A;
>  	stats->vdev_fmt.fmt.meta.buffersize =
>  		sizeof(struct rkisp1_stat_buffer);
> +
> +	stats->ops = &rkisp1_stats_ops;
>  }
>  
>  int rkisp1_stats_register(struct rkisp1_device *rkisp1)

-- 
Regards,

Laurent Pinchart
