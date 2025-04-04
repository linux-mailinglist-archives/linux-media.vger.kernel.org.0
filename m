Return-Path: <linux-media+bounces-29366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9B2A7B71E
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 07:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38F603B85A7
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 05:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A911624C5;
	Fri,  4 Apr 2025 05:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YF2GtSIB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4318376;
	Fri,  4 Apr 2025 05:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743744283; cv=none; b=T74VkBtpodS3ITs+jn7DHxb6Ui6WqrKFEjID5dZ9lrwlwWHeM8U1aDl8XPc/hcav3YSPr1bgfdu5G+PUuR/YyeHQUpO1NU85b+Db83JicbI6fJSLio0rvg6guRscax63H3E3oGd4GcRXuMTJRupdWn7xjAI57400gaX8qITH83M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743744283; c=relaxed/simple;
	bh=T6qWTHO6zn6yFeQRka369OQfKhxhMz8aa9AQl4IEI8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=K1c0ZmMF/EqYU9dqd+MTKxxiuRMSwdUElWaJG1z559z5l7VGvVnk554e8L6TbcquRqzPqPAeLIpKrp/F3TWTitmdGDsmoDt4DEpJfZLkezCZcDBnxC93Z50Pio9UiOL2zpxwtkgtJAOh2IDvH0xSxeGqvI/6/54+7qzxw+gVrcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YF2GtSIB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53433pSj012468;
	Fri, 4 Apr 2025 05:24:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dgpEB7gfc/lE0wfxGM1FCSwDljOatKrsnpah3weKpoQ=; b=YF2GtSIBQ+W8JWVc
	+dun3q2bQr0j3bamCyb03zqxFYYuU23VGRSiPObrm26+J3AC1L1LHUbZ3UB3Lm8z
	dOH0d6E9+vvxZUy+VQGmh06GF2OGZ9TMB/N8jyPZ35M3P3UkBNC2cvJzMwitj9it
	BwofFJUoR70ubYL+MnornSuSz0S5hMDlXvhrY+ByfIeqdVhnQ7GMIPpDjswUDLh4
	jgD+YQU/anEn7tPb8pfCCdZT5R8WZhUrKVLPvZv3iTjs4W+Mz6KJ7xMeejH4/zrb
	QMlZ4C5oBgAEhMOmJ6Coq0SBRYHfoykSxWz8Kon0n8TRhjST+f+F/6bmVqlY08lU
	2SNWfg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d50qw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 05:24:36 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5345OZTk028739
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Apr 2025 05:24:35 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 3 Apr 2025
 22:24:31 -0700
Message-ID: <1dd6e03d-09be-4853-741a-4fb47b7619a0@quicinc.com>
Date: Fri, 4 Apr 2025 10:54:22 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/8] Reup: SM8350 and SC8280XP venus support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Johan Hovold <johan+linaro@kernel.org>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
 <8cfaeb25-2657-9df4-5cea-018aad62f579@quicinc.com>
 <it3njgklhnedjzojafuxpjy3o5zfulgdclweyobv7kjgtpjmzx@6opje7yms4yg>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <it3njgklhnedjzojafuxpjy3o5zfulgdclweyobv7kjgtpjmzx@6opje7yms4yg>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7gynyBXwz0lmTHT6-60hgv_GkTO1B2KS
X-Proofpoint-GUID: 7gynyBXwz0lmTHT6-60hgv_GkTO1B2KS
X-Authority-Analysis: v=2.4 cv=Cvu/cm4D c=1 sm=1 tr=0 ts=67ef6d14 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=ruycbLpa2_zXmOni_LEA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_01,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040035

Hi Dmitry,

On 4/3/2025 10:28 PM, Dmitry Baryshkov wrote:
> On Wed, Mar 05, 2025 at 08:49:37AM +0530, Vikash Garodia wrote:
>>
>> On 3/4/2025 6:37 PM, Bryan O'Donoghue wrote:
>>> This series is a re-up of Konrad's original venus series for sc8280xp and
>>> sm8350.Why this is enabled on venus driver ? Why not iris driver ? This needs an
>> explanation on was this even tried to bring up on iris driver.
>>
>> How different is this from sm8250 which is already enabled on iris driver ?
> 
> As far as I remember, SM8250 support in Iris did not reach
> feature-parity yet. So in my opinion it is fine to add new platforms to
> the Venus driver, that will later migrate to the Iris driver.
I would say, from decoder side all codecs are there now on Iris. H264 merged,
while h265 and VP9 dec are posted as RFC, there is one compliance failure which
is under debug to post them as regular patches.
If we are mainly looking for decode usecases, then we should be on Iris.
Preference would be to stay on Iris, otherwise we would have that extra ask to
port it later from venus to iris.
> 
> Otherwise users of SC8280XP either have to use external patchsets (like
> this one) or a non-full-featured driver (and still possibly external
> patchsets, I didn't check if these two platforms can use
> qcom,sm8250-venus as a fallback compat string).
It should, atleast from the hardware spec perspective, AFAIK.
> 
> Bryan, Konrad, in my opinion, let's get these patches merged :-)
> 
>>
>>> Link: https://lore.kernel.org/all/20230731-topic-8280_venus-v1-0-8c8bbe1983a5@linaro.org/
>>>
>>> The main obstacle to merging that series at the time was the longstanding
>>> but invalid usage of "video-encoder" and "video-decoder" which is a
>>> driver level configuration option not a description of hardware.
>>>
>>> Following on from that discussion a backwards compatible means of
>>> statically selecting transcoder mode was upstreamed
>>>
>>> commit: 687bfbba5a1c ("media: venus: Add support for static video encoder/decoder declarations")
>>>
>>> Reworking this series from Konrad to incorporate this simple change
>>>
> 
Regards,
Vikash

