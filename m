Return-Path: <linux-media+bounces-61585-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONAjLgKTBWoxYwIAu9opvQ
	(envelope-from <linux-media+bounces-61585-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 11:16:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9C253FAB0
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 11:16:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D321304EA14
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 09:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6957638333C;
	Thu, 14 May 2026 09:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D7u33ClC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3JRD3PO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDD23839B6
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 09:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778750147; cv=none; b=R70y57A4RtmR9VjrxpSZyk+PEMhtk6F8PYc037AFzZoNyJ9KH9FG0zp5o1rgLCLyTC1MkLZGbo034L84gN2yt1pNvGG9y2wsptJmP7fc+9MMvO9GdKnVpiECLg/Rseg/5af1Nz8K6l1mvSfAcr8KY3Z7EPovogCR3cDzXqcrXZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778750147; c=relaxed/simple;
	bh=EMh4j++1f5WhXslOvJ4Ymu6NYRqvOpseCcxszIz8y0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qM7ImYd962cmtUsacOK1INIiidAHZrkPvJ3mfMUQe0BMcU6Rp2EcagsepRa1aV2yE7JbFCv7jb+78GNMN2nyDCRsshakkXKOVW/W1e/GtSs2AAAAjAO/1OWj8pEpFqBrDoMYX8Kd3qu7wPJ7jmN4scYhmmS3hAWnLv1ufSPqoCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D7u33ClC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3JRD3PO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E8XrsT2134362
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 09:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RydSWD30OpcHxZbKOrUFMI4Mbf4qnOtNKAlT2KF9B90=; b=D7u33ClCeisfK29n
	f/90B8OAj4z+WI+mnnwv3R84+i8xsdHQeKECVrZW660t1ed1UEG1+LL5Cx9GT0wM
	7sWVUgbXWq3GQ1krxsAZOQfULcES8d7DSzEv7xMHH8MXK6wniCEcGXN6xpJMnGS1
	noLrUey/aHDptkD2smhBhHMZPcBI+BAHKc/PQ+YTcrW6tSj2dftwxFTW30tMBSAS
	kwOh6eBDwoLBKawsAIZzLtxQcXc9COQpzJQJpxLHP9kRgVXuN3qVOM1toXcXwOpr
	y4i5p2Jj+mIymAcpSz9d9FlAF6Ra39r3E0XzacO77+FmQxY/5KGVxVVLkPcE9bFw
	R6eG+w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5b0br5j9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 09:15:45 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95cd22ec862so452428241.3
        for <linux-media@vger.kernel.org>; Thu, 14 May 2026 02:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778750145; x=1779354945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RydSWD30OpcHxZbKOrUFMI4Mbf4qnOtNKAlT2KF9B90=;
        b=B3JRD3PO9bVNtOAcDfL9MWJzxetqpFaMyhKppY2hTZYcVaJhV+E135ARj7o3bbY8CG
         v1qsPChkjJU/3PCrDrfpsQVq8hikZu3HWrbfBBEzzWBZUEK2UrHj045L26dCqGpLAoQN
         QNmfAG3pwGj9hK1r2WSs5e4L4rjNRwKMl2LJtCTD+fl7rjOMDUyxLHVeEAnrARxUaiz7
         qYVnxyik/gPEEbd57c4Acr4Wx6ddFH6Vm4rRW09bY2zFwtPR5LpLV3X2lO7zcMHr2051
         YyE8qyQ3Gk+JliFdBxiTfZHXO+1s8odLUHR/WE2PMosNHre/LO9E9/BkJOdDPlXf1aW2
         oc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778750145; x=1779354945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RydSWD30OpcHxZbKOrUFMI4Mbf4qnOtNKAlT2KF9B90=;
        b=d4sHw78EwxODa15U8py23onm+aORCK+P5C0YuLAp7GKyNhNykEm26q7AP7nvYVu2sU
         +EmNA8msybI82tc3KaUnMb5fc0JN+IHRl5SW2IJF9M2MtxUAVMfKyxGiflSl6xacp0aq
         j2hj+QWlJIaUBGHEBuw585TnTZYhfZro57NNmbVkc7bspNW2TqYipDd0gte1+Y4j9Z+1
         l580/671xTXsur7aJfGSavtaEmCaHC1GZLrgQkRS0suxDJKra2zgFwEK/pZ3hBCzQdlj
         kh8OnFZr0tYPgbbcioQMoDeUKMsZBX2iukymi/HxwCYZ5DnvEhBK728h+I53sDiYAuVd
         jf6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+l3IMgo8GHUZziyCLxTnioylEYQlA4NzK571xEMTyZpP+dMPKVexCSQGtLdMvBJN7pLYzomTVlAgvaRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzIULJhFMr06f97qysBLM8/aaWAGlUxvkVNF2z6HuNQua948cz
	0i747tYBMT8kgIkW9CTdDkDnbyo7EH5IIF9WODMfUE8ZMgFfG9XEIjduxV3qL5NDmZxnYjeLvrk
	G2ioaJp98o0SyedWmIHaP3qvRMor4dcbMcUkdHiZKI12fMoqt7/9ljOTZAylekK3QeQ==
X-Gm-Gg: Acq92OH8rW9OgXHGRhPhVpnxKnlV3YGscKEfnkoTP1yGN+43q6Ih/xBg7DfjHG/Wprj
	2Q/vu/Il49lC8EyhyBZ6Uu6wyms804GfzqoMnne45WshTWl9xD+IKQ1GgJSHT6Q2X5diekUZ3LR
	EPX0whLMQroJjcQ/cgrxptPCIHemwcjO8uiw7mefcVpUaNn/tUrK1NRajAIAZzOu3xl0EgyDaJo
	FUpR5rRIupgCXcc9Y0k+3bip+QKh+ct/vZSSWW/OshPMm70a+XcmSRAC6cas0EV7fRSv0W9jB4D
	lAZKluUfq8VddYnKPkWHejzn3o4/h1vF6bULKz7QRoYp9t+POXsdKOsY8JmlVA6kQgB3nZK8yEj
	fdMda78k9Ia++IR4GReRKBMa4N3XFm7UEdPGjf0mp9hEfo2pfDNwinRWuP6Ei2YWWfZZz3WrHfa
	ALEFi+2DqRAmWdnw==
X-Received: by 2002:a05:6102:3117:b0:632:5db8:f656 with SMTP id ada2fe7eead31-6377454e692mr1064123137.4.1778750144585;
        Thu, 14 May 2026 02:15:44 -0700 (PDT)
X-Received: by 2002:a05:6102:3117:b0:632:5db8:f656 with SMTP id ada2fe7eead31-6377454e692mr1064096137.4.1778750144145;
        Thu, 14 May 2026 02:15:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e21235sm66451166b.43.2026.05.14.02.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 02:15:43 -0700 (PDT)
Message-ID: <54abb8a1-e894-44cf-87d0-2341660b7ae1@oss.qualcomm.com>
Date: Thu, 14 May 2026 11:15:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/14] media: iris: Rename clock and power domain
 macros to use vcodec prefix
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-8-7fbb340c5dbd@oss.qualcomm.com>
 <6hr42ins65rf6ftdmme5lok6ham67piz3343kdwxaff2acktcz@oipdhket32og>
 <4eef8b17-47b5-e8f0-4a44-87fdf1d69d18@oss.qualcomm.com>
 <cyjxjidbe4qpeb5pwv6u5yqwhldqffenzgp6z4irgxkloturt6@buswzuou2w7z>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cyjxjidbe4qpeb5pwv6u5yqwhldqffenzgp6z4irgxkloturt6@buswzuou2w7z>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA5MSBTYWx0ZWRfX04ad1Hx6xwDN
 swNC262j1MJHESBZYqWkFWnxcKML8C634KK8RAofeGNjDMwo6PTWA3DSJ3IhXOl6S/WDyTM97D2
 d6EWd0kpXlPysJvBkYS1Eix527qfv4xhIeCzr98ihy6VM0vR4i4TyvxsBlVpvkwMgiZkz35oSGP
 MJOj+Q6oHxPUbvcV6bbPDvZfRhidSOkrB0MpyyZcTUgPNVh4/ix/VcfFRJlD+/GUBEq/4Somq0H
 VrfcJRn+nbP3HYjlItNYQuQwIW120rkIZ6fjli8bud8nh68EyCMZl9h35aht73xUI2W+xwuS5Jl
 u/zI9CpGaC8HcSdmbqMe88Irty7KZ7geyk2sHxAcca304p5iAqZKqy/7jDtVZdR+kHiJa5OPVG5
 qhce1NbpZRYzERyLoY0jnHgg/rAzRXdNAyU5D/iPJVdwn/dnWkf+0M0UKR7OQdLvp/wRTJ+DTnM
 2pSO977cygaEw9ZYy9Q==
