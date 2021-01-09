Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2CE72F035A
	for <lists+linux-media@lfdr.de>; Sat,  9 Jan 2021 21:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbhAIUNB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Jan 2021 15:13:01 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36174 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726006AbhAIUNB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Jan 2021 15:13:01 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id F06ED1F456CE
Subject: Re: [PATCH RFC 05/11] media: rockchip: rkisp1: extend uapi array
 sizes
To:     Heiko Stuebner <heiko@sntech.de>, ezequiel@collabora.com,
        helen.koike@collabora.com, Laurent.pinchart@ideasonboard.com
Cc:     linux-rockchip@lists.infradead.org,
        christoph.muellner@theobroma-systems.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
References: <20210108193311.3423236-1-heiko@sntech.de>
 <20210108193311.3423236-6-heiko@sntech.de>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <42dd91aa-34a6-501c-33ba-5dee0dcf45f1@collabora.com>
Date:   Sat, 9 Jan 2021 21:12:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210108193311.3423236-6-heiko@sntech.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 08.01.21 um 20:33 schrieb Heiko Stuebner:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> Later variants of the rkisp1 block use more entries in some arrays:
> 
> RKISP1_CIF_ISP_AE_MEAN_MAX                 25 -> 81
> RKISP1_CIF_ISP_HIST_BIN_N_MAX              16 -> 32
> RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES       17 -> 34
> RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE 28 -> 81
> 
> and we can still extend the uapi during the 5.11-rc cycle, so do that
> now to be on the safe side.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> ---
>   include/uapi/linux/rkisp1-config.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> index 6e449e784260..31a88bb65e03 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -49,8 +49,8 @@
>   #define RKISP1_CIF_ISP_CTK_COEFF_MAX            0x100
>   #define RKISP1_CIF_ISP_CTK_OFFSET_MAX           0x800
>   
> -#define RKISP1_CIF_ISP_AE_MEAN_MAX              25
> -#define RKISP1_CIF_ISP_HIST_BIN_N_MAX           16
> +#define RKISP1_CIF_ISP_AE_MEAN_MAX              81
> +#define RKISP1_CIF_ISP_HIST_BIN_N_MAX           32
>   #define RKISP1_CIF_ISP_AFM_MAX_WINDOWS          3
>   #define RKISP1_CIF_ISP_DEGAMMA_CURVE_SIZE       17
>   
> @@ -86,7 +86,7 @@
>    * Gamma out
>    */
>   /* Maximum number of color samples supported */
> -#define RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES       17
> +#define RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES       34
>   
>   /*
>    * Lens shade correction
> @@ -103,7 +103,7 @@
>    * Histogram calculation
>    */
>   /* Last 3 values unused. */
> -#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE 28
> +#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE 81
>   

Hi,
We should have 3 defines for each of the changes,
to keep the values per version and then set the
array size to be the bigger of the two.
For example:


#define RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V10       17
#define RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_v12       34
#define RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES       RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V12

Thanks,
Dafna

>   /*
>    * Defect Pixel Cluster Correction
> 
