Return-Path: <linux-media+bounces-24863-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A661EA148D3
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 05:19:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD078188D3AD
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 04:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B36A1F707C;
	Fri, 17 Jan 2025 04:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fHVyaP8f"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DB88C11;
	Fri, 17 Jan 2025 04:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737087568; cv=none; b=ShRoTzFuHHEqbm8h40m8Nlj5iMHCgaohtEFmAxtuT+D5ARZOFhlgBCNPdyAupYOuuI3Ghv8eAwodpMwvY4jpol63CGHeBfj4owb66EpNAvFnWUBWZepbPE6wJZJ1LtZ0oX2OwAOy7Vl/j/OujLACo3iH3bFByEVltwMaBXAs8wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737087568; c=relaxed/simple;
	bh=tcYuEPSKRCDOaAfEM4RsAb/aFOItACt4qYonsbGh0tw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cLC62ix35iFVb2dbS4iSqzxVx3y8kEdQAABAWv1WaeTnRbnIadMzp0NiZ9mEP+iEtjfcRELOfDg9dXEyI8yTN79xt4nKxwI7qjVeatfXSD1z/EbL5osibvZIN4F0MBJzRiM5CR/F+JsukelZWvhI2EnNIF6TSc8xqFnnVimNnnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fHVyaP8f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50H2RfhO029937;
	Fri, 17 Jan 2025 04:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l2Gf2lqgRpvXBvObpk3qN9rn65jdML/GqNCByWAgmIs=; b=fHVyaP8f8bEBtYlB
	BDR6JJeDNaKp0o4JR/Hcg1aBfjzIrxuA0P/taCsLmi4q+N0nNHaxCGf18J6WTu6Z
	WZHXnjrv1x9esKgQOnNJRMPw6apAQF5j7CgVXgmQviVnxOmd+/kMw6Yha4KckAAS
	d4gF6Lm2bsLjjiuWx8mVjgt/krJMzhc+vjEskjdsM2Nw2Yph4cew+CfQhi0tBzPO
	h/AIXJ3eNXnuImgY+pXaZ8ZnxckTWSbNp+981HXXauG4JofDxKgy9qw89FlrLSzP
	rgpe4X71WOdBhx/rzx/QpbZc6nmiSWkEvvKAxRB/Ku/Ae4z6An1z+2h2UxxJhBBw
	GVwE5g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 447eemr6nu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 04:19:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50H4JLAI004168
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 04:19:21 GMT
Received: from [10.231.216.103] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 16 Jan
 2025 20:19:18 -0800
Message-ID: <a359ae5c-863e-4cad-a2a9-b2dc4f162e6e@quicinc.com>
Date: Fri, 17 Jan 2025 12:19:16 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] venus: pm_helpers: Use dev_pm_genpd_set_hwmode to
 switch GDSC mode on V4
To: Bjorn Andersson <andersson@kernel.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        "Vikash Garodia" <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
References: <20250115-switch_gdsc_mode-v3-0-9a24d2fd724c@quicinc.com>
 <20250115-switch_gdsc_mode-v3-2-9a24d2fd724c@quicinc.com>
 <8322416c-5762-4b64-80aa-7ef1b0b0287c@linaro.org>
 <hlre46s5jz7kro34w5ah3pvxvkdnplukoiubkptx6oeepdx2ox@mh6geaqspa6l>
 <lo2zma6ch6av3obo4mj5hpua6hpi4dn6fl5cjnmwpplu66v6mf@nkfegdca5mzu>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <lo2zma6ch6av3obo4mj5hpua6hpi4dn6fl5cjnmwpplu66v6mf@nkfegdca5mzu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mQaXxrQ3mFkmFOv6nA_QLVWzLgzits7Q
X-Proofpoint-ORIG-GUID: mQaXxrQ3mFkmFOv6nA_QLVWzLgzits7Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_01,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501170030


On 1/16/2025 4:36 AM, Bjorn Andersson wrote:
> On Wed, Jan 15, 2025 at 02:22:11PM -0600, Bjorn Andersson wrote:
>> On Wed, Jan 15, 2025 at 12:02:31PM +0000, Bryan O'Donoghue wrote:
>>> On 15/01/2025 09:30, Renjiang Han wrote:
>>>> The POWER_CONTROL register addresses are not constant and can vary across
>>>> the variants. Also as per the HW recommendation, the GDSC mode switching
>>>> needs to be controlled from respective GDSC register and this is a uniform
>>>> approach across all the targets. Hence use dev_pm_genpd_set_hwmode() API
>>>> which controls GDSC mode switching using its respective GDSC register.
>>> This paragraph is difficult to read and understand. Try something a bit more
>>> like "Use dev_pm_genpd_set_hwmode() API to control GDSC mode switching. Do
>>> that because of reason x, y z"
>> No, follow https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
>>
>> It says "describe your problem, then describe your solution". "Use "
>> isn't a good start of any problem description that I can think of.
>>
> But just to clarify, I have no concern with your request for
> improvements to the description of the problem being addressed.
>
> Regards,
> Bjorn
Thanks Bjorn and Bryan. I'll update this message.

-- 
Best Regards,
Renjiang