X-Authority-Analysis: v=2.4 cv=b+2CJNGx c=1 sm=1 tr=0 ts=6a0592c1 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JLCR6Gb03Lu4_UV5QcsA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: Z5CEKHufIfeT8hdxUretL5QHOvNClBtw
X-Proofpoint-ORIG-GUID: Z5CEKHufIfeT8hdxUretL5QHOvNClBtw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140091
X-Rspamd-Queue-Id: 4C9C253FAB0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61585-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/13/26 3:47 PM, Dmitry Baryshkov wrote:
> On Sat, May 09, 2026 at 10:37:20PM +0530, Vishnu Reddy wrote:
>>
>> On 5/9/2026 1:52 AM, Dmitry Baryshkov wrote:
>>> On Sat, May 09, 2026 at 12:29:57AM +0530, Vishnu Reddy wrote:
>>>> The current clock and power domain enum names are too generic. Rename
>>>> them with a vcodec prefix to make the names more meaningful and to easily
>>>> accommodate vcodec1 enums for the secondary core for glymur platform.
>>>>
>>>> No functional changes intended.
>>>>
>>>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> ---

[...]

>>>>  	IRIS_CTRL_FREERUN_CLK,
>>>> -	IRIS_HW_FREERUN_CLK,
>>>> +	IRIS_VCODEC_FREERUN_CLK,
>>> Can we at least group them too?
>>>
>>>>  	IRIS_BSE_HW_CLK,
>>> Is BSE a core or a codec clock?
> 
> Unanswered

Is it the same BSE that requires a new clock on Purwa?

https://lore.kernel.org/linux-arm-msm/20260507-enable_iris_on_purwa-v6-2-48da505e23bf@oss.qualcomm.com/

Konrad

