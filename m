Return-Path: <linux-media+bounces-17809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF1896F948
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 18:29:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AA7A2812F2
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 16:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49AB1D417D;
	Fri,  6 Sep 2024 16:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K/HfAobu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D431D365D;
	Fri,  6 Sep 2024 16:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725640164; cv=none; b=gPCfwEsSA14WX78FL4nuyt15zEplBfxH1WzznMFOGw9SkgbxFMDPv8HeeawiQy6ITfGZVyTijhbiGCjHIdye0avpxGWnDM4Xlxi2V+leMRMeY5VPiVW2uMRFN0dgN1yh/EJzxep0CLJonPQq3xVGpIekwOJuXUAb0QP/gq/mLlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725640164; c=relaxed/simple;
	bh=tgrMaFjyIw7IX4ux4Go/30dmOzrurB83EDc3BdqbTWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cgGRTC6b8Rj4rEf4NK9+xUZDNSPR+E9pB27K27xYG+LTmNpYgNCuvT9aApEDhATBU4Z322AkR66/mmlMYhmJCTmWJGekr41wlhbSNd/eW8EPrbNmHJ4Wj7Kc7Dl7MOMrOBlZp/svkRmMALcJJYxWP0Yx0t+kb2k141GProCkf/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K/HfAobu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 486A6r6h000495;
	Fri, 6 Sep 2024 16:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	STIBMfriypcCxXo3heZSjYUYtLO2sq/904jtEBjYL94=; b=K/HfAobuD/JGCKa6
	/dn0yLWNxeeVrmechsayQm/rLcAVEsKrjDFhoNJBWM6Gk9Jtsh/phbJwEYZs9w97
	3qSguVn7mWss9BMnlhuuvnp9WBqrGi42fnmfCFY5lkouQjTDLgV3tpb8Pmr4IOC3
	NBOUWK6CmbpyR2Acj942/3HpkGvPGbhKax+SxZEotIx+LfbY1cgWHL3xiBTAqfzk
	BdAdMdeofLlJifnGr/3dleyRbfvXUwiW07k8VbETj/YERu+4xr3WMsMxTP7OdQFd
	TztBrQ5SBq0D3xqBYuqmcwjUAIBrXXE+IoNp6pwcjMp4SS8feFdhSMQhJHCykw0A
	3xY1aQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fj09tvra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 16:29:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 486GTDwW011734
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Sep 2024 16:29:13 GMT
Received: from [10.110.36.55] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Sep 2024
 09:29:12 -0700
Message-ID: <4c5a5d30-5ee0-4d5e-ab9f-a0277fe8796a@quicinc.com>
Date: Fri, 6 Sep 2024 09:28:54 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/29] Qualcomm iris video decoder driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>
CC: <quic_dikshita@quicinc.com>, Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Vedang Nagar <quic_vnagar@quicinc.com>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <3a62b4cb-5c41-4c76-a957-af8e594ca8b1@linaro.org>
 <xwkibtfakensuzrj4ycmyh4nqjr4nwkgqr63og7n6ejiw3hjqo@rvl3hhznfftx>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <xwkibtfakensuzrj4ycmyh4nqjr4nwkgqr63og7n6ejiw3hjqo@rvl3hhznfftx>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IaXLEYkoPVi3LhOmDIfgZyGFEDeoaD6Q
X-Proofpoint-ORIG-GUID: IaXLEYkoPVi3LhOmDIfgZyGFEDeoaD6Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_03,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=946
 impostorscore=0 malwarescore=0 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409060120



On 9/1/2024 5:02 PM, Dmitry Baryshkov wrote:
> On Sat, Aug 31, 2024 at 04:18:35PM GMT, Bryan O'Donoghue wrote:
>>> The result of v4l2-compliance test on SM8250:
>>>
>>> v4l2-compliance 1.29.0-5239, 64 bits, 64-bit time_t
>>> v4l2-compliance SHA: a1ebb4dad512 2024-08-08 20:00:17
>>>
>>> Compliance test for iris_driver device /dev/video0:
>>>
>>> Driver Info:
>>>           Driver name      : iris_driver
>>>           Card type        : iris_decoder
>>
>> Hmm, so this is decoder only ?
>>
>> What's the intention here for encoding support ?
>>
>> I've verified your results on the test branch but I just noticed that sm8250
>> with the iris driver is decoder only - whereas the venus driver does both,
>> which strikes me as a bit odd.
> 
> I think we all have discussed this during the review of the previous
> series: complete driver becomes very huge and complicated to review. So
> the recommendation was to submit the limited features driver (decoding,
> 1 codec) and get more features (more codecs, encoding support, etc)
> after getting the Iris driver in. Of course sm8250 support in Venus
> driver will stay in until Iris driver reaches feature parity.
> 

Ack and +1 to this.

Lets first review and conclude on the driver with the limited feature 
set and incrementally build the driver to be feature compatible with 
venus as we had agreed upon earlier.

>>
>> Is your intention to publish more patches to enable the encoder in another
>> series ?
>>
>> ---
>> bod
> 

