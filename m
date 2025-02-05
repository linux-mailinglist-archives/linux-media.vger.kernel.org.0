Return-Path: <linux-media+bounces-25669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D56EAA28432
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 07:17:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62205163819
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 06:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB059227BAF;
	Wed,  5 Feb 2025 06:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ou5XS87t"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C592165E0;
	Wed,  5 Feb 2025 06:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738736257; cv=none; b=fOIfNcWbN+wLUoeOLo3HKxgjrqtrWkQl+tjh1lg1/AemRLLIj5byaMeQBmepjtBBgzpKh6DSX0hGNq7lU75MgDTos2Sfaiykydg5vVVYx7wmJ36jhdGQl3LX9q73Gr6gtvnPJJuPbUUHLOYn0tUgTS4b0GzWUWzhY6shSY0IuUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738736257; c=relaxed/simple;
	bh=tqgeSNiL5pBeIt17AW330eomXgbp7TBHF4c6qsfUNDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OLOMgFhmD0TtVr2idteSgvsoskI8JYccOBq1mzmtoyqzvOvtpSQmX8XdIlFhbTLWIY2kREBb6PnCTBKVgXkJ9Qsdf8kWVtqggh3zel+gtt/jYEa+Krixg4ESH7crQYZ2UuC6cvEAj/zucx6hBI8EnIKj02NVB3Q/79Y7XZq2oZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ou5XS87t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5151IQGp015623;
	Wed, 5 Feb 2025 06:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J6IK9WY8Uzi7WzFh6C2+V/Sv3sw7HBprbK9HmSbTDR4=; b=ou5XS87tn/0VoMPo
	5uLvvGzMNePQwY1pMoSo+AXjPUCeQdJc8bECDv7uU9mzn0zSka9NjNbNObLachpp
	MtafrVzAwaQIBeMfdF9yH5DgNqakl8nWOAgB/QkK9l43MnVvQA5LPCaIK8y3smLL
	d9ce92ahBqeivHJBD8HrHHT+yIpzmHvqonCviFFFCN3WvseKpwZjXDR79zlleSF3
	L2jFbIGQPWG1Z5152jNWm86rnk6OFSiFPY1PWtO7eWNgkMEraPi1mKP1MTY0uJbi
	1TCwF51JU7kIYPIGrCfN3Hz33cKCFvkzJirrkskDAHNiZfbk1q5iOSmZaVN7G5Do
	Ba2BOA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kx77rhag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 06:17:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5156HM4a032119
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Feb 2025 06:17:22 GMT
Received: from [10.50.51.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Feb 2025
 22:17:15 -0800
Message-ID: <69dc3c64-e0b7-a453-a73b-6a3c9dbded7d@quicinc.com>
Date: Wed, 5 Feb 2025 11:47:12 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v10 1/2] media: iris: introduce helper module to
 select video driver
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Johan Hovold
	<johan@kernel.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>, <quic_vgarodia@quicinc.com>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <p.zabel@pengutronix.de>, <hverkuil@xs4all.nl>,
        <sebastian.fricke@collabora.com>, <bryan.odonoghue@linaro.org>,
        <neil.armstrong@linaro.org>, <nicolas@ndufresne.ca>,
        <u.kleine-koenig@baylibre.com>, <stefan.schmidt@linaro.org>,
        <lujianhua000@gmail.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <krzysztof.kozlowski@linaro.org>
References: <20250128080429.3911091-1-quic_dikshita@quicinc.com>
 <20250128080429.3911091-2-quic_dikshita@quicinc.com>
 <5070e1f1-914b-4654-88ef-3566e3eee9ca@kernel.org>
 <f1344e49-61b6-4115-ae88-55b4a3cfed28@quicinc.com>
 <Z6B822-6UTxQfX46@hovoldconsulting.com>
 <tqbm672pi223ipcw7btiemlb745weeeiy4gnazzeghozhq2emj@wppbkms6hir5>
 <Z6HehbKL88LW1lxC@hovoldconsulting.com>
 <hpcf7olw3ody7ns4ibdeoc5qrkmh3fgeqbhjd4eqwfuanevzoa@plenabtrjqi5>
 <Z6I5nx2Wt3bbBmSI@hovoldconsulting.com>
 <ilqfs6miq55ahyxjnhniv4k654vstfugmpswo5wld2ncgxxcx3@vsbr4bdl7y64>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <ilqfs6miq55ahyxjnhniv4k654vstfugmpswo5wld2ncgxxcx3@vsbr4bdl7y64>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: g1yqstij3JKZM-pW7MGK0YgJ2alVn5LK
