Return-Path: <linux-media+bounces-49691-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BACCE939B
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 10:35:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 034843012BFF
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 09:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292AE2C08DC;
	Tue, 30 Dec 2025 09:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vcb4ROik";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D7zYVoj+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E681F30BB
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 09:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767087335; cv=none; b=u7veX5L13ShqDpCBfYmWYXB3FsdTMmi6rfWCUTqNa1UqxBCdALAL+RTv2DnRIfgBvSgvBy1QB/azMrlxA7b9GXkw/AkYKhx73TUmliifxHgHPuAwXoyItrk7x3R+vzssIB7DI9HskKzouqAr4zJ1UovIf4dGRgedM3ej/fEnfF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767087335; c=relaxed/simple;
	bh=3FZFPF1HCe+xTo/5nLV/xHAyI7rdktehZeMxUUtQpCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KvRflLrEciK0P8iCnf0akKBxyOe3HDIk9TBwOpFkPU5ifp00xDd6gVIeHWTu7l+imHFdtkkaOd1oPQykGUB0Q2i533snSSKpqpwjQ8b6fu1d0K8Nnzs2sNO5StofgvOj2D4YnnhdWVKPI17w1ZQ1mJMsREpBFW0tO9Mfg99FvWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vcb4ROik; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D7zYVoj+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU8putv2284839
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 09:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1nbEePA6MHA6PdSCIeY9K4BMn8iPfL3OLyOkF++3BpM=; b=Vcb4ROikB/6/7a1e
	myloaazP/J4pe5eM44OHis3E5G3UWgqzSRCskY4RFufbdmJo0LEiolnK5wLcL35d
	tXbCkmlN0Lzj6B/zZwTkjtCHFVygOkMTjVwL+rhZxxdtZcH1GOIUT3n6NAzYIxzZ
	ls+P/v+o9y3GloSEE8v9tzwrdldofCp/4hi8VDncmt1y3BYIEJ7IddffavN1SsFo
	/dgBgyiuun/IFU77xuGPuSgQjXXX+Pud2Bf7vha3LCl/FgG0Bh8n80qBjtjnQv3G
	/3eTTLJZBBueG/TCDm5cGq6UkTCLM0kcjWiWpnVH3S9O4uoswQxMRz7lpBUzFOmD
	NuUb3w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc06gshhw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 09:35:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edb6a94873so192313021cf.0
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 01:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767087332; x=1767692132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1nbEePA6MHA6PdSCIeY9K4BMn8iPfL3OLyOkF++3BpM=;
        b=D7zYVoj+2O5GdNimKPY7kKi8R3LZWBRR/Re4/PoGuAKMuc13gIz3b6ykl9dEGvhWWX
         FwFA9l2BtpsrDo3sHfyw8U1FXChmGp9pkiJyA/PxDz917pT9J1m+ZGxvIfhwFMfAj3/E
         3vV6ecd1huCVokxtkWq2QSWwEicefg5qYlnQ8JzGIsU9ZAnB3gqVbdFFnLKwbTXqn6uD
         k9NdA7LFihwRTLL2HJHA/uPQP5T0Kru6RZuyjJQGb7PvDrZcpyyw0K4W47+ZLAf4ylFa
         7plwTlFy5CRWgQbllmM/g/UiNhPJ76yiOy1azMfwgbt1wKep53MmnDL83zdDDu8qtnUf
         wFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767087332; x=1767692132;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nbEePA6MHA6PdSCIeY9K4BMn8iPfL3OLyOkF++3BpM=;
        b=S3r0Nuvizu3Mbmt3jUq++OqTre44vrxwlOwdlx8cxJzjdQ54FQiFuzaTLLihtcGFkH
         se7vS7ud3ZqbQw0cuDkY52DGKMUIDNBzw35dF1IFB78MNDw9hIwtbzB9kVF/ioB6liaN
         eXqC8Wr6CUf6O1gtmQF7FCrQRd5Liv4bM3dCEchhZXFshYnljCjZI3eXK0Tvllt9bGYj
         JgN7y0SHdaRFgdr97eLnJHB6a04CEeXyfy92BhJA98vVmvuk5a+dEUIhCy1oQXFlcjBi
         YJod3GLbtasUb21OOISMJTSANWyWxYZabbTpMSaTp25NC9OaewOp/LqIQJteyXro41Om
         wolA==
