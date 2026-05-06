Return-Path: <linux-media+bounces-60647-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WG34BVZj+2kuaQMAu9opvQ
	(envelope-from <linux-media+bounces-60647-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 17:50:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B44124DD99E
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 17:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C55F9300EF9F
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 15:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C3F48C40C;
	Wed,  6 May 2026 15:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VIm1JfSE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PeK2gjp7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B6E494A1A
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 15:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778082635; cv=none; b=RMy0k5gc+dfkQG897L9bhFQnCejXbkbuPSmhwReIROV9Z14/Kxcg6cLEYqf+9zGwsAqzVhSQFabfgQ0BcTSkZEuFKqXm8X6iTq7fIxzpncY0w97DGsSNeoF2tSgewJ29c4iJQYZ/9hidC8JOEwBHHtjQ8vqmL2LvAjWX4aU0GKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778082635; c=relaxed/simple;
	bh=Ju0dmPgc8ZZ8OqiweHPsTMhT2iED6QESCZ3n84tM4wk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WLqDaNl1emIdcvOgrZAXEtOoXfZiLWVx/GKs8OPGiPJdqY2JkAlt1Rq1AszQF95arNdwFs74tQjyy34xfScDlQD+5zZ0drki4SQBE4HQhev1O1vIyV1cdVs4DQ0WYV9jnLafqMUMtXM6LkKmHTE1OeqZaU8eTttVBq/cGpH+K0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VIm1JfSE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PeK2gjp7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646CZa4v1514842
	for <linux-media@vger.kernel.org>; Wed, 6 May 2026 15:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kz+2GIb2ofoTTe1qiZ0R/MxEfEsWbRMGbudpwnWRTPY=; b=VIm1JfSEhJf37oM2
	dRiNhfOB3HJF0PykCkOolw14kqu1XFqJ9leCBLkTsx00Gn0djUE/TLso8vi8utxF
	zHfkhO+is550yr0dxCIVjDTU2dTYnYqU6CxxGSKTTKvCdOrXEMoXW9qMseWIxM0n
	I7TPf1gtyEBPCh6ea/YT36t0V7yF1a7KTQZPdSisCm5uNKLUCtJgnWo1axpeUAZq
	KcaPUHDNIJeWlKWjWUe/f/T9bFegOWqWDBbG5Vjd4eTImGSsrQFt3fHB0JREON6w
	CK66gfpsvGZNc6iJBWGPOxZ00cqVOvNBOcsD0Whx3TvS2uAZ6wap2NCt8uZF+QyL
	zcNW7Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e00v1t4w0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 06 May 2026 15:50:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35e56ed5d5bso1373226a91.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 08:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778082626; x=1778687426; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kz+2GIb2ofoTTe1qiZ0R/MxEfEsWbRMGbudpwnWRTPY=;
        b=PeK2gjp7e36ipTkXFRZfppnm0D+IHHmRWcQPmnQNizYuwnV2mJ8ZpeQoP9IwepJTXA
         00mNzXhGbg9L49Ti55SRN8A1GaKLka4ve1kcP3SRONy9+E5DfyuHsMKpt5fC0dV7W9c1
         XTevH24o7XknEvr+D/pstHZGEfcHoMp7XzSiEliH5Ju2F6S9Cj9EhZ+EVykQbFplS88d
         5W6I7LRwFqQTs9q+fFreDtXhWcHBf4rvFiVm2aPkDTLYRVWBviR9dAFpnhTt4bSMBoxJ
         AU3S52VWNBTG3pP8/775E6/7o5qI8sqKERcQDv0V5GWAy4hyLbjdYTit97coZ104o9hx
         B2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778082626; x=1778687426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kz+2GIb2ofoTTe1qiZ0R/MxEfEsWbRMGbudpwnWRTPY=;
        b=iJ0E3Q0BjvC0bo6NPas99ffCbXA+RYStT0qSJ/IuYnQIic2jrDrANteNx3pv4z6eKk
         OnH0Fdni3Dp2aEe5zBfPMRlMHjJnusZWC7PVE1izz4FF2ulYUK5NlkV4x+dctnr2V4Cm
         ZKN1rzy3EzuihIs7OOYFlRK5XwW4V4qRd8N2QHz1wFyTv/6Z8zG4SkbRfviWWRnUa5UA
         vI2KtpsOb7Ix0cFTxOEc3YNCD7+WVi8o5SKJ/WBA+gLr+7ZjlNBsgxKABFNpLJAiLg6D
         WCFyfHMHs1Zd9zNcVn5VIzRvQU4WE2h68oK2XPIttcHrenvlzHTiFCnNaj+Cuiujivrm
         9gRg==
X-Gm-Message-State: AOJu0YxeYqTRIXqeHvWHq2ZVWipLMiv/BCBrXA6szYSBEGyenWuUdMC1
	LWJMEHF/xq5/M9c+aUA24jzgsSmZnTrEyfrJJP+4Po4xg+9K/LBCrtA6YX/XSrX3WT7T400V0Dt
	2LxouhbUOJmIH1K2+sBvQ0w8efrgxHL3FfzGD/9+yfMVBjzpWoqVaUi4XcT/lGY+7gw==
X-Gm-Gg: AeBDieulF5PPoPZEj94BgUtRXe2mjJFtRLSy3iQ3o/47HXFYYlfqjtZcpIVRIBUIj62
	Us8DI8zHHKvEWhM4r+YbvYW0LlUgyITKjNBRokdJJ4JPLdxl0Uwc+iECmhyLjMuYOyui8LeXzzm
	c7Pbv+2GwNC1SkYkXRCCVqEU8hYqb7gxKOfh8wBvFDE+K7QbffekzL10fK9Jz9EnC0v0Or90V/p
	rxdxtdaK/pkti4/tMK3xHPuor6gyrLal51giLMjX/piiAOwKkbH/SHEAkgs1ZrWV8z38kPe0+9b
	DieByUzMqrGmSaV7gb/0bbWOTuFJWx8u24dohN/cYZq+vlNvDiJhkZH4IrXPKPPemM3MVsSH/9I
	xEZ4dT/aHg0GfJ+4hLgcei0gO/S9HXS4+5TOlptNobLKlhvtQo8gupnziyH9JE4JH
X-Received: by 2002:a17:90b:1f8c:b0:35b:9e53:e2df with SMTP id 98e67ed59e1d1-36572245e54mr6982493a91.2.1778082625809;
        Wed, 06 May 2026 08:50:25 -0700 (PDT)
X-Received: by 2002:a17:90b:1f8c:b0:35b:9e53:e2df with SMTP id 98e67ed59e1d1-36572245e54mr6982447a91.2.1778082625083;
        Wed, 06 May 2026 08:50:25 -0700 (PDT)
Received: from [10.204.101.47] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8242ada6cesm2617238a12.13.2026.05.06.08.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:50:24 -0700 (PDT)
Message-ID: <012638b2-ef81-4fe9-a62a-5fa988b1ede6@oss.qualcomm.com>
Date: Wed, 6 May 2026 21:20:16 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/13] media: iris: Add support to select core for dual
 core platforms
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
 <20260505-glymur-v4-11-17571dbd1caa@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-11-17571dbd1caa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5hJjhX7eiqBGSeudUzshDk1hQ6lH1pjE
