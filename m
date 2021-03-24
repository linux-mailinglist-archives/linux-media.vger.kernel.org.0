Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46CCE347B0B
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 15:46:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236368AbhCXOpq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 10:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236166AbhCXOpN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 10:45:13 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9BA2C0613DE
        for <linux-media@vger.kernel.org>; Wed, 24 Mar 2021 07:45:12 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a7so33299528ejs.3
        for <linux-media@vger.kernel.org>; Wed, 24 Mar 2021 07:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hw1eLcINJXJ7kBu9TNdDZUsBVYHNAqV2qgHC5PFjVRA=;
        b=FBHHyyBA9USwL9FdcXdH+9SxVdnTbS6u6k2Ufu/4jq1Ow62XmPhd3n2RBhom7FzaQE
         6ci1yOhnA3cFJgwdtoo18EkFRkEG1fOeXrKc/y19A/OtOd5r6Lj/MGWXipDdtAS+2m91
         rye5ubDqJ5PgpfVOekXC9l+ppk/tWOQoD62WNmxvUvJqr2HJ4R/IN9j852BNoaNIKnsJ
         m0eQsIs+ULjirzksoPHr2mS5EjVeffD9USpVa+M69eLrCrF51OSWAvFqJ/Xv2Y1i1eeu
         eMPTnx9SQXhwanin3j0zbGZSOz+Ahm0QhFxAKIZyZSmKcrDWTqF/zEgBR1L1U45yDyPn
         xI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hw1eLcINJXJ7kBu9TNdDZUsBVYHNAqV2qgHC5PFjVRA=;
        b=FqAEeN78adSQKHIUHZ3l5cZ4Ui4SIDKsL/urWSBFrPftUvosp1kFHLZd9J/5ZiUlfP
         TIppjLlO/DTym2vOAHzCu1aQ20FxkWy5JttlTqjCD9st8IU6QuqImGzGHIOOpP7Xx9Yg
         /9RspGffr8JVRfQVT3ulU+zv/zWV2Onr7eOebQdCqO949iJ0BmzKR6LIti+uvI4CYi9h
         Ws3/BaSidUTX3xiReqAZwZ/O5RuxSCNIWm13YtpdOy6XL1QwqH2jHMzSQJIRbAT651z2
         kH2o/gVJk5LMx6CPSleqBM/+kkhXNx7eJVaS00YYF38TdwRGQwaeO3HF6AWJ9elTUxHx
         75pQ==
X-Gm-Message-State: AOAM531HRRCzdHecz5ZoKn/e+DKap0MtwjaVkZVnJYrI5qZnjIWVqdSI
        Nb5XK/ayUbrlkzyMDiT+6wMgcw==
X-Google-Smtp-Source: ABdhPJzXlJVn38THC0xklzH2BTqBEFR6CeHvuYZWDrCLQTwygcFss8GCRzmitn3qBdiTHh8tKStq4A==
X-Received: by 2002:a17:906:4dce:: with SMTP id f14mr4004853ejw.349.1616597111367;
        Wed, 24 Mar 2021 07:45:11 -0700 (PDT)
Received: from [192.168.1.54] (hst-221-122.medicom.bg. [84.238.221.122])
        by smtp.googlemail.com with ESMTPSA id f21sm1022723ejw.124.2021.03.24.07.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 07:45:11 -0700 (PDT)
Subject: Re: [PATCH] media: venus: Fix internal buffer size calculations for
 v6.
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1615970128-25668-1-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <4716b318-08f4-0129-5021-b1b6dec3f174@linaro.org>
Date:   Wed, 24 Mar 2021 16:45:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1615970128-25668-1-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 3/17/21 10:35 AM, Dikshita Agarwal wrote:
> - Update persist buffer size for encoder to 204800.
> - Update persist buffer size calculation for h264 decoder.
> - h264d level 6 support needs update in internal buffer size.
>   update below buffers size
>   - h264 decoder colocated motion vector buffer.
>   - h264 decoder VPP command buffer.
>   - h265 decoder VPP command buffer.
> - Update VP9_NUM_FRAME_INFO_BUF to 32.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  .../media/platform/qcom/venus/hfi_plat_bufs_v6.c   | 27 ++++++++++++++--------
>  1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> index d43d1a5..a41ad63 100644
> --- a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> +++ b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> @@ -40,7 +40,8 @@
>  
>  #define MAX_TILE_COLUMNS				32 /* 8K/256 */
>  
> -#define NUM_HW_PIC_BUF					10
> +#define VPP_CMD_MAX_SIZE				BIT(20)

This macro represents size, so I think it would be better to use SZ_1M.

