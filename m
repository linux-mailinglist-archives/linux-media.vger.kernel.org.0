Return-Path: <linux-media+bounces-42641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 727DBB7D2D4
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 14:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C04F91C02A24
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 06:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A67E529ACD1;
	Wed, 17 Sep 2025 06:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iw+1ptZy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B4F248861;
	Wed, 17 Sep 2025 06:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758090186; cv=none; b=k5GECTOtt2o7hBES6f38VK/ralsA0wgb6fpAx9bkEdL6gT+ybI1YqTozS5o0y2sMB0oDilSMoqiuqQnoZGKgxLrBrri4MIljBAoMPruqcDeeD+eXiUUbF7ACgVXMLvHok3sKTPXxDE9FBhqeXi/0DA9vyF35GaZEWWktuxOmrhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758090186; c=relaxed/simple;
	bh=Rs+c/vVPVxFus14/jicS7KV9PWjsmmv1oIivk8MfMiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HQgMrNVSjyOVeZ7/zhKExdLnLmg4Uq8QOHZ0QGVZem3Zo2BsqjLyCLL3quoIwPjecYLtOhHBa81b414AtKb+NzQpaLKCfquydel6q1Ymq7ull1uJZq6MdCEFfXj+rZLOS0eqybogSJatbOYWcFuZ5BThz8EQVjSbuhZ5rzm9iw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iw+1ptZy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H5QV1W016245;
	Wed, 17 Sep 2025 06:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PV0bRllSrJgBYJQjnvZ+Phhssn54H7w1TTU3TTjh7Xs=; b=iw+1ptZypZp9LXdY
	0B19SrICsTgc2Y3+xHOSTHq53fi8Gcvv8P+pP/GaBcsABKVnDsy6t2ALUj4ZHprt
	p1xfqT3k8O7yPhpL/vvyaLV38lg49F75QUSNcA3/Q23KgE+GUl0CWYiCZIksE46X
	sT+zjt9UCrmWtVJnUyUH7dqwkigiNC65AegLLObDGIh7rl5W/11xorgzQocURlS1
	weYEJ7q3athlaCEQe02jbIxCOlL3/1msS76O/vARuMdC3Lgp6c/3LGmXhfpWpkK0
	87+TZ6qxsQ7tGSX6ZaeP0QMEqmBid77lzBXQMZ38/5nZcDFXn7+R2/WBz35fET5B
	aiRdow==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxh5ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 06:22:51 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58H6MowZ018092
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 06:22:50 GMT
Received: from [10.206.103.106] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 16 Sep
 2025 23:22:44 -0700
Message-ID: <fd075b5f-3766-474a-bffe-c1c402cfca81@quicinc.com>
Date: Wed, 17 Sep 2025 11:52:41 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: qcom-cci: Document qcs8300
 compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring
	<robh@kernel.org>,
        Vikram Sharma <quic_vikramsa@quicinc.com>
CC: <vladimir.zapolskiy@linaro.org>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Ravi Shankar <quic_rshankar@quicinc.com>
References: <20250912141134.2799078-1-quic_vikramsa@quicinc.com>
 <20250912141134.2799078-2-quic_vikramsa@quicinc.com>
 <20250916024858.GA3574831-robh@kernel.org>
 <373bbb78-2b0c-446c-be97-53b82edeed64@quicinc.com>
 <49d6c554-e6ed-4c86-8946-be2cdba659d0@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
In-Reply-To: <49d6c554-e6ed-4c86-8946-be2cdba659d0@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX8nXMPL614Yff
 lsRzdA57d3IrdbVicft0uc9b7mhS6zrbvgZIvjDiWMkM8RaTHeV76GETDi+V9PLZh1ecqHOHfRg
 GLatwjNwStxqvhwOTss9jCwuZlZJ+9LaufJ1mzfW6paR3Dl2JqxCnSSa7mCEM0+Y6geghZNY+i7
 a3Ssv6Ln/sLYUkuRCqFK5VQlIwKGYHPPXwftlc1j74gb5pc4XnPh9o3Vo1Rx6sxyH1WHgEBlKWt
 4+TJbKiu3ilXD1fhkEZ31OUG3WdG51xfJE2hyXSj03oHbk6cjGsjviW9L/LSvFMj7M7PqwT7Z45
 zhOlWGtZIU+D5C83S6YDQJSSxDMG0bUqb5tesntilGjbY+V8PTdJ1PMOS7QTZOvxZau9mUmbnUZ
 6/+3y0AO
X-Authority-Analysis: v=2.4 cv=MMFgmNZl c=1 sm=1 tr=0 ts=68ca53bc cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=XobKNSAVkuln2dIsCLwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: -YWeYURqnfd2valzalzR04FJDFsdegub
X-Proofpoint-GUID: -YWeYURqnfd2valzalzR04FJDFsdegub
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202



On 16-09-2025 16:41, Konrad Dybcio wrote:
>>> Wrap commit messages at 72 chars. And explain how it's the same or 
>>> different from existing SoCs in the commit message. Don't explain the 
>>> diff. We can read that ourselves.
>>>
>> SA8775P(Lemans) has 4 CCIs, while QCS8300 (Monaco) has 3 CCI, with the 
>> only difference being the GPIOs used for SDA/SCL pins.
>>
>> Currently, the CCI driver probe happens through the "qcom,msm8996-cci" 
>> compatible string. Could we use the existing SA8775P compatible string
>> "qcom,sa8775p-cci" or we should remove it? 
>>
>> Please advise on the preferred approach for upstream compliance.
> Try:
> 
> """
> The three instances of CCI found on the QCS8300 are functionally
> the same as on a number of existing Qualcomm SoCs.
> 
> Introduce a new SoC-specific compatible, with a common fallback.
> """
> 

ACK, Will address this in next version.
> Konrad