X-Forwarded-Encrypted: i=1; AJvYcCVNjQiV7ujWPLk5hmkq/8eFbGDsI9vhLkBcumRlutN6LsX1zPTVQDxlb2yioRlHVcxDoPF9PZ7kAT9PDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeXnCZZo0YDvVOT16NoPcqd/ac2hTqcr4GgqiVxXZKYDM9qqWw
	rARniHSzw2erUEkjKzORmmNW3U7sPZW779PSIdOTPLGJO6nmPfz+y6fMmGu/mijGc/YNn2jED4y
	LUouX75ryfel19k1nFPJ7FHliVhnzDS0PhwOI3qtrSjDVuBxUllcmDNAZLlOH8TanEQ==
X-Gm-Gg: AY/fxX5Dipo04LHQW1FuIOwzbpn3U1h/t4s118g2I+DEd5DgFF8L6i+QxLBc1jBsJ93
	NdesgPxATerdq7UE0vCJs8RhzYCGotUVVqdIT5FqY9Ke0CL0+OglpVoh2WnuT+HDp93b/9OHvsb
	4BYQIRTM6wkLZ5D2sI8AMS1bLpO31tezXr2tEP/alp06rzqdzQ/X812y8oktv0IVoYrxeTP4Mgw
	/m9K7mAHhFfVKXGAT3jmChmoyudCkuBELLT5ZHudUyObHjssM8goxk0RKxEsTGw0McBO3tbPMlj
	veBCTAfCY0ApebwEuTRWAsllS4Jk3EmhlaF79Q3jhi4lOsmRd73OZBI9KESWdbyPjvNVo1r9lRF
	hzC2IYt2RTejyf/g26a4Bg1p6A+rf46hkwOmcFQ==
X-Received: by 2002:ac8:4f02:0:b0:4f1:b187:d6d6 with SMTP id d75a77b69052e-4f4b43dd95dmr337787411cf.19.1767087332019;
        Tue, 30 Dec 2025 01:35:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELNk5wRwdQDIHLTAYB1tBYephiR7WLQ5/CyUkyDgkyhH9ccF/GrwElBpPfHR6W/OrFmr+JGg==
X-Received: by 2002:ac8:4f02:0:b0:4f1:b187:d6d6 with SMTP id d75a77b69052e-4f4b43dd95dmr337787241cf.19.1767087331569;
        Tue, 30 Dec 2025 01:35:31 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3aac6d9sm263876605e9.4.2025.12.30.01.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 01:35:30 -0800 (PST)
Message-ID: <462e5ec1-cc26-4003-ac5c-adde2c243959@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 10:35:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: Add note to prevent buggy code re-use
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans Verkuil <hverkuil@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pavel Machek <pavel@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251230083435.26267-2-krzysztof.kozlowski@oss.qualcomm.com>
 <aVOV2QrFvoCVQSrA@kekkonen.localdomain>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <aVOV2QrFvoCVQSrA@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wvwKYRP1rgTEp7cUZH513ObiQ-unpTxZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA4NiBTYWx0ZWRfXyGO0FiRFCoar
 8PcKg+6tcrDBn8ebqRLhXsjHx4y1y0VK4Ey4jjYSMbNKC1v0/02U9cZ0EmF3ud7xAsgFS3BdgTt
 ySGFIe4IgcHpaH1JP9HJ4vs5OyUUeBnZvINeBj8H83YyNFuhysE4LD0iYbOYBXOlmmM0XPO8M4g
 g4ZA16m7li8jo4SWhRMKzDaQYlX6xz08lmOfpy79tnmivyXV/rbsTdj7+44+VWH2gc9L8FXECu8
 MJXLNtywHEGy3dx+F0+BWkA/0cIUNzMwOLRSpZ/Zkja97x/gYPtchUMFSS728SDrBGKq094w/Dl
 g7mXWxptBjmYU/mvMC0DweddBjyO8z69mXGdU8dPkycl/R36jEanvuKv6Q3CKvi/6a+4MvD702C
 DwojanCnZtHnJlDoN3XBi/+u3QtD5NaxUSDoJNf80v/8YMAErLHXPKt9klJoEBh6+v3ZPiQfVeW
 Qjd32gUofPQ7hp/lAfA==
