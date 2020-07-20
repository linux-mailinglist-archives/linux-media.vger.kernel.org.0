Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 443DF226F0E
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 21:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728723AbgGTTaA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 15:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbgGTT37 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 15:29:59 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B84CC061794
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2020 12:29:59 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 0EEA2294A85
Subject: Re: [PATCH v2 8/9] media: staging: rkisp1: group declaration of
 similar functions together
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200718145918.17752-1-dafna.hirschfeld@collabora.com>
 <20200718145918.17752-9-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <92007778-61ec-8f76-ee27-a722fdb77793@collabora.com>
Date:   Mon, 20 Jul 2020 16:29:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200718145918.17752-9-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/18/20 11:59 AM, Dafna Hirschfeld wrote:
> In file rkisp1-common.h, group declaration of register/unregister
> functions together and group other functions together to make
> the code easier to read.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>  drivers/staging/media/rkisp1/rkisp1-common.h | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
> index d18f901de70c..67419cf1a739 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
> @@ -304,11 +304,13 @@ void rkisp1_sd_adjust_crop_rect(struct v4l2_rect *crop,
>  void rkisp1_sd_adjust_crop(struct v4l2_rect *crop,
>  			   const struct v4l2_mbus_framefmt *bounds);
>  
> -int rkisp1_isp_register(struct rkisp1_device *rkisp1);
> -void rkisp1_isp_unregister(struct rkisp1_device *rkisp1);
> -
>  const struct rkisp1_isp_mbus_info *rkisp1_isp_mbus_info_get(u32 mbus_code);
>  
> +void rkisp1_params_configure(struct rkisp1_params *params,
> +			     enum rkisp1_fmt_raw_pat_type bayer_pat,
> +			     enum v4l2_quantization quantization);
> +void rkisp1_params_disable(struct rkisp1_params *params);
> +
>  void rkisp1_isp_isr(struct rkisp1_device *rkisp1);
>  void rkisp1_mipi_isr(struct rkisp1_device *rkisp1);
>  void rkisp1_capture_isr(struct rkisp1_device *rkisp1);
> @@ -318,16 +320,15 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1, u32 isp_mis);
>  int rkisp1_capture_devs_register(struct rkisp1_device *rkisp1);
>  void rkisp1_capture_devs_unregister(struct rkisp1_device *rkisp1);
>  
> +int rkisp1_isp_register(struct rkisp1_device *rkisp1);
> +void rkisp1_isp_unregister(struct rkisp1_device *rkisp1);
> +
>  int rkisp1_resizer_devs_register(struct rkisp1_device *rkisp1);
>  void rkisp1_resizer_devs_unregister(struct rkisp1_device *rkisp1);
>  
>  int rkisp1_stats_register(struct rkisp1_device *rkisp1);
>  void rkisp1_stats_unregister(struct rkisp1_device *rkisp1);
>  
> -void rkisp1_params_configure(struct rkisp1_params *params,
> -			     enum rkisp1_fmt_raw_pat_type bayer_pat,
> -			     enum v4l2_quantization quantization);
> -void rkisp1_params_disable(struct rkisp1_params *params);
>  int rkisp1_params_register(struct rkisp1_device *rkisp1);
>  void rkisp1_params_unregister(struct rkisp1_device *rkisp1);
>  
> 
