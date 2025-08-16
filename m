Return-Path: <linux-media+bounces-40016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6997EB28D55
	for <lists+linux-media@lfdr.de>; Sat, 16 Aug 2025 13:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8353F1CC0398
	for <lists+linux-media@lfdr.de>; Sat, 16 Aug 2025 11:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9A02C08A0;
	Sat, 16 Aug 2025 11:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lmN973A/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFD32857DF
	for <linux-media@vger.kernel.org>; Sat, 16 Aug 2025 11:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755343029; cv=none; b=RkAstdDLnn0md+csxv1jZRdDbnwcBoK9LevfeCd7Zd7G/iAAt+Jbr8mfx3ItGTsIeeRa3PUsgtmKoDgaFbIA+fWYpXYIW6giy/5jLlmsIEP5SL1vsYFxWTvzn6pUg4UN8NANrz+TJnX+MjoX3/makPB9TyjtFXoshoJDqzVM1GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755343029; c=relaxed/simple;
	bh=VEELB1p+LXB/ILfsC7AIF5f4jw4hnJ8+SOGfsOkZT9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N2GHZoJXWvhaZWpZvLZu2jaY72BCwlxT7yBomFEEWo48mQxgMrbqnCwbOKUkBsiJ3WydQUdn/x4oGtzSAPq7/oE5p/903qWqMa/yLEYv3/v+IkmuyX7kxO0BNy8aHwEumU1+AhaQ+E/HwdjmT/xjEAg6iV0VezXsYaGyP7/ojb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lmN973A/; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b9e415a68fso2509322f8f.2
        for <linux-media@vger.kernel.org>; Sat, 16 Aug 2025 04:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755343026; x=1755947826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fT/TDaFPBPvhUlbHfzVWtQvFoSuaPS1/pw0MY9/3Tjs=;
        b=lmN973A/e/Gz7XIdhIyJcO+KYCj++Hymm4YlP7rKfdJAJ5LiUJ3X/e2Eg87MVKQHJT
         +CX78oiPTdUkB3nSh8GnAm/MQpZLf4wZZidni+Nhua7ZWLxwhOVwQXcqhwHigpkcZCs1
         CLPhKBy0CUnKhayxCL5DZN2d4wu+gMApF09n8HfudMzWj42AkryhHpdbCtD+7w20gZn/
         TksYbeu6iwxVn53aUON9NpaYUjf8UBxHce21JsxNcfMpZNGaKcAjmb66CukzGKUCrtYz
         dI9VGkodikQQbYf0nQfreiZlev7lr8isNIlRrSys7re6GY673AJsAHltkzB1BEyKgN1G
         +4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755343026; x=1755947826;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fT/TDaFPBPvhUlbHfzVWtQvFoSuaPS1/pw0MY9/3Tjs=;
        b=GxIHsNRzWbmk0hwCNC5Cn4Jj6KNq11aDii3GuJxY5x3A6d6EtCQ42lgahUrM7Y/pLv
         d4bAJw/j1s5oK6+CW2qJ7jhLxRySfc2zLE9kvnPHkYY6tzs4DhrSIPIMr8KfKAGZ8PfO
         zPT2URMmhJfEnF0P9Rv6sT1P/lEiYa5Mxgs5KlGzxgJ9jNHzPkuT7sEQXrP0lQ6YIAx4
         uDczdNZ2kApXHPE488vXHlgv/3NqQeXqcqweHTw5W2qhPMAOwNCv87CAqhGohdrINLey
         OxglNw5DRrlBobhF7kVDfxy9uyolFTrtvkvjFyBoDC+/yvKW3vtrVDTqGrxVUQyNB5pI
         wKFg==
X-Gm-Message-State: AOJu0YwRr4aO0r5mDNmRgKewIFkH6ONXAWfdb/G+P0JC1RTS0QEMceyg
	tpHf/NK/CVYexzUqRuIfNjvPDgh3QPvWHAA/5U/AQYAjUUEFOC7YbI+rlBIRZe0T518=
X-Gm-Gg: ASbGncu3Lyn7mPThOAUZE2f8gg8xho/nRZA9H/VppEUAFb8IdNHmpD6/esWAhZiSzrc
	EOGqGKzB1fxTnRNll+vLP5Vl3xA3bLkp0TNoFcJMK4xR9vbih5BiXBmMBJ2g9W+0bm3ekLwbWWS
	vr5hBSPzzIo+ZP9wnLBbaN/2GA8yjiGlohH1XgFBuap8Id5YQRx8hUhxy2yYoqAizb1CB0ZlnSx
	M19BRWGeI/jHV79bXE4OJ7IU4rUggowB/wlAQtYNSYNhId9yITpwCMFJhGwPxqht+vdnPt1qpOX
	M57n1nV9L7gSx6LztitNaX/DaPjdHHmgRpDWljiAlYPNG9CM2DDems/VUPfvrNLjkXLIosuw7MD
	9x9iCYLC4EWdQFClbNA8cIkbFGDFUCgZThFiHV5Flhx7pwuH2zS/FoW3+Ye/m4z5g
