Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA8C2FE75A
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 11:19:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729061AbhAUKRj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 05:17:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728418AbhAUKRd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 05:17:33 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CE0EC061757
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 02:16:52 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id g12so1801092ejf.8
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 02:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kiMc1Def754o0HJ0ZFDBF540QKtDSYYu4v1egOHDjQ0=;
        b=dB3qi/R1CcA+6yvSqUMwFGwC2HEfctiocOsp9tOs6uz7OAwInLrKHMvCHvwkKQspxA
         06gQd/X2EZXsVwn8xiB9KeHIJillXgUeP6zrRs7LRHqFyQTGrINo3F9yScLPFCPz57yu
         ME01PRLc0JEoFxYK8s3vX3o97jbCYhVCGE1qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kiMc1Def754o0HJ0ZFDBF540QKtDSYYu4v1egOHDjQ0=;
        b=k9srY21/qNSF5g2BM0YmgIjx5WW0pmKb8v2GodL6xPKG4UORa4087/0IkFXHK1TyD9
         AlgAwIwvAQH6OGTP0WAppxK7b77kWb0BVdHMlei6Q7Qoqr7V3XfWEyYlmEz4pClPBEjJ
         HLA1ARabJcdq9ywaY2B0yzVcmw1TAyf3HtsOh7z3vQKMUVG6sEAmxJcLg7m2GdoqqCXY
         DuQ9DT6XcqinpeE8Y1aN54SdAxkvvuz6yfgdOzdBggSF1v3W2Akx9bAew6kkQevVqfTu
         vPiAOCXRyE3mjOOedhR54+vVY4vtSqlG+uw+/xfhGvbBJuVt1Mu/lKGgB7KfwWCtOPt5
         6+ow==
X-Gm-Message-State: AOAM532ygDEzIAvU2R3MM/rS2Ux/iIeMh+/Wl6UJWSoUAjaU2j6nxKfU
        3VSm+5SQlwdUMqwVARCqySVRgUtys5mYTw==
X-Google-Smtp-Source: ABdhPJwoUk6uCHcznJhCeL3MeaMtHiZeG7n1EMWN7EwKpXnugJphlTsFd+3Vx2JmUt1zcucHpv0s+A==
X-Received: by 2002:a17:907:a06f:: with SMTP id ia15mr8876455ejc.328.1611224210859;
        Thu, 21 Jan 2021 02:16:50 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id cw21sm2422520edb.85.2021.01.21.02.16.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jan 2021 02:16:49 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id s11so1784720edd.5
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 02:16:48 -0800 (PST)
X-Received: by 2002:a05:6402:20e:: with SMTP id t14mr10658872edv.178.1611224208372;
 Thu, 21 Jan 2021 02:16:48 -0800 (PST)
MIME-Version: 1.0
References: <20210120164446.1220-1-dafna.hirschfeld@collabora.com> <20210120164446.1220-6-dafna.hirschfeld@collabora.com>
In-Reply-To: <20210120164446.1220-6-dafna.hirschfeld@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 21 Jan 2021 19:16:36 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CgXFFbjN6Ga4ehqFixhmFnV2MeuHi6tOmSU2UvjsSVCw@mail.gmail.com>
Message-ID: <CAAFQd5CgXFFbjN6Ga4ehqFixhmFnV2MeuHi6tOmSU2UvjsSVCw@mail.gmail.com>
Subject: Re: [PATCH v7 5/5] media: rockchip: rkisp1: extend uapi array sizes
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Collabora Kernel ML <kernel@collabora.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Thu, Jan 21, 2021 at 1:45 AM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
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

Hmm, wouldn't the buffer be already zeroed at allocation time?

I can see that vb2-vmalloc would call vmalloc_user() which does zero
the allocated memory:
https://elixir.bootlin.com/linux/v5.10.9/source/mm/vmalloc.c#L2661

Best regards,
Tomasz

