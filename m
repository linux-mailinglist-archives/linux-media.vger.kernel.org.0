Return-Path: <linux-media+bounces-34894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 176ABADAE88
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 13:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CDA9188E2A2
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 11:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 565092BEC22;
	Mon, 16 Jun 2025 11:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S8ON28kH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497F81A5BAE;
	Mon, 16 Jun 2025 11:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073530; cv=none; b=Hvm3J+9WGQvK+wDisEiY8CB+t4rLBcUDPQ1VXw+8KGyHGKY8mpDrV3eP5YU83uCtBQ0Q6C3jXJT8PPr4Fwj3X24YQK97TE9YVCsRj1wbfW7SXBaCL5Jz+GfAugU+MUZm7Ktg7szrgtt17AMdr5XtgzjrUVwp4t67GsFAUFrjdJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073530; c=relaxed/simple;
	bh=b9cykgd9b9HvdismnjQ8vGoqV9YKeI/iJSIOsoqHBR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XOVeqeGKpvoSaT3AHZ5bVGk+qrAuXuAyqx9SCO2vNwA10Jc4T57ZuQnhZHu96u3WAr8zVa/jShegPiotb18ghGVD3OVQTmdvev5JUenR08N+6aQORurz/z/gHieFEj8EtInn1vcVTR4ZbK2GTA/+RJEdWbieQzQrJR36vqLJE+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S8ON28kH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8TJvd031861;
	Mon, 16 Jun 2025 11:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vWCTgBL5yZFmM1TMcCbRfbJYa8267rXkRYmC52fTATE=; b=S8ON28kHPyB2FWFW
	xWaBv5fGqmZBzUIwpUDG652KBdUpVVPR0Y4CujwQgaVQXfawgoK9PJk+VIrpXvcD
	8pNKFV7eKahrS9n+3k6aAECiIvGZtz35HfkS4pBY4j40GEhucTOJ+aKLyJoQGJ3w
	GYCnrnwUveQ2dkX+uyPYwrVYaFx5S9givGAtpTnCOgGvfAS/yBzrKV9di654Ab33
	L4Ec6HG/pM+g7DDzM/gC/2ozhqySzXRMmISYOkufNFQ3Xp0AM56vi1GUfVmBGOc6
	g7197STDlQ/MT6FH8dLj/RVBDGIy89P3erukuQY9JcB3Nb4BnlmQeRpO8NTl42Qq
	T4FnLQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791enc9u3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 11:32:03 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55GBW2qC017082
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 11:32:02 GMT
Received: from [10.206.101.41] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Jun
 2025 04:31:59 -0700
Message-ID: <5d38e4ab-394c-8bcb-f34d-9c493f22ed75@quicinc.com>
Date: Mon, 16 Jun 2025 17:01:57 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 5/6] media: venus: venc: Make the range of us_per_frame
 explicit
Content-Language: en-US
To: Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20250111-fix-cocci-v6-0-1aa7842006cc@chromium.org>
 <20250111-fix-cocci-v6-5-1aa7842006cc@chromium.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250111-fix-cocci-v6-5-1aa7842006cc@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MbfoPWEGqw9KBOQjDg0shUyH5Z0NrWCx
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=685000b3 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8
 a=cm27Pg_UAAAA:8 a=COk6AnOGAAAA:8 a=X-1hbc8ZBFZzn6B0vJMA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: MbfoPWEGqw9KBOQjDg0shUyH5Z0NrWCx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA3MSBTYWx0ZWRfXzPh5S2lm9kM0
 ORFWc7W2iw6QVgssN1p3n3HwDCZ5bWmp6zlosYtGBXXyWVw5ueRlUuqyVo8GHZ013htDr+hq53f
 NuBh8vZGLf3S7vk2ZCxGpaWNVTGAm/arU/x+UWpAjmMn15vSzZeHPK7c0p09Cl+AeyTw5Fw9ac8
 Zbit4KtjxiQ19/C8hT79TGpmLQGYiDPJlC72YB1eCTGt9kv+1Jyr0/IdgqSotv4U4kBd803xg37
 ZCFa8u9OieXchUeOmzH8rXGqbSVEOlj05rMBWD6FhKza4x4z7JZe5iNeta1Fc6H2MWvr1QHtnGP
 PHM0CSY8JaPhuPnner+vpAMAMtA8rpDkQQSsJvYuMgmLK0ppVe9Ah22hb3GpX0bh8fkfsyKi8JS
 Tk5M+AOyKytyfHqoxY3d9kPlW0HoNq+JTT+WSkXdulGGzEY/PEarnPgIrFssr1msb1+tFKdL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=997 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160071



On 1/11/2025 3:25 PM, Ricardo Ribalda wrote:
> Fps bigger than 0.000232829 fps, this fits in a 32 bit us_per_frame.
> There is no need to do a 64 bit division here.
> 
> Also, the driver only works with whole fps.
> 
> Found with cocci:
> drivers/media/platform/qcom/venus/venc.c:418:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/qcom/venus/venc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 17bec44c9825..2c1836712362 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -412,8 +412,7 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>  	do_div(us_per_frame, timeperframe->denominator);
>  
>  	us_per_frame = max(USEC_PER_SEC, us_per_frame);
> -	fps = (u64)USEC_PER_SEC;
> -	do_div(fps, us_per_frame);
> +	fps = USEC_PER_SEC / (u32)us_per_frame;
>  	fps = min(VENUS_MAX_FPS, fps);
>  
>  	inst->fps = fps;
> 
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

