Return-Path: <linux-media+bounces-51965-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CH9eOGdcgGlj7AIAu9opvQ
	(envelope-from <linux-media+bounces-51965-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 09:12:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7AAC98E0
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 09:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C05EB3025F56
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 08:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1732A311C1B;
	Mon,  2 Feb 2026 08:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ekB0z7x0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LGEgOJAx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A633101A5
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 08:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770019681; cv=none; b=WUV9SQKbDjVQ64BDrGP1A0ixiQ2K7Me3Kvzk2/738Y63BPTMK/uwTfjghBB4Uy/knW2UbYkNcR2wBplYJ8NEmXHFt+YN+1XMkqJaDy5uem1qx8LElrQNVWYjAAxPE0aIonD5iN6sgeB/c/ceehEmHCtvXOv5uhBmYuj7T7ZinAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770019681; c=relaxed/simple;
	bh=e5UiulWzCpaboMvckiModZJV708yrENsmfOIZvdK54s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o/T+EBr28VCfMd2wKV5E4fetKbP95KsvyZx2DZyhty1jQuftoG9vDB8/Fcv3UiaksPQIZz/rXz4tBghPCsDzDpv19nEzlHWcYdEssnuq0722jjn7CIYheChxH9AzdyfeHspvb70GyBM47CTHDWzJr7UIwxPL0RqywSdJeNICEmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekB0z7x0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LGEgOJAx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6127MIuf023076
	for <linux-media@vger.kernel.org>; Mon, 2 Feb 2026 08:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5q11L4BQa7xe0Hjz/HSun8Va0jvfPXvUtsh17UGLK2c=; b=ekB0z7x0h4AZNP7G
	A+JnxbuZZxqMncceUe+4sl1yG/kRQZRUvlHm2Tz3ovW0pvXedn6pVXfDzhJEI+te
	QM6vWk55TZvHtXgkRIJ/nQO4zjIX/31NKN/lmsMTywNojcz2ZomG1BF+iRrnGnZz
	0zoC+dRjSU8jlVEvBgScsmA+VX6ok3wjAiMdq4HgB27Q/rOvEeQ0z+nzBorQRtNi
	3cCEuJd/1CjXEAmqOnKlnwT2hyEwVKqF9Kz/acUnaPjAYYGB8M8gpdLwOI3PyWsW
	daF3cl+KBOpNGDMj4Md3hNGtBTjgMxgDBWIoF4wpXdGg2B64bIftGMd0bhVXi5XK
	d0YC8w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avx4h6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 08:07:58 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82371886e58so1967358b3a.1
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 00:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770019678; x=1770624478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5q11L4BQa7xe0Hjz/HSun8Va0jvfPXvUtsh17UGLK2c=;
        b=LGEgOJAxstQxFDfJ9i+YRTJ8yNT8R5+u+d+g2+irBnZF6ds+/Vsk1rKsKvNdqvkabF
         fQ5/GNx23vjurAE/KMY00Q2wztoLwfCS6sSfFO6aVBW6ic2xJq0MjetJGdtPyf/d09o/
         pkevt4GtNfoisaC43ZqNj6PidV9REkHPi04SLN62ewa7CCqbyJe7UGHt/LttBS7AJik2
         4pYKK0it3dY7WC6PEivL0Za0XWJX/2zkxSK5e+KrL1EUGj98zr+ZyDHJi7X+5KFTgbmy
         /k2mKfWmGXlLF/E3pMFe8KBSJPdIGMVCvBrahUYh1JzvnkOmAkv3MCyw/nd+DtuglznR
         9zzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770019678; x=1770624478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5q11L4BQa7xe0Hjz/HSun8Va0jvfPXvUtsh17UGLK2c=;
        b=dMxJxfKkllzTZjJjzEE1M0c4pc+fXBmAleqVReCMYxiyBGLEEAdZMCKxH6uHWbfI/M
         uN0utLcTVuLp53pUNi6xdXC6LcVyGh9C8TsQR0ASOIBtWytAkOgj/dpDj9VcJUbNUKYg
         /Ao5OS9gEiCx/0sNTHRCQjVf4B12XcUDtwNqwm5uaBQxK0yHEbD7thnOGKDUJS1EahQN
         EWSzNVzRUmvRZgvmc8BlPeIkCVnGvomNL4EcSdzrB/c42qWjdZKSeXC/1F/+K1z6U1hR
         HPbQzTdTJ7aKkXywb4Txd4G8YZWmn9EFcG8ciXI/IeZczIQqsa2is54NxSaXzxAs6wer
         vI2A==
X-Forwarded-Encrypted: i=1; AJvYcCVWjFIkl02i5wRauHl98VhfUqX0M1j7llwKNtKeSnjUEKKah41LgPzr6UbVMeDFlHrAufXfS4tGOv0qQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIukZBZHt3j1cAAc1GGvJRPoFqPgzygrS6NmOpx7KpKHv9H/YU
	HtpmiiJwBERZz4qmf7SUoU5HyERoRNGCW4dRsoDG78IAkL5C/76iX2/tjZ/oXnTGqxZFnaKaPBt
	QuhBrpIy6b73D1afq7ZEgQD78JDdHNxZujhxwZehybigEajpMpz7XufDN2Cm7ZJdkig==
X-Gm-Gg: AZuq6aInJh0WiDH3KF676mfgPfiPr3KtyNAXjhNJMii6ihxYS6LOE0Gt4AxJBaCFj7y
	G+CcSRnsn29K0k4CgXGlZo3mZBw89reAeJBuC2Qu74HU5MIzioDxn5eOuwJYuC9X1PQuAx3dk12
	42TvSIHNmLhcSChCtMHojuc0qJTSHVgZNBrnbqC6IqXPgkHPNfonJ9ZcnnGkZL9dpC8Lj46T8pd
	W/PJWEjZe0JyP4zZKydFvULivILgR2nwHvbnd/6b2f68kxEtcdNBJdgTjnYNxNwqMBPuqAyrB2+
	wBzSGwaIPw2ZsklL+heSr9pauwkGZ0OjMzSlpxWjE/4dF+v45Wnzoxqp1i8Gd09+Mg6pP8JIa5O
	ut8cHq2fvoOT3+rPJtB9femRymraJ27Y3ENljJppf9cxn
X-Received: by 2002:a05:6a00:9288:b0:823:ef8:5ce0 with SMTP id d2e1a72fcca58-823ab65bb2amr11704839b3a.13.1770019677802;
        Mon, 02 Feb 2026 00:07:57 -0800 (PST)
X-Received: by 2002:a05:6a00:9288:b0:823:ef8:5ce0 with SMTP id d2e1a72fcca58-823ab65bb2amr11704800b3a.13.1770019677275;
        Mon, 02 Feb 2026 00:07:57 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c53f6bsm18084171b3a.63.2026.02.02.00.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 00:07:56 -0800 (PST)
Message-ID: <9831d703-8427-31af-48c7-3942108b3a55@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 13:37:50 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/7] media: dt-bindings: Document SC8280XP/SM8350 Venus
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-1-d21861a9ea33@oss.qualcomm.com>
 <3d99e35d-1aef-5e04-55c8-628918e29da4@oss.qualcomm.com>
 <g2ft7zu7mabl63hggbyyfkhntvkmsqjvtu43r2c35ycgrghxgs@53m33fj3b2ft>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <g2ft7zu7mabl63hggbyyfkhntvkmsqjvtu43r2c35ycgrghxgs@53m33fj3b2ft>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cMUBu9znQRG-t5bvWhwy0YkP-cDyDIBA
