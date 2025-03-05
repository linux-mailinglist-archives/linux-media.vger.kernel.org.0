Return-Path: <linux-media+bounces-27535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D89A4F549
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 04:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1123418902D8
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 03:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 953D416CD1D;
	Wed,  5 Mar 2025 03:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NIAIbIJh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509922E3383;
	Wed,  5 Mar 2025 03:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741144793; cv=none; b=mw/fedKPqQbSeXd1SgzpLk77wWc0TStjkofvpD+izkDjzfpLN5qmDOqX03ehhNtNPfpU+HXuwr6PFxZ3Q+0HY1Yd3c+s/HOzV7XsM3KUo2HlI7dAv5MDejB9SOFrALfBNcuTubrHsiH3x66w69tBhCccAOUOuRGt8xoNNyQWFAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741144793; c=relaxed/simple;
	bh=nVeHc2/A5qGA/Y7jzpYokSR1LYZVRR33cBvplT9dWjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lxjZkax33LFXUa25Cd7chYU4Fz6LXBOp/cY8QRCnQUMFx41G59lI4Q4Rbzzx4uZpp9IhQa9TaGhH7BTiI9b+JFWwq4WlUVomVoLpNNGaN3kAR+VqXdpMeJfEgbcFMbdnSLKV5OG7jb9+06qZnHvBv0SGt9BXZXXOa2CCRtMNO+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NIAIbIJh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524NAI6I005857;
	Wed, 5 Mar 2025 03:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xDdTr17tBfFoMDpHH224JOSAXjLisgG537rekDvCAGg=; b=NIAIbIJhBrb7GRTh
	WP0qoSVyRjUx8wiv2/bdQsHWzXyMPU/l0FFz9bqZKwQ6o/wOks2TpxAIhUeWx/IS
	X+V46W0ynen/kZjkH7epwu69prUuL6l196Q6LWFmAZqIujrFyOB3ohhJeiZZJus9
	tpssLBct0W73a4c7YkqRBpMrrhBEkdj7oUsu3zrnchf8SXfRFmc4o5SqiRIhEv+N
	Iex2uQ3ZQcy6ZLjuTz4nVgX4Ounc0lt++7EPWyLc1xFQCxKO8kcjOJZX9weMZYn9
	mnjA6CBs7xWpQiBibJhKxFg80e8Y6sGZP9ULf+nJd5kotxRmUgEb5DHUt2RHbGNk
	57lcow==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6v3x6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 03:19:45 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5253JiTT024152
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 03:19:45 GMT
Received: from [10.216.10.45] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Mar 2025
 19:19:40 -0800
Message-ID: <8cfaeb25-2657-9df4-5cea-018aad62f579@quicinc.com>
Date: Wed, 5 Mar 2025 08:49:37 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/8] Reup: SM8350 and SC8280XP venus support
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Johan Hovold
	<johan+linaro@kernel.org>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: J0KdFPlAOMHx1R0B1uVwEZNMzUBYrmkk
X-Proofpoint-ORIG-GUID: J0KdFPlAOMHx1R0B1uVwEZNMzUBYrmkk
X-Authority-Analysis: v=2.4 cv=fatXy1QF c=1 sm=1 tr=0 ts=67c7c2d2 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EyvuXH2y2WLcsoGZDs4A:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_02,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050024


On 3/4/2025 6:37 PM, Bryan O'Donoghue wrote:
> This series is a re-up of Konrad's original venus series for sc8280xp and
> sm8350.Why this is enabled on venus driver ? Why not iris driver ? This needs an
explanation on was this even tried to bring up on iris driver.

How different is this from sm8250 which is already enabled on iris driver ?

> Link: https://lore.kernel.org/all/20230731-topic-8280_venus-v1-0-8c8bbe1983a5@linaro.org/
> 
> The main obstacle to merging that series at the time was the longstanding
> but invalid usage of "video-encoder" and "video-decoder" which is a
> driver level configuration option not a description of hardware.
> 
> Following on from that discussion a backwards compatible means of
> statically selecting transcoder mode was upstreamed
> 
> commit: 687bfbba5a1c ("media: venus: Add support for static video encoder/decoder declarations")
> 
> Reworking this series from Konrad to incorporate this simple change
> 
> - Removing dts dependencies/declarations on the offending compat strings
> - Inclusion of necessary static configuration in the 8350/8280xp driver
>   config
> - A small update to interconnect tags which Konrad pointed out on IRC to me
> - Fixed author and SOB on first patch to match
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
> Konrad Dybcio (8):
>       media: dt-bindings: Document SC8280XP/SM8350 Venus
>       media: venus: core: Remove trailing commas from of match entries
>       media: venus: hfi_venus: Support only updating certain bits with presets
>       media: platform: venus: Add optional LLCC path
>       media: venus: core: Add SM8350 resource struct
>       media: venus: core: Add SC8280XP resource struct
>       arm64: dts: qcom: sc8280xp: Add Venus
>       arm64: dts: qcom: sc8280xp-x13s: Enable Venus
> 
>  .../bindings/media/qcom,sm8350-venus.yaml          | 119 ++++++++++++++++++++
>  .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   5 +
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  82 ++++++++++++++
>  drivers/media/platform/qcom/venus/core.c           | 125 +++++++++++++++++++--
>  drivers/media/platform/qcom/venus/core.h           |   4 +
>  drivers/media/platform/qcom/venus/hfi_venus.c      |  15 ++-
>  drivers/media/platform/qcom/venus/pm_helpers.c     |   3 +
>  7 files changed, 341 insertions(+), 12 deletions(-)
> ---
> base-commit: d98e9213a768a3cc3a99f5e1abe09ad3baff2104
> change-id: 20250301-b4-linux-media-comitters-sc8280xp-venus-e2cad579b4f0
> 
> Best regards,

Regards,
Vikash

