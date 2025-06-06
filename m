Return-Path: <linux-media+bounces-34225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA10AD00F8
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 13:02:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6427618964D3
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 11:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6882882A6;
	Fri,  6 Jun 2025 11:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hX5LorD3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE1B2B9BC;
	Fri,  6 Jun 2025 11:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749207724; cv=none; b=EBxyQsp10xbWUtzVjOpS3bdAOQ+JbHaK9EurHmWAS5LelPjew08KV1rS2emojjrszk8K8CjUe9KaklxwNlN5lATmxuk2pY9rawTGGcVzPOZ4lJCmva8YleX8kw3wWN8oP2e7nvkQPPmoByi6BZbkq5gGd6yr83kA2zfQLjRQW5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749207724; c=relaxed/simple;
	bh=YpgnP6JbmKs2rKnVN3UqcY6nJzxZ4SEBx7H14pjtQvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LmHSGq7Pi4C325AxRdRDHqEMajKveGdw/vtD2S+exHbjQvQpoZz6KbVHHHjdZhzV24H60jaSIiLm5o4laxHHbwG8xo18YR6vzAUa9KBHquMgQk6/d2xLhZie5wg+5If7PJQZfbl9ik1Uf8u03CuewcYup9NL5vuVEhYp7fla1Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hX5LorD3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556A2aRL023713;
	Fri, 6 Jun 2025 11:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vPiIm5S0zqHtmPDjmG/ipeNnAUuQkXK6aAseCulYbsI=; b=hX5LorD3XiGiLL5p
	+Lm6DLWtgUWJcIRyzIXvrUPXmbNwcxfvIDSMtGWgqKyeh11+6+OrePXO1LFclUBg
	jC43w+rRcTZZXoyQsyuqLBjSBE7BL5LEnUAEGOs42Q6dgDIcE55Lpz+e8J7+1ey8
	k4FG7JdAo3qp42uXUS/f3gBAXz1djNyb7YYVcH/+hbviNzmauudDDXfWL+YBfE39
	dM/WcVXCX3fgr1aS2ggU/trfPf68YxsxUOuUz7Jd5b0hBH9twzdHOCWKQ/vOf6UP
	h2ELIjMDWnDKVYudPjBBINWgb/iaBd3cKeD9h0miHkSf87XC1AKs2zN7c+A5hQuN
	lc2DVQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472mn06kyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 11:01:54 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 556B1rrY025619
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 11:01:53 GMT
Received: from [10.50.32.91] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Jun 2025
 04:01:49 -0700
Message-ID: <e434dae3-f0ec-e9cf-fc02-3ea79a0f5d7b@quicinc.com>
Date: Fri, 6 Jun 2025 16:31:46 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] media: venus: Fix MSM8998 frequency table
Content-Language: en-US
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
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250531-topic-venus_98_tbl-v1-1-68e5523a39dc@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JsMq2vLL8LnJ7Wl0taToxv2O0ldqSiwQ
X-Proofpoint-GUID: JsMq2vLL8LnJ7Wl0taToxv2O0ldqSiwQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA5NyBTYWx0ZWRfX+UjueyEy6W+Y
 6rPYQz+zjyXWrLPDCNCmDQPa8jaZCurGiwx1G09qX9VDp4Ruoh1iZyrME6DNt8zF87ua8peZ9xU
 kr8NwIWGmgkzSn19n9A/KmPpvzPYrtYZFovbf6fRnEYrRwjuY2a/Tsh/lu1J/3VM6QS91KsC2Bx
 TZ39/K6Hcvq/d5IYHjB33sGrPr+mYuz69cuADcujIqbYGyhM3WfwJqhfW8ca07JOY92N4uMnGWN
 V7PCRZcF1AzkQDM5cqKfq0khiHP2RwyNZmrP7A/H1IIQv5gCD2t6OgfCcEX7WjBcq8J0t1CTwDn
 jser0w/goMZ++uyKkXTwOxvhY7wwaNITJZ6tu2tzTI8vCj0y1MYrzwD3qnBvfu6mbjhrV+znmUa
 N3NEvWQ9P7TtpJWNK7sS7FG0Vi/dBZgGpVEQ9voUgE9xb1+vAf2oiYpKzim66il6b02En14Z
X-Authority-Analysis: v=2.4 cv=Y8/4sgeN c=1 sm=1 tr=0 ts=6842caa2 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=HQS51YnNDeexhmgAX-4A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060097



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
>  };
>  
>  static const struct reg_val msm8998_reg_preset[] = {
> 
> ---
> base-commit: 2a628f951ed54c30a232230b5b58349d2a8dbb11
> change-id: 20250531-topic-venus_98_tbl-5765675a4ce5
> 
> Best regards,

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

