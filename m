Return-Path: <linux-media+bounces-18786-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9301A98A131
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 13:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B71CF1C20ABF
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 11:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253AB26AEC;
	Mon, 30 Sep 2024 11:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aehP+3gq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FF4189F35
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 11:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697245; cv=none; b=o2qSqE3Sz20568k7HeJ4T4qMXCkUQ8y72lP9qQMCMCb7Vbr+Fw4r+Uwk7CSMA/p60t1hGtEbEV+HwaBsZJgoD/uWOmuS8od3Ip6BuvLW+pQizICZO31j8nUbWK4iJP7xtorUT2Fa0jQiN/5gpnMyamyYMNuYhd4kPbFjTNxNEuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697245; c=relaxed/simple;
	bh=qkLNUngCO3vVH4Yoiw8pI/xWuNpcbC03902wQmKdSRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iDRvcPKWctaVDvYaWiCMHaKdKpbmQIrJ0Ws4zfXAUFKPgHDNzBRKka7fY1xPPvrXsRdbh1eLyJv+KfQa/gHjfsMXhOVzDYJwQGdAXNmy+MsrqUC9pGRi9ASjbiVopTOQ/UBvqn0OZ1V2dzI+f0+urLERgd2BZlK45S6O3kFpOK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aehP+3gq; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8d2b24b7a8so976914766b.1
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 04:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727697242; x=1728302042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YEimAb6QNu/M6q7/HcG/qwn6XiKDPC6S4Ayvzi/SkBk=;
        b=aehP+3gqWaJULQ/vvtoMbIhicHnjlGTnF/1ekDyvgz67A8/hbi5eE+ARYI+otoYbxs
         i+SGrdVfUnzE00hBqm8QqaOxeygz8rWRm01vLklsqUyue8m/kGnatd23N8atOCHc9cTX
         ric11/wHXRv7AKZ6rRHJVfZUJxTFIkOV67WXCF7dccxovgIEhkhKI6xcFQ6ScrnGNByZ
         Np7ag45VK+sIta/dfTyWFFr8O74ehxHWnXiGfBTCUFDcJgtuqZH58bMSPIoT9KwpF4ut
         3cW4gcoZ+2DF/PdNYFj2hUQskyWxjSrFKRLQtPyEM8C6/42zqHo2GYGMivatX9/+wYQc
         xuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697242; x=1728302042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YEimAb6QNu/M6q7/HcG/qwn6XiKDPC6S4Ayvzi/SkBk=;
        b=P5WoNmySJr05YC3s93A+Q96ls3xvxQOAecaAcjW3bTANOQxPo4zo/Ymts6YUoNgac0
         HSsXYs95O/Df4d9PiOugQVkxkefjrOejl04CGeL5RaQ7yc/m8M/BwAUuYOQlBsY3zedI
         RvRvwArs2gwph5by72e9FGPh0Ocrgboayl7NHpVrL4ewgIt4BKzn4Xn90pDDHZS7MGjJ
         qA5Hq+7bzGymHKtp3To/vBmovo7VxzYpjccMERiWW30c0TshEIJtea2EgkD3LCvafNn/
         qvwFQgexYYJFRrEsXD46kTwxKR/iiSn0MVTPK69FE7mNfNaABAFRqu7bwGoRRiHgz/GO
         PEkw==
X-Forwarded-Encrypted: i=1; AJvYcCVjkB+fq+ckPuz4kfrKID6NArMcy4n/+Sp977zzf1RPAzdkQ8SUdjTYOb8JTJCOk84r1otDiVoieOFJlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3sPmj+u2xtu4xrrnUO8pMer8WgLWEwBVnKq2B/06vitdIx4GK
	6IUF+7k07HSbovkghpkDG0Msu8OZfJavWER2KagKIS9Gf00yCT4T/FZBrxBIeZA=
X-Google-Smtp-Source: AGHT+IGgin2IoYFaSU76/H2WqaTZ8JyrgVaOMWPRHPfSW65ukzeOWOYx6iUHDJKgyZKQ7I4p0bVHKQ==
X-Received: by 2002:a17:906:db06:b0:a8d:ee9:3888 with SMTP id a640c23a62f3a-a93b1679678mr1578907566b.32.1727697242334;
        Mon, 30 Sep 2024 04:54:02 -0700 (PDT)
Received: from [192.168.0.15] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2997445sm517446566b.202.2024.09.30.04.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 04:54:02 -0700 (PDT)
Message-ID: <fc0ce5cd-e42a-432b-ad74-01de67ec0d5c@linaro.org>
Date: Mon, 30 Sep 2024 12:54:00 +0100
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
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <D4JK8TRL7XBL.3TBA1FBF32RXL@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/09/2024 11:52, Luca Weiss wrote:
> On Wed Sep 4, 2024 at 1:10 PM CEST, Vikram Sharma wrote:
>> SC7280 is a Qualcomm SoC. This series adds support to
>> bring up the CSIPHY, CSID, VFE/RDI interfaces in SC7280.
>>
>> SC7280 provides
>>
>> - 3 x VFE, 3 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE
>> - 3 x CSID
>> - 2 x CSID Lite
>> - 5 x CSI PHY
> 
> Hi Vikram,
> 
> I tried this on my QCM6490 Fairphone 5 smartphone.
> 
> Unfortunately I couldn't get e.g. CSID test pattern out of camss. I've
> tested this patchset on v6.11.
> 
> These commands did work on an older sc7280 camss patchset (which was
> never sent to the lists). Can you please take a look?
> 
> v4l2-ctl -d /dev/v4l-subdev5 -c test_pattern=1
> media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> media-ctl -d /dev/media0 -V '"msm_csid0":1[fmt:UYVY8_2X8/1920x1080 field:none],"msm_vfe0_rdi0":0[fmt:UYVY8_2X8/1920x1080 field:none]'
> gst-launch-1.0 v4l2src device=/dev/video0 num-buffers=1 ! 'video/x-raw,format=UYVY,width=1920,height=1080' ! jpegenc ! filesink location=image01.jpg

Here's what I have for rb5

# CSID0 TPG RB5
media-ctl --reset
yavta --no-query -w '0x009f0903 2' /dev/v4l-subdev6
yavta --list /dev/v4l-subdev6
media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
media-ctl -d /dev/media0 -p

Maybe on FP5 ...

media-ctl --reset
yavta --no-query -w '0x009f0903 2' /dev/v4l-subdev5
yavta --list /dev/v4l-subdev5
media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
media-ctl -d /dev/media0 -p

?

---
bod

