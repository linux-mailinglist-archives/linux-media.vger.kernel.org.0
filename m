Return-Path: <linux-media+bounces-23703-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 573639F65D0
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 13:22:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFF4D1890704
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 12:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9711CEEBB;
	Wed, 18 Dec 2024 12:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qssT0F6I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF9019F489
	for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 12:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734524323; cv=none; b=tYIGY5g6clTBnU5/QWknovXI2RA1p8CR2NjuXnIOP/2hoK3bl3o3cordIhfftHiAbyVD4FPJlO2WpVHxid/ar/JTYmOJN4PQfA8Qq+nNHeKkb9lQub756EcAayOJJUAmdFTDSu+hFjUfEyAbdo+SszHLHM64GmRn9BGtyxw7qTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734524323; c=relaxed/simple;
	bh=DxkvBZJ9a+tzEif7MWgdulVGEFYgbAwj69xF2eda1cM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=QFJ+i+FiajF4dBC3bAn9vlo7zK6s31SceQHXrBDul6/GBnikXkS0UZrt/ONnp0Aca19UOhe6RtaMfqGO1j/nhWWbT0Lyx8B1oTwt3Cc1w5Adq5Dz39AglsE8QKTpqINkM3gFjv1bHCmbghmVwSihafU5o8JLYEmzMAslGggLixk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qssT0F6I; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso33862265e9.0
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 04:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734524319; x=1735129119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8iGiz2wtN6cQxaer0WsA2mvybwMcelhlrvEDD3oLxkQ=;
        b=qssT0F6INhosQsbD7MARu9KvBfgmxPvXA6a6WW9FaM/iC5OLhPv4dxyDWHalUd1Gdf
         09j7GckkBdld+GS97P9eylK1Qsab4KmafLu3SLgGGVN+eF10zpfF08JcgezynMfNuHsM
         je88i70P7OJY0BkHoqiH7uY+pGDwBUlQRXHVc75xhgIrv4rMFFW2KgaEpdyrMdcRRoVk
         3yrU4LJr7OQ18Hufcb/UvZYcVXmx+vuU/Hj8k9BI22tTmgS+VaXb2IIcdGl74XIT7TOt
         5x9X48kXvodCQCe91SRhnMjtJanLx57YO/GRJSWafg0kfTcDm+pQJV8UL27VF4mHdYUy
         y+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734524319; x=1735129119;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8iGiz2wtN6cQxaer0WsA2mvybwMcelhlrvEDD3oLxkQ=;
        b=QYY34u7MA1J1KwuUBq1RbArUZcDuucLem1TK/kWuoIOZQNYNne+BEBWvZgZJWevDZk
         L+RxuC6KFYTpa9RUlGXmJCUgZtPrRdyE+XxjmjUBtNvxNW5mDG2DDbXBPTzUmCbzzpfW
         4272hWZ7NuQYq5PcI9qt1Jf9NGRuZ6WHAjbWVHCkDKLN9+NgFCtVlT9q3DTSQtF1VvHn
         7Kc/Itc6dCGJ1IuH0ZkNWmlLwPTXPEf1vdIAnq/u5ddBJ0X/sxvJ7ptjpQmKv3yJ+Rjw
         rywI+a6Td9tWAVuS9by87aKQlJfQ239BUDi20r4w6Re9FM19Lu1lP1ZaGT32QlAnSYDk
         PR4w==
X-Forwarded-Encrypted: i=1; AJvYcCVgBhPnBKayN+4sKtq0wGzVbzd+Au5Dqao4EJW2dzfa93RS8su3By+UIif4nOUTf3fUv3Wym0Vf4ra//Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfFIGgDBh1shta6spHZZW2ElGWws+yTamTP99NtlzryXqVlHez
	6Z+Q4idTGifqf4/qglyovbTc3KkhbGLLinozE/it2o5ho91eS8sV3PKJtgraoIY=
X-Gm-Gg: ASbGncsuFvkkxhAr5BlSmZff9ayKfhQC5z8UFFUmGxkJrmp1PR9pY1i3PyWBkSO19tT
	h8UIL6OklzJV91i8k6yQCDp6xYjbI1eTTmkK7Nv56oUqjKskt6r74xJ0+1jtqMknlTDjqS64b9Y
	Hq87Q27qYOKqe1s3YZQSPvCA5GCDV91/OaBKbgQijwnvV9nMIjC7Rk2LtNP3nLvDmZKeCoHkhzd
	T4N6/YuF8t3/oLjusfZi1mOvKtY9ekaQWWt4y91CXt7FugSczzYe8Ut9AjnlFkCDjn5cQ==
X-Google-Smtp-Source: AGHT+IEcMnXSi7UDywqFLxWjgZ5pGPzgn8E2LkOV2zMI5Kyif7I2RM5iM7av/dsEhBaDUJWGgdltzQ==
X-Received: by 2002:a05:600c:1c0d:b0:434:a4fe:cd71 with SMTP id 5b1f17b1804b1-43655360de5mr23073915e9.12.1734524318825;
        Wed, 18 Dec 2024 04:18:38 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8061038sm13761708f8f.104.2024.12.18.04.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 04:18:38 -0800 (PST)
Message-ID: <f7bccde8-80d9-4be7-b280-7d171059b4b4@linaro.org>
Date: Wed, 18 Dec 2024 12:18:37 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/4] media: dt-bindings: update clocks for
 sc7280-camss
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241217140656.965235-1-quic_vikramsa@quicinc.com>
 <20241217140656.965235-2-quic_vikramsa@quicinc.com>
 <02da691b-1f5d-41a6-847c-c7e9b8239919@kernel.org>
 <c14493b0-c9d3-4e1c-9f86-991b4cb25c98@linaro.org>
 <fe28a9bc-82ef-4fef-af50-9d9261ed9b39@kernel.org>
 <a1032d53-6f3e-48f6-a2e9-1315bb1a3232@linaro.org>
 <hevfx4sgsatohz4ndgrlidj5kqxaiizmakjqjghlkbmguluzi5@ezxa36uasb32>
 <23ae6fb9-2c66-4d16-83e7-d53c1a6685c2@linaro.org>
Content-Language: en-US
In-Reply-To: <23ae6fb9-2c66-4d16-83e7-d53c1a6685c2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/12/2024 12:17, Bryan O'Donoghue wrote:
> On 18/12/2024 11:36, Dmitry Baryshkov wrote:
>>> Agreed.
>>>
>>> The commit log should make clear that the ABI hasn't been cemented yet.
>>>
>>> 20241217140656.965235-4-quic_vikramsa@quicinc.com <- is still pending
>> If it hasn't been comitted yet, isn't it better to post a fixed version
>> rather than committing a version which has known issues?
> 
> Yes.
> 
> - yaml
> - driver
> 
> are merged but
> 
> - dtsi is not
> 
> So we can still change yaml and driver prior to fixing dtsi.
> 
> ---
> bod

Excuse me; prior to _committing_ the dtsi

