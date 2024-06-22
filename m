Return-Path: <linux-media+bounces-13965-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95571913350
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2024 13:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 244C31F2320D
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2024 11:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0E315442A;
	Sat, 22 Jun 2024 11:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r2VL2iC0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD49F14D6E0
	for <linux-media@vger.kernel.org>; Sat, 22 Jun 2024 11:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719055242; cv=none; b=LekPAAf4JHd1f22j0EBgNmCBhjrsjchxu0tih5FnZa7HnbMp7wjXCsNUyQrS7NAUQP0465MkN1x2QdNKezVTYzmKBHHdkQg6WT8p8guKAADmfPyy6yj1hcducqLrdwwn7AAAUnGHM7WYzY4sdbEwwRMT/iHLcQNwsVLumqBnnBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719055242; c=relaxed/simple;
	bh=6OweLc4eBvs/JJvGZrwlp8hNSSJPNRIvBHl6/QSlhA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UAJo3DqJjzPOXcEh8f2OaaNONDhYZitnoXTruVVOM5JJGgAE6bWvaPwKD3zu8Bf9ilK/wVOFaan6GP2fpvWdm8o2mUD4+sV3iYwK3RMdqDXsKVLKKRkZVKKXktPQbwfCBqg/dJxxzECbu1mcR/zN30edqM1hkB6/iY1Bvt7NA/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r2VL2iC0; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6fe118805dso46729966b.3
        for <linux-media@vger.kernel.org>; Sat, 22 Jun 2024 04:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719055238; x=1719660038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=72431nl2SzDcS3jDBD6K/aeYHATt9J2PsD5YXQmzkR8=;
        b=r2VL2iC0f1dR8gNn5BuQBo+5g1eXLevTV9msSsayXkxRezFx4VNqEqKNjLtiHGpyvu
         AmTTFKCgvCn5V9MHIP1PmabX0HhbtO63oMzWYQ5VYkHK/AJcbsCdJo0GPwxujPe1m4xB
         oTK+HEN2laicocILNjga2rRxFPLTiFzDOTpHA0d3AoyqsXxM39raj33tIHGvvnNpVHj+
         Jbg7X0RTvRVJoLI7uUiUmpuvuCpgkd+gPuobi9hCMBqPw2K0AUOMKkIH/Y7i/OZdxqik
         nhxKe9/t7s6prPmCF2D7d/qucxZ2B90CKsRB50ifhLZjiJ1N9nr7FfLzP2oH66VNc+FP
         xyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719055238; x=1719660038;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72431nl2SzDcS3jDBD6K/aeYHATt9J2PsD5YXQmzkR8=;
        b=XAlOizRZqBjqz9HEvlJkws1eQ3X/+guT43L8ti03kD2PDH29vyfyB+MpqUfHGlttB0
         pd8j8HcEC51j5RPhDGJJJtnc+SWCLhx3glcpHUYDvpNp4Cq4cd6KxbHlSfFLWn6aVYKV
         3lu+cQpeTTZPliHy2EKEsMy721HochoU6PnZSQShulkaM1kraMYGznawhacXJiaKx5gP
         4R2Qt/TX+NWST2KOzUr4cfy50O2LDG3Hv+ZWdb2GORtLmNOr6NrLkxMJEdbh9xQIbIp9
         Q2Wu4iY42gE8iNmE6QQmiASlZdilKTeXeQqcLcKV5UZLoUS0bsYBN1EgtzIzNi3a5sQb
         rTLQ==
X-Gm-Message-State: AOJu0Yz/6hBr0/y6ARgK58tA8X0VC2Uf48/NxT1wPMP3KwTHZclmKgyd
	UT4XefG/nnSHvwjUeCJPTG0poqsXmSiZgyJ53KEOqcVaSC/sy+wMyRPrpEtez1o=
X-Google-Smtp-Source: AGHT+IFnkN8a7raSH73gXKwC6s4jpempe+oDE2AIgwSkj4jFfdgTskKwT+iexeGZeZ0CFWRMPu9nPA==
X-Received: by 2002:a17:906:2e94:b0:a6f:e47d:a965 with SMTP id a640c23a62f3a-a6fe47dab12mr62240466b.41.1719055237199;
        Sat, 22 Jun 2024 04:20:37 -0700 (PDT)
Received: from [192.168.128.35] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf428b15sm184204966b.9.2024.06.22.04.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 04:20:36 -0700 (PDT)
Message-ID: <b9deca88-8e1a-4017-a0fc-6a77672d684d@linaro.org>
Date: Sat, 22 Jun 2024 13:20:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] media: qcom: camss: csiphy-3ph: Add Gen2 v1.2.2
 two-phase MIPI CSI-2 DPHY init
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, gchan9527@gmail.com,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com>
 <20240621-b4-sc7180-camss-v1-3-14937929f30e@gmail.com>
 <cd9b5612-1160-4284-be7f-4efbcbbbe346@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <cd9b5612-1160-4284-be7f-4efbcbbbe346@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.06.2024 1:25 PM, Bryan O'Donoghue wrote:
> On 21/06/2024 10:40, George Chan via B4 Relay wrote:
>> From: George Chan <gchan9527@gmail.com>
>>
>> Add a PHY configuration sequence for the sc7180 which uses a Qualcomm
>> Gen 2 version 1.2.2 CSI-2 PHY.
>>
>> The PHY can be configured as two phase or three phase in C-PHY or D-PHY
>> mode. This configuration supports two-phase D-PHY mode.
>>
>> Signed-off-by: George Chan <gchan9527@gmail.com>
>> ---
>>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 120 +++++++++++++++++++++
>>   1 file changed, 120 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> index df7e93a5a4f6..181bb7f7c300 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> @@ -348,6 +348,121 @@ csiphy_reg_t lane_regs_sm8250[5][20] = {
>>       },
>>   };
>>   +/* GEN2 1.2.2 2PH */
> 
> This is the init sequence for 1_2_1 not 1_2_2
> 
> https://review.lineageos.org/c/LineageOS/android_kernel_xiaomi_sm8250/+/311931/10/techpack/camera/drivers/cam_sensor_module/cam_csiphy/include/cam_csiphy_1_2_1_hwreg.h
> 
> https://review.lineageos.org/c/LineageOS/android_kernel_xiaomi_sm8250/+/311931/10/techpack/camera/drivers/cam_sensor_module/cam_csiphy/include/cam_csiphy_1_2_2_hwreg.h

FWIW 1.2.2 seems to be the desired one: [1]

Konrad

[1] https://git.codelinaro.org/clo/la/kernel/msm-4.14/-/blob/UC.UM.1.0.r1-02500-sa8155.0/arch/arm64/boot/dts/qcom/atoll-camera.dtsi#L22