X-Proofpoint-GUID: 5hJjhX7eiqBGSeudUzshDk1hQ6lH1pjE
X-Authority-Analysis: v=2.4 cv=cKXQdFeN c=1 sm=1 tr=0 ts=69fb6342 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=krRBEcG5JZ8-9KUoSzYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE1NiBTYWx0ZWRfXyq5b/wD7S72m
 mr9knMl0L0R5/Cxf1qcFp1GM3+/athjP5ZAZjRe35tV4mdLDIIxUOR3MH4aM+Rd7jbiYDQIjTt1
 HlFaQrIkg0okBnwEr6jtW4IetuFs39ovUl9uz3ZKGATS1oZPkI7Ivb6/P3TOkaM+iyR/Xp+t+X4
 VL6kRBkYFDoDhkP69n4ej4tQ8DGoT+1OxbxMlIdi6f/kluCgK3pblYonlZRvIPcKpPTfNVr4ia2
 N4GYShhvq3FtYSd67WTj7zIsBJ0if5BzrXb1bmHPcQSHTgI1tVSStAuJAYJeopGZ/h5eS34vJ7x
 xg0RTJNLsxHIlaHxIz9JbmhuFczPPWw70ZLmmwUlGm3Hl6njYJD7EJDwe0rM48HK3eB7b02Dppc
 v2Yfw8NN6KtyYU3oTGS7deJlCc5asEmZ+fUNPSHceEIJclg7ZWSHmTu+93tXxXbE/b1sBCiRL7f
 1MoeZoT6K40Xzmau02w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060156
