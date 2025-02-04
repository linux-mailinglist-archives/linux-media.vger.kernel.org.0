Return-Path: <linux-media+bounces-25640-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC74A2756B
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 16:10:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBBC1164DAD
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 15:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B890214206;
	Tue,  4 Feb 2025 15:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k7ectYCn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2385211A16;
	Tue,  4 Feb 2025 15:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738681761; cv=none; b=Dnuwjb/FVhyjCLq+P4H0Hr55bKa98Y1l7VfgKGlTSTM6e1wN9J2yFPusaHSRSTkQ0dV311G6lH5qiatQN+9/BFzFaVsdUoj/Li4adTfvqPQ4dAr3TH7pD6PIKpI1cQSuiecJF1rE9iNLqfU9rGhlIOgpEyx9OZ+7qUJZ76HWjdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738681761; c=relaxed/simple;
	bh=vJQirPz2zrsaDTidXpRb7uQj3ny0kPR4nSnOhACLsks=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=g8ohvlhYicYgB1zIvqyqO/OevPvz11p++dVkjMlFlOwxYpj+UWCjlXK7b1Od4sl3+xT+o2rdn5ghA4k6lGNpi5Vkc/nRm6lcwzbbS5DWHFenLTqGsGu9wGbUQ+D0OdZUY6IvfJcXm1nf/TyafwMg1xJqmydHcKepoIrNDUtqeIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k7ectYCn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514F1cVF027843;
	Tue, 4 Feb 2025 15:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aiqvT4CSxV+Y1Xj5RpTcxKKoXwgayPPWzfl5g49Tt9E=; b=k7ectYCn12SyS+to
	6O9krGER7US9pK2IqUxI2bksG753kPMp3ThAiVM7/a4wbkglo6coPH1KY03rx8zH
	WrwKIKw1h8utq5cCzxYRzp6ai1J7iR9s+y+oFZCcjzit7mzIfFCqIQy2OrJc7xOf
	zmUHZyaiL9K5Euy8Dg+DeOqSRnU6Dx4RtSm5EihWrsRkWTXc2uzgDCUzMT5sXrvY
	IQyO2PRBo0fD2iUhSZG/hwlP55Bnb5IKgQJRLZeNtYGR+5Nnz10jWrCYwZBRdZqO
	DZdhFw5DMbp4pzENSghcvw8pYytl7Il1yyn1opyY0IMSwQ2pj5pAqigIpcH7sHSH
	MJkz0Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kfaj0xr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 15:09:07 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 514F97Ke002016
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Feb 2025 15:09:07 GMT
Received: from [10.216.21.39] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Feb 2025
 07:08:59 -0800
Message-ID: <812c4f61-724c-cee8-b7c9-a799ade0631c@quicinc.com>
Date: Tue, 4 Feb 2025 20:38:56 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC PATCH v10 1/2] media: iris: introduce helper module to
 select video driver
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <hverkuil@xs4all.nl>, <sebastian.fricke@collabora.com>,
        <bryan.odonoghue@linaro.org>, <neil.armstrong@linaro.org>,
        <nicolas@ndufresne.ca>, <u.kleine-koenig@baylibre.com>,
        <stefan.schmidt@linaro.org>, <lujianhua000@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <krzysztof.kozlowski@linaro.org>
References: <20250128080429.3911091-1-quic_dikshita@quicinc.com>
 <20250128080429.3911091-2-quic_dikshita@quicinc.com>
 <5070e1f1-914b-4654-88ef-3566e3eee9ca@kernel.org>
 <f1344e49-61b6-4115-ae88-55b4a3cfed28@quicinc.com>
 <Z6B822-6UTxQfX46@hovoldconsulting.com>
 <tqbm672pi223ipcw7btiemlb745weeeiy4gnazzeghozhq2emj@wppbkms6hir5>
 <Z6HehbKL88LW1lxC@hovoldconsulting.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <Z6HehbKL88LW1lxC@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kvkJmilPxoQGSEHkXYxNWZZmgPnU9-O4
X-Proofpoint-GUID: kvkJmilPxoQGSEHkXYxNWZZmgPnU9-O4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_07,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1011
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040117


On 2/4/2025 3:01 PM, Johan Hovold wrote:
> On Mon, Feb 03, 2025 at 05:16:50PM +0200, Dmitry Baryshkov wrote:
>> On Mon, Feb 03, 2025 at 09:22:51AM +0100, Johan Hovold wrote:
>>> On Fri, Jan 31, 2025 at 10:44:28AM -0800, Abhinav Kumar wrote:
> 
>>>> Solution: If the user prefers iris driver and iris driver has not probed 
>>>> yet, and if venus tries to probe ahead of iris we keep -EDEFERing till 
>>>> iris probes and succeeds. Vice-versa when the preference is venus as well.
>>>
>>> This sounds wrong too.
>>>
>>> Look, first you guys need to explain *why* you want to have two drivers
>>> for the same hardware (not just to me, in the commit message and cover
>>> letter).
>>>
>>> That's something that really should never be the case and would need to
>>> be motivated properly.
>>
>> I think it has been written several time (not sure about this commit):
>> to provide a way for a migration path _while_ people are working on Iris
>> features. Being able to A/B test Venus and Iris drivers and to report
>> possible regressions or lack of those on the common platforms supported
>> by those (sm8250 at this moment).
> 
> You don't need a module parameter for that.
> 
> And we're still waiting to hear the answers to all of Hans' questions. I
> still haven't seen anyone explaining why any of this is needed. You
> could have just continued letting Venus support 8250 so presumably there
> is some benefit in using Iris instead. Which? And is that potential
> benefit important enough to not just wait until Iris is up to par
> feature wise?
They are documented in this RFC [1] as comments, and would be added in v10 as we
conclude the ongoing discussion to handle 2 drivers during the transition phase.

[1]
https://patchwork.kernel.org/project/linux-media/patch/20250128080429.3911091-2-quic_dikshita@quicinc.com/

Regards,
Vikash
> 
> I'm sure you have some answers, but you need to provide them as part of
> the series.
> 
>>> Second, if the reasons for keeping both drivers are deemed justifiable,
>>> you need to come up with mechanism for only binding one of them.
>>>
>>> I already told you that module parameters is not the way to go here (and
>>> the msm drm driver's abuse of module parameters is not a good precedent
>>> here).
>>>
>>> If this is a transitional thing (which it must be), then just add a
>>> Kconfig symbol to determine which driver should probe. That's good
>>> enough for evaluating whatever needs to be evaluated, and doesn't
>>> depend on adding anti-patterns like module parameters (and helper
>>> modules for them).
>>
>> No, Kconfig complicates A/B testing. What you usually want to do is to
>> boot a kernel, then go over a bunch of files testing that they work with
>> both drivers. Kconfig implies booting abother kernel, etc.
> 
> No, I'm pretty sure you'd even want to reboot in between so as not to
> rely on state left behind by the other driver.
> 
> Unbinding and rebinding drivers is not part of any normal work flow
> expect possibly during development. And a developer can easily compare
> Venus and Iris for 8250 without a module parameter too.
> 
> Johan

