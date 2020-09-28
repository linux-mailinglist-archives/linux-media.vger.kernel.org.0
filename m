Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBCBA27B167
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 18:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgI1QG6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 12:06:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51230 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgI1QG6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 12:06:58 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC49654E;
        Mon, 28 Sep 2020 18:06:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1601309215;
        bh=A2Mi6So0YOx/3iXxgnqM2HkoFIufYjCzjTOtgvGgVk0=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=ucZq0GtL1pQsdOkBR0F7t1CNNKsumCGUpQHkcgsBPbef1sPf8nxWJJql9SIEjgL14
         aMLJkkyca6kBKdJ6kqU1J42xmg808ywq+IAVUICZXjO1EKHb23XjRajq9zMXv7OLj8
         kswEm9yg+nTHj6xVM3Qdr3r0VGTYFFdLi1wRFCnM=
Subject: Re: [PATCH] staging: rkisp1: uapi: Do not use BIT() macro
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org
References: <20200928154848.3882692-1-niklas.soderlund@ragnatech.se>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <ab310e21-bd03-e443-5a8c-98157c79f5c1@ideasonboard.com>
Date:   Mon, 28 Sep 2020 17:06:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200928154848.3882692-1-niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On 28/09/2020 16:48, Niklas Söderlund wrote:
> The BIT() macro is not available to uAPI headers, replace the few usages
> of it by open coding it.

Ayee. That's a pain.

> Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
> ---
>  .../staging/media/rkisp1/uapi/rkisp1-config.h | 44 +++++++++----------
>  1 file changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> index f202182349b4040f..c50b0ccb78987c26 100644
> --- a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> +++ b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> @@ -14,41 +14,41 @@
>  #define V4L2_META_FMT_RK_ISP1_STAT_3A  v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A statistics */
>  
>  /* Defect Pixel Cluster Detection */
> -#define RKISP1_CIF_ISP_MODULE_DPCC		BIT(0)
> +#define RKISP1_CIF_ISP_MODULE_DPCC		(1 << 0)

These should likely be expressed as unsigned.

						(1U << 0)
etc.

--
Kieran


>  /* Black Level Subtraction */
> -#define RKISP1_CIF_ISP_MODULE_BLS		BIT(1)
> +#define RKISP1_CIF_ISP_MODULE_BLS		(1 << 1)
>  /* Sensor De-gamma */
> -#define RKISP1_CIF_ISP_MODULE_SDG		BIT(2)
> +#define RKISP1_CIF_ISP_MODULE_SDG		(1 << 2)
>  /* Histogram */
> -#define RKISP1_CIF_ISP_MODULE_HST		BIT(3)
> +#define RKISP1_CIF_ISP_MODULE_HST		(1 << 3)
>  /* Lens Shade Control */
> -#define RKISP1_CIF_ISP_MODULE_LSC		BIT(4)
> +#define RKISP1_CIF_ISP_MODULE_LSC		(1 << 4)
>  /* Auto White Balance Gain */
> -#define RKISP1_CIF_ISP_MODULE_AWB_GAIN		BIT(5)
> +#define RKISP1_CIF_ISP_MODULE_AWB_GAIN		(1 << 5)
>  /* Filter */
> -#define RKISP1_CIF_ISP_MODULE_FLT		BIT(6)
> +#define RKISP1_CIF_ISP_MODULE_FLT		(1 << 6)
>  /* Bayer Demosaic */
> -#define RKISP1_CIF_ISP_MODULE_BDM		BIT(7)
> +#define RKISP1_CIF_ISP_MODULE_BDM		(1 << 7)
>  /* Cross Talk */
> -#define RKISP1_CIF_ISP_MODULE_CTK		BIT(8)
> +#define RKISP1_CIF_ISP_MODULE_CTK		(1 << 8)
>  /* Gamma Out Curve */
> -#define RKISP1_CIF_ISP_MODULE_GOC		BIT(9)
> +#define RKISP1_CIF_ISP_MODULE_GOC		(1 << 9)
>  /* Color Processing */
> -#define RKISP1_CIF_ISP_MODULE_CPROC		BIT(10)
> +#define RKISP1_CIF_ISP_MODULE_CPROC		(1 << 10)
>  /* Auto Focus Control */
> -#define RKISP1_CIF_ISP_MODULE_AFC		BIT(11)
> +#define RKISP1_CIF_ISP_MODULE_AFC		(1 << 11)
>  /* Auto White Balancing */
> -#define RKISP1_CIF_ISP_MODULE_AWB		BIT(12)
> +#define RKISP1_CIF_ISP_MODULE_AWB		(1 << 12)
>  /* Image Effect */
> -#define RKISP1_CIF_ISP_MODULE_IE		BIT(13)
> +#define RKISP1_CIF_ISP_MODULE_IE		(1 << 13)
>  /* Auto Exposure Control */
> -#define RKISP1_CIF_ISP_MODULE_AEC		BIT(14)
> +#define RKISP1_CIF_ISP_MODULE_AEC		(1 << 14)
>  /* Wide Dynamic Range */
> -#define RKISP1_CIF_ISP_MODULE_WDR		BIT(15)
> +#define RKISP1_CIF_ISP_MODULE_WDR		(1 << 15)
>  /* Denoise Pre-Filter */
> -#define RKISP1_CIF_ISP_MODULE_DPF		BIT(16)
> +#define RKISP1_CIF_ISP_MODULE_DPF		(1 << 16)
>  /* Denoise Pre-Filter Strength */
> -#define RKISP1_CIF_ISP_MODULE_DPF_STRENGTH	BIT(17)
> +#define RKISP1_CIF_ISP_MODULE_DPF_STRENGTH	(1 << 17)
>  
>  #define RKISP1_CIF_ISP_CTK_COEFF_MAX            0x100
>  #define RKISP1_CIF_ISP_CTK_OFFSET_MAX           0x800
> @@ -123,10 +123,10 @@
>  /*
>   * Measurement types
>   */
> -#define RKISP1_CIF_ISP_STAT_AWB           BIT(0)
> -#define RKISP1_CIF_ISP_STAT_AUTOEXP       BIT(1)
> -#define RKISP1_CIF_ISP_STAT_AFM           BIT(2)
> -#define RKISP1_CIF_ISP_STAT_HIST          BIT(3)
> +#define RKISP1_CIF_ISP_STAT_AWB           (1 << 0)
> +#define RKISP1_CIF_ISP_STAT_AUTOEXP       (1 << 1)
> +#define RKISP1_CIF_ISP_STAT_AFM           (1 << 2)
> +#define RKISP1_CIF_ISP_STAT_HIST          (1 << 3)
>  
>  enum rkisp1_cif_isp_histogram_mode {
>  	RKISP1_CIF_ISP_HISTOGRAM_MODE_DISABLE,
> 

