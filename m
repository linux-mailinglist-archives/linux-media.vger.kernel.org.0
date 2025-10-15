Return-Path: <linux-media+bounces-44502-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1B5BDC52F
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 05:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 06DAD4F9824
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 03:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E392728A3F2;
	Wed, 15 Oct 2025 03:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iZAg+JuE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8632641FB
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 03:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760498476; cv=none; b=K1cX9sVlF/rfhio2tS60cp5Mx60O4yH3YV+uLzOb2QlkYonmpMRCDZIAsW2BZIqdtMKNZGsuPFXOu7/O6xLkllHLuQ8iiwCHcmn+p4K3ZEqdXr5b9EY3gumSveq5jUj4s0mVCJRrrCg80y3QNBtlOYaO710mNok7tQf1O9bRI0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760498476; c=relaxed/simple;
	bh=M2p1ZN+5Xjl1QG9++mRp4SlbLr6IXjEbwxJhvs6kBUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eHupv5Y5mPL8NewbmeOP+IaLcwcc3LJmYmdOPTwge3fEHzUY2pksMshRNkZ6qKkn9p1pTJdOL3SvHeTkkhQeSbMoihS6+EyGcdE69Q32ChhfoPFFLzJE6ukuEPBzlD2sJriQPLw7U4IcWQLUy/Ykg+hBPII0HCfuBx7ENi677WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iZAg+JuE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sMXM015153
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 03:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PAzWDXrNmyO6DLAmky6NWm+cn7OHuxBHBUdw9FN3WzA=; b=iZAg+JuEcr31i5do
	QZZcybSGCQjR9XdhRu+l/PC8hL53X9fW+O0imR5gPqPSAFyGAs0K7uFdSWNyEkgZ
	VPxgbY9mHacJRPRPkRHpO4Ww4pLsM0AkFWELMoOZBZQzup+1a80kksYnUMomvt8A
	jbyVv3bYwCFtQIr1pn0QhhBct77+I+aGnWAuJcSM4x011kfEUyu7GiU32BWYV+sN
	ChATyZ99FYzKjHEJONVeBoDuhDEoMP5/ovXW5gyeSqB7SgCQbLeF8U0FTC4OF+Ju
	2jMc6YfdUzFo/mToNeL83nevcUCNnUBw3Xb6kxQwZuot3bsre25AkYm8EmB38d+0
	QoiynQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbj2whh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 03:21:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2681623f927so103582085ad.0
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 20:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760498472; x=1761103272;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PAzWDXrNmyO6DLAmky6NWm+cn7OHuxBHBUdw9FN3WzA=;
        b=F5axel1oOwrgPUybyy30uU+ESJBU8YLmOaUOlbL2LhYGQOKmugRfaSy9BwRMZGCHOj
         DpwGEQEayjWogs7dWLGlsw+qJK0+drZq0g6/OZPHDTcSvuCYg2A9Ie/A33/q8iqZM3yV
         bY1yYwVhVy0dcBwHtBOL8XavbYcHXSW8rHaczDsxc0/RLOTKgBoRlIsz9q0EGgs2XwiK
         +nGsdD0vGjqdXVbG7ki7Z2wFtFI+aALpGCAPT1MxHvR3JXXcxou7G85N8WIev6zi1olt
         WrsWwthSnJxxtg0jOGNhmHv+GIQ+BaZcqtGV2NrQLETEjlLGG7s0Wx1G3cr9V+nrBDjm
         W5aw==
X-Forwarded-Encrypted: i=1; AJvYcCXhmHKiA3kuVTlABir5OlkLEEoAWLjMO9TkB8piLSRa8PKIKn0vsK3ZxQSACmhIllBaWo7bJtjhwVZTJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCD7Vl1lCWrNF5wuGN6WW93VF/AGrgA6KOdJKFR3oOoS5K7Ygj
	an0Y60QAYFtTTJ5UKkiZ0K6lHLhX0wLjKyqA0iZyMbUA74yNEhjc7UORfVbw3UHl2wJwTbUJvtM
	OmWgqWQf1703oayoEbvfHHlZQocjTAFLJUHKK5Rd09dppLZ0vZ4WvtRofDEv6wpge0w==
