Return-Path: <linux-media+bounces-24795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48941A12703
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 16:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AA7918874E3
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 15:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97EAE14A095;
	Wed, 15 Jan 2025 15:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BhF10V5a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AC4149DFF
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 15:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736954113; cv=none; b=YGfRGpfKyR4D7NE3FtldgFvX6ZYojlOvK2oDCGw6WOalaSA7XH2LD0kHb2RMkxkLpvzRlFD5epjTiwbDpVOb9zT1gEmETrDXhUCbMNM69cFvIWqBSD9RVx+dNMVpxyuS+BA3jgCjNTIg5BcNNKqP2Oq09Oi/qFZZS5zNaCcZJ0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736954113; c=relaxed/simple;
	bh=v+tW/5b7Yz65Cimfgu2a56TKjHf0nLTX2HO5jcRtR8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uoWRgTUqi6IquwcayONJ7PnDgwJHX1VgAddqBj9V8xZO6DyGLJlUoyH19xXpu3IjqzYbzPSS+3lcpJ6pW/7ox9HCQiZZTAe+0LUigz2ys/nBu8be5S2XF3qGj9Cg9jJBlrBbEgwmf7dj7NuxjC6cmKi+nVTTkhkXl61I7zup8m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BhF10V5a; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso6507025e9.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 07:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736954109; x=1737558909; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=27BCS3obqDWdKu8wPBVyzX/4QMUicUdiJJjn7SeODGI=;
        b=BhF10V5aK8aNPtemP3T3N2i+gkBUqs7ZJEtO3Lr81mJLaVaVbPYLOR5LsV4HCDunG+
         qR/KVqCsvS30iBfnKa6MDt8/Y39GbhmaUhZ0V+i4B8ySfFnD1N27GgNtIxg2NdWBCM3X
         X2JVISsJMZU+UWYoJV+V0vF3crRoghCETB25JCohemdcxjkTBaEMSDUKUji444FywPXg
         EVYiLc/76BmaC7SQtmpIrlPfVrfo5goVjTLtHz+2zT4gIwnf5vjgQ+mFXZzmgW4fO32/
         7nW9qqjWrcibalraedx5sDVt94GgRXZPvkEI1oUhqh6Vie3ziwRlTFuOrdhddF/O3fAO
         0gWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736954109; x=1737558909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=27BCS3obqDWdKu8wPBVyzX/4QMUicUdiJJjn7SeODGI=;
        b=TmGI3fuS306QhhVsdnYC1xO8CjPUNlDyc9/k5mXf08Dd6FJ4KR84TxPciYvWxk9mfC
         UciNMlT8HZPLCAbkp1kFa7R55Q1MgXKqE75wi5kYz3eEGLIm0dtWykVia8XvDgAkOAW2
         qvLg/FS70ExoiFGPbn79WOyix4AGegK9T0JFQ+n6giII+8G6HbYpXW9ouwni48OMwvUv
         j9W+a7IUDroeohZtp8DYdeQEKY+yAxCsSa75hbTkjzOMW0Foj3aekYgXbUnTEms2aAkN
         g/JI7TGenaZJPyunfDUvWHSXFEOdzTKYaEpNBlijdnp1FLRK5EbQJc0uIP5zDEGkNN7q
         x/0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUhRtEILgqr2YrRfTK93ds8Bpot1tUIF+mKLmrj6LsbZ9lCP/kmCXRzWKVr3tNtW+rirkkZsILvwy6Tsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFXxeI+i/zMUzxCmBkrnkWJukPDJFYNqv8ALpOMy64VxjQ1OoH
	A0dfBuKIKElQnYccrpX4fj9tOwQsku+jeiLty4lXs+OEWwiF0MknNZdXmvEa0y0=
X-Gm-Gg: ASbGncv/4iALP4oX9bcUCYTf6PsCJxboEyFcxtM9YywRa58hWpiIdWU5RMUTbMzE6Kf
	7fGEvIv3DJJVjhWcAdNOMUb/Wmc1TrOaB7HqfBo510K1rXt82hZgQs6454knRVBCC9AIrmeh/AL
	yAH6/2OasnztpABwSZOKRvHqWV7cl3/oGk3cMEVfVsc4RsmntIZC1YZ1CLWK5PY9Ah90Ag4ABd9
	iIkEI+mgm4ESU5GIkpf5hRXjTubC/jwEBjkdqR/5/MVNk7ewsMU0ibzZls7hsz0H8o2Lw==
X-Google-Smtp-Source: AGHT+IHcjyEIL1Wamxnymek4xnB4ls055HOXGh964+mQo8ykhNiNVYn3DyPzlDxhYKiSBNi933JvlQ==
X-Received: by 2002:a7b:cc94:0:b0:434:f2af:6e74 with SMTP id 5b1f17b1804b1-437c6b2ff46mr31074005e9.15.1736954108763;
        Wed, 15 Jan 2025 07:15:08 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7528076sm27391825e9.25.2025.01.15.07.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 07:15:08 -0800 (PST)
Message-ID: <88a0cbea-9462-4ad1-8212-4cb55ffb6a1f@linaro.org>
Date: Wed, 15 Jan 2025 15:15:06 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 27/28] media: iris: enable video driver probe of SM8250
 SoC
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>, Johan Hovold
 <johan@kernel.org>, Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Jianhua Lu <lujianhua000@gmail.com>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
 <20241212-qcom-video-iris-v9-27-e8c2c6bd4041@quicinc.com>
 <Z3_nCPk_g8znto4A@hovoldconsulting.com>
 <64f8bebd-35e1-c743-b212-e1a3292bade2@quicinc.com>
 <Z4EuiPEw8mvDQ2gv@hovoldconsulting.com>
 <24334fb8-4d83-eb06-aee3-dfe1f8e4937b@quicinc.com>
 <552972B8-1ACA-4243-A8E3-8F48DAF39C5C@linaro.org>
 <7e75deb6-6c0e-4bf8-b4c5-d76b1abe2d5b@xs4all.nl>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <7e75deb6-6c0e-4bf8-b4c5-d76b1abe2d5b@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/01/2025 10:45, Hans Verkuil wrote:
> 4) What is the road forward? (I assume that venus is removed once feature parity is reached?)

sm8250 support is to removed and all HFI_6XX platforms of which sm8250 
is one, are expected to be supported by Iris once feature parity is 
upstream.

HFI <= HFI_4XX will continue to be venus, including any new upstream 
submissions for HFI_4XX.

Unless/until Iris gets upstream feature parity, we will continue to add 
new HFI_6XX SoCs to venus.

---
bod

