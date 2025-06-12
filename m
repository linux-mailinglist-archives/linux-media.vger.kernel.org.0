Return-Path: <linux-media+bounces-34639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAE5AD789D
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 19:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74E1D3B478B
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 17:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3FC029B214;
	Thu, 12 Jun 2025 17:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ITyyuu3e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAF93596B
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 17:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749747794; cv=none; b=XtJfJ2TRGZFOsuA8no/ETeoaTLUZETglMHRNOrFIXUoLX8iNdqFzxjheN9S232OWI9BRY31GhezDlo420c1d5bV7Tm16inmVFc4gIDDSTw17hdhUHQUXjaAm+cP5SuPFEGDhmFB0/HLRlfO0SjhHlVN32asTsmVaMdQBfrS0wJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749747794; c=relaxed/simple;
	bh=Uzulu6zrQEvHbRp6tiLTxSgfAnec6yLbNovF+/MqgSw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cn4kMnDgfhZadSi0DYrO+zCs8uPw/Wnm6bDK/ojNe1H2AhnpdzxO9c5a2+g4/Y62gFRruF5LzPv61cyQFTos87KujblP2MZGfHhFXXcx+lBRoiXSwsM2X2I/Zcawmp3fboYz6KjobybFACqaZyHcOCcVddQ941TDbCkmHhoXCYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ITyyuu3e; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-551fdd1c4b3so116070e87.0
        for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 10:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749747790; x=1750352590; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SITDSWa0NPXWLuqPl1GawCzU6z/B2XGFHZuUqZFEKYs=;
        b=ITyyuu3eSqcZnB/ndID++a/8LddzeYj1/48I7GyIhsibz0h4mkHTiw/0yV/gt8M2hP
         gWuXd9zKa8nBVkw6NQE0+QQtPQBnFcGv7jK4v/FvvuZoDyG/3JAit51IvMhLes19xLeS
         fSk7tWK6iVViZ0+E6dSOwKndtX2XSC79YrwIEhHu1w1w6qQ4wibO+GpuWYMFjH2eHu5+
         smVfJGiGAgINaM/fIaoA+SOY0hvasSsuqBgWpFsw7Apbj1LWoElEhGDOp2j9ZhwGEqMV
         PM+pwi9NHYZ09fmQPk+AG4VantnxzMwPre5UcaXpuvVuyzZDnUEaxx8t/lQMAeGVeD7N
         cpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749747790; x=1750352590;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SITDSWa0NPXWLuqPl1GawCzU6z/B2XGFHZuUqZFEKYs=;
        b=BbyqTA3Q5AuLuGWWZPInWHf4Hjc0HzI/8BkR4dDE4nfsPccSp+Vq1OTftJEczdAe0K
         +nqeB/1DGK9tAruDRKUpbvMrvFwuZmDnNyAhwZSUUQgLUEtohp8CKRGN4CUOvWJ8ZRoJ
         0IjLZb8LMH43hCiQSbYJgsVT/6hw0SH1rs4J/xZikWx/6t2jB7YF8L8LXEqsbIjDS2aF
         SyaBGAMlrpGZDFtASGeAc+O6sjF9Ne70lJxh7xIXqx4FfpTu5VLDVhsfvif2pDCXuDhr
         T54Yka0f5RDrPGJcQyBjzt1+Mz2ceuVyFhUvyDh9DLxkD1AF3/wjDNS2NLSXP5VbS/Sz
         ybrw==
X-Forwarded-Encrypted: i=1; AJvYcCVRzd+mrcOOeJFsGEPQ07YbxABsPVvN6gQoBIC4V4WkOCUebn8zqHnnM1P8wY7f5izbNtU9JVaMn1dBgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyT/fAS2gpfLg09m910Lkyq6mCBlPpaiG84G3ou4BuEdyafIOm
	AIJsIczFKxDlWXIY1ceIyr6GbHsnqkhYYUihVMAakokPleaNmtMJhNoVTPIHFmpWlRM=
