Return-Path: <linux-media+bounces-44699-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 217ACBE2892
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 11:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E5411A62710
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 09:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB4A32C311;
	Thu, 16 Oct 2025 09:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JoUTjwmf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD42C31D758
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 09:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760608353; cv=none; b=RmZA89N8j7NhtAAU95mQtpbuFlRNCkN/udE1ABIYOn704yM8uZby8LVADRbbAh/8i1x38nJf35Uo0T1UCetG5Q+EwM6dNvRhtUGd5rsYmAT+Si78XKlpOzytF7OJXaxJN7BneyMFvn9m75UDyHCFW55hyt15zllx/ffQ1cAao/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760608353; c=relaxed/simple;
	bh=jE2GoX19eyhmDAzyJNkgxtQN6Hq02Z1VjLQd8iVTPAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=byDb4iIrMd7309WyvrhxKjqmeVGYiQtv1pzINpFR7jAWOKTzRN93bZG6VEwZ+YWHyCsFxPmvch9JP1A/BW4/d6P7xRCUENTo2P9iFgzqV+D+KW0hUxYdndG31/6hNrbSZ7Z6/HQVdmF2iE0GRRJTXq+gGYZU7B65q+A0UNHfZ/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JoUTjwmf; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57b35d221e2so117823e87.3
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 02:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760608329; x=1761213129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jn4dZoKK26RuIY2MUwW65nuRqIMdpVV2Qu/kLcTzIEE=;
        b=JoUTjwmfP6jWMtxLJ31VW4DUdqWdZAzEXyHedVQHXPHsvLhmcHEG0yM24AU81jCq/B
         n8mL2ghF4Jv3j9zz4d7Mn0cDsFu5hNthEpWimSV5Cjhkh0Rlu9GQ5vndEzxk7yAt+t/V
         BLvpONm5VTDEF0JCiswwbsJdl8usxQK/A9hBwa9s1zKY+NmU8jXS7lcNZIHnUizeKErv
         LAS3gAD1Jtt1yMmJ8O/lsfTLqctnY2SEwiweOiEPfHmQjn8TdEtNpUE03zRhuY63U4P9
         HPJuXx3etp55tQbclfZVDQIX91ZbroaFSeqAMHqDhdG4J6B0tFXPz+OoASqWYKhQrxKy
         4R+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760608329; x=1761213129;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jn4dZoKK26RuIY2MUwW65nuRqIMdpVV2Qu/kLcTzIEE=;
        b=Ra2pNenqcDgTXUmAM2FeKQ9XZ5KzjVB19S5ks4Gq6qlAy7uJfpr5osHvJnbAxI2Rf6
         Ea6l/BQMW9ANOdntgA3fgak7nNisB4kOc3lsF9LfMBbHlvCINZyakX7tCO4Q/hBN2ikT
         2ygTxtuoeNTEV1IQSZeYu5k+FW+LbmOFAPJep/+GKoPiWc07RHp7zZTc/tP7JbD1FC6h
         56EGMYZIoAaKwZvBz/8jsH5Fp+HnYOlfSOa3J9HUeAuRFqYgBxzbi9uPkwwgK4b4MX+p
         KRVCkUCjHrscT4+V+2lLLN/Z2wbdLlOuEkjJFE0waD6DY95mA0sGc/jO6HjI+kqdBxC+
         aEUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvqNdFYRh+JM7hqccwE3JnjhMcwb+c2KySMfLLWzQZD7wCxqy/aNtqkpNiuV80wqkr5lJB/lgG1bzBRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxePHYt8D0m5g0eqCr+JW7XL60bXEDsPwcfUbDfgSzb6YvMMV2M
	s/OtgZmzERZAq4roRtBAhH2CqGkS5WYw6KR5g7inY9C01NckRwrn9xUBRVyKQ7101Jk=
X-Gm-Gg: ASbGncvMGXOZ+RWLdTPeQMZGc9HYcut+H2mmKGKMeP9dMsW5bUVosU7Y4zZAGeMauhc
	QYqBco24DyLGNVrg31tqFEckbrN9hA8Bk9+uGjP+tDGFe7VPpby2tXh0KOl/FMGmVhN25UE5BFP
	asohGyRDCS3bGzIc/mE7fkzdSiARSGIjVXYDXs/2V8Gjz9FeW21qP5y3jG/sJBxlYmvzEvz7zzH
	7PLD7bzjyxPfcvzT5T2nrQUBSzPsKnTjrG4elfn3GgY7pc71P92Thdl5iVQNCFFj7VmsXTOQT0K
	zCM+nAgXt/5fSEvy94WZC0LtMIXcJNNA+BNOwtyFqZ4e6rY7FwEFameUf5PJG/dqPl8HBrp58wU
	aL9XCnvU7GsXBvsoZxKCLna4iR13y1J5sIIl19ioNZBtozo/D+vUJJxUquQ7rVvgJ0mzcPWjAF3
	icciDRQ+PpomzdkfD2tx+1YQoxrWiBYetbFT2cvOwcU/42t2tfFwCCaRuNyWk=
