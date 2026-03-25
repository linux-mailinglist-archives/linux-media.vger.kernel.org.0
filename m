Return-Path: <linux-media+bounces-56952-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qP40LpyUw2ncrgQAu9opvQ
	(envelope-from <linux-media+bounces-56952-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 08:54:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD8A320F1D
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 08:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B098303AAA1
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 07:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7453932FF;
	Wed, 25 Mar 2026 07:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocIvucwT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hYJqwdBW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7773932C3
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 07:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774425203; cv=none; b=kFl4XSu9RzYJrr7U07nUrXQo5YKKzpSDF6mfR0B9DTHaRJNY0oQlemZ99RlTpXNFKag+Pgs45MDLQlqnOzJ19Ljc95u2g+fs3RUbviGQvztv6zeowvOV1htXaDHHE4PEjsK3yOyGBRKBaQEKA6IdLhQnJJFgCrmMYkY7HkrNOqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774425203; c=relaxed/simple;
	bh=VXkJN4Kl+ZASyeCC/VdbGUtIGaTdV9woIEAznZCxA64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IxItlJJ+yMl4hIL4pdbPixLbC0UbQ31gx2EaVBJx+lW2lkeHb1t43BLS2Z+UFJ/r4Z/rivniUJE+xaBbShtwM+qJqYqTbyBDBONFLeWxI/iRnDJONBXZxNaXnxOZR2vCin5hH/NNE8lZ1ToBHEttFB9XYnaijJDr/TBwuQS3vD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ocIvucwT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hYJqwdBW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P5Wddt2075395
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 07:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DySCntb1zXYgrtxOMXpVWEI01R8xxlo7pSRoUDAwyFw=; b=ocIvucwTxpdsQmPK
	eruF0N7ZtHsEuBs1RHNS+e/ckAp6Sd8fVmYEdYg6Fe8ZSYcMNgimdylqCd7UcuG7
	4ocfMVfOUmt4egh34JUwc6p6wR2xbMOMO4zT1JoZ7RpA9rbAXzcL35aNoGIjrf1Y
	U1fQiz5lf5GzqF7OAg959YiLz9kIOJ5TV8tFIr/+HVDSlILcq7sbmcvX0WtKlNdx
	qJl01izb75z8ZORmVMLyqKIOz38WR7BixuV+Fx7ytUrVVJhho92bqV5/WliH1a1s
	tAdXHQsxgxrTrWsOiaTuEVCZNW9hsY0YiSBTD39U3G0yLjMZkERAGLP99APyY1Zd
	4ZnpLg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d414123na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 07:53:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a90510a6d1so8134195ad.0
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 00:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774425196; x=1775029996; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DySCntb1zXYgrtxOMXpVWEI01R8xxlo7pSRoUDAwyFw=;
        b=hYJqwdBWqpa1yrUEQYW52KB2Ajcdm0ImJ4Be8BHeu3Zuoie8hKJN94ldxdCZkMcD/x
         H3d+v61SYk5L8E76UFUE6KmoOPput1BKoGBcW+dgVy3bekSyp9TzIEbktH+WZ6H/XCf4
         /SQQUZNcui29zIXnlRjgcMt9ETzIrTITmNMaCZi6eACPOAiYPau6M/RP+xgFjKfK3jnI
         HWxZZY3rQsV7gcIlX+TD2qxmMMHE5ZJb+6RGg3nHJ31mbIaAZqqDIS6Hk7DXzcx/hm+C
         38565JwZsnkvTfuCI/e+yti2VXUzFWpLion1ji0guc1SzYpSsCrYXyWGbAqdnbqg/Ar5
         XOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774425196; x=1775029996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DySCntb1zXYgrtxOMXpVWEI01R8xxlo7pSRoUDAwyFw=;
        b=NVUbw3IVjfcsZuLfGWtHhJOXqooqKjQOi4VTIqant9V1j9/WieMcmiNMvS5SpO8u2S
         mpZssaE8vtqkCcT4cAuSHTNsnnxl54sNQk5+bSue6m8TxllPNvj85Lok6IzxnKlbqeJ0
         ycR6c6+RBCUgL5WeltZcS8yxzz8V9A3yEdT6nLif2baKx+POmkd17RLAM1A8yta2Sk6m
         glpECgOBzA9S6r9mOuPUmqrOpnPzi4RO8ITLL5IG2zHlKcGpaYMd2sARc60m15rPH2Cx
         uQQXL0Zogsi3ibCee3qY/cQt+nOb142MAhkymk2ri1K44BjJ7pHguJTLJ+90ap9b3Rq8
         80Tg==
X-Gm-Message-State: AOJu0YwV2C+q1NL6pUx+ArPArOkeJlsY4F8GxB77t0u+AKEkCqnVlP7R
	6zTCHy78lBFAzfOU5P6FSSj63yNI4irWzlgBt1bxC/bAllKF3Rh69E5hXKh0eHnPn97eRMtH62/
	4qo6PZoJgx7XSBKpfhnPyBV0+nxVp4BkSraPjkWlA6k5Ft+wElxvEBknnpHSPCrPhEw==
X-Gm-Gg: ATEYQzztR0t2hfR6cY3JnjrXPnN02lMo7VWBjIJyzMuwVnldv19sIYS+80If3ZZm0YZ
	8i0ZoF1YYxBkyPcpGyQvY0nsC6vJQknVZWbm+3g0CI1vzg9YdHTis67Yo8JDfCyUXdeo7EYwDan
	/0DNxythnwlK3tTCPndrB/WRaJHGwA1GqpfHXMUx1fbZRMzfofk7zBkATawveqeR70hCbpCR6Gb
	J47i9dPaJAUVpsVd7Mod2T1iUquHPG6T1HxHCvAkDG+6qB6Hj22+S3vOIXD2s1wWd3Bq9rih0vy
	wUxftUIQ7bRZ44lMCfRXxGOcV1TeGzOGJlkh4QeZjcnmnlv+RHuM5NZmP9uinORwtLICUkQA5i9
	5miGh0f0mTa3PuAz2QrNCCtWHtyGWWhVD0BW0FM+ZyjOthkVeqDNmyQ==
X-Received: by 2002:a17:902:e80a:b0:2b0:b7c6:4ae7 with SMTP id d9443c01a7336-2b0b7c64d78mr3400245ad.1.1774425196060;
        Wed, 25 Mar 2026 00:53:16 -0700 (PDT)
X-Received: by 2002:a17:902:e80a:b0:2b0:b7c6:4ae7 with SMTP id d9443c01a7336-2b0b7c64d78mr3399995ad.1.1774425195495;
        Wed, 25 Mar 2026 00:53:15 -0700 (PDT)
Received: from [10.204.101.77] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08368ea1bsm210836495ad.68.2026.03.25.00.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 00:53:15 -0700 (PDT)
Message-ID: <4a81a54d-2dc5-476c-82ed-9481aee8515b@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 13:23:11 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: iris: add FPS calculation and VPP FW overhead
 in frequency formula
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260325-update_fps_calculation-v3-1-b2ec654f7e4d@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260325-update_fps_calculation-v3-1-b2ec654f7e4d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c3946c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zq2kz8iOUWQeT6CNkjIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: CNCc8DB1F9cbhVZJjegcKwM7n4_CzCW3
X-Proofpoint-ORIG-GUID: CNCc8DB1F9cbhVZJjegcKwM7n4_CzCW3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA1NCBTYWx0ZWRfX0pdaL+YCgPJK
 W5v3+t5H40p2ztpfPX/bAhdk9tysK9Z2HVPG302fxqreHMsJ0KS+9bJMU2jwY+QHv5QgYnms3NV
 2UfU/SHlsOUNFsO7k2IRGGiM0EyoDC/y62XkwBCTj9UzliJkteERWIjYPdonlIVEhOT88KxXC2y
 ns1bLC2SRciTlRWiUe7mgnfm51jgJT5xBlJcuXJfb0/UQeWFyoKodTKMIOppGbDA/hf6qsTDzOs
 J/wuVXzw73QpDHFot/MYOwo7Z/h1YyaG1WJsPQOw6cct0jPbkQbi6BxilVUwaaXuxA4UDmWMWx8
 pdPG3wQlwXbvc1YIL2yGhVcRBxRuX8Zwb6JuadAFRT5ADUnsGeRU2pTCeyawzGxM9yNGlRor51T
 H/PBXNPxETrZ62JCYveaY+VjXrwgBVdVLajbS9FXVcZM3imEhrB0RMU8fRkQCe2VUdq/OxXByI5
 wliRYqZ6ZlpWy/oOW7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250054
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56952-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1DD8A320F1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/25/2026 9:58 AM, Vishnu Reddy wrote:
> The driver was using a fixed default FPS value when calculating the VPU
> frequency. This caused wrong frequency requests for high‑frame‑rate
> streams, for example 4K at 240 FPS. Because of this, the hardware was
> running at a lower frequency than needed.
> 
> Add the FPS measurement based on the decoder input buffer arrival rate.
> The measured FPS is stored per instance and used in frequency calculation
> instead of the fixed default FPS. The value is clamped so that it does
> not exceed platform limits. Add a VPP firmware overhead when running in
> STAGE_2.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
> Changes in v3:
> - Updated the frame_count condition check
> - Link to v2: https://lore.kernel.org/r/20260305-update_fps_calculation-v2-1-e3b5cccb1246@oss.qualcomm.com
> 
> Changes in v2:
> - Replaced div_u64 with mult_frac
> - Link to v1: https://lore.kernel.org/r/20260304-update_fps_calculation-v1-1-4eeac373a504@oss.qualcomm.com
> ---
>   drivers/media/platform/qcom/iris/iris_instance.h   |  2 ++
>   drivers/media/platform/qcom/iris/iris_vdec.c       | 21 +++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.c |  6 +++++-
>   3 files changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 16965150f427..180cba36a7f2 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -109,6 +109,8 @@ struct iris_inst {
>   	u32				metadata_idx;
>   	u32				codec;
>   	bool				last_buffer_dequeued;
> +	u64				last_buf_recv_time_ns;

s/last_buf_recv_time_ns/last_buf_ns

> +	u32				frame_count;

s/frame_count/frame_counter

>   	u32				frame_rate;
>   	u32				operating_rate;
>   	u32				hfi_rc_type;
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 719217399a30..6d982802e5d4 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -369,6 +369,8 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
>   	if (ret)
>   		return ret;
>   
> +	inst->frame_count = 0;
> +
>   	return iris_process_streamon_input(inst);
>   }
>   
> @@ -411,6 +413,7 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
>   {
>   	struct iris_buffer *buf = to_iris_buffer(vbuf);
>   	struct vb2_buffer *vb2 = &vbuf->vb2_buf;
> +	u64 cur_buf_recv_time_ns, time_delta_ns;
>   	struct vb2_queue *q;
>   	int ret;
>   
> @@ -427,6 +430,24 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
>   		return 0;
>   	}
>   
> +	if (buf->type == BUF_INPUT) {
> +		cur_buf_recv_time_ns = ktime_get_ns();

s/cur_buf_recv_time_ns/cur_buf_ns

> +
> +		if (!inst->frame_count) {
> +			inst->last_buf_recv_time_ns = cur_buf_recv_time_ns;
> +			inst->frame_rate = MAXIMUM_FPS;

move this to default initialization

> +		}
> +		time_delta_ns = cur_buf_recv_time_ns - inst->last_buf_recv_time_ns;
> +
> +		if (time_delta_ns >= NSEC_PER_SEC) {
> +			inst->frame_rate = clamp_t(u32, inst->frame_count, DEFAULT_FPS,
> +						   MAXIMUM_FPS);
> +			inst->last_buf_recv_time_ns = cur_buf_recv_time_ns;

drop this

> +			inst->frame_count = 0;
> +		}
> +		inst->frame_count++;

move this above IF block, so that the reset of 
inst->last_buf_recv_time_ns can be handled in first IF block

> +	}
> +
>   	iris_scale_power(inst);
>   
>   	return iris_queue_buffer(inst, buf);
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 548e5f1727fd..d621ccffa868 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -416,7 +416,7 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
>   	u32 height, width, mbs_per_second, mbpf;
>   	u64 fw_cycles, fw_vpp_cycles;
>   	u64 vsp_cycles, vpp_cycles;
> -	u32 fps = DEFAULT_FPS;
> +	u32 fps = inst->frame_rate;
>   
>   	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
>   	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
> @@ -435,6 +435,10 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
>   	if (inst->fw_caps[PIPE].value > 1)
>   		vpp_cycles += div_u64(vpp_cycles * 59, 1000);
>   
> +	/* 1.05 is VPP FW overhead */
> +	if (inst->fw_caps[STAGE].value == STAGE_2)
> +		vpp_cycles += mult_frac(vpp_cycles, 5, 100);
> +
>   	vsp_cycles = fps * data_size * 8;
>   	vsp_cycles = div_u64(vsp_cycles, 2);
>   	/* VSP FW overhead 1.05 */
> 
> ---
> base-commit: f505e978d1a0442adbbde48aed38c084ddea6d6e
> change-id: 20260304-update_fps_calculation-98ee7f7507b1
> 
> Best regards,


