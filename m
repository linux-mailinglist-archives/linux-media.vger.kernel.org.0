Return-Path: <linux-media+bounces-13993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E07A913EE4
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 00:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 383E0B214F7
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 22:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29301850A0;
	Sun, 23 Jun 2024 22:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AxXDfu40"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AB11849F5
	for <linux-media@vger.kernel.org>; Sun, 23 Jun 2024 22:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719180820; cv=none; b=F8HuG/ZiXtJZBHzgTEaaBQwJh/JI2oycE0PRAmZwHYERLte/pQQrn0LLHMjBmIN/1CUUWb320nhoftud2c37idZiP57uUvIu5pRo1xuQ01oF1HpgevXNTBwbOSxrsyQOxTR6bCyYMqJXd0cK5stynExD83wblimj1JG2RsWU6pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719180820; c=relaxed/simple;
	bh=t1aJlbPrDE27weRoRSAZ+KfV03SpoBgR2r3DRxatZWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lmcKkY+cVdr7ESTfqDelpscK1qCuTJMAtDwtf396JSCAGP3F4k5X4SRWXGzPVGJ/Gp3LO5v0DcFgzPn0eUb0o8+mH1BT2W+ufaeDKLGXV+aAc7B5NTcmtjHQB6Fv5sJo3dg/mO1U3+sLcweKmMr82gsJ7qgXeZo9keu/yxFANbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AxXDfu40; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-424720e73e0so32724215e9.0
        for <linux-media@vger.kernel.org>; Sun, 23 Jun 2024 15:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719180817; x=1719785617; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WfAeBdvIoKGyGbUJs+5en2LQCmL61huY76I64Cj6UXA=;
        b=AxXDfu401z3Nwo3aDWTYjI1ABPlW8e8R+baTPspbOm19z3Fw8klwYkPvR5FK7tVGMo
         eJgjzinHJv3mcMFuQYuT2839NpR4hXW0Kj50piquD8RyNs3QhVQNaWnYRk6zZjboelcB
         JFfAJ7aYXtL1K8y9G6x2u3jL4r/7T+UxrTTkDylQVWa8juQUhIiRklsGuHjRdEUMBt1I
         njVNdEfiVdFao1q51UUKshYgtemwA/RZEhJ6v6ZF2N6O4ibyM9t/ufoSFeSiCtoW8iXv
         4DbVGLaSheKTcTwi8d0Q9DybgRitddgxIIPtZ3Pa79P3lA9W0iqTnyVldl3p0c39x8ga
         8mhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719180817; x=1719785617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WfAeBdvIoKGyGbUJs+5en2LQCmL61huY76I64Cj6UXA=;
        b=sdjFwuSpgsmNyoW6ZZv3X0BoZy8zknb6q9b3OZZOlo4d+QfS0c+SRwliuBwH0xVz3S
         ntfEhxQiYTOJ2bporRmYkagy5979omRX4VfaC2b4Ucumj6pFBCeqe9KhbiFFgXU1ASPF
         obyjgP9rXoRgeXHDvcyNppGuUBxWvskAAm2bHhUtFEHLhOcWnlyqtsViSo5Ce2x8w6x0
         YlZYD57MeIb7l5vVJlhPzdVN/avdtp+5Jybf0CQPtpcx2E7QVl1u/qLiqOhjR26bIwZv
         RitrIKeUztqVDawFu9BNo0tJujlhB/g+3+mlzQM/e21CbEcWlcEkf0EP530elWfm0nsX
         e/pw==
X-Forwarded-Encrypted: i=1; AJvYcCWZK3e+asMCwENavMwqSIKn9QIip3wFjA6TAOacVSV3rduSrGQhBcdMHLXegWDg9x26jrQk5VbZ3/3i2ndE/4BNZXsxhFDpCvc64vU=
X-Gm-Message-State: AOJu0YzpvsAnyDg2Jq/LDN+TwfAFHS6PqnFV0m8nSq95n6p3cZvr7NWU
	LU/dGOjzXzcXdvVw6t0Ch1yoJCqaadmhoVRxEn4BwqC/rTQbZ2Hui2U9iOedXyA=
