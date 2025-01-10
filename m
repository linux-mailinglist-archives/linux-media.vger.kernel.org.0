Return-Path: <linux-media+bounces-24575-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE02FA089DA
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 09:23:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA267188C954
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 08:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290C6208995;
	Fri, 10 Jan 2025 08:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VrAL+4ST"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1D6205E01;
	Fri, 10 Jan 2025 08:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736497342; cv=none; b=rS+zX5dA6uCPecUsjJDcKc/37ary6YufB35GC6e3nmr2sJ1PfB8OouifM9BxEJCS0reKyPi56P4WfE59pcCZEJBanMFhJpPTX9WfTFKBtaHueZytrjb+nhg9czT00PhdMJ3KantCANewSsDQGckvk7WIoy+MaFlbunJsR0VePYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736497342; c=relaxed/simple;
	bh=2QacisfZC77wH3nmwmgatCSXgiarASOgF95tC5xTLqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pYLX4G4vwdOPkhDlu63gwkDR4AoOMRgQ7SD5HLezhnqQGHUPBvt6500/MnlLzkD1+8PGqPlACVMMTHb70I3XE7br1gAK0+L5Lmr+hbRgrjmdj7d3CGuU4Hsewpea9Lc86GTncex8mc/9MrORSrxzhANa2QmBlG+OGEBIrlT9Njw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VrAL+4ST; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A2i7No018187;
	Fri, 10 Jan 2025 08:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0uPWMzQe26BjKrvpBxQ1DfCRGPTp4gTh6KZhjh7t+wk=; b=VrAL+4STtBHnU2Mi
	sPjuLGPJ3ThTH7GOvETVuQBScS8Ohjt3tolp9PgRgQuiPn7oQvxSreCbSVjCUmtL
	L3qCukhyY0E+zedayFj+UUugwrwYrrSuBz2K7oTb2dUab8f3e49MKYwBoizCRKX0
	6Y3LEvdCxco85qU/QcZ4CMUPRUfTB8fayde8xQotahhYzFAaydoVz5Qnn0LOCVHZ
	1Tlw0a7m7aBZqTfzTUdp6H8aOeCxyuyj3WBmaOYCefq1F/u7CV00ODqZnzkeGB3r
	nHfRlJI7U/tyjoq9c4cqSjGTTWeE7Rl3ytz3GSgRRzlsWd++nSCULGPzdjS6K9Ip
	/xiFtg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442u14gqh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 08:22:03 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50A8M2Cv017952
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 08:22:02 GMT
Received: from [10.231.216.103] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 Jan
 2025 00:21:59 -0800
Message-ID: <53082cad-a046-424a-ab05-67d34005131d@quicinc.com>
Date: Fri, 10 Jan 2025 16:21:57 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for
 video GDSC's
To: Bjorn Andersson <andersson@kernel.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        "Vikash Garodia" <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>
References: <20241223-switch_gdsc_mode-v2-0-eb5c96aee662@quicinc.com>
 <20241223-switch_gdsc_mode-v2-1-eb5c96aee662@quicinc.com>
 <szj4urqpxoek3y65ov6bavxqjsgs5nnu5o32e73z47mudelq4v@6fjbmm2h7pen>
 <7556a703-db1a-48f1-8546-e9acf91ca0c6@quicinc.com>
 <fmxvklw2fmt4akltrpw6v4wmmi6teu7rozz6tozr4hkos6io4s@4jp76l7xql3l>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <fmxvklw2fmt4akltrpw6v4wmmi6teu7rozz6tozr4hkos6io4s@4jp76l7xql3l>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: u1YZhsLFgM6TekFWozEZzxsKMONeSsnK
X-Proofpoint-GUID: u1YZhsLFgM6TekFWozEZzxsKMONeSsnK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100068


On 1/8/2025 12:41 PM, Bjorn Andersson wrote:
> On Thu, Jan 02, 2025 at 12:06:14PM +0800, Renjiang Han wrote:
>> On 12/26/2024 11:54 AM, Bjorn Andersson wrote:
>>>> The video driver will be using the newly introduced
>>>> dev_pm_genpd_set_hwmode() API to switch the video GDSC to HW and SW
>>>> control modes at runtime.
>>> "Will be using", does that imply then that if this patch is merged
>>> before (or without the venus patch) something unexpected will happen?
>>>
>>> Please clarify how you expect this to be merged, or clarify in the
>>> commit message that ordering is not of any concern.
>>>
>>> Regards,
>>> Bjorn
>>   Thanks for your comment. This patch series is to make the video driver
>>   to use dev_pm_genpd_set_hwmode() to switch GDSC mode. This patch and
>>   the venus driver patch need to be merged at the same time. Otherwise,
>>   the video will not work properly on these platforms.
>>
> The two patches are handled by different maintainers, of different
> subsystems and as such would not be expected to be merged together ever.
>
> If you have such requirements, it need to be made very clear to the
> maintainers that they will have to synchronize the effort.
>
>
> You're expected to always keep the tree "bisectable", i.e. the tree
> should function after each commit in the git history. Please clarify
> the best possible order here, and if the changes truly need to be merged
> in some specific order let's see if we can get Maruo's Acked-by and I
> could merge the pair through the clock tree.
>
> Regards,
> Bjorn

  Thanks for your explanation. The use of dev_pm_genpd_set_hwmode() depends
  on the HW_CTRL_TRIGGER flag, and the reading and writing of the
  WRAPPER_VCODEC0_MMCC_POWER_CONTROL and WRAPPER_VCODEC0_MMCC_POWER_STATUS
  registers depends on the HW_CTRL flag. Therefore, the clock patch and
  the venus driver patch need to be merged at the same time. Otherwise,
  the venus driver cannot work properly.

-- 
Best Regards,
Renjiang


