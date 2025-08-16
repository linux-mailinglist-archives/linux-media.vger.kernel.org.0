Return-Path: <linux-media+bounces-40011-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DBEB28CFC
	for <lists+linux-media@lfdr.de>; Sat, 16 Aug 2025 12:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B035A288A8
	for <lists+linux-media@lfdr.de>; Sat, 16 Aug 2025 10:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617FE298CA1;
	Sat, 16 Aug 2025 10:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yZ5U0gRD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026522288D5
	for <linux-media@vger.kernel.org>; Sat, 16 Aug 2025 10:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755341061; cv=none; b=oVLK1G1tpshWnxiR30jXiDZsgwFbRC6sp1E4xh+pblIEG40FA9KosB1hlmngKuMWPb6eCid+rf0BaaeC0FL/zDN6b9vx0m/AoQGw/1fqEoEdA5FrPcPapuW2tz2i06nRxtJv4wwRydgWh7BTpnolZ2QRrpjAWn1Wzahqq+J+c5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755341061; c=relaxed/simple;
	bh=giznPJefi0bbTBjqBQghdivjTXIbW2Tpm3pqNYK8uew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UN4+n82XKIqr6raMUE/42dz3+lD6hz9OYooHNq3rVrcVWetuffvWfpNvioDTF8LdaL775S1xBIaHDBR3gxMkQhtICGpiboyn/LYXdQt3QvIXG8tlYdtF+v84j6Oss4h7/E0+Idxb+++TXM9epjoRZ9+7puL6QA1F6f0PXgUrIhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yZ5U0gRD; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b9e414ef53so2551120f8f.2
        for <linux-media@vger.kernel.org>; Sat, 16 Aug 2025 03:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755341058; x=1755945858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+87OkgEg+mw0Fep350vzSqyIISt8PfhGghcXUeltSrE=;
        b=yZ5U0gRDkM7kCXTL/9zVrdkctEbAXMdBrIUeNeqjQpxROUQo165qBqfAqMPzaN2CdU
         veUFHhisNRhDT3+kSrWDTN2mkPYYZqZwj0GnURS+cFUXzMBPeg7qy1VgD86CwnBo9pq4
         FW1s+X36OdQp8wTj/4mTCkq9UMnVbkJdzwh+BEqaAJZ5yZEHpZ5d+mkxZfOuimMaFAUl
         HSwjmtUjiEuYZOrVpeMdG+zYO7fb5M4gbKlwg90ToPt7WU2yaca2PkqAyGGkilmpNbVo
         DDbshKvbANytRkpIZACRkcKw7OD7Hl8r2F+7snbiAbBkYq56oeouFKNsjGZh5+qlmWFp
         RmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755341058; x=1755945858;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+87OkgEg+mw0Fep350vzSqyIISt8PfhGghcXUeltSrE=;
        b=MCo1gK0hkem7lN7LZZi5wM8JrO9yklpiV9NRk6SFgrsSf6fsNHFRVcLvgbXK588AxK
         SiH5CcMyzagmm7h063rNk0lluLsIYya5EsOP5WgxGu0IDE1ujuzcKQkkmY/v+8TUcP+8
         KGB83sdh0Rs45z7eqPTkw3ffDeKAY5U77OtjVjZ0wZV6VzXYvPwSStJ4LHSooAYSuXNl
         AIsjrhOV7zb6LCZKQpqP1M0Boia7dM+vSsM4pq59EupTIyj0vMj+c2yB9rndn1NjmElR
         lJfg+86+q+QzVim2PKYqt82HSuRcPOLw1H7YQkL3bhcyzm5nR4twKqK3cxvRWWd7Z9tu
         L/MQ==
X-Gm-Message-State: AOJu0YyXiLcnQWSsqWw9d43G3VaD+P+gIGAPeB8K4qQg1Bj3qxQ0m4+s
	HCowftz2PYW9dDjY11j5w9RuPhDmH3umvg6Wn2ugzRxPVk8YR2BqYCYkYb5RLrT72xs=
X-Gm-Gg: ASbGncuiqchacOnLdud99Wzrv7IeBo0s+g6wUHxWO7T8+ljtZTNOTr7PzunkyZA8PKc
	S8yqVLIpB/JPuwixtEp3db4qOmgaUSRaZ7tZW5PwFVJh/Wha18Fj/bOYKTXFeWKTzhtG6q7R/mD
	WZ7qO4Q0VFHtJI6OD+Of106anOLdqfjuEkjFlCxLalNyxg5x3i63T0doVBh8rqOLkF66tPYDR+F
	B7QJ2ZzRTeFE4JPXmze1CALW9G0FRsf6ljE3Je8oeKHNv3F+9kY45lYCeLmT/h7g25CnWXkpnM+
	27YemAeGgsLzvO+NZjObVOihp3/3x3XWsloncYdIqxUY1hF3vmS0Pi3Phi4K9fbU9Nc9E67eLPk
	47nwRtbw9aXNZQEa2Y91bn1Yu2hbjHFxMRQ+psKl8+CKH8+Jdj2VOtWT0QEXxx2eg
X-Google-Smtp-Source: AGHT+IGatrxnRyuYHYANVLY/7vM/kOG3lSGdbl/URxjLIRGA2WFL+5tKlpJurr0CG4KYGcBT0PnDvw==
X-Received: by 2002:adf:e651:0:b0:3bd:148e:212 with SMTP id ffacd0b85a97d-3bd148e0419mr701845f8f.14.1755341058318;
        Sat, 16 Aug 2025 03:44:18 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb68079d3fsm5491248f8f.55.2025.08.16.03.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Aug 2025 03:44:17 -0700 (PDT)
Message-ID: <de539f3c-e048-4e75-8f4f-7d953b2b1942@linaro.org>
Date: Sat, 16 Aug 2025 11:44:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/24] media: iris: Always destroy internal buffers on
 firmware release response
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
 <20250813-iris-video-encoder-v2-6-c725ff673078@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250813-iris-video-encoder-v2-6-c725ff673078@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 10:37, Dikshita Agarwal wrote:
> Currently, internal buffers are destroyed only if 'PENDING_RELEASE' flag
> is set when a release response is received from the firmware, which is
> incorrect. Internal buffers should always be destroyed when the firmware
> explicitly releases it, regardless of whether the 'PENDING_RELEASE' flag
> was set by the driver. This is specially important during force-stop
> scenarios, where the firmware may release buffers without driver marking
> them for release.
> Fix this by removing the incorrect check and ensuring all buffers are
> properly cleaned up.
> 
> Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index a8c30fc5c0d0668cc9980f2fcfcf21072cf9ef0a..dda775d463e916f70da0b879702d96df18ea8bf7 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -424,7 +424,6 @@ static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
>   	struct iris_buffers *buffers = &inst->buffers[buf_type];
>   	struct iris_buffer *buf, *iter;
>   	bool found = false;
> -	int ret = 0;
>   
>   	list_for_each_entry(iter, &buffers->list, list) {
>   		if (iter->device_addr == buffer->base_address) {
> @@ -437,10 +436,8 @@ static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
>   		return -EINVAL;
>   
>   	buf->attr &= ~BUF_ATTR_QUEUED;
> -	if (buf->attr & BUF_ATTR_PENDING_RELEASE)
> -		ret = iris_destroy_internal_buffer(inst, buf);
>   
> -	return ret;
> +	return iris_destroy_internal_buffer(inst, buf);
>   }
>   
>   static int iris_hfi_gen2_handle_session_stop(struct iris_inst *inst,
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

