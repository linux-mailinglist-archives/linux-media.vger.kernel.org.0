Return-Path: <linux-media+bounces-31577-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F8FAA71A8
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 14:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08E9C3AAB54
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 12:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423F4248F55;
	Fri,  2 May 2025 12:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZYvtdJzm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55C2248F46
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 12:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746188557; cv=none; b=Z9wGo15mnaA8Fg25tDhMgbprnWyomESOzj1VQThTuJNC1ssm+J20QLdPpTsJgUH+z5IG6hzDZj3JcrzyTmvelxb/2vG1aXH9thRZte239h7Qvjj+BGfnX67vn6U9y0jtIjUwQndnRyQdh9IWGvkI+A31TRXTNgmqRcD97qUjrQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746188557; c=relaxed/simple;
	bh=GKN/zeU/yMVetfdzvS9ozuLJj3zYNqyKb2B/40dRc0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FBshHbDbj8eB0V30h5e6dp4sAEwKVMrkehWF7mrhJVVa+9au1t1kzzkJ8/ezNKiV+siuLW0YFy7F0Vcv4DojG5PiY5AvsHeXXR6RFMDY6daJiXuuhrmTlsIz4kbpwZROPc/Ogf1DYM1C0MGfQbCqrf61AEuQNcXY+iMZGBTEqF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZYvtdJzm; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so14371375e9.3
        for <linux-media@vger.kernel.org>; Fri, 02 May 2025 05:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746188554; x=1746793354; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AGAl7iJZhzrMd/4At9r/NfBVUJdFKiTG2vzkbY4stpw=;
        b=ZYvtdJzmbGavJoWIl8GcdrkE7MzoQoyYflFbCUpnPBoAwR96tZlBipxnOcbMduh6sN
         XEWe19C79yIVGr9uskUSyvhEmW3keesVD1YRXJsRx2FopQ96c1XijWeEig/h1uM8lcy6
         1rNWvL99zJHUYRYDelqfjl4Vxj5GEMW0tws7hVfDyNjfVaAPBTHXpcUebceRFrU2exG6
         B82es7vxpWeWuxSQWogaCCRhwhAsS8wQU8QtzwZXAYDAViD20oK9F07wguV+F6tYoiAT
         nt+efd9rGjwP8w8WnJNcN0rbkXI0BzGpSfxrIM5Q5BgnSnLWSPBeNip19V4tx1Dc+BRX
         tkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746188554; x=1746793354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AGAl7iJZhzrMd/4At9r/NfBVUJdFKiTG2vzkbY4stpw=;
        b=YtMGsf0PXcLMYAUOfZH85WpEujie+OGhd6I9i0DhwaHSdgLw8Ux34Tu2Dyiye5eN1f
         fV2uDQ4gc7W0lCMpKa2akZXa8UoBZHVUMZAEBZMNkyQ+nHI37WHw1E1z1PiPQpNYMXSC
         Y82NeKrpWBQJMXnCj+fQ8yLD1NCD68SLhHirBwAhhM89zrATtvjbZsKIl4DRTSYzLMRJ
         +WzRJr98s0Ft2lboN3+GpoWJOuvwdP9+JHbr4xrz8p23pj6jAUcAHmcwkRakf+ETFVPU
         5xUmrWN3ByWG/dCrnp8f5tdFBy66Z0i4yySrFmQR8OPRGNiXLlMzdTE9DZfngzg9sDgU
         +XPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi7AOzRN9ieB4odd+KtxVHJoewLTzn5Nc1HiANoesa4IpMwcU8CTeMrZwC4Wq7Sw7hZq8pHKGW7bVJVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOXWilvwLAFgSQzKVI3V6i0Q9jyA5xjf94Sc2IPNo9GlclbrPB
	8h9UaPgQS+ow44H+h+bNXHCcfEsS2H3zWbGSt0wTNP+b0Utz2ZyamUZI7XHkR2A=
X-Gm-Gg: ASbGncuvFxWwc5Cvfzaans6OwZuW9pRw/Ib6VcTUGD0ZlWIyJVqa32G7kNQHRHFAUl9
	BpBJGF4rkPnbo8RzNuaTRXugarBbxaAaNuTl9eiv44OCbL4+N3recJOi3IB+Fva26gYAKqj7bOX
	3SZi5AGUgSTgunQAsY93fBfwrV99BJMSgOE1PuPG2AIiRxga7R0njq2svVtuOi14XXAkiJ88bEK
	V+McKK/in5X9rhREoz3rI8Le8Yh7mtHGXMIjA8c17W1QXaJ3mNpxe31hUdOx39p6zF6s4wPWuZm
	7QOEEyyLfkV/3hIUiMjAf02ZU5sxfqnEdpKwrIIkz+kd7TtpIxZ/FIo6g2AS7dEblR4AJP0jLVT
	YX6bGunpmVq5yvyjE
X-Google-Smtp-Source: AGHT+IGAup8pZea6zJCXydbst81V1n8k/rAt9qOxSfiYhbAH8b2I5VdLjLvIPf6UJhHnoRz5UGJn7Q==
X-Received: by 2002:a05:600c:820a:b0:43d:7588:6688 with SMTP id 5b1f17b1804b1-441bbeb30aemr25881475e9.12.1746188554115;
        Fri, 02 May 2025 05:22:34 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2af4546sm90036325e9.22.2025.05.02.05.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 05:22:33 -0700 (PDT)
Message-ID: <250cdec3-1437-4c45-aab1-0428218b9437@linaro.org>
Date: Fri, 2 May 2025 13:22:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/23] media: iris: Prevent HFI queue writes when core
 is in deinit state
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org,
 20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com, stable@vger.kernel.org
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-5-552158a10a7d@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-5-552158a10a7d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2025 20:13, Dikshita Agarwal wrote:
> -	if (core->state == IRIS_CORE_ERROR)
> +	if (core->state == IRIS_CORE_ERROR || core->state == IRIS_CORE_DEINIT)
>   		return -EINVAL;

Instead of checking for 2/3 of the states why not just check for the 1/3 ?

enum iris_core_state {
         IRIS_CORE_DEINIT,
         IRIS_CORE_INIT,
         IRIS_CORE_ERROR,
};

if (core->state != IRIS_CORE_INIT)
	return -EINVAL;

Cleaner and more explicit - declaring the state you must be in, as 
opposed to a list of states you should not be in.

Assuming you accept that suggested change:

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

