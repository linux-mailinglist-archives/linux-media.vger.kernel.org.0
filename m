Return-Path: <linux-media+bounces-3892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1E8831E9F
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 18:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD27F1C22EEE
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 17:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE7A2D04F;
	Thu, 18 Jan 2024 17:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kNx2ZLxA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAB82D603
	for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 17:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705599904; cv=none; b=GDqQjj5Ydp1L+bbz5/Mkb4pKyXrOCjXNV3k41SrzmzL+G+1qlcz8IIxK4uk0bvltF0DtDnmc2ZOe/5ACba92C6TgOudddDMFNjbUKN45+1Bg8aubuofZR8rJTphX9EQAUUqyaFRPXeZMrBzoE/JB28tcl4KG3IFXKc6cJwb/iRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705599904; c=relaxed/simple;
	bh=9FmE4PJJMHUJcOAmiwnAx4z1xIV4aO2a5RhnwfLZmL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ijmiv1WlYGd8OIRvxvFUw0NZu0tcC7O1bY07OqIin8BZ6Vz9+Qtw6Ruz65klZO8tF7rsqNcHI7mWKN6ORj8kCR8ISqvP0aW4NEFsTWqXN/LyFuAdECKHqIjtXfDZs/fBkIv+yH18qfNA+MRv7pe5ZcwIY3+R/azRCR/BYbWA/ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kNx2ZLxA; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e80d14404so906066e87.1
        for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 09:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705599900; x=1706204700; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NSfW+YUfmRkyvf/SzyhIkwxnaiEK9UQEjvnNWE6tnVg=;
        b=kNx2ZLxAub2oFRza92YPo+U9X68g16/g9XEDK9mbUgQY+9iiZLP5NL1q+qKFHkKmn6
         QWeiSNzKagj0dFKV1kOfTVD45uZDcjykB8GVlI29nheM8deoxAt296A9QAVzBixWuA4X
         ZVxBqXnOSrtNr0A551Mn0IL0E5ukn4nxJVFQiC8eb/fotwXrgc1VIPkMi6W8uyYtzDFt
         N2XM20v+/mcJ/+3P75DOEQTJTmfNo1Evw/jGthT9yTOKD9y5RsxaVOShj9BM2ui5eCUN
         U2nKoR2nB2Xw9EFZyyHIK25hTkDbfThOwc5v44RfNj2hbeRReXJ1rjW/9iKplMc4MSg+
         kNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705599900; x=1706204700;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NSfW+YUfmRkyvf/SzyhIkwxnaiEK9UQEjvnNWE6tnVg=;
        b=HJC+LIkNRxGl/Dk6uwLb3TwkJ2Quh/lxI+dLg9zg7eC/ObqNiObUoUkaNPSVl8uSJD
         H2nD1LpIO9eWSqCxr3aOJop7IZ8aQd3G5uFAUzckunbDGq19A3V1aKm64twMWZqowPSQ
         wEfBTq3mqxJkMk3x5+u2GKd7JdM756659apJuoVQcF7ONOSABKRnTkZ/tsdU+VA5FXNJ
         yN7L3IWVPJEAhGVacbcEkBRyWj1wIrRGst0iNLktHn8/GCBQHF62mfD4VW4Ab/ovqkr7
         OItv64fJ46vL+itJp9heDETJwUUPHqH3vBilUGwJsdyMpdLDZwKeJamz8CkV69APfXXx
         xnEA==
X-Gm-Message-State: AOJu0YyVa6os+4Kz+OBDHfCbWOG+rv4S2/1Pb0UI9s52F55s1V6igrQk
	8tKKtGsKqJGr+pi/eWYch1d9JU7udDC7eAD4MRF77SVXWt6U4N+b3NNcpvKVk+s=
X-Google-Smtp-Source: AGHT+IFMZMNJ9hclYGahC7K3qfbzmRSnW3OqnqmNUQR6BgamVW7SW02oVYX9Erny3j7GZr3boHA+kQ==
X-Received: by 2002:a19:644a:0:b0:50e:e1c3:f97b with SMTP id b10-20020a19644a000000b0050ee1c3f97bmr1859018lfj.3.1705599900074;
        Thu, 18 Jan 2024 09:45:00 -0800 (PST)
Received: from [172.30.205.26] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id k17-20020a192d11000000b0050e9323408csm716228lfj.57.2024.01.18.09.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 09:44:59 -0800 (PST)
Message-ID: <04a364e8-534c-40a4-a031-b9f9d2304c39@linaro.org>
Date: Thu, 18 Jan 2024 18:44:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: venus: add new rate control type MBR for
 encoder
Content-Language: en-US
To: Sachin Kumar Garg <quic_sachinku@quicinc.com>, hverkuil-cisco@xs4all.nl,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240118105934.137919-1-quic_sachinku@quicinc.com>
 <20240118105934.137919-3-quic_sachinku@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240118105934.137919-3-quic_sachinku@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/18/24 11:59, Sachin Kumar Garg wrote:
> There is no limit on the maximum level of the bit rate with
> the existing VBR rate control.
> V4L2_MPEG_VIDEO_BITRATE_MODE_MBR rate control will limit the
> frame maximum bit rate range to the +/- 10% of the configured
> bit-rate value. Encoder will choose appropriate quantization
> parameter and do the smart bit allocation to set the frame
> maximum bitrate level.
> 
> Signed-off-by: Sachin Kumar Garg <quic_sachinku@quicinc.com>
> ---
>   drivers/media/platform/qcom/venus/hfi_cmds.c  | 38 +++++++++++++------
>   .../media/platform/qcom/venus/hfi_helper.h    |  1 +
>   drivers/media/platform/qcom/venus/venc.c      |  2 +
>   .../media/platform/qcom/venus/venc_ctrls.c    |  5 ++-
>   4 files changed, 33 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
> index 3418d2dd9371..95fc27e0dc7d 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.c
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
> @@ -645,17 +645,33 @@ static int pkt_session_set_property_1x(struct hfi_session_set_property_pkt *pkt,
>   	case HFI_PROPERTY_PARAM_VENC_RATE_CONTROL: {
>   		u32 *in = pdata;
>   
> -		switch (*in) {
> -		case HFI_RATE_CONTROL_OFF:
> -		case HFI_RATE_CONTROL_CBR_CFR:
> -		case HFI_RATE_CONTROL_CBR_VFR:
> -		case HFI_RATE_CONTROL_VBR_CFR:
> -		case HFI_RATE_CONTROL_VBR_VFR:
> -		case HFI_RATE_CONTROL_CQ:
> -			break;
> -		default:
> -			ret = -EINVAL;
> -			break;
> +		if (hfi_ver == HFI_VERSION_4XX) {

So, only sdm845/sc7180 and friends support it, but the newer
SoCs (like 8250 don't)?

[...]

> --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
> +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
> @@ -387,10 +387,11 @@ int venc_ctrl_init(struct venus_inst *inst)
>   
>   	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
>   		V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
> -		V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
> +		V4L2_MPEG_VIDEO_BITRATE_MODE_MBR,

Is this okay, since you're claiming only v4 supports it?

Konrad

