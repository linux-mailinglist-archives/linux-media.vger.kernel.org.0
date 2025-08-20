Return-Path: <linux-media+bounces-40400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AF8B2DC4E
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12F147AF2DD
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 12:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E40BD2F1FCA;
	Wed, 20 Aug 2025 12:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OEHUQiPK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27B22E7636
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 12:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755692682; cv=none; b=TPrmqdvnoOqOECdwKDvAtj/x7aY3dZp8dZxpRaLZaXIp+K1DZ84FQf5VZjfAWjVLGKkx+xx97loXiQ88gOHv5r07PtJ9cFQuNitEKZQPt4XfxSWL60bdxY2JlKwlL01ZhehxpUxOk4ZfdJGMlyOF0kP7xNsCzF2E0uDrxkbcE9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755692682; c=relaxed/simple;
	bh=MomZXsFaLDbT6+TmHvvmHexTKkxB4YMU4SO/vDjzvxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHFp+9VC3339n7JbktYMLlWD+iYUSQU9J5TVzcidmj5+Hpu+s9vdLi10z7R/kn313SrlZvByjvoBjAg8w6TE4rCvns5ijO2xXwS+ivSNLdQxTKIb2mkZ0BKWkH/47BS7DlOvotekvV6QxCdZYgZ70+eStYOrpqi0lVWRojI5sKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OEHUQiPK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K9rk9J010407
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 12:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	td0CaUx2Mv5Qw5Lyu7yhTrBx9hRRCjajUjhMqPsrw5c=; b=OEHUQiPKZshci3wo
	ZOR33yd7Kwz53t4GeEpOB6cmS3TiQlnZoipvDV+5leJw1O9ufMzTlOD9CHu0ePfe
	MuxftA4S10jrtSKzbxtM1hPwxLS3mGh/MwHrdqyFQ4noLOxhsbo5+LOfDfIev/7U
	PU/aMDAL7dZYLtX0P18tJvzLZjp78P4g1fvXnW40NSoXj1eJPRK0jK+VD17n2QG7
	R2kiHtLnJguVFoq1pUkqaG1jLfHqn9fVgdpRB7nkruW+yPhc+cRSZC3h+BYplf1O
	sO0irGsZxwrcctHKRUL9pWJz7dnHDHmMrsUbTP+C/2TfiUGYNhYPN8k4d1Go+kR8
	IWQOdw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528sn7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 12:24:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3235e45b815so3942717a91.0
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 05:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755692677; x=1756297477;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=td0CaUx2Mv5Qw5Lyu7yhTrBx9hRRCjajUjhMqPsrw5c=;
        b=RkidZupiQzmQD6gtO9iPVoPoLRbsHPeO+K+R93rYaE5PYi16wSiVwFIkf1+hTL+/dl
         7cu4ZwmbEdSbnqrG55opC0WnUQRaTHBc4xHGtxi5B5YbyCZPu9Yet0y4sG26iAOLFTJ7
         LVeG9lrsxoNuSg+vo+DMtqPxYjk07RS1NuMfz5HtKoOqjPJyPogfZASPHMZLRJzyVUUp
         PP4Na9v6YT/Se28suE6VLCfzmuyjtCj90loKxlZ/DGpUgNay7UYQa6a/LEOmjUMA9P40
         fnpWjfqj/jutKv4tCqh9FHe1Nvxu+Kjv0yYd2OAnR0y9/nbH1xWKGsmxZ7L8LaOFUWPW
         tT3g==
X-Forwarded-Encrypted: i=1; AJvYcCUGz9TAZaZM/ZHtcI8x0pmphO7AqLpBl5WknxkAaRzeqn9kI05l/rxd2WcP9ihI2HZ1cUXtoBSaKtuQcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcWgO+UyrpwJs6EHB1EMP4nVKMoWUJiz1L7b9UifP5qUUuyqA+
	UGHgKPCNClnG0u1W2DXX1qfzBKKa/AmImQQdZM8M+vF3f0cttfDVSL1kozbOY49L79gP0Nyftw4
	9xaYibAmqFlvUaVnOG3CByJkwTKGWxkM2Th6j2EwPErem4AIIM8VdhW6GFOdz84/jtTr1VebUpQ
	==
