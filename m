Return-Path: <linux-media+bounces-32253-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C7BAB2F51
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 08:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02A3E160C3A
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 06:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE6A255F29;
	Mon, 12 May 2025 06:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JG46GzaI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BA23C38;
	Mon, 12 May 2025 06:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747030124; cv=none; b=nPGdawsJ0KDAas+yZZsm2lJVBBUuB4AXhj03PF7olaWtOdilsD9XdAbTVpO7nEuP4av0dGwErXclcXPq8FHmpQu2ogMEKNlaf2vgewQzQHgTv6AoOqxGQv3TMsvHHyDfIDsE1sSLf1cKMO8e/bNFw6U2waKL8OUDC3BkNgQ0fVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747030124; c=relaxed/simple;
	bh=aeBo/HtHc7JVSi8gCCikzWTDfo2c+IE0WmhaGHAMUcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Jy2bU1o+dY39jbq/WM7u8dZfQYwGz6FsiOdV1m0IqjT9DUGayk2CKQaRLhQwUwSZSan57KzklQPPa2vAN6QHgkJkOge/NvOaU7vZNP1yqZDz54CFee/PYWqgrf9w8n3I5KHQdTp/7VaeAmVaw/DA9NPkkpdG9oYFvQstLaUbk7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JG46GzaI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BNTuoR013680;
	Mon, 12 May 2025 06:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZAg73qctMdAHl6qXg7azYTSd5wdfKLHTQzj8wlUwENs=; b=JG46GzaIghBXd6z7
	iYG15YdxYHaoaS14TUuTpN7Y1YUcFsV/tGWIy5brD3wUKWvPTvAyfwuN4AJFgZ/b
	U+b5l/qcOpbyUhUV59M0/nBclhPpvr5tbeccPqEFTp6PlfqafPrs4+xU0PDsfj+d
	dz3PqO7lt0CbNE5tgqWCQNl3Veh/bC1bdEPKcMuplfQrreTIB9JxpDmfl69KQzLv
	JiYzZiYqZKxauIiwO/hTHwKGWfQ2wM9iGJ76mHDBVtKjO/SBtfkLlvLnM4gzsRCY
	2Xzii8Q69rXappyCaeNTP2TK2/+oGI2KGLB5mvOXZd2+Qx394fpbMR71Hpv6D8zG
	tnx4/Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hwt939hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 06:08:38 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54C68aDw030763
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 06:08:36 GMT
Received: from [10.50.62.222] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 11 May
 2025 23:08:32 -0700
Message-ID: <7de5bf3f-12e6-99ca-38fd-45435de5773f@quicinc.com>
Date: Mon, 12 May 2025 11:38:18 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v7 0/5] media: qcom: iris: add support for QCS8300
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250501-qcs8300_iris-v7-0-b229d5347990@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250501-qcs8300_iris-v7-0-b229d5347990@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDA2MyBTYWx0ZWRfXx6pfsOXrxel7
 fCkaKHrTriL2FLbFdT2nR68gK5UK0sADv4ZyjYrxnkyiuJc4Arf3OTA1U73Ce50hg8DTDyVJFXg
 n6EK6gWPWsLyo6HIXsfjr9B3ly3nTT7q8ansefxscLF6nDPogPG+nj9j3hnHmWOYXZ913l9NhLl
 HiPcSKPnXQrBcnht6oJ7/AbcO6KJ5lxawtD1V3i5ABJFY2AK6rMqO6SewrVvSvs+G4HaNY0e4Zv
 zzYoyBRG7CoO3z9IO2PkZhgQJdWDi4Zfms588ajYcJcfWmXIgiGO3v+Tqt1/YnT7gJAmenGP95c
 p/Q4xzfnN0bBWe6dn5jMjrow/FQg39sqC4C0C07cXyfl+E/kRspF1Lyq7OaqXOvmISLb0uetcXV
 iK9jFNA8BhjHXQeMgqK1znsvslwYJZNSak+8/hG6lMveBGHylWqasVLh1rVPhRtPq9iwaTCC
X-Proofpoint-ORIG-GUID: b9szylcn0rVwlWotNU-Krm6vnodLKfTs
X-Proofpoint-GUID: b9szylcn0rVwlWotNU-Krm6vnodLKfTs
X-Authority-Analysis: v=2.4 cv=a58w9VSF c=1 sm=1 tr=0 ts=68219066 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=-hBaU0KkIdV-hY_gRgQA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_02,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120063

Hi Bjorn,

On 5/1/2025 2:16 AM, Vikash Garodia wrote:
> add support for video hardware acceleration on QCS8300 platform.
> 
> This series depends on
> https://lore.kernel.org/all/20250417-topic-sm8x50-iris-v10-v7-1-f020cb1d0e98@linaro.org/
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
> Changes in v7:
> - Fix clock corner.
> - Link to v6: https://lore.kernel.org/r/20250430-qcs8300_iris-v6-0-a2fa43688722@quicinc.com
> 
> Changes in v6:
> - Address a comment related the commit title.
> - Link to v5: https://lore.kernel.org/r/20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com
> 
> Changes in v5:
> - Fix order in dt bindings.
> - Drop an unrelated sentence from commit description.
> - Link to v4: https://lore.kernel.org/r/20250424-qcs8300_iris-v4-0-6e66ed4f6b71@quicinc.com
> 
> Changes in v4:
> - Introduce a patch to fix existing order of compat strings.
> - Fix the order of header inclusions.
> - Link to v3: https://lore.kernel.org/r/20250423-qcs8300_iris-v3-0-d7e90606e458@quicinc.com
> 
> Changes in v3:
> - Fix commit description to better describe about QCS8300.
> - Fix the order of the patch.
> - Collect the review tags.
> - Link to v2: https://lore.kernel.org/r/20250418-qcs8300_iris-v2-0-1e01385b90e9@quicinc.com
> 
> Changes in v2:
> - Added dependent info in binding patch as well.
> - Fix a sparse error.
> - Link to v1: https://lore.kernel.org/r/20250418-qcs8300_iris-v1-0-67792b39ba21@quicinc.com
> 
> ---
> Vikash Garodia (5):
>       dt-bindings: media: qcom,sm8550-iris: document QCS8300 IRIS accelerator
>       media: iris: fix the order of compat strings
>       media: iris: add qcs8300 platform data
>       arm64: dts: qcom: qcs8300: add video node
>       arm64: dts: qcom: qcs8300-ride: enable video
> 
>  .../bindings/media/qcom,sm8550-iris.yaml           |   1 +
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |   4 +
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi              |  71 ++++++++++++
>  .../platform/qcom/iris/iris_platform_common.h      |   1 +
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  57 ++++++++++
>  .../platform/qcom/iris/iris_platform_qcs8300.h     | 124 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |  16 ++-
>  7 files changed, 268 insertions(+), 6 deletions(-)
> ---
When do u plan to pick DT patches (4/5 and 5/5) from this series ? I just saw
the PR for 6.16 and i did not see these patches, would like to know what is
pending ?

Regards,
Vikash

