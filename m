Return-Path: <linux-media+bounces-17825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D13F296FC24
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 21:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78AC31F25064
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 19:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76BE1D2F51;
	Fri,  6 Sep 2024 19:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KPK1leiM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809671D3634;
	Fri,  6 Sep 2024 19:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725650825; cv=none; b=Vcao8NcvTLPI8lt/wqrl75mbc4jORpJvHrrDCmU0KO3srge6Y/bUo7NflxbasQ5QykQxlv67Xp9N4Ei+jUlFL4D4Sdcd4RW0luvZQWzeQ4YdD5fADiFDJGAVFsnInVJ2r8LYxDoDf5pcPoLRy1h/xWLHxg1zGOLHhjTet6zxsAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725650825; c=relaxed/simple;
	bh=IyGlgoAIgc2nbHZX75Pfi7i2HDK+fbfoW+6w8T3/JmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=D59wwcBnMXGDijODVEh72p1yZC0f9eJwNZ63srWHL1QuWEiLBFab+5Y2bvq5Odw/MrKMkI7KSUIBs5rukJ2NGgr1HRNiqrEExhbz31QsYV91LP4+oS4SF1zl1wUI6ouPV65QAX9JOhAiWLwE6BqLUzdIAhjsSC5+5VHZnrdhvQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KPK1leiM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4868kf5a029428;
	Fri, 6 Sep 2024 19:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ds/mupH9CQGdrp5u+QWgQw90jXpQ3rhwZoBEwvxPlws=; b=KPK1leiMpx5vfLZl
	dqAWZzY4NILuKoX5ta3g5xHhIj0MhnKIZb/lhD6b5eC4XYGnUrEkue51LfzwJdjT
	/GIro1KsB3JYQVchPrnUEtp4+zMDMyQgw8QU9xQf8Gos1LtQaKj3KtI+pRFyKCqe
	RFbJszBd8a6PCyBTb4RYRA1/H1Ahw1/P9OOkF1juYSN+b0X9FzfG15YPZAWCOex/
	NlvXyJxdAnyiPrYYzxrq8fraS/ACON1xpLB52gVkqC9A09aX1tNkurqKgtOeCckk
	cj45myu5PZoBC1rtl+gC/yI5uE8KXLs5gD4z+uYu9zyFXSJ0iSe+Dscl7BVeJIaf
	+SF3RA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwtu8u2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 19:26:54 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 486JQrD0024454
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Sep 2024 19:26:53 GMT
Received: from [10.216.47.237] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Sep 2024
 12:26:48 -0700
Message-ID: <ebf47b36-1d19-9061-358e-88b8c750d54c@quicinc.com>
Date: Sat, 7 Sep 2024 00:56:34 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 00/29] Qualcomm iris video decoder driver
Content-Language: en-US
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
CC: <quic_dikshita@quicinc.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
 <149c25c05a5a59890ade38fdd4c8c0b65c13a916.camel@ndufresne.ca>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <149c25c05a5a59890ade38fdd4c8c0b65c13a916.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: e9eXJ2tFpCnDy35CmbGaWiyfCgtZf6aW
X-Proofpoint-ORIG-GUID: e9eXJ2tFpCnDy35CmbGaWiyfCgtZf6aW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_05,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 clxscore=1011 mlxscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409060143

Hi Nicolas,

On 9/6/2024 7:49 PM, Nicolas Dufresne wrote:
> Hi,
> 
> Le lundi 02 septembre 2024 à 03:02 +0300, Dmitry Baryshkov a écrit :
>> On Sat, Aug 31, 2024 at 04:18:35PM GMT, Bryan O'Donoghue wrote:
>>>> The result of v4l2-compliance test on SM8250:
>>>>
>>>> v4l2-compliance 1.29.0-5239, 64 bits, 64-bit time_t
>>>> v4l2-compliance SHA: a1ebb4dad512 2024-08-08 20:00:17
>>>>
>>>> Compliance test for iris_driver device /dev/video0:
>>>>
>>>> Driver Info:
>>>>          Driver name      : iris_driver
>>>>          Card type        : iris_decoder
>>>
>>> Hmm, so this is decoder only ?
>>>
>>> What's the intention here for encoding support ?
>>>
>>> I've verified your results on the test branch but I just noticed that sm8250
>>> with the iris driver is decoder only - whereas the venus driver does both,
>>> which strikes me as a bit odd.
>>
>> I think we all have discussed this during the review of the previous
>> series: complete driver becomes very huge and complicated to review. So
>> the recommendation was to submit the limited features driver (decoding,
>> 1 codec) and get more features (more codecs, encoding support, etc)
>> after getting the Iris driver in. Of course sm8250 support in Venus
>> driver will stay in until Iris driver reaches feature parity.
> 
> And demonstrated backward compatibility. Just mentioning, since flipping default
> driver could theoretically break userspace, and that is a big no no. As
> maintainers won't run your HW, it will work on trust, and users report. But you
> have to be convincing.
We are committed to bring this driver at feature parity with venus. This will be
in phased approach and started with (single codec)decoder.
>>>
>>> Is your intention to publish more patches to enable the encoder in another
>>> series ?
> 
> I think this was the real question, any reason not immediately replying ? What
> I'm hoping is an answer in the form "yes" + some ETA.
Encoder changes were already available and were dropped from this series to make
it easier to review. ETA would be as soon as this series which adds the decoder
part, gets accepted.
> 
> Nicolas
> 
>>>
>>> ---
>>> bod
>>

Regards,
Vikash

