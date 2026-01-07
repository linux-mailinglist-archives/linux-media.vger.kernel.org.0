Return-Path: <linux-media+bounces-50124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA5DCFD37F
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 11:38:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDA3D3009A84
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 10:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30BA8325483;
	Wed,  7 Jan 2026 10:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnE3kJBy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RM0vuCGH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA2230C345
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 10:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767781758; cv=none; b=lSSc9gwCBWaDZpZahmM42FtEins5Ar2i84ejNdcdV2sMHMMv0wSqNbY362l44QdaINSq+wjPNfpM12qH7N2QRqo+AGG8VvYP5aF0FpdxAG4O1LEgqJVQETDsRcxjolN4NyYdjut6uAJvOApTC8Z8oB373iFOlV14ZsnUKmHB54w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767781758; c=relaxed/simple;
	bh=MkZUUsosIbWtTh1KywQEeJbpJQNDdOS1yOnEsYAIu5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BHQBDNVU65ND8ut9CtFFg4OelPnYFTkdgOj/X/FJDOuTTbh2f13bnLTj/s/EpJ+oTjw5yGOtyU8bdR7zLJ7MbufVpY9QYPryoNPxytUkPlz2/W8qL9aT2kO0jCNKMF3TeQfbb0GafRN8MVSG2QhJ0bdN3UgGw4ojc/rsf7In9fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RnE3kJBy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RM0vuCGH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6076tHab2378917
	for <linux-media@vger.kernel.org>; Wed, 7 Jan 2026 10:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wk3VdG8u9PPmzTOfTx2vyiB9nQj1fTzdDljRD9EVFr8=; b=RnE3kJBy7en4oJgq
	qBuvTRr5VmIOMPF0Er52IDvAHAprFpzRKwj09LhsNGL58LR88K2/Mi5NeNTncSjJ
	225TGaX2lmhAhhSANzhNfH3KVs60AEu9PwwjGQc+3bAy/1S+mu7FeuD5P9fIn45P
	7QvOeDpy2HMEPaDCw4ML0zKEdW3lgpDGJ3lNoBRkuVWOLmBmhTRwaL5O8de4HJ8F
	NTwzIlaQ34HDHKaByFQB+eROQBNjkqbyK/Fl5rqjk8HUq7PY/G73mcuyScn1WZin
	frbopWfh1678UxIb1fWr++2uZdEHqPyVudiXD/l2vWQXhtFMqVA1bxPBMeXF3xSq
	5EJACw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhjn4rph4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 10:29:16 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7c240728e2aso3306346b3a.3
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 02:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767781756; x=1768386556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wk3VdG8u9PPmzTOfTx2vyiB9nQj1fTzdDljRD9EVFr8=;
        b=RM0vuCGHspIUZ/CF7y+hcjyAvMiQWW4t88fXEJF29VaEUPB/WXsmdF+filEZzE86jP
         XSzbiY7xu8Bx08WYDYrhsQ3pgUHai3cNukCT57jKBjwS6iv7DgImzg+eYYiuuOmy7Szn
         yCIoEcwaHACVbQjxErxu4PrypBn4oAGRmcUPbP2SLCQvH9e4swXaNdwTTURpKW1Uvl0j
         7W42wwEs9MKtW3MsGJScjl22KSbHqvln3QexRCNrFLmSgmS2+YPjVD2Rgrt+xMvuvuRr
         KPUz4a/zz1/v1+dwoUaSU99FxCMZQUI+EzXEhMEQWdPlnDvjxSiwM4sfBzjnEr7toLQQ
         09zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767781756; x=1768386556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wk3VdG8u9PPmzTOfTx2vyiB9nQj1fTzdDljRD9EVFr8=;
        b=abchzWEcDAIVICdgR3EHh4XsEdX3+c7oz6JTc1ep1FLytr0ttIBbjRa/DBhKgb6Dae
         OQf9qqmHVTZvO1tUE8sWF4JnV5/ByElxcRAvQrOeaBwpwRPtekDTA9mvgWho+KuShZPM
         wWmkdOvncwDGYASXPw6296aWLwceDoVQjYxEVSjAQUeWknMEvl5r4fNlg3zCjXSRe4mj
         FyhJpSWF/prSZ8YNWwsLl666/kb3gAdoSqxckvgb2RgxmB9z/olJZgw0HShhKi2Ll/Hd
         fM6WSIth8vWD3nl9ie8tAaHufgZOKlnEs8Lqn4oUna+Y9a/X3OG2F8fP64fIVrKtPo8+
         X+Yw==
X-Gm-Message-State: AOJu0YyhKOMV2hFCalyOOWQqD/ZJ6CTL4z+fBZiCwpdT2wpAO69jXwyw
	pvQTY0kiaWB7LVMTDpYf9dQNRwY0u/cWSUO18hhREH5wzFpZuThFwo8n5PJtBKUBrhUnGFPmJlS
	dhXZHb4AE8XMQ+oNO6f01Oh7Pu4waDuPO6LImRvWwQC7tglU8SM09yi9xvHZ4K9/4pg==