X-Proofpoint-GUID: cMUBu9znQRG-t5bvWhwy0YkP-cDyDIBA
X-Authority-Analysis: v=2.4 cv=P4w3RyAu c=1 sm=1 tr=0 ts=69805b5e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=9QtVEiAcijqVnSbVjO0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA2OSBTYWx0ZWRfXxjFRW7WGw8FR
 LJYIFl4y3xZCQsLXb560tCgyQPqI18YLm2cZnHyvtQJdKKjdvF862/XlDl5wS2n0Sudd0vHiK0x
 x+qsR+4bOHtaK8djxnJBDw4DxnA+QqC+ZtiRX2d4bW/O538IZLSu+9DdAZmOMrnbNVnTNgCoWhX
 ggIT9wF1sDZIO/Omdf/bHHL8Spfv+QlRDMWtvoH4+6PqRaNSXvrtaxBoNOlWHV6Tc/hT8+BPXDz
 DYLBhZCaxchtDBVusj4YJsXFUkTTu4g2BpMLxYfDchnkkvh2Ag3ZryZXfgG61GOCTUcSGAqM3jg
 U9mrskXkM6Jt/LL2zYXfHR5V6DwaLyWzKyQwcalhdDfNYQl+fZJc1pMoy+ApY6eL0L9C80Tofpm
 PKAfqY5aF9e8do32LcDmWN4OTFOCBcn0MOjeshfOp/ujJI7L6bmPO50Lb3E9RX99Ttkgaz5Wysi
 EoB8osN54ROgJ6CtMgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020069
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51965-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aa00000:email,devicetree.org:url,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7F7AAC98E0
X-Rspamd-Action: no action



