Return-Path: <linux-media+bounces-24201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E87249FF5EB
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 05:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D2AC3A2262
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 04:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6EE1145B24;
	Thu,  2 Jan 2025 04:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Gylwqm7X"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACF613C9B8;
	Thu,  2 Jan 2025 04:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735790787; cv=none; b=JbLduQYCEBZGeIpY8jKYkMLdav4I7iRkIpdA2PrZQwM4xYMxr8cc6NkSMlgTQVI/BXI0EFPqk5Dhp7sVLOx1bRVi11d+EUQ3pBv4jKE/o8SItre6pA0SC39A+Vw8hPY5QEbn4iYclkxFPRdYT/jf7Zyg+JAOYMQaI/2g8ShFnA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735790787; c=relaxed/simple;
	bh=6pZwTbcRg3swdCbZo7qFi7R+MD2xATsXf+FGW2fh/R8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=P+mXcb4sF6jjLqOzErXzBy98MIYLKvaowRsd7Lfrhf8rA3bcVRMfIRj4iQnH3RyNZ11tl1lnU5pCfsK8fLIghCA2peFN8ybXld48HH8ISJMhzOACQs7kI0vv4dyJEQU3leAT9fKouKto6bb0s/BNopA+UUrBROx/b4ZSCh6cb9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Gylwqm7X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 501Nqf46028363;
	Thu, 2 Jan 2025 04:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DyqTskAtcg9jUYySn6MKxX0RIGCtMAOnwj+KHtjz+3Y=; b=Gylwqm7XTiMAKFYf
	9jmVlwC6A1Ke73B4cNEcAF4grWZHT54X2PViH6yIt/WjjqsNWwNPwG64awIBEbQn
	3NcmnWFdxNGKeorZux++nkXeFppSy9ZQQlG8o8uIHlE5u2Z9xa5y4qrCbJeB4Gf6
	ap3bG/1bdxNDDBFPVQgYcXWEHXd9LklL8W0vWDxNUOJFAOm6LZRGerF4kqc7KseR
	RyBeRSt/fIuSeiYVu38FZmtZhecpXwdinZboj2xz2vBRLq+SWP3Mz3ttEU1fWbWC
	r3aaeQ1gFvZSHEwcSZ7bCSBvT7HLqQ+C1BFefpElHT82d40NIvG9nR+wyh6fMTWs
	FDkpXQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43w6xagwgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 04:06:20 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50246JZG002507
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 Jan 2025 04:06:19 GMT
Received: from [10.231.216.103] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 1 Jan 2025
 20:06:16 -0800
Message-ID: <7556a703-db1a-48f1-8546-e9acf91ca0c6@quicinc.com>
Date: Thu, 2 Jan 2025 12:06:14 +0800
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
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <szj4urqpxoek3y65ov6bavxqjsgs5nnu5o32e73z47mudelq4v@6fjbmm2h7pen>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HVktSHTdi00R2-Vl8coqx9ht1PTJyEh6
X-Proofpoint-ORIG-GUID: HVktSHTdi00R2-Vl8coqx9ht1PTJyEh6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 mlxlogscore=996 mlxscore=0 spamscore=0 phishscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501020032


On 12/26/2024 11:54 AM, Bjorn Andersson wrote:
>> The video driver will be using the newly introduced
>> dev_pm_genpd_set_hwmode() API to switch the video GDSC to HW and SW
>> control modes at runtime.
> "Will be using", does that imply then that if this patch is merged
> before (or without the venus patch) something unexpected will happen?
>
> Please clarify how you expect this to be merged, or clarify in the
> commit message that ordering is not of any concern.
>
> Regards,
> Bjorn
  Thanks for your comment. This patch series is to make the video driver
  to use dev_pm_genpd_set_hwmode() to switch GDSC mode. This patch and
  the venus driver patch need to be merged at the same time. Otherwise,
  the video will not work properly on these platforms.

-- 
Best Regards,
Renjiang


