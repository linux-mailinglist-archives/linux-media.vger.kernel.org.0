Return-Path: <linux-media+bounces-48887-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA420CC3609
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 14:58:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FC7030341E0
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 13:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D053A1E74;
	Tue, 16 Dec 2025 13:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6eAv7Ph";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OUp0X56Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4106038CC9F
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 13:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765893381; cv=none; b=PQhdN2tkyjs/mv5mCqEq6YHHIlZe5TOI4kT33l7YqI05f6vbLwqeSMvdfDp6NzOe9td2mwZNe/DV0dPo/he4cnslLUYwLwL5b8bPM4mRGs91H+2CXVav1mfjY9qTXbI07hODvlFkRxRxOL1W+JhJHR5YjIP9tSfXNg/z7b6spnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765893381; c=relaxed/simple;
	bh=8FjMM2DD5knHDvTobbcP/zz0Bm12uALhLS7xCXUSXdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hUz7fpTyqW2iQ66U6EAKqDZ96qeqUjt2rGfp3Hun2Dcj+2HDEl/zlCS1vYy3kLc9VS6Qzx/5FTLnk2ThkSYTK427MudytM0gND/IWn0axC38X27FEoQTyiYVBLLbuCrjkvPNuk1yF4blK/QqMkJrU2OiGZneq22zfU/o+ab4Tfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6eAv7Ph; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OUp0X56Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGCc4Tu3491863
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 13:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SbhsZ0OGYPgaad9zJuJhqIqA++MwVqQPiy0O3X5duD4=; b=Q6eAv7Ph+ff5uKYX
	aeCHya+aAFzzUA5bTCYx0/vsLjoTlUokkiQEHjl5/5ebeks95CF3+Kd3wSPqSKbQ
	3bfNvGZFYJkgdRheGV5AKTNtSSBkq+Rj1VmLqz9s8qASVpJlwNNkCXGIMbZ7wD3e
	EumpHBR2J+bJvE/4s+OJWZQQiD0mpW022ga2C+RBXq1qyI1kN+zKDSRVEGYunEyz
	rvpLMUbSK3xds7gLRoM463uYK/hoR/OmzSdVxLtU3K/afMOsEfWjmr2vm9f4byks
	jALM2/JAOryNaxb9OGJ4MRN5K+NYOhU7vtUJg5hEXT5BHrSWO5wKN18A++Inutls
	2VA7yA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b33kw9dpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 13:56:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b222111167so77488185a.1
        for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 05:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765893378; x=1766498178; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SbhsZ0OGYPgaad9zJuJhqIqA++MwVqQPiy0O3X5duD4=;
        b=OUp0X56QytV/Cb8kk2gE4mQaXcl3RooRqHUbkgCRcejRF/KBlZ/LKJxd+Vgk0NZop3
         qGtqjK/MRu793rkgwhYoo4SbsXKU6CBX1wjapPAfL7fxT2wibvGkp+Y1xmgcMpFGPClW
         iSVtauja4r0acMp4oIBCCPdgW6r/UWqEcrP+dCFDmOQi1wemxEJrmeW5XPTff8Y/HDZk
         HMK31kVY7opUekdvTUYAfXJNXlM3lec5qRF8eGsmA59QxFmQIWRCZF7T5bg0S4HZwJ85
         J5JyTH9ti2PuW+uDJIpoPC8M9xZdxa/2vPFk2md0qhtIyo71GVnWqmHLNnaAI+F1XSY/
         GccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765893378; x=1766498178;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbhsZ0OGYPgaad9zJuJhqIqA++MwVqQPiy0O3X5duD4=;
        b=k8Qh3FfpRMqN9ncdRSF5WWHiO8mDMjRtWeplPClq4T19OjphqVK0Y2pUlUYLoZ628X
         DIFCkVr2lOjv2QvkcIB8dn0zhdExU5G8jEOP6dV2He2foEdym+RlRqE6dFwSVe6BEEaO
         q4AKNIQHRp+lC4gXto9iG1Jyk/gcZq8ZBxFqb/nmZrZpr2Vsrb4PkTG4VjILg+rwZSEd
         n5odakrKEoSJLHP0kzie9CiLVgJWaNC8QcHAqlg6eQOsOQJB+ZZOGc3P6Db1okFv9aDu
         LHP2Q6KHPmHabxGUzXuYL+h6gQD84nWSSER3JRzkDZEes4l1ptRYWkPYv8pkc11btqN0
         Utfg==
