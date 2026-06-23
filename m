Return-Path: <linux-media+bounces-65445-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id foyeCtcxOmos3wcAu9opvQ
	(envelope-from <linux-media+bounces-65445-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 09:12:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B76C86B4BC1
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 09:12:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=I19xqWIX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XV3jscX5;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65445-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65445-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F3F330588A3
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 07:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B363C5523;
	Tue, 23 Jun 2026 07:11:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205293B3BE2
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 07:11:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782198702; cv=none; b=KWITlqkmBw2+UfmxEbhF41Qvt10P9c9qFIimjxW68q9XIrSGds7Nbn+7d/BJBzaKBRsrrwidJE68WXyxJv71dfLmdG0D5JOEDn5qB++uDU7pRaDXYGwvANWCawTgP14Iyh82dOMdesPVhmzGDHIYDeyFVZs6tDA0gEmbnXF8DcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782198702; c=relaxed/simple;
	bh=kB7QEfblh3S2EGzxlLFjO295ZLcckUB1cfjYyUGYLU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mqd85WWqiKa29/eIVxFvvUCFXu15f3YYTWBgFwA5vqFIJkorbeahXk7AwEumuXjW/bnvsQAN0uv9wrV7QEoF5vuDnSr2UMaUK7yfhVnEwtyAJs/M/4XVeIpiyGekST7cVSvXmtOJFh0I3FTW+zLY0Emd4aVDMWDz3AV/jJWyh/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I19xqWIX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XV3jscX5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6ck2r3564025
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 07:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n+jQrvwaaO4z3xea2qKYmyC/zelClBy3n0fYvHpSU5k=; b=I19xqWIXPgH+GiV5
	sr+s8YbPgbAkzGckQG0bPxAj9s6pUdsK3fIDMeRNI8Du5N5fLhhgTs7cgajiL5fg
	kxvvtZw1dJ2gPsYcFQsJ6z3xcoOCNycAI0ZpKSSlpwXgkeKGko3c1RYBa9y2B5hJ
	lcxh8cnAMvOc222DB8suoyocForSxIlGQPsKbZuIvTk7lZtC544WjGiLdOlbwhzr
	6WnBzIFrXNo1NQV7NozW5oMtcl+6crB9CGGxTUO/C+6IXEvZJ1ms7eoWBLX/HMy/
	KocjyAbWudhPrbb7dAWmP4/cxfByc6cubhvk8BqpNNJnOoB5D5VJmKfsy8NZBAKB
	WpqXaA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n43fs8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 07:11:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8dc4d71a6abso139791876d6.2
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 00:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782198699; x=1782803499; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n+jQrvwaaO4z3xea2qKYmyC/zelClBy3n0fYvHpSU5k=;
        b=XV3jscX5XfG50fwHVS2QqDxZiTL50H8lxShRuVJJC9MehbBmNeymYlbplX9GZ/ydDw
         De0vN82krDEaOKCv+8vbI5l2xJ2WBvlN978OhRXIPTo5HAq8khA6MOjv8bvyfozATdGp
         GxC56zuUJtquUJ3AByzTzBP8GDeLPXgx5YF6vtCRVO/4l8QPN8jvKWG1q1HIcvVg6FmF
         +UL7TG+dF4uYS+H8eNiuxhDVQz7tp6r+GAtbBLn2IfAneHkIF+V+MFqzKZBsE7ZGK4tE
         Kys/Ic0BlVNrPeWtHiqiYmqYY7N+gujH3UvMlQjFVo41QGgY/4JxP8vvmpZMxksbJniY
         /bKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782198699; x=1782803499;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n+jQrvwaaO4z3xea2qKYmyC/zelClBy3n0fYvHpSU5k=;
        b=HCe7D1MF3WG70f8sYP2/Bp5dkBiHmIpfONGhdqmsAweY/pvpbDCUzKi5WdOPUJvabs
         oQhM5MJl/PbDLiHsfY4QwtX+40qk9Hii0F8K72/XR2LZ1LhKoPWmKOZ/yJTVRY9TwzH3
         8KAqvQ8LE0MROxcBjE+lh8CMG0VDXY/PnpVkdmq28AGpDAnkTVNL35sXeK8j5Aob7WLX
         dLEZya7iTsXyWefu789DsIqvdXyns8+ynkE1pRQSzV5Y9QueYrDlCA1QbXm/VBar3kAj
         pz2dxauwb7HLappwWKT3lLCB9r2ReOKARREO2VfqA00ezultT4Qxl7/mYcZu576jPaRZ
         Dkwg==
X-Gm-Message-State: AOJu0YxBbRaV604Bx07Ug4TadsSLYSMErzA2a5G0Cc7w7nLEi9hYCXsX
	FYIDaVCszpqhk6r+uev/pSvs+9sc4LnKwMUHOcA6RG+0C/toOVaK2ATIcS8J74HqPWVYViBA7OL
	iWNlxp8neHUcJIUJ30FVSyKwnXm/ZRQa8pkZLX0UvNJAp8Z8nU95CykXpzxW8M2tG5VtSLKPoJg
	==
X-Gm-Gg: AfdE7cmGfQutUcmBA3SZs40xgmHuZqwqZCWVPciZHT31Gkj0H+lNRgzZ0uqu1MRWers
	PHeawXLRPHxkjohVXiBqkmwkIo9r14wA+qmres+ci+6lawYTdbvO41vR0yDsqmc6qZgLC/kYIIn
	2KuVS/czS+EC0r5AoUvi0wDIKO8I5wdfIB1fJ+GO7LipkCvaTQapsqmsQFgwqoyK4jCztSVdCKl
	zQj6rJX9NIqiKWDPcY4oleSm8fF696SBY88zxvJYiXedaenaqhSHF+Pz4Q5Wj4EF+fqjZivqtMg
	X/O0P3y+KPNRPETjuoUx4flw5kByQZY3c39uUlBM8iKv8hbOqj2/VSJ0oD6lQhb0eevj60UUA9n
	4BuZXYj9l/5N99gO4zME531bWvZaJrItE0UOomBP9
X-Received: by 2002:a05:620a:6cc1:b0:915:f27f:e711 with SMTP id af79cd13be357-926674343d7mr241678985a.19.1782198699311;
        Tue, 23 Jun 2026 00:11:39 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc1:b0:915:f27f:e711 with SMTP id af79cd13be357-926674343d7mr241675585a.19.1782198698807;
        Tue, 23 Jun 2026 00:11:38 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c5397sm36071434f8f.13.2026.06.23.00.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 00:11:37 -0700 (PDT)
Message-ID: <11fd3025-0f3b-4a54-b219-c7fc8e87c883@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 09:11:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] media: iris: add support for purwa platform
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
 <82834dc4-14da-4a92-a1bf-4b8e744094c7@oss.qualcomm.com>
 <45fe0be2-a397-4677-a7b1-527574c7578b@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <45fe0be2-a397-4677-a7b1-527574c7578b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA1NSBTYWx0ZWRfX6VDOZcqUoQij
 pDp7zyWBc72vYszuZhYeAd6EfqUW2WrqnUpIRC/fZ9w7y5cGs9X17anQujH4iLeYbZMldKf4tTO
 xxx5zgKV1jccXAjRf3Etzk36WPamkNU=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a3a31ac cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F6f3bTrXTl8tN9mfVr8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: zCYcZFPG-zWiVqV6S8bUS6-_NDg6eyvM
