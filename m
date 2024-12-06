Return-Path: <linux-media+bounces-22766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3669E64C9
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 04:23:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C23118854EB
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 03:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0390A190665;
	Fri,  6 Dec 2024 03:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HQ97b8VY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C440F18C932;
	Fri,  6 Dec 2024 03:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733455381; cv=none; b=b8S31sBg3Y2vfsOOLDFytso0yuRcOJlt/0AhOlk4Geo4XqlGj7sVyExOaB++McU3ClJKZtEyb2xZKGrX5mcOtRgUzLIJi9hMMKr3VSOcjNJy7p8IGZiXY3KmLd669pv6Id8RN4a3RgGWC45A4/1LX/qzd5BgV+5q/hLKB55JIqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733455381; c=relaxed/simple;
	bh=L9eVuOfPC9PocN8hy4zWl5MbBpO5Y0hsg6wKxrQ28z8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cohOLOQlMiAD6cHlFbNXSGdF1PnxtSE1b0w9gJGGySvJdhvyENncQcblxldjT/H1lWoqIOEzrx9LMmc7jts42LMYqSchD3j4KS3dEF4z1o4Q2ykFwEBNf9CArEXJK3I72jpxt73fa6+GN6qduA+auHXRGQjNFCu8gvoN0lpeWFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HQ97b8VY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaHKO003743;
	Fri, 6 Dec 2024 03:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rX9ksoptauVwZaMTq4BluNRMDUE7aiOJRK7NZHAQkqA=; b=HQ97b8VYyMgiaX4U
	4hNeYYsQMoVFahnuUyrSNbGdWAOZCG9pMdgiVufDa+KzNZbAK9cF7/KZk1VA75TO
	KKz6m2E6V0tCxuXwzzr/JSUHbuiZ/jiwblAvCskXqP5sXxPWZDPLAt0JvR0Dfy9s
	qr7fiRkGJGAObO04M5fHuqIcYRVxS+gOjQBKJn6j4VQWJQBvvPdgJYhfHEaKQViy
	B0e590/nLhnod+08PU3kMd49LZiv2g03KJtH5aPgLEgBALowvQPrIK6Fc0I85yNS
	ZRndr/WapjWVsK81HlVtJu24Bt431//hUzmAuiyEFHHrBoWdlC9eui3YAfgSaYp+
	HHJwOw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba0kjeqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 03:22:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B63MrZZ015174
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 03:22:53 GMT
Received: from [10.231.194.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 19:22:48 -0800
Message-ID: <649dc6c0-f0e1-4dca-8f93-d0f81803cd70@quicinc.com>
Date: Fri, 6 Dec 2024 11:22:44 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs615: add WiFi/BT nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <agross@kernel.org>, <ath11k@lists.infradead.org>,
        <dmitry.baryshkov@linaro.org>, <konradybcio@kernel.org>,
        <kvalo@kernel.org>, <linux-media@vger.kernel.org>,
        <mchehab@kernel.org>, <quic_jjohnson@quicinc.com>,
        <quic_miaoqing@quicinc.com>, <quic_vgarodia@quicinc.com>,
        <stanimir.k.varbanov@gmail.com>, <quic_jiaymao@quicinc.com>
References: <20241203060318.1750927-1-quic_yuzha@quicinc.com>
 <1ca062dd-8910-4caf-a133-0e5717b43540@oss.qualcomm.com>
Content-Language: en-US
From: "Yu Zhang (Yuriy)" <quic_yuzha@quicinc.com>
In-Reply-To: <1ca062dd-8910-4caf-a133-0e5717b43540@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OJFZ5-zJkuNQxu7hwevrdCHR2vmDQeXb
X-Proofpoint-GUID: OJFZ5-zJkuNQxu7hwevrdCHR2vmDQeXb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060023



On 12/6/2024 1:14 AM, Konrad Dybcio wrote:
> On 3.12.2024 7:03 AM, Yu Zhang(Yuriy) wrote:
>> Add a node for the PMU module of the WCN6855 present on the qcs615
>> board. Assign its LDO power outputs to the existing WiFi/BT module.
>>
> 
> subject:
> 
> arm64: dts: qcom: qcs615-ride: ....
> 
> [...]
> 
>> +
>> +	vreg_conn_1p8: vreg_conn_1p8 {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg_conn_1p8";
>> +		startup-delay-us = <4000>;
>> +		enable-active-high;
>> +		gpio = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
>> +	};
>> +
>> +	vreg_conn_pa: vreg_conn_pa {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg_conn_pa";
>> +		startup-delay-us = <4000>;
>> +		enable-active-high;
>> +		gpio = <&pm8150_gpios 6 GPIO_ACTIVE_HIGH>;
>> +	};
> 
> Are any of these boot-on?
> 
Yes, these are used wcn6855-pmu：
      vddio-supply = <&vreg_conn_pa>;
      vddpmu-supply = <&vreg_conn_1p8>;
>> +
>> +	wcn6855-pmu {
>> +		compatible = "qcom,wcn6855-pmu";
>> +
>> +		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
>> +		pinctrl-names = "default";
>> +
>> +		vddio-supply = <&vreg_conn_pa>;
>> +		vddaon-supply = <&vreg_s5a>;
>> +		vddpmu-supply = <&vreg_conn_1p8>;
>> +		vddrfa0p95-supply = <&vreg_s5a>;
>> +		vddrfa1p3-supply = <&vreg_s6a>;
>> +		vddrfa1p9-supply = <&vreg_l15a>;
>> +		vddpcie1p3-supply = <&vreg_s6a>;
>> +		vddpcie1p9-supply = <&vreg_l15a>;
>> +
>> +		bt-enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
>> +		wlan-enable-gpios = <&tlmm 98 GPIO_ACTIVE_HIGH>;
> 
> Please move these properties above supplies, to match the style in
> other recent device trees
> 
> [...]
> 
>>   &rpmhcc {
>>   	clocks = <&xo_board_clk>;
>>   };
>> @@ -262,12 +363,42 @@ wake-pins {
>>   			bias-pull-up;
>>   		};
>>   	};
>> +
>> +	wlan_en_state: wlan-en-state {
>> +		pins = "gpio98";
>> +		function = "gpio";
>> +		drive-strength = <16>;
>> +		output-high;
>> +		bias-pull-up;
>> +	};
>> +
>> +	bt_en_state: bt-en-state {
>> +		pins = "gpio85";
>> +		function = "gpio";
>> +		output-low;
>> +		bias-pull-down;
>> +	};
> 
> These should be sorted by gpio idx
> 
> Konrad


