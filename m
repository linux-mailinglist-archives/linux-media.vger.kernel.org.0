Return-Path: <linux-media+bounces-14631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB08892754A
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 13:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 877762833CA
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 11:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F5A1AC427;
	Thu,  4 Jul 2024 11:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="Q+VD2LFz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1585E1AC43D
	for <linux-media@vger.kernel.org>; Thu,  4 Jul 2024 11:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720093182; cv=none; b=GLpRgz8BZGPsL9sOkrA18mrtj4GdgO+fbUxAA9nuGgvKxhi++NEUq2ggUPBq7vBrNW2boUtL6TdT43Nvxxs4W8+dSso7KtwbATFUwrUalKWModTGiG9FQde7GRU9p9NDFTDlVOrdnuvjg/VbYg1Zc3LWmzn+oqBN+h/Opuv3SiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720093182; c=relaxed/simple;
	bh=cebFaK1PCNoKeU18B3oxIeruyJcc2wRP3KXLZsY2bZQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=lJ4J9JiUaEsEoOSu6zu9xs4t9PI2jCDr9pEIE5ulAwrFvwi7i5O6vCfoLmH3Ke58k0NdtS14fL0CSpo5Ovyk+EHq3aYxo29M9psWPlsmxdF9j7hGUGOBJPkqwdqrWBMG+xhAVXNui+vbkn3ZW+OA9hl//tf1Ik8LdyWvXP4fnxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=Q+VD2LFz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42579b60af1so3731865e9.2
        for <linux-media@vger.kernel.org>; Thu, 04 Jul 2024 04:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1720093177; x=1720697977; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iG2QvdM8ow9ri0MC7ZjMDAjQNyzUeAXguRK1dhaQ4EU=;
        b=Q+VD2LFz62xzTrEsLOTKhq53mV4Jmh6fh3UAtogAo/IGFxsbUey3/IYsJn0KNsmr5F
         P0KSrax0jO6q8cVbklyPszEoQX9rw/eLGBce1B6TCqI26L82JO2DuMez8OruetiBjKiw
         KBHgQgzR6BcOw/6P2k2WkNfdDK3NsoK6CKEYFadWfSyHnWY2mkkjqVfX8KRtCG0vslZI
         4bv2k7FmMn0dmLhNIGss16g5ROyoseGOLDr21mxtmzqMSf+9sp1IqE5TLIBIJ6Om9CC1
         L2tKX5rkPQQenueG/d+x9/3FTby5T4I7K/Zxu1hEd7wKwkkiQyV3Feek1KpI1dfjGbjf
         yIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720093177; x=1720697977;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iG2QvdM8ow9ri0MC7ZjMDAjQNyzUeAXguRK1dhaQ4EU=;
        b=Tdzeh1p6C7IkFopkWW8LZQZI3ugC34pJ7uHjqfntLlCPcaIXy3ygeAk26GdFlp7Z7N
         qTWBkBZbqR9rNojNLCguh5Ge0SkjoNRh0cjnd+u6uVUOFSaqiEGAaBjUPp4/tHnQ/VMS
         GUb8TeCJCtgZ1pvumxWJzwuGMR2asJoB9PwtM5txny59GftNKRtrxUV/HD92QZ+tNHFQ
         uJZtP3Xvqiqm6crZIx+t9hunLIWnMkIAgOuqLTr5HzW2eR1CFx/KXjPwPjT3VCmgmI0N
         3r4zivQX4jridlnB2Q20xlnbewjEjF5jXgIaIGTWL08/SFO/EcyBkL8+3gtQCGwZu3/H
         UC1A==
X-Forwarded-Encrypted: i=1; AJvYcCWeMy8SxPf9FNWeJIG1NvjYps1d9jKxDJt4BNXfp5GpQVGzDOLaZEDSboGcCzqyXUDUkB9BuljWFqjAmwfheE9a7nJWCCOhc2PSQdY=
X-Gm-Message-State: AOJu0YxTsT1dtZYQhMm2ecnX7/fVbAvPAO0Kn4ge3TWkPE9Aa5en8uoS
	D6K6zOTOCmuSuNuDDAyFr5qcaRi1uhJLhSmt10CV/AMGMW2/o39W8osraXRDlIo=
X-Google-Smtp-Source: AGHT+IFF+9XJUYkfl3PDjXhqWeuEZV+2D54hXSyv5DSMVDSNk+SGcKx5ctLEi9Wm7CrneuFEpTI6LA==
X-Received: by 2002:adf:ecd2:0:b0:35f:1dce:8671 with SMTP id ffacd0b85a97d-3679dd29926mr1099679f8f.25.1720093177309;
        Thu, 04 Jul 2024 04:39:37 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679d827789sm1398974f8f.76.2024.07.04.04.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 04:39:36 -0700 (PDT)
Message-ID: <0d66422c-ab7b-4364-bd74-d2aca24b8a2d@freebox.fr>
Date: Thu, 4 Jul 2024 13:39:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Add support for qcom msm8998-venus (HW vdec /
 venc)
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
References: <8b2705b7-f33c-4ebe-a6a8-c5ef776fe9ad@freebox.fr>
Content-Language: en-US
In-Reply-To: <8b2705b7-f33c-4ebe-a6a8-c5ef776fe9ad@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/06/2024 18:41, Marc Gonzalez wrote:

> Changes in v5
> - Collect latest Acks (from Vikash)
> - Resend to Mauro
> 
> Marc Gonzalez (1):
>   dt-bindings: media: add qcom,msm8998-venus
> 
> Pierre-Hugues Husson (2):
>   arm64: dts: qcom: msm8998: add venus node
>   media: venus: add msm8998 support
> 
>  Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml |  4 ++-
>  arch/arm64/boot/dts/qcom/msm8998.dtsi                           | 48 +++++++++++++++++++++++++++++
>  drivers/media/platform/qcom/venus/core.c                        | 39 +++++++++++++++++++++++
>  3 files changed, 90 insertions(+), 1 deletion(-)

Hello Hans,

I got an email stating:

The following patches (submitted by you) have been updated in Patchwork:

 * linux-media: [v5,1/3] dt-bindings: media: add qcom,msm8998-venus
     - http://patchwork.linuxtv.org/project/linux-media/patch/2db42e45-c034-43be-be96-0e88511d1878@freebox.fr/
     - for: Linux Media kernel patches
    was: New
    now: Accepted

 * linux-media: [v5,2/3] media: venus: add msm8998 support
     - http://patchwork.linuxtv.org/project/linux-media/patch/eb15a48b-6185-42dd-92ca-8df33b0ea4b5@freebox.fr/
     - for: Linux Media kernel patches
    was: New
    now: Accepted


Yet, I've gotten a warning from kernel test robot <lkp@intel.com> stating:

arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: /soc@0/video-codec@cc00000: failed to match any schema with compatible: ['qcom,msm8998-venus']


Is this because the patches are not merged in linux-next?

Will they be merged in v6.11 ?

Regards


