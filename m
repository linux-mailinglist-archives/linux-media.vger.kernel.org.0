Return-Path: <linux-media+bounces-43833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5A5BC138A
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 13:32:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 960C93A7355
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 11:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6168F215043;
	Tue,  7 Oct 2025 11:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pt1FOcF3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CA678F3A
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 11:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759836746; cv=none; b=s32rTOLIWMbBdpHkzSlo7Zrfpiyr2o16IWUMR+nBo+lKNfPcjtjfUoLKUsmSVybrM5B+OiNxjFWArV99KOu/rVBMmhdSK3b3WJCNL4NM6zSRI3b2Wr7obQvo3ATFyZoyPQpHHk2AYvPGqYEijRjdDDu+MRQrXK2cipzAf7oFuu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759836746; c=relaxed/simple;
	bh=A4j+7JTxsbiZRzdRZU7yWqXtGFdx3Ok4jN8NDV+qcoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j11BgoxnDukoMhX4NYpDVHNZseGBuTydl8d8Zbl9isJecSt/PcgyJ4N87yP2Voo7O4A3jszn0yed4wFuPyXoOG5M25bxyGrxmXQEwEMtKNR2/x6YMb6kmC4SQufoZRKn31YNS5/uBjjLmyy1kHeAoUA1BXDnhF2ZWuRSpSlBUZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pt1FOcF3; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-62ec5f750f7so10356845a12.3
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 04:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759836743; x=1760441543; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZC6d70RCI062m/NmlsWdu8eeof6vN1BlqZdvcy2VsBI=;
        b=Pt1FOcF3RTBT5yloMcq2p9lwgpCN1IgOzyOmI1JflZvqpN80MCkjKkD3lTi9INjkpK
         0PRNpeU2G4v3oyi2EeyDt47h2rf02Lc86qf4wpOl3Kqr3b7gH25d1Z1S1GCQ6+2Aee5H
         PFmIDTVILWL757DkV0L66wgBlQQVHb4UyeKDZcJKCysc7NaOVJ5s8bgRAeLNhN+ocvX4
         lK4JzeuOE7pqyoqFyP2XeSXmho8L3h19tiankhIHpRqRzzLgIXNiyaoX7gORPuITKIow
         MnXBE7GnzIw5TzpJIomffd/yHLq19B4tp/vX6NGwe0ROZQ+N2fP3Gk1bAD96vz8Jw8/a
         B6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759836743; x=1760441543;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZC6d70RCI062m/NmlsWdu8eeof6vN1BlqZdvcy2VsBI=;
        b=U5wjGTNUVuyAwndt6A+6IEib7iKT29zCgndLXLZWpDCRFK8oMOdsBw5upHFa7DB8bq
         ZWcCi3hd/id2t+Vd2SOS4ff+x6+prULPdnijDB9rkqg3p2kIVyW9qndbQcZfhsvCJN39
         +5SJ1eHtz+Y6SeOiowG1ZJJI3cjfdAJZjPXfJXDT6UM5fnWxcdGB3JurvMAPlBgbd9dX
         quEEI8TuAc1s9HfVsynY9f4GjwgLRDvb5f3TcxtEgWzyAH5i5GiBWCa7l5X1NVXi7t9M
         3VITOguR1vLbhkMGScb/Nlo/yOl5vzUI7y6Dkbt/7llqkO784z/rJz+irWQOxNB4W9fB
         kFAg==
X-Gm-Message-State: AOJu0YzRIu+tdanChKoIOP6aN+z7tdkfF4cvrqyES3KA7tFJOL1jpVs4
	of0JRhHrd56m1M21jq9ptio4X0FqRzhBFzYPZuCkW+5DuOu/VfuHGIS6H7cvdHQOtMo=
