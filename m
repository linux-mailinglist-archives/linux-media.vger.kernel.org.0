Return-Path: <linux-media+bounces-24862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91716A148CD
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 05:17:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C28D3AA186
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 04:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E711F7064;
	Fri, 17 Jan 2025 04:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oRs2hmVQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9B025A658;
	Fri, 17 Jan 2025 04:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737087454; cv=none; b=PYsvsQVt+yC7kBEI5wQsmg9Wa7U8Edb2V7ZxGQfvIO48Iv4QL8oKbMHdyhxuoplLvQAM5DlgEW4d7BZuL5h8APEtanyOiWAOangvM338tZTJtXzX+6lI64OVFWkP++YZw4DdXHBLtZRmOCzQvGwpYizuA00/Qplbzd7esd+E5FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737087454; c=relaxed/simple;
	bh=yzue25IEXf1TWngdH4U4smqYxDbnNMGfOI3ipgV2N6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RdzSxrm0HaMlWtQNYVT1QnMVt14udREkjPRi/TcElw66pvGH+jjxNrfrnqPoI6joHQW9NWmP70GA4l2uAnFQ92cHKVMnkSYSm5N10+mlvx75FxKJzoF4fqBp2R4Wtf11pQD/g0QYPO7Xs1wb0m6jmYtXaG0qRAxRWl3SAepgX84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oRs2hmVQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GDrnbR032124;
	Fri, 17 Jan 2025 04:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ls5ZAktPZsnT2He5+vSxvZ2Gy6ql9hfVSVdncmzZfUo=; b=oRs2hmVQKJ/QBN53
	JxoZJUikC1VHE0jgAc1VUBcSKg91RJ+YltXvDJRXuVlZQe9aLSxPwQhKp72wQuZc
	ug1FyHaZga22VwpoHfkm6nw0SuuKYpM5OaEpYaBWfIzWAUwyKsQBsrUVskZdcmst
	D2jp2BraHX/zAEgmh2B2UywXcIP9Yc+GOLsAJPRfAsTLBVztRVICXlA7Eqar3l3X
	XNwhkGWD86h68XHxF6fYaK/kM4hN2n165hoiBLZZ2oFkZbR/ddjhfNEUet2ypjJ3
	mfhNzdHw18L2vV44RuJgNGw1R057rnPDdExBX0HGYe2bKLsvkLjaB2NzHaCulqX1
	d9QUXw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4473d7hrxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 04:17:28 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50H4HR3p002045
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 04:17:27 GMT
Received: from [10.231.216.103] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 16 Jan
 2025 20:17:23 -0800
Message-ID: <00449451-d97f-47fe-b0ab-cddb9d2b0e93@quicinc.com>
Date: Fri, 17 Jan 2025 12:17:21 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Use APIs in gdsc genpd to switch gdsc mode for
 venus v4 core
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
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <bkjthw5osu5dkwpr46zanwyfqquo45gaivlojqp6n7ixwbdnua@3t3ap2yor5z4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5A0L9yaa_Wq-50YKL1a85jAaUxt2_fTW
X-Proofpoint-GUID: 5A0L9yaa_Wq-50YKL1a85jAaUxt2_fTW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_01,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=625 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501170030


On 1/15/2025 5:59 PM, Dmitry Baryshkov wrote:
>> If only the clock patch or the venus driver patch is merged, the venus
>> driver will not work properly. Although it does not affect other system
>> functions, it is still recommended to wait until both the clock patch
>> and the venus driver patch are reviewed and passed, and then merge them
>> into the same release by their respective maintainers.
> NO! This will not work, as both -media and arm-soc branches will be
> broken. Please read about the git-bisect before making such suggestions.
>
> A proper plan would be:
> - implement a function which allows one to check that hwmode is
>    supported by the genpd driver
> - Change Venus to use hwmode for those platforms if it is enabled
> - Enable HWMODE support in the clock driver. Clearly identify that this
>    patch should be merged together and after Venus changes if all
>    maintainers agree with that
> - Clean up now-dead code.
>
> Doing it in any other way would result in the broken kernels.
  Thanks for your comment. dev_pm_genpd_set_hwmode() has a check function.
  So I think I can do it like this to add compatibility in venus driver:
  - 1. the dev_pm_genpd_set_hwmode() is used to switch the GDSC mode by
  default.
  - 2. If it fails and dev_pm_genpd_set_hwmode() returns -EOPNOTSUPP, it
  means that the clock driver uses the HW_CTRL flag. At this time, the
  GDSC mode is switched by writing the POWER_CONTROL register.

  In addition, the merged code needs to follow this order.
  - 1. Add compatibility in venus driver.
  - 2. Use the HW_CTRL_TRIGGER flag in clock driver
  - 3. Remove the dead code in venus driver.

-- 
Best Regards,
Renjiang


