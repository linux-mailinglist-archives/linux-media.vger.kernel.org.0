Return-Path: <linux-media+bounces-34059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3A0ACDE16
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 14:35:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCFC83A644A
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 12:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0032D28F50F;
	Wed,  4 Jun 2025 12:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EUKZNTVg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA22913AD1C;
	Wed,  4 Jun 2025 12:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749040523; cv=none; b=j/jPy9N6QI2NAYbK4GxGeSwZswL9XPxgIvQtJvftx94Hk3nHuoQyjhQebgPPRoSwJF3kAPVqg5uhdTsJ87gujY99BPf3j7Cv+LQkP78we3lZiuZ3HoaSTd3kWXL9pGrEZWLiguiRT/uXzLtLAtQiRkhJR4hyBQnuAOYyhCeg8o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749040523; c=relaxed/simple;
	bh=pzB2r9AuYbhlH2cLpCTOjuhSRLK5nxjnZ5tOE00lqPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ckVb4fD48QT/wrP8Xu52WpQnDtQcQ3P1rLa0xIeohwW2DDNx7qgsl3V9kvb2OGa21pJQyuPX4KlQkEq6QYKj/Vdf0CTpR1ZGij+ztoe05rbLyWwE01+0Av0bXMMAXwgnJ/8M49YzQz3bacKSIUXvPT5ib9GERlBp8ExPgy6hwCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EUKZNTVg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554AhpJE023156;
	Wed, 4 Jun 2025 12:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lQCzdXCBuvZMUMNTaFYO+4zUpBo1D8sZNSPcz5eyBuI=; b=EUKZNTVgKiyjvYzE
	RPfhObsr/zSb1B9xa5WRVtia5wGxvfC/d2KCFjBjRikm9YqJ2THKmoA7Y87qV6ln
	PSLiHjeLp5P4EnP/YJ6MgYcuaJG9QLs9sU/tzwMd//W5ejxJZDKMAIgkj2ceKJ3a
	spY4/JB0UoXU+OP+oTlUXHE3icZxgZGlhPU2LY1vcM2hf0/VB0RinpONRY3ENEXb
	wuZpBDwgvp3DyqPruxzsgTOQX4xJXaEsUiL3SqYm6YOSZDt3Gdpu0/5nnOZk62sa
	djB271O7TgmlNGg2RuLx7GjdVxNqXdVvZez+2miv9YiUkAp5nD0O1CTa9jgQnSmm
	joblEQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472mn008ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 12:35:12 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 554CZBko016918
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Jun 2025 12:35:11 GMT
Received: from [10.50.19.162] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Jun 2025
 05:35:07 -0700
Message-ID: <4504e16a-f4c4-1f68-fa91-d3641a3decbe@quicinc.com>
Date: Wed, 4 Jun 2025 18:05:04 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] media: venus: Fix MSM8998 frequency table
To: Konrad Dybcio <konradybcio@kernel.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC: Marijn Suijten <marijn.suijten@somainline.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
References: <20250531-topic-venus_98_tbl-v1-1-68e5523a39dc@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250531-topic-venus_98_tbl-v1-1-68e5523a39dc@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AgF96cHK_rht01NW1ZGMCujyOSyIvlAU
X-Proofpoint-GUID: AgF96cHK_rht01NW1ZGMCujyOSyIvlAU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA5NSBTYWx0ZWRfXzGDt6pi+M68Z
 EhaCAqazL25NGYD/aDQSfzVZMuMzncSMK6esvvFbxNDFfNJSN4pG/qE+6h5y5lyxS9cbXb9C+4U
 OJgTBi18RH2WjAvfIUFKrkW1stkdFOMkS6dTfZeP6/Dka/EV21Qc2Z2NRnhF8aGRvZYHqwiPOFe
 Zg3XU8ys64hhE2SXMKtkjNMquAHpNDgIkvNVeOt3n+Wpigb6/3goGjlF5TL+g8mjyh50m+qhMM/
 ksZdTO7gQSYzldwHMjxtsrlp6IGiEx3NVj1TDyVKbhq6vvjIX5+7TBdmTZfJK300HBJhU0/xv4T
 IcZ9lPF/3RhGlZah5gUIckh3quz4/DS21f5h4IZeu2qpYazov8SwYMqO0j0vzFH1lQMetfcg68w
 lvcY490Wuhk9TZ5MJDsWrgaem440kt5VJ9LI7KiVK1tJvUIjxS+uQBVdmed+zRCvq3X3hI6M
X-Authority-Analysis: v=2.4 cv=Y8/4sgeN c=1 sm=1 tr=0 ts=68403d80 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8
 a=HQS51YnNDeexhmgAX-4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 clxscore=1011 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040095


On 5/31/2025 5:52 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Fill in the correct data for the production SKU.
> 
> Fixes: 193b3dac29a4 ("media: venus: add msm8998 support")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/venus/core.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index d305d74bb152d21133c4dfa23805b17274426a5c..2bb514c322692475ed58198e17f906f894d81cf4 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -709,11 +709,11 @@ static const struct venus_resources msm8996_res = {
>  };
>  
>  static const struct freq_tbl msm8998_freq_table[] = {
> -	{ 1944000, 465000000 },	/* 4k UHD @ 60 (decode only) */
> -	{  972000, 465000000 },	/* 4k UHD @ 30 */
> -	{  489600, 360000000 },	/* 1080p @ 60 */
> -	{  244800, 186000000 },	/* 1080p @ 30 */
> -	{  108000, 100000000 },	/* 720p @ 30 */
> +	{ 1728000, 533000000 },	/* 4k UHD @ 60 (decode only) */
> +	{ 1036800, 444000000 },	/* 2k @ 120 */
> +	{  829440, 355200000 },	/* 4k @ 44 */
> +	{  489600, 269330000 },/* 4k @ 30 */
> +	{  108000, 200000000 },	/* 1080p @ 60 */
What has ideally changed in production SKU which led to this change. Pls add
this info.

Regards,
Vikash
>  };
>  
>  static const struct reg_val msm8998_reg_preset[] = {
> 
> ---
> base-commit: 2a628f951ed54c30a232230b5b58349d2a8dbb11
> change-id: 20250531-topic-venus_98_tbl-5765675a4ce5
> 
> Best regards,