X-Gm-Gg: ASbGnct9ctRWuTvOkQybfn2EnJkFclsx6tLl43KtKjSBbf9mPoZpKO0T/Dn/kMTTu4C
	KK0mat/qXOQC0nc1qUdrh4m9kxu46mce76oT3LgcxZPANOaup6h52R25rrxLmJxSVKgesxpIaAj
	C1I7D5kE1DQttNqDf79ISJxCupS0fVz+Bs7aU9V/dVHg+IEIFKtohA4m0b6WImOrb1tqTfosS8F
	yljCDRF5f5J3Xsk4AMNdiDrZwWiUP2m+Q3bcz6EwB0nVN0sFGBKQ35xovZarkH5JDmDa7AGjLfb
	QHTmCrr8yG8fqbIvSeGNHMDYZyXOxoOIMZrh8UJL/X61mWkaOrY8MaTmjOk9yaiba7ehBn5LvnS
	STrPV8GQBAFgCJkhukc+Px+e4Pzzv50fxgwKnwmbp1Dx30LNIswXEOtcZCbSRWf+0CqgkaI9qFn
	PwEMhPgvTIG48M1av+
X-Google-Smtp-Source: AGHT+IFjZJgPkdCZvczYKSg21gtQzjZuEg71RmQ8o+OjBKMXLb1coIMLo0/KuBwAPewegCHdx5P6fQ==
X-Received: by 2002:a17:907:268b:b0:b40:6e13:1a7f with SMTP id a640c23a62f3a-b49c2a5788dmr2192509666b.27.1759836743118;
        Tue, 07 Oct 2025 04:32:23 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63788111f1fsm12371986a12.36.2025.10.07.04.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 04:32:22 -0700 (PDT)
Message-ID: <3a07850b-90bb-4035-91ce-9f361c635df5@linaro.org>
Date: Tue, 7 Oct 2025 12:32:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Fix ffmpeg corrupted frame error
To: Vishnu Reddy <quic_bvisredd@quicinc.com>,
 vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
 abhinav.kumar@linux.dev, mchehab@kernel.org, hverkuil@kernel.org,
 stefan.schmidt@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <9UYDQ7nzBQ9Uqb5q4mG8WWKGLEZNPSvgV1vw6mmYS0wY2VKS5F11n8IaesvJsKYBvndy99tKFqGoak5MzQVZIA==@protonmail.internalid>
 <20251006091819.2725617-1-quic_bvisredd@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251006091819.2725617-1-quic_bvisredd@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/10/2025 10:18, Vishnu Reddy wrote:
> When the ffmpeg decoder is running, the driver receives the
> V4L2_BUF_FLAG_KEYFRAME flag in the input buffer. The driver then forwards
> this flag information to the firmware. The firmware, in turn, copies the
> input buffer flags directly into the output buffer flags. Upon receiving
> the output buffer from the firmware, the driver observes that the buffer
> contains the HFI_BUFFERFLAG_DATACORRUPT flag. The root cause is that both
> V4L2_BUF_FLAG_KEYFRAME and HFI_BUFFERFLAG_DATACORRUPT are the same value.
> As a result, the driver incorrectly interprets the output frame as
> corrupted, even though the frame is actually valid. This misinterpretation
> causes the driver to report an error and skip good frames, leading to
> missing frames in the final video output and triggering ffmpeg's "corrupt
> decoded frame" error.
> 
> To resolve this issue, the input buffer flags should not be sent to the
> firmware during decoding, since the firmware does not require this
> information.
> 
> Fixes: 17f2a485ca67 ("media: iris: implement vb2 ops for buf_queue and firmware response")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index e1788c266bb1..4de03f31eaf3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -282,7 +282,7 @@ static int iris_hfi_gen1_queue_input_buffer(struct iris_inst *inst, struct iris_
>   		com_ip_pkt.shdr.session_id = inst->session_id;
>   		com_ip_pkt.time_stamp_hi = upper_32_bits(buf->timestamp);
>   		com_ip_pkt.time_stamp_lo = lower_32_bits(buf->timestamp);
> -		com_ip_pkt.flags = buf->flags;
> +		com_ip_pkt.flags = 0;
>   		com_ip_pkt.mark_target = 0;
>   		com_ip_pkt.mark_data = 0;
>   		com_ip_pkt.offset = buf->data_offset;
> --
> 2.34.1
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

