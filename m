Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F83B23ADCB
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 21:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728296AbgHCTv5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 15:51:57 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49644 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728069AbgHCTv5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 15:51:57 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 747EE2964A5
Subject: Re: [PATCH] media: staging: rkisp1: comment each define
 (RKISP1_CIF_ISP_MODULE_*), explaining what the abbreviation means
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200707173413.13977-1-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <80bd60fd-6490-fd6c-2562-30b22d1f1884@collabora.com>
Date:   Mon, 3 Aug 2020 16:51:44 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200707173413.13977-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,


Thank you for this patch and sorry for the delay.

On 7/7/20 2:34 PM, Dafna Hirschfeld wrote:
> Add one line comment before each module
> define 'RKISP1_CIF_ISP_MODULE_*' explaining what the
> abbreviation means.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Regards,

> ---
>  .../staging/media/rkisp1/uapi/rkisp1-config.h  | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> index 57f5035d62a4..b2923b2833d3 100644
> --- a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> +++ b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> @@ -18,23 +18,41 @@
>  #define V4L2_META_FMT_RK_ISP1_PARAMS   v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 params */
>  #define V4L2_META_FMT_RK_ISP1_STAT_3A  v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A statistics */
>  
> +/* Defect Pixel Cluster Detection */
>  #define RKISP1_CIF_ISP_MODULE_DPCC		BIT(0)
> +/* Black Level Subtraction */
>  #define RKISP1_CIF_ISP_MODULE_BLS		BIT(1)
> +/* Sensor De-gamma */
>  #define RKISP1_CIF_ISP_MODULE_SDG		BIT(2)
> +/* Histogram */
>  #define RKISP1_CIF_ISP_MODULE_HST		BIT(3)
> +/* Lens Shade Control */
>  #define RKISP1_CIF_ISP_MODULE_LSC		BIT(4)
> +/* Auto White Balance Gain */
>  #define RKISP1_CIF_ISP_MODULE_AWB_GAIN		BIT(5)
> +/* Filter */
>  #define RKISP1_CIF_ISP_MODULE_FLT		BIT(6)
> +/* Bayer Demosaic */
>  #define RKISP1_CIF_ISP_MODULE_BDM		BIT(7)
> +/* Cross Talk */
>  #define RKISP1_CIF_ISP_MODULE_CTK		BIT(8)
> +/* Gamma Out Curve */
>  #define RKISP1_CIF_ISP_MODULE_GOC		BIT(9)
> +/* Color Processing */
>  #define RKISP1_CIF_ISP_MODULE_CPROC		BIT(10)
> +/* Auto Focus Control */
>  #define RKISP1_CIF_ISP_MODULE_AFC		BIT(11)
> +/* Auto White Balancing */
>  #define RKISP1_CIF_ISP_MODULE_AWB		BIT(12)
> +/* Image Effect */
>  #define RKISP1_CIF_ISP_MODULE_IE		BIT(13)
> +/* Auto Exposure Control */
>  #define RKISP1_CIF_ISP_MODULE_AEC		BIT(14)
> +/* Wide Dynamic Range */
>  #define RKISP1_CIF_ISP_MODULE_WDR		BIT(15)
> +/* Denoise Pre-Filter */
>  #define RKISP1_CIF_ISP_MODULE_DPF		BIT(16)
> +/* Denoise Pre-Filter Strength */
>  #define RKISP1_CIF_ISP_MODULE_DPF_STRENGTH	BIT(17)
>  
>  #define RKISP1_CIF_ISP_CTK_COEFF_MAX            0x100
> 
