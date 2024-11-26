Return-Path: <linux-media+bounces-22072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D549D94B1
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 10:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 827922828DC
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 09:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9DDF1BD507;
	Tue, 26 Nov 2024 09:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MuNiPXT0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB681B0F26;
	Tue, 26 Nov 2024 09:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732613967; cv=none; b=q+lbxG1ehKfnaFcbc1pMtcsah6eOBWnvO8GFB6x3DbGLqYFwE9jupAyPSnDbezUkchUODZDKwfPTg0eph5OHoEdY1IRnevJmZazwnKQwpamkA+7JKdyempSbWdQXH6LADOzMNraIuoMt8Zb7jqvvmpVtle48qUL4iFPDUEJNEGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732613967; c=relaxed/simple;
	bh=r+oYFhQDu206kh8rtpczYlIqikTcn2nqOwmDgEWMDZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fIkFjHHf4SNkq+lar9Fem2sHYFeqhX8W2OnaCB5iDjbm0+yvp0ENoNU+iLWEF3VMb3/xCa4k8uA8oxxA0R3VQ9imnb7/PdeUx028E/KnL664RIli9dz58J1UfljlFIyafn8tEWPV6xDNr42+6QjtVPWo3Ox9VaXx/AaYCJ2TcrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MuNiPXT0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ99pdh028937;
	Tue, 26 Nov 2024 09:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G02s6ZvHBVRG3S+Aqq0TT6fCgdbpyTvJwDs0wiqPkZE=; b=MuNiPXT0SEZs0O59
	WK4owFc9yvf/uEAtIEkEvnlKLCU32b7LfXigMT6CWlfj01cPPM56S8UXN59K92ll
	POPiTpz9wMmFldVRKmAMQCeQ1peQxcu/SlubnmIp1HwajEozNy2avE2+S41H5IhG
	uArWnTt3uw2eeZQqz3lBsQNYFzFKBkZF4qqviMYfTet98/2n45Wet+4ezgXp/hk/
	ZPeTDe/x6YVrwQykC0iysRNolt6T4okSNoV3036JwWR0OByWJvAKTQPEMtuZCB+a
	u9GGfPebhxZL+FhUORLKmJ7Vi8g2DM1DBdXoVS2wmpq28aS68DQZOTHzD347BHPS
	jEc5MA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435bf5g2t5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 09:39:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AQ9dLe2018007
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 09:39:21 GMT
Received: from [10.231.216.103] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 26 Nov
 2024 01:39:17 -0800
Message-ID: <729add5f-1478-4b0e-84a1-3e33f153d58b@quicinc.com>
Date: Tue, 26 Nov 2024 17:39:14 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: qcom,qcs615-venus: add support for
 video hardware
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        "Vikash Garodia (QUIC)"
	<quic_vgarodia@quicinc.com>,
        "bryan.odonoghue@linaro.org"
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        <quic_qiweil@quicinc.com>
References: <20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com>
 <20241125-add-venus-for-qcs615-v3-1-5a376b97a68e@quicinc.com>
 <jovwobfcbc344eqrcgxeaxlz2mzgolxqaldvxzmvp5p3rxj3se@fudhzbx5hf2e>
 <18cc654b4377463e8783de0b4659a27d@quicinc.com>
 <474cef98-4644-4838-b07c-950ad7515b73@kernel.org>
 <8c60696c-df14-4300-8a92-59eb134a96d2@quicinc.com>
 <b2729bde-a12c-4662-897b-18bbea66d2f6@kernel.org>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <b2729bde-a12c-4662-897b-18bbea66d2f6@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _i6MVz5Du2hP-4CJrfTyFxb9vzOSRepH
X-Proofpoint-GUID: _i6MVz5Du2hP-4CJrfTyFxb9vzOSRepH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=947 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411260076


On 11/26/2024 2:42 PM, Krzysztof Kozlowski wrote:
> On 26/11/2024 07:07, Renjiang Han wrote:
>> On 11/25/2024 11:55 PM, Krzysztof Kozlowski wrote:
>>> On 25/11/2024 16:49, Renjiang Han (QUIC) wrote:
>>>>>> +  video-decoder:
>>>>>> +    type: object
>>>>>> +
>>>>>> +    additionalProperties: false
>>>>>> +
>>>>>> +    properties:
>>>>>> +      compatible:
>>>>>> +        const: venus-decoder
>>>>>> +
>>>>>> +    required:
>>>>>> +      - compatible
>>>>>> +
>>>>>> +  video-encoder:
>>>>>> +    type: object
>>>>> Both nodes are useless - no resources here, nothing to control.
>>>>> Do not add nodes just to instantiate Linux drivers. Drop them.
>>>> Do you mean I should remove video-decoder and video-encoder from here?
>>> Yes, that's my suggestion.
>>>
>>>> If so, do I also need to remove these two nodes from the dtsi file and add
>>> Yes
>>>
>>>> them in the qcs615-ride.dts file?
>>> Well, no, how would it pass dtbs_check?
>>>
>>> Don't add nodes purely for Linux driver instantiation.
>> OK, I got it. I'll update like this. If video-decoder and video-encoder are
>>
>> removed from dtsi file and not added to qcs615-ride.dts file, then the
>>
>> video decoder and encoder functions will not be available on the qcs615
>>
>> platform. So I think these two nodes should be added to the
>>
>> qcs615-ride.dts file to ensure that the qcs615 platform can enable the
>>
>> video decoder and encoder functions.
> You just repeated the same sentences. Address my comment instead - empty
> device nodes should not be used just to instantiate Linux device drivers.

Thanks for your reply. I agree with your comment. The two nodes 
video-decoder and

video-encoder should not be placed in the devicetree. But this is 
affected by the venus

driver. On the old platform, some only need to enable the video-decoder 
function or

only enable the video-encoder function. So these two nodes were added to the

devicetree at that time. For new platforms, the iris driver will be used 
in the future,

and this situation will not occur.

> Best regards,
> Krzysztof

-- 
Best Regards,
Renjiang


