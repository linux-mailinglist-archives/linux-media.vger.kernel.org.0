Return-Path: <linux-media+bounces-55581-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJL9F9S7s2nEaQAAu9opvQ
	(envelope-from <linux-media+bounces-55581-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:25:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A7827EC05
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:25:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8D6230379A4
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 07:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940DB344D92;
	Fri, 13 Mar 2026 07:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GpZzOZJ+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gDGjlygD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2169B282F04
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773386700; cv=none; b=mAGuQORdhWLSrC26bltvfUn9YhQYoKO5f6iyya8Vq3cWNg3tkhdEXvbmmYREhPju9YwmUQbYV6Vtv2jl4iIskWED1olqT5Jwo3OaEfx4DzZC+UaAAtK+UEExD97DPoqUyda4vwvzq+t4hw/SGOpynTE6SDtPdRU5lebjG0mYEBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773386700; c=relaxed/simple;
	bh=foHRywailjJxzdcOwn3/CZ0hF1meLi8Y4MTuQ6z8S7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tAf/45iueiYS9nnkh1SahMSMXdCRte/aJS0Qk8yyxKX6fnQXkEJ7ahrq7G8/hCNmvyOeGkkKxnreMNp85aNb8KOTt8+4dheRvT1TlToLRmIpLDOYHVzRPnDoZmZjH8j0R8B4IGhuine/+P3vgMkbvND1olRHzi13ZuYZBYqE5Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GpZzOZJ+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gDGjlygD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D6oMlR792874
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DEjQdyHeoqq+29wLeWmNmhHhPSneeKqLUXgDf7wtXFo=; b=GpZzOZJ+8fUwzcK3
	Wo2qVcVDIB/ZsEC1wUGtwTnRZUwCiQN08PuP86Nk+U+8671hhVUyf7PlMDK8FCpk
	q5B+o0Crgjj3AsCX566Z9LjzcSptyac/CS/hQ4Rrp4GvgCHhClsVX26fCr3vzbbM
	hYKirBSG3Pq91GehnHanHcikLap5jt6B6wAEkySEd03suZSHiSPMtoPFf64+Crf2
	vRHcTVGoNlERk2pAu4JY+HoU5hoYknB7dDV5I6H7Psnqfbu3cAjR+fn0krOBN/4j
	EVnssocus4Fmj/45un2FZpbiwMYkNcLk5NY5jCbtRNAHvLQMvgLtS5V3iEIndEpg
	C/Cz2w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvdnt03nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:24:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aecfe69196so3204945ad.1
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 00:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773386693; x=1773991493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DEjQdyHeoqq+29wLeWmNmhHhPSneeKqLUXgDf7wtXFo=;
        b=gDGjlygDKWh5fX7ZllatRN2ekanTPLEIJdn+jN2oREYqOa4ng97uYieieMG0fK3qkf
         S+NgN9tA/wDy/g0L/PG6MR6ZkEw7Dm1bfEklaf/2HXfgHURwwG8Swr41/qUWGKTJDnWV
         1i7GKJdSy0C6CjWKDHMzTfLUnv/jvfbBKhCH/490Csg/YNWl+sqNNpqw/3f5c64EDbb1
         iAkSAvbDw8h8Dr48CRFmfDlu6Fvb4Zf8gBzmnrWV9YA1iDO3CVH2Eif1ZUXSTlebqYQ6
         qAbM1Kyx2Cdw1G1WcnmiQq1dP12cqVkFmsd9+dW34YBZhCs1swdUy6sMXwxs+2zQx5dz
         E7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773386693; x=1773991493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DEjQdyHeoqq+29wLeWmNmhHhPSneeKqLUXgDf7wtXFo=;
        b=d0hQS3jB5SP4BbfDmd7WGF5INIyXjzytaQu0SDB7oN1aAuj8hs1ec7+oRbr18MQwSd
         GZYVdUz5/KMTr2ED9wc3R1KVn1lP2j9hgiVodA/L/RHHqhkztVWI7b/ugFzdp9xQjc5V
         aMeHyHdawn6yopWrvRLL6G6fIRidhAkoRGBgxCRqFDtwGzReIsSxLDUl+ZN4HVLCSc9O
         zvjCTj8N2IF3GQ5WkD3meeo288hEojVP8cH5qmiEAbHn/BqttfiZ2JKtu4uegEKJEeiq
         BorMJj/r/1mYaS/r3smOu8KQHV5AUUQ9QgVd1MaNbsZJGKRDX3V/k3eBtGwRNeN2ATQ3
         FgIw==
X-Gm-Message-State: AOJu0YwlFxHKmkN3XZsOmrQAeT3GDe1oq/8Cn1G73sSlPfpGvf6lt8kc
	cAAKy6NkXrfoyqmbw+bVzBqGGKX7KcaT7DwLlcxckYpWciCySd4NnFlJKbELsnSlrdMf+0x3xwo
	v+sNRV2RVSrYSnpzOSPwjNM8VWQjIBTQZ54DFg4ysd1DyTg8BHWDMhiyfzm/v02uU0A==
X-Gm-Gg: ATEYQzzGh+2pNi6Ej/Ye6nbO/zrv3J0gMeS/fB7pqEHChCQyLbUXD1R/4eefJu0rZf9
	oFWRQHQdOwqDzEbOwqim7Cda6ZAyao5bG+6QvXwVOr+ODSiamz+QmAAx5WbLwiGuaGx/BolnQ5H
	Y4dARoRFkICIVuUByIqop+VHwFWIKDgvWIeZ6LKABsXvbOeniuClK2D1LOqYdmYCqgROEH2K9ua
	F9UvByD28p9vdCpRtacf9E8xuWFdYKK+h7D+hvyaDKDK6lR82rxHwyPrB+gSL+fIxdHQqEi/bLJ
	XzCmE2psoJIY5nPnnKApN1T7NYomoQ34KPKvws/cSie65MVESZREfpnBvFRA3029YXDTetSoD4m
	M0f6iFaKBw/AP6Tu+sALHXbRuyj9ySQSaSwNlEQ9qhLXWFFWn0G2atE4K
X-Received: by 2002:a17:902:f683:b0:2ae:467f:11d8 with SMTP id d9443c01a7336-2aecaa52b09mr22979605ad.30.1773386693493;
        Fri, 13 Mar 2026 00:24:53 -0700 (PDT)
X-Received: by 2002:a17:902:f683:b0:2ae:467f:11d8 with SMTP id d9443c01a7336-2aecaa52b09mr22979405ad.30.1773386693003;
        Fri, 13 Mar 2026 00:24:53 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.254.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ee5f4sm11984755ad.52.2026.03.13.00.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 00:24:52 -0700 (PDT)
Message-ID: <19e9afa8-b0fa-43e1-8758-b58e6c7a095c@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:54:47 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: iris: add FPS calculation and VPP FW overhead
 in frequency formula
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260305-update_fps_calculation-v2-1-e3b5cccb1246@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260305-update_fps_calculation-v2-1-e3b5cccb1246@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KZrfcAYD c=1 sm=1 tr=0 ts=69b3bbc6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=EbT04XG53EGSLiegdi54Hw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zq2kz8iOUWQeT6CNkjIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: dL0NsQaXLhZozKHQGIlbBBBfTWs-hbBi
X-Proofpoint-ORIG-GUID: dL0NsQaXLhZozKHQGIlbBBBfTWs-hbBi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1OCBTYWx0ZWRfX2bOsEy7RCY2v
 EmOlBp0xV31sKPhsa1ylB17MElHgefMcabPojAT8CKL8qJOUrYGNTIvo25Wsum9+UYtt4BxGCFT
 qkdd3NOPmyE9IZM1GDV/jQeG+T0foz8n+OkQF+H9PIdL272dOIHcTdlUn9watcmCWI0XczvOFrc
 yi0WDlNGbrerSXtA/88Yl9a0X5uK2K2xELbqf6ohIuv74mQYiUkzl/N3cJfWXIrPq5zd0ducEmz
 0n9gOOdQU2F8Q3hn9Zam/douIjRoaoCvQrejoOzl0KHN1wRnsVYOU8c6g3PtE/wO21tcXlSMyrg
 cfm/dN6xClJEriqD3SYU2uZ9/JSLjvBHeFeaEnznCc+b8s/CAbbQWN5nxLWIlAdfsPu6KgwC/vc
 Rb+40syBxDsLcBM0Ak0z5uaCTUmuC0Mkl8Wi1kEF1hTZ27dsEeUtEvFrVU8in0Fq4vEzghulvwq
 fOwg680RMeaIu4FSqIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130058
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55581-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B6A7827EC05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/5/2026 7:00 PM, Vishnu Reddy wrote:
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
> +	u32				frame_count;
>   	u32				frame_rate;
>   	u32				operating_rate;
>   	u32				hfi_rc_type;
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 719217399a30..88820060e22a 100644
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
> +
> +		if (inst->frame_count == 0) {
> +			inst->last_buf_recv_time_ns = cur_buf_recv_time_ns;
> +			inst->frame_rate = MAXIMUM_FPS;
> +		}
> +		time_delta_ns = cur_buf_recv_time_ns - inst->last_buf_recv_time_ns;
> +
> +		if (time_delta_ns >= NSEC_PER_SEC) {
> +			inst->frame_rate = clamp_t(u32, inst->frame_count, DEFAULT_FPS,
> +						   MAXIMUM_FPS);
> +			inst->last_buf_recv_time_ns = cur_buf_recv_time_ns;
> +			inst->frame_count = 0;
> +		}
> +		inst->frame_count++;
> +	}
> +

simplifying it ?

     u64 now_ns, delta_ns;

     if (buf->type == BUF_INPUT) {
     	now_ns = ktime_get_ns();

         if (!inst->input_frame_count)
             inst->buf_fps_start_ts = now_ns;

	inst->input_frame_count++;
         delta_ns = now_ns - inst->buf_fps_start_ts;
         if (delta_ns < NSEC_PER_SEC)
             //skip the further logic;

         inst->frame_rate = clamp_t(u32, input_frame_count, DEFAULT_FPS, 
MAXIMUM_FPS);
        inst->input_frame_count = 0;
     }
}

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


