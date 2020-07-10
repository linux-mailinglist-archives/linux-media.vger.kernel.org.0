Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D7E121B5AB
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 14:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbgGJM7T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 08:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbgGJM7S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 08:59:18 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A16C08C5CE
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2020 05:59:18 -0700 (PDT)
Received: from [IPv6:2804:14c:483:73a8::1002] (unknown [IPv6:2804:14c:483:73a8::1002])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 26B152A69DA;
        Fri, 10 Jul 2020 13:59:13 +0100 (BST)
Subject: Re: [PATCH] media: staging: rkisp1: fix typos in file rkisp1-config.h
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200707181630.24514-1-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <bba7cac8-7ce3-2314-dc88-9e0e69c2aab8@collabora.com>
Date:   Fri, 10 Jul 2020 09:59:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200707181630.24514-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/7/20 3:16 PM, Dafna Hirschfeld wrote:
> Fix two spelling typos in file rkisp1-config.h.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>  drivers/staging/media/rkisp1/uapi/rkisp1-config.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> index 7983498bda24..e68175c7c154 100644
> --- a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> +++ b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> @@ -86,7 +86,7 @@
>  #define RKISP1_CIF_ISP_BLS_FIX_MASK                0x00001fff
>  
>  /*
> - * Automatic white balance measurments
> + * Automatic white balance measurements
>   */
>  #define RKISP1_CIF_ISP_AWB_MAX_GRID                1
>  #define RKISP1_CIF_ISP_AWB_MAX_FRAMES              7
> @@ -485,7 +485,7 @@ struct rkisp1_cif_isp_flt_config {
>  /**
>   * struct rkisp1_cif_isp_bdm_config - Configuration used by Bayer DeMosaic
>   *
> - * @demosaic_th: threshod for bayer demosaicing texture detection
> + * @demosaic_th: threshold for bayer demosaicing texture detection
>   */
>  struct rkisp1_cif_isp_bdm_config {
>  	__u8 demosaic_th;
> 