X-Proofpoint-GUID: zCYcZFPG-zWiVqV6S8bUS6-_NDg6eyvM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA1NSBTYWx0ZWRfX2JyMuyy8JHRn
 kXbtvMxXpk0wjUytRXJ1Tz16o1Z/JXJZ6p+c6LhQzaSb9xrvt5hQ8JFbw77mEQpQk7AFT84y86a
 NiFrF/0Hz9rXSbKdrcX6kmh+qTNxVrOmA7wyoT60/5DEdmbmicLhtRZAMn3m8/HcmuuDbloOadJ
 umMgKLi/wdyiLG92xP8P1+HbiiT1SU3DEqDKsh7Y20FDVG4pwul5SE3zYFID0tAjeDa/X/nuxrN
 FxmnrO+b60rGt8XanvRE4x8zZg9xuteLapR2VgjKNN8kqEVYXs2Lk+6kBlkxLOd07mdEsM5u99t
 d2LElkAva+IK+/5Co2Dmi0b3YJwFIj3YEabm+UZQUWtTRWbWBH9ZvpLGPfferYAx+YTSQXibMhP
 YSMaYrCxmOagsi1o/aGNiV9hgKNuVJa3VnKIZcCuULCD2BRi+7ztHrbBXq+t435jeLSEEGoSM/q
 N8VYKdNHxW6ikJ7P9rQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230055
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65445-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:wangao.wang@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B76C86B4BC1

