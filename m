Return-Path: <linux-media+bounces-40560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B27B2F77A
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 14:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC037AA68BC
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 12:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176CA310623;
	Thu, 21 Aug 2025 12:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="maaJAvxv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E892B20D50B;
	Thu, 21 Aug 2025 12:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755777897; cv=none; b=kJ71PDqKGA6bQfUAKHWw6vmtJE0KKOVIczDOgHDv4ovqOh1DuHbchejpSIfNQVXWqznZVqgr3yzU2RIAgvk3+ECUZUD2pu3IFExuQM+/Jc9h6BWGbRwqQ83mgFUR0qQo/oVeHZzgayH6+kRIU7sdHOOMUpgfVlx3vzvQsLSMDQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755777897; c=relaxed/simple;
	bh=c6UQ/BkOyGnAZtiZu1VrT/RJ3fByK+kTXyI+rOIXHZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=L87IwfpMGp5gKL4MqkTm/gqTRS/EqlOA48jhG+cJjMzUbP8THY5B1+KPrdr/bI3jrNQEA7k0k+KgzwnITjOlpKiLAYkcz6l8G0M3Hg5lNLaF9ePiL3wJmADStWseDQ0pwhG48pNiOjR41BjjL684hV8sLeoR7u44x5lUb7TfqzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=maaJAvxv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bC2Q031439;
	Thu, 21 Aug 2025 12:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xBBFqalNh5s8t2iKJIbEORIyjEwCQ+PjvcFtOq+otRs=; b=maaJAvxvmqsnv/86
	kR+qkNY06L5brmxrubJ985ePQeysKj7qE6ipITETS6bR1V2u00KeSye1YvGrEDCE
	girzhJLqJnIKEVkVZADHIKcqjqg4gEcLtzYyi028RARuH6sil3A7+9cwWrvQz3uZ
	ON+fNkNc33BEnG9mjHCHMf0OQYPhWmrCRFlj9Ot5pZ+rxTHQy27kpYOXbB1VnYqZ
	t0eIreCCYHWklrkQyUdwpzNdTbDTISIQgbtU3B0MqdBjqxA5n0rKxQ6ZgriOLFsk
	5V4yqeo2iYBeaSMggFkUDFoFhZnzjpQruzMeNmozsPiuwrwbENwq5fexF19KaE8h
	DqtSzg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52aw6v4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 12:04:51 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57LC4o2H002265
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 12:04:50 GMT
Received: from [10.216.5.63] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 21 Aug
 2025 05:04:48 -0700
Message-ID: <9c318b7c-544c-df55-eead-e00244d2992f@quicinc.com>
Date: Thu, 21 Aug 2025 17:34:44 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] media: venus: firmware: Use correct reset sequence for
 IRIS2
Content-Language: en-US
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>
CC: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil
	<hverkuil@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250820-venus-iris2-no-tz-v1-1-9ebcc343195a@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250820-venus-iris2-no-tz-v1-1-9ebcc343195a@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX0PjUm5s3Lxpq
 by98Wa1KOxQi9etHVzEAp1Q2QW8e7hbM/8LJSCZ3uxcACaf6WNjIwSYL4Jz7LMG65jGq07Kzlv7
 z29Yk5SdMdENdeqNfTwjmBwDSGICf6xXvfoBs9twdkzBgmM9MsYYPYvULbvh1eGCzCCrbx/uV6I
 etZYe6CvxfPWrw8MjsImic7Z/8pvs/Fp+FUr+k9NJpHGoZ09c4k8lCOIX1sEpkbvTVi/JeWQZ9N
 zKnT8hNIqQp+SH+eb0znRbKFRMiucWX9LqMOfDgu+OsE353YaU+e8tfGRUyN0JbY+gFiZ4AHqyq
 cdSnrA9fxVygpwNcbClSiauQpHqTRsYVne9J0xRS9b0znn9W//YnM3vRNK0BDv8BRM0istGMQQP
 fpJ2jKGJwRwM9zYzr1IgaOcBZ2pAmA==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a70b64 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=Zxh-gqEWaZ_blzi-cf4A:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: i7SL1eFTQbSwWBNmMhoIPXQfVktjE72q
X-Proofpoint-GUID: i7SL1eFTQbSwWBNmMhoIPXQfVktjE72q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013


On 8/20/2025 8:46 PM, Stephan Gerhold wrote:
> When starting venus with the "no_tz" code path, IRIS2 needs the same
> boot/reset sequence as IRIS2_1. This is because most of the registers were
> moved to the "wrapper_tz_base", which is already defined for both IRIS2 and
> IRIS2_1 inside core.c. Add IRIS2 to the checks inside firmware.c as well to
> make sure that it uses the correct reset sequence.
> 
> Both IRIS and IRIS2_1 are HFI v6 variants, so the correct sequence was used

s/IRIS/IRIS2

> before commit c38610f8981e ("media: venus: firmware: Sanitize
> per-VPU-version").
> 
> Fixes: c38610f8981e ("media: venus: firmware: Sanitize per-VPU-version")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/firmware.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

with that addressed,
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>


