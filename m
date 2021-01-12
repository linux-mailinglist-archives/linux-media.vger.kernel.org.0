Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE0D42F2A25
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 09:40:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392291AbhALIke (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 03:40:34 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:54859 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2392335AbhALIka (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 03:40:30 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id zFDLkD6lqVfyLzFDPkokAT; Tue, 12 Jan 2021 09:39:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1610440787; bh=FdBTg4bvKMCp/5QvVRUbGTnol3lQOX22OVY4xA9vV5E=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=K+9QkmzV5ydsxeojyQBcTdX+98Xa8J/r4hpZXEeGaZt2zYJMk6tjbrRnUc1wlQVL4
         3FD6rq7b7we1asiL3L/pYg638Dd+1TyxxQBJUHIYDmdVDPOps3IIbwLVJECmN9lb4G
         ALJk6GBpM81+6PiqubBWBHng0KYZoRNp/S+NiykSkkreV6W0CqOOFLlw2PHZY5Xvvp
         4C/CaH/dte8DRQv9WiBBsEjwJuQrkkEYVeZzujoiSVsmlDeX3g2vuHTmqDj30Ynf7J
         nltABD/jhAMb6a46rUffiX3JNZRJOPgu2R0TejvmzD6GP0xXxuwNYA+H5j+8PeUJmV
         Ye4k7A/8TohVw==
Subject: Re: [PATCH 2/2] media: rockchip: rkisp1: extend uapi array sizes
To:     Heiko Stuebner <heiko@sntech.de>, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, linux-media@vger.kernel.org,
        mchehab@kernel.org, Laurent.pinchart@ideasonboard.com
Cc:     linux-rockchip@lists.infradead.org, ezequiel@collabora.com,
        christoph.muellner@theobroma-systems.com,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
References: <20210111234011.3642481-1-heiko@sntech.de>
 <20210111234011.3642481-3-heiko@sntech.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <72de44bf-11a5-9ef1-9402-6ca51ac6b98d@xs4all.nl>
Date:   Tue, 12 Jan 2021 09:39:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111234011.3642481-3-heiko@sntech.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEutXqwpEh3IakRXSoRf1E04q3Ul3OKFOJLnQ+PkvUDw5Uui3LTPQSOqw2r++Pztuwu9nS7AChTlMHH65NMwg0oeX/2I41P2FtqxEWThmeEMdBj2V8bd
 xj6kXXYrVElUZU2SmFAqk1Rcp7v5SXdrol2KtvIiv+PF24d2fTcxrYXTd/pDNMkljl3ZDEqI2pbqOV1TtsOBTUIdms7CB7TH2jcrz4ZIqiezg6zomPN2VqYa
 vPjVPFKSTsUN+8FlvlkYqQJIFLhwYCvVMyul8wRbNwcWS1FqUvO073O2jn2zb+BPKGBn6xlM/Swf2kyMjUA+WG3+Y6xSxcOLEZJKKfT9m67VxIWI2rbDuWEa
 x8vSu5o9bcZfSIsCAiTPIu9+wSSL2Nc0NR3mKzN60fs72HFBm+lFWMQG+KTa9Cs1TDXkBROQq0CXuEICYapY8ZKBtmbW23yqumc/whoCFYkUQ5jZt7d8SOoH
 /AJaLjcRib3v6hBbEIArxFPtz4Ai2IKUIEXhjwsQ7pKv2uvaUTcx9TmZoaAVvoCEEp1LGgF7VcGfi8TiZp4dejqenumK7Dt/s4mIfccxAUn3a3RaIuzPLxlo
 kU8=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/01/2021 00:40, Heiko Stuebner wrote:
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
> V10 and V11 only need the smaller sizes, while V12 and V13 needed
> the larger sizes.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> ---
> changes since rfc:
> - introduce constants for versions and make max use the biggest
> 
>  include/uapi/linux/rkisp1-config.h | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> index bad46aadf838..20d24656a8b7 100644
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
> @@ -103,7 +111,9 @@
>   * Histogram calculation
>   */
>  /* Last 3 values unused. */
> -#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE 28
> +#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE_V10 28
> +#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE_V12 81
> +#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE     RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE_V12
>  
>  /*
>   * Defect Pixel Cluster Correction
> 

You must update the documentation in this header for the relevant
structs as well, including a mention that this depends on hw_revision.

What happens to the unused parts of these arrays on a V10/V11 SoC?
Are they zeroed? Please check that no kernel memory contents is leaked
in the unused parts.

Regards,

	Hans
