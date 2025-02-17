Return-Path: <linux-media+bounces-26209-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F21A37FCF
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 11:19:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFF901893DC0
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 10:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28438215F5F;
	Mon, 17 Feb 2025 10:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ToDPQVtt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EE31DE2CC;
	Mon, 17 Feb 2025 10:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739787385; cv=none; b=ArOEQqFYmu7X9XTzT7+W90jCIw8kB0UyfucpC9jW0NFq3gOVmOovDy4kAdbPGvV4BuzOcuwEckHqLtIrr8yNzeRx12P3MFvXRU+dz47IcA7ebohUIpOcfRvyoKUJG1OLy96x572e0NAAtQSJGzgHZQOb6tr63RIrcvTg3r0Y32o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739787385; c=relaxed/simple;
	bh=EepYzkCHB0rsnka4KljNMJk8FzzQcmIUFi+FBoSl4qE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=QfqbybrEs/iYJ5A06GS7oMMlbPtyBMnIX0FtBE1nezTP9C6+QQt0t87DnwRtb2dEno779VdRn6NEmdAmUxWHjII0Cr+nx5y54ngncdN9RrxO6X4POZNerU68Iu8MCmsgvCB8JufgznaL5Msjiz8Z8ZtmGC1QZGcX1hOheWcTPW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ToDPQVtt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H02t8J026647;
	Mon, 17 Feb 2025 10:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WyWuVGSGYphL0Y244NpcdJRuqh/Em99Ndt8snuKmv/Q=; b=ToDPQVttdKVMJrGI
	mwKBrX60Kly312gRPCUvheid6d6nDsJY5OmDusWknJW+S3+3MBw3bMHMnLDNR1C8
	gJNMJ4VC1ALiYQowtzXS0POUvciK1n1Ul1XSEAh3Xv9c41M8XiXnWBBxdOpL8sq+
	ligSncZYJ7Pu8x+vaY4+nlxUy+1/faHTySAn/TJW7pLJH2uVtyiOkMS9f6BAJOgv
	Y60fHn6pKBYVtEo5dEUWqduiqUiDSBZIpy6slayD/kGT3zI5Y1WOxmoBM6UGtEFJ
	Zo71VSMiaKAl+iLUVizi+n6nwNMW/qXU94R4zUsZidp9zULdoXIHItzq6BuSZ2nx
	02ifng==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7sha6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 10:16:19 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51HAGIRl009198
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 10:16:18 GMT
Received: from [10.231.216.103] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Feb
 2025 02:16:15 -0800
Message-ID: <dbeace93-ed19-4719-a72e-53be8999b0b3@quicinc.com>
Date: Mon, 17 Feb 2025 18:15:30 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Use APIs in gdsc genpd to switch gdsc mode for
 venus v4 core
From: Renjiang Han <quic_renjiang@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
References: <20250115-switch_gdsc_mode-v3-0-9a24d2fd724c@quicinc.com>
 <bkjthw5osu5dkwpr46zanwyfqquo45gaivlojqp6n7ixwbdnua@3t3ap2yor5z4>
 <00449451-d97f-47fe-b0ab-cddb9d2b0e93@quicinc.com>
Content-Language: en-US
In-Reply-To: <00449451-d97f-47fe-b0ab-cddb9d2b0e93@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lPtMAZwyvINoLSY2k07M5JjZq5dSjKo5
X-Proofpoint-ORIG-GUID: lPtMAZwyvINoLSY2k07M5JjZq5dSjKo5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_05,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=843 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170090


On 1/17/2025 12:17 PM, Renjiang Han wrote:
>
> On 1/15/2025 5:59 PM, Dmitry Baryshkov wrote:
>>> If only the clock patch or the venus driver patch is merged, the venus
>>> driver will not work properly. Although it does not affect other system
>>> functions, it is still recommended to wait until both the clock patch
>>> and the venus driver patch are reviewed and passed, and then merge them
>>> into the same release by their respective maintainers.
>> NO! This will not work, as both -media and arm-soc branches will be
>> broken. Please read about the git-bisect before making such suggestions.
>>
>> A proper plan would be:
>> - implement a function which allows one to check that hwmode is
>>    supported by the genpd driver
>> - Change Venus to use hwmode for those platforms if it is enabled
>> - Enable HWMODE support in the clock driver. Clearly identify that this
>>    patch should be merged together and after Venus changes if all
>>    maintainers agree with that
>> - Clean up now-dead code.
>>
>> Doing it in any other way would result in the broken kernels.
>  Thanks for your comment. dev_pm_genpd_set_hwmode() has a check function.
>  So I think I can do it like this to add compatibility in venus driver:
>  - 1. the dev_pm_genpd_set_hwmode() is used to switch the GDSC mode by
>  default.
>  - 2. If it fails and dev_pm_genpd_set_hwmode() returns -EOPNOTSUPP, it
>  means that the clock driver uses the HW_CTRL flag. At this time, the
>  GDSC mode is switched by writing the POWER_CONTROL register.
>
>  In addition, the merged code needs to follow this order.
>  - 1. Add compatibility in venus driver.
>  - 2. Use the HW_CTRL_TRIGGER flag in clock driver
>  - 3. Remove the dead code in venus driver.
>
  As internal discussion, in order to merge the patches in the correct order, we
  plan to submit two patch series.
  One patch series uses dev_pm_genpd_set_hwmode() to check if hwmode is supported,
  and the venus driver is compatible with the two methods of switching GDSC mode.
  Then the clock driver enables hwmode.
  The other patch series will clean up the dead code.
  Do you agree to submit two patch series or one?

-- 
Best Regards,
Renjiang


