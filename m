Return-Path: <linux-media+bounces-7438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5666881547
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 17:12:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AAD8283624
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 16:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB4D54BFC;
	Wed, 20 Mar 2024 16:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P2HkANNr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439F75466C
	for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 16:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710951161; cv=none; b=F/kNTZlFZ0t1rSDfKnobk61sx6KZJlyuvoZ00wKotU2P2vqpzHlQvMFLSG0reHqDvBs8xpPAqqzR915QzlINjtDt20LgfHAxFFOEuJ6Y4cqMuoPOhSKqerMvfR2oIdTWAU34l6iV8H/zotgBUiY4cqtqHg2FhysxlJWKMSMzt5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710951161; c=relaxed/simple;
	bh=91XMpLG2akQ92yHfsX86vnzQBDTtg0DrCMSJa/o9yO4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=pjga8P1/fAtG9EUIryupn20IZxYwXdZS1Tsk0HGQ0NNe1CeInyWALlq7w+d9YgPA4uHfjQEDmeMY7fAqES7HWoW6jYDAQZnDzFsKjjijlh3H1j5UJ7ioo5vU7gKGrgBVHToDjDlvkfScHmWRRIHXZTQPy1cXqUU/m5ubtxn9glE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P2HkANNr; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4146fe16a1aso1553135e9.1
        for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 09:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710951158; x=1711555958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OHaerxnf+Io0STbXSxPOeYL0uihrNa0TldEwjw3BQgY=;
        b=P2HkANNrIh9s2b3Z8sHdSJS1AuOEmHWlY4Ai6PXERrqviAxxrJ8+WA2dFyijKYkVsW
         OZ5z0mX9mpf1J/tGdILxw6425soHVce2qy+f4Xn+MvG8AJScIniAOZr1NXdYiveBKssn
         Ttr2SEvO8cYbBsmV2syKGjowWY2K/6trVJfGb84sxRU84LXoyFCxvqzkkWbNrxhIAee7
         WGmnQsDY0bUGFum7YG6WmbOeksAd5qF2KR2aG+J4CBFQ9kurDEUI8QACiqyKBccNxmXi
         H0s9g/WSLGqA20SUWdM+8NW/YnZpUJukUe5L8b52Z0tRtBKZi22TzhIIsn6wOW3Z54Ee
         UuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710951158; x=1711555958;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OHaerxnf+Io0STbXSxPOeYL0uihrNa0TldEwjw3BQgY=;
        b=uguJWj9lV8i3st9EmqwZg3KQ8IMuAPZTGt7LsW+85bGOBUVE4ORTrVg0qzDr0LsGK4
         9+x93hdxCF96siEyCxFfUfAr3IeF2LYXgSoG5ITvaYAc3RlI1QSeBMt7l3f2nGu7es4d
         FnwdkDUHzgoIZ5ENQibAxDvYpNVkoqJy6WoNX5APJoFAvcAPiJRbLNonv0yFIPv7H7EW
         kl7kLh1Sony7Mj8M3Zn+iuE749iJhTYUl+YzIP/AcrIZB9jUVUFKkkp8XaBOR/rTkkp/
         PzzF9W6JZg5IVmEMaWkeBvvkDi2YoCod/iBxtaVSLjy83rtnmhy/8GbWYDxKbT+c7Y2V
         rqYw==
X-Forwarded-Encrypted: i=1; AJvYcCWo8EXl2GXFeIcvjEh2npSru79LYCaCNNAFIYGZVnn1f3kL/e3czIHwspbsInMtGwBum/zeSsduAepGPH+DrjSmBA53yb6XdsJIdzU=
X-Gm-Message-State: AOJu0YyDCFjGT3Bvc866ty6nh5jKa1C340yXpQ8zRGum9kJ6b4pAFMlg
	NGpdhEaQEdekcZJB9F7pVd9RXtJbCnmxLBar0JMzFzNNoQggNbgZriWfba+wCV4=
