Return-Path: <linux-media+bounces-19441-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DB999A77D
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 17:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96E6FB22E72
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 15:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADFF0194AD8;
	Fri, 11 Oct 2024 15:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BK2Wx1nQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7951946CF
	for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 15:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728660320; cv=none; b=nCjhMgPxi8SFbP4RAFMA2C5z+XsjuwJ+84Tmvn9A2Le/azHkDtQ2N3/x+9R2rSluAj2N9976MpINGdaTT3xQr8yibuO185F9oEJvg1bhYf30z8LXH/0pcpmNejW2pZSiIskRmuvu98gR7t8l+gmItynpmHocVDu3nGJYkPEqi2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728660320; c=relaxed/simple;
	bh=BFXrgxxhISJ+7Uaw6TVt3fItaWeUMXeer5e2tUgjZCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WFRaAXD82DJa6+skrMd5AJKJHrudjOSMBStyK3/s3bhvFrx5hiQZpvwPOwBdDPoZy1NHlOai4SiAxnNcLyEpFh61wP6YpVgHBjXfkWAuQ7l61M2sr6mseLHegJqoJQbx6apxdbjzLaNY336WE+3hHz/szZJcZVZWyh6DF3G/bXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BK2Wx1nQ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a99c0beaaa2so102820666b.1
        for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 08:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728660317; x=1729265117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QsXJDCgX6fwc5qsa7NPDMdUYqXNZRcpChgNHDZln06U=;
        b=BK2Wx1nQRGRvuZEIMYjWjvA43to60f7u5AxFugiilU2Gg+SzPt9XG+2Pfp1ggqmnrm
         B5lOZalKHxPsvr5jMXJ0i1Oyv3pYYR7rbNBIxdnRGEOq95dm47H+8r47LgRSt7ztuQF2
         lLnGHss7COfU+WZ+34E2SNBVF+89yBM8KoEDcKubwIbwviAZgIntc0uaqzgIVsKEFO8P
         fi7hRtLos/4wt46DV4zPQhrT33VcyRNL1Iqrt7EDBkz5hgL3cUf2P5PjYyuG/i9EdS5J
         zXX5RwUXtSzemyJhyK5U/FvlDiJcjd1Zmg44aaLLjOjYzvUO1uakZmglX2H2tIkXzj78
         IuOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728660317; x=1729265117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QsXJDCgX6fwc5qsa7NPDMdUYqXNZRcpChgNHDZln06U=;
        b=UE9SpO8oCSFfhNTEDGeSucD8hRXC4Qpb9vmY86Rnaouz2ZRoDBD1lNWihKVdjTmCQO
         vsHQ3ksuG+S6ctlCS9S2OzV1oL1VOS2VFOjexuXo7MVPzHbXwhr5B4cb2XARRcTwphl5
         q7goyIOiJEfighC9MflfDol5nro/mlkhIgNnnP3n7yrjO1q62QvJNT2Jsyk75Chh2LeD
         z10ckWpYGM1ffqOtKKrMFC9mTnRyU0K/bZuJPk4VevwJVdqK63PclRkuir5hdePwl/qK
         lXaHS02l7peiFpjZje2t2KNLj1NfV8zXMtS7cQrmCj5eDoXdsDVwIMA4RY9zzD0bEUK8
         XNgA==
X-Forwarded-Encrypted: i=1; AJvYcCXkryZvCt1fmMPIDv+31oY1xjLav9pyj0GizorPbeX3pTsJHx7MhwDIPj0aDJBJx0zpLJqqvyJ0NBiLYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIakAGM8GsuInACZG1jhjyGWpVi59OXD2o+YhaDHKg5+cMZi1U
	NiWYj5M5oyo7L8LLmG+SrgCJmL7qEdTHj6RtYcqggtrvBvRhCEgrqjPOHHHBLNI=
X-Google-Smtp-Source: AGHT+IHcX1oM2qPUneU/fjoYGwZo8cYrdHhAfJshhNlnyAPLLinoIFd2vTte1Rw7te3MDHrTiSHbtg==
X-Received: by 2002:a17:907:f18e:b0:a99:62a4:3fc1 with SMTP id a640c23a62f3a-a99b9630fd8mr256343266b.49.1728660316869;
        Fri, 11 Oct 2024 08:25:16 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7f25dc6sm222623266b.72.2024.10.11.08.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 08:25:16 -0700 (PDT)
Message-ID: <b3c1431e-9a5d-4c38-ae7d-605d4a2cf3ac@linaro.org>
Date: Fri, 11 Oct 2024 16:25:15 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] media: dt-bindings: Add
 qcs6490-rb3gen2-vision-mezzanine
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241011140932.1744124-1-quic_vikramsa@quicinc.com>
 <20241011140932.1744124-3-quic_vikramsa@quicinc.com>
 <nsylilmzl6zzukpgih65kmeibbllek6dpgryzkso2ttpuztk2x@3q5xiujcdujo>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <nsylilmzl6zzukpgih65kmeibbllek6dpgryzkso2ttpuztk2x@3q5xiujcdujo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2024 15:50, Krzysztof Kozlowski wrote:
> On Fri, Oct 11, 2024 at 07:39:26PM +0530, Vikram Sharma wrote:
>> The qcs6490-rb3gen2-vision-mezzanine is a mezz on top of the
>> qcs6490-rb3gen2 core kit. The vision mezzanine includes the
>> IMX577 camera sensor.
>>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index 5de6290cd063..f00851f30d3e 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -390,6 +390,7 @@ properties:
>>                 - fairphone,fp5
>>                 - qcom,qcm6490-idp
>>                 - qcom,qcs6490-rb3gen2
>> +              - qcom,qcs6490-rb3gen2-vision-mezzanine
> 
> Shouldn't this be an overlay?
> 
> Best regards,
> Krzysztof
> 

Because of broken bootloaders which don't do overlays, we've been adding 
additional dts instead.

For preference everybody would run u-boot, grub or another reasonable 
bootloader that can apply an overlay.

Last time I checked there was no support for dtbo upstream in the kernel 
itself.

greps

grep -r of_overlay_fdt_apply *

Hmm, does this do what I think it does ? Its news to me if there's a way 
to do this in the kernel now TBH.

Otherwise the sad situation with shipping bootloaders means we are 
pretty much stuck with the one blob which we can't apply an update to.

---
bod


