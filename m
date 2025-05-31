Return-Path: <linux-media+bounces-33713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7758EAC9892
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 02:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A29213B0E6A
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 00:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A960C2904;
	Sat, 31 May 2025 00:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n55ufTL7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61D2380;
	Sat, 31 May 2025 00:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748649967; cv=none; b=C7+fj+58RUUU/zuy0q84oAnfRzj1Z06gzgLlMORQxbxZ+kE8sg1oS5m6sXuL0o5kOdmlM3+l2385xboMkF3OGRg8h7+p+Y367KEkajTKer01K1v7UTzc289pT+mNOGT3fy9zbfXF6W/XCvZo6krViHkrOztlhAaq37q2NLIIefo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748649967; c=relaxed/simple;
	bh=maPMN0hwCsVwCdykQCAgvH+exXadABZJV0ZSv74sBLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Home0Lsub8HORU1+1n8Obp0i3phs2JfyZKuZusy3Q6p/sug38nl5LmShS3xUkjfZ4qIa5+OL7kKEor7s93gXCa2kL8pmcONaGV5n2hAz7AhcVX5v1uFOgwhu+Aa5nYEv0S23Hb7hE3rkL8Zg8OteZYb9nvDttlpEtcucHTuyvSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n55ufTL7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UJQZ1V008586;
	Sat, 31 May 2025 00:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P9Ik7JrFGgye6zMwZK1N8RpHNmN/mOfsQyHvJj3bO/Q=; b=n55ufTL7hgr/DqVi
	3H5+oGOuNbnAUuexz858VKjF7Sk+QwxUmBi0KnAN8IOCDrdAuDUuQCqfzoWME7Xc
	sx4w/DyVZNopUmanLmJwiwyNHVy1iKBQxxvy1ForEbo9HOAldhw4kFO+V+hwEXKS
	yd0VgEOxA6uuQmI7N3vQTPOGG87IlkGV7w4olF65IsounReNjRZOxomXdvv+WL/M
	zpwHzrWSU2qvNNM0gBm6mcPG1CWtp3ELcSxDcdDka67XOaLLHvKfR5p+8DzyRppN
	EBtiaw3odP6Bpt4XmPbVHyuHymaOZv4/l4B2gGbetus0Mn2wmJauP1zYr/Yppdy6
	s9gJ9g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992vwww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 31 May 2025 00:05:56 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54V05uLx011386
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 31 May 2025 00:05:56 GMT
Received: from [10.253.36.123] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 May
 2025 17:05:51 -0700
Message-ID: <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
Date: Sat, 31 May 2025 08:05:24 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDIxNiBTYWx0ZWRfXwps808KuKuMe
 YsiCzwDseIf2KUyHQmldaOB3a8VBXVr4AW/X7dvJ7ufYP4Fn6CJUzi9mr3HMABn8XddVrAhU48n
 d/E+476b7MyKxeCFQE+TWMDKx2zNVbmtEXrxnOB4CT7+Cs11S0gnNYKshbL7pMrqFUTZCs0gxkc
 arAt30Mao82iG8siRfGZ628uy/Z2OxKxq+1alhzwuFJtPcAkUBr7wHjzomCYEXzsFX4D827oHBZ
 UKxwKFvW+Crj5Kg0XtSeIN3n2Wa7aMfcg5T0/9OCAkH6o9CURnT4d/xT4l4d4KmADKnrmHxd6KU
 d02qqw+Ed4hPaUEylxQebv23nOmemmG8DsY+3lwqX+aQqTHD+1gv64lGMxGYYWuhZLvLsUmRyBd
 ebvsd+ZDQ0Z2qgpfrI9pt3VAw0eMrvZYfJ4WW62CH6H0TVxawpREdr7ftR3CkgwAO6br3KYa
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=683a47e4 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=7oLazzdPkbqr2a_El7wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: hA1IsPqSYjYSRtValUFsCcCCCuzFPCZz
X-Proofpoint-ORIG-GUID: hA1IsPqSYjYSRtValUFsCcCCCuzFPCZz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_10,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300216


