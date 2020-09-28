Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15D4627B172
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 18:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgI1QJq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 12:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbgI1QJq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 12:09:46 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BCDCC061755
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2020 09:09:46 -0700 (PDT)
Received: from [IPv6:2003:c7:cf13:ec00:c5de:8baa:d62d:6718] (p200300c7cf13ec00c5de8baad62d6718.dip0.t-ipconnect.de [IPv6:2003:c7:cf13:ec00:c5de:8baa:d62d:6718])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 89AE02993DB;
        Mon, 28 Sep 2020 17:09:44 +0100 (BST)
Subject: Re: [PATCH] staging: rkisp1: uapi: Do not use BIT() macro
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org
References: <20200928154848.3882692-1-niklas.soderlund@ragnatech.se>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <eaf6662b-d675-376e-9a85-feb0f1b65851@collabora.com>
Date:   Mon, 28 Sep 2020 18:09:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200928154848.3882692-1-niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 28.09.20 um 17:48 schrieb Niklas Söderlund:
> The BIT() macro is not available to uAPI headers, replace the few usages
> of it by open coding it.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>

Thanks,

Acked-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

> ---
>   .../staging/media/rkisp1/uapi/rkisp1-config.h | 44 +++++++++----------
>   1 file changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> index f202182349b4040f..c50b0ccb78987c26 100644
> --- a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> +++ b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> @@ -14,41 +14,41 @@
>   #define V4L2_META_FMT_RK_ISP1_STAT_3A  v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A statistics */
>   
>   /* Defect Pixel Cluster Detection */
> -#define RKISP1_CIF_ISP_MODULE_DPCC		BIT(0)
> +#define RKISP1_CIF_ISP_MODULE_DPCC		(1 << 0)
>   /* Black Level Subtraction */
> -#define RKISP1_CIF_ISP_MODULE_BLS		BIT(1)
> +#define RKISP1_CIF_ISP_MODULE_BLS		(1 << 1)
>   /* Sensor De-gamma */
> -#define RKISP1_CIF_ISP_MODULE_SDG		BIT(2)
> +#define RKISP1_CIF_ISP_MODULE_SDG		(1 << 2)
>   /* Histogram */
> -#define RKISP1_CIF_ISP_MODULE_HST		BIT(3)
> +#define RKISP1_CIF_ISP_MODULE_HST		(1 << 3)
>   /* Lens Shade Control */
> -#define RKISP1_CIF_ISP_MODULE_LSC		BIT(4)
> +#define RKISP1_CIF_ISP_MODULE_LSC		(1 << 4)
>   /* Auto White Balance Gain */
> -#define RKISP1_CIF_ISP_MODULE_AWB_GAIN		BIT(5)
> +#define RKISP1_CIF_ISP_MODULE_AWB_GAIN		(1 << 5)
>   /* Filter */
> -#define RKISP1_CIF_ISP_MODULE_FLT		BIT(6)
> +#define RKISP1_CIF_ISP_MODULE_FLT		(1 << 6)
>   /* Bayer Demosaic */
> -#define RKISP1_CIF_ISP_MODULE_BDM		BIT(7)
> +#define RKISP1_CIF_ISP_MODULE_BDM		(1 << 7)
>   /* Cross Talk */
> -#define RKISP1_CIF_ISP_MODULE_CTK		BIT(8)
> +#define RKISP1_CIF_ISP_MODULE_CTK		(1 << 8)
>   /* Gamma Out Curve */
> -#define RKISP1_CIF_ISP_MODULE_GOC		BIT(9)
> +#define RKISP1_CIF_ISP_MODULE_GOC		(1 << 9)
>   /* Color Processing */
> -#define RKISP1_CIF_ISP_MODULE_CPROC		BIT(10)
> +#define RKISP1_CIF_ISP_MODULE_CPROC		(1 << 10)
>   /* Auto Focus Control */
> -#define RKISP1_CIF_ISP_MODULE_AFC		BIT(11)
> +#define RKISP1_CIF_ISP_MODULE_AFC		(1 << 11)
>   /* Auto White Balancing */
> -#define RKISP1_CIF_ISP_MODULE_AWB		BIT(12)
> +#define RKISP1_CIF_ISP_MODULE_AWB		(1 << 12)
>   /* Image Effect */
> -#define RKISP1_CIF_ISP_MODULE_IE		BIT(13)
> +#define RKISP1_CIF_ISP_MODULE_IE		(1 << 13)
>   /* Auto Exposure Control */
> -#define RKISP1_CIF_ISP_MODULE_AEC		BIT(14)
> +#define RKISP1_CIF_ISP_MODULE_AEC		(1 << 14)
>   /* Wide Dynamic Range */
> -#define RKISP1_CIF_ISP_MODULE_WDR		BIT(15)
> +#define RKISP1_CIF_ISP_MODULE_WDR		(1 << 15)
>   /* Denoise Pre-Filter */
> -#define RKISP1_CIF_ISP_MODULE_DPF		BIT(16)
> +#define RKISP1_CIF_ISP_MODULE_DPF		(1 << 16)
>   /* Denoise Pre-Filter Strength */
> -#define RKISP1_CIF_ISP_MODULE_DPF_STRENGTH	BIT(17)
> +#define RKISP1_CIF_ISP_MODULE_DPF_STRENGTH	(1 << 17)
>   
>   #define RKISP1_CIF_ISP_CTK_COEFF_MAX            0x100
>   #define RKISP1_CIF_ISP_CTK_OFFSET_MAX           0x800
> @@ -123,10 +123,10 @@
>   /*
>    * Measurement types
>    */
> -#define RKISP1_CIF_ISP_STAT_AWB           BIT(0)
> -#define RKISP1_CIF_ISP_STAT_AUTOEXP       BIT(1)
> -#define RKISP1_CIF_ISP_STAT_AFM           BIT(2)
> -#define RKISP1_CIF_ISP_STAT_HIST          BIT(3)
> +#define RKISP1_CIF_ISP_STAT_AWB           (1 << 0)
> +#define RKISP1_CIF_ISP_STAT_AUTOEXP       (1 << 1)
> +#define RKISP1_CIF_ISP_STAT_AFM           (1 << 2)
> +#define RKISP1_CIF_ISP_STAT_HIST          (1 << 3)
>   
>   enum rkisp1_cif_isp_histogram_mode {
>   	RKISP1_CIF_ISP_HISTOGRAM_MODE_DISABLE,
> 