> +#define NUM_HW_PIC_BUF					32
>  #define BIN_BUFFER_THRESHOLD				(1280 * 736)
>  #define H264D_MAX_SLICE					1800
>  /* sizeof(h264d_buftab_t) aligned to 256 */
> @@ -90,6 +91,7 @@
>  #define SIZE_SLIST_BUF_H264		512
>  #define LCU_MAX_SIZE_PELS		64
>  #define LCU_MIN_SIZE_PELS		16
> +#define SIZE_SEI_USERDATA		4096
>  
>  #define H265D_MAX_SLICE			600
>  #define SIZE_H265D_HW_PIC_T		SIZE_H264D_HW_PIC_T
> @@ -199,7 +201,7 @@ static inline u32 size_vpxd_lb_se_left_ctrl(u32 width, u32 height)
>  #define VPX_DECODER_FRAME_BIN_RES_BUDGET_RATIO_DEN	2
>  
>  #define VP8_NUM_FRAME_INFO_BUF			(5 + 1)
> -#define VP9_NUM_FRAME_INFO_BUF			(8 + 2 + 1 + 8)
> +#define VP9_NUM_FRAME_INFO_BUF			32
>  #define VP8_NUM_PROBABILITY_TABLE_BUF		VP8_NUM_FRAME_INFO_BUF
>  #define VP9_NUM_PROBABILITY_TABLE_BUF		(VP9_NUM_FRAME_INFO_BUF + 4)
>  #define VP8_PROB_TABLE_SIZE			3840
> @@ -211,7 +213,7 @@ static inline u32 size_vpxd_lb_se_left_ctrl(u32 width, u32 height)
>  
>  #define QMATRIX_SIZE				(sizeof(u32) * 128 + 256)
>  #define MP2D_QPDUMP_SIZE			115200
> -#define HFI_IRIS2_ENC_PERSIST_SIZE		102400
> +#define HFI_IRIS2_ENC_PERSIST_SIZE		204800
>  #define HFI_MAX_COL_FRAME			6
>  #define HFI_VENUS_VENC_TRE_WB_BUFF_SIZE		(65 << 4) /* in Bytes */
>  #define HFI_VENUS_VENC_DB_LINE_BUFF_PER_MB	512
> @@ -467,7 +469,7 @@ static u32 hfi_iris2_h264d_comv_size(u32 width, u32 height,
>  {
>  	u32 frame_width_in_mbs = ((width + 15) >> 4);
>  	u32 frame_height_in_mbs = ((height + 15) >> 4);
> -	u32 col_mv_aligned_width = (frame_width_in_mbs << 6);
> +	u32 col_mv_aligned_width = (frame_width_in_mbs << 7);

So we start align on 256 instead of 128?

>  	u32 col_zero_aligned_width = (frame_width_in_mbs << 2);
>  	u32 col_zero_size = 0, size_colloc = 0, comv_size = 0;
>  
> @@ -499,10 +501,14 @@ static u32 size_h264d_bse_cmd_buf(u32 height)
>  
>  static u32 size_h264d_vpp_cmd_buf(u32 height)
>  {
> +	u32 size = 0;
>  	u32 aligned_height = ALIGN(height, 32);

Add blank line here.

> +	size = min_t(u32, (((aligned_height + 15) >> 4) * 3 * 4), H264D_MAX_SLICE) *
> +		SIZE_H264D_VPP_CMD_PER_BUF;
> +	if (size > VPP_CMD_MAX_SIZE)
> +		size = VPP_CMD_MAX_SIZE;
>  
> -	return min_t(u32, (((aligned_height + 15) >> 4) * 3 * 4),
> -		     H264D_MAX_SLICE) * SIZE_H264D_VPP_CMD_PER_BUF;
> +	return size;
>  }
>  
>  static u32 hfi_iris2_h264d_non_comv_size(u32 width, u32 height,
> @@ -559,8 +565,11 @@ static u32 size_h265d_vpp_cmd_buf(u32 width, u32 height)
>  	size = min_t(u32, size, H265D_MAX_SLICE + 1);
>  	size = ALIGN(size, 4);
>  	size = 2 * size * SIZE_H265D_VPP_CMD_PER_BUF;
> +	size = ALIGN(size, HFI_DMA_ALIGNMENT);
> +	if (size > VPP_CMD_MAX_SIZE)
> +		size = VPP_CMD_MAX_SIZE;
>  
> -	return ALIGN(size, HFI_DMA_ALIGNMENT);
> +	return size;
>  }
>  
>  static u32 hfi_iris2_h265d_comv_size(u32 width, u32 height,
> @@ -1004,8 +1013,8 @@ static u32 enc_persist_size(void)
>  
>  static u32 h264d_persist1_size(void)
>  {
> -	return ALIGN((SIZE_SLIST_BUF_H264 * NUM_SLIST_BUF_H264),
> -		     HFI_DMA_ALIGNMENT);
> +	return ALIGN((SIZE_SLIST_BUF_H264 * NUM_SLIST_BUF_H264
> +		     + NUM_HW_PIC_BUF * SIZE_SEI_USERDATA), HFI_DMA_ALIGNMENT);
>  }
>  
>  static u32 h265d_persist1_size(void)
> 

-- 
regards,
Stan
