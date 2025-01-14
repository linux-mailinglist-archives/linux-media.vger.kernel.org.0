Return-Path: <linux-media+bounces-24711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC45A10082
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 06:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C448A3A418B
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 05:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5953E233558;
	Tue, 14 Jan 2025 05:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Nsqf2mfV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512DA231C9A;
	Tue, 14 Jan 2025 05:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736833438; cv=none; b=R1AX1dFYmRX7MYHaeH4AGQrmpuBtoChDCrEDMFOwjosts2nfRix5NlTQhetxye/htD6zvpOvNTv23S6RleKHHr7Z4XExst2iqTo6HE2hvb0HX1t3DumiHQKR8mM4CTUb/bYl/jOZRa2NioES310lKzTsj7P9Fyc7ChoRuZveupA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736833438; c=relaxed/simple;
	bh=cKml3boNXhKJCjGfO8JR9YoQ53irun1W7520qjTwBOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Zm4E2OqRC8/cHDX1+3Tn2g7nzFiiGLbcEnFFkdjrT6hlXlKzmnuiF+2A0rKpw/FzJpUUnYLl13S0vyGJuv96kRHo0Bp3/ZNcRjaK0p/3+/IXzsMw8veCUiGnJoQ6oH9sI83sA3Pwt0aueojidAhtARzC2aTDG1MRbrX7WS6bPaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Nsqf2mfV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E2rh9b008675;
	Tue, 14 Jan 2025 05:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MF1jZiyP472C/WssSq3gta35NQX4excFFj4Sf23glEk=; b=Nsqf2mfVw/i2pksM
	Rxe2QUJ2jgb+0Jhgn2rmyGNmSVkPy++xvYf0mTcl/YyC4Z6twxazomgsbF2qF9b0
	3pBHsVHBPxEwnMA/lZx2nFKgORhOeKvYfdi0wYYavungHU90Ha9mawyGm8p6eAd8
	2DWb7ydgG9QmB+NVq2p4O82OK4YeD39FYB+HOnSL9VqWwHqYyPrteCh79/Nfg/Ao
	qkIN28tFaoJwZUNjrtjwdHNq2JTd3LOqouDxv1zx01/lJNHBPydlPv7ydH//uRAy
	nKHRsC2X1+yLl0MM+qiQxb3aTNcvjt9+LVx9U3OLkxtuCuNcGADWNi3CxUpiyYqt
	WlEkJw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445fhtra24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 05:43:52 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50E5hpZU027485
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 05:43:51 GMT
Received: from [10.231.216.103] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 Jan
 2025 21:43:48 -0800
Message-ID: <812bd104-8661-456a-ae0f-56942bb5d4f4@quicinc.com>
Date: Tue, 14 Jan 2025 13:43:46 +0800
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
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JqtM465CDXbRWceQ9Jok7dZrbAXAJ7JO
X-Proofpoint-ORIG-GUID: JqtM465CDXbRWceQ9Jok7dZrbAXAJ7JO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501140045


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
  Thank you for your reminder. As we synced offline, this patch series
  needs to be merged into the same release. If only the clock patch or
  the venus driver patch is merged, it will cause the venus driver to
  not work properly, but will not affect other functions of the system.

-- 
Best Regards,
Renjiang


