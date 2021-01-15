Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D49EC2F82A9
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 18:42:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726019AbhAORlv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 12:41:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbhAORlv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 12:41:51 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 235B2C061757
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 09:41:11 -0800 (PST)
Received: from [IPv6:2003:c7:cf1c:ce00:50c3:215:f597:23ab] (p200300c7cf1cce0050c30215f59723ab.dip0.t-ipconnect.de [IPv6:2003:c7:cf1c:ce00:50c3:215:f597:23ab])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D0D001F461CB;
        Fri, 15 Jan 2021 17:41:08 +0000 (GMT)
Subject: Re: [PATCH v4 3/3] media: rockchip: rkisp1: extend uapi array sizes
To:     Heiko Stuebner <heiko@sntech.de>, helen.koike@collabora.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        Laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Cc:     linux-rockchip@lists.infradead.org, ezequiel@collabora.com,
        christoph.muellner@theobroma-systems.com, tfiga@chromium.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
References: <20210115163829.217131-1-heiko@sntech.de>
 <20210115163829.217131-4-heiko@sntech.de>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <6a1a7cb2-7c37-6cbc-43e7-45e5b0b80e21@collabora.com>
Date:   Fri, 15 Jan 2021 18:41:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210115163829.217131-4-heiko@sntech.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 15.01.21 um 17:38 schrieb Heiko Stuebner:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> Later variants of the rkisp1 block use more entries in some arrays:
> 
> RKISP1_CIF_ISP_AE_MEAN_MAX                 25 -> 81
> RKISP1_CIF_ISP_HIST_BIN_N_MAX              16 -> 32
> RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES       17 -> 34
> RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE 28 -> 81

