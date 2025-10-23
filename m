Return-Path: <linux-media+bounces-45338-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDFFBFFF61
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 10:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0B4964E8E00
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 08:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C38E301487;
	Thu, 23 Oct 2025 08:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="r7AZYcWu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6B42DEA89
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 08:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761208674; cv=none; b=dabm4PEgRQIeFUD1+pkyvVS32pqyklPaxc9F+unBKTG2uf1xY4v39asLeX9VeA0SaD56RbVad2rX3ZFczTUeeO46ZGQRFkAA89kfTpgHTacDBzdYyPaX1OKPzYvdZD0/TAiouVQQugE++WPV2KhjRFlzXKdOv7g4Dlomw03gYso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761208674; c=relaxed/simple;
	bh=VZznkxUfOBBjwHVbcPT69mPGH8TLJ3qlknTOpaEzyh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YnftiOGXy7iMmfqxHaU0gIymgkLucFhbV+i88sQP1lxTK3sSHmhjT3GZeFhmV8HsxpRISgQ8dJdEkW4vEqDbvFS0bT/c885BJNQBimJ7S0m3ve86IkZZyEbQZO08Nim5DjtVRiBvxPA/PE8w5UsFsXckQRF8aYLzC3H7xO9cdqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=r7AZYcWu; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-63c2d72582cso947445a12.1
        for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 01:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761208671; x=1761813471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kylES56a95Zr7XFZY/19713ISQDXB6XnworKEnMUaPo=;
        b=r7AZYcWuK1BvlxQDGTIu2Y2lA+oWbUQPvEX42vMD+1hP2Si5AzoVdZm5lvwXlZq47C
         MfdxUCGIGORJZIZ+AECc18BXtmkazScbzkYG10K4ELSvvOHf/wP0Ixf8vGf/m6jy4Rs9
         va9OFzrytZgALeeK473tWrn9a9KYXjx3o1konxcmBCrZ1DOQHRNaU+1OGmffKCJe2xOF
         5KV51PECPj6wf34HvyMVL+Z8k2d8nf0qNzi181NsNfr70uAy0GvJvnlU4au9jtAjzUYh
         XSx+PDRJccKZmUidcSmCCjDYtHNkV7FzWg0q6Bx2abuURC99Jl/NZcvGzgDTbeJ8EZVJ
         Jd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761208671; x=1761813471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kylES56a95Zr7XFZY/19713ISQDXB6XnworKEnMUaPo=;
        b=rqFUT65rBGpoxoK3BT7YCJAmLsOTVrGdrmP+DOqjL0FWHj0qpvz9g3B3/D5dlW/Msd
         Je0oUubPwjlDtHD0zN0zJPd6XCaJw9vr6Lq5L9axBLk0YBdslz2Gw3KcSUSjkfv7kXI2
         aJF1oqPuRZzDFqcuFSmvPhyRTvaIyHmd+DssYhzwn90Wxbi8xHBL7cbyIEmZly3OkTNx
         p7PzoCvKlQYRlGMgAMdR0bl+Crs6x+F7pYY92O9VNmkGzrid07YFSsGoiO/eUyIedgUr
         MrIZ19sT2Gxk0mbEGWmAtpgfu6aPqA+PDvcfkcuC2rFLLlIdHDzOFnB7LOluTzqmvNv9
         Sw4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkz5T3tl/LMG/Is0Vh8KpfpjfZeNQBIdDWcAHSoFSFVb1O7qlfo8UPSWPsl3YhxKktebPYvjSGW8z60w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6+tY2ytdoJnKU2Rd/HxYvOX1y2sB6zbFigTvE2FhvJRK4y2bP
	WhCHnXRwO6ckPEv0AS+KG4b6PSh6X8sspKj67t1xxwwOWotxNk0bPxEQ4FwN2AS4vv0=
X-Gm-Gg: ASbGncsuQ8d/Lv1x7hlcm3lXvIDoyEfiJZj/BwIg4+/WwGNIS59xh3Yfl6UkiYknNvi
	TSvXO+EviAjXQ6nJhTSAGIpSfNCUMYgq1HGVoRcByrD8ek/TADZTkefHPp5xB7jvIJ8wLK/QVdE
	6H4RKc3OBBgShaeyWEtJmrFh3DemBqMB+lKDvYwltU7fY6TvfZbu+VEFbxpXSTm1PSjj9mqOfLf
	qWkdZEBsrk1Xr7TR5c1jE8IZOIY2KIFonpmMvH5r5LHacFFZx+UGXHyYYo4lIiOtxwF6XFKz2EM
	S/M+dWaQPI3BN2CATMx8gMF2/HaecrH45x0Bek0mgqDI3BSgo+UWPJELfsm3fPsMaP+SX16cqL2
	L94QDM3H7lXE2cQU61bRR1HqCEXmj5BbkR97M3k3oBcYjXgUjucwyMEhKAX7Rekcst/S1NZDR0x
	XHsHytoh+OZVjtQ7OqRPxegoSRjOautBp95IDNbbsu+47HBCDfKra7Q8xsFw==
X-Google-Smtp-Source: AGHT+IEF207BQMo0Dq88FSaSGXgKTLyR81jf+3IPYp4cFuUOJkWkUOJ0k7niMWfu/ZSG5bxpQZi0ZQ==
X-Received: by 2002:a17:906:c2d0:b0:b6d:2c92:a5f with SMTP id a640c23a62f3a-b6d2c920ademr642397266b.3.1761208671128;
        Thu, 23 Oct 2025 01:37:51 -0700 (PDT)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d5144e4acsm151529866b.63.2025.10.23.01.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 01:37:50 -0700 (PDT)
Message-ID: <cd083217-27b1-4959-b80d-0189f178208d@fairphone.com>
Date: Thu, 23 Oct 2025 10:37:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add cam
 actuator
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20251009-ak7377-driver-v1-0-29e4f6e16ed3@fairphone.com>
 <20251009-ak7377-driver-v1-3-29e4f6e16ed3@fairphone.com>
 <c1d09672-e8a4-473a-88dd-fc91e81aea52@oss.qualcomm.com>
Content-Language: en-US
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
In-Reply-To: <c1d09672-e8a4-473a-88dd-fc91e81aea52@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Konrad
On 10/22/25 19:29, Konrad Dybcio wrote:
> On 10/9/25 2:23 PM, Griffin Kroah-Hartman wrote:
>> Add a node for Asahi Kasei AK7377 actuator, used for focus of the main
>> back camera sensor.
>>
>> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> index e115b6a52b299ef663ccfb614785f8f89091f39d..49654f0f914fbe18080d2f55bb6877c8ab7baf0e 100644
>> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> @@ -616,6 +616,13 @@ &cci0 {
>>   };
>>   
>>   &cci0_i2c0 {
>> +	camera_imx800_ak7377: actuator@c {
>> +		compatible = "asahi-kasei,ak7377";
>> +		reg = <0x0c>;
>> +		vdd-supply = <&vreg_l7p>;
>> +		vio-supply = <&vreg_l7p>;
> 
> The dt-bindings suggest vdd is 2.8 V and vio is 1.8 V (at least
> on AK7375, although this isn't stated explicitly..)

This AK7377 is integrated into a JHS-M15342-A2, which only takes in VDD 
as a power supply. VIO was only added to satisfy the dt-bindings, as we 
are not sure what the exact pin layout the AK7377 has.

> L7P on FP5 is 2.7 V (default) - 3.0 V (which you should probably
> tighten to the actual operating value), please double-check this

I can confirm that L7P is supposed to be 2.8V on the FP5, I will update 
the dts in my next patchset.

> Konrad

Griffin

