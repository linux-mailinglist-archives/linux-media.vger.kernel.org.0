Return-Path: <linux-media+bounces-33509-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61812AC6561
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 11:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A913818864EF
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 09:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D382750F9;
	Wed, 28 May 2025 09:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="goxgL4UR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7453274FE7;
	Wed, 28 May 2025 09:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748423599; cv=none; b=S8XH2lR0vXaS6TKpvbZrsWcKoTJKjwa9Z/qfN3n6VSl2nCz5+Xt6swzjUzSM0hOPaHDcSuk3BrTq5v9rt5FfBnmRMe9pSvMR/UiVAg5Y3I/34oLNtR5cfBkyrnA9Ubn3dUbVA6hr0Dgp334lqvVttG2u1DPu39UeXTGdR2cCMd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748423599; c=relaxed/simple;
	bh=tD4kL/zpDeklxFoCQbRoJAY+hgM41Id/MIt0dnF2b/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OryrXZnuWfF5MBQLb0GRS0SpamfWyC1x4FBB3ZkmLrQOBVl5+oLUtYVUWYRLmI2bm54ZunOrZfkyhrjb67JOQ6UKxMAY6WlMyuUkdQJp2K4OoqhY50mFO+UNL6gQd9/RThS/Uk4oZSmEntlTcXGsuP5/wdEIgdCiiFoIbqdJV2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=goxgL4UR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S98A5q023081;
	Wed, 28 May 2025 09:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qrUrf+sDIcM7t8rf7eG9YGrZDaTcoHQ35BRKhzDnrmw=; b=goxgL4UR6eFz9JE7
	f/idS2n/SZTpwiXiClXXqJjMEcLfDY3fXF7yuuCq6wb8VHZ9qDeB+h7HY1WTBpsa
	e2dBH7bWczVP7Hx8kbmZ1GfZBRJoSuOTG3xnf4i6G2xJ9AavdL6bLJJIG6FkM1Sp
	jvHqLbuCf2pXmpvTcDSAt1xg1gInXg9eyvR8RrTyNkWgfwW6tfKpY7tUrryu9RFO
	28ySTlEn2Og+Se9lWkp/TV1gF4/rN0hOSZu3xA7YhtxFtGDczYWd8wlp3vHCLLX/
	B4pkV+YTLnBAsjulWkxSADpUaGxhR9JQV5yJjUaYOIgo752SXDb5L8LbROgC6Okj
	tXADeA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjsr16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 09:13:13 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54S9DDqg015232
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 09:13:13 GMT
Received: from [10.231.216.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 May
 2025 02:13:09 -0700
Message-ID: <6a9e7daf-c0df-42db-b02d-96d9893afcde@quicinc.com>
Date: Wed, 28 May 2025 17:13:06 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] arm64: dts: qcom: qcs615: add venus node to
 devicetree
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250527-add-venus-for-qcs615-v7-0-cca26e2768e3@quicinc.com>
 <20250527-add-venus-for-qcs615-v7-2-cca26e2768e3@quicinc.com>
 <429b4c99-b312-4015-8678-0371eac86de4@oss.qualcomm.com>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <429b4c99-b312-4015-8678-0371eac86de4@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=6836d3a9 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=Zp6QOlK5tOUEOi8qZRAA:9 a=NuPNxs1a3nqTHuJ5:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 3ArXmRdVpmwSYW9kcdUd6XfiPFs4eoyV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA3OSBTYWx0ZWRfX29nIUvf/1zpq
 rX4w7zIoDXUhQBSOH6U0pcS7VtSvN3IGkZORy8jMMX0WPSCu0MtGoNhNzsa+MKx2GrSgK+CPlFH
 DPaKcCpsOStrSQm07nSBc23CqO1yzJ/gw7lAlYdfUU06DvDc7ELXaIDTqFa2yDDa9ufi/YR2tts
 MiUkV4hJDg/Gg2Pi2CXzutAQ7tk7LlhcNjGPKpeSMuM9a1kNlrTA2ByxucazvFQu5wXdxJTh8OR
 xOXv28gAko2eot0XB9jwrZDCpQbzYVdUwopDP4Yj675qddugCEj53ceAEaOKgK+3U/3iND/Iaa/
 oMj+GawT768ecSrA8oBSkdv4x8l44/0jwbnczSibkItWjy7nB9lB/zzFfN9V36nE3YlwuPEHw9z
 kPPG+9ncq+LQcDadzAgyelQjA0HbOaUFAcwRzAVTYwxficPWEJLU9CRGf80aAC4o4hX0xepD
X-Proofpoint-GUID: 3ArXmRdVpmwSYW9kcdUd6XfiPFs4eoyV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_04,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280079


On 5/27/2025 9:57 PM, Konrad Dybcio wrote:
> On 5/27/25 5:32 AM, Renjiang Han wrote:
>> Add the venus node to the devicetree for the qcs615 platform to enable
>> video functionality. The qcs615 platform currently lacks video
>> functionality due to the absence of the venus node. Fallback to sc7180 due
>> to the same video core.
>>
>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>> ---
> [...]
>
>> +			interconnects = <&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ALWAYS>;
> QCOM_ICC_TAG_ACTIVE_ONLY on the second path

Thanks for your comment. I'll update it in next version.

             interconnects = <&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
                      &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
                     <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
                      &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;

>> +			interconnect-names = "video-mem",
>> +					     "cpu-cfg";
>> +
>> +			iommus = <&apps_smmu 0xe40 0x20>;
> fwiw docs mention 0xe60 0x20 (which result in the exact same resulting sid)
OK. Will update it with next version.
>> +
>> +			memory-region = <&pil_video_mem>;
>> +
>> +			status = "disabled";
>> +
>> +			venus_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-133330000 {
>> +					opp-hz = /bits/ 64 <133330000>;
>> +					required-opps = <&rpmhpd_opp_low_svs>;
>> +				};
>> +
>> +				opp-240000000 {
>> +					opp-hz = /bits/ 64 <240000000>;
>> +					required-opps = <&rpmhpd_opp_svs>;
>> +				};
>> +
>> +				opp-300000000 {
>> +					opp-hz = /bits/ 64 <300000000>;
>> +					required-opps = <&rpmhpd_opp_svs_l1>;
>> +				};
>> +
>> +				opp-380000000 {
>> +					opp-hz = /bits/ 64 <380000000>;
>> +					required-opps = <&rpmhpd_opp_nom>;
>> +				};
>> +
>> +				opp-410000000 {
>> +					opp-hz = /bits/ 64 <410000000>;
>> +					required-opps = <&rpmhpd_opp_turbo>;
> nom_l1
>
>> +				};
>> +
>> +				opp-460000000 {
>> +					opp-hz = /bits/ 64 <460000000>;
>> +					required-opps = <&rpmhpd_opp_turbo_l1>;
> turbo

Thanks for your comment, will update like this in next version.

                 opp-410000000 {

                     opp-hz = /bits/ 64 <410000000>;
                     required-opps = <&rpmhpd_opp_nom_l1>;
                 };

                 opp-460000000 {
                     opp-hz = /bits/ 64 <460000000>;
                     required-opps = <&rpmhpd_opp_turbo>;
                 };
>
> Konrad

-- 
Best Regards,
Renjiang


