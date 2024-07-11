Return-Path: <linux-media+bounces-14926-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AAA92E827
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 14:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E99C11F264A4
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 12:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3985115B964;
	Thu, 11 Jul 2024 12:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qs1btg7f"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED27714532D
	for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 12:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720700394; cv=none; b=Dqkk6Mw4sDSVyq8EIgsGvOgosNnuN61LsNX0eVXVO0mBwqA82W+TSmmP7JTq1LY4G5cmhkJ33kAZVVZWJPoD5bnCxaVwo+6aAqsw7F95Gll5YjI82sS5ImNsE6SXvpH+iVnYAOnJWoc3UW3DR3scdtcx8TQTY2ehj826pcpwMKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720700394; c=relaxed/simple;
	bh=vam5BQTSEe4vGiw5E8f8xTv0ZY91ZCsGOuYhgXtFd6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ouu51mQ8da7DZmFMWKGLFjwfxd50mP6447K806GYQC4wepDKC2R3X32ta3dQYuhgTC/SpQ1Dugg50ytLXxZdToWUCY7q8Ltv0GUIiBIzVHb4oWd3vcOru/kmHZMAklhYwb/HnNW+MRpcjqB+KvQEa1tBRcORp5poStoU+FDe21w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qs1btg7f; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-36796a9b636so387825f8f.2
        for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 05:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720700391; x=1721305191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R8VLmBAaRi79unaSRfBc2UCQY1MxGEsWkzfoNGJDc2k=;
        b=Qs1btg7fiMtFOM8ncn4oVH7HRsI2/+Q95sMMVMq+s+QVsWIEFHR7mH5S9a06rBTdal
         /0gkNqqfvl/Cbva9b1kR44vVYBfIjUA2F4lF1wq1i9YsWqExbYhFUTNiLyP76DLd3Qeg
         TYwmSnozsgqNQL2iJ7Co98SMzulQhbZJDD7TjUo2bY67nDJZq4hqGeOwMArJKUliBq/D
         DwcghQKwJCuiWgCaUye+3lJuOqZnH8kqQIqd7iKlsXOQcasfQvor7/rnrDe3VKVDO+An
         KDqYol+m0oaKZy+6CRgN6u28hIq+fkPlOKUZveJoDYGGG+EhusgaKDP0uNI/yQvr5Trv
         5TcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720700391; x=1721305191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R8VLmBAaRi79unaSRfBc2UCQY1MxGEsWkzfoNGJDc2k=;
        b=eTRnr8udnha3kWQG5+mFY7NayR2cToqtTJJwjlWIeTt/XA139WXizlJBQW52H4ntbe
         w5bQMJtjByadWzzkACk3E8eqfdEb/5LBsjOY0AmgaHbOwVGmrqNa2Fnn5CFl52vQzg6p
         JT2R2NBWjWhBud2aZH8jeZT/+/NvmDtDvWFJL97NKlCBCZ53gyKRoGnzw4IayZJxLdzg
         x9ujSQYnDbPpAlZFhkuiG5MQJOoWRrkFicnxMfRZAWMvItTbD0pd7VP9eK26kuq9Ng8A
         Vvh9ImLSwGUAK4SBSdH+oST5pVCYJoLW1xMfZIAnoPTwI+kiDAMyKyKKqmhPkmQAyF+t
         VZ5g==
X-Forwarded-Encrypted: i=1; AJvYcCX0keebi8ufg5qBWKXJXr1ejXp0ZSl7mjHweUBzaamEGEIx1U7TbW9yvWbbC5nPQxk0je5Crv6s9Vna9pgSyNhZRMD7A3luk9ciKCg=
X-Gm-Message-State: AOJu0YxhiAlFVGT+UYkP9YWBbn/OJ7Fudbf44twDeoqoLfF94xqEWsC8
	eKhPzahkbjaAcey0bq/IW722GwBQrSEKx58tubzrwGlcldWslHGRdRyJ3A+uP+o=
X-Google-Smtp-Source: AGHT+IFQZsFLLyzTtk6n5XtvpkhGvimfD/dOwR78iKn4PTCZzgaSyQb0dQfjCRBKdQCvxX1TJNZ1Mw==
X-Received: by 2002:a5d:58f1:0:b0:367:8900:c621 with SMTP id ffacd0b85a97d-367ceaca897mr6159414f8f.56.1720700391459;
        Thu, 11 Jul 2024 05:19:51 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde456f5sm7695360f8f.0.2024.07.11.05.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 05:19:50 -0700 (PDT)
Message-ID: <5a9939d7-dd05-4ce8-9231-5ae7af32b09f@linaro.org>
Date: Thu, 11 Jul 2024 13:19:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: venus: hfi_cmds: struct
 hfi_session_release_buffer_pkt: Add __counted_by annotation
To: Kees Cook <kees@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240710230728.work.977-kees@kernel.org>
 <20240710230914.3156277-2-kees@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240710230914.3156277-2-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/07/2024 00:09, Kees Cook wrote:
> The only direct user of struct hfi_session_release_buffer_pkt is
> pkt_session_unset_buffers() which sets "num_buffers" before using it
> as a loop counter for accessing "buffer_info". Add the __counted_by
> annotation to reflect the relationship.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
> Cc: Vikash Garodia <quic_vgarodia@quicinc.com>
> Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-hardening@vger.kernel.org
> ---
>   drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
> index 42825f07939d..1adf2d2ae5f2 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.h
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
> @@ -227,7 +227,7 @@ struct hfi_session_release_buffer_pkt {
>   	u32 extradata_size;
>   	u32 response_req;
>   	u32 num_buffers;
> -	u32 buffer_info[];
> +	u32 buffer_info[] __counted_by(num_buffers);
>   };
>   
>   struct hfi_session_release_resources_pkt {

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