X-Proofpoint-GUID: g1yqstij3JKZM-pW7MGK0YgJ2alVn5LK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_02,2025-02-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 clxscore=1015 suspectscore=0 mlxlogscore=999 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502050048



On 2/5/2025 4:39 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 04, 2025 at 05:00:31PM +0100, Johan Hovold wrote:
>> On Tue, Feb 04, 2025 at 04:55:58PM +0200, Dmitry Baryshkov wrote:
>>> On Tue, Feb 04, 2025 at 10:31:49AM +0100, Johan Hovold wrote:
>>>> On Mon, Feb 03, 2025 at 05:16:50PM +0200, Dmitry Baryshkov wrote:
>>>>> On Mon, Feb 03, 2025 at 09:22:51AM +0100, Johan Hovold wrote:
>>>>>> On Fri, Jan 31, 2025 at 10:44:28AM -0800, Abhinav Kumar wrote:
>>
>>>> And we're still waiting to hear the answers to all of Hans' questions. I
>>>> still haven't seen anyone explaining why any of this is needed. You
>>>> could have just continued letting Venus support 8250 so presumably there
>>>> is some benefit in using Iris instead. Which? And is that potential
>>>> benefit important enough to not just wait until Iris is up to par
>>>> feature wise?
>>>
>>> Because that's exactly opposite of what Iris developers are trying to
>>> do: SM8250 and SM8550 belong to two different generations of the FW
>>> interface. By supporting both of them in the Iris driver the developers
>>> can verify that the internal driver abstractions are good enough. It has
>>> been discussed in one of the threads (or in telcos) related to the first
>>> iterations of this driver. We definitely don't want to end up in Venus
>>> situation, where the abstractions were added afterwards and in some
>>> cases they are not the best ones.
>>
>> Ok, but as I've said a number of times already, information like this
>> needs to be included in the cover letter and commit message of what is
>> posted to the list.
>>
>> Maintainers and reviewers obviously have no idea what you discussed in
>> some internal teleconference and can't be expected to remember or dig
>> this out from some old email thread either.
>>
>>> The plan is to use sm8250 as a "bridge" between two drivers, verifying
>>> that they are on par during development, then drop sm8250 from Venus
>>> driver. Then move sc7280 support too, drop all HFD_VERSION_6XX support
>>> from Venus, cleanup the remnants.
>>
>> Ok, but venus would still remain for some older hardware? It's just the
>> "hfi gen1" ones that would move to the iris eventually?
> 
> Yes. At least for the foreseable future. Nobody has explored an option
> of moving older hardware to the Iris driver.
> 
>>
>>> I think most of that information should have been a part of the main
>>> Iris series. If it is not, please comment there, so that those commit
>>> messages can be updated.
>>
>> Unfortunately it was not, which I also pointed in my comments to the
>> Iris series.
>>
>>>> I'm sure you have some answers, but you need to provide them as part of
>>>> the series.
>>
>>>> Unbinding and rebinding drivers is not part of any normal work flow
>>>> expect possibly during development. And a developer can easily compare
>>>> Venus and Iris for 8250 without a module parameter too.
>>>
>>> Yes, we are talking about development. And yes, modparam helps. If you'd
>>> like to do two separate kernel builds, that's fine.
>>
>> Please just motivate why you think this is needed as part of the
>> submission. And make sure that the implementation is sane (e.g. not some
>> random probe defer indefinitely thing).
>>
>> Like I said, having two drivers for the same hardware is normally not
>> something that is acceptable, and this would need to be a transitional
>> thing as we both agree. One way to guarantee that is to not expose it to
>> regular users until it is ready (e.g. a Kconfig hidden behind
>> CONFIG_EXPERT or similar). Otherwise, I fear you'll end up supporting
>> both forever (with at least one of them bitrotting behind that module
>> parameter over time).
> 
> I think I'm fine with hiding IRIS behind CONFIG_EXPERT, might be a good
> idea.
Are you suggesting to add a dependency on CONFIG_EXPERT for IRIS driver?
Something like:
config VIDEO_QCOM_IRIS
        tristate "Qualcomm iris V4L2 decoder driver"
        depends on EXPERT

This will impact the enablement of iris driver on SM8550 as well.
And will this also be needed to be captured in cover letter?

Thanks,
Dikshita
> 

