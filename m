Return-Path: <linux-media+bounces-10853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7E58BCBFB
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 12:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCBFB1F225DA
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 10:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83A114290F;
	Mon,  6 May 2024 10:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S5l+aU/O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49E843AA5
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 10:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714991161; cv=none; b=kaPkmBCPzOD2CM1jCjotvXiEZtWmjoEQGzV16prGltf5Lxa7fN4c8J8RapYR4T7iLmJpVVZnGmmgefC/WV9oEhqv4LjzqRkIVWiDm7Y/rTHE2t/vjafu/3gIZjaCEUxju8STknSOaFPip/xOsGnIkgU+9CAtpvP5tahd9thBgWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714991161; c=relaxed/simple;
	bh=n1RXK8PRBumr7Cq4eyUxGTgGPR5PK0w81QRMXZNvDgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sx+Gr3/q4Zu7X5+fMPkmJEyC3iePYlE+nN1+H3QEXb7m5/O4fqMLXl7sjnfph9HD1LHThnC7C4bFC04C6O8yTM9mi8MMLvpN282nLO9H8CzIGAZuX7Spw78i5GUByrNWJu6PsjZj+NMIqDJT7l8983yIHVmxRKvHOOnQ3rgh0L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S5l+aU/O; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41dc9f98e8dso22494835e9.1
        for <linux-media@vger.kernel.org>; Mon, 06 May 2024 03:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714991158; x=1715595958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MqztIhrDR9HC7lP+81EAWPGKzTvE0svV34mJctlOoNg=;
        b=S5l+aU/O1TbOhhRwMy6jHOWI0Bkxb7N2kkbRK0VMYr79PhTtp9/zxqbRkHxT5dt1/h
         IyHSVDYCW5VNu/xE58g+EIpH0QNbWSyYmVwCBs/0ytXcZv4Wpd8WIVGZb35kGgMeY03K
         66sT5VxRaCVgW2FUucx+e6PHpmZoGfSLyZAjUx1/QicvewxNjDC7gfx/vIzTBKkr0Iz2
         cCMU5+F5b904XXUHB7OuXCN1KOmLCt1HD/WGvPGDMBoKIK7hRTUQV1XCHrAYLUae09N0
         P0CyUKMuuFkV9RKo4KiyjRPoVby8SFzyEunRF0rn9346SfpgCDS4MwwPl69SkKmZY96I
         RJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714991158; x=1715595958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqztIhrDR9HC7lP+81EAWPGKzTvE0svV34mJctlOoNg=;
        b=S+wPoLdQJ0a5pfku4yRvpYkdwOgU9y3xjuEAumOKdVx14THhXoUXmeQ+VOn+d+87hk
         82pQ8uytLxrCqH7+HTmR3a5uDOKRp3gQOaWX6ZuG6mft/0kQ79A3RClbyDlRCNVWNG5b
         bKWOoP2ATlpHI0xD2XvteNq/aLnt+k6su7pyhEbby6/r9ptBQrQhggdawbI+1xQfWpg5
         rktSPB1y1e690oEz+KFDWXBEQhsns+gHZrxMApVx9ZHqc3WMq4tqbtdeimTqlMKUwlGn
         tT2F44CXBRxyLzALyqvq8QJNUnyr5Iy9wupc70qVKHyTVzXEqM8lJjyQb/YdACouyNxl
         c62A==
X-Forwarded-Encrypted: i=1; AJvYcCUw7JZz4XMV0z1c1q5RijURkuwcdTqt494oepto4NW+vN2EGVg/G7/NWKB/z58UVrz2apVDYjf49HN84a602NgYAdkXjqMiiXwLojA=
X-Gm-Message-State: AOJu0Ywv36zUTiIjiJFK5d7cAuw2dM3fFmQotrATDChu4XWBzTbQbXJW
	rYnmwk37NLAdaf/cXt/ZZG/UK7e/xfskdCYQZhiUtXhHCz8Sn181mOJTwME0TGo=
X-Google-Smtp-Source: AGHT+IHOLVwBDFR0EUE4X7BqnBPhVbSRb3vyCDe9DkuBfXIisPyXPVqyyVT8KZlJSXWpQ8sV4pDLvw==
X-Received: by 2002:a05:600c:4508:b0:417:eb5d:281b with SMTP id t8-20020a05600c450800b00417eb5d281bmr11469960wmo.17.1714991158177;
        Mon, 06 May 2024 03:25:58 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id g20-20020a05600c311400b0041bf685921dsm15561933wmo.0.2024.05.06.03.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 03:25:57 -0700 (PDT)
Message-ID: <12daeed1-0075-4a6c-bd02-dc70a0c0d721@linaro.org>
Date: Mon, 6 May 2024 11:25:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add support for qcom msm8998-venus (HW vdec /
 venc)
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <ff646f97-68e3-4fef-9b56-2bd98f0cbe7d@freebox.fr>
 <f5b9c8d5-d8ed-4dd1-9cd6-fb016d84cbd5@freebox.fr>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <f5b9c8d5-d8ed-4dd1-9cd6-fb016d84cbd5@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2024 10:57, Marc Gonzalez wrote:
> On 30/04/2024 17:28, Marc Gonzalez wrote:
> 
>> Changes in v2
>> - Add Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> for patches 2 & 3
>> - Replace qcom,msm8998-venus.yaml (copy of qcom,msm8996-venus.yaml) with item in qcom,msm8996-venus.yaml
>>
>> Marc Gonzalez (3):
>>    dt-bindings: media: add qcom,msm8998-venus
>>    arm64: dts: qcom: msm8998: add venus node
>>    media: venus: add MSM8998 support
>>
>>   Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml |  4 ++-
>>   arch/arm64/boot/dts/qcom/msm8998.dtsi                           | 48 +++++++++++++++++++++++++++++
>>   drivers/media/platform/qcom/venus/core.c                        | 42 +++++++++++++++++++++++++
>>   3 files changed, 93 insertions(+), 1 deletion(-)
> 
> Not sure what's holding up this series?
> Can it be merged before the 6.10 merge window opens?
> (Whose tree is it supposed to go through?)
> 
> Been working on this feature since Feb 19 with
> [RFC WIP PATCH] venus: add qcom,no-low-power property
> (First try turned out to be incorrect)
> 
> Regards
> 

Vikash, Stan.

I think this is ready to go, can we get an Acked-by so Hans can do the 
merge ?

---
bod