X-Forwarded-Encrypted: i=1; AJvYcCVVsoD97VAPsVkmm1DrTrqiSrm0piWrf4pwuYSya8wHP0pvE39b2QQXwM584ArBXVBrK+7fJ2vvXoEfig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaVHEYXUEdd3uQKi7WEaT0Ygkkva8s+j0++kfB8yVtDQPYe2ck
	d1QBd3j6/TNx/UENyJylYPFzCzbPzqawlE6q3ooRsqz50dKCAAMnz4jVYbM2hKT3DD6+bHi8qxH
	pV53rNQPXvhdv857bbkEkxh4tx4iZEG5KvhLKirJSn/SBRLZK8jdI4aUkAk09LMIvUQ==
X-Gm-Gg: AY/fxX701I676rrzReNVL9wsHz+ENKitFb8plLyDMVtD1chR9feszW4IsxcFFV/IbPv
	7ojSZcwM6FlQEJstcP7DYCvwFsk6V+Kq1IDsP9olqwnVRqBvlfijcBAGMqHn7TFMWYqi3Io5mJ8
	K5bYwP42+IJ7u0jM9GlXEwZ70ueuD0FtUnZAn747PN1kSOLOJHPAULpo9Zz0jP42/hRWbwlxdtQ
	D5VoOr8HqgNvkVkhxrNQENXtuYuCIyh59r6MLGHQrcQSLIl3LzrVRYoy9L9gtGxMVqDfQ9afZdX
	27luDEgZ33+xmodUr9003g8mkN9JzTYD5CLSXU2ntVp7IcWmylmyXS1AW15U06iwl91uOcZpx1d
	DAKwlYfViNC840e5TRo9IT0Bq2bqxBN5MVRrCCLzZy7LE2nWcdGJwrfQz6EGkR1WeNw==
X-Received: by 2002:ae9:ec15:0:b0:8be:7dd7:f041 with SMTP id af79cd13be357-8be7dd7f178mr28299185a.7.1765893378387;
        Tue, 16 Dec 2025 05:56:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGePisB4XYZbY+ZncYC+wZkSePP6j5Z8Hy2GQUKQW+33GwQePycCDqs3B2BjhcozU4/kzxU7g==
X-Received: by 2002:ae9:ec15:0:b0:8be:7dd7:f041 with SMTP id af79cd13be357-8be7dd7f178mr28294985a.7.1765893377546;
        Tue, 16 Dec 2025 05:56:17 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7ffde57adfsm103712866b.1.2025.12.16.05.56.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 05:56:16 -0800 (PST)
Message-ID: <341012f3-18bd-4f96-98c1-f964d1fedb8f@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 14:56:14 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, Robert Mader <robert.mader@collabora.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <20251211014846.16602-6-mailingradian@gmail.com>
 <wwpqaecvz42jopgaboasbh353ieelctpvgo3yj6y5tnxoem5oz@j5sbx3yxntot>
 <aTtkwQb2gOeWAFuv@rdacayan>
 <d7jcawzugobqern6zlo5jwcnximtsroxywix53v2yp2isvzo5r@ymxicmgfjmzq>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d7jcawzugobqern6zlo5jwcnximtsroxywix53v2yp2isvzo5r@ymxicmgfjmzq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TLpIilla c=1 sm=1 tr=0 ts=69416503 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QX4gbG5DAAAA:8 a=pGLkceISAAAA:8
 a=_D9cum97ibiHH1HWyuYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: YPHho9BXnplFEtrYw9DDiK6m0vZPsNsc
