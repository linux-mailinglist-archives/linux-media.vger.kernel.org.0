Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21265322B44
	for <lists+linux-media@lfdr.de>; Tue, 23 Feb 2021 14:14:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232752AbhBWNMR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Feb 2021 08:12:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232601AbhBWNMQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Feb 2021 08:12:16 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED1A1C061786
        for <linux-media@vger.kernel.org>; Tue, 23 Feb 2021 05:11:35 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id d8so34499926ejc.4
        for <linux-media@vger.kernel.org>; Tue, 23 Feb 2021 05:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SDlvrGnCHB2gcAG2v5au9NkVTCAf1HHArWaYqJ1nq/s=;
        b=Jtnkx97FM1vOzeukdCBAIBSO7rVdCPYyBOqC09yATd4VmMmz1rh16Wl9n6YGPBzp9y
         Gq6M7pvyS1KAQdS/jKw/T8X1UFrP/1yqhM3tbnicdGSIG55QbR7cYUxD5drwTsrWZohC
         L12xeFyvz/I0bUCxJEZ9qT/KjfPS2mcKduoPrCo7bZjeuhZQZRIOhMlZ3oREsrJpEjiv
         vz9ec5bRff1CHSh+cPf7s4Rl6hkk+gVButR5p8Mz1X+szkLf31Rd5bM3MbtFgE9AZVDE
         nblo+Q85uvj18lCbO7R5vIGkFgIRTAj4lGhjXIQmZo7b33bVkvRauZuga2rhIMeSNN2S
         slxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SDlvrGnCHB2gcAG2v5au9NkVTCAf1HHArWaYqJ1nq/s=;
        b=txQfHMbmG0gCs+a/fnFUnjF0vLu3q4vLCccl7QD5J50NCZvNrsmlLYi6DWMB3fvteU
         Wr+tVX/atgm4TdOK4zVjQDQggArziP8tefHETCN9yyKFDlLI/kZNvWgAq6TR+eCywpL9
         rp9Ksu65PwQNz7YcqitLAFbLQUEtlT/FPmrMjGki5CwWJxkI0MEtt83ZHS2HKRfVtyio
         enhRY+OKPx7PXaNQWsjiD2fQTkDOtKFgEKbfkzCHJJrXmKe51Zzj8HaaU6SVLtzP27Nw
         2Fw/aKZEU3yKWuNVhzsboJt7snLb9N0XW/0UYYX6kFwo+nuNDCDvzLAkszewhI5ZVh6w
         blbQ==
X-Gm-Message-State: AOAM531ntOyHCK1sw+GnOtjUxAyBy6Jrgeb/Sq+yx38+Ii1SODEyBpOD
        FpuS+pCPIhv7GUBYfGeF3KmIZQ==
X-Google-Smtp-Source: ABdhPJxR79BAUIRT+V26BFQoUTXFbqN0+uLygvvA8Jy0B5ngyGWS8MNv1suHbWg2Z9Zq/DzJ4j4DEQ==
X-Received: by 2002:a17:906:d146:: with SMTP id br6mr10235766ejb.552.1614085894696;
        Tue, 23 Feb 2021 05:11:34 -0800 (PST)
Received: from [192.168.0.4] (hst-208-222.medicom.bg. [84.238.208.222])
        by smtp.googlemail.com with ESMTPSA id t13sm12198837edr.17.2021.02.23.05.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Feb 2021 05:11:34 -0800 (PST)
Subject: Re: [PATCH 01/25] media: venus: Update v6 buffer descriptors
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     dikshita@codeaurora.org, jonathan@marek.ca, vgarodia@codeaurora.org
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
 <20210222160300.1811121-2-bryan.odonoghue@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <07d114d8-6d49-3918-ea1d-6140065b396f@linaro.org>