X-Google-Smtp-Source: AGHT+IFkak01a077iphXnRb0NfWZcjdMklN/paS5nToQVdKhrjqMnUJXsqyTeh2DifT49uUBCms5dg==
X-Received: by 2002:a05:6000:2484:b0:3a5:243c:6042 with SMTP id ffacd0b85a97d-3bb6646e689mr4134412f8f.2.1755343026219;
        Sat, 16 Aug 2025 04:17:06 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bc85csm91967965e9.5.2025.08.16.04.17.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Aug 2025 04:17:05 -0700 (PDT)
Message-ID: <af97c3e4-3541-418c-a0f1-ea86d2968a3c@linaro.org>
Date: Sat, 16 Aug 2025 12:17:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/24] media: iris: Fix missing LAST flag handling
 during drain
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Renjiang Han <quic_renjiang@quicinc.com>,
 Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-10-c725ff673078@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250813-iris-video-encoder-v2-10-c725ff673078@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 10:38, Dikshita Agarwal wrote:
> Improve drain handling by ensuring the LAST flag is attached to final
> capture buffer when drain response is received from the firmware.
> 
> Previously, the driver failed to attach the V4L2_BUF_FLAG_LAST flag when
> a drain response was received from the firmware, relying on userspace to
> mark the next queued buffer as LAST. This update fixes the issue by
> checking the pending drain status, attaching the LAST flag to the
> capture buffer received from the firmware (with EOS attached), and
> returning it to the V4L2 layer correctly.
> 
> Fixes: d09100763bed ("media: iris: add support for drain sequence")
> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 4 +---
>   drivers/media/platform/qcom/iris/iris_state.c             | 2 +-
>   drivers/media/platform/qcom/iris/iris_state.h             | 1 +
>   3 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index 8d1ce8a19a45ebb2b29457e0fef7d72c1c0d9785..2a96458833835422d30c9386d15cc1e4fb226e3d 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> @@ -416,8 +416,6 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
>   			inst->flush_responses_pending++;
>   
>   		iris_inst_sub_state_change_drain_last(inst);
> -
> -		return;
>   	}
>   
>   	if (iris_split_mode_enabled(inst) && pkt->stream_id == 0) {
> @@ -462,7 +460,7 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
>   		timestamp_us = (timestamp_us << 32) | timestamp_lo;
>   	} else {
>   		if (pkt->stream_id == 1 && !inst->last_buffer_dequeued) {
> -			if (iris_drc_pending(inst)) {
> +			if (iris_drc_pending(inst) || iris_drain_pending(inst)) {
>   				flags |= V4L2_BUF_FLAG_LAST;
>   				inst->last_buffer_dequeued = true;
>   			}
> diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
> index a21238d2818f9606871953bd0bee25382cca0474..d1dc1a863da0b0b1af60974e9ed2ef68ea225cdd 100644
> --- a/drivers/media/platform/qcom/iris/iris_state.c
> +++ b/drivers/media/platform/qcom/iris/iris_state.c
> @@ -252,7 +252,7 @@ bool iris_drc_pending(struct iris_inst *inst)
>   		inst->sub_state & IRIS_INST_SUB_DRC_LAST;
>   }
>   
> -static inline bool iris_drain_pending(struct iris_inst *inst)
> +bool iris_drain_pending(struct iris_inst *inst)
>   {
>   	return inst->sub_state & IRIS_INST_SUB_DRAIN &&
>   		inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
> diff --git a/drivers/media/platform/qcom/iris/iris_state.h b/drivers/media/platform/qcom/iris/iris_state.h
> index e718386dbe0402417f408d8fc696a33e5c7f23b3..b09fa54cf17eeee0c9ae254588964ad959c82c80 100644
> --- a/drivers/media/platform/qcom/iris/iris_state.h
> +++ b/drivers/media/platform/qcom/iris/iris_state.h
> @@ -141,5 +141,6 @@ int iris_inst_sub_state_change_drc_last(struct iris_inst *inst);
>   int iris_inst_sub_state_change_pause(struct iris_inst *inst, u32 plane);
>   bool iris_allow_cmd(struct iris_inst *inst, u32 cmd);
>   bool iris_drc_pending(struct iris_inst *inst);
> +bool iris_drain_pending(struct iris_inst *inst);
>   
>   #endif
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