X-Authority-Analysis: v=2.4 cv=A45h/qWG c=1 sm=1 tr=0 ts=69539ce5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=_stIpgYY55QNg9K6VtgA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: wvwKYRP1rgTEp7cUZH513ObiQ-unpTxZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300086

On 30/12/2025 10:05, Sakari Ailus wrote:
> Hi Krzysztof,
> 
> Thanks for the patch.
> 
> On Tue, Dec 30, 2025 at 09:34:36AM +0100, Krzysztof Kozlowski wrote:
>> adv7604 and et8ek8 sensor drivers have mixed up logical and line level
>> for reset/powerdown signal.  They call it a reset signal (it indeed
>> behaves like that), but drivers assert the reset to operate which is
>> clearly incorrect and relies on wrong ACTIVE_HIGH flag in the DTS.
>>
>> People in discussions copy existing poor code and claim they can repeat
>> same mistake, so add a note to prevent that.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> Similar to my commit 9d108d226224 ("media: i2c: imx: Add note to prevent
>> buggy code re-use"). I went through rest of i2c drivers and found only
>> these two doing it incorrectly.
>> ---
>>  drivers/media/i2c/adv7604.c              | 8 +++++++-
>>  drivers/media/i2c/et8ek8/et8ek8_driver.c | 4 ++++
>>  2 files changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
>> index 516553fb17e9..67116a4ef134 100644
>> --- a/drivers/media/i2c/adv7604.c
>> +++ b/drivers/media/i2c/adv7604.c
>> @@ -3453,7 +3453,13 @@ static int configure_regmaps(struct adv76xx_state *state)
>>  static void adv76xx_reset(struct adv76xx_state *state)
>>  {
>>  	if (state->reset_gpio) {
>> -		/* ADV76XX can be reset by a low reset pulse of minimum 5 ms. */
>> +		/*
>> +		 * Note: Misinterpretation of reset assertion - do not re-use
>> +		 * this code.  The reset pin is using incorrect (for a reset
>> +		 * signal) logical level.
>> +		 *
>> +		 * ADV76XX can be reset by a low reset pulse of minimum 5 ms.
>> +		 */
>>  		gpiod_set_value_cansleep(state->reset_gpio, 0);
>>  		usleep_range(5000, 10000);
>>  		gpiod_set_value_cansleep(state->reset_gpio, 1);
>> diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
>> index 2cb7b718782b..50121c3e5b48 100644
>> --- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
>> +++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
>> @@ -835,6 +835,10 @@ static int et8ek8_power_on(struct et8ek8_sensor *sensor)
>>  
>>  	udelay(10); /* I wish this is a good value */
>>  
>> +	/*
>> +	 * Note: Misinterpretation of reset assertion - do not re-use this code.
>> +	 * The reset pin is using incorrect (for a reset signal) logical level.
>> +	 */
>>  	gpiod_set_value(sensor->reset, 1);
>>  
>>  	msleep(5000 * 1000 / sensor->xclk_freq + 1); /* Wait 5000 cycles */
> 
> Related to the topic, would you be able to comment on the discussion
> related to <20251114133822.434171-2-loic.poulain@oss.qualcomm.com>? I
> believe you're cc'd, with your @kernel.org address.

I don't have it in my inbox (it's limited to ~10k of messages, so the
roll out of inbox after 1 month usually).

Best regards,
Krzysztof

