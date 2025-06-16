Return-Path: <linux-media+bounces-34895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F34FAADAE97
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 13:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0727B171932
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 11:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802492E7F3A;
	Mon, 16 Jun 2025 11:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KAkyhy+S"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F19E29C35C;
	Mon, 16 Jun 2025 11:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073563; cv=none; b=C/cHcPc6jid3XNqfbc2p4d4OLPu41PRHCGk1h4pfjtOH+/1BZ9v3UafddX1GCI8T3vpDsNa1/pVlwqJLuYNLjpQHUp14szmDmBGAyuBEEzYpCNr3B2an5at4V85jPSOEcirgoglqRdihXscDnA1u7dAuX9OHrP1LWBIAN0MVMk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073563; c=relaxed/simple;
	bh=lek3KmihgUTuFXfPYEuMmeDsFSmrkafqPfUG/bPtZrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hf2MHajd2CFncBzPq49Q4YMRUQ8B9fGHnTcgeOm58EyF8BoLBBlVynechPnyDpQzc4FXAaYKRI5BqBRcv5rdlHtKdeAjkKNeBQKOoUHwL8ZIndvuomDjTmyetpLOXvTfT9sV3ob7jlcIS/g1ZPW0sIxj27JP09BDB7PTJuMNmFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KAkyhy+S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8Qt8g019929;
	Mon, 16 Jun 2025 11:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UkdYK6XKVqdDkxSVM2WvIQGODHgRqOJlLrCfmDL4dzw=; b=KAkyhy+SHeRd7en6
	Wre8xIIXJr4lXZ7zrpUOS/MwwqtdksRA89vPbcLQmOnVZKtLsHVCo7gMKGVzvRPL
	O+VgVMHYz23+iMtBfMrKWNLdOlKcvZJAM9koDROuqQqzAZ8BvLXmXBOv4FQjaPUK
	vbizF8LR5NqVkVwObVeeY5cFEMOSuc4VvoXCkWnr6hN1BjNw1PP93nfwoBn5jU6d
	+rbixTLTxEIEfsf1ED/Nu/fKfy1Mi8BEGoF4urdH+JdLUyDuPlIYGTLATXuMswOV
	WXJYFg09KqQjNTP2Y/EV3SRL/P4DKtPg1QkeRhYKA52OBO9vmtFlT0P1iceWa2T/
	2FBGCQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfcbkm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 11:32:35 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55GBWYCs017963
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 11:32:34 GMT
Received: from [10.206.101.41] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Jun
 2025 04:32:32 -0700
Message-ID: <88a7865d-4c42-04fe-ccd8-90647c5e8a2b@quicinc.com>
Date: Mon, 16 Jun 2025 17:02:29 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 6/6] media: venus: vdec: Make the range of us_per_frame
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
 <20250111-fix-cocci-v6-6-1aa7842006cc@chromium.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250111-fix-cocci-v6-6-1aa7842006cc@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA3MSBTYWx0ZWRfX+egGT+YwmacP
 3jPQLZ7aNbvmgbQe0Z4QN52EA+AlD6fpeqGlDY1c0t374ozAZ0GCYMCmEmpFO3RcZMk6SyeuSmJ
 DCJlRLkpirdH/MndvsqDRsTxI2KSnaipj8RUDlsTnBzJ5DVzfal4MkGNUds256JamLy1/4OONNm
 IoBgf3+vkcAKXEg0zB98B3rjM4bkpHH2/aG4r8ODAh5NpnNZ5UtaDid68zRcfNjRlT276cbdG8I
 AvihZ3/8J3S4FUwX2XUkc7Ruxm/LFKN03nAv6H+InuNIEoYZrtvM6gR8b9VFoj4AUMusaEfe0ZD
 ZM8aTScCr7eUB8Uz8PXS8DSRzhK4C1oXRGBz9LbbfiMxYn7ntNaCsaO23N6ZJvheh+rNpLW5Rkw
 xdMn95Or66cdQDM5xhownBBinWo47iJXLf8N0hncN09lT6O2Ni1akHqcz3zSoID647BNd+ca
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=685000d3 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8
 a=cm27Pg_UAAAA:8 a=COk6AnOGAAAA:8 a=Jj35otvxV6_FfqkHW9UA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2LRMPAE_GVlKsydbvAylR7e1z8Sn-STh
X-Proofpoint-ORIG-GUID: 2LRMPAE_GVlKsydbvAylR7e1z8Sn-STh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=997
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160071


On 1/11/2025 3:25 PM, Ricardo Ribalda wrote:
> Fps bigger than 0.000232829 fps, this fits in a 32 bit us_per_frame.
> There is no need to do a 64 bit division here.
> Also, the driver only works with whole fps.
> 
> Found by cocci:
> drivers/media/platform/qcom/venus/vdec.c:488:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/qcom/venus/vdec.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index e160a5508154..aa9ba38186b8 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -484,8 +484,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
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

