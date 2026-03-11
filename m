Return-Path: <linux-media+bounces-55384-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKE3E0ZesWl/uQIAu9opvQ
	(envelope-from <linux-media+bounces-55384-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:21:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B91172638D5
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:21:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BAC1730B2A3A
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 12:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9AC3E0C76;
	Wed, 11 Mar 2026 12:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MTVGaRvH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eObNDgb8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF54E3DF010
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 12:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773231544; cv=none; b=gMoQktqCgS+z0qGGDjXAFdc2CKwTBVtT0LA20jJuOWxmQXwLee66xZA6XYzOh5y1iRKmQskKRyQAHCLA7If1OnUSgaKcGxlYcKIXMYdKwY5LXfmR+lk57GcWK8xbVpaOuOU1eQWpllFhpamjCKBWSWsspQt+rYNbOPIe6EieaZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773231544; c=relaxed/simple;
	bh=N30Lz7nVe0uw3WByT1rg3IOD0/PkIdMburMpZsdZdUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NbGcS8W9/2Hpk+dyj6zyzTS5WIyz9xju9OQ+LSxumd5R80nhzV4RA1wP/bbFf9hd3UeLJLkbqRiYLns3AcFcLdRDaxdJ5ayZ4Zy1cBAqJYkIn1hqn8xGO3YSGqits9BtRKWFnQFbdFmlqB/90IjlOfIzIFAlV/BMiWqoduDg2aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MTVGaRvH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eObNDgb8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B9E9R61572954
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 12:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+yzE3afVc0lHLIoIsllI3qXSm+JCzhYjFOpyIhYmtxE=; b=MTVGaRvHcZJtKolv
	Ooi0e0goxDTK4JxbvnisM2zZETXAXutWDfSLgDbCfbHqjNQNwby9dU1ZzVp+1ivg
	4O0cVtnhoqtAuNfVs54t9R7PIlya38SsDmBPUGlO8igb/DhBSJsprHdwGeL6G1oI
	RhzHg0D15JkVxzM5XJiS5ZEgls2L8+s/v5CqbwBoyhU3tXIC+yXOt+eOpa5pfKDt
	HFkAcf5vns06c/xP4/r3u0Zi13DfYrq8tbY2RmwU6PwGU6vD/DMt/hdrTnSvU2hg
	Y/rKKMz1FyiVcqdYkWeEOB1KYLowPfz7agkXIQeQalLveszxeHwXP9n0c3WzLir9
	XkpWUg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgkbh9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 12:18:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-359fe4e9ea7so771762a91.0
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 05:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773231538; x=1773836338; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+yzE3afVc0lHLIoIsllI3qXSm+JCzhYjFOpyIhYmtxE=;
        b=eObNDgb8lyG1N3cPJIrK1suyiSq0XOT/QZ9zL1SAzUuiSkNQUzM24kGSt0ue85LedY
         W1cfC3mIxj0blXzJe7TSj4OrXwdIf6KGt4TE4cZR6s9LXkK4UUy67fxtCASAAmsU89Ag
         gBIoFdZ0h0OHTUUTyXqpR395VCX1AS9AkyVFP6scL8zVJU01GALtN/NqhRPe7SMidJmC
         zL8KyPeeGaOQO49/VTUHhjea+yGiUX+n0YrBVubKOm9GkzPiVnkbtR5WHHaAmUXQkE+3
         d4SfvQ4bWyCyDa2r3aoz/J3ROnxxJqTh4bwZhzj78UzOQbHfq3mPz1FN0dEPg30avMQh
         0Rfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773231538; x=1773836338;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+yzE3afVc0lHLIoIsllI3qXSm+JCzhYjFOpyIhYmtxE=;
        b=hm6+HoSDMNQ3SA3lvm/Ym8OdIJev30Ifyto7jRTp+Spw4Ch4Ujqdl6VjcszJjsY7fO
         XB3TL9EmBzYOL3zGEg0gkN4ZVzz03E+1s4pRwm/Ul4coxTE4wz01fOB3/wUuIZCYU94h
         QeURjnWqaXC3OhunTWL7Cr0rWY5ndSxCh9aQJdSHHlcUJVWW3+h/dXTcZNv8H9MIT59B
         IkzYBddwe41hy2GlbCsWUVpfzAdm0X3GB+14RwuC6eNEe8j0SG0hoOGzmMOGy4zwE+8x
         i0sbf7ALwMsYQhMLBsA6dqpVfGP3WVomZbg3vRDUaFjicUJ03X59WmgOe+oRjE67ZmF8
         bivg==
X-Gm-Message-State: AOJu0Yy04JcxjMAuLDTY7e2EHDjan4ozVkioWuax5vhfIn1ZHJEnFVj5
	o0TEERzyXvuYbcvaAf8NwkB2YcCWMm3RlbE9VP2XDH0/EwF3ZGigIknP5Bg7+KiR9cG2twb02+h
	uzOZpcUIh/5ZhWxEVc1k32qxx6b0WgbAroc3wC+y32D/NkkObXHe6c//ZdmENu8O1ZA==
X-Gm-Gg: ATEYQzxrP/Q4nHNp/CC0oHwpa1Wup4amTdzpeI5uUSn9sINurkdk/mUe+WogNKLDgqw
	NxYLIRekknxWzCjh4N79rOxhguJuBLBmamkTe9dDHrElSBqlVEHfEiJuVmgOp67kCaPLLqReuAT
	dt7WTH30mxIpgvn9ttISNACRLXTSQMgEE5+BU2AmdYavyCB8EL1fS//q5sB849wcxi27HObGWUS
	nLpePFc5lu9KIpIWxymbQ4Uv6Sv+lZQQx5WVH4WecgG7kLGoL07wQEsvng4ESHAOeWoUy7AqmrY
	8BWqy8McO6Vea+srIIu3hpyo3fT/Io0ZhKNtgZlrFPdcYBO7NHv9rG7u69JC7TcPrG7B+1OIJi5
	M4lYakUh1Tk+QI5KAA78jHd2DHxTcyNvR4wZh+xJ5GBoPk1m2qtuU2Q==
X-Received: by 2002:a17:903:3910:b0:2ae:471b:e55 with SMTP id d9443c01a7336-2aeae88dfcamr24076045ad.30.1773231538464;
        Wed, 11 Mar 2026 05:18:58 -0700 (PDT)
X-Received: by 2002:a17:903:3910:b0:2ae:471b:e55 with SMTP id d9443c01a7336-2aeae88dfcamr24075805ad.30.1773231537945;
        Wed, 11 Mar 2026 05:18:57 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.228.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae376653sm23408375ad.81.2026.03.11.05.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 05:18:57 -0700 (PDT)
Message-ID: <da36d6b6-9331-4711-9c26-3f17e062219c@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 17:48:53 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 5/8] media: qcom: iris: merge hfi_response_ops and
 hfi_command_ops
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260311-iris-platform-data-v3-0-f02258c4d4ed@oss.qualcomm.com>
 <20260311-iris-platform-data-v3-5-f02258c4d4ed@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260311-iris-platform-data-v3-5-f02258c4d4ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 12yaGf5eOCqGwg5ErxGwan87nuDCoWWb
