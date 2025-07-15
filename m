Return-Path: <linux-media+bounces-37734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA4BB0524F
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 09:01:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8E10188E3E1
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 07:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23B426CE31;
	Tue, 15 Jul 2025 07:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Cld+089k"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959044A21;
	Tue, 15 Jul 2025 07:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752562882; cv=none; b=REZod/J5LfmrfcRAAWPxFYbI8LZv9WEsJuWAx6bFpLTx4P+fSqzU3ckGBOM+t2tG7MA9DH9XhUmybACbyTyT3FsIDe1K6VAyag2bJjCGpnPPQyi6RopWkGW/r9SDVYu/+i4m/glSGl9mM1IS2brThCYPWkbPSH5E+IzWeJpOO/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752562882; c=relaxed/simple;
	bh=qLh+fIjVyQgDPe3qchMRLMJnXHYyjtEjYq0Vo+X6Am4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lvMs3c7K/MJdjrsxXKHIn433IDgUMqHAFuEmbqBCX5lgEEPmWyCsZNLjizhcFS9+iaWPbE5lz9Fsf5JHMAMXjHkCWTyPXqUNIPPoZXdEZL1GocyZB1FrIxV+zvBBd+qL5dp11Xn5cPIFnBDr9jjRshIwa3COOxyALXlV6q2a1MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Cld+089k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F5iBT5028585;
	Tue, 15 Jul 2025 07:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d96BkCV37oB7zOPVJxZtr+I85trwgiGcWUIkXFdajsA=; b=Cld+089kAZC+19SW
	sV66y6RnEot267KglEGnfXSATjvapjJ+vE2qGPzgqhEX5muy/LeonHtnLT/4KZN1
	zRZnZrxS4MizSycSoi77ZaFstz9tssFNVWDOQm+NlINaYfjtrWdgcQuGdFpEQFXK
	TCg6oqHP135IYT+ary81RkGuREscDQn4XFYpQBL0HbUKXaSFgaCpBjQzekXCE/mW
	MjVQcQH6qvnYkWsYyDKfgFx4dPltWIQdKKjaiFa5zsK5Oiw1lZJoZw/ymVi9GWr/
	ByPLSvCm9+S06dNQl3TZXmDd2g+JFNrgeqMbDPkPItgwJiuwkbg09JlWrqDuUSwA
	Q7VQ2A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dq1x53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 07:01:08 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56F717ND014887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 07:01:08 GMT
Received: from [10.50.25.16] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 15 Jul
 2025 00:00:34 -0700
Message-ID: <a4dfc82b-79df-3e3c-0964-a99db222c6e6@quicinc.com>
Date: Tue, 15 Jul 2025 12:30:31 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] media: iris: MAINTAINERS: Document actual maintainership
 by Bryan O'Donoghue
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>
References: <20250714151609.354267-2-krzysztof.kozlowski@linaro.org>
 <8772c48f-348b-8a68-2099-562a29b9dd8d@quicinc.com>
 <b83cc20b-44d2-4635-a540-7a9c0d36cdb5@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <b83cc20b-44d2-4635-a540-7a9c0d36cdb5@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA2MiBTYWx0ZWRfX83bedKQzrJqG
 nHFsHVY8ttS1G4luGPAdEUEK92iSkHLk3qUg7lh30vpxQk6aPhsY0vJADm4K7vA6CeKm6QRT8tL
 Kcr5cQlWiy/X6RULNboQ5N0Z+0x9T70Um76Y8ajeTFb/RgiRdlKvsct5GeaR9Wq3ZNiHgbLeaP8
 yHkpoNSr6ZLx4fyQf1ZWSlZ8UAGOmFjo+kWNeHjTmPV5/OqwPfcIuElLJkGEcZOSEzmxjwzrpIl
 qMLdRUjvflf5+PtFbES0Vi2koqPdjn9cmvMqNUEIaklhKnHmTt/wZOxWJQZww9jYk+BBAyIdYOe
 XQL+tX/uRa/P3DQ9GTRxhv8sN9QOan4jxmr8pdjKkAFDGRq1p3AdCNQCXu//KhI7yTz5nu8Oy+t
 D2jhq/R/RDbKwqr2yv8ulrKfgpRC8bsPuunkUot1AHLiJw7jwD5sUwXQBHKmKvmZFtIcScg0
X-Proofpoint-ORIG-GUID: Plr7BXmD-qzREmb5UT4fk4VdxqKr3XlF
X-Proofpoint-GUID: Plr7BXmD-qzREmb5UT4fk4VdxqKr3XlF
X-Authority-Analysis: v=2.4 cv=MpZS63ae c=1 sm=1 tr=0 ts=6875fcb4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=BU9ZYT7LreSM890-jg0A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 impostorscore=0 mlxscore=0 clxscore=1011 adultscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150062


On 7/15/2025 12:14 PM, Krzysztof Kozlowski wrote:
> On 15/07/2025 07:51, Vikash Garodia wrote:
>>
>> On 7/14/2025 8:46 PM, Krzysztof Kozlowski wrote:
>>> Bryan O'Donoghue reviews and applies patches for both Iris and Venus
>>> Qualcomm SoC video codecs (visible in git log as his Signed-off-by and
>>> in pull requests like [1]), so he is de facto the maintainer responsible
>>> for the code.  Reflect this actual state my changing his entry from
>>> reviewer to maintainer and moving the entry to alphabetical position by
>>> first name.
>>
>> NAK.
>>
>> The roles and responsibilities are well agreed by media maintainer(Hans), with
>> Bryan part of that discussion, w.r.t code contributions to iris and sending
>> patches to media tree. The only reason Bryan post the patches is that Hans wants
>> single PR for patches across Qualcomm media drivers (Camss/Videoss)
> 
> That's the maintainer role, so Bryan is the maintainer. I am documenting
> actual status and your NAK is naking what? That Bryan cannot handle patches?
I would say, you are reading too much into it, i updated what we have discussed
and agreed upon the different roles for managing venus and iris drivers.
> 
> Sorry, this is already happening.
> 
> Your push back here is odd, impolite and really disappointing. You
> actually should be happy that person outside wants to care about this
> driver...
> 
>> Hi Hans,
>>
>> Incase you would like to split sending PRs, as the contributions for Venus/Iris
>> would be significantly higher, let us know, we can pick that up separately.
> 
> Considering quality of the code you sent as Iris upstreaming, you are
> not there yet.
If you see the scope to improve the quality, you are always welcome to add
patches to improve it.

Regards,
Vikash
> 
> https://lore.kernel.org/all/1690550624-14642-1-git-send-email-quic_vgarodia@quicinc.com/
> 
> Please learn, read how the process works, what is the responsibility of
> maintainers first.
> 
> 
> Best regards,
> Krzysztof

