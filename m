Return-Path: <linux-media+bounces-18904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C21898B861
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 11:31:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E123EB23D7D
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 09:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610DE19F40D;
	Tue,  1 Oct 2024 09:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nkvh1YCK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0414319D8B3
	for <linux-media@vger.kernel.org>; Tue,  1 Oct 2024 09:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727775037; cv=none; b=L9zIP0JH0XirW9Odcr9wZXTiZijmXnP2VnZYQ88ODzb2yvTPg4D+rVvcc+3CqpRv8tYFaS3vfTcJ2tgva/noNj5bca/1C/tcRIHCTHFLn/DuwCXIG58RmpEncej+bmtHoSDEZnvX/ILSce5n3hi3G0qqeTuX7RJ4t41FQDZ4MxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727775037; c=relaxed/simple;
	bh=8utTuVvKi3Xf58YhMlDrfJrqonBjQ0pTKIx6LGEFxfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cyIMo5TQRzBnu/QXMAMcHRz8aqFCYfUUdESCcfGkh6pYx+RbOqgDQasiprtwWDN0ou89GYTxxuIde3+B8rYKxWwOchEeJBW/9reEyiCBAozJYjwPAMY/e6kFj4LQI96yevhP+RGASx7rPiXVx4OLKLc9FvLRttaFUH33FEeFOnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nkvh1YCK; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a910860e4dcso4566866b.3
        for <linux-media@vger.kernel.org>; Tue, 01 Oct 2024 02:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727775034; x=1728379834; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RgNupkyjKM2ysAGbIsG0gGy1badDoqPKofkUhbyTKoM=;
        b=Nkvh1YCKRwtaWC3l/arENsaNN7IA22xABk4erWGwFpDLWqvXYhC2Qd6/Ie5pwMtTLq
         8+U+ZlBMhff26x2MojQEvn3vZUxWrp2IOvG9l6R9UK0kYXGNH2mmNe+thSFvO4o4g0KK
         mp6QpJpmXlI2IB34CbZJ4ltH+04XaVIFhz+0PAG1OpOrvcVuApHNrn8JLOdhHTHXVl7q
         mllomKbUqjHeCRi1ObHFyAYqh2pNYOX4E5p2rUBa88RW3wapVsbZgMUWcSgqUDhMQxb5
         2+E3E39aCgL7Gae28kklasLT7q6wsr7NnRI2r1YTru6j2nuwltBT3yQSIzt4S+7dtMmU
         qdbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727775034; x=1728379834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RgNupkyjKM2ysAGbIsG0gGy1badDoqPKofkUhbyTKoM=;
        b=SF54O7xa7KaNlyFZRyrnjJb5akHQa6FlEVYoGXJ+o8E1JZjLOcmKiiKaMSu1Aqpnyf
         CE8iJ7w8ttJEsMKn+GzvaC2/UXDO2H/BQajx24Ma2z/uuSQ51Hzd7c6rvgjj0oX0mc+t
         TsfywqHU3jxii2aLBj9ZzByW1Da/m/JeBv4CKDdcgklrcMEgxuNDhNYKRL6vuCIWsuAM
         ZMrgKcZmdChgVSHUEsa7p6GYVwFKt833BfWrNzGQzj4oNH6D1J5JaWj4kB1iyjvAz/Wy
         Hd9ZiSGl9ASkn+iaz1KGM8kBYhPhuLxygAQLiKHuJ4Y2YV4h8IMhHE3ikB9KucsKrB/k
         M5lQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/n8VypjkA5AVNNsvgsmR+psqo2sSJdurGY/QRL7zOeK4Q4CQ5xIpqSw9yWC8VV//uk07fj+a9xOaQdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyE9Z8edrWuao3mN3b0WAFfo4OPoC6xpwwamc0A9NoTYJsYIEzK
	ZxcGbaz1qpZuAPjziwIafur7NCGJ4VUkzPuzkS+wRHyP35ekf6LlsY3lOynAoY8=
