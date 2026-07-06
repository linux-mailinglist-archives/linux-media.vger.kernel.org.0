Return-Path: <linux-media+bounces-66763-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C0RnAY22S2owZAEAu9opvQ
	(envelope-from <linux-media+bounces-66763-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 16:07:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A07711B9F
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 16:07:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YmRDjrBm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=U7A4y7wQ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66763-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66763-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5487830B4A93
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 13:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B30D33F377;
	Mon,  6 Jul 2026 13:34:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA61437188A
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 13:34:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344866; cv=none; b=Fznc+oxlw2R4X+NionCNTjL852Tki3aYTopF57knftgQ9ZnN1hEOcvvrnL7VDHFVa42ZeftWRDlYPydJ05RW6VlWoM4N7Y78Ys5urnywAOd/mWFWChXXu19zNsMnOMv1s0oRdRDh+18VqUg+L0Hgntoj2fFZin0CyJMIGVyqaP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344866; c=relaxed/simple;
	bh=RTLR0xRgr2hmCOmLjjg918s1c1tnmrLf+I87zh6XN1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aNCJCOdgoyzpmQfaHLZ1JjC58tTafDSBgjXPfjXRIZ+9OZgygBy+IM8kEjV3TUfq5KxZjxxLLj7AqjFrR4ZNs4y4uNQIdxMpREC3zK9RqQMeE7lGdPcgCA7KChMOYgjXMoe/VOc5HD+6dR8P3EKs4aAJzTFLvLD+mCorcc35WlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YmRDjrBm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U7A4y7wQ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxFnq368942
	for <linux-media@vger.kernel.org>; Mon, 6 Jul 2026 13:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TTt26qQw9EQtC6S52HveKwhN5OMFsaTiLHCYa+UHr3g=; b=YmRDjrBmpXij8jHc
	Bq6iF69hxPgknj34+oXNOikVD2FYn56rMaibSwaXXOVAHmWf34OYtxEJcUeGgNo1
	2f6Ie1qKilAq8z/HTld1HhhHNXgXStuAa4lZUlfn81hiAHJuuqEq4uakzt58YHn7
	+LqeRG6v+OyqCw3QVooFelPS25GWPHCfYulhwW2FEQRp5ezG/GCySbAjj/lUANzV
	aZa8bdr4u4/3krZEDCEOJVXbVQmd8dBJ99oi9im21B00863bDnDlNbocysvAvCDC
	WDP+gKUM3roWSYfaAZAyp84CyF9HJ2a0XX1G2h3j1qQED4m1WcSGW54lFRqKSfFt
	bj6vLA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h99abu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 13:34:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92d1cae5939so301942085a.0
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 06:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344863; x=1783949663; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TTt26qQw9EQtC6S52HveKwhN5OMFsaTiLHCYa+UHr3g=;
        b=U7A4y7wQRKapyP15xMcgBVCicIm9oXqh/IVONxneXwPb9ou09zjco2MAX1TxJ3m24w
         V9lr88aEcvomCX22sJr1xr8N4dJzeM+HVSzg5VdH23Psr5SJzNuslstvOguSTPk0eX6e
         VsHPuoyRO6O7HZ/5Bl0ANhrd97aFG2ExzMBpGu6sAuNpa/yn+LBNHpVrb3iM4fPXZSed
         M5LzHkucmBSrv6/0EyiH/YUUdagIisQ4TOY066M2SAMR5WOjbZ/J5AE2PbiKjylHMiey
         iO3zx6oyxupqsG05QOgDu5aI6OsSYaJ0IFWml3jEpzUDJ99uX//KI85m2TL5cYW/Z0lz
         WNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344863; x=1783949663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTt26qQw9EQtC6S52HveKwhN5OMFsaTiLHCYa+UHr3g=;
        b=Cgg6T4BwD8R9Kw0fRi2tJBlLCxp16JXRbdnm12g7KwAUUx8vUDdWzY1tBHOu3EAcAZ
         /KuqMVV+34eLdNEF9lv517jQ8JoVJbAZ8bh/dSz8Yxyq0OGbTs/YtTPbZl55kHFFiNtI
         +GqtQpouedJUXOJubpDGMTupLRohdQEHbw78QaHW9pSnil+rZY+pbYiIcjIIrQ0AxQs9
         sU7ZfAl+jFRF+rjFcK/cBNJGSWoj9i0LwMnecLp+xXwdcPGr2ZPFVSIg6uwbg+eAJhAs
         1Mhi6bgDEZnrA3Z8sYM0SZkhutAoI1hpcnQ0MSigxU7PY2EG26nSMbBizNlGpBtg5HyU
         sgnA==
X-Gm-Message-State: AOJu0YyvO4YbM72tzq8KrmlVoa/4X9K2IIfnVuc5xxUYUzLoK2wZMFgx
	Uu8XlQFQc1NL2UmgY6JiyjaWzmVU0mhytgZk7mrg6q+Ma1MZiweeCG8cm4XJY3xcLpmSnQvpQaG
	rs//sHhq3K/k14UAcXCSKPq6DUB9euBEpPP9bxAJ1DS+nRKXrAgprAb1EJfr+UbsQcw==
X-Gm-Gg: AfdE7clagNHklEORJVTJh3dQJhlalNy6rxnjg/A7uDztIHdKO0n+y6MaR4ppWFubVxh
	kYRFo1kx8Z+WPkIqL18eK0abZk2VuMxXZseyore/wOz8xGzGKa4LZB9y3IbZ+RoKsmmd3vj2hAX
	pkgW1Orv/4ZdYtw4HUmYTzP6RpFSSqICVHNSF74A7Rl9GLWRC3Dyx1FwniyuWtA8rZGkDZO1a40
	2Wki138X78fmbbRFwxooOM1KNYpFS8ZDLBtObstPIZG7EUInqVBfUb5vdi0vFTHvPgTbo6gSdHs
	MC6Q+xivlLOBKmF5icvGMOjkVYn3db2oE9NIVUmfnXvDrAmn6DkBvZjKNg/uahBe3Ca+Okr7aZu
	SaRvpUKRpKQSVk/gh9qa59GXhgvpguIMJKu1gnGFG8FyhQpEdts9YPWe9vFUSbZPg4Dypsg+Z
X-Received: by 2002:a05:620a:6f06:b0:92e:7973:ebd8 with SMTP id af79cd13be357-92ebb56aad1mr78075985a.37.1783344862768;
        Mon, 06 Jul 2026 06:34:22 -0700 (PDT)
X-Received: by 2002:a05:620a:6f06:b0:92e:7973:ebd8 with SMTP id af79cd13be357-92ebb56aad1mr78070085a.37.1783344862218;
        Mon, 06 Jul 2026 06:34:22 -0700 (PDT)
Received: from [10.38.242.66] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46e27d137sm137669596d6.9.2026.07.06.06.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:34:21 -0700 (PDT)
Message-ID: <f51503c0-54ba-457f-822e-4e61b660124c@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 21:34:17 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: i2c: og0ve1b: Introduce per-sensor data
 structure
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com>
 <20260702-og0va1b-v2-2-0071442caa2a@oss.qualcomm.com>
 <3421134a-3aba-4c49-8810-f774a46488e8@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <3421134a-3aba-4c49-8810-f774a46488e8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BGOwxO-c9BUE_qvQY25T-5v3PG8h-Er5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzOCBTYWx0ZWRfX1MGnuOBeR3HO
 EQBHWd6ACpWF9dfSz7GOhrHc60kMlm8hp1qYLelBY6h3uIAdBoDBW+Sh5LD4nZgG4rm93OwxsQI
 mC2l6MXynjKbfOYBSuJyzNGzXgKdp0M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzOCBTYWx0ZWRfXzsGE6Ub/GfPc
 /2owUwLViPhUA11y5kj/jQsaTPQcwWruRCQWGo0YcqcCw+H/jzErTZbqKHPMoDdh5lP7/oxoRn/
 83DIpoUqXYMTekFDwepmHfDl7DglZXom5zyUI0n4utVj2y3Rsu+hakW8CdFyPpB6u/tPYOUPJmh
 oaRArJRTXsoMJmjwKxX4e61xjKGCuS0ahbtQalO+3q+VoO4sqcycHVYSwRZ41HY19F0TopAAr+F
 8WPw0i729X0jd+jknsgz1eVH3MLeoAXyzkte2W6Yz/cDCY7MR6VhbX0JVGrvfZCN/kJZ+G9OqVB
 xvorbUJR2wt5WT4lu6P+EPlB808LUQLI1O29dTvtXGMCwUDKkcsIJS1s2cNp4Br5KFwEQuL8tE9
 Y09aIUEoKnBWsTIGADtqUPMZD6RVM4xiyhMHMh8nmIj1W29CS7Wq7U3Vl5i0CxDVbszxVkcI6jw
 n6MtdlpOQM4H1mzXNsw==
X-Proofpoint-GUID: BGOwxO-c9BUE_qvQY25T-5v3PG8h-Er5
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4baedf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7mKEXu916kvh2nJM5y8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060138
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66763-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 63A07711B9F

Hi Vladimir,

On 7/2/2026 9:10 PM, Vladimir Zapolskiy wrote:
> Hi Wenmeng.
> 
> On 7/2/26 13:52, Wenmeng Liu wrote:
>> In preparation for supporting further OmniVision sensors that share most
>> of this driver, move the sensor-specific parameters (chip id, MCLK
>> frequency, test pattern register, link frequency menu and the list of
>> supported modes) into a new struct og0ve1b_sensor_data, selected through
>> i2c_get_match_data() at probe time.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   drivers/media/i2c/og0ve1b.c | 101 ++++++++++++++++++++++++++++ 
>> +---------------
>>   1 file changed, 67 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
>> index 
>> 84a28cdcade10f8fbcf945999e88f84641b9bc0d..acc06b10bf896f734926289099a70fbc2bb628d5 100644
>> --- a/drivers/media/i2c/og0ve1b.c
>> +++ b/drivers/media/i2c/og0ve1b.c
>> @@ -66,10 +66,21 @@ struct og0ve1b_mode {
>>       u32 hts;    /* Horizontal timing size */
>>       u32 vts;    /* Default vertical timing size */
>>       u32 bpp;    /* Bits per pixel */
>> +    u32 code;    /* MEDIA_BUS_FMT code */
> 
> In this particular case of grayscale only sensors there is no need for both
> bpp and media bus format code, since there is a natural one-to-one mapping.
> 
> I'm fine with "code" just replacing "bpp", and in og0ve1b_init_controls()
> simply replace "bpp" with "(code == MEDIA_BUS_FMT_Y8_1X8 ? 8 : 10)".
> 
ACK.

>>       const struct og0ve1b_reg_list reg_list;    /* Sensor register 
>> setting */
>>   };
>> +struct og0ve1b_sensor_data {
>> +    u64 chip_id;
>> +    unsigned long mclk_freq;
>> +    u32 test_pattern_reg;
>> +    const s64 *link_freq_menu;
>> +    int num_link_freqs;
>> +    const struct og0ve1b_mode *modes;
>> +    int num_modes;
>> +};
>> +
>>   static const char * const og0ve1b_test_pattern_menu[] = {
>>       "Disabled",
>>       "Vertical Colour Bars",
>> @@ -97,8 +108,7 @@ struct og0ve1b {
>>       struct v4l2_ctrl *exposure;
>>       struct v4l2_ctrl_handler ctrl_handler;
>> -    /* Saved register value */
>> -    u64 pre_isp;
> 
> I'm afraid this will break test pattern on og0ve1b, unfortunately it should
> be kept as is for now.
> 
> The register is used for something else, and IIRC even cci_update_bits() 
> API
> does not work expectedly, it certainly should be read once and written 
> later.
> 
Will keep pre_isp code for og0ve1b.

> Hence it leaves an option to keep og0ve1b_enable_test_pattern() and then
> introduce in 3/3 a new og0va1b_enable_test_pattern() function, the 
> selection
> will be done in runtime similarly to other og0ve/og0va branches.
> 
>> +    const struct og0ve1b_sensor_data *sensor;
> 
> Well, the identifier name is confusing to me, it is not "sensor", it's
> "sensor data" or just "data", no?
> 
ACK.

>>   };
>>   static const struct cci_reg_sequence og0ve1b_640x480_120fps_mode[] = {
>> @@ -254,6 +264,7 @@ static const struct og0ve1b_mode supported_modes[] 
>> = {
>>           .hts = 792,
>>           .vts = 568,
>>           .bpp = 8,
>> +        .code = MEDIA_BUS_FMT_Y8_1X8,
>>           .reg_list = {
>>               .regs = og0ve1b_640x480_120fps_mode,
>>               .num_regs = ARRAY_SIZE(og0ve1b_640x480_120fps_mode),
>> @@ -261,23 +272,39 @@ static const struct og0ve1b_mode 
>> supported_modes[] = {
>>       },
>>   };
>> +static const struct og0ve1b_sensor_data og0ve1b_data = {
>> +    .chip_id    = OG0VE1B_CHIP_ID,
>> +    .mclk_freq    = OG0VE1B_MCLK_FREQ_24MHZ,
>> +    .test_pattern_reg = OG0VE1B_REG_PRE_ISP,
>> +    .link_freq_menu    = og0ve1b_link_freq_menu,
>> +    .num_link_freqs    = ARRAY_SIZE(og0ve1b_link_freq_menu),
>> +    .modes        = supported_modes,
>> +    .num_modes    = ARRAY_SIZE(supported_modes),
> 
> Please use tab symbols or spaces before '=' sign consistently on all lines.
> 
ACK.

>> +};
>> +
>>   static int og0ve1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 
>> pattern)
>>   {
>> -    u64 val = og0ve1b->pre_isp;
>> +    u32 reg = og0ve1b->sensor->test_pattern_reg;
>> +    u64 val;
>> +    int ret;
>> +
>> +    ret = cci_read(og0ve1b->regmap, reg, &val, NULL);
>> +    if (ret)
>> +        return ret;
>>       if (pattern)
>>           val |= OG0VE1B_TEST_PATTERN_ENABLE;
>>       else
>>           val &= ~OG0VE1B_TEST_PATTERN_ENABLE;
>> -    return cci_write(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP, val, NULL);
>> +    return cci_write(og0ve1b->regmap, reg, val, NULL);
>>   }
> 
> So far let's keep the function above unmodified, but call it by pointer 
> stored
> in the new struct.
> 
> Does OG0VA have also just one "Vertical Colour Bars" test pattern mode?
> 
> Let me test this v2 for test pattern regression to formally confirm it 
> shortly.
> 

For og0va1b, tpg has 4 types:
	"Standard Color Bar",
	"Top-Bottom Darker Color Bar",
	"Right-Left Darker Color Bar",
	"Bottom-Top Darker Color Bar",
will fix it in next version.

>>   static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
>>   {
>>       struct og0ve1b *og0ve1b = container_of(ctrl->handler, struct 
>> og0ve1b,
>>                              ctrl_handler);
>> -    const struct og0ve1b_mode *mode = &supported_modes[0];
>> +    const struct og0ve1b_mode *mode = &og0ve1b->sensor->modes[0];
>>       s64 exposure_max;
>>       int ret;
>> @@ -333,7 +360,8 @@ static const struct v4l2_ctrl_ops og0ve1b_ctrl_ops 
>> = {
>>   static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
>>   {
>>       struct v4l2_ctrl_handler *ctrl_hdlr = &og0ve1b->ctrl_handler;
>> -    const struct og0ve1b_mode *mode = &supported_modes[0];
>> +    const struct og0ve1b_mode *mode = &og0ve1b->sensor->modes[0];
>> +    const struct og0ve1b_sensor_data *sensor = og0ve1b->sensor;
>>       s64 exposure_max, pixel_rate, h_blank, v_blank;
>>       struct v4l2_fwnode_device_properties props;
>>       struct v4l2_ctrl *ctrl;
>> @@ -343,12 +371,12 @@ static int og0ve1b_init_controls(struct og0ve1b 
>> *og0ve1b)
>>       ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr, &og0ve1b_ctrl_ops,
>>                         V4L2_CID_LINK_FREQ,
>> -                      ARRAY_SIZE(og0ve1b_link_freq_menu) - 1,
>> -                      0, og0ve1b_link_freq_menu);
>> +                      sensor->num_link_freqs - 1,
>> +                      0, sensor->link_freq_menu);
>>       if (ctrl)
>>           ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>> -    pixel_rate = og0ve1b_link_freq_menu[0] / mode->bpp;
>> +    pixel_rate = sensor->link_freq_menu[0] / mode->bpp;
> 
> Since it becomes more complex, can you please move the calculation to
> a new inline function, like os05b10_pixel_rate()?
> 

ACK.

>>       v4l2_ctrl_new_std(ctrl_hdlr, &og0ve1b_ctrl_ops, 
>> V4L2_CID_PIXEL_RATE,
>>                 0, pixel_rate, 1, pixel_rate);
>> @@ -407,7 +435,7 @@ static int og0ve1b_init_controls(struct og0ve1b 
>> *og0ve1b)
>>   static void og0ve1b_update_pad_format(const struct og0ve1b_mode *mode,
>>                         struct v4l2_mbus_framefmt *fmt)
>>   {
>> -    fmt->code = MEDIA_BUS_FMT_Y8_1X8;
>> +    fmt->code = mode->code;
>>       fmt->width = mode->width;
>>       fmt->height = mode->height;
>>       fmt->field = V4L2_FIELD_NONE;
>> @@ -421,8 +449,8 @@ static int og0ve1b_enable_streams(struct 
>> v4l2_subdev *sd,
>>                     struct v4l2_subdev_state *state, u32 pad,
>>                     u64 streams_mask)
>>   {
>> -    const struct og0ve1b_reg_list *reg_list = 
>> &supported_modes[0].reg_list;
>>       struct og0ve1b *og0ve1b = to_og0ve1b(sd);
>> +    const struct og0ve1b_reg_list *reg_list = &og0ve1b->sensor- 
>> >modes[0].reg_list;
>>       int ret;
>>       ret = pm_runtime_resume_and_get(og0ve1b->dev);
>> @@ -484,13 +512,14 @@ static int og0ve1b_set_pad_format(struct 
>> v4l2_subdev *sd,
>>                     struct v4l2_subdev_state *state,
>>                     struct v4l2_subdev_format *fmt)
>>   {
>> +    struct og0ve1b *og0ve1b = to_og0ve1b(sd);
>>       struct v4l2_mbus_framefmt *format;
>>       const struct og0ve1b_mode *mode;
>>       format = v4l2_subdev_state_get_format(state, 0);
>> -    mode = v4l2_find_nearest_size(supported_modes,
>> -                      ARRAY_SIZE(supported_modes),
>> +    mode = v4l2_find_nearest_size(og0ve1b->sensor->modes,
>> +                      og0ve1b->sensor->num_modes,
>>                         width, height,
>>                         fmt->format.width,
>>                         fmt->format.height);
>> @@ -505,10 +534,12 @@ static int og0ve1b_enum_mbus_code(struct 
>> v4l2_subdev *sd,
>>                     struct v4l2_subdev_state *sd_state,
>>                     struct v4l2_subdev_mbus_code_enum *code)
>>   {
>> +    struct og0ve1b *og0ve1b = to_og0ve1b(sd);
>> +
>>       if (code->index > 0)
>>           return -EINVAL;
>> -    code->code = MEDIA_BUS_FMT_Y8_1X8;
>> +    code->code = og0ve1b->sensor->modes[0].code;
>>       return 0;
>>   }
>> @@ -517,15 +548,18 @@ static int og0ve1b_enum_frame_size(struct 
>> v4l2_subdev *sd,
>>                      struct v4l2_subdev_state *sd_state,
>>                      struct v4l2_subdev_frame_size_enum *fse)
>>   {
>> -    if (fse->index >= ARRAY_SIZE(supported_modes))
>> +    struct og0ve1b *og0ve1b = to_og0ve1b(sd);
>> +    const struct og0ve1b_sensor_data *sensor = og0ve1b->sensor;
>> +
>> +    if (fse->index >= sensor->num_modes)
>>           return -EINVAL;
>> -    if (fse->code != MEDIA_BUS_FMT_Y8_1X8)
>> +    if (fse->code != sensor->modes[fse->index].code)
>>           return -EINVAL;
>> -    fse->min_width = supported_modes[fse->index].width;
>> +    fse->min_width = sensor->modes[fse->index].width;
>>       fse->max_width = fse->min_width;
>> -    fse->min_height = supported_modes[fse->index].height;
>> +    fse->min_height = sensor->modes[fse->index].height;
>>       fse->max_height = fse->min_height;
>>       return 0;
>> @@ -534,13 +568,14 @@ static int og0ve1b_enum_frame_size(struct 
>> v4l2_subdev *sd,
>>   static int og0ve1b_init_state(struct v4l2_subdev *sd,
>>                     struct v4l2_subdev_state *state)
>>   {
>> +    struct og0ve1b *og0ve1b = to_og0ve1b(sd);
> 
> struct og0ve1b_sensor_data *data = to_og0ve1b(sd)->sensor; // ->data 
> anticipated
> 
ACK.

>>       struct v4l2_subdev_format fmt = {
>>           .which = V4L2_SUBDEV_FORMAT_TRY,
>>           .pad = 0,
>>           .format = {
>> -            .code = MEDIA_BUS_FMT_Y8_1X8,
>> -            .width = supported_modes[0].width,
>> -            .height = supported_modes[0].height,
>> +            .code = og0ve1b->sensor->modes[0].code,
>> +            .width = og0ve1b->sensor->modes[0].width,
>> +            .height = og0ve1b->sensor->modes[0].height,
>>           },
>>       };
>> @@ -586,18 +621,13 @@ static int og0ve1b_identify_sensor(struct 
>> og0ve1b *og0ve1b)
>>           return ret;
>>       }
>> -    if (val != OG0VE1B_CHIP_ID) {
>> -        dev_err(og0ve1b->dev, "chip id mismatch: %x!=%llx\n",
>> -            OG0VE1B_CHIP_ID, val);
>> +    if (val != og0ve1b->sensor->chip_id) {
>> +        dev_err(og0ve1b->dev, "chip id mismatch: %llx!=%llx\n",
>> +            og0ve1b->sensor->chip_id, val);
>>           return -ENODEV;
>>       }
>> -    ret = cci_read(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP,
>> -               &og0ve1b->pre_isp, NULL);
>> -    if (ret)
>> -        dev_err(og0ve1b->dev, "failed to read pre_isp: %d\n", ret);
>> -
>> -    return ret;
>> +    return 0;
>>   }
>>   static int og0ve1b_check_hwcfg(struct og0ve1b *og0ve1b)
>> @@ -624,8 +654,8 @@ static int og0ve1b_check_hwcfg(struct og0ve1b 
>> *og0ve1b)
>>       ret = v4l2_link_freq_to_bitmap(og0ve1b->dev,
>>                          bus_cfg.link_frequencies,
>>                          bus_cfg.nr_of_link_frequencies,
>> -                       og0ve1b_link_freq_menu,
>> -                       ARRAY_SIZE(og0ve1b_link_freq_menu),
>> +                       og0ve1b->sensor->link_freq_menu,
>> +                       og0ve1b->sensor->num_link_freqs,
>>                          &freq_bitmap);
>>       v4l2_fwnode_endpoint_free(&bus_cfg);
>> @@ -686,6 +716,9 @@ static int og0ve1b_probe(struct i2c_client *client)
>>           return -ENOMEM;
>>       og0ve1b->dev = &client->dev;
>> +    og0ve1b->sensor = i2c_get_match_data(client);
>> +    if (!og0ve1b->sensor)
>> +        return -ENODEV;
>>       v4l2_i2c_subdev_init(&og0ve1b->sd, client, &og0ve1b_subdev_ops);
>> @@ -700,7 +733,7 @@ static int og0ve1b_probe(struct i2c_client *client)
>>                        "failed to get XVCLK clock\n");
>>       freq = clk_get_rate(og0ve1b->xvclk);
>> -    if (freq && freq != OG0VE1B_MCLK_FREQ_24MHZ)
>> +    if (freq && freq != og0ve1b->sensor->mclk_freq)
>>           return dev_err_probe(og0ve1b->dev, -EINVAL,
>>                        "XVCLK clock frequency %lu is not supported\n",
>>                        freq);
>> @@ -819,7 +852,7 @@ static const struct dev_pm_ops og0ve1b_pm_ops = {
>>   };
>>   static const struct of_device_id og0ve1b_of_match[] = {
>> -    { .compatible = "ovti,og0ve1b" },
>> +    { .compatible = "ovti,og0ve1b", .data = &og0ve1b_data },
>>       { /* sentinel */ }
>>   };
>>   MODULE_DEVICE_TABLE(of, og0ve1b_of_match);
>>
> 
> Looks good overall, thank you.
> 

Thanks,
Wenmeng


