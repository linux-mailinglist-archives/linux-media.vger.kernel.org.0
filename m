Return-Path: <linux-media+bounces-19378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E81999AD4
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 04:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 571C01C21CFE
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 02:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282691F473E;
	Fri, 11 Oct 2024 02:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H1Ua1Ae0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEFF1F4721;
	Fri, 11 Oct 2024 02:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728615466; cv=none; b=TWviOoOYNtPl2mTVJE7o8tyZo2yWIN1ZxyCpcfWM34zAoNfikiWzUQAwM1pmKki09Jtut3jlv4I00ryXUK+N7C6U0Adsp2pCKC9UYMCKmQCvW7XkWMG4/b0OLtpIIKAe1L6Z2lepGxQ3MDfxIQrd7GX18nacp76XN9/zB8ezn6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728615466; c=relaxed/simple;
	bh=i/j8QwwufsvmoQqSrcoj05rqp6XNTeAR1RYfp5/3Ryk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=P1ZI4TGLIPZoS14SUPZbnVpe1UKR6X0wYUDRdr+QCdiuLM3pNio+7E+20P0lzavA9TTH0MhaXVfjpqcl4wNzbBa++WCXWrepJkhG5EsQJ0lrK0dYxAx3uvAwlzvvdy/TPz3pb+Q5LSFPyfz7lOB3koSlu9wR7KEzSywHlE8bMO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H1Ua1Ae0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B1Hf0K005437;
	Fri, 11 Oct 2024 02:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+updjsBw4m+RSE17kOknAf4fPZ4jAdTCy2FSnqjk5lU=; b=H1Ua1Ae09jvgnZid
	5ZeRl5fkXPs9MYKr/h6ZG+6d/eFP60l6CDUFw9hSefRJxZfp2jxX301d6y0/lep5
	Lwl0dxiH8gRgqVIQ9bVRUw9eNgMvtG6KYSnv4JOClEctQbkoZZadzE+JJuxPmEWI
	VAH1TBB2sWCHJSBjKeXe8uxSFmG1sP3w3Lo/AAzpfReYax9TcXqKvNc5SIrWA+N/
	zNMVfWBQOwy5xypgK5aCyAHNpTLkIPT52KDENwB/UFsv85NGUpzd9nI7Od9PgWqo
	bamrHBsBhtEggTBZlfSjMdi218nQ0wjKPe3AW4egQ0bma+YhThpPEqd1z+qwlHbT
	UfCttg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426t7sr602-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 02:57:30 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49B2vTj6006525
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 02:57:29 GMT
Received: from [10.253.78.250] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 10 Oct
 2024 19:57:25 -0700
Message-ID: <c6c5068d-ed05-4b49-97e1-f4962839cf44@quicinc.com>
Date: Fri, 11 Oct 2024 10:57:22 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <linux-kernel@vger.kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>, <quic_vgarodia@quicinc.com>,
        <stanimir.k.varbanov@gmail.com>, <kvalo@kernel.org>,
        <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>
References: <20241010132902.2882939-1-quic_miaoqing@quicinc.com>
 <asvhh4kzq6s6yz3wrqfmuolcnlonoobogoh45pnq4zdr44lpxs@zgarzpduk2sk>
 <cc8358b1-2442-4a40-8eb3-0912423db554@quicinc.com>
 <3giotvkrwailt75gndhup7xhqvlc3vdowdoypi5vaeebuojp45@vkqxbtjsbksf>
Content-Language: en-US
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
In-Reply-To: <3giotvkrwailt75gndhup7xhqvlc3vdowdoypi5vaeebuojp45@vkqxbtjsbksf>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3ny5XeZeQSbTwTeYGSh1bxG09vMA8IPf
X-Proofpoint-ORIG-GUID: 3ny5XeZeQSbTwTeYGSh1bxG09vMA8IPf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410110016



On 10/10/2024 10:40 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 10, 2024 at 09:59:11PM GMT, Miaoqing Pan wrote:
>>
>>
>> On 10/10/2024 9:47 PM, Dmitry Baryshkov wrote:
>>> On Thu, Oct 10, 2024 at 09:29:02PM GMT, Miaoqing Pan wrote:
>>>> Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
>>>> board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
>>>>
>>>> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
>>>> ---
>>>> v2:
>>>>     - fix wcn6855-pmu compatible to "qcom,wcn6855-pmu".
>>>>     - relocate pcieport0 node in alphabetical order.
>>>> v3:
>>>>     - add 'qcom,ath11k-calibration-variant = "SA8775P"'.
>>>> v4:
>>>>     - update 'ath11k-calibration-variant' to "Ride".
>>>
>>> What exactly is Ride? Is there just one Ride board? I thought it's a
>>> board family name.
>>
>> I just follow the existing boards, 'Ride' is a board name. Both 'Ride' and
>> 'Ride r3' boards are attached with WCN6855 WLAN chip.
>>
>> arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts:1112:
>> qcom,ath11k-calibration-variant = "Fairphone_5";
>> arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts:958:
>> qcom,ath11k-calibration-variant = "SHIFTphone_8";
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts:879:	
>> qcom,ath11k-calibration-variant = "LE_X13S";
> 
> There definitely are other Ride boards. I see patches related to
> qcs8300-ride. Does that board use the same BDF file?  If not,
> Qualcomm_SA8775P_Ride or QC_SA8775P_Ride sounds like a better approach.
> 

QCS8300 and SA8775P both use the same WiFi card, so the same BDF file 
will be used. The extra variant will increase the size of board-2.bin.

Anyway, the calibration variant is no other side effects.

>>>
>>> Also, could you please extend the commit message with messages from the
>>> ath11k driver, showing the chip_id / board_id ?
>>
>> The board-id is non 0xff, do you still think we need to add
>> 'qcom,ath11k-calibration-variant', following is the WLAN chip board data
>> info,
>>
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=519.bin
> 
> I'd ask Kalle / Jeff to answer this question. Are we sure that this
> board-id won't be reused by any else device?
> 


