Return-Path: <linux-media+bounces-22471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 246DD9E09C2
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 18:23:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1779B29A86
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 15:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35DB220898B;
	Mon,  2 Dec 2024 15:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="QJrAvFU9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3DA207A23
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 15:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733153409; cv=none; b=lFQApGW3rbc4l9ib+3/rCn261YyzUkdok0c0ch48j9MqUC5NubPagxhOxhx7mA4yqKkwT9rDoLC9Hyc6qeFPoau7B6PNF0N0KzWrN2MhvFSjKhU6934gwAZUge76A4c+WX+bwK5BrDsSZrg+eFmF9+L+kRhwK74HpSgTT4FcAQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733153409; c=relaxed/simple;
	bh=4xxCGmBo7FQG0p5BmYqe1NOagdrpfXWw9XcSG+Ugioo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D38r7MVfHww8Ys4RO+SahUaJklf6Ovps6KFYYhgAdMsp68BC5zHew1QRKt3bxqo3YOMo1Ifpc8vu50+KdGzAV+buwLlclJSksZqHnLH3MDz2ei+A7jFJlMIJYXo5W2kYNRwD9gSEu0SwGhPtZQQLd3MjrJKJBnWM4/l/P7DtM7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=QJrAvFU9; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43494a20379so35879555e9.0
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 07:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1733153406; x=1733758206; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P8jtIniQHqaGnIfrwCj5iJuQZ/gWHR/Lk4yIJETbzAw=;
        b=QJrAvFU9PGw4ecwNa9iwbiRcvMsM81tKQr2eYUFLVZkF/qYnhOf9N0FQ58Lnx1mJJH
         I9lbBL/yQxGzCV1CDfuodaYjDdma6kNDxwlHlnxatZbCKFY07MumOpCV5KAhH5850Ppu
         grS+FyUAuQTeel53Bn9q1qvvzWyW/d48rXzKaaaBTjCOQ/dukEtLS3VXBC3L/pLelLIm
         QJmhZ5SCQMp79/q2hgKF0fdvvIZPFEm01BWAQBfwXUz6+rgoOniIXUd/BDdz1s7hW/Vn
         f5hPDXSFT1XD3rxMAgQwTPkuqfHlOOzCxOXfLgvogec9bUjNWh1tPkzVZQSpnsZSWcCr
         pE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733153406; x=1733758206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P8jtIniQHqaGnIfrwCj5iJuQZ/gWHR/Lk4yIJETbzAw=;
        b=heUvuFC6gvIciMd/lzlEa8nEBhqQi6EiCC+xcPZoW6OC8cFJeo/s92U2tg5w2s2zY9
         colixePQIrA7MXzO2uRubmiRzd8x4Tit3z/vEQBUIUyb7AO+kmjxuz0ELZ47r46ZeDgb
         F2c9mVnOi1t5Rt4c3trFQL8NvMblLHl3h5Sbbn0BbS/MFQrGYkvPiXg/9PwCIcIH+JyF
         qcSo+JomfJtaPDC53ReehwJk2bFomONFbfaTcNCgLhVjFy1dXw0B4aEHkWvRQVRwdSub
         0cL5bFIxR/f2S+iVcR7NjccwKa9ALxVkHUOmRL8y6FmCuT/ktI59qwZnYlEI8eTZU6K4
         tEbA==
X-Forwarded-Encrypted: i=1; AJvYcCUwBCG7tyKIBT1l9STFHeSrSuTNMmBL3T1tOlthbKCJg059MW+y8tqhBvzM85Yo4rc7XG9vqELonmdfig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfZ5/lcRSvG4oD99CmpJIbJc07Fhj5KZSb7OFFmfZyI96ULJMI
	0M85UNRikCBEbFXJX90G4kVhE8bDeetMFh5Od+CxTW0MUL0OOoq32yfHpjs+2KA=
X-Gm-Gg: ASbGncuWL2ELWiXEG30BaC2wSV9Cw2UiwsTnCsEGFAk9jMhOZnVaWLYLBbRrvQe67mV
	FRVW8VUP4tXHhA5lfjJ7ODmdUvLUVAjaallpHENfvZmv2KLz8ZqSwfvz1a5od27Xr3JH1tGsZ7e
	+CEOQCDEUrpG9KQABu7L4xzgw9aXZwxxev2GzK6hHFa2cdAQQ1en4cAazi/+dcgP6/UA1t+n6GU
	pwTfZ6bdUdXESRiPjveSU3xKjcdCHa2BLXj4bpuI9O/n/lUYfi4/hI1OFOIVedM0w==
X-Google-Smtp-Source: AGHT+IH1hTljFKEA9DHhDP/Bl2T9X3iPXf4B7h5kmrrQdKTb7FK5jK4sFt7iXegFoa1F8JVAtQP1Kw==
X-Received: by 2002:a05:600c:4447:b0:434:a5bc:70fc with SMTP id 5b1f17b1804b1-434a9dc3c8emr211879435e9.8.1733153405821;
        Mon, 02 Dec 2024 07:30:05 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e230b283sm8019425f8f.106.2024.12.02.07.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 07:30:05 -0800 (PST)
Message-ID: <90fc1097-d353-4b6a-bcbf-81f8a8e24390@nexus-software.ie>
Date: Mon, 2 Dec 2024 15:30:03 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-4-54075d75f654@linaro.org>
 <02dd5593-38ba-4344-aa64-0913eca45808@oss.qualcomm.com>
 <2chygbm3yjozhkhps64oae5gwirdk5b3orsybss7jgutu5g7ke@4jskpnermxfm>
Content-Language: en-US
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <2chygbm3yjozhkhps64oae5gwirdk5b3orsybss7jgutu5g7ke@4jskpnermxfm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/12/2024 15:02, Dmitry Baryshkov wrote:
>>> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
>> This clock is not registered with the CCF
> Isn't that be going to be handled by the CCF on its own (like orphans,
> etc)?

For refence this is always-on ATM.

drivers/clk/qcom/gcc-x1e80100.c:	qcom_branch_set_clk_en(regmap, 
0x26004); /* GCC_CAMERA_AHB_CLK */

---
bod

