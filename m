Return-Path: <linux-media+bounces-11264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A072D8C19F7
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 01:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E5871F22185
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 23:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569ED130A65;
	Thu,  9 May 2024 23:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P0Ne2Qjv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB241292C4
	for <linux-media@vger.kernel.org>; Thu,  9 May 2024 23:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715297840; cv=none; b=lhIRGDBmBxrVKX4M1pas+6v6HCEVaijQBh5slSaNpy+Sabt8qDuADLT/+AzBlTykBIfMIff4/xWUiGogkp3KrcDeDT9JWQkcfQflc0RuRyO2S+eTUykKNH+ZMzgSGIW5NlQGDdavP+4BEIi1pRsdosV4MAtdOG/L7cyIkRnZgz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715297840; c=relaxed/simple;
	bh=Epogh9BdoUc3R/FE4T/AdSUKmqdQETFTOEDp6PuP3aE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K9CVDaK6fw1/yM72Iau7ceQ8JTq2U57iJZXtBIp7FdZ6y169M+6E5+Zcv8bQLZiXLabQgi0+vRRhXL67hfgC4yemEHmQUSvh7P8sn4AM2MGud1e8CKoAQFYN5Yh34UQf8awUG5igggc9fd0sUHR9r4uHmvugvtntO40ACpfLGH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P0Ne2Qjv; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-34e667905d2so949145f8f.1
        for <linux-media@vger.kernel.org>; Thu, 09 May 2024 16:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715297836; x=1715902636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9CZ8C9ETfpVeLTKNLsaMAg6oPGHuO9y7DEyZK/YPQD8=;
        b=P0Ne2Qjv48Oyrl/DgjfgF2OeEnOwQDEbpxDN9/FLpbnQwd9HQ7CXE/HNPAlSE7fVmC
         i2rL1f6J+Wud2tz8j+TsN8+n72oRQb/KAS3CeJx+zcgnPZWhuayy9P6MLzg6f760cdBX
         a5c9XkvGMRomSCB78OMi3ySayH5YVMF2kAfzUR6hUYMQNi5aQ9qytgXIQ/l0kBn18kLm
         mgL9vg61Rwzmuuwe6Qcb3XOT4tIlmW5vyEcbu+27rucIshpSUK+vBOnyaSS20gOdMhuc
         GzWoqbMs13swQA24a1gDrjQv02DFvQAfajQsR9L4l9tR0Ks6Wz6Z/22aGe6j5nS2TnGK
         qYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715297836; x=1715902636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9CZ8C9ETfpVeLTKNLsaMAg6oPGHuO9y7DEyZK/YPQD8=;
        b=K293+KTZt4l4WFZPQyv/RUufG+2Lt2Mh2cyp9Uqa2jzGLR8X+a1/TI6moSaBg4/UHk
         Zr2VpLyoGyR6damTmln+9AGG+cN0/bV7HhlmHXuBBiooeLB6sd96LMxT3IqV46Lkvlhb
         O+9ltJnq1c6/81rriJosTIpDnvmKGrvvz/mDA3x87xd4YfWCIns1aRm5xdok/vJsJwlk
         JGpmWLfaO+mRW1Y1C7KJXl7oIAyILKr2ipqGPdNdXYA3pmpRxszrNjjcdhOf9C4wM4dQ
         ngjAJjriQrO2AgxhyL9PsdD5gjam8nJzOBTnaV4EI7TO7kaLRtiy5f/NOwgXqi5rT4/n
         G6aA==
X-Gm-Message-State: AOJu0Yx074ko6wA+ow19spaq3mBSOZTIIVHqkM8/ssz7DTrsWOG5vvbv
	fJ5myP1VNZVHc1jvDrmyFOkf1qEFqb0iu0mhpK3GtCccsWPxxi2iTYZAzp6L74A=
X-Google-Smtp-Source: AGHT+IF7uc43I7escYnk7hTqwMcuRxqtHcDPr16K7tM0z/jOz4Vr39iPccqZYW/Sb33ZugAMVCqRSw==
X-Received: by 2002:adf:f60d:0:b0:34d:aaca:2f6f with SMTP id ffacd0b85a97d-3504aa667e9mr558206f8f.69.1715297836445;
        Thu, 09 May 2024 16:37:16 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbbbd60sm2899990f8f.90.2024.05.09.16.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 16:37:16 -0700 (PDT)
Message-ID: <284a3096-cc2d-45bf-9075-fcd1bc60a599@linaro.org>
Date: Fri, 10 May 2024 00:37:15 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/18] media: venus: Use flex array for
 hfi_session_release_buffer_pkt
To: Ricardo Ribalda <ribalda@chromium.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, Andy Walls <awalls@md.metrocast.net>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
 <20240507-cocci-flexarray-v2-10-7aea262cf065@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240507-cocci-flexarray-v2-10-7aea262cf065@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2024 17:27, Ricardo Ribalda wrote:
> Replace the old style single element array with a flex array. We do not
> allocate this structure, so the size change should not be an issue.
> 
> This fixes the following cocci warning:
> drivers/media/platform/qcom/venus/hfi_cmds.h:204:5-16: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
> index 41f765eac4d9..6dff949c4402 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.h
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
> @@ -201,7 +201,7 @@ struct hfi_session_release_buffer_pkt {
>   	u32 extradata_size;
>   	u32 response_req;
>   	u32 num_buffers;
> -	u32 buffer_info[1];
> +	u32 buffer_info[];
>   };
>   
>   struct hfi_session_release_resources_pkt {
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