X-Gm-Gg: ASbGncsjcs5SnCOPkuwGPQ+LIk+tm0bZxUAIBUxkuoD/1wNT3wkIV9RxqeOA42SQyRn
	cDOKAKAFCbbRtR+n28/QF7yUKvclyPGhmEilEMXZNRYUyN19CgyKSy1NARUoAWAjCKs2QigEe52
	U7Bbo3mn6D5UBgFEL1n9Uro9QmcuqUj1/24OyDr677x2R7UkxCkWa9RNmX0+ckchMj7q8UwK4EO
	i8efCsgaRFm++9pgK+1r05LHrF32QpljFUefn5/xJ1w1s+xc5dF2Ue/GKOWKGfplPT/ybLATMYR
	RiZVvg32gh5RJLSdtTf6fMgmbnheLHndeEopn0LiOB6OEUG7FisdusLrbpb7oVvGXPJUhmTnADo
	pIEQjkngik5IFfGxwLdTbBXhN9dj8HPU4G9xvrEoT23fuxp8DpjnM12rykCse41R7Qmi8Jw==
X-Received: by 2002:a17:903:2a87:b0:269:aba0:f0a7 with SMTP id d9443c01a7336-29027212f47mr365377095ad.2.1760498472007;
        Tue, 14 Oct 2025 20:21:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdNWBjKeLeNUS4h2lLtfgUKsI8vFvc2mvlgVV7+FZSuN0cdYp1EPr8L0atoBEmT9D3LRygxg==
X-Received: by 2002:a17:903:2a87:b0:269:aba0:f0a7 with SMTP id d9443c01a7336-29027212f47mr365376635ad.2.1760498471529;
        Tue, 14 Oct 2025 20:21:11 -0700 (PDT)
Received: from [10.133.33.56] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e1cbadsm179489675ad.33.2025.10.14.20.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 20:21:11 -0700 (PDT)
Message-ID: <a7be3a42-bd4f-46dc-b6de-2b0c0320cb0d@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 11:21:05 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: media: camss: Add qcom,kaanapali-camss
 binding
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
 <20250924-knp-cam-v1-2-b72d6deea054@oss.qualcomm.com>
 <CAFEp6-1o11B9o3HjdJY-xQhDXquOTknXo0JeW=HfpTxXcEaK3g@mail.gmail.com>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <CAFEp6-1o11B9o3HjdJY-xQhDXquOTknXo0JeW=HfpTxXcEaK3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX1vks4Wsd88/a
 bVLyzACKiCTCjVyqAyhL3jnjfAgBVSyRXa5XVxPJ+QAWjV0fC0nnhI69EgDIF7hEvhI7h5uEoG8
 RyZ8JmD2dGlKuTdRWTEaL9hRmTsh3BbBSyDA3EIHFiu7ygk3Z5dZIx4bywRUQKzdTCGBPUHQosb
 Aieit4DzH+DwMgUwUQCcAxe2H1989tur/O2b85JcNDbnDlhnmWPPWDSY/GdVmgf9LdorA7INEaQ
 S1K7xRYuoAsIzu2NJceV7mPOABvNoXPV64ZJJRisr1kL4oHLdMbzrVUtndvNgLNvZ0fJGoAsh2K
 avtg49QNBz0x2dqHpGdvWL6e2661nUVpAR+iHgQC5wx3W3ttdp7FTWMApsvAC2n50ZuOtmVfujB
 HXJgip9XMtDvGtkHKqpgwKfqgcWi+Q==
X-Proofpoint-ORIG-GUID: O8hub9JMau-MqSByvA9JTXVw8aNTf0bu
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ef1329 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=ww7spySswV7EKFqp46gA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: O8hub9JMau-MqSByvA9JTXVw8aNTf0bu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

On 10/7/2025 4:04 AM, Loic Poulain wrote:

> Hi folks,
>
> On Thu, Sep 25, 2025 at 2:03 AM Jingyi Wang
> <jingyi.wang@oss.qualcomm.com> wrote:
>> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>
>> Add bindings for qcom,kaanapali-camss in order to support the camera
>> subsystem for Kaanapali.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,kaanapali-camss.yaml       | 494 +++++++++++++++++++++
>>   1 file changed, 494 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>> new file mode 100644
>> index 000000000000..ed0fe6774700
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>> @@ -0,0 +1,494 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
>> +
>> +maintainers:
>> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> +
>> +description:
>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,kaanapali-camss
>> +
>> +  reg:
>> +    maxItems: 16
>> +
>> +  reg-names:
>> +    items:
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid2
>> +      - const: csid_lite0
>> +      - const: csid_lite1
>> +      - const: csiphy0
>> +      - const: csiphy1
>> +      - const: csiphy2
>> +      - const: csiphy3
>> +      - const: csiphy4
>> +      - const: csiphy5
>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe2
>> +      - const: vfe_lite0
>> +      - const: vfe_lite1
> Wouldn't it make sense to simplify this and have different camss nodes
> for the 'main' and 'lite' paths?
>
> [...]
No such plan till now. Other series may take this into consideration.

