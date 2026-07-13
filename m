Return-Path: <linux-media+bounces-67445-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G9NbFsuiVGpRogMAu9opvQ
	(envelope-from <linux-media+bounces-67445-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:33:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DECA1748BC0
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:33:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oHw0H6+J;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iYkXF7N7;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67445-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67445-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26DE43027DB5
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 08:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3B83B27DF;
	Mon, 13 Jul 2026 08:32:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2394D3B14AF
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 08:32:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931574; cv=none; b=CPJvysIkgTT9fdQMYMsCTKFRfJEAmZrZEkD/6W0kWlIysHcJe8OE0OtDGntnAtwjm/wwDRkOWW75E3wfSluVwVxfEv1ymFGzk3iepQQYnlXR070EXbPt3tBvQkmLXeyoWJpAbCrVbpVasef2rwQBF7ds1yz/jp+QxmeXE+jAEqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931574; c=relaxed/simple;
	bh=izT7iG+kaH0m4tu0+8NdueVzy/iX/EoTNiE5/rPw5JY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rQZiJsDFz4czIDVgl84as693fNmnEmrzVwGsAAQJMmGsVgyYiUMbEsvCSy7HDZpIOe3TQpcMPjUCQ5W5JGEv8ciamjQ5inlgOgIy256dF5e5Tdkqnw2v8wTEgVl5UXW5A8VtYQk2U2Hyd+6edTO//0Y7l1kdGJ00wrEfnzI/Hho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oHw0H6+J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iYkXF7N7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NuaQ568068
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 08:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	orA8N+rUfuLziWiAdmDsk+WxJbTynnYWZ3oIdn7j9VA=; b=oHw0H6+J5xZGv9/H
	cYcjHa9QkeP6GovccH1Im00OpuN2zO2QZqbmUty7t0bcfod0fATzhPRkxGOaJluZ
	hSncl3RP84NXmP3QuVXOCVSLydo0nVawL9QgU+VEL/LxgsQvjA9hVWzwiwi6xcop
	9fWbCIwmscuPBQwP+w0zQL86A2egMhXtiT77aF2hQM//tnk5GxBfWCeguPAbQ2td
	Y5p92RpyFWZLJAbzC33iBy4g4ocLkODhi84WnoxHmGnlzIpteIiyCf4YLqYEA+6s
	4DCBpp0kLOJSu3Y5Z/lZesngIuC/e6CuA6rfl2rcxOd2vPE7s6mCRnJ+OUxxJnhI
	RMAiHQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe91570v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 08:32:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f0ed4fe79aso68567116d6.0
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 01:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783931570; x=1784536370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=orA8N+rUfuLziWiAdmDsk+WxJbTynnYWZ3oIdn7j9VA=;
        b=iYkXF7N7nrS/UUAvE77xM5Ey/jWqJMVUTzSfNSg98okeH5s7cL0dDDrXkhZ+lIBv9D
         4wn4j6iELmyQ9hgdg2A+4T97zVikiNpFZ7HDhH7yjwrNZIY+ubqrwGm2Gi/l8+eXOPbp
         /kUYhxG4gQNUrt2NhmVmhZXlpbPOmy56AvU6zH2CvLlC2Eb3ODrq0PGUy6NxkHQTpyzl
         LDLwlV65W8jbrHS+gqg6gYy6P4ZzyOghOPTfHe75JWuksrUv9SO5ZcDt2IdRKlTdLnxJ
         AdoNa8OWjM4eTHucxaKBxAhggcnTI2yoto8BXjuXafU8Ju0o5j/wccuuqXBeuAJDMO8g
         1wkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931570; x=1784536370;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=orA8N+rUfuLziWiAdmDsk+WxJbTynnYWZ3oIdn7j9VA=;
        b=UuUL7QYHnQmP5VlCZ23zbcygk3KICYxbvDfAF5tQtAIHk+w2gKOm4tSBGbsPtrwmqE
         osWH8vgQwsusl28I86dbwzPBm3b1Br4mqnRGGwlZWsPIOuvxPW8Zvaqx+jv7qCMa8UiX
         nh+gqjKh8Rz4r2C3De2u3lKteaeJ1h1tyux8uVx5QcBVrVDLFg+oKaFs73jjlkzPwjaa
         HAdruAAorJ9Lid7Z40ux0Vombdc6wKnROWCo8ldGaHSva8tYIV4/23FoOJWNe1LP9Vyq
         Qw/W/jEI/FsIqPvE1uLw76kfzvOUFlwGt6LQq99J40mf2dhE1o6jtGBqDn097ElXKTqQ
         okmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpd+Xx3rBvNsiMPSw7hungLGFGHKZKEoY/zEwBopw539q6N00kSiAoeAmEjkjwcZkiirmBRn0TUalcaXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZlO4HTJvixhSImRq/QVnQ8QoAlGwiviZs5bJrevvmN9LZs7M9
	q1xq7BqqHmq7BtlwIrPFpC19EeewOgE95/vGVapKU3t3t1OvfcckQpMMSHR6eNDzWZPRL8YauRb
	SQVGIqNn7tiAOjMET/AFiXF8LOFWfVBVMa8BKZO6g3/t8D0CdiiUKbfF7s7GyLF7piA==
X-Gm-Gg: AfdE7clS1KpKb1iWhEK2sha4tpH/169dU+PQaWHdUeEiAFlXpEFduX1pJobMmficOCf
	Br8FNCLcifxJi9iayQFyHXI8kYo0EXiaLj31xNoPLEkgFIwDBLEixENcwoEf05LTlWOEfTtpwo0
	JJwiN4HZc+yE0szwdQwmxZz9ub3xyCG4+Fj6TR2c+Ri32dpSoJLsDERIqBw/NMV+8Ma6KHIDieN
	XuCG1M6poj+9wL4EI3Gq4ze526VkzeN5ZHJ7J/jfTtDeYfVsraYiZ2Cx1bexkP+Cl4yxRvvYMxM
	86tqtThoALEaUygy/ntU2tp1wMn0gxALMyupwM6YdAjksaUq61s9DgoHUk96lWMYH3w5s4ojldh
	b+pHmWQCV4kTqW5EDBzKvdW8XXIIuZr7gfj5V1YXaVq8=
X-Received: by 2002:a05:622a:34b:b0:51c:88b:d7e3 with SMTP id d75a77b69052e-51cbf0c4b4cmr79278231cf.3.1783931570533;
        Mon, 13 Jul 2026 01:32:50 -0700 (PDT)
X-Received: by 2002:a05:622a:34b:b0:51c:88b:d7e3 with SMTP id d75a77b69052e-51cbf0c4b4cmr79278101cf.3.1783931570178;
        Mon, 13 Jul 2026 01:32:50 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bb51af39sm858900666b.29.2026.07.13.01.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:32:49 -0700 (PDT)
Message-ID: <30a35954-4d0c-479e-8918-9f7a3a049a5c@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:32:48 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <7479fb60-e14a-4c00-94bd-ecd5a493bec8@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <7479fb60-e14a-4c00-94bd-ecd5a493bec8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a54a2b3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-YhuI8MAAc7Bk1R6834A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NyBTYWx0ZWRfX0rQf7Np5zKbl
 K8w4U+mnVQ4SGMC1hm6h/9jdFrW4uviKsUJA3rPpdPrV9WJ1D/iFCd5p2A2Id563PDR1fc+t67w
 8ePUKsVh4noM7yhSLMoE9DgV8UQH16I=
X-Proofpoint-GUID: dBo4oxYAkHQ81LRXthk0_Z9jk0nOM96X
X-Proofpoint-ORIG-GUID: dBo4oxYAkHQ81LRXthk0_Z9jk0nOM96X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NyBTYWx0ZWRfX+GeSpInYo05E
 rDBS8A/TgQ2t8Ntddl3CcNs1tucIlD1Bm3kJBH9cfcl7hFOwUvLd4zSmyR6wnfrfwiopJQIJdXF
 UKbpT6i3x+Q6DALiBjLUet/50/CTSmeJRkLPCwHhNtGb1+o+ypBqRJbjQp1tvIEL/jj8JRs4Mc8
 DnQ0nUXJUo7qxDwxjyW0TcSLRuLMbQdJZqMbh+QWRiIIARMTCEkUZWuY9/XrYgK4EDV+3OmLLWC
 kIQMNRjZSGoMYfCIc2+XdbJwrZp96S/6opgu6MrJjPi2mQoh6A/dLXLsD3FpyDziPi5u6yQFfZu
 VF9dL5v4NAeUzvcxP0oA3NSOjH7Xa3FPkZ5sr3v40Vv5xICwRTE2WB5OAOT3RVVXWLvKIZSnesR
 ZyRn8ZfztBulGfKaMZQ+elvePE5slto7ZA9vIlF7ZFz84yM+07KjNix8ZDzFZNERES6ULoEl/IT
 Cjv/OaA7mDqhcA9m8xA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67445-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DECA1748BC0

On 7/6/2026 3:24 PM, Krzysztof Kozlowski wrote:
> On 06/07/2026 09:11, Atanas Filipov wrote:
>> This series adds support for the Qualcomm JPEG V4L2 mem2mem encoder on SM8250.
>>
>> The goal is to upstream a standards-based JPEG encode path using the V4L2 M2M
>> framework, with DT-described hardware resources and SoC DTS integration.
>>
> 
> 1. Here was NAK for v2:
> https://lore.kernel.org/all/20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com/
> 
> When I asked to implement previous comments.
> 
> Did you implement them? No.
> 
> 2. At v2-1 version I already asked you to implement comments:
> https://lore.kernel.org/all/c9006b67-aa43-41d3-8b13-f20dd2e544c6@kernel.org/
> 
> Basically now, THIRD TIME, you send the same and you still do not
> implement the comments I asked you at v1.
> 
> I treat it as deliberate action to ignore review. Me asking the same for
> the third time and expecting different results goes towards insanity, so
> let's avoid me becoming insane and consider all future submissions also
> NAK-ed:
> 
> Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof

Apologies for the repeated failures. It was not deliberate. Inline
replies to all your v1, v2 and v4 comments have now been sent. v5
will address all of them without exception.

Best regards,
Atanas

