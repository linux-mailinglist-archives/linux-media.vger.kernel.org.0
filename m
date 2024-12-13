Return-Path: <linux-media+bounces-23405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A85359F1953
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 23:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F9E5188A31A
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 22:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22821ACDF0;
	Fri, 13 Dec 2024 22:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u1C6JoOz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329D21953A1
	for <linux-media@vger.kernel.org>; Fri, 13 Dec 2024 22:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734130001; cv=none; b=nJ27rs6AtXM10zrhy0DamH6lml6kUG6C5RSuOBDetVWAHvewCRe7MKcwiH5+6Oo1RgGZJWLS/7UxN2jmTuN9ZMaoJlBdunbQhPuVKJO0ZXvM+DvHZ6JhORJHQyIllWB6f0mL6rNlkUf+KPk4lgekiitTEwFi0mAAbJtGUhDL5bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734130001; c=relaxed/simple;
	bh=40UdhAIFkNpCWAKbO0Y7oEN+u3yqHZKe340TjJTE2Pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NVHCHmGFiSTg0AvgguSYRbu6Tr4iR23Ugm0uPctXNzK2i0aJ67Zw4kHa+F8FDIRKkje4dWefH5KW/seAG98RR8gqGmag6U+wFRc+jX93BvlTa3WO/VHd8jzfM1oQYlzB0CNJSyDeLoxQx/zJY25aIipqKQPgGyLOgypYRUeFm7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u1C6JoOz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43635796b48so2222075e9.0
        for <linux-media@vger.kernel.org>; Fri, 13 Dec 2024 14:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734129997; x=1734734797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KTuOD6icErcsFYaW9j21xu4YdtqCIv9gqicrizfjG+A=;
        b=u1C6JoOzkQJPC3UQZDOR4MvJw28UOvYZGDM57yLagGpDp8kI9tIPdAGfegoiGkiVaE
         8M/MZwHxbXq+GlHTWOghP20oYfSj4Bl+KWDL17cCUXn6XSUBYSRsB2zEBtx5K0mZNrH5
         ZytIBuQQVDDm1pgYnfgSLkiuKr1xgqpV4kWAIU2TsoxbgWXqpqCAi4LzuQmEcm3ZRF+N
         +w4+WXCBJK0v+Ha4C2h8Fd7CJto+bYteYgvbnAhtCEZDRGyAeMysKZzljEQxtO7BW/TU
         x0PlqUQi5ua089j0S8bF6WzA04xyllyy4csPc5Gn4LTf+xg9sCzV9eDU6xVbE9e/eMIt
         AopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734129997; x=1734734797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KTuOD6icErcsFYaW9j21xu4YdtqCIv9gqicrizfjG+A=;
        b=Edpaxt+qKh3XCUR29zrG4G2fuuFF/8+kDhI7g75198Cmgg3u1rvjnFXyN9muQU/Bf5
         0Ai5EjApFtxJ2MEFEaZcDEmn1RPUokZhzZyr51/XvnUrXDd8Ch25R80cyNlDFjMSPQe7
         VR9fyT2EuFRFNyUn/QFm4HzgqjlzCq8CkBQF32UQBqqy/YZU6yNsKEf0r7CM5648Rhkc
         9x+/cjx6Rw2OvOSHaHvyXVG/ZxRJn/UfTNMHtsZJdAtgGymPczlQGiGEBpb7JuDYeoyi
         ST/E2ldxVHGNcOrn/5LJWwWwdK/rooqot8JyFyNO/JhCumeSKIhmui5ruSm851AGvZxn
         eLdA==
X-Forwarded-Encrypted: i=1; AJvYcCWzH/GH5sWyE/yzESBF8G13p7U4kAF9TU/d1/QqXjqviw+pdsaDse14iVv2ZaQ4gMAv5fYRH2KrqEICPg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv66jh+gs9ZpbAg2l+1mdmpcRJ3cqkHhzUfCjr3V3O+Yv62rPt
	hE4JaIOHZSGrqBl+mlvPuYKT9x7nP2RMuS7rzVUQsDlD5p23qhcI4cLeL2z3AA4=
X-Gm-Gg: ASbGnct8c7XnMq5zOubJPcqpTipfqhoIB3VlxB84oCkrHt6DhvQgRtY1rUbJsaPR3hB
	S3wQL9IgtjeVcsbvboScTO0hINuWHLvnRTq2WvBcOBgyuxPLHpwbz27oa4RXLdDcBm1DJCZY6yJ
	41Ub4yWrZgKTRq5uv6a7wNHCyWcxV+WT7kf3+ycLu8qHJb9YpXeZfYWr6xsbKy9SgjM9YmKUSgY
	XsQo4Ht4+b2oMGaVLsjWMNJgs+/YTRm3W0WTGyOWBANCnMglEvXYRDrTrOFC1J0lHcvGA==
X-Google-Smtp-Source: AGHT+IF8LUTsKZXa8frqGxeBxZl582Ej5d81AFeE5NCeWffygpOwWGp+rL8WjqRfyLO0969GF07PDw==
X-Received: by 2002:a05:600c:c8c:b0:42c:b8c9:16c8 with SMTP id 5b1f17b1804b1-4362b14bbe0mr32131525e9.10.1734129997407;
        Fri, 13 Dec 2024 14:46:37 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436255531b1sm63871835e9.2.2024.12.13.14.46.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 14:46:36 -0800 (PST)
Message-ID: <47d81240-2717-48f6-89c5-f64f7bbd7505@linaro.org>
Date: Fri, 13 Dec 2024 22:46:35 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] media: venus: Populate video encoder/decoder
 nodename entries
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com,
 quic_dikshita@quicinc.com, konradybcio@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>
References: <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-0-ef7e5f85f302@linaro.org>
 <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-2-ef7e5f85f302@linaro.org>
 <e159b61f620eea520b06e20a294bf84be781fe19.camel@ndufresne.ca>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <e159b61f620eea520b06e20a294bf84be781fe19.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/12/2024 20:00, Nicolas Dufresne wrote:
> Hope this hardcoding of node name is historical ? 

Hardcoding is historical in dts.

We need to add two more chips into venus before iris is merged and at 
feature parity for HFI_6XX and above - HFI_GEN2

Something like this.

enum {
	HFI_1XX
	..
	HFI_6XX
	HFI_GEN2
	..
};

 > And not done for newer chips ?

HFI_6XX and above will be fully supported in "iris" with encoder/decoder 
selection done at session creation time.

Iris is being added phased. Basic decoder with one format, followed by 
decoder and additional formats.

Once we get to feature parity HFI_6XX and above will be supported in 
Iris and removed from venus.

Leaving HFI_4XX and below.

That's a long winded way of saying new chips minted from the fab will 
either be HFI_GEN2+ or HFI_6XX.

> We discourage userspace on relying on node names cause it always leads to
> complication and non-portable code.

Writing this driver from scratch - basically what HFI_6XX in Iris does, 
you'd select encoder/decoder when you create the initial session - the 
initial state.

For venus that's an unknown amount of work to do.

What we _could_ certainly do is make the static assignment in this 
series assignable via a kernel parameter.

I'd say though that's an additional series on top of this.

First pass here is just to fix up the original sin, not to improve 
selectivity, just yet.

---
bod