On 23/06/2026 08:15, Wangao Wang wrote:
> 
> 
> On 2026/6/4 14:48, Vikash Garodia wrote:
>> Hi Bjorn,
>>
>> On 5/29/2026 1:04 PM, Wangao Wang wrote:
>>> This series enables the Iris video codec on purwa, allowing purwa to
>>> use hardware‑accelerated video encoding and decoding.
>>>
>>> The Iris codec on purwa is nearly identical to the one on hamoa(X1E),
>>> except that it requires one additional clock and uses a different OPP
>>> table.
>>>
>>> Therefore, purwa can reuse the Iris node from hamoa, but the clocks
>>> and OPP table need to be redefined.
>>>
>>> All patches have been tested with v4l2-compliance and v4l2-ctl on
>>> purwa. And it does not affect existing targets.
>>>
>>> Dependencies:
>>> https://lore.kernel.org/all/20260409-purwa-videocc-camcc- 
>>> v4-0-5a8e5f2dd4b2@oss.qualcomm.com/
>>>
>>
>> <snip>
>>>
>>> ---
>>> Wangao Wang (5):
>>>        dt-bindings: media: qcom,sm8550-iris: Add X1P42100 compatible
>>>        media: iris: Add hardware power on/off ops for X1P42100
>>>        media: iris: Add platform data for X1P42100
>>>        arm64: dts: qcom: purwa: Override Iris clocks and operating points
>>>        arm64: dts: qcom: purwa-iot-som: enable video
>>>
>>
>> Media patches in this series are now applied. Do you plan to apply the 
>> DTS ones ?
>>
>> Regards,
>> Vikash
>>
> 
> Hi Bjorn, is everything going well? If you encounter any issues, please 
> feel free to give us feedback. Thank you.

Now is merge window, so usually better not to ping - patches won't move
anyway. In case you wonder what is with the patches, I suggest to check
the status in Patchwork.

However that said considering how old is this patchset (1 month) and
after looking at cover letter with:

change-id: 20260209-enable_iris_on_purwa-a000527a098d
prerequisite-change-id: 20260331-purwa-videocc-camcc-d9700d0f797d:v4
prerequisite-patch-id: 61bdb45446193b72dd8a4b093e4ab2f78db2f066
prerequisite-patch-id: b5be9dcbb612a14108f890b2782860847edfcbe4
prerequisite-patch-id: 2f4d4c5c118e057c76e6d2785479df01d5bc1c7b
prerequisite-patch-id: 026db5dd71d5b0472225ba72c8ba2781334143a9
prerequisite-patch-id: 615e6f38e528de35dc206f1c7f3eaf78ff04afe2
prerequisite-patch-id: 66096b909debe4d942eee972948d5a138a5be427
prerequisite-patch-id: ee26e00cdde21ddb070af713230082ad3454422c

the most effective way to move it forward is to send a new version after
rebasing, which will make it obvious and explicit that there are no
dependencies.

Best regards,
Krzysztof

