Return-Path: <linux-media+bounces-21255-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE229C402A
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 15:03:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F6FB2829BE
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 14:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D799319E994;
	Mon, 11 Nov 2024 14:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ahgggQo+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24D218BBA8;
	Mon, 11 Nov 2024 14:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731333786; cv=none; b=PD8K5wBnwMORYP6A3O/0DTyW2i0/9SSfeWAQmworsnATynY2xumZpR/1q6xbGnlnvghgVYl4WS/VUhHqLNJx2J9Kq6JnjHsddAFysr8B0p5x7+dg26wocch6HeK8RtQYBuRoAJ+44raP+6zKDyov9CiZIkw6RQB9vW06vGaWTaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731333786; c=relaxed/simple;
	bh=HaaDV+WLpR0Ia/MD/rolnSMvCpQVGSdfRgdfsEk7FwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nrTGDdjYJkReDCtQfPfHcZubmO2FXsDkfRIUU3IUWvMsFDiwZ5pX4ABSKM8TgzybuozoAY3qoRFvRW4oxw2LCsCA3vmo/0HPv/pI2k5Z5TJWxGvYKPHijSYNefsHn92dScBSrLiJ+X/qWM1+G7jl6N+ngQsVpN2BPJXqqj+soRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ahgggQo+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABDDgIM000996;
	Mon, 11 Nov 2024 14:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1rvycK1m43BFAJNc0igbgy2/qw11w87AKvHkvR3c3LM=; b=ahgggQo+xE2P5k62
	Z7anENshxFQ1LHRr15yJY2VbdyPfnSk7JS2P+it2cbndwBH1VD6FzNWDCQXguJ00
	TgJ1jq2n4XFuMGStl8w7X/adyZQ3wAmaZcl0t8qnKPW0tjncWMn6H9DySmKNG2KB
	07sI30kMbByZqkw5/DymNo2EmviDZc6v7KmCEqJpiK1udogicyEwVd4Y0e8oL/dD
	aouBShAwkFZKLyBPL2Qd0dAgVxs+vIZguz9QKN6rLBK06jKOn7ZXgi1RSr8Mx4pv
	0BJxVER+V6LepQUKqcPQHsdBvR0Hf6tLkZTT2FyH82JHka83z8nPjVa24PxUskru
	qRrLOA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t0wjv7g8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 14:02:59 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ABE2xHW005786
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 14:02:59 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 11 Nov
 2024 06:02:56 -0800
Message-ID: <e2b31dbc-2681-1bd8-e013-d65ec52bbf1a@quicinc.com>
Date: Mon, 11 Nov 2024 19:32:53 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/4] media: venus: hfi_parser: add check to avoid out of
 bound access
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
 <20241105-venus_oob-v1-1-8d4feedfe2bb@quicinc.com>
 <b2yvyaycylsxo2bmynlrqp3pzhge2tjvtvzhmpvon2lzyx3bb4@747g3erapcro>
 <81d6a054-e02a-7c98-0479-0e17076fabd7@quicinc.com>
 <ndlf4bsijb723cctkvd7hkwmo7plbzr3q2dhqc3tpyujbfcr3z@g4rvg5p7vhfs>
 <975f4ecd-2029-469a-8ecf-fbd6397547d4@linaro.org>
 <57544d01-a7c6-1ea6-d408-ffe1678e0b5e@quicinc.com>
 <ql6hftuo7udkqachofws6lcpwx7sbjakonoehm7zsh43kqndsf@rwmiwqngldn2>
 <781ea2fd-637f-b896-aad4-d70f43ad245c@quicinc.com>
 <oxbpd3tfemwci6aiv5gs6rleg6lmsuabvvccqibbqddczjklpi@aln6hfloqizo>
 <37982a05-2057-45f4-923e-7562c683706d@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <37982a05-2057-45f4-923e-7562c683706d@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mH0y1_oUWsPqZ4a-YRUqNnErAZQGOabM
X-Proofpoint-ORIG-GUID: mH0y1_oUWsPqZ4a-YRUqNnErAZQGOabM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411110116


On 11/8/2024 5:13 PM, Bryan O'Donoghue wrote:
> On 07/11/2024 13:54, Dmitry Baryshkov wrote:
>>>> I'd say, don't overwrite the array. Instead the driver should extend it
>>>> with the new information.
>>> That is exactly the existing patch is currently doing.
>> _new_ information, not a copy of the existing information.
> 
> But is this _really_ new information or is it guarding from "malicious"
> additional messages ?
> 
> @Vikash is it even a valid use-case for firmware to send one set of capabilities
> and then send a new set ?
> 
> It seems to me this should only happen once when the firmware starts up - the
> firmware won't acquire any new abilities once it has enumerated its set to APSS.
> 
> So why is it valid to process an additional message at all ?
> 
> Shouldn't we instead be throwing away redundant updates either silently or with
> some kind of complaint ?
> 
> If there's no new data - then this is data we shouldn't bother processing.
> 
> If it is new data then surely it should be the _current_ and _only_ valid set of
> data.
> 
> And if the update is considered "invalid" then why _would_ we accept the update ?
> 
> I get we're fixing the OOB but I think we should be clear on the validity of the
> content of the packet.
The payload [1] is all about 2 u32s each for decoder and encoder bit masks,
while each bit signifies which codec each supports. So in a good case, it would
be always first iteration which would be sufficient. Its a very hypothetical
case where a good case would that there are 8 payloads (consider there are 8
supported codecs) with one bit set in each of those 8 payloads. I was initially
thinking to cover for this case as well, seems could be a bit of over designing.

Maybe set core->codecs_count (to 0) in the beginning of the API should cover the
working case. In malicious case, let it continue to override ?

Regards,
Vikash

[1]
https://elixir.bootlin.com/linux/v6.12-rc7/source/drivers/media/platform/qcom/venus/hfi_parser.c#L193

