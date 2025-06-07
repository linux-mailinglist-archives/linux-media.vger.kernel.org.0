Return-Path: <linux-media+bounces-34286-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0289EAD0C0D
	for <lists+linux-media@lfdr.de>; Sat,  7 Jun 2025 11:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 173813A4777
	for <lists+linux-media@lfdr.de>; Sat,  7 Jun 2025 09:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF09320B803;
	Sat,  7 Jun 2025 09:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gnFYN7Da"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648F11FDE09
	for <linux-media@vger.kernel.org>; Sat,  7 Jun 2025 09:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749287793; cv=none; b=eLjM0WxDDcXC3Jg06RjfbWs8Fa8PcBMJuup8v51XX/sMD9nEiK4Xv0xaH4Dz5agpXe5m/p3l+cL3n3lAsvkN2K/vNQwnlZcfEsV1sug4GxaG4Yz7GvhvngXJ3wX0mQzTM4NbEK2IY5fXji4uIhy7QplqJzsQev0jrk0W5ffEn7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749287793; c=relaxed/simple;
	bh=6uCKdNG+RvUmHq81VMYy036iNoiJt2ExQMxgWhfmRfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GHLcyRv+6xk5T//hdnzdt8tDX6tyY8C45oHUQji1upYnxJI9OFN6cUSEFQVTvym7Ui1N7g/zkHOvQW/QTEO9YbGu29BoM46pvM1xcU2Q1T+hGbf7b778kyltuih+lMQtKdm3EgiiQQxaEh0UyVJx3tquL7gNZNnAhyrmP53eDjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gnFYN7Da; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so24735325e9.3
        for <linux-media@vger.kernel.org>; Sat, 07 Jun 2025 02:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749287790; x=1749892590; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CjJ/5vs6vF4wRvE8/xfIzB8JpoATxp7vm4h1CJMyhgo=;
        b=gnFYN7DaQDWFkGHLy2cy+KJBAaXixEfrHq/KPm2qjspKJjxaL9tQ2N5NeBgQgRA+3U
         I7VEWxhHelo7T7u9yXu1SJd+A0lm+iP+cI9SPc8Fj5ZcJ+gdNEhkusZlpFNvPC7KyZ2M
         XufMB9wBlVc+FAEdaLbxlOos+jWKggig2CBfoRFbIi2Y2YS+hsU5ikjmGW/gFxsWhWC7
         6eeZ4nBXUD/DwyB0BRWmC8M0kUTDtAaSHaLGHJkCbGLmi96A5lzZUBciYU4YiL1FbmJt
         LpVdBoFFURQo1RfFdq3q5AjOE7/ef/djBN/V4ww1M0i0BpJmRuXCbg+L3vV0zQkEeBZX
         cV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749287790; x=1749892590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CjJ/5vs6vF4wRvE8/xfIzB8JpoATxp7vm4h1CJMyhgo=;
        b=O+q2WC+XcCTPTKAV84cMke4gHulG1E1UL/8kQdPsG9tc34/u03u99qqMkbyKPj0REz
         xhhQlECJcc/NfGjy9NgSU0jAP/TeJDg3il4wgJICM6nBYfW86M6hFfDYt8FkquYyVbmK
         f4sCPFfD8MQhvb7nZT4SYq0zyWl6IHCM/bfbffY97FbHceQPb6pBCmqVweEOU55gwGnt
         6BAikPJWs832TIk0oh6OevOBiu9TRgLrzFrI67DKL3tonihBlfx4JR7eZWlX+G73ti1k
         K9IPfC0R4p0wIQgJHCxRiF6GBkSRrEM/KHJ6ULP1qN3ba1p6DCvt8GJQLZ1LwqiFUFsw
         iGVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyXB9F8a2xwutQOZ+rtfnoPkKrsfG1L/qH4L4FEwqRzu6rcMbJ94m2vOIDHYdywi2dc8hL+qRmaTzVvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzICZe1RUYUybGMx3H22P7YRKVAmJC4MA3y5CmJU57YfDnm8VoD
	tGIhPRqZrhjmdNiOkyDDJ6X1D3uNq54N+CNySr/s/SXQcq+tRAqUQVG4KmpMfsjdd3I=
X-Gm-Gg: ASbGncuiganOPgsMVF9NwPDYnBiFTw8Df11RZiSknk1D0uGnO5zqNiaW8DoOQBAxnu2
	fnb/F2HFBpfybcIqLtCR6zobUKWjZhIYVVHTPVGPoORrdJpkWIuaEmDRjvger5+Sd8Q6tsXx5rq
	RzxYEV9s1cNa+Abi4315LR8H3GmdLCfUnOyxrbFGmM9n3ISj3inxAPLlxVDskbv95yyemb30x5o
	FaANszDGTIO/8vOmndTI2tZNCod58FU4vxz1pxUhAxAgd2H89J54Gx5M9pY8cSBw7M+hbQKYl07
	D/8CTGMrCw3hxbFtdjrcTH/i1nx0IKCmLz5P+gWESm2J7/zaIqP99PhPwlxQ/vn26wNaBlu9xhp
	cRJYGauwDQszreMui
X-Google-Smtp-Source: AGHT+IEkUbJBSS2d4IS6QBShUgwU+ysgYvzacuZq/Zvm/z+BFpGTBKsmlusvq3rqz7YKM16GiF1BFg==
X-Received: by 2002:a05:600c:a101:b0:453:81a:2f3f with SMTP id 5b1f17b1804b1-453081a33efmr596565e9.30.1749287789633;
        Sat, 07 Jun 2025 02:16:29 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4521375b5e1sm51785485e9.37.2025.06.07.02.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 02:16:28 -0700 (PDT)
Message-ID: <e0405dea-bad2-408c-a65d-f9a3456dd92e@linaro.org>
Date: Sat, 7 Jun 2025 10:16:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Renjiang Han <quic_renjiang@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
 <5854a587-aba7-4e71-87f8-249ba00cbc59@linaro.org>
 <996c9a39-5520-4b43-adfa-06ce29223ba0@quicinc.com>
 <713b87cb-0003-4ee3-a599-9cd41629bb42@kernel.org>
 <7aa36a0f-6741-40c2-93f4-036823d245fd@quicinc.com>
 <247002c0-ee68-4d0d-857a-768bf68bce75@kernel.org>
 <d5aee491-3ba2-4beb-8b8f-4ba8372e6d16@quicinc.com>
 <fa6a7983-27bf-40db-9843-0891bdadf523@linaro.org>
 <a258433f-f1da-4be7-a0af-645571aab871@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <a258433f-f1da-4be7-a0af-645571aab871@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/06/2025 03:13, Dmitry Baryshkov wrote:
>>
>> As we've established the fallback isn't a fallback because it falls 
>> back to wrong data, so lets fix that.
> 
> Why isn't it a fallback? With the driver changes in place, the fallback 
> is totally correct.

Its not a fallback _as_is_

I'm fine either way

- Apply 1/3 and then re-submit 2/3 3/3

or

- Enumerate a QCS615 table
- Apply 1/3 here

---
bod