X-Gm-Gg: ASbGncsrz3VjCISwQ7YpYoHjrH0vVZd+wNGp9yUchkGV9mrSLPuBECMyp6adHIDf1ty
	ARvoGpbDboGDDTiD5bdwX0cep3EDbpKh5ZDSY4naI7GGNMFhQiz1ZiMReX0x2U9saq0Cq3kwhft
	bU+NAShW7914uv1o8UYmxCHxUM2gtjFmera2EclOZ2YExg3bZuq39x83Cb9BYoto/vyuIJ3BJBA
	v57P4mfjOihHhEQ+61mrmYfMGs2dlmXsIp5pAlcChOBRb0HT1IgD+Img0+umnL2TOfM7oKMKZqx
	hBeYTAHirOixma2A/TKKtFjCc/J96y/+ZaUp7rJAMfIqMRWpetF9/3alCiNdYv+UtmU=
X-Received: by 2002:a17:90b:53c4:b0:312:1c83:58fb with SMTP id 98e67ed59e1d1-324e136d137mr3422814a91.1.1755692677123;
        Wed, 20 Aug 2025 05:24:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSeDqZ1+f+FBiw8LkrIwhczOd3iHu1k+3zFS6lbDUoID7JiwtZhB6MFHXNPH6K7kLVr/h7Iw==
X-Received: by 2002:a17:90b:53c4:b0:312:1c83:58fb with SMTP id 98e67ed59e1d1-324e136d137mr3422777a91.1.1755692676600;
        Wed, 20 Aug 2025 05:24:36 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47640909f6sm2201034a12.35.2025.08.20.05.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 05:24:36 -0700 (PDT)
Date: Wed, 20 Aug 2025 17:54:30 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 03/11] firmware: qcom_scm: Add a prep version of
 auth_and_reset function
Message-ID: <20250820122430.pasbypbrtbaynxv7@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-4-mukesh.ojha@oss.qualcomm.com>
 <fd9eadb2-a209-4b52-a269-4e45c884bbc1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd9eadb2-a209-4b52-a269-4e45c884bbc1@linaro.org>
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a5be86 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=o3WOxAlSagPtyj5-6KUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: L9N1pSGa-egqXRv6EyQA1MPNP2VSlC_r
X-Proofpoint-ORIG-GUID: L9N1pSGa-egqXRv6EyQA1MPNP2VSlC_r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX7EOoVVi3ix5c
 XX2F71I8fz+66eZBDdXvCBQw7seETqlN49nYE1ox1DnGg+YAc5diS1jMyYXQXN7hYaDnchUgRrr
 b1WDhdrPSUyUgI8f4fVr3sO7PRL1b/5+w/rHKmhCg35TptVTyHD8kGLEbNvPB4gWPPZIg8MZMzI
 fWgbieSqkEWtd+t7SrFnrNP/H9/7W0r7riqJlB7E6gmPUQ1UXv6FwnYBZ1e1fQb5qp5Fm2vPaHq
 8lcUMaJzAtDapb4FZ5/XDAr9YDREEKiroylQ+AAbrkkAqeqIB4uajrDiX4m+IHCyRVUlRiNpk3g
 vW8/eXwNfOR8YXrqctNL+93IQLkcMu0ZYVsA+nFkmDY2T3FN1tJRQ17y73odpA69OzKvQh2qc6x
 WTQFbu2rpUj3MEhA/5Ii3CwS4Bm9Yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_04,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 01:03:41PM +0100, Bryan O'Donoghue wrote:
