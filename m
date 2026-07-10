Return-Path: <linux-media+bounces-67226-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bALdGy+LUGpj1AIAu9opvQ
	(envelope-from <linux-media+bounces-67226-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 08:03:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FCF7377F1
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 08:03:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GK89rhVm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IK2YOHeP;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67226-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67226-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 310AE30285FF
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 06:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8356C157487;
	Fri, 10 Jul 2026 06:02:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1A638228C
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 06:02:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783663357; cv=none; b=hSjfNG1YbtJUbYg3FT+AwVXrNtdX2Ugi7TukkkApwhInIuEGGrRKL9WDcIOVo+WsR+itjyFgTZK/RDbeQqGt7B1y5RC4Evw/RwABoCzwAhENmKphWnkAF8BuP5BXDjVQAoZLMnjCQRVNVNLhFJx7wpAq1m0pbMyF9LbGLnzScJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783663357; c=relaxed/simple;
	bh=i7+MyjZgf1Jk5tAroKpSXu+vfaDFclqPoxtKoJnBnec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jU1ionxncIUVvUbhq4vZmLloMxiC3v4cQe0Tkfw4AueaUuDW17JU6GrtbEfFzNXDszPT9jPEOxqBKyUCnGI3oQXjcS65tgXOXehLSqn2xiED9m+qVY3FH5wKEyz3ZuqHwzXFOqPCulX/w+ZCxbvO4kC33v3VPdNu6jA2kZOD/vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GK89rhVm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IK2YOHeP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3mbhs3838073
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 06:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dOKL3wk+8CSlHBP7DE5WbezsfbSE3CiEC4lz+wAgE0w=; b=GK89rhVm4ZGbKmHw
	5MKAfahQkB/wtQ5ezHDeVLGVOjD2DBhN5U4gdO1bJaJpRnXDlJ37Oyp/W6kJ1nby
	PoPs1opZy0cG5SRkIsRTyUADgiXMx8MZjaBA/7IWbN5d873OLYs3nbaYsOPqgU0w
	6Zz6d9eqbW8wG+rRQ2ScQCBxFnuVLkzV5ef3Iv0uiyuuU3JNi9tI5zOkIamTdiQm
	oDLXkcwhiZX58jDIalrY4k5OIt0PUtQIMo8czj8AmDcQOu6CUFYzBNOdzfE3z795
	fyJljcRNweACkKE/dEbGvbMsCVMuc+VpEMzGAscnHbTxJO8zXhp84ciim6mMABi4
	/YfpkA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanwe91dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 06:02:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e820609d9so46316685a.2
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 23:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783663353; x=1784268153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dOKL3wk+8CSlHBP7DE5WbezsfbSE3CiEC4lz+wAgE0w=;
        b=IK2YOHeP11sieMF9Uc0nToI3fPyTIW9SPcsMW+Ns9eQ1qYwj1VbgjJPhov6XH+aY0Z
         fVQDQEkAXtq9bPSzNoSUBl7RGW1Qtm0kN5TTfgvqEKmLE/a0MTvlV8etu8jNDgDdrU4r
         C9BNL9mzfDOaWe06yGIv89Gbv4xwOHoPtaViYJ/Y8yHgpvhdIQztHb/sDR/15eEp40ZJ
         mUaFU/xXxTNnqOVPWHNWxZkQo00IKsjwe0xQ2tsA9o5nl+DDzhfKR3iLmH1l2gFGKLmc
         TQBYZ67PsxiFdfdLWiO2iOlakmxe+itNfeC1deJYTudHv2cHVhLa9A1MxpRsm9C8jXFg
         UuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783663353; x=1784268153;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dOKL3wk+8CSlHBP7DE5WbezsfbSE3CiEC4lz+wAgE0w=;
        b=nImLW5kAG82FzNsPB9HtpNCnvWsUK1P2DIGQ+jiOGtGZL6OzVy1raE1HVqipFggq6k
         i/BJkhWTlKYHGADd8qvEnt0mrbgEs1vO27qyuGoAQLZuXg8mwpBTwIeL33gA7UK753mE
         N6Ek5UvxyXAHc0YE1+JM+5woXcp7FMC9GfjCRdKrjDgfSDbUsU93viP0T81ZzyWQ+HFx
         wr1YrApm3VJKinCLEpU/6oIlVwXkPTAGY5qzUpu2qXnUzjzsBqPYTscuoSPpQg6U8S9O
         Z+avoyp7jW2LGEdVUxY9qC+Ol4Pc91yIn6Qa/rFwYZrX32wwGNAOYb+qqHfOZss90Ok6
         Y8Cg==
X-Forwarded-Encrypted: i=1; AHgh+Rp6CU9Gp88ud3LPcl+sToLSmBt4dmIq5q4sTauyGo9jdUd3bY64WnR4c3PdFX9hVRGoKkIb9t2qsgcFOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv2CgtSLhMPrRiHYRHBbjVQ5BH25YfcGE7n23es5aJqSGt4Pet
	mF6h9Wy+p5eC5QrJTwLkdy1a2UqBT5LJ378qnImbQmJ2viLfYohxS8usKrWlpejgImquE+BA06Q
	qfOmNcUAkwDOcPg4yUohrZWNcthYeEx/kTRBiN1Sf2EKLk03i61uUY9NsTUFbL+T1hA==
X-Gm-Gg: AfdE7clEFnzxVSun8Ct12lbwlmW+tnsFOayvfcoCfp7nX8g0Q9918+Gdc3KAG+J9TUQ
	6RqVX4gSLbSMnrnVYHfS9840qrcDxYtScqDUSQHzU8JQSBX5xMhUkmIuUF+jIpVq+mK/lrc9K9/
	co4krREi3yUVheXyOG7J3VtXJch02wfCTmPQ0uu555tOIVcKgbR0DvfrfkJMRU0vObpiUw4d3Up
	wv2LIhuTy4LpWGw8QYphlbN1pj/nNglgs5NiJuHRXjSfiCRVxF/495q9mgJ3xDLa0g5S8BtFB7y
	bxd2LpW0fiYBDgEHgeOmQec7UWkTBOKedfh/mSFO03QxQunkqW9fzqznVHoV4SqjmM+pG8LB5A+
	YQy2rnU9c3HXa2uZ2VODyHc4Xvj983Fcgrx2eZzT+gGyWBQ==
X-Received: by 2002:ac8:7e96:0:b0:51c:ae7:fa1d with SMTP id d75a77b69052e-51c8b2aa0dcmr105230681cf.5.1783663353089;
        Thu, 09 Jul 2026 23:02:33 -0700 (PDT)
X-Received: by 2002:ac8:7e96:0:b0:51c:ae7:fa1d with SMTP id d75a77b69052e-51c8b2aa0dcmr105229991cf.5.1783663352617;
        Thu, 09 Jul 2026 23:02:32 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.253.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d7a375sm10376469a12.15.2026.07.09.23.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 23:02:31 -0700 (PDT)
Message-ID: <201e8354-fc34-4d2a-89d5-8661a3a66133@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:32:20 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/11] dt-bindings: media: qcom,sm8550-iris: Add vpu
 sub nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-1-72bb62cb2dfd@oss.qualcomm.com>
 <h3kbrpbz7naivqv2urba6ai4sd7kpaqz7s7vxuxuktoc5q2ojx@u6zngnmrbenb>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <h3kbrpbz7naivqv2urba6ai4sd7kpaqz7s7vxuxuktoc5q2ojx@u6zngnmrbenb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a508afa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=MoCqpHF70WjPNMFBpltNPQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=keBE5688ymhvkto9K50A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA1NCBTYWx0ZWRfX9YrtnFuv18UJ
 DwYQR3DSyZZpPVvgQeV4jkXzSit6pWRgbOWPeqFx4n4WQzs+B746HuzJEOHF59wiU1KycqsvLcc
 7cFgTGKOVV9TU6FO6BZgEOc0fYmScw7u+NlIrFvbUI92wHSP3m9vhYjKI53hRRHvPr5SE2F6Z1N
 1yvQaJ0bQIgrWDYwYJDsHFUrgu9BssBpI1DVotTYXksYrgobkiu31OhlT3P6GQDP2mBLswVBzlQ
 cqVEVESuUF7w9D9oLPwUckIAd4J1+uKMj8X8DQY1PIFRcvLpo7KW+RpOysjDTZ2CyR+CNkdPDls
 m3D84rOj4i4gGQvVyNJ2lVMQwMfQdcdPHChOdmCeTrLZYSY/Ea4lIKnA6n2nab7QxG+TY1Fe8VO
 VH1U5lLL8ZLuxyXWY3/S8KWENPE0cXSZEWdjyakfbP6w5Afkm5DJwFI3TLKTLnyRdUd+EOKeXfQ
 TGQw9eBX1vF5CaJVWGw==
