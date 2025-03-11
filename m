Return-Path: <linux-media+bounces-28061-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5BAA5CF27
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 20:20:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1B23178EEA
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 19:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2C82641C0;
	Tue, 11 Mar 2025 19:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JmJ4pQPs"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D55B1F03F2;
	Tue, 11 Mar 2025 19:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741720793; cv=none; b=XFiKiMnjadeEnXG8lfRzYqFHLfkxoar4gbyM4Sk8CXH6QbcZd0150SfkvL4nE6DPuaxn0iWh7hjP3GFIOVF5fafFqWCuZ1IAufU3wGXsXpBXwXd8pnNAtv42JBZmjArNpFnUG6MRUrB5syZSbDQeZeq3QkhYCCuSG728qJtEd7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741720793; c=relaxed/simple;
	bh=2LCiy4lFtFm1TsLHV4lPWQ9w3NrS4s9HWA9Rz74dfj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KFDx0xuv0lX/wM8kb9MLep25yLI5H/RLRASBbg1dF4HWVT2jXwMLx1jwNLw0Ltt8F0x5YhuSsAlcdomf/Uy2QawEkQIN5iFVkYQIVG7yoeyA9OwndlgmVdMdeAv1p+d27x226yrxohS5S336Mg44FmyVuC+o5ojSfruvJMQHHbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JmJ4pQPs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BJ8ZHe017734;
	Tue, 11 Mar 2025 19:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cOhWVdEMxYHFBSFUIiBHuYp/vQkdKu4vEMS65xaXcL8=; b=JmJ4pQPshJW651tO
	UZvTCFtA2KHcr7OPjqnPp5JIctaSk3ezU/IG/TNQAbL7H/lgLb1juJcvLtV9eem3
	TMjDLZuTTZt/5hWRZjBC3m3QGpADuoWdrwl+5FPskAyWQ8ViPKk0cA3fTESyF/l5
	my/EGgV9lPBOPJionF18iH12CNcQgXhrypEsB1PfLxpa7xzhYZRuYabnFOXeBtj0
	zzXjssSFqFsN09nx2gzQ43toz7mA2dGDCPHbbC1XpXKw+mmQAiCexVfGr4nw3t/f
	RrBAr3GVQE0wnIZy5QNiAaQkyYBI6nQ+hUc4VMOs6DUeAemeBglV3VljQX3cBcPu
	+b/nwg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2nr0up-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 19:19:47 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52BJJjLB005862
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 19:19:45 GMT
Received: from [10.216.38.182] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Mar
 2025 12:19:41 -0700
Message-ID: <203ea0bb-c53c-389e-db12-b41773c0ff5d@quicinc.com>
Date: Wed, 12 Mar 2025 00:49:38 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/4] dt-bindings: media: qcom,sm8550-iris: update power
 domain name
Content-Language: en-US
To: Dmitry Baryshkov <lumag@kernel.org>
CC: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com>
 <20250311-dtbinding-v1-1-5c807d33f7ae@quicinc.com>
 <7yjj2eemvvvnsgv67d7tueid4h3n3onuou6ammx36am4qhfsal@xam3iamk4er3>
 <c0430086-675d-b58c-4ef9-1bd9ee51d3db@quicinc.com>
 <zssjkvxxv7kionartp6f3y2qh3d4i6gwnhwsrklsfad3t4fy3q@jkehbkx6wcyk>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <zssjkvxxv7kionartp6f3y2qh3d4i6gwnhwsrklsfad3t4fy3q@jkehbkx6wcyk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HgxfAPyusGHWxAxQC0V6gT8J8q9kQRrL
X-Authority-Analysis: v=2.4 cv=Q4XS452a c=1 sm=1 tr=0 ts=67d08cd3 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=Ve5_cTlWWX7DCNKN5mYA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: HgxfAPyusGHWxAxQC0V6gT8J8q9kQRrL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 phishscore=0 malwarescore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503110125


On 3/11/2025 9:05 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 11, 2025 at 08:41:01PM +0530, Vikash Garodia wrote:
>>
>> On 3/11/2025 8:37 PM, Dmitry Baryshkov wrote:
>>> On Tue, Mar 11, 2025 at 05:33:53PM +0530, Vikash Garodia wrote:
>>>> Not all platforms has a collapsible mx, so use the more generic naming
>>>> of mx in the binding.
>>>
>>> I guess, it wasn't even tested...
>> Not sure what made you guess so, let me check why my binding checker did not
>> catch the bot reported warning.
> 
> Obvious: you are changing the bindings in a non-backwards compatible
> way, but you are not changing the example in the same file (and
> obviously you are not changing the DTs), which means that this wasn't
> tested.
> 
> Hint: you can use enum [mx, mxc] instead of const. That would make it
> backwards compatible.
Currently there are no user of this binding. Given that either of MX or MXC are
same connection to video hardware, just that one is collapsible, it would be
good to replace the existing element instead of enum.

Regards,
Vikash
> 
>> Regards,
>> Vikash
>>>
>>>>
>>>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>>>> index e424ea84c211f473a799481fd5463a16580187ed..440a0d7cdfe19a1ccedefc207d96b26eed5d6630 100644
>>>> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>>>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>>>> @@ -28,7 +28,7 @@ properties:
>>>>      items:
>>>>        - const: venus
>>>>        - const: vcodec0
>>>> -      - const: mxc
>>>> +      - const: mx
>>>>        - const: mmcx
>>>>  
>>>>    clocks:
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
> 