X-Proofpoint-ORIG-GUID: 12yaGf5eOCqGwg5ErxGwan87nuDCoWWb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEwNCBTYWx0ZWRfX5W+j7U5kbwzI
 5enVi0fANfjN+OqjNYDzaSqrXYr8vPahDwebi5dNlWlotTF+plL5rCjnMBHtgGJMSLfiK/TyaKr
 qIHFsFKMF60Z7raO+WtJa9QlScoIjYY7sd4RZR+9lLDYsMgkqI4kbHBgps6oDR9nQTdDCtOZ8DX
 ICejQX08XE38gRnnTrZTmasNcJ8HfJqEc5ataQPwB1uynrIuaWIGYoM0n6tSCM5sZTqmMV0YQgk
 TxzojgF66NXMknuDHtz9av7nTQMPs83WiuDRLNSZZrgSw2gd/i/o2gITowMhU3bBVrneSZno3Be
 pPucNR2X6c38ACNJ7Eo301TWmzlQ4DZD3oOntvhS5OMbmm4T2JRAp4tbNE2P+xuHv7jVmlZg1bH
 6P2wZcbvbISPEhi5kDK27Lz0hD4IuU/aMAeZIFjRu6Lfw1xMRuc9C3zrAkse0n5jsK8l5HmwPo4
 h5ppXNNyQTVUJ4bwuPg==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b15db3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=eRBfbRx1O6b1X7uP3MjCRw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Hz433T7JF1t1JIG_SOoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110104