Date:   Tue, 23 Feb 2021 15:11:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210222160300.1811121-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/22/21 6:02 PM, Bryan O'Donoghue wrote:
> Currently hfi_platform_v6.c adds a bunch of capability parameters.
> Reviewing downstream we can see a number of these need to be updated.
> 
> techpack/video/msm/vidc/msm_vidc_platform.c :: kona_capabilities[]
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../platform/qcom/venus/hfi_platform_v6.c     | 138 +++++++++---------
>  1 file changed, 69 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v6.c b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
> index 2278be13cb90..6fa80353bcce 100644
> --- a/drivers/media/platform/qcom/venus/hfi_platform_v6.c
> +++ b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
> @@ -9,15 +9,15 @@ static const struct hfi_plat_caps caps[] = {
>  	.codec = HFI_VIDEO_CODEC_H264,
>  	.domain = VIDC_SESSION_TYPE_DEC,
>  	.cap_bufs_mode_dynamic = true,
> -	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 5760, 1},
> -	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 5760, 1},
> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 8192, 1},
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 8192, 1},
>  	/* ((5760 * 2880) / 256) */
> -	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 36, 64800, 1},
> -	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 200000000, 1},
> +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 138240, 1},
> +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 22000000, 1},

s/22000000/220000000

>  	.caps[4] = {HFI_CAPABILITY_SCALE_X, 65536, 65536, 1},
>  	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 65536, 65536, 1},
> -	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 36, 1958400, 1},
> -	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 480, 1},
> +	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 7833600, 1},
> +	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 960, 1},
>  	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
>  	.num_caps = 9,
>  	.pl[0] = {HFI_H264_PROFILE_BASELINE, HFI_H264_LEVEL_52},
> @@ -35,15 +35,15 @@ static const struct hfi_plat_caps caps[] = {
>  	.codec = HFI_VIDEO_CODEC_HEVC,
>  	.domain = VIDC_SESSION_TYPE_DEC,
>  	.cap_bufs_mode_dynamic = true,
> -	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 1},
> -	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 1},
> -	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 36864, 1},
> -	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 120000000, 1},
> -	.caps[4] = {HFI_CAPABILITY_SCALE_X, 4096, 65536, 1},
> -	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 4096, 65536, 1},
> -	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 1, 2073600, 1},
> -	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 480, 1},
> -	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 1, 2, 1},
> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 8192, 1},
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 8192, 1},
> +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 138240, 1},
> +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 22000000, 1},

s/22000000/220000000

> +	.caps[4] = {HFI_CAPABILITY_SCALE_X, 65536, 65536, 1},
> +	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 65536, 65536, 1},
> +	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 7833600, 1},
> +	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 960, 1},
> +	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
>  	.caps[9] = {HFI_CAPABILITY_MAX_WORKMODES, 1, 3, 1},
>  	.num_caps = 10,
>  	.pl[0] = {HFI_HEVC_PROFILE_MAIN, HFI_HEVC_LEVEL_6 | HFI_HEVC_TIER_HIGH0},
> @@ -61,15 +61,15 @@ static const struct hfi_plat_caps caps[] = {
>  	.codec = HFI_VIDEO_CODEC_VP8,
>  	.domain = VIDC_SESSION_TYPE_DEC,
>  	.cap_bufs_mode_dynamic = true,
> -	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 1},
> -	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 1},
> -	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 36864, 1},
> -	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 120000000, 1},
> -	.caps[4] = {HFI_CAPABILITY_SCALE_X, 4096, 65536, 1},
> -	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 4096, 65536, 1},
> -	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 1, 2073600, 1},
> -	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 480, 1},
> -	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 1, 2, 1},
> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 4096, 1},
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 4096, 1},
> +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 36864, 1},
> +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 100000000, 1},
> +	.caps[4] = {HFI_CAPABILITY_SCALE_X, 65536, 65536, 1},
> +	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 65536, 65536, 1},
> +	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 4423680, 1},
> +	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
> +	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
>  	.caps[9] = {HFI_CAPABILITY_MAX_WORKMODES, 1, 3, 1},
>  	.num_caps = 10,
>  	.pl[0] = {HFI_VPX_PROFILE_MAIN, HFI_VPX_LEVEL_VERSION_0},
> @@ -86,15 +86,15 @@ static const struct hfi_plat_caps caps[] = {
>  	.codec = HFI_VIDEO_CODEC_VP9,
>  	.domain = VIDC_SESSION_TYPE_DEC,
>  	.cap_bufs_mode_dynamic = true,
> -	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 1},
> -	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 1},
> -	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 36864, 1},
> -	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 120000000, 1},
> -	.caps[4] = {HFI_CAPABILITY_SCALE_X, 4096, 65536, 1},
> -	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 4096, 65536, 1},
> -	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 1, 2073600, 1},
> -	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 480, 1},
> -	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 1, 2, 1},
> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 8192, 1},
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 8192, 1},
> +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 138240, 1},
> +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 22000000, 1},