X-Rspamd-Queue-Id: B44124DD99E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60647-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 5/5/2026 12:29 PM, Vishnu Reddy wrote:
> On platforms with dual vcodec cores, select the hardware core for a
> session based on current load. Assign the session to vcodec0 if its
> MBPF/MBPS capacity allows it, otherwise assign to vcodec1. Communicate
> the selected core to firmware using the new HFI_PROP_CORE_ID property.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_common.c     | 10 +++
>   drivers/media/platform/qcom/iris/iris_common.h     |  1 +
>   drivers/media/platform/qcom/iris/iris_core.h       |  5 ++
>   drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 19 +++++
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>   drivers/media/platform/qcom/iris/iris_instance.h   |  2 +
>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>   drivers/media/platform/qcom/iris/iris_power.c      | 11 ++-
>   drivers/media/platform/qcom/iris/iris_utils.c      | 91 +++++++++++++++++-----
>   drivers/media/platform/qcom/iris/iris_vb2.c        |  4 +
>   drivers/media/platform/qcom/iris/iris_vidc.c       |  6 +-
>   12 files changed, 129 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
> index 7f1c7fe144f7..3b3fc482e194 100644
> --- a/drivers/media/platform/qcom/iris/iris_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_common.c
> @@ -46,6 +46,16 @@ void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
>   	inst->metadata_idx++;
>   }
>   
> +int iris_set_core_id(struct iris_inst *inst)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +
> +	if (!inst->core->iris_platform_data->dual_core)
> +		return 0;
> +
> +	return hfi_ops->session_set_core_id(inst, inst->core_id);
> +}
> +
>   int iris_process_streamon_input(struct iris_inst *inst)
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_common.h b/drivers/media/platform/qcom/iris/iris_common.h
> index b2a27b781c9a..34e32c60f768 100644
> --- a/drivers/media/platform/qcom/iris/iris_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_common.h
> @@ -11,6 +11,7 @@ struct iris_buffer;
>   
>   int iris_vb2_buffer_to_driver(struct vb2_buffer *vb2, struct iris_buffer *buf);
>   void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf);
> +int iris_set_core_id(struct iris_inst *inst);
>   int iris_process_streamon_input(struct iris_inst *inst);
>   int iris_process_streamon_output(struct iris_inst *inst);
>   int iris_session_streamoff(struct iris_inst *inst, u32 plane);
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index b396c8cf595e..54a8649841e4 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -30,6 +30,11 @@ enum domain_type {
>   	DECODER	= BIT(1),
>   };
>   
> +enum iris_vcodec_core_id {
> +	IRIS_VCODEC0 = 1,
> +	IRIS_VCODEC1,
> +};
> +
>   /**
>    * struct iris_core - holds core parameters valid for all instances
>    *
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> index 3edb5ae582b4..fbaf852a6b99 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> @@ -124,6 +124,7 @@ struct iris_hfi_command_ops {
>   	int (*session_drain)(struct iris_inst *inst, u32 plane);
>   	int (*session_resume_drain)(struct iris_inst *inst, u32 plane);
>   	int (*session_close)(struct iris_inst *inst);
> +	int (*session_set_core_id)(struct iris_inst *inst, u32 core_id);
>   };
>   
>   struct iris_hfi_response_ops {
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 30bfd90d423b..9d9fae587297 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -1300,6 +1300,24 @@ static int iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct i
>   					inst_hfi_gen2->packet->size);
>   }
>   
> +static int iris_hfi_gen2_set_core_id(struct iris_inst *inst, u32 core_id)
> +{
> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> +	u32 payload = core_id;
> +
> +	iris_hfi_gen2_packet_session_command(inst,
> +					     HFI_PROP_CORE_ID,
> +					     HFI_HOST_FLAGS_NONE,
> +					     HFI_PORT_NONE,
> +					     inst->session_id,
> +					     HFI_PAYLOAD_U32,
> +					     &payload,
> +					     sizeof(u32));
> +
> +	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
> +					inst_hfi_gen2->packet->size);
> +}
> +
>   static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
>   	.sys_init = iris_hfi_gen2_sys_init,
>   	.sys_image_version = iris_hfi_gen2_sys_image_version,
> @@ -1317,6 +1335,7 @@ static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
>   	.session_drain = iris_hfi_gen2_session_drain,
>   	.session_resume_drain = iris_hfi_gen2_session_resume_drain,
>   	.session_close = iris_hfi_gen2_session_close,
> +	.session_set_core_id = iris_hfi_gen2_set_core_id,
>   };
>   
>   void iris_hfi_gen2_command_ops_init(struct iris_core *core)
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index cecf771c55dd..600e9dc07669 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -56,6 +56,7 @@
>   #define HFI_PROP_BUFFER_HOST_MAX_COUNT		0x03000123
>   #define HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT	0x03000124
>   #define HFI_PROP_PIC_ORDER_CNT_TYPE		0x03000128
> +#define HFI_PROP_CORE_ID			0x030001a9
>   
>   enum hfi_rate_control {
>   	HFI_RC_VBR_CFR		= 0x00000000,
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 16965150f427..dd341ca5be57 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -37,6 +37,7 @@ struct iris_fmt {
>    *
>    * @list: used for attach an instance to the core
>    * @core: pointer to core structure
> + * @core_id: specifies the hardware core on which the session runs
>    * @session_id: id of current video session
>    * @ctx_q_lock: lock to serialize queues related ioctls
>    * @lock: lock to seralise forward and reverse threads
> @@ -79,6 +80,7 @@ struct iris_fmt {
>   struct iris_inst {
>   	struct list_head		list;
>   	struct iris_core		*core;
> +	u32				core_id;
>   	u32				session_id;
>   	struct mutex			ctx_q_lock;/* lock to serialize queues related ioctls */
>   	struct mutex			lock; /* lock to serialize forward and reverse threads */
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 8995136ad29e..502d7099085c 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -258,6 +258,7 @@ struct iris_platform_data {
>   	const struct tz_cp_config *tz_cp_config_data;
>   	u32 tz_cp_config_data_size;
>   	u32 core_arch;
> +	bool dual_core;
>   	u32 hw_response_timeout;
>   	struct ubwc_config_data *ubwc_config;
>   	u32 num_vpp_pipe;
> diff --git a/drivers/media/platform/qcom/iris/iris_power.c b/drivers/media/platform/qcom/iris/iris_power.c
> index 91aa21d4070e..0e116c63f529 100644
> --- a/drivers/media/platform/qcom/iris/iris_power.c
> +++ b/drivers/media/platform/qcom/iris/iris_power.c
> @@ -77,9 +77,9 @@ static int iris_vote_interconnects(struct iris_inst *inst)
>   
>   static int iris_set_clocks(struct iris_inst *inst)
>   {
> +	u64 vcodec0_freq = 0, vcodec1_freq = 0;
>   	struct iris_core *core = inst->core;
>   	struct iris_inst *instance;
> -	u64 freq = 0;
>   	int ret;
>   
>   	mutex_lock(&core->lock);
> @@ -87,11 +87,14 @@ static int iris_set_clocks(struct iris_inst *inst)
>   		if (!instance->max_input_data_size)
>   			continue;
>   
> -		freq += instance->power.min_freq;
> +		if (instance->core_id == IRIS_VCODEC0)
> +			vcodec0_freq += instance->power.min_freq;
> +		else if (instance->core_id == IRIS_VCODEC1)

just an else ?

> +			vcodec1_freq += instance->power.min_freq;
>   	}
>   
> -	core->power.clk_freq = freq;
> -	ret = iris_opp_set_rate(core->dev, freq);
> +	core->power.clk_freq = vcodec0_freq > vcodec1_freq ? vcodec0_freq : vcodec1_freq;

use max()

> +	ret = iris_opp_set_rate(core->dev, core->power.clk_freq);
>   	mutex_unlock(&core->lock);
>   
>   	return ret;
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
> index cfc5b576ec56..add57632fdbf 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.c
> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
> @@ -90,40 +90,95 @@ struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id)
>   	return NULL;
>   }
>   
> +static u32 iris_get_mbps(struct iris_inst *inst)
> +{
> +	u32 fps = max(inst->frame_rate, inst->operating_rate);
> +
> +	return iris_get_mbpf(inst) * fps;
> +}
> +
> +static void iris_get_core_load(struct iris_core *core, u32 *core_load, u32 *core_session, bool mbpf)
> +{
> +	bool dual_core = core->iris_platform_data->dual_core;
> +	struct iris_inst *inst;
> +	u32 load;
> +
> +	core_load[0] = 0;
> +	core_load[1] = 0;
> +	core_session[0] = 0;
> +	core_session[1] = 0;
> +
> +	list_for_each_entry(inst, &core->instances, list) {
> +		if (mbpf)
> +			load = iris_get_mbpf(inst);
> +		else
> +			load = iris_get_mbps(inst);
> +
> +		if (inst->core_id == IRIS_VCODEC0) {
> +			core_load[0] += load;
> +			core_session[0]++;
> +		} else if (dual_core && inst->core_id == IRIS_VCODEC1) {
> +			core_load[1] += load;
> +			core_session[1]++;
> +		}
> +	}
> +}
> +
> +static int iris_select_core_id(struct iris_inst *inst, u32 *core_load, u32 *core_session,
> +			       u32 max_load, u32 new_load)
> +{
> +	u32 max_session = inst->core->iris_platform_data->max_session_count;
> +	bool dual_core = inst->core->iris_platform_data->dual_core;
> +	u32 core_index;
> +
> +	core_index = (core_load[0] > core_load[1] && dual_core) ? 1 : 0;
> +
> +	if (core_session[core_index] >= max_session)
> +		core_index = core_index == 0 && dual_core ? 1 : 0;
> +
> +	if (core_session[core_index] >= max_session)
> +		return -ENOMEM;
> +
> +	if (core_load[core_index] + new_load <= max_load)
> +		inst->core_id = core_index == 0 ? IRIS_VCODEC0 : IRIS_VCODEC1;
> +	else
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
>   int iris_check_core_mbpf(struct iris_inst *inst)
>   {
> +	u32 max_core_mbpf = inst->core->iris_platform_data->max_core_mbpf;
> +	u32 core_mbpf[2], core_session[2], new_mbpf;

use load0,load1,sessions_core0, sessions_core1 instead of arrays and 
simply the logic accordingly.

>   	struct iris_core *core = inst->core;
> -	struct iris_inst *instance;
> -	u32 total_mbpf = 0;
> +	int ret;
>   
>   	mutex_lock(&core->lock);
> -	list_for_each_entry(instance, &core->instances, list)
> -		total_mbpf += iris_get_mbpf(instance);
> +	inst->core_id = 0;
> +	iris_get_core_load(inst->core, core_mbpf, core_session, true);
> +	new_mbpf = iris_get_mbpf(inst);
> +	ret = iris_select_core_id(inst, core_mbpf, core_session, max_core_mbpf, new_mbpf);
>   	mutex_unlock(&core->lock);
>   
> -	if (total_mbpf > core->iris_platform_data->max_core_mbpf)
> -		return -ENOMEM;
> -
> -	return 0;
> +	return ret;
>   }
>   
>   int iris_check_core_mbps(struct iris_inst *inst)
>   {
> +	u32 max_core_mbps = inst->core->iris_platform_data->max_core_mbps;
> +	u32 core_mbps[2] = {0, 0}, core_session[2], new_mbps;
>   	struct iris_core *core = inst->core;
> -	struct iris_inst *instance;
> -	u32 total_mbps = 0, fps = 0;
> +	int ret;
>   
>   	mutex_lock(&core->lock);
> -	list_for_each_entry(instance, &core->instances, list) {
> -		fps = max(instance->frame_rate, instance->operating_rate);
> -		total_mbps += iris_get_mbpf(instance) * fps;
> -	}
> +	inst->core_id = 0;
> +	iris_get_core_load(inst->core, core_mbps, core_session, false);
> +	new_mbps = iris_get_mbps(inst);
> +	ret = iris_select_core_id(inst, core_mbps, core_session, max_core_mbps, new_mbps);
>   	mutex_unlock(&core->lock);
>   
> -	if (total_mbps > core->iris_platform_data->max_core_mbps)
> -		return -ENOMEM;
> -
> -	return 0;
> +	return ret;
>   }
>   
>   bool is_rotation_90_or_270(struct iris_inst *inst)
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
> index bf0b8400996e..5a05f7d65501 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -176,6 +176,10 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
>   	if (ret)
>   		goto error;
>   
> +	ret = iris_set_core_id(inst);
> +	if (ret)
> +		goto error;
> +
>   	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
>   		if (inst->domain == DECODER)
>   			ret = iris_vdec_streamon_input(inst);
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index 5eb1786b0737..a1ce3cd524a3 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -41,16 +41,20 @@ static void iris_v4l2_fh_deinit(struct iris_inst *inst, struct file *filp)
>   
>   static void iris_add_session(struct iris_inst *inst)
>   {
> +	u32 max_session_count = inst->core->iris_platform_data->max_session_count;
>   	struct iris_core *core = inst->core;
>   	struct iris_inst *iter;
>   	u32 count = 0;
>   
> +	if (inst->core->iris_platform_data->dual_core)
> +		max_session_count *= 2;
> +
>   	mutex_lock(&core->lock);
>   
>   	list_for_each_entry(iter, &core->instances, list)
>   		count++;
>   
> -	if (count < core->iris_platform_data->max_session_count)
> +	if (count < max_session_count)
>   		list_add_tail(&inst->list, &core->instances);
>   
>   	mutex_unlock(&core->lock);
> 

Regards,
Vikash

