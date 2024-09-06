Return-Path: <linux-media+bounces-17723-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D9696E6BA
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 02:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C75CCB23A20
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 00:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE69D2FF;
	Fri,  6 Sep 2024 00:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MaakXBQ6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD372F32;
	Fri,  6 Sep 2024 00:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725581979; cv=none; b=cuXRoSjQzPRcro4Y2cCseJR06sVY++8HxzbVYEriCz0mXhBdW9HMJCI1FHHlJQTtwHSGV5FTY48fTGTjzQ4Bw7h0Xb9EthCjV7UUmY898MlWh4VoDGTRMiytlBtrUDvEMAaIIWng/zcoSEphyCKyNMtjE4puywbWeNeoiiAGrTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725581979; c=relaxed/simple;
	bh=DApWteau5L6e7Nfm/JUijj4CIhQSNjmJ6cu/FjlbURk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HJFa6Ov0oJAE8D/vHYvQLrxl2Ja16ol4uUaH18tx6qfE1beNX3zsuvDdMPMX4kzekCh4Foa0IyJDV1bZa5osiRwCKiAQRpBzZkHgarPSiNBegdJpm/chlSLFGHGtaHeZigOATpuibCiocUbzz0T/oyH9M+Ojis3viMwlxTqrAyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MaakXBQ6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485IQ16d019686;
	Fri, 6 Sep 2024 00:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fif+WdWuY0TPK05I2EWfRBaK9MDCbSukT+BvyfFoqoQ=; b=MaakXBQ6TrpP4DdT
	TMsdZVHeb5HX0HsNDogkAh+1bGZgw7qopVhYVXphKQL5Qx7k4xPsNQSpEbOgoi8v
	i5TuuvCtB9Rsd58f7WXpVkaXV0qVS3vnDecG+ke+0sSHpprRvmNqpmBzcRdMBsMd
	C1eP27TCFsy1LVJF8HIxt+NkGcI73n3tSWPLgbNs8r49lcZuSM/EiTb/fW7omWxM
	OcnjDCd4SqYZq+ObirH1cRE7F7zMOIUeH7kjmY8D38UDPigx2MiRvgZtdjfwQm0G
	GrGI8QUaEn+XubK++XXnrlIG/esm3R/DPQsiIxQk5bGaXBSL+Pd8fxMEhtMES3he
	TG6y+A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwu0kaw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 00:19:33 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4860JXiQ005676
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Sep 2024 00:19:33 GMT
Received: from [10.231.216.207] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 17:19:30 -0700
Message-ID: <87a1a50f-f485-4a4f-91fc-34fa19312519@quicinc.com>
Date: Fri, 6 Sep 2024 08:19:28 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <linux-kernel@vger.kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>, <quic_vgarodia@quicinc.com>,
        <stanimir.k.varbanov@gmail.com>
References: <20240905064817.3885953-1-quic_miaoqing@quicinc.com>
 <d6mt6i4a6xa3juvn4gzytuhsot2kx7dn4wmm3kmgwywfj2hcau@leecyxx36wql>
Content-Language: en-US
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
In-Reply-To: <d6mt6i4a6xa3juvn4gzytuhsot2kx7dn4wmm3kmgwywfj2hcau@leecyxx36wql>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DvasUYBtezgIvAPLwA95qf_CJMJ_rdG5
X-Proofpoint-GUID: DvasUYBtezgIvAPLwA95qf_CJMJ_rdG5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_17,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1011 mlxscore=0 mlxlogscore=819 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409060000



On 9/5/2024 8:49 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 05, 2024 at 02:48:17PM GMT, Miaoqing Pan wrote:
>> Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
>> board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
>>
>> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 119 +++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi      |   2 +-
>>   2 files changed, 120 insertions(+), 1 deletion(-)
>>
>> @@ -837,3 +939,20 @@ &usb_2_hsphy {
>>   &xo_board_clk {
>>   	clock-frequency = <38400000>;
>>   };
>> +
>> +&pcieport0 {
>> +	wifi@0 {
>> +		compatible = "pci17cb,1101";
>> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
>> +
>> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
>> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
>> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
>> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
>> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
>> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
>> +		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
>> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
>> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> 
> Please add
> 
> qcom,ath11k-calibration-variant = "name";

No need, here the WiFi node is for 'drivers/pci/pwrctl', not ath11k driver.