I see you didn't change the value for that define.
The usage of it is a bit more complicated.
It is used in function rkisp1_hst_config.
Actually the real number of weight values are 25 (5x5) for rk3399,
the last 3 are not used. I think that in order to support both
5x5 and 9x9 the code in rkisp1-params.c should change. I'll
send a patch fixing it.

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
> ---
>   .../platform/rockchip/rkisp1/rkisp1-params.c  |  2 +-
>   .../platform/rockchip/rkisp1/rkisp1-stats.c   | 12 +++-
>   include/uapi/linux/rkisp1-config.h            | 58 ++++++++++++++++---
>   3 files changed, 62 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index 6af4d551ffb5..fa47fe2a02d0 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -391,7 +391,7 @@ static void rkisp1_goc_config(struct rkisp1_params *params,
>   				RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
>   	rkisp1_write(params->rkisp1, arg->mode, RKISP1_CIF_ISP_GAMMA_OUT_MODE);
>   
> -	for (i = 0; i < RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES; i++)
> +	for (i = 0; i < RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V10; i++)
>   		rkisp1_write(params->rkisp1, arg->gamma_y[i],
>   			     RKISP1_CIF_ISP_GAMMA_OUT_Y_0 + i * 4);
>   }
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> index 3ddab8fa8f2d..a26de388ca13 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> @@ -202,8 +202,12 @@ static void rkisp1_stats_get_aec_meas(struct rkisp1_stats *stats,
>   	struct rkisp1_device *rkisp1 = stats->rkisp1;
>   	unsigned int i;
>   
> +	/* the global max can be bigger than the version-specific one */
> +	memset(pbuf->params.ae.exp_mean, 0, RKISP1_CIF_ISP_AE_MEAN_MAX *
> +					    sizeof(*pbuf->params.ae.exp_mean));
> +
>   	pbuf->meas_type |= RKISP1_CIF_ISP_STAT_AUTOEXP;
> -	for (i = 0; i < RKISP1_CIF_ISP_AE_MEAN_MAX; i++)
> +	for (i = 0; i < RKISP1_CIF_ISP_AE_MEAN_MAX_V10; i++)
>   		pbuf->params.ae.exp_mean[i] =
>   			(u8)rkisp1_read(rkisp1,
>   					RKISP1_CIF_ISP_EXP_MEAN_00 + i * 4);
> @@ -232,8 +236,12 @@ static void rkisp1_stats_get_hst_meas(struct rkisp1_stats *stats,
>   	struct rkisp1_device *rkisp1 = stats->rkisp1;
>   	unsigned int i;
>   
> +	/* the global max can be bigger then the version-specific one */
> +	memset(pbuf->params.hist.hist_bins, 0, RKISP1_CIF_ISP_HIST_BIN_N_MAX *
> +					       sizeof(*pbuf->params.hist.hist_bins));
> +
>   	pbuf->meas_type |= RKISP1_CIF_ISP_STAT_HIST;
> -	for (i = 0; i < RKISP1_CIF_ISP_HIST_BIN_N_MAX; i++)
> +	for (i = 0; i < RKISP1_CIF_ISP_HIST_BIN_N_MAX_V10; i++)
>   		pbuf->params.hist.hist_bins[i] =
>   			(u8)rkisp1_read(rkisp1,
>   					RKISP1_CIF_ISP_HIST_BIN_0 + i * 4);
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> index 9fecb6bc457d..e566069275cf 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -49,8 +49,14 @@
>   #define RKISP1_CIF_ISP_CTK_COEFF_MAX            0x100
>   #define RKISP1_CIF_ISP_CTK_OFFSET_MAX           0x800
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
>   #define RKISP1_CIF_ISP_AFM_MAX_WINDOWS          3
>   #define RKISP1_CIF_ISP_DEGAMMA_CURVE_SIZE       17
>   
> @@ -86,7 +92,9 @@
>    * Gamma out
>    */
>   /* Maximum number of color samples supported */
> -#define RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES       17
> +#define RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V10   17
> +#define RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V12   34
> +#define RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES       RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V12
>   
>   /*
>    * Lens shade correction
> @@ -103,7 +111,9 @@
>    * Histogram calculation
>    */
>   /* Last 3 values unused. */
> -#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE 28
> +#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE_V10 28
> +#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE_V12 81
> +#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE     RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE_V12
>   
>   /*
>    * Defect Pixel Cluster Correction
> @@ -526,6 +536,15 @@ enum rkisp1_cif_isp_goc_mode {
>    *
>    * @mode: goc mode (from enum rkisp1_cif_isp_goc_mode)
>    * @gamma_y: gamma out curve y-axis for all color components
> + *
> + * The number of entries of @gamma_y depends on the hardware revision
> + * as is reported by the hw_revision field of the struct media_device_info
> + * that is returned by ioctl MEDIA_IOC_DEVICE_INFO.
> + *
> + * Versions <= V11 have RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V10
> + * entries, versions >= V12 have RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V12
> + * entries. RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES is equal to the maximum
> + * of the two.
>    */
>   struct rkisp1_cif_isp_goc_config {
>   	__u32 mode;
> @@ -540,6 +559,15 @@ struct rkisp1_cif_isp_goc_config {
>    *			  skipped
>    * @meas_window: coordinates of the measure window
>    * @hist_weight: weighting factor for sub-windows
> + *
> + * The number of entries of @hist_weight depends on the hardware revision
> + * as is reported by the hw_revision field of the struct media_device_info
> + * that is returned by ioctl MEDIA_IOC_DEVICE_INFO.
> + *
> + * Versions <= V11 have RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE_V10
> + * entries, versions >= V12 have RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE_V12
> + * entries. RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE is equal to the maximum
> + * of the two.
>    */
>   struct rkisp1_cif_isp_hst_config {
>   	__u32 mode;
> @@ -827,7 +855,15 @@ struct rkisp1_cif_isp_bls_meas_val {
>    * @exp_mean: Mean luminance value of block xx
>    * @bls_val:  BLS measured values
>    *
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
>    */
>   struct rkisp1_cif_isp_ae_stat {
>   	__u8 exp_mean[RKISP1_CIF_ISP_AE_MEAN_MAX];
> @@ -862,8 +898,16 @@ struct rkisp1_cif_isp_af_stat {
>    *
>    * @hist_bins: measured bin counters
>    *
> - * Measurement window divided into 16 sub-windows, set
> - * with ISP_HIST_XXX
> + * Measurement window divided into 16 sub-windows for V10/V10
> + * and 32 sub-windows for V12/V13, set with ISP_HIST_XXX

It is actually not windows but histogram bins. Could you change it to:
"The histogram values divided into 16 bins for V10/V11 and 32 bins
for V12/V13. It is configured within the struct rkisp1_cif_isp_hst_config.

Thanks,
Dafna


> + *
> + * The number of entries of @hist_bins depends on the hardware revision
> + * as is reported by the hw_revision field of the struct media_device_info
> + * that is returned by ioctl MEDIA_IOC_DEVICE_INFO.
> + *
> + * Versions <= V11 have RKISP1_CIF_ISP_HIST_BIN_N_MAX_V10 entries,
> + * versions >= V12 have RKISP1_CIF_ISP_HIST_BIN_N_MAX_V12 entries.
> + * RKISP1_CIF_ISP_HIST_BIN_N_MAX is equal to the maximum of the two.
>    */
>   struct rkisp1_cif_isp_hist_stat {
>   	__u16 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
> 