X-Gm-Gg: ASbGncsAHSfmfj4pZWGywu4ZUA6mDxh52HaRs72POdfZnvMD7fb2wW5+FnUotBnKXXt
	/ep/qA/gJEPBE38vI6yXFTVDO7iRjhxAz+LyQxNUx+3ZDC5kFkGyS6oC2FW1Wv8IrKFzTD+Luxd
	y0/DzCtpLlRRlK5ljNAF/CxuwA8HtnUOJT94i810UGq7igs55bzZjUqfCpPHTQ13krq1D3VHp9P
	ztYG3cft+fjhgXm5XHPdXdKzV8c1ReWh8QfJIlRAP4MvTBi18zS5crIDyl05GWcDUMYvAmHuExS
	u02uYKhOSRp2lXlOSnI/cRBFChETK8FjV2eRvWIwB1wF4J/LS/Ydhx0RD7oQz6Mkuls/K8FaoAK
	LfA0wbbzOPzBz4E6NZCnIsWlikKtgCyOkXbQiv6ZRh6zAK7yTdN4=
X-Google-Smtp-Source: AGHT+IHBNlGFExNNCXER22K2I+rmkBd4bai+7wjdxAJR0qh3kxp4mSKVh18JVv1lOatKNdJNTNYcRQ==
X-Received: by 2002:a05:6512:3e1e:b0:553:2480:230a with SMTP id 2adb3069b0e04-5539c051370mr1023527e87.0.1749747789240;
        Thu, 12 Jun 2025 10:03:09 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac135c14sm166631e87.73.2025.06.12.10.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 10:03:08 -0700 (PDT)
Message-ID: <843772bd-711b-4d49-a5bc-096a1ab13747@linaro.org>
Date: Thu, 12 Jun 2025 20:03:07 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH 09/10] [RFT] arm64: dts: qcom: sm8250: extend CAMSS with
 new CSIPHY subdevices
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-10-vladimir.zapolskiy@linaro.org>
 <dd6fd001-6209-4bd9-807a-4e9b5fc4cd5a@kernel.org>
Content-Language: ru-RU
In-Reply-To: <dd6fd001-6209-4bd9-807a-4e9b5fc4cd5a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/25 10:43, Krzysztof Kozlowski wrote:
> On 12/06/2025 03:15, Vladimir Zapolskiy wrote:
>> Following the new device tree bindings for CAMSS IPs introduce csiphy2
>> device tree node under SM8250 CAMSS, which allows to perform camera
>> tests of the model on an RB5 board with an attached vision mezzanine.
> 
> How the binding allows to perform camera tests? So camera was not
> working here at all? Then this is a fix, no?

Here the assumed testing is a regression testing on the selected and
well supported legacy platform SM8250/RB5.

>>
>> Note that the optional 'phys' property is deliberately not added.
> 
> Why? Your commit msg must explain that.
> 

Sure, will add it, just giving a short note here, 'phys' property
provides a list of wanted/enabled phys, and this is board specific,
thus, and if it is desired to preserve backward ABI compatibility,
when this property is just not present, I believe it makes sense
to add the 'phys' property to board .dts files only, like it's
done in 10/10 patch of this series.

>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>> For testing only, do not merge.

This.

>>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> index f0d18fd37aaf..401a32679580 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> @@ -4613,6 +4613,10 @@ camss: camss@ac6a000 {
>>   					     "cam_sf_0_mnoc",
>>   					     "cam_sf_icp_mnoc";
>>   
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges;
>> +
>>   			ports {
>>   				#address-cells = <1>;
>>   				#size-cells = <0>;
>> @@ -4641,6 +4645,16 @@ port@5 {
>>   					reg = <5>;
>>   				};
>>   			};
>> +
>> +			csiphy2: phy@ac6e000 {
> 
> This will fail checks. You can run them, regardless of "RFT" status.

I ran "dt_binding_check" and "dtbs_check" with no errors reported,
something is screwed on my end, because "additionalProperties: false"
from qcom,sm8250-camss.yaml shall scream here... Or is it a child
device node is not a property?..

>> +				compatible = "qcom,csiphy";
>> +				reg = <0 0x0ac6e000 0 0x1000>;
>> +				clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
>> +					 <&camcc CAM_CC_CSI2PHYTIMER_CLK>;
>> +				clock-names = "csiphy", "csiphy_timer";
>> +				interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
>> +				#phy-cells = <0>;
> 
> This is also duplicating existing ports thus you have a mixed MMIO and
> non-MMIO children which is also issue to fix.

That's correct, there are mixed MMIO and non-MMIO children above,
there might be children of just any one type of two.

It's a valuable review comment and I missed the flaw, thank you,
and to be honest so far I don't have a good idea how to overcome
the issue in an easy way...

>> +			};
>>   		};
>>   
>>   		camcc: clock-controller@ad00000 {
> 
> 

--
Best wishes,
Vladimir

