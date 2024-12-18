Return-Path: <linux-media+bounces-23705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B069F6610
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 13:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E731A1888EAE
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 12:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D48FA1ACEB9;
	Wed, 18 Dec 2024 12:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ORVQckdG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA5F1ACEB7
	for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 12:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734525516; cv=none; b=mDAcleQKqgd6jBWIrRaZImMqZNdnyjc4DB+/hBi1Ez19WOrym2p4AoRWLW3eDIBiCQCLv2m9CyzO/pteimo+0ki6kvjtLU1tPOW7ETq4XBhHk9oi1bCvMhMelAkbdsYxBmIzeE9LnPJDqJyW8E9HVVEcKuAHBPh/iyVyRmtuyW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734525516; c=relaxed/simple;
	bh=ny8AZFxGArSK4lKyOaV5lQtUZhTpx9qpDZsMP3LtNtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=piwxfUjUTgRyl3ywWbxWKZ36W0NVWyzVC9LE0Y6EwK6IyV8rgoJSl5VZGFTtwGHZDijh8eSegFJk+TSr5OqjiAH75yAKLBuncGDJrPvUD+gEef0lp1McdRqwmbah4FUpy62WLW3I4yE7MjLhPkyYCOGpWMHoOOkPUznR1QPQNNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ORVQckdG; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385db79aafbso576562f8f.1
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 04:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734525513; x=1735130313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3DZgOSN0lNpblvMz9+E1HszL54oJNT4pvL2gUwIgVEE=;
        b=ORVQckdGQnxoax6CTBl2wsTmSnNAxJ67f2Jig1bqFzOoaKmOnQf9qhp5wOA8Z4UbXC
         /98FWnTzkQOiA4ftppDEK8VLd2KUNoBpm8wfluW6OqV9qqDHXQEscxVwfNSCxU5olarT
         osGMYGAj6hbYiu2pW+KTQ3q4l3kQr5s6W9zR7Hvxx2LNxZQLIRCYrjdhlQIkhKzKDfWC
         s7XfwZ6pXoMFFFHexLQVwTPBSZp8Y2zffj2cNqkIyj7/bBLujJsEpQr2W65NBDxboI5Z
         CiX4DqwNmkiWmAzxSF7GZtA2tP2gRXvKVa3LfP8bf8hdhD/Uuifj9EIzTtzZBoA5GWI4
         DhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734525513; x=1735130313;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3DZgOSN0lNpblvMz9+E1HszL54oJNT4pvL2gUwIgVEE=;
        b=vlxp601Z2lTlAeOJXnBxouH5z8g6RSrq5Rml2VOsUjeJn6cNNYHgcpCA9FmGhzWolv
         D6cqLTsgM9TPnXLQYP4JycOr0SOlvcup6pjHSIeGZAi3NB41mXfu+cP/gx1kBAS1yTMR
         TMPhBVr6u2DABlmh+tOEo83ITwamt/FfrGtFR3rvQ3I88vZwvQEovfrDWMkSyecUOZfi
         igM9ynSkgPUm4ivToGoHg9lVi4WmzU9vhc6qpjokJ+GXGBqJj5/FtQdz60l0ZO0/91KT
         k0j/mGhRO6LIinTa4YnZ2osaJeoSc3djb+mPPdMRkwDeydrN7tx4h0q3kuWsUQbPl59z
         fFEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3tGdf1YeEtAYSZs+47coTtgmWkeCvEUa+p72yFnsLy5N7RQYoEKGs92ibYhrogsjFk8hZ072m7poEag==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzXtc6nrW9B+Uc9OTthfLHbCXems2XW/3h4114e9GuBEdvHPGm
	vSvKVgVHjINd5H+R538otxuFSb7yQSAfyaPGtc2VF20EW0mhPInczmiQmvqdYI8=
X-Gm-Gg: ASbGncsqFReSI7TSSSbYxBpyBmjXy/fGhDe5t8fh4YPYc9sIaR6AVRrpgsxg4dX8f5k
	35Zt0Bs1OhC2JtlQ1g5V7EfXRIR0EcZmg81JKDrjWNVYe5q6v9gdNeeqwC2HLr8qbiPL3J8xlLM
	Op1F197pnJzNeVfweVPy1+9IlOJ5JLH5fr6YqgCVSUN0ZHhRIz26HLwOGbeUjNxKrOBmY4Rfa/1
	iXkUxwpYn3yn/0Uvlep8lF4lxt5+s2cNu5dO2O8Txg+YkVRG85ZmU4Go4O0513DDoDrvYH1f5iu
X-Google-Smtp-Source: AGHT+IGZ2XfCQIns+N5v5d09KDbIQcXMqvYrvtPujRqrDjoUz23a369nVmkZdoEpblXux47osJXWjw==
X-Received: by 2002:a05:600c:1396:b0:435:1243:c542 with SMTP id 5b1f17b1804b1-43655341cfbmr9293905e9.1.1734525512845;
        Wed, 18 Dec 2024 04:38:32 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b2a4sm18841915e9.27.2024.12.18.04.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 04:38:32 -0800 (PST)
Message-ID: <0a265953-0c6a-4b8b-a972-a59ec4755474@linaro.org>
Date: Wed, 18 Dec 2024 13:38:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] media: dt-bindings: qcom-venus: Deprecate
 video-decoder and video-encoder where applicable
To: Renjiang Han <quic_renjiang@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: quic_vnagar@quicinc.com, quic_dikshita@quicinc.com,
 konradybcio@kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Stanimir Varbanov <stanimir.varbanov@linaro.org>
References: <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-0-ef7e5f85f302@linaro.org>
 <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-3-ef7e5f85f302@linaro.org>
 <283a54b2-6e00-4d3a-95a3-df4a06bc1292@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <283a54b2-6e00-4d3a-95a3-df4a06bc1292@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/12/2024 11:46, Renjiang Han wrote:
> 
> On 12/9/2024 7:52 PM, Bryan O'Donoghue wrote:
>> For the list of yaml files here the video-decoder and video-encoder nodes
>> provide nothing more than configuration input for the driver. These entries
>> do not in fact impart hardware specific data and should be deprecated.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---


Please kindly trim the replies from unnecessary context. It makes it
much easier to find new content.

>> @@ -132,12 +132,4 @@ examples:
>>           resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
>>                    <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
>>           reset-names = "bus", "core";
>> -
>> -        video-decoder {
>> -            compatible = "venus-decoder";
>> -        };
>> -
>> -        video-encoder {
>> -            compatible = "venus-encoder";
>> -        };
>>       };
> It is working fine on QCS615.
> Tested-by: Renjiang Han <quic_renjiang@quicinc.com>


How? How is it possible to test a binding on real hardware? To my
knowledge it is impossible, so I really would like to see explanation of
this tag.

I recently voiced my concerns that I really dislike tested-by tags on
bindings, because they are fake or not accurate. Story continues...



Best regards,
Krzysztof

