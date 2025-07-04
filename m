Return-Path: <linux-media+bounces-36760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BE4AF892A
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 09:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB69C3B5581
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 07:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02CE327A10A;
	Fri,  4 Jul 2025 07:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Lj1cVQSN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F202DE711;
	Fri,  4 Jul 2025 07:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751613704; cv=none; b=a/SAzKYm6TRSp+Lp/ci5swBQO/AaSk8het5FodZDyqVHZHI/6WZBuktQQ5X4ao1BF7XOiVXGpEAJwqnbD0mlBh/a7igVCjybHXCt3uEd0SFTQY7XAIZNnakWcZHX5GhciJlYok5qgk8A8d/ldYMyywsjy0Ct2HeZJinCIlJa0bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751613704; c=relaxed/simple;
	bh=06S78qqyEqdmUukCsirR1LdLIQkq9s7UQ/UCoyVj07o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BT/c5483LD6uvQGZVrxIHb5151To/DhRCdFnA0q4e1UKC5zL7R8f3lvUwSXwOmhJ/wxfz0+iQTVUw3/jd8EYMDBLeLEh6YwE3yLU/UFyR5fCIyMMTmHUYZl094+voWh3s1gV5Kb9ZmFBr3mUTsqs+1U8qrfo2IYM1rjpqg2r9iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Lj1cVQSN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5646vD3i001269;
	Fri, 4 Jul 2025 07:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kj3UvZDaaEd44madwolm+J7acoHUkXfwYpEDAT7kvYg=; b=Lj1cVQSNB4iUPuL1
	RoohlYcsjV2/tNuoOmgqMYnQlOTVYY1NX+Sa1agTqgdpzW/QcZjjfrTMBMLmoVF0
	dwPW1W+kEFngZRL+oleXtGkh7l4ODctsrzVPsAGF/Zg4mjaxB9FJAjY4LxbSGcNl
	xVPC/eMykARsXRCcX6UVbQQq2rKtzTIzj9gzlqSJIs0s25Eiq1vnQ28QzcILiYD1
	d1etSnbuGnvyYTnj+vKTb3WMtWU7NQsBGkUHFmp6c83ReA7HKpOZoorUFqBfwdjq
	+nyUp/WAQQzhOaEWNay9ebztGZ5dDCHeOUe7mIO8E9fD0yLQBlw7bkntizrjLr/5
	ZTHHPA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9twmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 07:21:35 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5647LVLg016602
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 07:21:31 GMT
Received: from [10.231.216.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 4 Jul
 2025 00:21:29 -0700
Message-ID: <f87b6127-a416-45fe-8b17-bd32574e20a3@quicinc.com>
Date: Fri, 4 Jul 2025 15:21:25 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: venus: pm_helpers: use opp-table for the
 frequency
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250612-use_freq_with_opp_table-v2-1-42b03648fba8@quicinc.com>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <20250612-use_freq_with_opp_table-v2-1-42b03648fba8@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68678102 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=0vmTT26_tZ8tbevn3XcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: iiM4z8_dKIaURjm9MXCVnUvcdcxyAayl
X-Proofpoint-GUID: iiM4z8_dKIaURjm9MXCVnUvcdcxyAayl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA1NiBTYWx0ZWRfX612GRSC3cZdH
 Co06Vu+KRS2Wu7EWbHzhaW1/naX3DFxmGNZFzfaiUynWerSdvafIYZDx1R98Vv7qEZeDHTRgExk
 IXIvxLHqon83/3icgdGxlxd9z85HeCzFh8pEtTruKXXRXIQqHc4fQflzZHI/3hqXXhHWv5j/QgU
 anj0OewQqoo6AWnGjEzumDHfJl6mqbodEjOfr8qrg6NYT/4pZkMfE5TIX0JUbOKjxOXvFpCnshY
 O5Q/UcZMrdplPvpyDu56sQyiTMp7WyZYEaNaxnGDEplCMgZo/CnRJH7M4gvcR3p21OXs5eNknjs
 pj0ti1R4euwYC1/jc6jc7SCu1kEq+6n6PiO9T6NuPtDZoBYIAJTGsSi85+D2MS7X1YkS5MBIfrd
 NiOcUV+04f70BpP6u22VMAnoA524CuxqwjDrW1xZdDyAq27+7fVi3Zy+Amofc3xLLbZngHks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_02,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=924
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040056


On 6/12/2025 10:23 AM, Renjiang Han wrote:
> Some platforms (such as qcs615 and sc7180) use the same core but have
> different frequency tables. Using the opp-table allows us to separate
> the core description from the frequency data and supports the use of
> fallback compatibles.
>
> Reviewed-by: Vikash Garodia<quic_vgarodia@quicinc.com>
> Reviewed-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
> Signed-off-by: Renjiang Han<quic_renjiang@quicinc.com>
> ---
> video core in QCS615 is same as that in SC7180, while the clock frequency
> corners are different. In such cases, the clock frequencies are better
> represented in DT than static table in video driver. The patch make use
> of OPP table in DT to choose the frequency corner to scale.
>
> Note:
> Earlier discussion was concluded in [1] where it was agreed to rely on
> opp-table for QCS615.
>
> [1]https://lore.kernel.org/linux-arm-msm/c9b83c8b-68d1-43bc-99d6-d2d2b9e445f4@oss.qualcomm.com/
> ---
> Changes in v2:
> - 1. Update message based on the review comment.
> - Link to v1:https://lore.kernel.org/r/20250610-use_freq_with_opp_table-v1-1-7339d690fd1a@quicinc.com
> ---
>   drivers/media/platform/qcom/venus/pm_helpers.c | 58 +++++++++++++++-----------
>   1 file changed, 34 insertions(+), 24 deletions(-)
I’d appreciate any thoughts you might have on this.

-- 
Best Regards,
Renjiang


