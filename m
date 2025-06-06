Return-Path: <linux-media+bounces-34249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A07DAD0293
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 14:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 968F13AA938
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 12:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC77B288C1C;
	Fri,  6 Jun 2025 12:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bHpQu8MX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B833228E0F;
	Fri,  6 Jun 2025 12:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749214298; cv=none; b=gesSh0U3wWbPZkcKldMJEYQyibj/gReIji1Ba4MgqMj2c9xIt7cWT6aZfti8uV3lV4TMkk47ztViPvUvulkxa+3P4WAni5RaDsw4YfjdIeB98vMqEnkxWwB6LhkdAvHgQKY0kT0KMXFJTYpPljcqht+mlNsHWfGr14FUIeQB+/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749214298; c=relaxed/simple;
	bh=dtecXRWUyF0yin5ved9QdoDV8185V+TTuWa3QEslO5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=d63cQut1IvLMW8RKHs3n533GxZnYbk54LEmZpjmnLDk6/aWjkar7Iqbu+CSX+BSt5XW7uf66EFJWnVH/S8el7gaYNEvciiubAD3nflO4y1Sb1s9Rf+FGVeGZ0iptZ7J7rzH1fM6t7jSqNPhbRGk+E1AXa2ZuaYAjGCDjNXS04Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bHpQu8MX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5568VQDR031008;
	Fri, 6 Jun 2025 12:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KPZLJlpuZibqD575czjkKdQ3SW/r72UBFjCfKtCMLfg=; b=bHpQu8MXVjdBwRsn
	xLH7HSeuEc0QBpCVSiUl/Vy6QX5TP61GsRg2Iouf91ZQcqTGhgZW9iPS1QxTOsiY
	lK/2dx+Hqv19NLcW0whJRX04rpB4ytuMJAPBCLjCji+6UQ6S0AG3TTddAKNQ/XlL
	w/lqtDnCz8Zz91XI53AAWXGPQWE8IPakTQbj/qNbVA2Kn8GZLiZ6XrkcEJoCTiTM
	cTTa/4v2AXNoGTB6G2K/UcHrMOtKgxifj1TPRwYavct1ohJuk1jDXFJ9tTjqaF7w
	MNvJKatWZI6A00y6qNKheiwyWc0amZWyT+wCu1JUTtY+zg/cLFO7pZH/XrkvLmWg
	51fA6w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8s4q8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 12:51:31 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 556CpUl0026102
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 12:51:30 GMT
Received: from [10.253.79.143] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Jun 2025
 05:51:26 -0700
Message-ID: <7aa36a0f-6741-40c2-93f4-036823d245fd@quicinc.com>
Date: Fri, 6 Jun 2025 20:51:24 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        "Nicolas
 Dufresne" <nicolas.dufresne@collabora.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
 <5854a587-aba7-4e71-87f8-249ba00cbc59@linaro.org>
 <996c9a39-5520-4b43-adfa-06ce29223ba0@quicinc.com>
 <713b87cb-0003-4ee3-a599-9cd41629bb42@kernel.org>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <713b87cb-0003-4ee3-a599-9cd41629bb42@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 323KRHMxj_jGHTw_9905x9k9nk2FmZAg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDExNiBTYWx0ZWRfX+OPckuXGwuBi
 jSFzDZvsCcavwXjpQeUQbhabayTdBGApWQD/O0tFwySCsTRAwbUO6P3EXlGIte8MODQoU18zHuW
 fD9btlVOrlGpRfxac6StYhlgWuRO93PNczh/a2KCyTsHw8rUxOVtc7DqHEOV9eR+JdtAo+/rj+k
 IEBKfSVQu69J4qtI5wMi1g+EDRyW2+RRlIPGSH2DnvQvrE/YkN6rS8/EPDwMbdsudGrTlVIX8aC
 nln6jdDmRt8EfPLffoJWJpso7bhVBsnOvYp3gmoGQ4lnvC5qNiA/hh+iBzmCZCR4t2/8AAAgmUc
 BRw2pl6ak8tlyoGw6SlsYcKwekq3kuxV0vYODyd/IYqAtPW1GQCGnkwXPDZ8Kgi4+uch/hPb8at
 cyw6VTh6qJaFSMvWpZHief/Hj8y9T5rWLbMGBKzsIjGT++w1uAqcJGYo1Tzw3t7PAdEUjVYX
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=6842e453 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=nhFwFTAwuBtyWiKGGJcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 323KRHMxj_jGHTw_9905x9k9nk2FmZAg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=932 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060116


On 6/6/2025 8:44 PM, Krzysztof Kozlowski wrote:
> On 06/06/2025 14:37, Renjiang Han wrote:
>> On 6/5/2025 8:34 PM, Bryan O'Donoghue wrote:
>>> On 31/05/2025 01:05, Renjiang Han wrote:
>>>>>> Note:
>>>>>> This series consist of DT patches and a venus driver patch. The patch
>>>>>> 1/3, which is venus driver patch, can be picked independently without
>>>>>> having any functional dependency. But patch 2/3 & patch 3/3, which are
>>>>>> DT patches, still depend on [1].
>>>>> I'd say 2/3 and 3/3 still depend on 1/3, otherwise we can get video
>>>>> core
>>>>> on QCS615 over(?)clocked.
>>>> Agree, so we need to make sure that the driver patch is not picked
>>>> after the DT patch.
>>> This statement is confusing.
>>>
>>> 1/3 states that there will be a fallback if there is no OPP table
>>> present.
>>>
>>> Giving the code a glance, I believe that is so, freq_table should be
>>> used if there is no OPP specified in the DT.
>>>
>>> I think we are having a hard time here understanding what you are saying.
>>>
>>> My understanding:
>>>
>>> - venus modification is standalone 1/3
>>>    Qcs615 will fallback if no OPP is present
>>>
>>> - dt modification 2/3 3/3 is therefore also independent of driver
>>>
>>> ---
>>> bod
>> yes, let me re-spin this with driver patch alone. Once that gets in,
>> will bring in the DT patches.
> Did you read my feedback? There is no "once that gets in". DTS is an
> independent hardware description and your patchset claiming there is
> dependency is just broken.
>
> I am repeating this since few emails, so shall I NAK it that you will
> address the main issue you have?
>
> Best regards,
> Krzysztof

Hi Krzysztof

SC7180 and QCS615 use the same video core. Only difference lies in the
freq_table for the video. Freq_table is generally determined at SOC level.
The Venus driver does not currently handle freq_table compatibility well
across platforms. This patch enables the driver to use the OPP-table from
the DT, addressing the frequency compatibility issue.

-- 
Best Regards,
Renjiang


