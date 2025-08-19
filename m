Return-Path: <linux-media+bounces-40315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D08B2CA5F
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 19:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58119179726
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 17:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C492FE057;
	Tue, 19 Aug 2025 17:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YDpVHwao"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED8B277008
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 17:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755623877; cv=none; b=TxfZjWyRKyRIzrcSpSyyv0APJOqBBQp/E7Kvt2mAlzY9cgyNAJx7F1AtUronohqdW9C+chYPfxkxNNJRbIhqQH1Ttu8mkI6/7y+h9BGdF5jZ7/r1cP9L1XsLXnnCFiMLAyJE4Pvvzd65JTtEmLyjZRfogb37ondBY94c5G/gRvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755623877; c=relaxed/simple;
	bh=nvWzzpqNpT6eJfaRE4PBD9zQF//aAwvkd8/k/iioYeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iMX1m0FX6pwDJcNvKiCfiaTnzqGMjZhw6jO3gTkqAFiLPyI/vFmtEWUXXMyklcE0QNa/zfBQmCp02nmI3Ja6G9qS2++BKtZk/NrBUUQIYVW3O0/oXtfb74X3wz11XSnZkzf9a+IQp5Dcm2eG1/WKL1Sb3AcUtcaO1IDRCqOdeAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YDpVHwao; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90Xho030335
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 17:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jcJugMEmP+bjapXf/nEWeVTp
	niYytQQ7IyAUbp7KDGw=; b=YDpVHwaoiNDYc1EstbKRajG+5Bss+xcUqnjV8xew
	SHQq9vWf0M/krUsz0Oo02Wb4CR9CUL1wVSp3tFWLgLHDX8bpXVtDsQ/cKXYQxEfK
	ctDGkTLXNxOfhz3ggJEFFO8rXi27DGzstYB2dgbzC4XGnRTwtDkOy4NHFIxSmlLS
	CofzYV6sCtFJsOR/ZkP+xTKOz63pQjsEGo3bv2N2zDzBMBIilL8JJ4+Mf+uQWueK
	LWP2GAB1EJ7QnWaYl3AHuzqBqdtKHtRE19G73O68BmwHF/SRQPez54S9msIUEUsr
	NcnuZsLbN3Q86pLKMGUcRPobdK+HYTbZ+2WX8TVzDnAT7A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyunwkwh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 17:17:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b474b68cff7so1751248a12.1
        for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 10:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755623873; x=1756228673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcJugMEmP+bjapXf/nEWeVTpniYytQQ7IyAUbp7KDGw=;
        b=mgexf2Vpzi802aj/cZpWUiaDBHRIXCAuxCY0s6uUjcWh9IERMi0mXD4kUyXIpvvprW
         HbWh4a2u41wSuKMsaKjAWiAVhs2Gh/+hgN2hEvz8qRI1WbDwPZYnMTNoy0oth0crKsrm
         aExCfO5Uh1n4gDwuoemC9LGvWDXRzL5XKeXr+PHIios9MTZ2N0QYzwRPmw/3aXQ8Eis8
         21iZxTGU6k3pGOYcK+Y0OWfBpgVrfkNkQ4AE6ZfGAKCDp+zP5z6Nv5b/GdLGGUYItQsr
         z2UenCK+ZQucbSPQKV4Whp9amTatPxUoNi/vQUFiYMt0kX3OP82RHyKV4lkL82TVlpAE
         SkmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtrexz7RHhO3daEpM0D3eD6TI1ZQXwChXSMD7SHJI0V8PG6wmUdIvKyyJrDb7rwQ8wsJaV5kOwqs+JbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2WT3/itLQ9CfaKvZel5ltTH+wAhwtpMEyavZMFnojD0gDsGID
	MdaoMA4/exNd7JDwiH0l6w4TAX7MW81+XmOhitFgQ6bGbdW/nV6d9gitkgMOjEn+4YAHyTebR4D
	h5uGXoG0dIzAX8xNxVOynwYW7sGzUabE2lWfyrYnKdReckD+5TYbv1rgBrFZ57E/6Ag==
X-Gm-Gg: ASbGnctwrgvLTLIFvuTauy7tgN+POy0CYH8t+TV9bgEAIPGunOE+medUMqOWDAb4i3c
	hIbE7+IbWBq7CIwPpZUnu95D2ZxOOK58iLTQDYsgtbxngxigG32IIXiU//uSTBym/pQhIRyM0Lg
	Kd7u93/mscZGaDFCDU+ZtDkc9oRpfUNDIyrc++TvCOeqV1OgGLBwCkng8dDvnXX+RSWLPY68Cig
	/iINqaGDsCd8g5oRs+QjyOvMTIVv1PJpAIIKB+EmiVTq5QQHUuSa2GHTAdiPPiecyKoch/4lByn
	OBY+jkymIJ6ECUphACSuqo0FAfTqohyjpRHu3WwL1uSMOAAzkMaERZNLwPUnojr93dwh4GPP4A=
	=
X-Received: by 2002:a05:6a20:7d86:b0:243:78a:82b9 with SMTP id adf61e73a8af0-2431b980068mr162619637.51.1755623872479;
        Tue, 19 Aug 2025 10:17:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFN9cn2Ql/5avNFjiCvAWCZGwnNNwM92fq94h29uNQopaI93fMSoUy7tmgOUYUQhdeGK5VXtQ==
