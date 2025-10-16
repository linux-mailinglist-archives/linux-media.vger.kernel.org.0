Return-Path: <linux-media+bounces-44669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A244BE19DD
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 07:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D3EE48469F
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 05:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92EE2246770;
	Thu, 16 Oct 2025 05:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSUBroB6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1FB241686;
	Thu, 16 Oct 2025 05:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760594383; cv=none; b=jhtjpQVEGtxwvp3e84+HHy7LTRwDSuKjAGsZslKo5RxrJ/Y2V2O3f3OIuS8q9BX1qsQwmZB4StfECLXD5ZLFohCh7Fq5TuCA+ffHNZcLlXK4XrYZvVG/OGDsgI3nx2KBK7kgOrTDJclk3U82aMk3KFfGMtoJipMaiGCw3u3yKzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760594383; c=relaxed/simple;
	bh=8ciTShZccMAg56b4cQsrmTPZobu4kdKJ+1tp/6jLHrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=heKZFAfGBmS3KZiWwI+4C1TQkPPuYRXBRG5fyoYyXwCrqWmsmKax5ERunVa3EWIaBatrS7qg+e7M0Bzs66vYe+6vC0VPxvv0eQA/looSNxM4NMRUD3z0Rbxvxta+XRtwaJgE5LBIVM8A297lmcb3tnkEva7HvdRPKffsyjZBgFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSUBroB6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C78EC4CEF1;
	Thu, 16 Oct 2025 05:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760594383;
	bh=8ciTShZccMAg56b4cQsrmTPZobu4kdKJ+1tp/6jLHrc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iSUBroB6zN12uj57egK6nYeGXF+APzMzirw5wPgJ4EFDLmuWHTl7djqwdTvR7e9yW
	 iIomQGcJ7npB5UUXK3wDA4QNY1GwrROFN1kkjByJa0JbmxhMcdoJV41DB9YB6gq6z2
	 suzIP61mHuV7s927w8JSu3qTiK6TFLYhR+94L01R9WUcPht7GIZz9LyVaJH4A6kXZB
	 Fi5oJZBcgl/SeXu4tfIa0huFsCHUtN7RcVz3UdNCnplrd6OlaYi9075op5RCbqOdnU
	 kCev68BHUckZSPlUY65yz/1EfPKcEYu6G1biNv3lav79dbcW818Ee3rrmnAwFekmV+
	 F6x1fWYerGqAA==
Message-ID: <8966ddaf-9c10-4626-a4cc-36efd3fc93e2@kernel.org>
Date: Thu, 16 Oct 2025 07:59:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300: Add support for camss
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <b4207e22-8d9c-4223-8b28-272d2650661f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/10/2025 20:49, Vladimir Zapolskiy wrote:
> On 10/15/25 16:01, Vikram Sharma wrote:
>> Add changes to support the camera subsystem on the QCS8300.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 171 ++++++++++++++++++++++++++
>>   1 file changed, 171 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> index 8d78ccac411e..acd475555115 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> @@ -4769,6 +4769,177 @@ videocc: clock-controller@abf0000 {
>>   			#power-domain-cells = <1>;
>>   		};
>>   
>> +		camss: isp@ac78000 {
>> +			compatible = "qcom,qcs8300-camss";
>> +
>> +			reg = <0x0 0xac78000 0x0 0x1000>,
>> +			      <0x0 0xac7a000 0x0 0xf00>,
>> +			      <0x0 0xac7c000 0x0 0xf00>,
>> +			      <0x0 0xac84000 0x0 0xf00>,
>> +			      <0x0 0xac88000 0x0 0xf00>,
>> +			      <0x0 0xac8c000 0x0 0xf00>,
>> +			      <0x0 0xac90000 0x0 0xf00>,
>> +			      <0x0 0xac94000 0x0 0xf00>,
>> +			      <0x0 0xac9c000 0x0 0x2000>,
>> +			      <0x0 0xac9e000 0x0 0x2000>,
>> +			      <0x0 0xaca0000 0x0 0x2000>,
>> +			      <0x0 0xacac000 0x0 0x400>,
>> +			      <0x0 0xacad000 0x0 0x400>,
>> +			      <0x0 0xacae000 0x0 0x400>,
>> +			      <0x0 0xac4d000 0x0 0xf000>,
>> +			      <0x0 0xac60000 0x0 0xf000>,
>> +			      <0x0 0xac85000 0x0 0xd00>,
>> +			      <0x0 0xac89000 0x0 0xd00>,
>> +			      <0x0 0xac8d000 0x0 0xd00>,
>> +			      <0x0 0xac91000 0x0 0xd00>,
>> +			      <0x0 0xac95000 0x0 0xd00>;
>> +			reg-names = "csid_wrapper",
>> +				    "csid0",
> 
> The list of 'reg-names' is not alphanumerically sorted, this is a newly
> introduced sorting order pattern of CAMSS 'reg' property values.


Please stop inventing ad-hoc or fake rules. There is no such sorting
pattern for this property, which I expressed multiple times. Last time
you claimed there is some sorting by "values", now this.

Best regards,
Krzysztof

