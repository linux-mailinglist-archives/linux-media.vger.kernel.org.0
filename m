Return-Path: <linux-media+bounces-51820-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNbEM6uWfGl1NwIAu9opvQ
	(envelope-from <linux-media+bounces-51820-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 12:31:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8E0BA18B
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 12:31:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E25F1302B3B2
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 11:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C380C35E55A;
	Fri, 30 Jan 2026 11:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqK+OqKo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PNAMDt5g"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9464A36BCCD
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 11:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769772688; cv=none; b=qLkFYVC81WJwpbsn6vkHwK05cn50cUM0BCqzeyTdoeDBSxeLdV1F5V6DJheuP/HDUd3VdaHS/P+ae03tmf0wtWnxTWxIsBLvHmx/AuerDTdJvoh3mopnA3L7FqjM9uVNQ9D1iIiOSo5ZwiCTqvIinQWZBVOUh8xUO0nkHg9siLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769772688; c=relaxed/simple;
	bh=QVvt5nu4LT2KMvStPdraJbpmI4l8qIEcXRC75/ijkaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b3dROpesfVvzuzDVi+Za9S9dD+gFODRp8v3fke0d8gcrddrLqYN+7yFrOPCzZzDGuWSJ9b3+s+gJPr4zR9+4xCxA7hLEGSZajs4viqJ6FYT8aklk/726cRg25qloMD8To9BlOBe2CYGOojDfEbsNITe80Tsa9lt8fHAqTTg9A6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqK+OqKo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PNAMDt5g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UAkw392994092
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 11:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ib5mMHdjULOWSq+B1jE5ALjJb6hxhBoEZL3r8HeDGzw=; b=iqK+OqKoAqP9zHnH
	9Ri8x8cUS5fdAgr28dmo8C57LjDQoKLT4RBzOR86zSW6z9aThLzw/1cx501rXPej
	Y2wkn7RT/T+L0BkztIIihsrrMHSStKYTiwMlDDpJ26uuJGsA38HxhyWi5nMRW/io
	IN8sZNzaCx+CHlssgCwCEUcJivUGusPioTgG0dqztOrjjpCwyrqorsEDmV1eFzca
	4Y9INc5eVPPrQb0Oszp21+QY11yLgU5XeGmCFMxut4TTVYd3KzefvSINA+ZlYfS2
	FSxyZjBwcxripwp6oZLvFnJ7A/fxmguz+dq288N1zB+qDeAiK6sum+Bobbo9+ijY
	ceAvNA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0db1jmf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 11:31:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6de73fab8so17563685a.3
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 03:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769772683; x=1770377483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ib5mMHdjULOWSq+B1jE5ALjJb6hxhBoEZL3r8HeDGzw=;
        b=PNAMDt5gXyKXJJGxUB/9CnWEWX80Wlk3UiRh9NTy4ALiNQ8Al0bilPpch5nRQKWJYy
         2r5/LYM4EV1FtkxwNH4jqxRs1ZuqcxlbswoG7p7FJm/BGHDbDmj3K9lbG71rnlUCxOsX
         OJpUVhoy8mJoitZiXLYS5wn59vqDZNvhNF0v8F/rnecec+JkEfaT6lzgvnotzBrsgVYv
         Afhb+ilzXN2gNKFvG/ThfzbVgZvXTHMx2ejPFM4gBwR8jTpeVaxY/TXrG4a47ohbWuW1
         h8Jx/hgauclnceNg2x8J3MDy8LWvnDACI+fO3YDes5x0pqWjp5iBLgLErlmXxsq7dmpV
         +GxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769772683; x=1770377483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ib5mMHdjULOWSq+B1jE5ALjJb6hxhBoEZL3r8HeDGzw=;
        b=DJ6+FxkjVMeSFgRAAhUbECP4psTl0Z9hKcOzlgWCtLwAeM+QlfZBYRDo3VrHDOo1Rn
         bF397/VvsiohvKNkoWS5frcRAu+LqMLN5oR6buwyDXIyPchp2jaEU3cXll6ZIQabzsb2
         liaecLOzp/J5b8ZZSPEYfNX8fTf1MbV5BjdDYsZz4gYpAFfzL+2a/gQ/GIVJvrlEVaiV
         6NtIPCSXKzqXsqqNwfvEeLJbr5kWNNZJd65g+f1V2O6MbwkuvkXBveoPt++x7Or4A5gm
         tM06MWFH1ExdaSBZ11j2RbQQiJuy/t4mFBwmLVrm2D0YVI5wWIVB3N69mrKyWRYjVKcM
         7a9g==
X-Forwarded-Encrypted: i=1; AJvYcCUYZLRbs2sIbciGLwT6u6MWha5fT0sNeCXjTfpsi4vAoJX4yZcwAg/aPljdIJfBGNqagSMt1sph8lqsRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWdGjRG9taakqJ+r2D6fs7ry7Ee0RyhqVq2Qu1xKCv9KmBJUet
	4/QKwLsIh5m7rDUzU5ESTZgYHZz7Z5yAR1RY0FOyE1ykPvH7gJYfv54Md1E+CRP1uIxUMNiQl90
	0q5WTTdBWeixqITqf3Ojy4+lBaEm7Z5k0RQRoAPc9PsOf5stUF3Dmw4bGl66diOC0nIZnJIj81g
	==
X-Gm-Gg: AZuq6aLOtZG51wG4KR7jZNxp7+/zknX8Lu7PAk77csh9FMorYsiOOkY6cuecw6yNy25
	FXmxJtbj+eZySa+l6aWYiSd3QrF00ASpMkFpLuGD//aE7MyfWziL7Bro+aYRxcreJUCv31E+nAF
	rmSFGnOW79jxGeieZl2b1MwwN8bcuayEeTadv9QVMKqxYNszZplHPReRUWUmKi1HAiC5mvrMyZh
	3+guLbcX0Ws1rohRWCV49GbZSxwPkTowx+WPgXMaA6vIjScwOdcfgAz4GOIjKNH7wpNoLPE3bnL
	MaoMz352TjACtkgy1qiT9JCNziWejqveDK7aRROeDelb2M3lQpgXbcuUE5uzevZzypp/dS2B9pf
	X6xJvMr1iiblxg9s49tT9Hk6LzB5UPdm3h2g5PjM/Kj1V3JI4HjpcFlXqj7zvgr8SmtA=
X-Received: by 2002:a05:620a:19a7:b0:8be:6733:92b1 with SMTP id af79cd13be357-8c9eb139c25mr285187185a.0.1769772682612;
        Fri, 30 Jan 2026 03:31:22 -0800 (PST)
X-Received: by 2002:a05:620a:19a7:b0:8be:6733:92b1 with SMTP id af79cd13be357-8c9eb139c25mr285184285a.0.1769772682114;
        Fri, 30 Jan 2026 03:31:22 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbefc5ddbsm411998066b.18.2026.01.30.03.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 03:31:21 -0800 (PST)
Message-ID: <d85fd35f-6562-4e45-999d-87a8cfbb4a51@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 12:31:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: support for empty endpoint
 nodes
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Richard Acayan <mailingradian@gmail.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251230022759.9449-1-mailingradian@gmail.com>
 <1fa74da9-bd3e-43c6-afbc-8cfcbb93af93@linaro.org> <aVSSNGCtvcYCTylu@rdacayan>
 <8a0083a8-cc5f-4f08-ac8e-7a4516e0de54@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8a0083a8-cc5f-4f08-ac8e-7a4516e0de54@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5aWe35xwuGj7WrihndzRYO5v5XS-kLy1
X-Proofpoint-GUID: 5aWe35xwuGj7WrihndzRYO5v5XS-kLy1
X-Authority-Analysis: v=2.4 cv=VMTQXtPX c=1 sm=1 tr=0 ts=697c968b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=6oHZTzlp9KLPi9rkgowA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA5MyBTYWx0ZWRfX6SuN44t7Df/y
 NIhk65r0bY7ZaQwEjCkREX+yF41Cj95UHUUfmmH3VoAn+EdpCEWQTE0O9bjI6vkukAaaFYwtok0
 u1rBZmXCVU9lChldaw+gomrQThp0JmzIeDHY9coCadiWwHRBXGbeCZ/jiGObMerLjmdW6pTAb8+
 3cJcqAB+din+Nqy+iI3J3iMQPSxDnaiKDRT2ZqjZh4V1ThaQB0jXFwdpo4rWuUlhcDeGD46voS2
 MC4X8Un1saitPeka9q2K6WZqVbqdbobeZ1Mwdh387ltkNMGBlZEA82I5DvNJwGE80oAttH7RiuD
 f0Zr9nKjFbuiOr8bgW/JfTut7PvLxtqTwmMIQRkeGKtpCchLXN4M4oIUyyxxUAInCfUP1XuVmyy
 c1hXPkN1F8816SfTa9My8aWpTJBynM11B65+G5l7rtzHA4WTllbB2tSZ0/rCw4mnDtZIsDzGnEK
 TXU6AUJnVw9tX3P4o2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-51820-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2B8E0BA18B
X-Rspamd-Action: no action

On 12/31/25 9:34 AM, Vladimir Zapolskiy wrote:
> On 12/31/25 05:02, Richard Acayan wrote:
>> On Tue, Dec 30, 2025 at 10:18:39AM +0200, Vladimir Zapolskiy wrote:
>>> On 12/30/25 04:27, Richard Acayan wrote:
>>>> This series adds support for empty endpoint nodes. It is currently RFC
>>>> because it continues an ongoing discussion on how to selectively connect
>>>> some CAMSS ports to cameras and leave others disconnected.
>>>>
>>>> The SDM670 patches are for a full example. If agreed on, this should
>>>> expand to SoCs that have CAMSS.
>>>>
>>>> Example SoC dtsi:
>>>>
>>>>     camss: isp@00000000 {
>>>>         ...
>>>>
>>>>         status = "disabled";
>>>>
>>>>         ports {
>>>>             #address-cells = <1>;
>>>>             #size-cells = <0>;
>>>>
>>>>             port@0 {
>>>>                 reg = <0>;
>>>>
>>>>                 camss_endpoint0: endpoint {
>>>>                 };
>>>>             };
>>>
>>> I do not see this device tree node layout as a valid one. A 'port' provides
>>> an interface description (an option), and an 'endpoint' declares a connection
>>> over a port (the accepted option).
>>>
>>>  From dtschema/schemas/graph.yaml:
>>>
>>>      Each port node contains an 'endpoint' subnode for each remote device port
>>>      connected to this port.
>>>
>>> This is violated in the example given by you above, when a remote device along
>>> with its ports is just missing, thus there is no connection. A forced alternative
>>> reading may (or will) break the legacy, so in this particular case you shall
>>> start from making a change to the shared graph.yaml documentation, since it's
>>> all not about CAMSS or even linux-media specifics.
>>
>> So, if endpoints MUST/SHALL (in IETF RFC 2119 terms) have a remote, then
>> would it be acceptable to label the ports instead, so a board DTS can
>> specify its own fully connected endpoint(s) under the port labels?

I don't know if they MUST, but it IS convenient from the maintainer
perspective since it generally lets people make less mistakes and reduces
copypasta..

We've successfully used this ""model"" for Qualcomm display nodes, as well as
(both non-/Qualcomm) USB-C graphs

> It could be done. For the record, the solution is not to "label the ports
> instead", but the preliminary added endpoints should be gone, and it implies
> that the labels to the endpoints are gone also.
> 
>>
>> The labels to ports aren't looking as "excessive"[1] as they used to be.
>> Is the original review comment on port labels still relevant?
>>
>> [1] https://lore.kernel.org/r/565d14e1-1478-4a60-8f70-a76a732cde97@linaro.org
> 
> It's relevant with a modulus of 'likely', it's so secondary that I've issued
> my RB at that time. You can write a proper dt graph layout without using dt
> labels, and since it's expected that you touch &camss anyway to change its
> 'status' property value etc., you may add ports and endpoints under the same
> labelled &camss device tree node at once. There is no rule to use some labels
> no matter what, but technically you may introduce port labels and add endpoints
> by a port label, this approach is practically found e.g. with Rockchip or
> TI ISP device tree nodes.

Referring to nodes through labels is generally agreed to be the best-practice
given it's the only way that ensures at compile-time that the referenced node
actually exists.

At the end of the day, this is essentially syntax sugar. What we put in the
DT must be somehow interpretable by the OS, and it just so happens that this
doesn't really introduce much complexity while having the aforementioned
benefits

Konrad