X-Gm-Gg: AY/fxX6DsoDI4hGm3BGfJbzDZ+JYHoG1Vcnt8u+gmXhti/s47wLb1cMYTcThh8w0F4P
	/V32yXPi7Tflc4r1s3hcxt901liwMB7kmZoM5QMmKMH8TIVkIrdRMRqJ4iWoxKbHi1gvWHmbMMV
	ljjKdYOptkbsXRJEkqyfJLbEt4D5mvCu595hauf2SP7zmPbT0Kk0LEx9TrX5kZzXbnXQoP5R0ee
	whwUUB1PoxpYZqHK4u6o7eJzV/BDEO9yPxAtrrY4DsBCQH/h8wAf/+K1AILgLH/pGm9qhWLnWPd
	NhQ8wOopN79Q6MHSSlM0bvniBkM3mUTkWVeq2uwlCVjVaI755l2SUQfQQgdEZRE9ADrEOZxaut4
	ftMh+B0OrRCAxKlzvfF2ZP3EpyCK3RRlwUqz854F/nQ==
X-Received: by 2002:a05:6a00:2790:b0:7e8:4398:b363 with SMTP id d2e1a72fcca58-81b7fccad22mr2005752b3a.54.1767781755801;
        Wed, 07 Jan 2026 02:29:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCiNAIBU5uyWlpVFXW3FScEBoUAkVX1z6Qdax3oFu7IDUlYGwR8gLa1CL8OjcZk3UenhR2xQ==
X-Received: by 2002:a05:6a00:2790:b0:7e8:4398:b363 with SMTP id d2e1a72fcca58-81b7fccad22mr2005731b3a.54.1767781755357;
        Wed, 07 Jan 2026 02:29:15 -0800 (PST)
Received: from [10.206.101.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81a8fafaefdsm4225240b3a.45.2026.01.07.02.29.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 02:29:14 -0800 (PST)
Message-ID: <9fc65bf1-400e-4908-ab40-dc4895948e50@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 15:59:09 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] Revert "media: iris: Add sanity check for stop
 streaming"
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
 <20251229-iris-fixes-v2-4-6dce2063d782@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251229-iris-fixes-v2-4-6dce2063d782@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LJhrgZW9 c=1 sm=1 tr=0 ts=695e357c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=72EP17BqmB737NicdN4A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA4NSBTYWx0ZWRfX4BxcJAiZEFhd
 Q+swg4nU7fTi01H+AWd+41qRTsQ/TMNYSExq+VQShZ8CCLUwJUjoWnx2WOsxmdwFFYAUESx4evU
 s3mv552e82LAsSZxKxeEkdSbCyNQoeSBmLzcK5LP49BpuEHyrDBO4b4Zj0o3jP3RUiS2CALTEy7
 z2kCGPrkirIw1J1gdgSI++7AsPZtCtH0LWVINHq3aOL1QvpLc9eCiCx7adyDEwLAHHeXevtXtQh
 rzZ7YG3o5e+B4iSM8JY/yvcU6XUjJkufzdi7aEqFkBL9vfW03/jSV7zBnsb8AziIg9F4Nw1Wm9R
 LyCzANGTmVQjmwMrTEWLYiDkK2ZibqpH/y4FviyDcUwquJ5Dv2z9YOpBq1BvAkXeA6z+RVmof3i
 osYApOqVsIQfOl60Ja89I+7Q2yr+cVolUcC8jSS0xC7YUexGy5MJWOe5FsObBj/UjrIRO1a9dsm
 dEr6uXyQNoBQqcb0bZA==
X-Proofpoint-GUID: rZa5P6vn_zOLRdW51ttLyJtkhED_gZOM
X-Proofpoint-ORIG-GUID: rZa5P6vn_zOLRdW51ttLyJtkhED_gZOM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070085


On 12/29/2025 12:01 PM, Dikshita Agarwal wrote:
> Revert the check that skipped stop_streaming when the instance was in
> IRIS_INST_ERROR, as it caused multiple regressions:
> 
> 1. Buffers were not returned to vb2 when the instance was already in
>     error state, triggering warnings in the vb2 core because buffer
>     completion was skipped.
> 
> 2. If a session failed early (e.g. unsupported configuration), the
>     instance transitioned to IRIS_INST_ERROR. When userspace attempted
>     to stop streaming for cleanup, stop_streaming was skipped due to the
>     added check, preventing proper teardown and leaving the firmware
>     in an inconsistent state.
> 
> Fixes: ad699fa78b59 ("media: iris: Add sanity check for stop streaming")
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vb2.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
> index db8768d8a8f61c9ceb04e423d0a769d35114e20e..139b821f7952feb33b21a7045aef9e8a4782aa3c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -231,8 +231,6 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>   		return;
>   
>   	mutex_lock(&inst->lock);
> -	if (inst->state == IRIS_INST_ERROR)
> -		goto exit;
>   
>   	if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
>   	    !V4L2_TYPE_IS_CAPTURE(q->type))
> @@ -243,10 +241,10 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>   		goto exit;
>   
>   exit:
> -	if (ret) {
> -		iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
> +	iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
> +	if (ret)
>   		iris_inst_change_state(inst, IRIS_INST_ERROR);
> -	}
> +
>   	mutex_unlock(&inst->lock);
>   }
>   
> 

Reviewed-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>