X-Received: by 2002:a05:6a20:7d86:b0:243:78a:82b9 with SMTP id adf61e73a8af0-2431b980068mr162576637.51.1755623872003;
        Tue, 19 Aug 2025 10:17:52 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47640b2d37sm198078a12.46.2025.08.19.10.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 10:17:51 -0700 (PDT)
Date: Tue, 19 Aug 2025 22:47:45 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 01/11] firmware: qcom_scm: Introduce PAS context
 initialization helper
Message-ID: <3b74157a-3f2a-4533-acf6-7cab8154709c@quicinc.com>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819165447.4149674-2-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-GUID: -FmIlhU-pWgIM8wi05giLADF03f0mvRU
X-Authority-Analysis: v=2.4 cv=N6UpF39B c=1 sm=1 tr=0 ts=68a4b1c1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=1sDHh0GgXtZW7FQMFNoA:9
 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA3MSBTYWx0ZWRfX4Eo/WsLqt8QF
 W/8HOGQ0BCma9ktsgvZVEanR0tTW7BWdokCvpwUbx47UHZsMqgaXg+M1+PL27Fud5TCMEw/tKNb
 3SoqzwkttuubOZOKQVVVjsaIKxXnR5Pvta1CV6axA07jCcUH5COyFQrKt9a4UMdvpAkd39nBH3x
 LaRUaexDyuPW20ETxvTT5iJrR/JLIGQ+RHelyOn6or0Sg+HdX+4vqejJqzXxBViqXSrD98aiBG0
 rokv4NB2vTIhJsfT2p7UPb45Ae/VFm3nOhtylflN4cfG/V3eQjina8jc7zJCyYdCwj8DT7NYlwz
 T8DmS5xvE7gVtvbDpsw1sh7YkEUTWn1hXLE7Xt4onNw8MdO03VPfPqS2Jnk1DFOGBzsC1pGxsvT
 rOjCKfep
X-Proofpoint-ORIG-GUID: -FmIlhU-pWgIM8wi05giLADF03f0mvRU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1011 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180071

On Tue, Aug 19, 2025 at 10:24:36PM +0530, Mukesh Ojha wrote:
> Currently, remoteproc and non-remoteproc subsystems use different
> variants of the MDT loader helper API, primarily due to the handling of
> the metadata context. Remoteproc subsystems retain this context until
> authentication and reset, while non-remoteproc subsystems (e.g., video,
> graphics) do not require it.
> 
> Unify the metadata loading process for both remoteproc and
> non-remoteproc subsystems by introducing a dedicated PAS context
> initialization function.
> 
> By introducing qcom_scm_pas_ctx_init(), we can standardize the API usage
> across subsystems and reduce the number of parameters passed to MDT
> loader functions, improving code clarity and maintainability.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c       | 26 ++++++++++++++++++++++++++
>  include/linux/firmware/qcom/qcom_scm.h | 11 +++++++++++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 96d5cf40a74c..33187d4f4aef 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -558,6 +558,32 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
>  		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
>  }
>  
> +void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_phys,
> +			    size_t mem_size, bool save_mdt_ctx)

Since we export this for other drivers/module, consider adding kerneldoc
comments.

> +{
> +	struct qcom_scm_pas_ctx *ctx;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return NULL;
> +
> +	ctx->dev = dev;
> +	ctx->peripheral = peripheral;
> +	ctx->mem_phys = mem_phys;
> +	ctx->mem_size = mem_size;
> +	ctx->save_mdt_ctx = save_mdt_ctx;
> +	ctx->metadata = NULL;

This seems unnecessary.

> +
> +	if (save_mdt_ctx) {
> +		ctx->metadata = devm_kzalloc(dev, sizeof(*ctx->metadata), GFP_KERNEL);
> +		if (!ctx->metadata)
> +			return NULL;

Do we really need to pass this burden to the caller to pass save_mdt_ctx
as true/false? What happens if we always keep metadata in qcom_scm_pas_ctx struct
and let clients use it if needed.

> +	}
> +
> +	return ctx;
> +}
> +EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_init);

Is there an equivalant ctx_destroy() function? It would be confusing for
drivers to call this in their probe and not doing anything upon error or
in their bus::remove callbacks. I don't know if we really want to
convert the whole function under devres or just provide a destroy
callback.

> +
>  /**
>   * qcom_scm_pas_init_image() - Initialize peripheral authentication service
>   *			       state machine for a given peripheral, using the
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index a55ca771286b..b7eb206561a9 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -72,6 +72,17 @@ struct qcom_scm_pas_metadata {
>  	ssize_t size;
>  };
>  
> +struct qcom_scm_pas_ctx {
> +	struct device *dev;
> +	u32 peripheral;
> +	phys_addr_t mem_phys;
> +	size_t mem_size;
> +	struct qcom_scm_pas_metadata *metadata;
> +	bool save_mdt_ctx;

As mentioned above, can we just include qcom_scm_pas_metadata struct all
the time?

Thanks,
Pavan

