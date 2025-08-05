Return-Path: <linux-media+bounces-38900-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE2AB1B032
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 10:30:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 853C517AA11
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 08:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B38B256C84;
	Tue,  5 Aug 2025 08:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IZCCYivz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18F2253F11
	for <linux-media@vger.kernel.org>; Tue,  5 Aug 2025 08:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754382600; cv=none; b=O/dLGblXMUv6GZ7bN7t3W18v4SG89QjTwEV89MzWo3o3JbuHywTppLDRyScmNv8EQFWtikHKq43R+qBlc9nQjNNpEiuFPbWii3sAZs2ig0az/RaCapTs7XAkYDottHBSjBphM8oHxk3w4ULT7C3Z+9cYYlXTLXzqfirOtS0Xa8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754382600; c=relaxed/simple;
	bh=vwzQhfg01r+binZbgcr7a/QRd8jw9d+nqmk4LD/Ao7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nnGDW3swVfkRIjJyVDf5Kof6NCZOIGlRiRXWiBvYPsqTs+y2pscoKfPJQhSBqelrd0zpte5Vwf+fs2fEWkWXLlpJLAUGDkoq6+yIRdoOiF10UOJYUR9EAtdKlqsCCvBd4HTN3bShx0BTu9RHpLAcY4HRFG0C/cDZQPHbcOApvsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IZCCYivz; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b7910123a0so5185556f8f.1
        for <linux-media@vger.kernel.org>; Tue, 05 Aug 2025 01:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754382597; x=1754987397; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LyLVSQpb0tLUDxNzw0tajIN36UwJANGlESlbNcPlm/w=;
        b=IZCCYivz1UdBYRbyqXOFsSsdBD+OVewZ2mq5hBYhG3Ysk4YBNTV8sTXheoEQ7WccX9
         0p1QNCnqkUZ1awpVfCwbDdmD7Gx1MHFIQ6rKdeZlZy/JsiZL4HMFpV+GKt4atwHu+hwj
         tHtdzZ3pFFJ7rrBGj4AkirlShDMOaOWqQmUzv1vvZPzmx+2zowDn8Gtziu5dSwIql7DF
         EYTg/5E1vZnYkFv/KRWjoukykaO/P1H6jOwG6U46ubKnXR33QCUVeYEBOkUe2/QD4ZsO
         V1BfJK/0HXhtaS8h/X+GophK3v23cg9GNetIO8xAc65kI+YcSf/gKhRtwwFxUYxKm7Aq
         ra4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754382597; x=1754987397;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LyLVSQpb0tLUDxNzw0tajIN36UwJANGlESlbNcPlm/w=;
        b=wwVgyRL0pyaH7lo39OiLIGPoewejsdKGPeDwrJoMUo3GQV9yl2g/ZnkeIBR161y6gC
         C0n0iSd7/UuTcuOikUZqZ+3diTzMf4OfGXh+FDhUTFCS2cP+VP3+yUNE6ChBFYgDHrM1
         yvRz75nQUp2kbdwlhma98IUh5++nk2rhErTnaM/e5CG5UGuk1HUqja1DwGqpajl/ZDus
         D36qwo/hD/MktPUXvKiIgEAMGD6yl9Di6RQDXaX3VuGxkGDOowVoskkgy2N+80woPi6u
         kOnOkRqmJ6Yw2H1dkMKZqIsETU5Oa1GfXSWAtlCmm4otg1E1k6Sd9iau/GAqbG9aaWS/
         523w==
X-Forwarded-Encrypted: i=1; AJvYcCX1/B6Niclx+YWk0qaBilgHVz2uI8TrWYMgF/+bk7gf3hJsbKynLERSy6E37Kx1oTM6t66qrhFeunHG3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YytTVO55xuxFr6C3ZYQrXuCQ8aJZcWG1FzcmPFd/MbrcAf4d/Gx
	V+Pd6YmeD2cW+KUj5aTU8aw/P2ao4piVmqPzp3qL3gqDVadKw3Rzg8U0GWZk51E+YZY=
X-Gm-Gg: ASbGnctR7g0ccLtYc4EbsVJ11wRxidTIIiNd8Tkh4Hi4WiMD3YpGkt+MnmqUsggeZIW
	RnfyU8EcEN7a7EC1jX01upUiIFnOYXYZTupaxPXUL3vS0Wunl7N8W/TsIeomv6/TVgALzrT1DUC
	xMJXjQLgNfZQN464wR8YQJ0//vZQ8XClcZQCarRZso87M13iCz2JbHnoxjLc429tSu15RrfQMa2
	fkV4Sz49Utk9FSJgJuxQ6rEpyofyb/TEwt5+L8bq6IkIHJYiZ30uHmPwQPb6rQcx0kNBU2wPdFQ
	S8u7T+CO5KSe88LyjMqN7pBzaqVGUNE5ZrpE39sBlkeGLAwsqCS/nB4kWDAUNVzmL7S1f+G3vUb
	jU/NUrOGQj+IbiioWlkXG9kprnlnzOqbuwKgf4It+1zLp5wUVueW71wRVEocyqbYX23G/3qajhw
	==
X-Google-Smtp-Source: AGHT+IHxXn2yLf/O2bw0wSVQuR2yrp3qNWp/lca6o04wzOt6BocP+pKYn0NEJrwyp2gbNHx+3bV2CA==
X-Received: by 2002:a5d:5c84:0:b0:3b8:d79a:6a7d with SMTP id ffacd0b85a97d-3b8d947167fmr8598420f8f.13.1754382597141;
        Tue, 05 Aug 2025 01:29:57 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4595cffdb28sm98597745e9.32.2025.08.05.01.29.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 01:29:56 -0700 (PDT)
Message-ID: <a5c292ec-e59b-49f0-9681-a990128cbdfe@linaro.org>
Date: Tue, 5 Aug 2025 09:29:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/7] media: venus: Define minimum valid firmware
 version
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_dikshita@quicinc.com, quic_vgarodia@quicinc.com,
 konradybcio@kernel.org, krzk+dt@kernel.org
Cc: mchehab@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-3-jorge.ramirez@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250805064430.782201-3-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2025 07:44, Jorge Ramirez-Ortiz wrote:
> +	if (!is_fw_rev_or_newer(core, ver->major, ver->minor, ver->rev))
> +		return -EINVAL;
> +

This is the sort of error case that deserves a kernel log.

dev_err(dev, "Firmware version %d.%d < minimum version %d.%d\n, etc);

If I were to try booting venus with an old/unsupported I wouldn't know 
why the probe was failing.

---
bod

