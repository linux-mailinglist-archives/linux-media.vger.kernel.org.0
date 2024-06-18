Return-Path: <linux-media+bounces-13546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A15A90CBF6
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 14:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2A301C22407
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 12:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0097215666F;
	Tue, 18 Jun 2024 12:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dECsmbWT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FAE15530C;
	Tue, 18 Jun 2024 12:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718714200; cv=none; b=Ir8KZom2w2uo3yDltUoPb0IuIQr7x9DWut/ms8OCOOpIY84IlXC2VLv5Oe2nZAaTLLPBjBIBwAkA8AOABI6G8njDGnDXhZh6ngglCZAJUaKxaGVCY/6A7VL27HguA51iZQWM1+7/u/t6V2+JdJ4UKup+u2M719DagaB6W4sf7K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718714200; c=relaxed/simple;
	bh=OBcdjLrWWFK3QokNiE+RzQm1SYM29rnb0cpZDwr2rGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y4o702rkcLhUalpYYKzsKBdLMG4YPgOiCG35gEXFwlypTSrU6+LZLvNf4mWl3sDfV71dDDHR+dPRkfi2ap6l0r3QCpbPxl2WEprRcdBW9gizxYw+xTCuuqYddEnMK3mExUEHh3RI4TB7+/PBxOlXxeVNtUX7zVoONilrRpk/X34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dECsmbWT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45IC8tGl019570;
	Tue, 18 Jun 2024 12:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T5gyq14bj4+J/6gdfSxcbHQ8pwsxw9GLir8vbhb2hgc=; b=dECsmbWTg13Wcwal
	U2Iep6Ijmdv3JkObB9SOXZUBZ2HmS4rHO4sfDukHlCqFbbHzO6q8eiCWFiWDBJlg
	Ool9JmAUAB0Pjf1djFgNcc7HId5XpwKoZ5r+LadQGD+By8DL6ZoQ9B0fo/7Vgp+6
	ADYRbVxHeye52q1HRWfhMPURlqiL/Wyz8VKd9AyV+ECTPfKGKlf/eoBvl8Uulk2C
	CqFriOjKabjHBDqX1ljncc32+7/Wp5BkLDAFs8jlTTtNqKuNDoZMFadkqL7G4Npb
	z77siYlGdF6TPUoPmJk9Z7WYjkRZbf6OeQcXTCHIFqYLAtCR5OPMAxSzWugkomgX
	mieXYw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yu22gs8ba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 12:36:34 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45ICaX7B020572
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 12:36:33 GMT
Received: from [10.216.29.175] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 05:36:29 -0700
Message-ID: <4e3d8f03-11d0-7728-1068-1c965ef79a1a@quicinc.com>
Date: Tue, 18 Jun 2024 18:06:26 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4] media: venus: fix use after free in vdec_close
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov
	<stanimir.varbanov@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <1715231669-16795-1-git-send-email-quic_dikshita@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <1715231669-16795-1-git-send-email-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nKOpWW-_hJ1r8GSBrkvzwJhLjtc01U7K
X-Proofpoint-GUID: nKOpWW-_hJ1r8GSBrkvzwJhLjtc01U7K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 clxscore=1011 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406180093


On 5/9/2024 10:44 AM, Dikshita Agarwal wrote:
> There appears to be a possible use after free with vdec_close().
> The firmware will add buffer release work to the work queue through
> HFI callbacks as a normal part of decoding. Randomly closing the
> decoder device from userspace during normal decoding can incur
> a read after free for inst.
> 
> Fix it by cancelling the work in vdec_close.
> 
> Cc: stable@vger.kernel.org
> Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
> Changes since v3:
> - Fixed style issue with fixes tag 
> 
> Changes since v2:
> - Fixed email id
> 
> Changes since v1:
> - Added fixes and stable tags
> 
>  drivers/media/platform/qcom/venus/vdec.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 29130a9..56f8a25 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1747,6 +1747,7 @@ static int vdec_close(struct file *file)
>  
>  	vdec_pm_get(inst);
>  
> +	cancel_work_sync(&inst->delayed_process_work);
>  	v4l2_m2m_ctx_release(inst->m2m_ctx);
>  	v4l2_m2m_release(inst->m2m_dev);
>  	vdec_ctrl_deinit(inst);

Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>

