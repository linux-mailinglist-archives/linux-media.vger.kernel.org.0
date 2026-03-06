Return-Path: <linux-media+bounces-54712-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHk+GmGVqmkkUAEAu9opvQ
	(envelope-from <linux-media+bounces-54712-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 09:50:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEDD21D58D
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 09:50:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 029A93014C20
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 08:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77ED730F92D;
	Fri,  6 Mar 2026 08:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ThbumVW7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fq7bpr+M"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C51B1E531
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 08:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772786840; cv=none; b=TgkBDVdTQcoBNM1hFIHCPf+JRnoYuK0Rh5c8T5hYEfLD34K8Yp3K4gSK6jJcIVnQb/QtAALnfYEgfR9ZYwrkcnVz+3G/J7wbI9kNp2X5Q8eBiLYppxo7fHEw3wwI5piUra1XEKRR9iDO1mXpFfbakbCUyJWCn9qm1vMW51CWMMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772786840; c=relaxed/simple;
	bh=Y81vGxopy38iymGvXgZ8nwix28LhB83xyldJhxFdjG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VEEcCGcatgYNkH1snIRQfTzTXpnjsICpEZ9aom31mm3EYZDTCMD3tpydbO/zUFnWSMttVArEhYZeAk5tuMKcb37qxmdF2AUvebreQMCrJTIVgiWkMQSvtk5EqwpdpuVqMlLblq+Lx+k2VGcvTQwZTKz+xEVykbIxX5K6hMniGcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ThbumVW7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fq7bpr+M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264aVDV1087383
	for <linux-media@vger.kernel.org>; Fri, 6 Mar 2026 08:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gY1kQbnt8M6HnShpK66+c2nwqYEBVUzuavQ0KjRQxEM=; b=ThbumVW7PynGIYCJ
	vWMn/xCZPQgeGl3zjDCd4b5lXV5oPgY3A/CjsvDSWPBUMZ4viKoIdAAPw4U9nu5j
	XBgkqbEHptW8/TY+HfXGMpjBIjW/ADydw54YxVXYq86P/b3o3m191TG/tPB4QlUz
	zDGArtk1vsFPMNhiA2zpr2DlH40xOVnjJK6k9yUFXJnl4DA1rvkXEkNoP0u5Xl+U
	9R2/yJrAVVfUX3YlSHdmjScilb5Ucw266XkT+9JLNDlCdEv9aCAkegkx6AoVplEj
	3d92Mk4k2dtYIYGxy5wN/D0NJ7XZtK94LOiE4IHLZBMULgY6h/hHmP11scEl3VHa
	IDfblg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqfg6acg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 08:47:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae65d5cc57so158335885ad.2
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 00:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772786838; x=1773391638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gY1kQbnt8M6HnShpK66+c2nwqYEBVUzuavQ0KjRQxEM=;
        b=fq7bpr+MombIcS5tGeef9xRXXQfU9rufKS229q3K8qlNDNGMLnWydz7oTS2g4lA83K
         eEVJ1zftOD3wtHNW8OZuIsgik99F302jp8RzP+4snPyP+1req7iELpT8BzAiRbXhRBun
         VnCXgxfGoOnZWQOPffhAR4AY7lAGD6C4yZukEOx6HpCPWb4E/RhSvMR9sHbtR1yLGRcD
         Pri8Vol/9x1CQudgHkYl8dRMQZRtYh1lHGgheIBnWAobvVqtf39KuPADx1GIeyBEb3BE
         6vJatC7B8GvsPiMCsSuiLMiDjnebnbi4yygAe5P5+Inkrbyqn+OKPpc9ZWdVhCYgiWBP
         ee1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772786838; x=1773391638;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gY1kQbnt8M6HnShpK66+c2nwqYEBVUzuavQ0KjRQxEM=;
        b=NMF+EOk+OLtpWTSkxwMSA7qyLFvhakaL2KD2UJWhtrfy4PE4Qy/9zvbL8Iqt9aKLID
         nyWtYB0puUy37gDVLDnmQzdXdsGgBENbbIKkW2gRpQsjosqakHTIl/ZwUZMrdcc2/Qrl
         0KgpE8h9/J9kUbYpo0OSnTrtd6uajdO1Rycr6eUetacDmktN1rT9fFOxOmqUtSr1K92h
         cSlxUT92Sp8wE34AmRyd5Ubo4jkluoi3xbVJq0Zc7folrP9IpofNs9HnGW3kSk3o73Ef
         0k5QRMG9yYROXQ8l425h0LmtE+sfKHvL9L6/f2zin43vTEVt9rV5zbYzXiq1nNt8nDMk
         BHYw==
X-Gm-Message-State: AOJu0Yxty+6BW//iODvIJgGI2oma+l942kzJtjRQc176+SWz2BYkgPMc
	KCZE0PZYn8E6HzNlojnfv1ung1LVKyhk50aook+JRJQ0F1dyC9zBCZZLpHetMPEb+N03NIfwObG
	Y+hkPKqlBzEPWoINTGXPgQKOFQZOPGHLryM1le0zHBDjaTy4Bg8nBUjpWVo+AlFykfw==
X-Gm-Gg: ATEYQzzHw6u4xGzgChvD79E1+8VSZksNCbz3Pvg/KSs9HS8TOsCkgdfc7kq1gM8wzkz
	Fe75Zp2WIU10eaYgowq0QdOxsx23JzEMuUHI56OCHnbKsNGFaF8tzbmdNqzE33ZfW+PPDX+Tdya
	CJM3/06o5Bj1R9r1bjXx+EyWriBDPxIaCXZRagf4rTY80fe41gq5eyt9joza1ZRDloWu9dQl7yu
	F4Xdrm0mIlHOcV6hOwyan1WPk0JEuwyvHPFkypZ4HchaiyVHb+T1DcWRVT6DWzWrIX7i6fOw/yl
	6m2smdNqMoiid7Auo7mcT6kCVBy5A1wBrufEJwYM5yczqIY0Qo3MX3FzldyvlU5+EIvd3u+jFwD
	NrjpmnY7kH1LFYbhoSYb8rdHLBau/L532tHsOZcF9b+FBSYQBb1RJvQ==
X-Received: by 2002:a17:902:f603:b0:2ae:87de:443b with SMTP id d9443c01a7336-2ae87de4615mr554605ad.16.1772786837675;
        Fri, 06 Mar 2026 00:47:17 -0800 (PST)
X-Received: by 2002:a17:902:f603:b0:2ae:87de:443b with SMTP id d9443c01a7336-2ae87de4615mr554295ad.16.1772786837076;
        Fri, 06 Mar 2026 00:47:17 -0800 (PST)
Received: from [10.0.0.3] ([106.222.231.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f752bfsm16503195ad.60.2026.03.06.00.47.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 00:47:16 -0800 (PST)
Message-ID: <c37c4efe-c32c-7989-0c69-dfd0b6f71fb8@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 14:17:12 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 08/11] media: qcom: iris: merge hfi_response_ops and
 hfi_command_ops
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
 <20260228-iris-platform-data-v2-8-acf036a3c84c@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v2-8-acf036a3c84c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Tp7xsbC9FfH2hgcv3B6ATvbsUtTAYrE5
X-Proofpoint-ORIG-GUID: Tp7xsbC9FfH2hgcv3B6ATvbsUtTAYrE5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA4MiBTYWx0ZWRfX2vGMXZz2Cfm2
 M1G2uUWAXwrMXfvx80FTyS/xOPgTn6Zz6HEJL/oQUCsK6f8nplFJpfxKH0K5WD5Oby95NhsTJF8
 ocnQR/dDPf5reZEXp4M5yW2CfP8G5OiBHUvWf9Y8F+1Xkx8LdOp644JYJhqapMFLB5yIOHnepxg
 Y5enFMQJmF9XxGEqF2W5McNNQIdk9L0pATZSaN15sfyUu9/I0hIUv5Plg3T7ikwmu8yjUuDtbAM
 h9Dgtdrtzv3gk7oVgX1yPyULLkgGMyP6MpcrMz5iM+niXSW7rTnSZ+SV/GQ2/aOVbH0Y2SKBVBj
 vEGBHxNXHc/cVFx1fDIgMqrUywI7oNH90tP0nnUPagxHu0j2Ygk+g2sgS9LX3hiJ5tIWJGMnYqk
 oKJOqjN/RLWYLtPnGzqbjRN3l5GYRh8wamrr0vnVop7v2b2/Q9XGqPrk7NXVpt51k9RrNUNk2pN
 4BHJl2JrWzSz4Dwh9kQ==
X-Authority-Analysis: v=2.4 cv=XKg9iAhE c=1 sm=1 tr=0 ts=69aa9496 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IrIcjQS8YOhLhDNCWt0oYA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=CNTr4gSmneF7eSI3cn8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060082
X-Rspamd-Queue-Id: BCEDD21D58D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54712-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2/28/2026 8:56 PM, Dmitry Baryshkov wrote:
> There is little point in having two different structures for HFI-related
> core ops. Merge both of them into the new iris_hfi_ops structure.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.h              |  2 +-
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
>  13 files changed, 31 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index d10a03aa5685..d919c7c16106 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -112,7 +112,7 @@ struct iris_core {
>  	u32					header_id;
>  	u32					packet_id;
>  	struct iris_core_power			power;
> -	const struct iris_hfi_command_ops	*hfi_ops;
> +	const struct iris_hfi_ops		*hfi_ops;
>  	const struct iris_hfi_response_ops	*hfi_response_ops;

isn't this creating compilation issue? This is being removed in this patch.

Thanks,
Dikshita

>  	struct completion			core_init_done;
>  	u32					intr_status;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
> index 92112eb16c11..d6496e0fabde 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
> @@ -76,7 +76,7 @@ u32 iris_hfi_get_v4l2_matrix_coefficients(u32 hfi_coefficients)
>  
>  int iris_hfi_core_init(struct iris_core *core)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = core->hfi_ops;
> +	const struct iris_hfi_ops *hfi_ops = core->hfi_ops;
>  	int ret;
>  
>  	ret = hfi_ops->sys_init(core);
> @@ -109,7 +109,7 @@ irqreturn_t iris_hfi_isr_handler(int irq, void *data)
>  	iris_vpu_clear_interrupt(core);
>  	mutex_unlock(&core->lock);
>  
> -	core->hfi_response_ops->hfi_response_handler(core);
> +	core->hfi_ops->hfi_response_handler(core);
>  
>  	if (!iris_vpu_watchdog(core, core->intr_status))
>  		enable_irq(irq);
> @@ -144,7 +144,7 @@ int iris_hfi_pm_suspend(struct iris_core *core)
>  
>  int iris_hfi_pm_resume(struct iris_core *core)
>  {
> -	const struct iris_hfi_command_ops *ops = core->hfi_ops;
> +	const struct iris_hfi_ops *ops = core->hfi_ops;
>  	int ret;
>  
>  	ret = iris_vpu_power_on(core);
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> index 4f26b010249a..21bb35261073 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> @@ -105,11 +105,13 @@ struct iris_hfi_prop_type_handle {
>  	int (*handle)(struct iris_inst *inst, u32 plane);
>  };
>  
> -struct iris_hfi_command_ops {
> +struct iris_hfi_ops {
>  	int (*sys_init)(struct iris_core *core);
>  	int (*sys_image_version)(struct iris_core *core);
>  	int (*sys_interframe_powercollapse)(struct iris_core *core);
>  	int (*sys_pc_prep)(struct iris_core *core);
> +
> +	void (*hfi_response_handler)(struct iris_core *core);
>  };
>  
>  struct iris_hfi_inst_ops {
> @@ -129,10 +131,6 @@ struct iris_hfi_inst_ops {
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
> +void iris_hfi_gen1_response_handler(struct iris_core *core);
>  struct iris_inst *iris_hfi_gen1_get_instance(void);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index fde8219309b0..7f0e5a75a301 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -1028,16 +1028,18 @@ static const struct iris_hfi_inst_ops iris_hfi_gen1_inst_ops = {
>  	.session_close = iris_hfi_gen1_session_close,
>  };
>  
> -static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
> +static const struct iris_hfi_ops iris_hfi_gen1_ops = {
>  	.sys_init = iris_hfi_gen1_sys_init,
>  	.sys_image_version = iris_hfi_gen1_sys_image_version,
>  	.sys_interframe_powercollapse = iris_hfi_gen1_sys_interframe_powercollapse,
>  	.sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
> +
> +	.hfi_response_handler = iris_hfi_gen1_response_handler,
>  };
>  
> -void iris_hfi_gen1_command_ops_init(struct iris_core *core)
> +void iris_hfi_gen1_ops_init(struct iris_core *core)
>  {
> -	core->hfi_ops = &iris_hfi_gen1_command_ops;
> +	core->hfi_ops = &iris_hfi_gen1_ops;
>  }
>  
>  struct iris_inst *iris_hfi_gen1_get_instance(void)
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index 8e864c239e29..bfd7495bf44f 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> @@ -688,7 +688,7 @@ static void iris_hfi_gen1_flush_debug_queue(struct iris_core *core, u8 *packet)
>  	}
>  }
>  
> -static void iris_hfi_gen1_response_handler(struct iris_core *core)
> +void iris_hfi_gen1_response_handler(struct iris_core *core)
>  {
>  	memset(core->response_packet, 0, sizeof(struct hfi_pkt_hdr));
>  	while (!iris_hfi_queue_msg_read(core, core->response_packet)) {
> @@ -698,12 +698,3 @@ static void iris_hfi_gen1_response_handler(struct iris_core *core)
>  
>  	iris_hfi_gen1_flush_debug_queue(core, core->response_packet);
>  }
> -
> -static const struct iris_hfi_response_ops iris_hfi_gen1_response_ops = {
> -	.hfi_response_handler = iris_hfi_gen1_response_handler,
> -};
> -
> -void iris_hfi_gen1_response_ops_init(struct iris_core *core)
> -{
> -	core->hfi_response_ops = &iris_hfi_gen1_response_ops;
> -}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
> index b9d3749a10ef..b981a1ba6954 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
> @@ -34,8 +34,8 @@ struct iris_inst_hfi_gen2 {
>  	struct hfi_subscription_params	dst_subcr_params;
>  };
>  
> -void iris_hfi_gen2_command_ops_init(struct iris_core *core);
> -void iris_hfi_gen2_response_ops_init(struct iris_core *core);
> +void iris_hfi_gen2_ops_init(struct iris_core *core);
> +void iris_hfi_gen2_response_handler(struct iris_core *core);
>  struct iris_inst *iris_hfi_gen2_get_instance(void);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 502767f1593d..12d286be94a8 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -1405,16 +1405,18 @@ static const struct iris_hfi_inst_ops iris_hfi_gen2_inst_ops = {
>  	.session_close = iris_hfi_gen2_session_close,
>  };
>  
> -static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
> +static const struct iris_hfi_ops iris_hfi_gen2_ops = {
>  	.sys_init = iris_hfi_gen2_sys_init,
>  	.sys_image_version = iris_hfi_gen2_sys_image_version,
>  	.sys_interframe_powercollapse = iris_hfi_gen2_sys_interframe_powercollapse,
>  	.sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
> +
> +	.hfi_response_handler = iris_hfi_gen2_response_handler,
>  };
>  
> -void iris_hfi_gen2_command_ops_init(struct iris_core *core)
> +void iris_hfi_gen2_ops_init(struct iris_core *core)
>  {
> -	core->hfi_ops = &iris_hfi_gen2_command_ops;
> +	core->hfi_ops = &iris_hfi_gen2_ops;
>  }
>  
>  struct iris_inst *iris_hfi_gen2_get_instance(void)
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 8e19f61bbbf9..c350d231265e 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -977,7 +977,7 @@ static void iris_hfi_gen2_flush_debug_queue(struct iris_core *core, u8 *packet)
>  	}
>  }
>  
> -static void iris_hfi_gen2_response_handler(struct iris_core *core)
> +void iris_hfi_gen2_response_handler(struct iris_core *core)
>  {
>  	if (iris_vpu_watchdog(core, core->intr_status)) {
>  		struct iris_hfi_packet pkt = {.type = HFI_SYS_ERROR_WD_TIMEOUT};
> @@ -997,12 +997,3 @@ static void iris_hfi_gen2_response_handler(struct iris_core *core)
>  
>  	iris_hfi_gen2_flush_debug_queue(core, core->response_packet);
>  }
> -
> -static const struct iris_hfi_response_ops iris_hfi_gen2_response_ops = {
> -	.hfi_response_handler = iris_hfi_gen2_response_handler,
> -};
> -
> -void iris_hfi_gen2_response_ops_init(struct iris_core *core)
> -{
> -	core->hfi_response_ops = &iris_hfi_gen2_response_ops;
> -}
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index f5eb17ae072c..8e330ce5e726 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -202,8 +202,7 @@ enum platform_pm_domain_type {
>  };
>  
>  struct iris_platform_data {
> -	void (*init_hfi_command_ops)(struct iris_core *core);
> -	void (*init_hfi_response_ops)(struct iris_core *core);
> +	void (*init_hfi_ops)(struct iris_core *core);
>  	struct iris_inst *(*get_instance)(void);
>  	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>  	const struct vpu_ops *vpu_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index 392f9ed94ba8..1906e480e2ec 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -315,8 +315,7 @@ static const u32 sm8250_enc_ip_int_buf_tbl[] = {
>  
>  const struct iris_platform_data sm8250_data = {
>  	.get_instance = iris_hfi_gen1_get_instance,
> -	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
> -	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
> +	.init_hfi_ops = &iris_hfi_gen1_ops_init,
>  	.get_vpu_buffer_size = iris_vpu_buf_size,
>  	.vpu_ops = &iris_vpu2_ops,
>  	.set_preset_registers = iris_vpu_set_preset_registers,
> @@ -362,8 +361,7 @@ const struct iris_platform_data sm8250_data = {
>  
>  const struct iris_platform_data sc7280_data = {
>  	.get_instance = iris_hfi_gen1_get_instance,
> -	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
> -	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
> +	.init_hfi_ops = &iris_hfi_gen1_ops_init,
>  	.get_vpu_buffer_size = iris_vpu_buf_size,
>  	.vpu_ops = &iris_vpu2_ops,
>  	.set_preset_registers = iris_vpu_set_preset_registers,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index ef70472ecde5..09dcf01047c5 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -820,8 +820,7 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
>  
>  const struct iris_platform_data sm8550_data = {
>  	.get_instance = iris_hfi_gen2_get_instance,
> -	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
> -	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> +	.init_hfi_ops = iris_hfi_gen2_ops_init,
>  	.get_vpu_buffer_size = iris_vpu_buf_size,
>  	.vpu_ops = &iris_vpu3_ops,
>  	.set_preset_registers = iris_vpu_set_preset_registers,
> @@ -877,8 +876,7 @@ const struct iris_platform_data sm8550_data = {
>   */
>  const struct iris_platform_data sm8650_data = {
>  	.get_instance = iris_hfi_gen2_get_instance,
> -	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
> -	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> +	.init_hfi_ops = iris_hfi_gen2_ops_init,
>  	.get_vpu_buffer_size = iris_vpu33_buf_size,
>  	.vpu_ops = &iris_vpu33_ops,
>  	.set_preset_registers = iris_vpu_set_preset_registers,
> @@ -929,8 +927,7 @@ const struct iris_platform_data sm8650_data = {
>  
>  const struct iris_platform_data sm8750_data = {
>  	.get_instance = iris_hfi_gen2_get_instance,
> -	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
> -	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> +	.init_hfi_ops = iris_hfi_gen2_ops_init,
>  	.get_vpu_buffer_size = iris_vpu33_buf_size,
>  	.vpu_ops = &iris_vpu35_ops,
>  	.set_preset_registers = iris_vpu_set_preset_registers,
> @@ -983,8 +980,7 @@ const struct iris_platform_data sm8750_data = {
>   */
>  const struct iris_platform_data qcs8300_data = {
>  	.get_instance = iris_hfi_gen2_get_instance,
> -	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
> -	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> +	.init_hfi_ops = iris_hfi_gen2_ops_init,
>  	.get_vpu_buffer_size = iris_vpu_buf_size,
>  	.vpu_ops = &iris_vpu3_ops,
>  	.set_preset_registers = iris_vpu_set_preset_registers,
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 17bb11513648..c2d174a6e160 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -257,8 +257,7 @@ static int iris_probe(struct platform_device *pdev)
>  	disable_irq_nosync(core->irq);
>  
>  	iris_init_ops(core);
> -	core->iris_platform_data->init_hfi_command_ops(core);
> -	core->iris_platform_data->init_hfi_response_ops(core);
> +	core->iris_platform_data->init_hfi_ops(core);
>  
>  	ret = iris_init_resources(core);
>  	if (ret)
> 