X-Rspamd-Queue-Id: B91172638D5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55384-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/11/2026 10:35 AM, Dmitry Baryshkov wrote:
> There is little point in having two different structures for HFI-related
> core ops. Merge both of them into the new iris_hfi_ops structure.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.h              |  3 +--
>  drivers/media/platform/qcom/iris/iris_hfi_common.c        |  6 +++---
>  drivers/media/platform/qcom/iris/iris_hfi_common.h        |  8 +++-----
>  drivers/media/platform/qcom/iris/iris_hfi_gen1.h          |  4 ++--
>  drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c  |  8 +++++---
>  drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 11 +----------
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.h          |  4 ++--
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c  |  8 +++++---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 11 +----------
>  drivers/media/platform/qcom/iris/iris_platform_common.h   |  3 +--
>  drivers/media/platform/qcom/iris/iris_platform_gen1.c     |  6 ++----
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c     | 12 ++++--------
>  drivers/media/platform/qcom/iris/iris_probe.c             |  3 +--
>  drivers/media/platform/qcom/iris/iris_vpu_common.c        |  2 +-
>  14 files changed, 32 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index d10a03aa5685..1d9a435ee747 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -112,8 +112,7 @@ struct iris_core {
>  	u32					header_id;
>  	u32					packet_id;
>  	struct iris_core_power			power;
> -	const struct iris_hfi_command_ops	*hfi_ops;
> -	const struct iris_hfi_response_ops	*hfi_response_ops;
> +	const struct iris_hfi_sys_ops		*hfi_sys_ops;
>  	struct completion			core_init_done;
>  	u32					intr_status;
>  	struct delayed_work			sys_error_handler;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
> index 92112eb16c11..ad8e4ecb8605 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
> @@ -76,7 +76,7 @@ u32 iris_hfi_get_v4l2_matrix_coefficients(u32 hfi_coefficients)
>  
>  int iris_hfi_core_init(struct iris_core *core)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = core->hfi_ops;
> +	const struct iris_hfi_sys_ops *hfi_ops = core->hfi_sys_ops;
>  	int ret;
>  
>  	ret = hfi_ops->sys_init(core);
> @@ -109,7 +109,7 @@ irqreturn_t iris_hfi_isr_handler(int irq, void *data)
>  	iris_vpu_clear_interrupt(core);
>  	mutex_unlock(&core->lock);
>  
> -	core->hfi_response_ops->hfi_response_handler(core);
> +	core->hfi_sys_ops->sys_hfi_response_handler(core);
>  
>  	if (!iris_vpu_watchdog(core, core->intr_status))
>  		enable_irq(irq);
> @@ -144,7 +144,7 @@ int iris_hfi_pm_suspend(struct iris_core *core)
>  
>  int iris_hfi_pm_resume(struct iris_core *core)
>  {
> -	const struct iris_hfi_command_ops *ops = core->hfi_ops;
> +	const struct iris_hfi_sys_ops *ops = core->hfi_sys_ops;
>  	int ret;
>  
>  	ret = iris_vpu_power_on(core);
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> index 18684ada78b2..9aa84a1d8f95 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> @@ -105,11 +105,13 @@ struct iris_hfi_prop_type_handle {
>  	int (*handle)(struct iris_inst *inst, u32 plane);
>  };
>  
> -struct iris_hfi_command_ops {
> +struct iris_hfi_sys_ops {
>  	int (*sys_init)(struct iris_core *core);
>  	int (*sys_image_version)(struct iris_core *core);
>  	int (*sys_interframe_powercollapse)(struct iris_core *core);
>  	int (*sys_pc_prep)(struct iris_core *core);
> +
> +	void (*sys_hfi_response_handler)(struct iris_core *core);
>  };
>  
>  struct iris_hfi_session_ops {
> @@ -129,10 +131,6 @@ struct iris_hfi_session_ops {
>  	int (*session_close)(struct iris_inst *inst);
>  };
>  
> -struct iris_hfi_response_ops {
> -	void (*hfi_response_handler)(struct iris_core *core);
> -};
> -
>  struct hfi_subscription_params {
>  	u32	bitstream_resolution;
>  	u32	crop_offsets[2];
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
> index 19b8e9054a75..1c970243532a 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
> @@ -9,8 +9,8 @@
>  struct iris_core;
>  struct iris_inst;
>  
> -void iris_hfi_gen1_command_ops_init(struct iris_core *core);
> -void iris_hfi_gen1_response_ops_init(struct iris_core *core);
> +void iris_hfi_gen1_ops_init(struct iris_core *core);

s/iris_hfi_gen1_ops_init/iris_hfi_gen1_sys_ops_init

> +void iris_hfi_gen1_response_handler(struct iris_core *core);
>  struct iris_inst *iris_hfi_gen1_get_instance(void);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index a28b0c7ebbad..eea9cc3e5904 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -1076,16 +1076,18 @@ static const struct iris_hfi_session_ops iris_hfi_gen1_session_ops = {
>  	.session_close = iris_hfi_gen1_session_close,
>  };
>  
> -static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
> +static const struct iris_hfi_sys_ops iris_hfi_gen1_ops = {

s/iris_hfi_gen1_ops/iris_hfi_gen1_sys_ops
to keep it consistent with hfi_gen1_session_ops.

Same comment is applicable to other places as well.

Thanks,
Dikshita