s/22000000/220000000

> +	.caps[4] = {HFI_CAPABILITY_SCALE_X, 65536, 65536, 1},
> +	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 65536, 65536, 1},
> +	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 7833600, 1},
> +	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 960, 1},
> +	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
>  	.caps[9] = {HFI_CAPABILITY_MAX_WORKMODES, 1, 3, 1},
>  	.num_caps = 10,
>  	.pl[0] = {HFI_VP9_PROFILE_P0, 200},
> @@ -112,15 +112,15 @@ static const struct hfi_plat_caps caps[] = {
>  	.codec = HFI_VIDEO_CODEC_MPEG2,
>  	.domain = VIDC_SESSION_TYPE_DEC,
>  	.cap_bufs_mode_dynamic = true,
> -	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 1920, 1},
> -	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 1920, 1},
> -	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 8160, 1},
> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1920, 1},
> +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
>  	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 40000000, 1},
> -	.caps[4] = {HFI_CAPABILITY_SCALE_X, 4096, 65536, 1},
> -	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 4096, 65536, 1},
> -	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 1, 244800, 1},
> +	.caps[4] = {HFI_CAPABILITY_SCALE_X, 65536, 65536, 1},
> +	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 65536, 65536, 1},
> +	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 7833600, 1},

this should be 64 - 244800.

>  	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 30, 1},
> -	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 1, 2, 1},
> +	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
>  	.caps[9] = {HFI_CAPABILITY_MAX_WORKMODES, 1, 1, 1},
>  	.num_caps = 10,
>  	.pl[0] = {HFI_MPEG2_PROFILE_SIMPLE, HFI_MPEG2_LEVEL_H14},
> @@ -135,21 +135,21 @@ static const struct hfi_plat_caps caps[] = {
>  	.codec = HFI_VIDEO_CODEC_H264,
>  	.domain = VIDC_SESSION_TYPE_ENC,
>  	.cap_bufs_mode_dynamic = true,
> -	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 16},
> -	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 16},
> -	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 36864, 1},
> -	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 120000000, 1},
> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 8192, 1},
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 8192, 1},
> +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 138240, 1},
> +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 22000000, 1},

s/22000000/220000000

