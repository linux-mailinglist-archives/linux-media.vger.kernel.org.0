Return-Path: <linux-media+bounces-32408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 469A5AB5807
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 17:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D6387AF5C6
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 15:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2CB028DF0B;
	Tue, 13 May 2025 15:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hJiw6hPi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EB21ACEC7
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 15:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747148808; cv=none; b=rtJNHiD9OfQYqJ0L0TN5a52xceNQEYJ8p1Am7Gr6kyMW4HZ+1TkN0AmpCYeR1XFwAQW0Qz7P9otp7rohAz77MFPVuvdPZe3bQoe2OtyCg/spE9Z0AA/JnECpn1P04yHe/rQhVxQQJH0arVBake+DKGv2dOrUqyjAuxJhywXh3hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747148808; c=relaxed/simple;
	bh=QJKApr7XJNXpjR44GNJ3GfdVDAk49SmW3369Yfifhf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hN1hotMgMheyxuKeHRieFz3cGy7M+9p1LtA1lGMF8+r8XjJC9TjxJcKuRkOFDXmsYwjiN/Abon0iglem5G5y3z/Xsa2El92WmnUSl4EMIeX7PFOEF06M6udph9Bwa7DS0bVH5tgG/BgwBxKoUddSZpDZXqT1bxtpCSu27TtlRWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hJiw6hPi; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a0b646eff7so4929822f8f.2
        for <linux-media@vger.kernel.org>; Tue, 13 May 2025 08:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747148805; x=1747753605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=erPCsUBPE+n+nRQoLBs46ePmP8dEM7YKPcXt3baYKPk=;
        b=hJiw6hPiysQT1E06Xp+MYAluWfwnL/zZU/hgxMRF4G6YUqBz2ZY3gMyNGJ5EItuTo3
         15Iv85o+HT5vVyLYiaNnfFQKaGaEUsqcFw0FcNiljcvhaYjExqTFiw9tChNOi+TSDxgj
         xuepXtl9F0mmM214dcmQDxJCYM3Wn1YZtGUe4S3dxYbkExbQL3qrM+KJWUZTHEYKOIGH
         FsC6morgwfFpCEmEL1TAIx58GEeCmoWAow3tQLNianem9J4H69KwRotwUYieN1yevLbr
         EfQpoZ1NvK6AGVXY4SqlIKfM/fiX+YGF8cWwGm7zIxqBTmh1blJll8ZHXsVt+nQDLSdh
         N2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747148805; x=1747753605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=erPCsUBPE+n+nRQoLBs46ePmP8dEM7YKPcXt3baYKPk=;
        b=to/KI0FClDZus9Rlh0CUYXN59GHvduZsMbA29uIEh64v7csGSBooRs5CM80mg+y6zq
         TqcxOFhu8t2q9wMU+UYBQzfZe9fWIId7I7wyueMdC3+OZ25jqBKwXaq+4nWcZgcxOECG
         grxB89Hzx7busyWK/cUwVUqndulplzjDnhVAzp4MxP+0lwm2QV7yY9SGYR701UQAmI+m
         qWNe5Cx8OyfUwtUqe7V/EyxbYdmWaPm+GZ+1skjNJRWhBaa1cu693Gw+WNf+wOx1joFl
         KXFlFPQ4z6Q5D9wzh7EtKKIsAhElZQrXe6E6syILB2ji3DTtJfYL0UwlUt48+byr5l28
         UBuA==
X-Gm-Message-State: AOJu0YxPIex1ZiBL234Tty9vY5bkvu/QPNN3ORFHrDlZHdLduympTte1
	HPOVd756zU05U1JGaBrvziokxs2JCZXxoHMC3YNk3lNKvnPppOCSSf0Ol0pZodbbgPqWqGom3XH
	5J1hRZg==
X-Gm-Gg: ASbGnctxhojHExFvz6Yp/Yt3CaBsOer1Oh6B4Yp9tuu0SJ5jjGDG6NLhRILTdI0hDii
	ctwo5Mt24M8qk3lSo3nixsd2f71fCNNzzblq0ZD0C5SG8Pr4eWRipxEh/i6vPbhPLvLZWGP3Pmu
	HdVdgt+CHLUp1vb59JAdnFJ/kemNtTL9d9WtltK8zojsPpfb1v8CFpLqFpKCFODRVsFMYB2X6gp
	lhoqufXilLp/8IlU1T8wBQmgjTo3mY4wXpdQ+jBPOZwAK+kwRHQSj8Sa0yC4fzcPlcIZLuKUuBY
	l3YaAmpHmuE1u1cWh8boiXUkXZkrzlrd0hDRfwmr6r3255fmHIkTZE9PwlGbQGzmn1XkdgajaHe
	J0MSlLb32O0CGNA==
X-Google-Smtp-Source: AGHT+IFgBEqOGN7/vq6eVRhhgQQxF7mXCUlFJVI50PSYPqMAYmlyn6fbQ0E2ootYEZZVkAmqGzuDTg==
X-Received: by 2002:a5d:64ec:0:b0:3a0:b8b0:43ff with SMTP id ffacd0b85a97d-3a1f64577bfmr15079655f8f.14.1747148804805;
        Tue, 13 May 2025 08:06:44 -0700 (PDT)
Received: from [10.61.0.125] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2ca31sm16648232f8f.65.2025.05.13.08.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 08:06:44 -0700 (PDT)
Message-ID: <6bc6d93f-6d0b-467e-bf9f-784a40ef2207@linaro.org>
Date: Tue, 13 May 2025 16:06:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 9/9] MAINTAINERS: add myself as a CAMSS patch reviewer
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <20250513142353.2572563-10-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250513142353.2572563-10-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/05/2025 15:23, Vladimir Zapolskiy wrote:
> Add myself as a review of Qualcomm CAMSS subsystem patches.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6dbdf02d6b0c..9b973c0128fa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20135,6 +20135,7 @@ QUALCOMM CAMERA SUBSYSTEM DRIVER
>   M:	Robert Foss <rfoss@kernel.org>
>   M:	Todor Tomov <todor.too@gmail.com>
>   M:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> +R:	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>   L:	linux-media@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/admin-guide/media/qcom_camss.rst

Acked-by: Bryan O'Donoghue <bod@kernel.org>

