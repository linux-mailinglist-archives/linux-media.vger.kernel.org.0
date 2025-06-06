Return-Path: <linux-media+bounces-34198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFACEACFD46
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 09:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FFCC3AE268
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 07:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A87283FFF;
	Fri,  6 Jun 2025 07:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q8BiRH9S"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EED19CD1B;
	Fri,  6 Jun 2025 07:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749193938; cv=none; b=Ic0Xoey60G9nACWzXhSEG0Bgyh9ld7IOKRIKqkaOuRSchs5qzztoLNYq+GKfngozUCPUejUeg30ltL+gLlvVJ7TM7OC7jQ0g467LOdvmwyDkwd0PbCnjj4j1LdUlgCnziqte4Xxntimp+ZLy8PE9FbdphqBKngjpXDdTixYBeUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749193938; c=relaxed/simple;
	bh=pqhZUn8ZXfl+amxSbxTQk/Uc6tx9mr3uHQCK8l+YLow=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IvAyf9EYqvB+Lbi6I/tr4SALTmueIxjZUB3FBJCPXikYlxt1iHdQ1H6iuSpYoV19aqEnn/h1PQuBFP6WEc1SfxHrf4Yng1LVb3uC0PEEWdaP29TtkLhIJNFcSthtFcVlfIBlG7wz19YpZaZEXrTLHMzs2P90hgdvh/1+iQoKpHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q8BiRH9S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565bADu006543;
	Fri, 6 Jun 2025 07:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I8j5MZE2vbEP07SOEcLwah4N1BY8fyxRk1nAnrN0dtM=; b=Q8BiRH9SWrqcKCjO
	aosj8H0GhwNiJlZNPj1WP81gcaPW4/vJWx/+c0smlqea7k/Ect8pAPm0x7Ek0ar0
	Yybtpc2ueWA8pFF8+udE4fwII/SbGzk8bVW7jZO9f59o2wXGzamBYj/wSr1oHSnc
	4OKlm4gDZqNSpypBehLQmG9A/jaIHQN8niXn6CqASh7lvyynY2DhbIw3RGpg045n
	cR6yGhZ7kYN6ikfGTnlPQsQTXJM6UJ0CpvQu4eUTEV5rYk58Z62st6S8S7s1kDKa
	PTBcdOwQZoqcS9/B3l8ST+6OKWVcNYdvp8FSdTvDkkJXDS/3mpA+QzwathZWdGOp
	HerVXw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t3s3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 07:12:12 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5567CBcO008610
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 07:12:11 GMT
Received: from [10.231.216.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Jun 2025
 00:12:08 -0700
Message-ID: <ad29f523-f2d8-4933-962c-fa6f22debc7e@quicinc.com>
Date: Fri, 6 Jun 2025 15:12:05 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] media: venus: pm_helpers: use opp-table for the
 frequency
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <20250530-add-venus-for-qcs615-v8-1-c0092ac616d0@quicinc.com>
 <8c57ed65-002a-4ddc-9056-6b7908c0ff52@oss.qualcomm.com>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <8c57ed65-002a-4ddc-9056-6b7908c0ff52@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0S5YQ47gF-4xj7QXRe7zqzB8Fyv66Tgp
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=684294cc cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=LrNUjg_vOetuG0Eol_8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 0S5YQ47gF-4xj7QXRe7zqzB8Fyv66Tgp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA2NSBTYWx0ZWRfX8JgAHbLS9DEm
 FyvWhZz34pIRmJb3mzU4IhEIDrsx773lEaKWQB/65mTDz23qxAzTGQLL8WQexqaYdesk/PIAX8I
 qO9XwN1FF2ReOaHmsNMMcpbZapfXpwuPRGbu96Pq6921E1jQD8Yy2jdF+rm27nx5QzedLqv5fhj
 gS9KcjqwTE6m1Vj3+j3MRaHbxfn86VKgrIDzua9cnWSRpf0gE1+XFAmntOQAKHljIC5QnufP0Jx
 s2C5DagV8VqFC6cGAGr26/XdNCMpHOoS/UUvsNR8O7kYb+2o8qWEigQ+PSXFMnkGvFdL8SrLrLU
 QyDYzEAXGHbV11wxVYQRcj4n0Lwup1WJUCD88Wndz/H0cdXIeQPvYktSt3KSsEOU1S3qKhUrZ2N
 6S2e1/VxmM8IBx4XjYkdaIoQClWBPNoQGHMGY/g65xAC0fLrtErINOCB/OvXYXzX6I3iBCxN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=975 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060065


On 5/31/2025 7:11 PM, Konrad Dybcio wrote:
> On 5/30/25 6:02 AM, Renjiang Han wrote:
>> The frequency value in the opp-table in the device tree and the freq_tbl
>> in the driver are the same.
>>
>> Therefore, update pm_helpers.c to use the opp-table for frequency values
>> for the v4 core.
>> If getting data from the opp table fails, fall back to using the frequency
>> table.
>>
>> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>> ---
> You can save yourself some error-checking pain in this patch if you
> do something like
>
> ret = devm_pm_opp_of_add_table(dev);
> if (ret == -ENODEV) {
> 	for (i = 0; i < freq_tbl_len; i++)
> 		dev_pm_opp_add(dev, freq_tbl[i], 0);
> }
>
> to programmatically migrate everyone to OPP..
>
> But - tangent - I'd say efforts to preserve compatibility with DTs that
> don't even contain frequency data for a given target are rather futile..
> Such descriptions where we only know the frequency (be it the tables that
> we currently have, or the constructed OPP tables that only contain frequency
> data and no voltage corners) are incomplete, and if the system manages to
> not crash if the driver requests a TURBO/max freq, it's all because we got
> lucky, as this consumer is not voting on (MM)CX.
>
> That said, it's probably to keep the breakage to minimum, especially
> given this is an old driver for old hardware.. I'll add the missing
> OPPs across platforms with an intention to drop the hardcoding somewhere
> in the future
>
> Konrad
Thanks for your comments. This is a good way. I'll update in next version.

-- 
Best Regards,
Renjiang