X-Google-Smtp-Source: AGHT+IGUmqwc0fjYKojLrdrN0jIAX9AbIj172jwSl+A63IlFH6oYl/Bmn8K+Tv5YFkUwdiy9Xj10ig==
X-Received: by 2002:a05:600c:4fc8:b0:414:6172:8366 with SMTP id o8-20020a05600c4fc800b0041461728366mr5260918wmq.15.1710951157618;
        Wed, 20 Mar 2024 09:12:37 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id by19-20020a056000099300b0034174875850sm7821180wrb.70.2024.03.20.09.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 09:12:37 -0700 (PDT)
Message-ID: <bbbb5983-f870-48ce-ab7d-c424266e78d9@linaro.org>
Date: Wed, 20 Mar 2024 16:12:36 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] media: qcom: camss: Add CSID gen3 driver
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org, quic_yon@quicinc.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
References: <20240320141136.26827-1-quic_depengs@quicinc.com>
 <20240320141136.26827-6-quic_depengs@quicinc.com>
 <b542f9a1-2053-4431-832e-5510e8d8220e@linaro.org>
In-Reply-To: <b542f9a1-2053-4431-832e-5510e8d8220e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/03/2024 15:40, Bryan O'Donoghue wrote:
> +static const struct csid_format csid_formats[] = {
> +    {
> +        MEDIA_BUS_FMT_UYVY8_1X16,
> +        DATA_TYPE_YUV422_8BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_8_BIT,
> +        8,
> +        2,
> +    },
> +    {
> +        MEDIA_BUS_FMT_VYUY8_1X16,
> +        DATA_TYPE_YUV422_8BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_8_BIT,
> +        8,
> +        2,
> +    },
> +    {
> +        MEDIA_BUS_FMT_YUYV8_1X16,
> +        DATA_TYPE_YUV422_8BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_8_BIT,
> +        8,
> +        2,
> +    },
> +    {
> +        MEDIA_BUS_FMT_YVYU8_1X16,
> +        DATA_TYPE_YUV422_8BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_8_BIT,
> +        8,
> +        2,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SBGGR8_1X8,
> +        DATA_TYPE_RAW_8BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_8_BIT,
> +        8,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SGBRG8_1X8,
> +        DATA_TYPE_RAW_8BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_8_BIT,
> +        8,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SGRBG8_1X8,
> +        DATA_TYPE_RAW_8BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_8_BIT,
> +        8,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SRGGB8_1X8,
> +        DATA_TYPE_RAW_8BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_8_BIT,
> +        8,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SBGGR10_1X10,
> +        DATA_TYPE_RAW_10BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_10_BIT,
> +        10,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SGBRG10_1X10,
> +        DATA_TYPE_RAW_10BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_10_BIT,
> +        10,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SGRBG10_1X10,
> +        DATA_TYPE_RAW_10BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_10_BIT,
> +        10,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SRGGB10_1X10,
> +        DATA_TYPE_RAW_10BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_10_BIT,
> +        10,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_Y8_1X8,
> +        DATA_TYPE_RAW_8BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_8_BIT,
> +        8,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_Y10_1X10,
> +        DATA_TYPE_RAW_10BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_10_BIT,
> +        10,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SBGGR12_1X12,
> +        DATA_TYPE_RAW_12BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_12_BIT,
> +        12,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SGBRG12_1X12,
> +        DATA_TYPE_RAW_12BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_12_BIT,
> +        12,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SGRBG12_1X12,
> +        DATA_TYPE_RAW_12BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_12_BIT,
> +        12,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SRGGB12_1X12,
> +        DATA_TYPE_RAW_12BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_12_BIT,
> +        12,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SBGGR14_1X14,
> +        DATA_TYPE_RAW_14BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_14_BIT,
> +        14,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SGBRG14_1X14,
> +        DATA_TYPE_RAW_14BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_14_BIT,
> +        14,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SGRBG14_1X14,
> +        DATA_TYPE_RAW_14BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_14_BIT,
> +        14,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SRGGB14_1X14,
> +        DATA_TYPE_RAW_14BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_14_BIT,
> +        14,
> +        1,
> +    },
> +};

Also please consider including/reviewing Gjorgji's patchset which 
reworks the declaration of resources.

https://lore.kernel.org/lkml/20240319173935.481-4-quic_grosikop@quicinc.com/T/

---
bod