> On 19/08/2025 17:54, Mukesh Ojha wrote:
> > Qualcomm SoCs running with QHEE (Qualcomm Hypervisor Execution
> > Environment—a library present in the Gunyah hypervisor) utilize the
> > Peripheral Authentication Service (PAS) from TrustZone (TZ) firmware to
> > securely authenticate and reset remote processors via a sequence of SMC
> > calls such as qcom_scm_pas_init_image(), qcom_scm_pas_mem_setup(), and
> > qcom_scm_pas_auth_and_reset().
> > 
> > For memory passed to Qualcomm TrustZone, it must either be part of a
> > pool registered with TZ or be directly registered via SHMbridge SMC
> > calls.
> > 
> > When QHEE is present, PAS SMC calls from Linux running at EL1 are
> > trapped by QHEE (running at EL2), which then creates or retrieves memory
> > from the SHMbridge for both metadata and remoteproc carveout memory
> > before passing them to TZ. However, when the SoC runs with a
> > non-QHEE-based hypervisor, Linux must create the SHM bridge for both
> > metadata (before it is passed to TZ in qcom_scm_pas_init_image()) and
> > for remoteproc memory (before the call is made to TZ in
> > qcom_scm_pas_auth_and_reset()).
> > 
> > For auth_and_reset() call, first it need to register remoteproc carveout
> > memory with TZ via SHMbridge SMC call and then it can trigger
> > auth_and_reset SMC call and once the call returns, remoteproc carveout
> > memory can be deregisterd with TZ.
> > 
> > Add qcom_scm_pas_prepare_and_auth_reset() function which does prepare
> > the SHMbridge over carveout memory and call auth_and_reset SMC call.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >   drivers/firmware/qcom/qcom_scm.c       | 46 ++++++++++++++++++++++++++
> >   include/linux/firmware/qcom/qcom_scm.h |  2 ++
> >   2 files changed, 48 insertions(+)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index 33187d4f4aef..9a5b34f5bacb 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -759,6 +759,52 @@ int qcom_scm_pas_auth_and_reset(u32 peripheral)
> >   }
> >   EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
> > +/**
> > + * qcom_scm_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the remote processor
> > + *
> > + * @ctx:	Context saved during call to qcom_scm_pas_ctx_init()
> > + *
> > + * This function performs the necessary steps to prepare a PAS subsystem,
> > + * authenticate it using the provided metadata, and initiate a reset sequence.
> > + *
> > + * It is typically used when Linux is in control setting up the IOMMU hardware
> 
> Is there a non-typical case ?

In non-typical case is when system runs with Gunyah which in control of
IOMMU and create shmbridge before it passes the call to TrustZone.

> 
> "This function is used"

Ack.

> > + * for remote subsystem during secure firmware loading processes. The preparation
> > + * step sets up shmbridge over the firmware memory before TrustZone access the
> 
> shmbridge -> "a shmbridge"
> "access" -> "accesses"

Ack.

> 
> > + * firmware memory region for authentication. The authentication step verifies
> > + * the integrity and authenticity of the firmware or configuration using secure
> > + * metadata. Finally, the reset step ensures the subsystem starts in a clean and
> > + * sane state.
> > + *
> > + * Return: 0 on success, negative errno on failure.
> > + */
> > +int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_ctx *ctx)
> > +{
> > +	u64 handle;
> > +	int ret;
> > +
> > +	if (!ctx->has_iommu)
> > +		return qcom_scm_pas_auth_and_reset(ctx->peripheral);
> > +
> > +	/*
> > +	 * When Linux running at EL1, Gunyah(EL2) traps auth_and_reset call and creates
> > +	 * shmbridge on subsystem memory region before it passes the call to TrustZone
> > +	 * to authenticate it while when Linux runs at EL2, it needs to create shmbridge
> > +	 * before this call goes to TrustZone.
> > +	 */
> 
> If Linux is running at EL1, Gunyah running at EL2 traps the auth_and_reset
> call, creates a shmbridge in "subsystem memory ? bod: which subsystem do you
> mean here"

Subsystem memory => remote processor carve out memory

> and then passes the call to TrustZone. If Linux is running at EL2
> then Linux needs to create the shmbridge before calling into TrustZone.
> 
> > +	ret = qcom_tzmem_shm_bridge_create(ctx->mem_phys, ctx->mem_size, &handle);
> > +	if (ret) {
> > +		dev_err(__scm->dev, "Failed to create shmbridge ret=%d %u\n",
> > +			ret, ctx->peripheral);
> > +		return ret;
> > +	}
> > +
> > +	ret = qcom_scm_pas_auth_and_reset(ctx->peripheral);
> > +	qcom_tzmem_shm_bridge_delete(handle);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_scm_pas_prepare_and_auth_reset);
> > +
> >   /**
> >    * qcom_scm_pas_shutdown() - Shut down the remote processor
> >    * @peripheral: peripheral id
> > diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> > index b7eb206561a9..a31006fe49a9 100644
> > --- a/include/linux/firmware/qcom/qcom_scm.h
> > +++ b/include/linux/firmware/qcom/qcom_scm.h
> > @@ -79,6 +79,7 @@ struct qcom_scm_pas_ctx {
> >   	size_t mem_size;
> >   	struct qcom_scm_pas_metadata *metadata;
> >   	bool save_mdt_ctx;
> > +	bool has_iommu;
> >   };
> >   void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_phys,
> > @@ -87,6 +88,7 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
> >   			    struct qcom_scm_pas_metadata *ctx);
> >   void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
> >   int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr, phys_addr_t size);
> > +int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_ctx *ctx);
> >   int qcom_scm_pas_auth_and_reset(u32 peripheral);
> >   int qcom_scm_pas_shutdown(u32 peripheral);
> >   bool qcom_scm_pas_supported(u32 peripheral);
> 

-- 
-Mukesh Ojha