X-Google-Smtp-Source: AGHT+IGB9dopkczYokJgV8nk4MY0kFdPv5z9uTEesO4k2VaH/NmikSHc794uEgWF3r+nTMZn2extfA==
X-Received: by 2002:a17:907:a0a:b0:a8d:14e4:f94a with SMTP id a640c23a62f3a-a93c492aafbmr1644389466b.38.1727775034202;
        Tue, 01 Oct 2024 02:30:34 -0700 (PDT)
Received: from [192.168.0.15] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c882493e54sm5913896a12.80.2024.10.01.02.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 02:30:33 -0700 (PDT)
Message-ID: <e7cc5f91-a0a8-48fc-9eb6-b9c46b22dfeb@linaro.org>
Date: Tue, 1 Oct 2024 10:30:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] (no cover subject)
To: Luca Weiss <luca.weiss@fairphone.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 cros-qcom-dts-watchers@chromium.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>, stable@vger.kernel.org,
 Hariram Purushothaman <quic_hariramp@quicinc.com>
References: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
 <D4JK8TRL7XBL.3TBA1FBF32RXL@fairphone.com>
 <fc0ce5cd-e42a-432b-ad74-01de67ec0d5c@linaro.org>
 <D4KBQ3ENKF5Y.3D2AK81PELAEZ@fairphone.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <D4KBQ3ENKF5Y.3D2AK81PELAEZ@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/10/2024 09:24, Luca Weiss wrote:
>> media-ctl --reset
>> yavta --no-query -w '0x009f0903 2' /dev/v4l-subdev5
>> yavta --list /dev/v4l-subdev5
>> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>> media-ctl -d /dev/media0 -p
> Hi Bryan!
> 
> These commands are to set up the pipeline, and what then to grab an
> image from it?
> 
> I tried this, but it also just hangs:
> 
> $ yavta -B capture-mplane --capture=3 -n 3 -f SRGGB10P -s 4056x3040 /dev/video0 --file=foo-#.bin
> Device /dev/video0 opened.
> Device `Qualcomm Camera Subsystem' on `platform:acb3000.camss' (driver 'qcom-camss') supports video, capture, with mplanes.
> Video format set: SRGGB10P (41415270) 4056x3040 field none, 1 planes:
>   * Stride 5072, buffer size 15418880
> Video format: SRGGB10P (41415270) 4056x3040 field none, 1 planes:
>   * Stride 5072, buffer size 15418880
> 3 buffers requested.
> length: 1 offset: 3326519176 timestamp type/source: mono/EoF
> Buffer 0/0 mapped at address 0xffffa0c00000.
> length: 1 offset: 3326519176 timestamp type/source: mono/EoF
> Buffer 1/0 mapped at address 0xffff9fc08000.
> length: 1 offset: 3326519176 timestamp type/source: mono/EoF
> Buffer 2/0 mapped at address 0xffff9ec10000.

No there's no CSIPHY in that case, it should be the TPG inside of CSID0 
@ /dev/v4l-subdev5 which generates the data.

Just for verification purposes do a  `media-ctl -d /dev/media0 -p` and 
confirm that /dev/v4l-subdev5 == csid0

Rewrite the above as

export csid0=v4l-subdevX

media-ctl --reset
yavta --no-query -w '0x009f0903 2' /dev/$csid0
yavta --list /dev/$csid0
media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
media-ctl -d /dev/media0 -p

basically you have to make sure you've set the TPG on the correct subdev..

Something like in media-ctl subdev4 in my case.

- entity 13: msm_csid0 (5 pads, 36 links, 0 routes)
              type V4L2 subdev subtype Unknown flags 0
              device node name /dev/v4l-subdev4

=>

export csid0=v4l-subdev4

media-ctl --reset
yavta --no-query -w '0x009f0903 2' /dev/$csid0
yavta --list /dev/$csid0
media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
media-ctl -d /dev/media0 -p


---
bod