X-Proofpoint-ORIG-GUID: Hc5DksZh-mqQ9rsvEdLx_oWEs-SoW43F
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA1NCBTYWx0ZWRfX5H23QqVRQmoE
 J/b+UmnnsRfJRfhebGkSk2PvZgAxUTCG7GVH+Rh2LBYoN++/KRWpYFO3R1Fu1J+X4tzvL+U+/DH
 oJix2KCczo2R36f+wTeBX/OkF/Y1yMg=
X-Proofpoint-GUID: Hc5DksZh-mqQ9rsvEdLx_oWEs-SoW43F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100054
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67226-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3FCF7377F1


On 7/9/2026 6:20 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 09, 2026 at 06:05:47PM +0530, Vikash Garodia wrote:
>> VPU hardwares have a limitation where VPU streams are associated with
>> dedicated addressable address range, as illustrated below
>>
>>      +-----------------------------------------------------------+
>>      | Stream A reserved region (600 MB)                         |
>>      | 0x00000000 - 0x25800000                                   |
>>      +-----------------------------------------------------------+
>>      | Stream B reserved region (3.5 GB)                         |
>>      | 0x00000000 - 0xe0000000                                   |
>>      +-----------------------------------------------------------+
>>      | Other reserved regions                                    |
>>      +-----------------------------------------------------------+
>>
>> Mapping a stream outside its expected range can cause unintended
>> behavior, including device crashes, as reported at:
>> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
>>
>> To address this limitation, the subset of stream/s are now represented as
>> sub nodes, so that they can be associated to the respective addressable
>> range.
>> The limitation could be exposed when running usecase like concurrent
>> video sessions. The binding have been validated with higher concurrent
>> sessions across the SOCs supported under this schema.
>>
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,sm8550-iris.yaml           | 66 +++++++++++++++++++++-
>>   1 file changed, 63 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> index 0400ca1bff05dcef6b742c3fbf77e38adca9f280..bf4d24ce90bd38666704274390b98be450f708c0 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> @@ -91,6 +91,51 @@ properties:
>>     opp-table:
>>       type: object
>>   
>> +  '#address-cells':
>> +    const: 2
>> +
>> +  '#size-cells':
>> +    const: 2
>> +
>> +  non-pixel:
>> +    type: object
>> +    description:
>> +      Non pixel context bank is needed when video hardware have distinct iommus for non pixel
>> +      buffers. Non pixel buffers are compressed and internal buffers.
>> +    properties:
>> +      iommus:
>> +        maxItems: 1
>> +      memory-region:
>> +        maxItems: 1
>> +    required:
>> +      - iommus
>> +      - memory-region
>> +    additionalProperties: false
>> +
>> +  pixel:
>> +    type: object
>> +    description:
>> +      Pixel context bank is needed when video hardware have distinct iommus for pixel buffers.
>> +      Pixel buffers are uncompressed buffers.
>> +    properties:
>> +      iommus:
>> +        maxItems: 1
>> +    required:
>> +      - iommus
>> +    additionalProperties: false
>> +
>> +  firmware:
>> +    type: object
>> +    description:
>> +      Firmware context bank represents the firmware processing domain of the VPU. Required to boot
>> +      VPU when no hypervisor is present.
>> +    properties:
>> +      iommus:
>> +        maxItems: 1
>> +    required:
>> +      - iommus
>> +    additionalProperties: false
>> +
>>   required:
>>     - compatible
>>     - power-domain-names
>> @@ -98,9 +143,15 @@ required:
>>     - interconnect-names
>>     - resets
>>     - reset-names
>> -  - iommus
>>     - dma-coherent
>>   
>> +oneOf:
>> +  - required:
>> +      - iommus
>> +  - required:
>> +      - non-pixel
>> +      - pixel
>> +
>>   allOf:
>>     - if:
>>         properties:
>> @@ -177,12 +228,21 @@ examples:
>>           resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>>           reset-names = "bus";
>>   
>> -        iommus = <&apps_smmu 0x1940 0x0000>,
>> -                 <&apps_smmu 0x1947 0x0000>;
>>           dma-coherent;
>>   
>>           operating-points-v2 = <&iris_opp_table>;
>>   
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
> 
> I think you need "ranges;" here. Also an empty line before the subnodes.

Could you please elaborate on what would be the use of "ranges;" in this 
case ?

> 
>> +        iris_non_pixel: non-pixel {
> 
> Drop useless labels.

Ack, labels can be dropped from schema.

> 
>> +            iommus = <&apps_smmu 0x1940 0x0000>;
>> +            memory-region = <&iris_resv>;
>> +        };
>> +
>> +        iris_pixel: pixel {
>> +            iommus = <&apps_smmu 0x1947 0x0000>;
>> +        };
>> +
>>           iris_opp_table: opp-table {
>>               compatible = "operating-points-v2";
>>   
>>
>> -- 
>> 2.34.1
>>
> 

Regards,
Vikash


