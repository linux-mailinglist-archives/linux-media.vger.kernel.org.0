Return-Path: <linux-media+bounces-11348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCC18C29DD
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 20:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D2142840D5
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 18:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B43B3E48C;
	Fri, 10 May 2024 18:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WNuYz0db"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8222C683
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 18:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715365714; cv=none; b=Uu3dqtlhsLgemHAGQTXWl753rleNEpOwPslVQgsraW2Ku9UzTsVuWPCEd6pgK1oltqEru7olCvosIhwBT2jKOikLSl9IkVf6py32u875rOBO2LUOFw+GcEBMAH0WxmOq8sLt2vQRQbKZbh0QOWlHhaXqx8aKH2tqH6TNuSn9Ox4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715365714; c=relaxed/simple;
	bh=noS0chLiJMj1/jnm6DHAjcxF+XaKoOtbEABT0PJ+oAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uV/tjlbmZLgRURFGDnRUio1n19MKkv2rM+7GW2SWEK3UNdOgd+Siaq/elhcyDLaYxobLuAVwBvcN+AypiwFBM3jioZD7nPwK7KZkQvSwdlbU1CDe6OscsEo/Lj8HTSDlKglw0MuP8LKO4hm5vR5IfQWAgAtdFTArDMPR6gRm6oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WNuYz0db; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-41f9ce16ed8so23366145e9.0
        for <linux-media@vger.kernel.org>; Fri, 10 May 2024 11:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715365709; x=1715970509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VkDGKRSdcvRfyhHhua0JGhLQ3Tca+NfnsHQpFiYqb5Y=;
        b=WNuYz0dbd3tKgyPXe0itbor5rXM1mhiJs7J83kVwBHOuUhJLLLTOw/SvcTyaZ3b5KE
         ig/arGMDa0cDKWxdYIV5eB8yNrK3jo4kYivBx/7uozjTVyVQD07lKqZZprsd+FLnrqQT
         SnJhO7GLn0HXp1ZmS8nmfIjk4PulJNuycpD9XfXBHarh22sXwBKJOJwDke/uNZJtkUo/
         ZzxEAdXkZiGh6QuhLmANPbHFxXk04hAe4SwC8xKcBt9sSQ0rsOAyttCs6KEb/T1g4psC
         yCAXd7AoVvwNOIZsME+Wo8DE2AMMbS7BfDQOtBhW1VcREKjS7nwdyD0/JxB4iHYyOBQm
         XEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715365709; x=1715970509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VkDGKRSdcvRfyhHhua0JGhLQ3Tca+NfnsHQpFiYqb5Y=;
        b=GWv2En9ZjQbeAzSAX/vnEV6CGbiPeOgB2Su1K6G+vnrT2MAZKWSghm9StMAZ7+kVrL
         SvQo4JOWNWFJYf02qUQ1xpZ8Ol4+tfGVJCklSl7FaACPfLf+hLDBob1OmcLkMFMc7bi6
         4SrtZE1JLNfOlSafeOk4Pe+5i634RHPctSiDrvYS0+J+BWgBvkiNBfM/oBMokzghKKLQ
         816tZAioD6rWq0NhLoxnNh5CObTVHFpakS1DuVmcaSioKs6uGgyJWpoGsqa1QaqDTr7/
         weQAF2IWLp9hOd5o7dnVu/xQ+qJFfI4R4xB5UKxdKFnRMrralVc0RFhDN5mMPsmQdHDK
         zVSQ==
X-Gm-Message-State: AOJu0YyIIrpDp3i/fFLOyZTvUooIGd3640L1+N5jx43toTlqs47XzfLc
	tVOY97e1W9GD2LgnhUszQxCiDZKhE8qsvWR3U7T0W/ivzuZOljTccQO0cmgbDk0=
X-Google-Smtp-Source: AGHT+IHhJ3IWUTMpEukV13lgqod/3Z/PRtQUZZlsHBtLFo1n8NpATl37KHiL4lU3REc09zwtOZz8nA==
X-Received: by 2002:a05:600c:4707:b0:41b:edf4:4071 with SMTP id 5b1f17b1804b1-41fead64731mr30877405e9.35.1715365709660;
        Fri, 10 May 2024 11:28:29 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f86e7e340sm108333665e9.0.2024.05.10.11.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 May 2024 11:28:29 -0700 (PDT)
Message-ID: <b3242c7c-a55c-4d81-bd64-dddf3cd57ebe@linaro.org>
Date: Fri, 10 May 2024 19:28:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] media: qcom: camss: Move format related functions
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240411124543.199-1-quic_grosikop@quicinc.com>
 <20240411124543.199-6-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240411124543.199-6-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2024 13:45, Gjorgji Rosikopulos wrote:
> From: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> 
> Move out the format related helper functions from vfe and video in a
> separate file. The goal here is to create a format API.
> 
> Signed-off-by: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
> ---

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # 
sc8280xp/sm8250/sdm845/apq8016


