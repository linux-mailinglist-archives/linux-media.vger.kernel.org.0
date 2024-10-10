Return-Path: <linux-media+bounces-19349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85817998885
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 15:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B62F01C23494
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 13:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F7391CB301;
	Thu, 10 Oct 2024 13:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B1QPmk0X"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F227E1C9DE9;
	Thu, 10 Oct 2024 13:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728568769; cv=none; b=kNpQ/nBTPP8OjgnyTJVtaAkXKhCLmd9sA7oiRx0Xp2n3N7UjancsNdDvOXuAXtcbVNXXOEoegRTwiV3Fne60hqrjOH665VVJ6ZXIJxYR28akwh7fgeZsSy0i2flKmfz+ceHOSELP+WIneejfUICbBTvsW5RcuIA8mSGa9dxJ36U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728568769; c=relaxed/simple;
	bh=b5RJJ/2p4DswbtFozsrCP+8KWDRP+JMa+yKKq1M8a1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YzW4G+bgy1yDBiP4dwy7FkHFOtLSX1OCw5tPlUKVFDzSxhglcBKfxB6RiLUi190bW3SOFWKD2jZkXnypMHiwh9283C0+6MUYNCDHluXtNILkpxNYvWFZS2hHzdbH8lUVfXE2dkYGxH6c2Ue0mgm0wgWbWkUigCwxO2DgW669ob0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B1QPmk0X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AD97w5027261;
	Thu, 10 Oct 2024 13:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RGCbsWz8gy5tgRPuE2BxLsuuYVUl/Jo8Eu25qDm/xJc=; b=B1QPmk0XDQiTgZ8z
	5GYTXpB4H9UZ4Nbuvz/pVw98DICT5BtOb024T65OLLirC4FoIIj9AZUtg3nuKg+a
	v8nBnAjAicHUj+2eV6u3KH/1Hp6SVwP4WqDQ1Sv9+axOfD7D+tKE2A+iV7zZqExD
	QK0fhRkTE7OaFTMnpe8QfzLL1qFnVk/7nWDYeqv+rc0wqV7+d4EhVCzUiAZrNLwh
	KMUmn4V/x2dWc46cgYYI/SYntNI84BioVIkt3uPhFQhP25tL4FuXz4kdD7ckca2M
	saWAPJGWJhIPZyQbXpTHDb7WKRK/q7uF5MbcADCNdfhFq0stxZwQ+UpFonUyNKWW
	zdyfoQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426fj6r3y2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 13:59:19 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49ADxH3b011696
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 13:59:17 GMT
Received: from [10.253.78.250] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 10 Oct
 2024 06:59:14 -0700
Message-ID: <cc8358b1-2442-4a40-8eb3-0912423db554@quicinc.com>
Date: Thu, 10 Oct 2024 21:59:11 +0800
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
Content-Language: en-US
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
In-Reply-To: <asvhh4kzq6s6yz3wrqfmuolcnlonoobogoh45pnq4zdr44lpxs@zgarzpduk2sk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WBP-2xQxWo_SKbY-ADLvmGaXaqApDdrQ
X-Proofpoint-ORIG-GUID: WBP-2xQxWo_SKbY-ADLvmGaXaqApDdrQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410100093



On 10/10/2024 9:47 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 10, 2024 at 09:29:02PM GMT, Miaoqing Pan wrote:
>> Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
>> board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
>>
>> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
>> ---
>> v2:
>>    - fix wcn6855-pmu compatible to "qcom,wcn6855-pmu".
>>    - relocate pcieport0 node in alphabetical order.
>> v3:
>>    - add 'qcom,ath11k-calibration-variant = "SA8775P"'.
>> v4:
>>    - update 'ath11k-calibration-variant' to "Ride".
> 
> What exactly is Ride? Is there just one Ride board? I thought it's a
> board family name.

I just follow the existing boards, 'Ride' is a board name. Both 'Ride' 
and 'Ride r3' boards are attached with WCN6855 WLAN chip.

arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts:1112: 
qcom,ath11k-calibration-variant = "Fairphone_5";
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts:958: 
qcom,ath11k-calibration-variant = "SHIFTphone_8";
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts:879:	 
qcom,ath11k-calibration-variant = "LE_X13S";

> 
> Also, could you please extend the commit message with messages from the
> ath11k driver, showing the chip_id / board_id ?

The board-id is non 0xff, do you still think we need to add 
'qcom,ath11k-calibration-variant', following is the WLAN chip board data 
info,

bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=519.bin