X-Proofpoint-ORIG-GUID: YPHho9BXnplFEtrYw9DDiK6m0vZPsNsc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDExOSBTYWx0ZWRfXyCj5KMxGadcH
 5LqTBz4mtnBhHzHJcD5Vt3DTSGZ8m+2i3Uq+iDSNC0J7gPdpXISod7GWF4aOB/kBRyc6zoCqPKL
 16ECwx6WR9ITQ/JN1+ghemyhWn/teOEwp8IpjcHkV0dw3jC5QqDvIm/68znKxRuQB/lXywrXJRQ
 wrbZaNosle0r59mVB10moXNLF5V9AXsLlLfXDfxhqHWMqB2uUhvBaWA21qFQHWa2HY9ZgXe714U
 zN3BHSyhCUjKnbxUpSHZS9fPkzFPGRK77iI/G5aUMAQz/ONja5aWyoPbAcfrc4dAcCBXU8vtUZi
 /hVuUHumgwyv4Ebmshb7Kt7rlagWiLmSNvjBnwQX5b2WE6vIQVvAKOOU3EC7hlEnQEJreEKhHcX
 X0sFFYqhek1BeNEm96SbfWD1Mp6TbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160119

On 12/12/25 8:22 PM, Dmitry Baryshkov wrote:
> On Thu, Dec 11, 2025 at 07:41:37PM -0500, Richard Acayan wrote:
>> On Thu, Dec 11, 2025 at 07:16:30AM +0200, Dmitry Baryshkov wrote:
>>> On Wed, Dec 10, 2025 at 08:48:46PM -0500, Richard Acayan wrote:
>>>> The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
>>>> mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
>>>> support for it.
>>>>
>>>> Co-developed-by: Robert Mader <robert.mader@collabora.com>
>>>> Signed-off-by: Robert Mader <robert.mader@collabora.com>
>>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>>> ---
>>>>  .../boot/dts/qcom/sdm670-google-sargo.dts     | 107 ++++++++++++++++++
>>>>  1 file changed, 107 insertions(+)
>>>>
>>>> @@ -392,6 +420,64 @@ vreg_bob: bob {
>>>>  	};
>>>>  };
>>>>  
>>>> +&camss {
>>>> +	vdda-phy-supply = <&vreg_l1a_1p225>;
>>>> +	vdda-pll-supply = <&vreg_s6a_0p87>;
>>>> +
>>>> +	status = "okay";
>>>> +
>>>> +	ports {
>>>> +		port@1 {
>>>> +			camss_endpoint1: endpoint {
>>>> +				clock-lanes = <7>;
>>>> +				data-lanes = <0 1 2 3>;
>>>> +				remote-endpoint = <&cam_front_endpoint>;
>>>> +			};
>>>> +		};
>>>> +	};
>>>
>>> This would be much better:
>>>
>>>   &camss_endpoint1: {
>>>       clock-lanes, data-lanes, remote-endpoint here
>>>   };
>>
>> I'm not sure what you mean, there might be some typo.
> 
> My point is that you are duplicating `ports { port@1 {.... }; };` from
> the base DTSI here.  We usually try to avoid this kind of path
> duplication. If you can't have an empty endpoint in the base DTSI, I
> suggest adding necessary labels to port@N nodes and then extending those
> nodes in the board DTSI.
> 
>> If this is about using the commonly-defined endpoints, Vladimir broke it
>> in commit dcf6fb89e6f7 ("media: qcom: camss: remove a check for
>> unavailable CAMSS endpoint"). If I do this again and go full circle, I'm
>> afraid this could break a second time before even making it to
>> linux-next.

Quite frankly I don't think that commit was valid, given it's conceivable
that an endpoint could be unconnected..

Konrad