>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> Acked-by: Helen Koike <helen.koike@collabora.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-params.c  |  2 +-
>  .../platform/rockchip/rkisp1/rkisp1-stats.c   | 12 +++-
>  include/uapi/linux/rkisp1-config.h            | 66 ++++++++++++++++---
>  3 files changed, 67 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index 021939466b24..aa5f45749543 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -391,7 +391,7 @@ static void rkisp1_goc_config(struct rkisp1_params *params,
>                                 RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
>         rkisp1_write(params->rkisp1, arg->mode, RKISP1_CIF_ISP_GAMMA_OUT_MODE);
>
> -       for (i = 0; i < RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES; i++)
> +       for (i = 0; i < RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V10; i++)
>                 rkisp1_write(params->rkisp1, arg->gamma_y[i],
>                              RKISP1_CIF_ISP_GAMMA_OUT_Y_0 + i * 4);
>  }
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> index 4cdb180fa64d..0f36e12e7533 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> @@ -202,8 +202,12 @@ static void rkisp1_stats_get_aec_meas(struct rkisp1_stats *stats,
>         struct rkisp1_device *rkisp1 = stats->rkisp1;
>         unsigned int i;
>
> +       /* the global max can be bigger than the version-specific one */
> +       memset(pbuf->params.ae.exp_mean, 0, RKISP1_CIF_ISP_AE_MEAN_MAX *
> +                                           sizeof(*pbuf->params.ae.exp_mean));
> +
>         pbuf->meas_type |= RKISP1_CIF_ISP_STAT_AUTOEXP;
> -       for (i = 0; i < RKISP1_CIF_ISP_AE_MEAN_MAX; i++)
> +       for (i = 0; i < RKISP1_CIF_ISP_AE_MEAN_MAX_V10; i++)
>                 pbuf->params.ae.exp_mean[i] =
>                         (u8)rkisp1_read(rkisp1,
>                                         RKISP1_CIF_ISP_EXP_MEAN_00 + i * 4);
> @@ -232,8 +236,12 @@ static void rkisp1_stats_get_hst_meas(struct rkisp1_stats *stats,
>         struct rkisp1_device *rkisp1 = stats->rkisp1;
>         unsigned int i;
>
> +       /* the global max can be bigger than the version-specific one */
> +       memset(pbuf->params.hist.hist_bins, 0, RKISP1_CIF_ISP_HIST_BIN_N_MAX *
> +                                              sizeof(*pbuf->params.hist.hist_bins));
> +
>         pbuf->meas_type |= RKISP1_CIF_ISP_STAT_HIST;
> -       for (i = 0; i < RKISP1_CIF_ISP_HIST_BIN_N_MAX; i++)
> +       for (i = 0; i < RKISP1_CIF_ISP_HIST_BIN_N_MAX_V10; i++)
>                 pbuf->params.hist.hist_bins[i] =
>                         rkisp1_read(rkisp1, RKISP1_CIF_ISP_HIST_BIN_0 + i * 4);
>  }
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> index 17217c55708f..340011359968 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -49,8 +49,14 @@
>  #define RKISP1_CIF_ISP_CTK_COEFF_MAX            0x100
>  #define RKISP1_CIF_ISP_CTK_OFFSET_MAX           0x800
>
> -#define RKISP1_CIF_ISP_AE_MEAN_MAX              25
> -#define RKISP1_CIF_ISP_HIST_BIN_N_MAX           16
> +#define RKISP1_CIF_ISP_AE_MEAN_MAX_V10         25
> +#define RKISP1_CIF_ISP_AE_MEAN_MAX_V12         81
> +#define RKISP1_CIF_ISP_AE_MEAN_MAX             RKISP1_CIF_ISP_AE_MEAN_MAX_V12
> +
> +#define RKISP1_CIF_ISP_HIST_BIN_N_MAX_V10      16
> +#define RKISP1_CIF_ISP_HIST_BIN_N_MAX_V12      32
> +#define RKISP1_CIF_ISP_HIST_BIN_N_MAX          RKISP1_CIF_ISP_HIST_BIN_N_MAX_V12
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
> @@ -524,6 +534,15 @@ enum rkisp1_cif_isp_goc_mode {
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
>         __u32 mode;
> @@ -538,6 +557,15 @@ struct rkisp1_cif_isp_goc_config {
>   *                       skipped
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
>         __u32 mode;
> @@ -825,7 +853,15 @@ struct rkisp1_cif_isp_bls_meas_val {
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
>         __u8 exp_mean[RKISP1_CIF_ISP_AE_MEAN_MAX];
> @@ -861,11 +897,21 @@ struct rkisp1_cif_isp_af_stat {
>   * @hist_bins: measured bin counters. Each bin is a 20 bits unsigned fixed point type.
>   *            Bits 0-4 are the fractional part and bits 5-19 are the integer part.
>   *
> - * The window of the measurements area is divided to 5x5 sub-windows. The histogram
> - * is then computed for each sub-window independently and the final result is a weighted
> - * average of the histogram measurements on all sub-windows.
> - * The window of the measurements area and the weight of each sub-window are configurable
> - * using struct @rkisp1_cif_isp_hst_config.
> + * The window of the measurements area is divided to 5x5 sub-windows for V10/V11 and
> + * to 9x9 sub-windows for V12. The histogram is computed for each sub-window
> + * independently and the final result is a weighted average of the histogram measurements
> + * on all sub-windows. The window of the measurements area and the weight of each
> + * sub-window are configurable using struct @rkisp1_cif_isp_hst_config.
> + *
> + * The histogram contains 16 bins in V10/V11 and 32 bins in V12/V13.
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
>         __u32 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
> --
> 2.17.1
>
