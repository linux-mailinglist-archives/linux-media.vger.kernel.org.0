Return-Path: <linux-media+bounces-23700-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E84639F64D9
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 12:27:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3452A161AD4
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 11:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE75D19F42C;
	Wed, 18 Dec 2024 11:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YYR9aHXJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5760E19CC0E;
	Wed, 18 Dec 2024 11:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734521231; cv=none; b=sZi9ye2kX5frLQD5O7nopnxnKgC34qItHrLxRfqJTL1Zp++qUa8W32ovnhJ8pfQKCN4hsN4a7zTZjw6TseutomWvLobi8OjYrRAO3sSGImDuihCv07XYfCx58o3LQBUORWGIvFmWtsG2k7hEqk1k/jd6mAj23LMMk5QABbIPHAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734521231; c=relaxed/simple;
	bh=UURFz+1y8P1BqHysxYusHurCyXBg2SPsk1AGkC4DwWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NtCtb0vatocAnimUKkID/uW+kpUF9t1WKpLACt6iLT+h5T3jWQL6qktWUzWDcmgvOMs9z2MFx5OvrTT597iMVn5w5TsMa4hfJjIk7VfeAWONe+Io+eQkPvAL5RF+D9Uy2IppH1fFQ87c/mTatMcAhH1PDDrR8VvoPJarZtJWiJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YYR9aHXJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI5CUbG013052;
	Wed, 18 Dec 2024 11:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qrJ3v4FR9berKozV6Q5uj4iuZChtJpJKDl4iOjVlIJk=; b=YYR9aHXJxgbfwJ+H
	PC185RTAbPVQCsNIi4QypjAALnKplXCDzUUdZ5rHBRbqYuEaxkXnvFUER8OpNHcG
	R7nY9VC+BIlNvXqcCUt4Vcw0X9WdGhDqvMffYosWt1NeWTbIKVxwp0bbqKAB8Cer
	elcmDFXfGYIG3+j4KcpCtQL1LZHZVEQnpfJqjN5aBN/SIvZEr+9SKYcDW9MIW96V
	+NpK4Xh1Jv+RODYFSKzDao2obSaxGraQMw/E1Cm0qPTi8sspOSvZSlUfLBC3bAkh
	S6eafTF7jD6O1R2IYcL5BwmdzeRHkXLK8GB4PkhvCP59t2zteHHb6U+X+CCS/kpM
	tkZwjQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kr1xrwa5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 11:27:03 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BIBR2ia025494
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 11:27:02 GMT
Received: from [10.231.216.103] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Dec
 2024 03:26:59 -0800
Message-ID: <b66f458c-a060-4c53-aa71-031eab55a524@quicinc.com>
Date: Wed, 18 Dec 2024 19:26:55 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for
 video GDSC's
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
        "Taniya Das
 (QUIC)" <quic_tdas@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        "Vikash Garodia (QUIC)"
	<quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <20241122-switch_gdsc_mode-v1-0-365f097ecbb0@quicinc.com>
 <20241122-switch_gdsc_mode-v1-1-365f097ecbb0@quicinc.com>
 <zhco37pigrp4fh5alqx4xfxx3xhjitqlgw552vwiijka22bt4u@sl4ngzypwh4x>
 <1d9aa2e7-d402-42dc-baa6-155f01b132ca@quicinc.com>
 <23ho25gl3iwyi2jspb6a2x5bv76fco5pkg2x5ct4gu3c44dbiq@yec6evx5sihm>
 <eec92088-edfb-4d0c-b81d-9d4f1d968b20@linaro.org>
 <b411489f9f2441f7a0f936127678e36b@quicinc.com>
 <CAA8EJpqYSujKXPFkdWcqRpOKZ+dJHQDkYM33Mt5JxuA=Mfs+WQ@mail.gmail.com>
 <7765000a0f87447e98d827dee5977ca7@quicinc.com>
 <rtmrsvtfukekss4cccnuxgzsm53er5mvgsfshx7xvdwn5vsio2@hgiowygrsmgd>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <rtmrsvtfukekss4cccnuxgzsm53er5mvgsfshx7xvdwn5vsio2@hgiowygrsmgd>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: J4Jxq2ua78srzKT7sM7t0cUavuifkrn_
X-Proofpoint-ORIG-GUID: J4Jxq2ua78srzKT7sM7t0cUavuifkrn_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 spamscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180092


On 11/26/2024 12:27 AM, Dmitry Baryshkov wrote:
> On Mon, Nov 25, 2024 at 03:14:27PM +0000, Renjiang Han (QUIC) wrote:
>> On Monday, November 25, 2024 9:55 PM, Dmitry Baryshkov wrote:
>>> On Mon, 25 Nov 2024 at 07:31, Renjiang Han (QUIC) <quic_renjiang@quicinc.com> wrote:
>>>> On Saturday, November 23, 2024 8:17 AM, Bryan O'Donoghue wrote:
>>>>> On 23/11/2024 00:05, Dmitry Baryshkov wrote:
>>>>>> This leaves sm7150, sm8150 and sm8450 untouched. Don't they also
>>>>>> need to use HW_CTRL_TRIGGER?
>>>>> I believe the correct list here is anything that is HFI_VERSION_4XX
>>>>> in
>>>>> You can't apply the second patch in this series without ensuring the
>>>>> clock controllers for sdm845 and sm7180
>>>>> grep HFI_VERSION_4XX drivers/media/platform/qcom/venus/core.c
>>>>> drivers/clk/qcom/videocc-sdm845.c
>>>>> drivers/clk/qcom/videocc-sc7180.c
>>>>> Hmm.. that's what this patch does, to be fair my other email was flippant.
>>>>> This is fine in general, once we can get some Tested-by: for it.
>>>>> That's my question - what platforms has this change been tested on ?
>>>>> I can do sdm845 but, we'll need to find someone with 7180 to verify IMO.
>>>> Thanks for your comment. We have run video case with these two patches on sc7180. The result is fine.
>>> A single case, a thorough tests, a mixture of suspend&resume while playing video cases?
>>> Also, can I please reiterate my question: sm7150, sm8150 and sm8450 ?
>>> Should they also be changed to use HW_CTRL_TRIGGER?
>>> Next question, sdm660, msm8996, msm8998: do they support HW_CTRL_TRIGGER?
>> Thanks for your review. The video playback and recording cases include video
>> pause and resume, and full video playback. The results are fine.
>> Also, this change is only for v4 core (HFI_VERSION_4XX ). Therefore, we have only tested it
>> on platforms using v4 core. We have not tried other platforms.
>> sm7150, sm8150 and sm8450 should not use venus v4 core. So they needn't to use HW_CTRL_TRIGGER.
> We don't have venus / iris support for those platforms at all.
> This patch is not about venus, it is about the clock drivers. So
> mentioning venus is quite useless here.
> If these platforms will benefit from HW_CTRL_TRIGGER, then we should
> change them at the same time, before somebody even gets venus/iris on
> them.
  Thanks for pointing it out. HW_CTRL_TRIGGER can be used for sm7150,
  sm8150 and sm8450. But this flag can't be used for sdm660, msm8996
  and msm8998. Because venus doesn't support it on these three
  platforms.

-- 
Best Regards,
Renjiang


