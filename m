Return-Path: <linux-media+bounces-66762-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iqyNGZzHS2qCaAEAu9opvQ
	(envelope-from <linux-media+bounces-66762-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 17:19:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B75B67127CB
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 17:19:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=L0VeMtE1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="M4Du46Y/";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66762-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66762-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 444B1302C5EC
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 13:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A54620E6E2;
	Mon,  6 Jul 2026 13:31:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE81420866
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 13:31:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344673; cv=none; b=X1MWdqUVBkaccBuofkbBtcgFOMMHqN376y+1+m7FXwdywoq6QuRlIu5IZialkibkAV74tHFtC4lP9gS6/m98F0Il/detsHmElq9NIAbB3iLtuYRhOTBVYf2kCZ/5c4w0Df9pxNmVTwO2EHEDxv4kaeKkcbsl+uxm73g46m6PmSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344673; c=relaxed/simple;
	bh=3J+J5O/4aydjQptyZH0/DPttB/l6kc/yHKXP9RukXlQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i2mYD5szI2Y6SLifKqOqBDaq6sHK22ab0U87QJrrZyKV+F1ZroTkW1ZTQ9vDn6nCfVNGQbOM7djF/28/wFPqSuqaTSR+2oWuIzNe0J6QA9YT1bAJrAO8nI2bFf1XNZjt2DVWYgyHOWxYtQy3ODzUM2sD3NhqBauZv5/zmH13ENA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L0VeMtE1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M4Du46Y/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxOCm367236
	for <linux-media@vger.kernel.org>; Mon, 6 Jul 2026 13:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+c11+84PIThzRwrCV3FPviwZt6hu8ALEm17/qhZyAQ4=; b=L0VeMtE1JN+s48La
	4o6PDEyK/LmlF6HZ8rBRihIabk4KRNkvT+9wuDidxUkMypEtYprrYX6MltvEPJpi
	jOubmtNU0vP8tue1PIE3YbGU1pAf2xB1/+z6M8A8AO/26NkusyO8VNNTbfOEMIHi
	jc3Ijc2673iFjVul/aZykQtzZNmZZ4Ihuv2+qX07AS4nVDGAUqPjrMZcRHPCkdrV
	16kif6m/A2+pIgyoSEbKVu289ZgfTNvJUkPygiUxXw4ETFH2hMutI9yFmERmo0r3
	86GBi8dahSEg1Yi5M51fPeXDemK8SjU0Ljahot3REjchkOH2CHqwtGtwqnFPRleT
	9ggoLQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891us47a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 13:31:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a97644aso40845381cf.2
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 06:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344671; x=1783949471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+c11+84PIThzRwrCV3FPviwZt6hu8ALEm17/qhZyAQ4=;
        b=M4Du46Y/nhSypo7g9x5S/Mgmwgxj9lq0zwZkfiPqlkZ3GMwV473sW2m3LYFe4c3JhL
         +Kb6GXoZOT4uMti6KdDyWRnLQyOJJ48RLgxCCzTXODJ/+FPYrInh4oQBakz5fohqoazP
         Wb84vXsIZ+knsSszQINSaA4MEPsUd45t2k0ZbJpOE7yCYEtQArk8diKOeLqkvTv4F8UK
         c+EoJjBu3XyfxhARUPtObeodLGVnw+Z0YfbHQgjl+//uHLK2FMfDYyuRrbSgmUXINUZn
         flxkd0nmhCy4mpZrb0ZMy4vJwZ9a7sWmtBiOvX6cQXAmDgMkm+8pCJ4aXsZLDl/gOB16
         sv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344671; x=1783949471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+c11+84PIThzRwrCV3FPviwZt6hu8ALEm17/qhZyAQ4=;
        b=bI+RmNEZI3hnm34GCAXUxejSQZ7xQUHTDeGXF3qEIdhdDW6PnqZT2toWZSKZgVU9N/
         4cWAzUE4bhoaR9gAk8TFcRtmwACB4qtUHbu9gwQAiRxR2mbknR4zFa0P0WXTwCsdiYAN
         CIkVmXL1KoBOcLm1+xYDk1iRxWs+/aU8ERJdvcoRHZJNkkVzjfuAgHVDkSvQ707U0U0h
         V9m5rc+MZoCHUuRCIPiaks05yCuUkCgEdLiHUbBzJBisCYpySCHzL3qy/AOOZz6RCxBI
         GynC72EynlIbxLN1yWIx49F9l4YKwMW8YMNxjUQH49faUAzVkw/eR9kIWIp+2prCPYuP
         ggiA==
X-Gm-Message-State: AOJu0YwlnPTQvpDT3gmdWfFKiOh4vw046mmrMsCungJwEzlgJqz07XSB
	+Y2mJscmPk1gdZ9rPErE8R9iEeg2XYW1nQ+rIHCR7nc27wdh7sknBGf/1WztFV1zRwh6cqjOcu9
	Gb6yXeN08WsjaWuNb/xHhZzx7FP7E6uPqS6BlUhBAGNXtjpe7RMjgXhJUy8RUkZAp5Q==
X-Gm-Gg: AfdE7cnIq0S/qWpnxkoGX5cBUC2g9lgGbXtOEZAQrM3DgBf8gGtWTom1fTsIgnBeS7Y
	PIwII9UeZNoSDpDoiBJS3BsYviDxhxQ0kFDd4OWzOKxFJ00UI99kWuBMDRRW76VtFGU2bN+2XUh
	3ARXDH473MiVRs0K38W/4xG2TohqRpHxALvbSyP4e+77LaG7wjKeGdwMYNFpulMGu9/4VPXGZSZ
	9zS9/YM7UwCSmhnl+WWjG/NNGWVALDzzFaFwuRkmCdMTfUIDbgl1cvwyaaP6pXCxC9rx6FWDtFC
	rVfH5sO1KeBT/PCuxW1iBPCZBGCld28o1dypr1IN7PKSXax5kHhy7Q5Atwixpy9rGai6ZTY0ziG
	0DHH6dl8PpFqd/TKhi7eckN724GHo+Sav2QM6F0mh67bie/x57wZYwUe0OHeFltWEhccHPfEy
X-Received: by 2002:ac8:5942:0:b0:516:dbf6:f8e7 with SMTP id d75a77b69052e-51c74801553mr5552971cf.17.1783344670523;
        Mon, 06 Jul 2026 06:31:10 -0700 (PDT)
X-Received: by 2002:ac8:5942:0:b0:516:dbf6:f8e7 with SMTP id d75a77b69052e-51c74801553mr5552221cf.17.1783344669938;
        Mon, 06 Jul 2026 06:31:09 -0700 (PDT)
Received: from [10.38.242.66] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41d2d727sm96867101cf.15.2026.07.06.06.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:31:09 -0700 (PDT)
Message-ID: <b702c745-1b5d-4b94-b2c6-46e79a427768@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 21:31:03 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: og0ve1b: Add OmniVision
 OG0VA1B camera sensor
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
 <20260702-og0va1b-v2-1-0071442caa2a@oss.qualcomm.com>
 <df510ed0-815a-4d72-b7c5-05025d8dbfd6@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <df510ed0-815a-4d72-b7c5-05025d8dbfd6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: plUkhEk0MEy3ZFcTtMcEpqvjc_y94sp0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfX9/C4TzFYtBgO
 GwVhlq3LhojY3SCM0URWdT5Lcm+ZYh44QgWkuZE48hKMsZdh5baDDEtuIviIXD+hZYZIs87qEA/
 WmgIHY9y5erZiEPt+RNYlTTWDCSLa0M=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4bae1f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=d2Zw2t_Y-wEgfmB-ChUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfXxxedxHxH0mL+
 v+DgyUmma+KSsGpAEdSIefYMdaVY+ypZXrTyZybnf8H10ZuAunrcp0fEI/MO6mkQRIlsc/nmJgg
 vdBKIXfGf3UfhIBWILvbK7dK9GAwoBF6hZ+3k+6xBQ9eALjZAztXqk/oxRBW6YFNPJzt81W+Ldy
 5P7RHwcig9CaC1ZfMJmzc0yBYP76olwjgb2OBDeAbcJg3Co76khySOY45ECLl1jI3J8RwEawLjS
 lCJIpmV7SF8UsdViLWw0rfEjygGKV5FEfb5m9dZhoXuMPzb26vbyiLKRa+u/LtK3L42VWVuYM0G
 Lx22JAvVLfdPgVHyk3EQS9x7aKOh0KY8o0BdQOOyl7/yXdnrh4GlXT6+MWbv12pYARWiRH1IxZw
 1dN2jOKjj9TOlcczqRrDLGlWwbG52EpNt0nlNcFVvjYUxYRZkSR9fSng8M3L+rgGayiMN6GrThx
 8yNyFprEAhPirKc1qdQ==
X-Proofpoint-ORIG-GUID: plUkhEk0MEy3ZFcTtMcEpqvjc_y94sp0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66762-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: B75B67127CB

Hi Vladimir,

On 7/2/2026 8:24 PM, Vladimir Zapolskiy wrote:
> Hi Wenmeng,
> 
> thank you for the updates!
> 
> On 7/2/26 13:52, Wenmeng Liu wrote:
>> The OmniVision OG0VA1B is a monochrome image sensor closely related to
>> the already supported OG0VE1B. It shares the same SCCB control interface,
>> power supplies, clock and MIPI D-PHY description, but differs in its
>> chip ID, register programming and output format.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/ 
>> ovti,og0ve1b.yaml b/Documentation/devicetree/bindings/media/i2c/ 
>> ovti,og0ve1b.yaml
>> index 
>> bd2f1ae23e6547032361924a6953000bab1129df..ae44ec2fa9035b4e19834888a41987ae9e25118f 100644
>> --- a/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
>> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
>> @@ -21,7 +21,9 @@ allOf:
>>   properties:
>>     compatible:
>> -    const: ovti,og0ve1b
>> +    enum:
>> +      - ovti,og0va1b
>> +      - ovti,og0ve1b
>>     reg:
>>       maxItems: 1
>>
> 
> Since it becomes a shared dt documentation, it will be accepted to get
> a generalised description section also, in any case:
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 

Thanks for your review, will change description in next version.

Best regards,
Wenmeng

