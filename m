Return-Path: <linux-media+bounces-15969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B99694B804
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 09:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8E461F21B40
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 07:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D41B188010;
	Thu,  8 Aug 2024 07:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PiGHdaIu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B8E7464;
	Thu,  8 Aug 2024 07:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723102810; cv=none; b=JjuYNhmzDcKFWhoXfrsAmd2i8tBhvv9wK+B3QrLdjti/yjrS0l9rzeOEtVBryzEWG1lWDN8i2GRbn2r6Zqu2bkBUtcn+adKg/m5SLxaTTrAxZUKbzAwmpRgv950UxUn1PPo5p4EdNHCO5uWBa5aFg8/kI32jFeoY4hTbJitvCD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723102810; c=relaxed/simple;
	bh=Nbgkw3f3Qr2vr/YjDzqLKkndPJMXZ9dg0z3eU2PJcFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UD8sEfodyv3qAP8anfVElDBlPo4HLQfJjuvQGlZt94Dhvmhsq8AtK8YqTSpzWHMIP+ZmZBM3ecsUM5Ruq1ILwRtzq8XYBLGO0ORZjo6pNZvnpAFWrr1Ch3tJmlPwoohE4FKTnGKHOoJdZ3ZlA0uBkujsmbzn4CJws1c+LT+SI+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PiGHdaIu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4784H0uq010740;
	Thu, 8 Aug 2024 07:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JdVcPuBF84COruSyTlG2VqCNT1AqIQaC1CfFDuFqCM8=; b=PiGHdaIuUH2whPqW
	s5ggH2Ov7/oZdxtCLojxX17gHjfVYtraVafyQ6v33mkJJrfT8+XEasaXy7P5oaqs
	xAeGaDgwsjErYker7m+eNwOzTtJu602OKuEXdEKDzbvTM53hLsJpJmyduhKLTara
	Z7lSEkU9/svy78kkIa5JqqS5KA5rdhQFh7NHsr0D66eg7eaSQJbx4hnjP0Lh08Lc
	hAqzU6njNcy1EePtytCHcUYYqX7RL7rUl29Nbm5Ccv1olq3QkiKA5gj3KJvCzA7f
	85ql2AtMiFzmhsKPeIuo2vukWwWC0/r/qEMbSOAHSNf5+F/86twQA3EPRj9dokpv
	42+ZAA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vpuvgdap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Aug 2024 07:39:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4787dwJd023921
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Aug 2024 07:39:58 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 Aug 2024
 00:39:54 -0700
Message-ID: <167bbcf1-8d44-41d7-102f-4e8f1adc1519@quicinc.com>
Date: Thu, 8 Aug 2024 13:09:51 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] media: venus: hfi_cmds: struct
 hfi_session_release_buffer_pkt: Add __counted_by annotation
Content-Language: en-US
To: Kees Cook <kees@kernel.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-hardening@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240710230728.work.977-kees@kernel.org>
 <20240710230914.3156277-2-kees@kernel.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20240710230914.3156277-2-kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xK4b6IF4D_yZmQGcQ2Whugfn39U976ex
X-Proofpoint-GUID: xK4b6IF4D_yZmQGcQ2Whugfn39U976ex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_07,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408080054



On 7/11/2024 4:39 AM, Kees Cook wrote:
> The only direct user of struct hfi_session_release_buffer_pkt is
> pkt_session_unset_buffers() which sets "num_buffers" before using it
> as a loop counter for accessing "buffer_info". Add the __counted_by
> annotation to reflect the relationship.
> 
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
> index 42825f07939d..1adf2d2ae5f2 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.h
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
> @@ -227,7 +227,7 @@ struct hfi_session_release_buffer_pkt {
>  	u32 extradata_size;
>  	u32 response_req;
>  	u32 num_buffers;
> -	u32 buffer_info[];
> +	u32 buffer_info[] __counted_by(num_buffers);
>  };
>  
>  struct hfi_session_release_resources_pkt {

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

Thanks,
Dikshita

