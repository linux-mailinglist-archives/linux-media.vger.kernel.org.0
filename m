Return-Path: <linux-media+bounces-14963-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E39692FB5B
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 15:27:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1144B22A6F
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 13:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5066316F91D;
	Fri, 12 Jul 2024 13:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G6E3CZhJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A9715CD75;
	Fri, 12 Jul 2024 13:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720790848; cv=none; b=PC//39+2lKCMg0ib6L/Zyi2LKSUSYvh2Jrm91nDwgNN5/dotLZ7l5wPBI6pkuNe1eQzPzk5xL8jlb+pfK8HuezB17yNqyQz6hCzhd8nJlMrRU/8k+3IGcn+ASMhWEMqxgn5HI2HMU/bTw1lxfs1ZglpBWY8emwjjfZ6AcL/L/JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720790848; c=relaxed/simple;
	bh=kovs8atHdA3qYjfsMg3238UX/Gd9NWs+o4VgdmMSwVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pYG7Kn8GfURYzG7zSh8TwpBdBzupRJ7XkoGn2RExCjiV0iINiAtNneSPDZiDRQa3jwBFwj6Qe8wyizVVwLa+lst388/UGSkDetM6KroRMzscwlgFCSkP5Uz1g9qcKPpSwil0TQYnv1PVPLammY7SdXuyZxSPyQXwKVhpx3CZyiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G6E3CZhJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46C5eSRq017618;
	Fri, 12 Jul 2024 13:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OIG5Y5G2hILIN1sgx3ToMhbIOTJJ6fHkgs7xaMlvlbg=; b=G6E3CZhJgLsMHI4b
	S0FsZgdVSRqgnLW2NWKXLVHzGg2JhaiSn81u6POfAmsMnd+fRmYaapzT5Jse5K5n
	0aaNzheoEwLP69Xxj+dvNHpOxNH57LJJhf3Mtu28ERb3KeKGopkeyvoc5is4CvQG
	U4qbRT7IcVAo9XrH8x4JYLCZT/qaeEygHR1pMxGoCXfWRwq3hFp/PRNzKdE2Drhm
	GEbwjpicTCaxoybsLUaT1tQL4UvT6jxbQDy5IadFWs3UZVEyqCZpOdK6wu2fXgXE
	NStG1lTCD5r12490POiT2VnSElJUI8xVZdUHCrRT5v8rTWfWn+l3MDu2uKeFGudC
	ReBEjQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40a8uhv5q0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jul 2024 13:27:21 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46CDRJXa001184
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jul 2024 13:27:20 GMT
Received: from [10.216.15.10] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 12 Jul
 2024 06:27:16 -0700
Message-ID: <6e1affa3-9570-6a61-2290-be4097a2330e@quicinc.com>
Date: Fri, 12 Jul 2024 18:57:13 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] media: venus: hfi_cmds: struct
 hfi_session_release_buffer_pkt: Replace 1-element array with flexible array
Content-Language: en-US
To: Kees Cook <kees@kernel.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-hardening@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240710230728.work.977-kees@kernel.org>
 <20240710230914.3156277-1-kees@kernel.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20240710230914.3156277-1-kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: s4DycOXY3sV0Ts1H_0ZKYnZQNnwpMTYm
X-Proofpoint-ORIG-GUID: s4DycOXY3sV0Ts1H_0ZKYnZQNnwpMTYm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_09,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1011 mlxscore=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407120091


On 7/11/2024 4:39 AM, Kees Cook wrote:
> Replace the deprecated[1] use of a 1-element array in
> struct hfi_session_release_buffer_pkt with a modern flexible array.
> 
> No binary differences are present after this conversion.
> 
> Link: https://github.com/KSPP/linux/issues/79 [1]
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
> Cc: Vikash Garodia <quic_vgarodia@quicinc.com>
> Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-hardening@vger.kernel.org
> ---
>  drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
> index 20acd412ee7b..42825f07939d 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.h
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
> @@ -227,7 +227,7 @@ struct hfi_session_release_buffer_pkt {
>  	u32 extradata_size;
>  	u32 response_req;
>  	u32 num_buffers;
> -	u32 buffer_info[1];
> +	u32 buffer_info[];
>  };
>  
>  struct hfi_session_release_resources_pkt {

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

Regards,
Vikash

