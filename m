Return-Path: <linux-media+bounces-24823-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEF6A12ED2
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 23:58:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E0077A4A46
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 22:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2061DDA35;
	Wed, 15 Jan 2025 22:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xkNM6vLd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605D41DD529
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 22:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736981845; cv=none; b=K7VN7JoS/mpi1Rr6Q3SBDrLJlMV2Zmhnd1xFFwBi7OYrs+E//GHSJppizW+lnMpNW+1Wtr+8Veka/RMQeV7mteH5n7hYbpqJvS74hly5pUncU2zd5oQhexHvn7kbwlBF13V1LUT/kChhm64N3D13wcw7nIUyNVBrmLX0Bj9ATXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736981845; c=relaxed/simple;
	bh=AXIqsu5Hf8BSMkgMuBblY3gvnAvhYz7zhN9xvTStUbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bUXdK2QWNW4+/wtfq/RqhqM7b6s9umbznF/SPh+/Tn7rh/p/NYezhB/gLP1tSLps5gdfgJ2Eo+akTNdLuiPEi3rGA0njoLnzGNx9bKQVpPHvRoGhBUi9djxB5untKi6Rm5y7+rDkY7GZ/F2517vlaQnIJRTwBSuQNYlNU0UAG5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xkNM6vLd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43635796b48so2109355e9.0
        for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 14:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736981842; x=1737586642; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YI2knYab9uxJ+B0Tyt+RTtiSje6a7G9k5sDSWOOzBtk=;
        b=xkNM6vLdU0YcPfhQY2LMI6oOTBcGt5wj1DRdGx99cfu2xPguHBIBHxjLtpDcdRqa7p
         /UjcOORpP47YLsN9iUsKAhJ+knca/MiSqreO/LfHqzFNjB9LdAYp/3JoU52btIvUH7OY
         o9q5nN67nVfiHEL+5x1ZkV/s+P1X/uyEhyHu5+Z47p+lTJH7SpVfwhzlb5QHbx8G5SRD
         oKXN+ca0gefI5dI0H/CMV8oqhMmEN64bu2FX9d0NP25QKli3+Bsk6iqAoamUMbNJQ9yD
         xI5JTL07N9YJz0TVJkWeGq6oA1ry+AOKWgeVsmev5hqWG+allvyiDc7h/yyBphUO/gp6
         TM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736981842; x=1737586642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YI2knYab9uxJ+B0Tyt+RTtiSje6a7G9k5sDSWOOzBtk=;
        b=NAoHxQLPdpNSPT+TlKiJBxkFCSyyIsRFoBTtTteIMzTUVLojs4QqABDMQVQ8dd45gH
         gXo9GC2zXeUUw3gTEpHc4+j+u92GKHHX6neHuzSZXMCbR7M1fpxA6FjL/VqL38djI7LO
         UnUGyrzaAUeQF5TtA44PQ9v7Y88uhKeudrLB1LdUMYOJwV73laJPGR/JeNyMwx+IA4Hn
         S+Mg3bDGFs0ryrDqqwfSH1FSNHcQ/RR2GTM+tqmwSDmhrJYGFFjurTnV04PShLe2zvQK
         7l2NFNfa6QwIoLjqBWpiUp029nkxGdgmpHrF/WOlQ47PU6oksFGlxXd6Q0F0W9jZ2F/D
         +e3g==
X-Forwarded-Encrypted: i=1; AJvYcCW9WxPmFrLfDDW6ONbGjUBszywS2WX+wErtzHzf/2SKxVBmxkkoJjtTenIHBQlwnP+o5EVXTa3Z4WrPTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkXUwUBEaTpxIDERsg2ozCCuj8X1fLEGku1Aso8Q3IdZEZlQCG
	P5iknOevQhjlCB71SCtm0+mHQrK0f/WFJeqkISOeqYZZx7jq/GbmhhGika4gxRI=
X-Gm-Gg: ASbGncs0VL2MI8PzWiEA4ntwAig4LMzcTGGtYQMpXAQKhuXZohiwcOJKpYa+7T4YnRY
	zqhulz0cCjSNSq3prUDjthau7fx/DCXeQMaWug6p28liaTohgMlSPWoRMFB/tTONCa+sJ+gYGex
	MGLvEj6Z3Vt8dizBv2RWajjCOuNgZmqxp+MDgC0IpUV+Ked4m/dMFhjJcoG7HjNzY7++1GBhhNV
	SDb8+jzO+WpF8HcK7pN06ukNU+pZqsYJV1Tu11/lO17Rbf0Ac8HMbBHITqmDgsFbav75w==
X-Google-Smtp-Source: AGHT+IEaoRvweWyXVNLgMW7PDXCusK77YXY6gpdqoMSU2lhKFWq18jM7A6ECLolxxOBokyjiRcOIuA==
X-Received: by 2002:a05:600c:4452:b0:436:e3ea:64dd with SMTP id 5b1f17b1804b1-437c6b2dd76mr40768875e9.11.1736981841774;
        Wed, 15 Jan 2025 14:57:21 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74ab449sm37998875e9.10.2025.01.15.14.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 14:57:21 -0800 (PST)
Message-ID: <f6b2f617-f111-42da-b223-4b504b272700@linaro.org>
Date: Wed, 15 Jan 2025 22:57:19 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/28] Qualcomm iris video decoder driver
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Jianhua Lu <lujianhua000@gmail.com>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/2024 11:51, Dikshita Agarwal wrote:
> Introduce support for Qualcomm new video acceleration hardware i.e.
> iris, used for video stream decoding.

I'm ~happy enough~ to give a Tested-by for this series bar the 8250 
probe selection story which I think still needs work.

commit 0d78bb6e4a9190b005b3fe5746be2f42e27f6949 (HEAD -> 
linux-media-next-25-01-15-sm8550-x1e)
Author: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date:   Thu Dec 12 17:21:50 2024 +0530

uname -a
Linux linaro-gnome 6.13.0-rc1-00197-g0d78bb6e4a91-dirty #226 SMP PREEMPT 
Wed Jan 15 21:45:36 GMT 2025 aarch64 GNU/Linux

gst-launch-1.0 -vvv -e filesrc location=sample-30s.mp4 ! qtdemux ! 
parsebin ! v4l2h264dec ! autovideosink

cat /proc/interrupts | grep iris
287:        415          0          0          0          0          0 
        0          0    GICv3 206 Level     iris

cat /proc/interrupts | grep iris
287:        458          0          0          0          0          0 
        0          0    GICv3 206 Level     iris

I get a display of busses driving around a park and can verify the 
decoder IRQ bumps as we do it.

Please apply my:

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Except to the probe 8250 patch which I'm still not happy about.

---
bod

