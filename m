Return-Path: <linux-media+bounces-27320-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B828DA4B8F4
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 09:16:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F9E2188DFD2
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 08:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F621EEA5A;
	Mon,  3 Mar 2025 08:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Bmzhnwcs"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50501E9B3D;
	Mon,  3 Mar 2025 08:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740989781; cv=none; b=hM+OiZP5fgD2CDapf7wNk6dMyWJ6XU/i4nYzsonIu0MrNbBe/omcA58DXQtbkSX55rMRGud4YABFettvE9fc0nGwSOUCAosfT8Rla1cSlf4Yo9IG+tZ4DZZA1zqMzvmy3lzu8SSg7h0s8dfT5kjwWwhQ4RaSZ9nHme62lxO4k14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740989781; c=relaxed/simple;
	bh=snJo+3NGpRyC94Rcz8FErDyfwR5EriJ5LEungpm3iZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bTLhZ3wfqDWDV0sO2m+GAM58nllzJl7QJZ8U181gly9VCzealFt4puU5c8Z/ZdfViOJoaMMrmB7MfK8lG6XyO2tergQIkft/6mi7XpRpRQhLjqpKvLBLiQATJr1FR3+qdK7IM0WRfOJROJb9fVhwcDrumzsYSz2EUQ8LgUO4vD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Bmzhnwcs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52300fWI001154;
	Mon, 3 Mar 2025 08:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OIFJa4WhZpyK9Ffdk2fp+kxCySGaf8wagwDQVCjDp3Y=; b=BmzhnwcsHUd5LGbJ
	u/aEWeFgVmSLH1J472ZPnCRFbetpwnK0XrJR/nUlphkGJp4zYKS1Qegys8sUcuC4
	5iwR4i+H48/aGLz/xTw1lQpL8ANJ+BhrwGtq6iWuCWZDf2F+Lnc2RR53wKVfedSu
	FRi7DnWXiw6dZHl5/qlMc9wgE/W2hL9JpWQWzThd2iuOxPFOgTdaNfC7smklIfES
	pSYELCfWx41PsBB3Ym254gWnRAhQcbduL7s3KOh7j6Cgt82MDuiOjiN4M0u6+LyT
	azEya/2CIlMnjC5blIle49yvyK980Yq096mgqaq6HDg3yQ8p1p1dV12OODxt+2Bs
	pBp68g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453tasc7ca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 08:16:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5238GAkb008570
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Mar 2025 08:16:10 GMT
Received: from [10.50.28.15] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Mar 2025
 00:16:07 -0800
Message-ID: <18aa7433-4eac-f632-0787-c56fcb363fd5@quicinc.com>
Date: Mon, 3 Mar 2025 13:45:52 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] venus: vdec: queue dpb buffers to firmware for video seek
To: Renjiang Han <quic_renjiang@quicinc.com>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250227-fix-seek-bug-v1-1-497ee6406477@quicinc.com>
Content-Language: en-US
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250227-fix-seek-bug-v1-1-497ee6406477@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OtwKdNZylEqQXlZ4evboooJAPMv5ysDg
X-Proofpoint-ORIG-GUID: OtwKdNZylEqQXlZ4evboooJAPMv5ysDg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_03,2025-03-03_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030061



On 2/27/2025 8:13 AM, Renjiang Han wrote:
> For the seek case, the input port will be called stream_off and then
> stream_on in the driver. Firmware will flush all buffers during stream_off
> input port. Therefore, driver needs to queue DPB buffers to firmware
> during stream_on input port to ensure that decoder can decode normally
> when it receives enough input and output buffers. Otherwise, decoder
> will not be able to decode due to lack of DPB buffer even if there are
> enough input and output buffers.
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/vdec.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 6252a6b3d4ba6d49b343bb53dfb7b0e683410bb4..7d932c985a0b82aa547a7ada75b620c65cb44030 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1110,10 +1110,20 @@ static int vdec_start_output(struct venus_inst *inst)
>  
>  	if (inst->codec_state == VENUS_DEC_STATE_SEEK) {
>  		ret = venus_helper_process_initial_out_bufs(inst);
> -		if (inst->next_buf_last)
> +		if (ret)
> +			return ret;
> +
> +		if (inst->next_buf_last) {
>  			inst->codec_state = VENUS_DEC_STATE_DRC;
> -		else
> +		} else {
>  			inst->codec_state = VENUS_DEC_STATE_DECODING;
> +
> +			if (inst->streamon_cap) {
> +				ret = venus_helper_queue_dpb_bufs(inst);
> +				if (ret)
> +					return ret;
> +			}
> +		}
>  		goto done;
>  	}
>  
LGTM.
Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> 
> ---
> base-commit: 63b3ff03d91ae8f875fe8747c781a521f78cde17
> change-id: 20250227-fix-seek-bug-7d3cf544bd2f
> 
> Best regards,