X-Google-Smtp-Source: AGHT+IHzpd18VN3XGaaoHGuAVvQ/sKRZalYdmsgQw/7bPccPtW4ds29vx37N4ZomBsEHOO4cB0qHLQ==
X-Received: by 2002:a05:600c:4b91:b0:421:de31:4e with SMTP id 5b1f17b1804b1-4248b9ca8acmr21873945e9.26.1719180816761;
        Sun, 23 Jun 2024 15:13:36 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0bea1esm152045565e9.13.2024.06.23.15.13.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jun 2024 15:13:36 -0700 (PDT)
Message-ID: <f0c3e0f5-e5a3-49e1-8b9c-57fc7af5d71a@linaro.org>
Date: Sun, 23 Jun 2024 23:13:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] media: qcom: camss: csiphy-3ph: Add Gen2 v1.2.2
 two-phase MIPI CSI-2 DPHY init
To: george chan <gchan9527@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com>
 <20240621-b4-sc7180-camss-v1-3-14937929f30e@gmail.com>
 <cd9b5612-1160-4284-be7f-4efbcbbbe346@linaro.org>
 <b9deca88-8e1a-4017-a0fc-6a77672d684d@linaro.org>
 <CADgMGSs7owyvvvRTr4YvCdmMiJV86CjD5YLsJiBZZONDhfFisQ@mail.gmail.com>
 <ef218f06-283a-4e7b-bafd-382c47248106@linaro.org>
 <CADgMGSuaKKNgkVjcWA__fJkmeHYXgE47YfObHddp4e-gTH3NEw@mail.gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CADgMGSuaKKNgkVjcWA__fJkmeHYXgE47YfObHddp4e-gTH3NEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/06/2024 22:37, george chan wrote:
> User-space tool can't tell so I made some guesses.

So how are you testing ?

Libcamera on your target rootfs ?

# example 1
cam -c 1 --capture=10 --file

Should deliver up ten frames to userpsace.

For me working means either

1. Sensor data delivered to user-space or
2. Minimum test pattern generator (TPG) data delivered to userspace

Here's an example of the TPG on the rb3/sdm845

# example 2
media-ctl --reset
yavta --no-query -w '0x009f0903 9' /dev/v4l-subdev4
yavta --list /dev/v4l-subdev4
media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SGRBG10_1X10/3280x2464]'
media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SGRBG10_1X10/3280x2464]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
media-ctl -d /dev/media0 -p
yavta -B capture-mplane --capture=5 -n 5 -I -f SGRBG10P -s 3280x2464 
--file=TPG-SGRBG10-3280x2464-000-#.bin /dev/video2

If you can't use libcamera to do the v4l pipeline setup you can do so 
yourself manually again here's rb3 setting up the pipeline and reading 
from ov8856.

# example 3
media-ctl --reset
media-ctl -d /dev/media0 -V '"ov8856 
'16-0010'":0[fmt:SGRBG10_1X10/3280x2464 field:none]'
media-ctl -d /dev/media0 -V '"msm_csiphy0":0[fmt:SGRBG10_1X10/3280x2464]'
media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SGRBG10_1X10/3280x2464]'
media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SGRBG10_1X10/3280x2464]'
media-ctl -l 
'"msm_csiphy0":1->"msm_csid0":0[1],"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
media-ctl -d /dev/media0 -p
yavta -B capture-mplane --capture=5 -n 5 -I -f SGRBG10P -s 3280x2464 
--file=ov8856-SGRBG10-3280x2464-000-#.bin /dev/video0

Maybe its an obvious question but, are you currently able to read from 
either

1. The sensor - thus proving the PHY init sequence you have or
2. The TPG ?

as illustrated with one of the examples [1, 2, 3] above ?

---
bod