X-Google-Smtp-Source: AGHT+IHGrMqF/SxK/b9Eusc1EmuTMX1oF3LiG7gqz6PSDdypVz3evm0d5vIiv9I+NCKFDiLfXQtkSg==
X-Received: by 2002:a05:651c:2224:b0:36c:ebb0:820c with SMTP id 38308e7fff4ca-37609e72b63mr40963831fa.7.1760608328682;
        Thu, 16 Oct 2025 02:52:08 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762e77ea1fsm54348501fa.3.2025.10.16.02.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 02:52:08 -0700 (PDT)
Message-ID: <ad05ed96-80fb-448a-a264-f4b4befc5d30@linaro.org>
Date: Thu, 16 Oct 2025 12:52:07 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300: Add support for camss
Content-Language: ru-RU
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, bryan.odonoghue@linaro.org
References: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
 <20251015130130.2790829-3-quic_vikramsa@quicinc.com>
 <b4207e22-8d9c-4223-8b28-272d2650661f@linaro.org>
 <8966ddaf-9c10-4626-a4cc-36efd3fc93e2@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <8966ddaf-9c10-4626-a4cc-36efd3fc93e2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/25 08:59, Krzysztof Kozlowski wrote:
> On 15/10/2025 20:49, Vladimir Zapolskiy wrote:
>> On 10/15/25 16:01, Vikram Sharma wrote:
>>> Add changes to support the camera subsystem on the QCS8300.
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>>> ---
>>>    arch/arm64/boot/dts/qcom/qcs8300.dtsi | 171 ++++++++++++++++++++++++++
>>>    1 file changed, 171 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>> index 8d78ccac411e..acd475555115 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>> @@ -4769,6 +4769,177 @@ videocc: clock-controller@abf0000 {
>>>    			#power-domain-cells = <1>;
>>>    		};
>>>    
>>> +		camss: isp@ac78000 {
>>> +			compatible = "qcom,qcs8300-camss";
>>> +
>>> +			reg = <0x0 0xac78000 0x0 0x1000>,
>>> +			      <0x0 0xac7a000 0x0 0xf00>,
>>> +			      <0x0 0xac7c000 0x0 0xf00>,
>>> +			      <0x0 0xac84000 0x0 0xf00>,
>>> +			      <0x0 0xac88000 0x0 0xf00>,
>>> +			      <0x0 0xac8c000 0x0 0xf00>,
>>> +			      <0x0 0xac90000 0x0 0xf00>,
>>> +			      <0x0 0xac94000 0x0 0xf00>,
>>> +			      <0x0 0xac9c000 0x0 0x2000>,
>>> +			      <0x0 0xac9e000 0x0 0x2000>,
>>> +			      <0x0 0xaca0000 0x0 0x2000>,
>>> +			      <0x0 0xacac000 0x0 0x400>,
>>> +			      <0x0 0xacad000 0x0 0x400>,
>>> +			      <0x0 0xacae000 0x0 0x400>,
>>> +			      <0x0 0xac4d000 0x0 0xf000>,
>>> +			      <0x0 0xac60000 0x0 0xf000>,
>>> +			      <0x0 0xac85000 0x0 0xd00>,
>>> +			      <0x0 0xac89000 0x0 0xd00>,
>>> +			      <0x0 0xac8d000 0x0 0xd00>,
>>> +			      <0x0 0xac91000 0x0 0xd00>,
>>> +			      <0x0 0xac95000 0x0 0xd00>;
>>> +			reg-names = "csid_wrapper",
>>> +				    "csid0",
>>
>> The list of 'reg-names' is not alphanumerically sorted, this is a newly
>> introduced sorting order pattern of CAMSS 'reg' property values.
> 
> Please stop inventing ad-hoc or fake rules. There is no such sorting
> pattern for this property, which I expressed multiple times. Last time
> you claimed there is some sorting by "values", now this.
> 

The sorting order above does not resemble the order present on other CAMSS
devices, which is the alphanumerical sorting order.

The same order is supposed to be kept.

-- 
Best wishes,
Vladimir