>  	.caps[4] = {HFI_CAPABILITY_SCALE_X, 8192, 65536, 1},
>  	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 8192, 65536, 1},
> -	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 1, 1036800, 1},
> -	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 480, 1},
> -	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 1, 3, 1},
> +	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 7833600, 1},
> +	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 960, 1},
> +	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
>  	.caps[9] = {HFI_CAPABILITY_PEAKBITRATE, 32000, 160000000, 1},
> -	.caps[10] = {HFI_CAPABILITY_HIER_P_NUM_ENH_LAYERS, 0, 5, 1},
> -	.caps[11] = {HFI_CAPABILITY_ENC_LTR_COUNT, 0, 4, 1},
> +	.caps[10] = {HFI_CAPABILITY_HIER_P_NUM_ENH_LAYERS, 0, 6, 1},
> +	.caps[11] = {HFI_CAPABILITY_ENC_LTR_COUNT, 0, 2, 1},
>  	.caps[12] = {HFI_CAPABILITY_LCU_SIZE, 16, 16, 1},
>  	.caps[13] = {HFI_CAPABILITY_BFRAME, 0, 1, 1},
> -	.caps[14] = {HFI_CAPABILITY_HIER_P_HYBRID_NUM_ENH_LAYERS, 0, 5, 1},
> +	.caps[14] = {HFI_CAPABILITY_HIER_P_HYBRID_NUM_ENH_LAYERS, 0, 6, 1},
>  	.caps[15] = {HFI_CAPABILITY_I_FRAME_QP, 0, 51, 1},
>  	.caps[16] = {HFI_CAPABILITY_P_FRAME_QP, 0, 51, 1},
>  	.caps[17] = {HFI_CAPABILITY_B_FRAME_QP, 0, 51, 1},
> @@ -172,24 +172,24 @@ static const struct hfi_plat_caps caps[] = {
>  	.codec = HFI_VIDEO_CODEC_HEVC,
>  	.domain = VIDC_SESSION_TYPE_ENC,
>  	.cap_bufs_mode_dynamic = true,
> -	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 16},
> -	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 16},
> -	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 36864, 1},
> -	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 120000000, 1},
> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 8192, 16},
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 8192, 16},
> +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 138240, 1},
> +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 160000000, 1},
>  	.caps[4] = {HFI_CAPABILITY_SCALE_X, 8192, 65536, 1},
>  	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 8192, 65536, 1},
> -	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 1, 1036800, 1},
> -	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 480, 1},
> -	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 1, 3, 1},
> +	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 7833600, 1},
> +	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 960, 1},
> +	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
>  	.caps[9] = {HFI_CAPABILITY_PEAKBITRATE, 32000, 160000000, 1},
>  	.caps[10] = {HFI_CAPABILITY_HIER_P_NUM_ENH_LAYERS, 0, 5, 1},
> -	.caps[11] = {HFI_CAPABILITY_ENC_LTR_COUNT, 0, 4, 1},
> +	.caps[11] = {HFI_CAPABILITY_ENC_LTR_COUNT, 0, 2, 1},
>  	.caps[12] = {HFI_CAPABILITY_LCU_SIZE, 32, 32, 1},
>  	.caps[13] = {HFI_CAPABILITY_BFRAME, 0, 1, 1},
>  	.caps[14] = {HFI_CAPABILITY_HIER_P_HYBRID_NUM_ENH_LAYERS, 0, 5, 1},
> -	.caps[15] = {HFI_CAPABILITY_I_FRAME_QP, 0, 63, 1},
> -	.caps[16] = {HFI_CAPABILITY_P_FRAME_QP, 0, 63, 1},
> -	.caps[17] = {HFI_CAPABILITY_B_FRAME_QP, 0, 63, 1},
> +	.caps[15] = {HFI_CAPABILITY_I_FRAME_QP, 0, 51, 1},
> +	.caps[16] = {HFI_CAPABILITY_P_FRAME_QP, 0, 51, 1},
> +	.caps[17] = {HFI_CAPABILITY_B_FRAME_QP, 0, 51, 1},
>  	.caps[18] = {HFI_CAPABILITY_MAX_WORKMODES, 1, 2, 1},
>  	.caps[19] = {HFI_CAPABILITY_RATE_CONTROL_MODES, 0x1000001, 0x1000005, 1},
>  	.caps[20] = {HFI_CAPABILITY_COLOR_SPACE_CONVERSION, 0, 2, 1},
> @@ -209,20 +209,20 @@ static const struct hfi_plat_caps caps[] = {
>  	.codec = HFI_VIDEO_CODEC_VP8,
>  	.domain = VIDC_SESSION_TYPE_ENC,
>  	.cap_bufs_mode_dynamic = true,
> -	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 16},
> -	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 16},
> -	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 36864, 1},
> -	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 120000000, 1},
> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 4096, 16},
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 4096, 16},
> +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 36864, 1},
> +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 74000000, 1},
>  	.caps[4] = {HFI_CAPABILITY_SCALE_X, 8192, 65536, 1},
>  	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 8192, 65536, 1},
> -	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 1, 1036800, 1},
> -	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 240, 1},
> -	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 1, 3, 1},
> +	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 4423680, 1},
> +	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},

s/120/60

> +	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
>  	.caps[9] = {HFI_CAPABILITY_PEAKBITRATE, 32000, 160000000, 1},
>  	.caps[10] = {HFI_CAPABILITY_HIER_P_NUM_ENH_LAYERS, 0, 3, 1},
>  	.caps[11] = {HFI_CAPABILITY_ENC_LTR_COUNT, 0, 2, 1},
>  	.caps[12] = {HFI_CAPABILITY_LCU_SIZE, 16, 16, 1},
> -	.caps[13] = {HFI_CAPABILITY_BFRAME, 0, 1, 1},
> +	.caps[13] = {HFI_CAPABILITY_BFRAME, 0, 0, 1},

>  	.caps[14] = {HFI_CAPABILITY_HIER_P_HYBRID_NUM_ENH_LAYERS, 0, 5, 1},
>  	.caps[15] = {HFI_CAPABILITY_I_FRAME_QP, 0, 127, 1},
>  	.caps[16] = {HFI_CAPABILITY_P_FRAME_QP, 0, 127, 1},
> 

-- 
regards,
Stan
