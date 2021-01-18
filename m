Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 614742FA850
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 19:07:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728159AbhARSGQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 13:06:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407478AbhARSE7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 13:04:59 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE8A6C0613D6
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 10:04:18 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 411381F44838
Subject: Re: [PATCH v6 4/4] media: rockchip: rkisp1: extend uapi array sizes
To:     Heiko Stuebner <heiko@sntech.de>, dafna.hirschfeld@collabora.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        Laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Cc:     linux-rockchip@lists.infradead.org, ezequiel@collabora.com,
        christoph.muellner@theobroma-systems.com, tfiga@chromium.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
References: <20210118110448.275389-1-heiko@sntech.de>
 <20210118110448.275389-5-heiko@sntech.de>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <70ac1cbd-6429-cdd9-3ecb-b5501d6c4031@collabora.com>
Date:   Mon, 18 Jan 2021 15:04:11 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210118110448.275389-5-heiko@sntech.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/18/21 8:04 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> Later variants of the rkisp1 block use more entries in some arrays:
> 
> RKISP1_CIF_ISP_AE_MEAN_MAX                 25 -> 81
> RKISP1_CIF_ISP_HIST_BIN_N_MAX              16 -> 32
> RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES       17 -> 34
> RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE 25 -> 81
> 
> and we can still extend the uapi during the 5.11-rc cycle, so do that
> now to be on the safe side.
> 
> V10 and V11 only need the smaller sizes, while V12 and V13 needed
> the larger sizes.
> 
> When adding the bigger sizes make sure, values filled from hardware
> values and transmitted to userspace don't leak kernel data by zeroing
> them beforehand.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>  .../platform/rockchip/rkisp1/rkisp1-params.c  |  2 +-
>  .../platform/rockchip/rkisp1/rkisp1-stats.c   | 12 +++-
>  include/uapi/linux/rkisp1-config.h            | 58 ++++++++++++++++---
>  3 files changed, 62 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index 6af4d551ffb5..fa47fe2a02d0 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -391,7 +391,7 @@ static void rkisp1_goc_config(struct rkisp1_params *params,
>  				RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
>  	rkisp1_write(params->rkisp1, arg->mode, RKISP1_CIF_ISP_GAMMA_OUT_MODE);
>  
> -	for (i = 0; i < RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES; i++)
> +	for (i = 0; i < RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V10; i++)
>  		rkisp1_write(params->rkisp1, arg->gamma_y[i],
>  			     RKISP1_CIF_ISP_GAMMA_OUT_Y_0 + i * 4);
>  }
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> index 3ddab8fa8f2d..a26de388ca13 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> @@ -202,8 +202,12 @@ static void rkisp1_stats_get_aec_meas(struct rkisp1_stats *stats,
>  	struct rkisp1_device *rkisp1 = stats->rkisp1;
>  	unsigned int i;
>  
> +	/* the global max can be bigger than the version-specific one */
> +	memset(pbuf->params.ae.exp_mean, 0, RKISP1_CIF_ISP_AE_MEAN_MAX *
> +					    sizeof(*pbuf->params.ae.exp_mean));
> +
>  	pbuf->meas_type |= RKISP1_CIF_ISP_STAT_AUTOEXP;
> -	for (i = 0; i < RKISP1_CIF_ISP_AE_MEAN_MAX; i++)
> +	for (i = 0; i < RKISP1_CIF_ISP_AE_MEAN_MAX_V10; i++)
>  		pbuf->params.ae.exp_mean[i] =
>  			(u8)rkisp1_read(rkisp1,
>  					RKISP1_CIF_ISP_EXP_MEAN_00 + i * 4);
> @@ -232,8 +236,12 @@ static void rkisp1_stats_get_hst_meas(struct rkisp1_stats *stats,
>  	struct rkisp1_device *rkisp1 = stats->rkisp1;
>  	unsigned int i;
>  
> +	/* the global max can be bigger then the version-specific one */
> +	memset(pbuf->params.hist.hist_bins, 0, RKISP1_CIF_ISP_HIST_BIN_N_MAX *
> +					       sizeof(*pbuf->params.hist.hist_bins));
> +
>  	pbuf->meas_type |= RKISP1_CIF_ISP_STAT_HIST;
> -	for (i = 0; i < RKISP1_CIF_ISP_HIST_BIN_N_MAX; i++)
> +	for (i = 0; i < RKISP1_CIF_ISP_HIST_BIN_N_MAX_V10; i++)
>  		pbuf->params.hist.hist_bins[i] =
>  			(u8)rkisp1_read(rkisp1,
>  					RKISP1_CIF_ISP_HIST_BIN_0 + i * 4);
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> index 97d7829d8831..57ca3eea985f 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -49,8 +49,14 @@
>  #define RKISP1_CIF_ISP_CTK_COEFF_MAX            0x100
>  #define RKISP1_CIF_ISP_CTK_OFFSET_MAX           0x800
>  
> -#define RKISP1_CIF_ISP_AE_MEAN_MAX              25
> -#define RKISP1_CIF_ISP_HIST_BIN_N_MAX           16
> +#define RKISP1_CIF_ISP_AE_MEAN_MAX_V10		25
> +#define RKISP1_CIF_ISP_AE_MEAN_MAX_V12		81
> +#define RKISP1_CIF_ISP_AE_MEAN_MAX		RKISP1_CIF_ISP_AE_MEAN_MAX_V12
> +
> +#define RKISP1_CIF_ISP_HIST_BIN_N_MAX_V10	16
> +#define RKISP1_CIF_ISP_HIST_BIN_N_MAX_V12	32
> +#define RKISP1_CIF_ISP_HIST_BIN_N_MAX		RKISP1_CIF_ISP_HIST_BIN_N_MAX_V12
> +
>  #define RKISP1_CIF_ISP_AFM_MAX_WINDOWS          3
>  #define RKISP1_CIF_ISP_DEGAMMA_CURVE_SIZE       17
>  
> @@ -86,7 +92,9 @@
>   * Gamma out
>   */
>  /* Maximum number of color samples supported */
> -#define RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES       17
> +#define RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V10   17
> +#define RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V12   34
> +#define RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES       RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V12
>  
>  /*
>   * Lens shade correction
> @@ -102,7 +110,9 @@
>  /*
>   * Histogram calculation
>   */
> -#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE 25
> +#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE_V10 25
> +#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE_V12 81
> +#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE     RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE_V12
>  
>  /*
>   * Defect Pixel Cluster Correction
> @@ -525,6 +535,15 @@ enum rkisp1_cif_isp_goc_mode {
>   *
>   * @mode: goc mode (from enum rkisp1_cif_isp_goc_mode)
>   * @gamma_y: gamma out curve y-axis for all color components
> + *
> + * The number of entries of @gamma_y depends on the hardware revision
> + * as is reported by the hw_revision field of the struct media_device_info
> + * that is returned by ioctl MEDIA_IOC_DEVICE_INFO.
> + *
> + * Versions <= V11 have RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V10
> + * entries, versions >= V12 have RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V12
> + * entries. RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES is equal to the maximum
> + * of the two.
>   */
>  struct rkisp1_cif_isp_goc_config {
>  	__u32 mode;
> @@ -539,6 +558,15 @@ struct rkisp1_cif_isp_goc_config {
>   *			  skipped
>   * @meas_window: coordinates of the measure window
>   * @hist_weight: weighting factor for sub-windows
> + *
> + * The number of entries of @hist_weight depends on the hardware revision
> + * as is reported by the hw_revision field of the struct media_device_info
> + * that is returned by ioctl MEDIA_IOC_DEVICE_INFO.
> + *
> + * Versions <= V11 have RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE_V10
> + * entries, versions >= V12 have RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE_V12
> + * entries. RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE is equal to the maximum
> + * of the two.
>   */
>  struct rkisp1_cif_isp_hst_config {
>  	__u32 mode;
> @@ -826,7 +854,15 @@ struct rkisp1_cif_isp_bls_meas_val {
>   * @exp_mean: Mean luminance value of block xx
>   * @bls_val:  BLS measured values
>   *
> - * Image is divided into 5x5 blocks.
> + * The number of entries of @exp_mean depends on the hardware revision
> + * as is reported by the hw_revision field of the struct media_device_info
> + * that is returned by ioctl MEDIA_IOC_DEVICE_INFO.
> + *
> + * Versions <= V11 have RKISP1_CIF_ISP_AE_MEAN_MAX_V10 entries,
> + * versions >= V12 have RKISP1_CIF_ISP_AE_MEAN_MAX_V12 entries.
> + * RKISP1_CIF_ISP_AE_MEAN_MAX is equal to the maximum of the two.
> + *
> + * Image is divided into 5x5 blocks on V10 and 9x9 blocks on V12.
>   */
>  struct rkisp1_cif_isp_ae_stat {
>  	__u8 exp_mean[RKISP1_CIF_ISP_AE_MEAN_MAX];
> @@ -861,8 +897,16 @@ struct rkisp1_cif_isp_af_stat {
>   *
>   * @hist_bins: measured bin counters
>   *
> - * Measurement window divided into 16 sub-windows, set
> - * with ISP_HIST_XXX
> + * The histogram values divided into 16 bins for V10/V11 and 32 bins
> + * for V12/V13. It is configured within the struct rkisp1_cif_isp_hst_config.
> + *
> + * The number of entries of @hist_bins depends on the hardware revision
> + * as is reported by the hw_revision field of the struct media_device_info
> + * that is returned by ioctl MEDIA_IOC_DEVICE_INFO.
> + *
> + * Versions <= V11 have RKISP1_CIF_ISP_HIST_BIN_N_MAX_V10 entries,
> + * versions >= V12 have RKISP1_CIF_ISP_HIST_BIN_N_MAX_V12 entries.
> + * RKISP1_CIF_ISP_HIST_BIN_N_MAX is equal to the maximum of the two.
>   */
>  struct rkisp1_cif_isp_hist_stat {
>  	__u16 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
> 