On 1/31/2026 1:03 PM, Dmitry Baryshkov wrote:
> On Fri, Jan 30, 2026 at 05:59:48PM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 1/25/2026 9:02 PM, Dmitry Baryshkov wrote:
>>> From: Konrad Dybcio <konradybcio@kernel.org>
>>>
>>> Both of these SoCs implement an IRIS2 block, with SC8280XP being able
>>> to clock it a bit higher and  with SM8350 having 4 VPP pipes, while
>>> SC8280XP having just 2.
>>>
>>> Document Iris2 cores found on these SoCs.
>>>
>>> Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
>>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>>> [ bod: dropped dts video-encoder/video-decoder ]
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> [db: dropped status, dropped extra LLCC interconnect]
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>  .../bindings/media/qcom,sm8350-venus.yaml          | 113 +++++++++++++++++++++
>>>  1 file changed, 113 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml
>>> new file mode 100644
>>> index 000000000000..d78bdc08d830
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml
>>> @@ -0,0 +1,113 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm SM8350 Venus video encode and decode accelerators
>>
>> s/Venus/iris
>>
>>> +
>>> +maintainers:
>>> +  - Konrad Dybcio <konradybcio@kernel.org>
>>> +
>>> +description: |
>>> +  The Venus Iris2 IP is a video encode and decode accelerator present
>>> +  on Qualcomm platforms
>>> +
>>> +allOf:
>>> +  - $ref: qcom,venus-common.yaml#
>>
>> Pls remove the reference to venus-common.yaml and follow schema of
>> sm8550-iris.yaml
> 
> Why? For example, sm8750-iris uses venus-common.yaml.

Ack — in that case sm8750‑iris should be aligned as well.
Since Krzysztof’s patch [1] removes all venus-common references from
sm8550‑iris, all *-iris platforms should follow the same convention IMO.

[1]:
https://lore.kernel.org/linux-media/20250823155349.22344-2-krzysztof.kozlowski@linaro.org/

Thanks,
Dikshita
> 
>>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - qcom,sc8280xp-venus
>>> +      - qcom,sm8350-venus
>>> +
>>> +  clocks:
>>> +    maxItems: 3
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: iface
>>> +      - const: core
>>> +      - const: vcodec0_core
>>> +
>>> +  resets:
>>> +    maxItems: 1
>>> +
>>> +  reset-names:
>>> +    items:
>>> +      - const: core
>>
>> It should be named as bus not core
> 
> Ack
> 
>>
>>> +
>>> +  power-domains:
>>> +    maxItems: 3
>>> +
>>> +  power-domain-names:
>>> +    items:
>>> +      - const: venus
>>> +      - const: vcodec0
>>> +      - const: mx
>>> +
>>> +  interconnects:
>>> +    maxItems: 2
>>> +
>>> +  interconnect-names:
>>> +    items:
>>> +      - const: cpu-cfg
>>> +      - const: video-mem
>>> +
>>> +  operating-points-v2: true
>>> +  opp-table:
>>> +    type: object
>>> +
>>> +  iommus:
>>> +    maxItems: 1
>>> +
>>> +required:
>>> +  - compatible
>>> +  - power-domain-names
>>> +  - iommus
>>> +
>>> +unevaluatedProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    #include <dt-bindings/clock/qcom,gcc-sm8350.h>
>>> +    #include <dt-bindings/clock/qcom,sm8350-videocc.h>
>>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>>> +    #include <dt-bindings/interconnect/qcom,sm8350.h>
>>> +    #include <dt-bindings/power/qcom-rpmpd.h>
>>> +
>>> +    venus: video-codec@aa00000 {
>>> +        compatible = "qcom,sm8350-venus";
>>> +        reg = <0x0aa00000 0x100000>;
>>> +        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>>> +
>>> +        clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
>>> +                 <&videocc VIDEO_CC_MVS0C_CLK>,
>>> +                 <&videocc VIDEO_CC_MVS0_CLK>;
>>> +        clock-names = "iface",
>>> +                      "core",
>>> +                      "vcodec0_core";
>>> +
>>> +        resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>>> +        reset-names = "core";
>>
>> s/core/bus following the existing YAML
>>
>> Thanks,
>> Dikshita
>>
>>> +
>>> +        power-domains = <&videocc MVS0C_GDSC>,
>>> +                        <&videocc MVS0_GDSC>,
>>> +                        <&rpmhpd SM8350_MX>;
>>> +        power-domain-names = "venus",
>>> +                             "vcodec0",
>>> +                             "mx";
>>> +
>>> +        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>>> +                         &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>>> +                        <&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
>>> +                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>> +        interconnect-names = "cpu-cfg",
>>> +                             "video-mem";
>>> +
>>> +        operating-points-v2 = <&venus_opp_table>;
>>> +        iommus = <&apps_smmu 0x2100 0x400>;
>>> +        memory-region = <&pil_video_mem>;
>>> +    };
>>>
> 