On 5/31/2025 4:27 AM, Dmitry Baryshkov wrote:
> On Fri, May 30, 2025 at 09:32:12AM +0530, Renjiang Han wrote:
>> QCS615 uses the same video core as SC7180, so reuse the same resource
>> data of SC7180 for QCS615 to enable video functionality.
>>
>> There are no resources for the video-decoder and video-encoder nodes
>> in the device tree, so remove these two nodes from the device tree. In
>> addition, to ensure that the video codec functions properly, use [3]
>> to add encoder and decoder node entries in the venus driver.
>>
>> Validated this series on QCS615 and SC7180.
>>
>> Note:
>> This series consist of DT patches and a venus driver patch. The patch
>> 1/3, which is venus driver patch, can be picked independently without
>> having any functional dependency. But patch 2/3 & patch 3/3, which are
>> DT patches, still depend on [1].
> I'd say 2/3 and 3/3 still depend on 1/3, otherwise we can get video core
> on QCS615 over(?)clocked.
Agree, so we need to make sure that the driver patch is not picked after 
the DT patch.
>
>> [1] https://lore.kernel.org/all/20250119-qcs615-mm-v2-dt-nodes-v2-0-c46ab4080989@quicinc.com
>>
>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>> ---
>> Changes in v8:
>> - 1. Add missing tags.
>> - 2. Fix the dependency to point to videoCC series alone.
>> - 3. Fix review comments from Konrad.
>> - Link to v7: https://lore.kernel.org/r/20250527-add-venus-for-qcs615-v7-0-cca26e2768e3@quicinc.com
>>
>> Changes in v7:
>> - 1. Update devicetree patch to fix the cherry-pick patch conflict issue.
>> - 2. Remove dt-bindings patch from this patch series due to it has been
>> picked.
>> - Link to v6: https://lore.kernel.org/r/20241219-add-venus-for-qcs615-v6-0-e9a74d3b003d@quicinc.com
>>
>> Changes in v6:
>> - 1. Remove video-decoder and video-encoder nodes from the device tree
>> - 2. Add a new dependency.
>> - 3. Fix missing tag.
>> - 4. Update commit message.
>> - Link to v5: https://lore.kernel.org/r/20241217-add-venus-for-qcs615-v5-0-747395d9e630@quicinc.com
>>
>> Changes in v5:
>> - 1. Remove extra blank lines in yaml files.
>> - 2. Add new variables in the driver while keeping the order of the
>> original variables. And remove unnecessary variable initialization.
>> - 3. Update commit message.
>> - 4. Update the order of nodes in the device tree.
>> - Link to v4: https://lore.kernel.org/r/20241213-add-venus-for-qcs615-v4-0-7e2c9a72d309@quicinc.com
>>
>> Changes in v4:
>> - 1. Remove qcom,qcs615-venus.yaml and use qcom,sc7180-venus.yaml for
>> qcs615 dt-bindings.
>> - 2. Add "qcom,qcs615-venus" compatible into qcom,sc7180-venus.yaml.
>> - 3. Remove qcs615 resource from the driver and use sc7180 resource for
>> the qcs615.
>> - 4. Use the frequency in the opp-table in devicetree for the driver.
>> For compatibility, if getting data from the opp table fails, the data
>> in the frequency table will be used.
>> - 5. Keep the reverse Christmas tree order coding style.
>> - 6. Add "qcom,sc7180-venus" compatible in devicetree.
>> - 7. Update cover letter message.
>> - Link to v3: https://lore.kernel.org/r/20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com
>>
>> Changes in v3:
>> - 1. Remove the ‘|’ after 'description' in the qcom,qcs615-venus.yaml.
>> - 2. Add a blank line before 'opp-table' in the qcom,qcs615-venus.yaml.
>> - 3. Put ‘additionalProperties’ before ‘properties’ in the
>> qcom,qcs615-venus.yaml.
>> - 4. Update the subject of qcom,qcs615-venus.yaml patch.
>> - Link to v2: https://lore.kernel.org/r/20241112-add-venus-for-qcs615-v2-0-e67947f957af@quicinc.com
>>
>> Changes in v2:
>> - 1. The change-id of DT and driver are removed.
>> - 2. Add qcom,qcs615-venus.yaml files to explain DT.
>> - 3. The order of driver's commit and DT's commit is adjusted. Place the
>> driver's commit before the DT's commit.
>> - 4. Extends driver's commit message.
>> - 5. Split DT's commit into two commits. Add the venus node to the
>> qcs615.dtsi file. Then in the qcs615-ride.dts file enable the venus node.
>> - 6. Modify alignment, sort, upper and lower case letters issue.
>> - 7. Update cover letter message description.
>> - Link to v1: https://lore.kernel.org/r/20241008-add_qcs615_video-v1-0-436ce07bfc63@quicinc.com
>>
>> ---
>> Renjiang Han (3):
>>        media: venus: pm_helpers: use opp-table for the frequency
>>        arm64: dts: qcom: qcs615: add venus node to devicetree
>>        arm64: dts: qcom: qcs615-ride: enable venus node to initialize video codec
>>
>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts       |  4 ++
>>   arch/arm64/boot/dts/qcom/qcs615.dtsi           | 78 ++++++++++++++++++++++++++
>>   drivers/media/platform/qcom/venus/pm_helpers.c | 53 ++++++++++++-----
>>   3 files changed, 121 insertions(+), 14 deletions(-)
>> ---
>> base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
>> change-id: 20250526-add-venus-for-qcs615-a547540656d1
>> prerequisite-message-id: <20250119-qcs615-mm-v2-dt-nodes-v2-0-c46ab4080989@quicinc.com>
>> prerequisite-patch-id: afd2dce9e6066b1f6ce0b41ceafe0dd47ad97c40
>> prerequisite-patch-id: f8d64c8cf6cd883dc7bbb2a4ed6d5a4db85c536d
>>
>> Best regards,
>> -- 
>> Renjiang Han <quic_renjiang@quicinc.com>
>>
-- 
Best Regards,
Renjiang


