Return-Path: <linux-media+bounces-40794-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2226B320E0
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 18:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46ECBAA73CB
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 16:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53403126B1;
	Fri, 22 Aug 2025 16:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J+AOPIm6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549F53101BD
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 16:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755881570; cv=none; b=e989SvoFoBeDIj4EpmI8JV5q0L5ddY7QuCwP6R2u0WI/GcT/afVMduPv46tYBHtZvdnqssv93c3ugy2ecfkQeJVCnG/qrzx07VKUBfYz0/rh9KQXya7BvfUw4XUNRE0CsO5bPjO/XGH99G8u+mg3A/7Y0+nYwEaVUV/uS6ZWxKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755881570; c=relaxed/simple;
	bh=axrZyMKofibmbGxYLFsSpEwUDnu3XhuMVS6WsqX56Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EpoE0qdbkQPkSzt0t9hn0p2Dry6/FZYoRp++awgcF6T528Mq8gHyMPQ0sEOuxyiPoZS1O/4qisfuAq+3Y5UT4ch1gnFa9ssBJCcgjExByMbJv2UFlWBldyt478lPTr6RrH5zD3N8nnQlH9OApwFlvHb7zv4yA6T9IyWHsTDu03w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J+AOPIm6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MG87uo003769
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 16:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y9wPGqZNvncckZvIAEYt+eG8B2TwIHRqaRE1CVjxYTI=; b=J+AOPIm6btB0Qsly
	XY/BD9hI0wtzZpbYoWzXToY7YFvRdaPHI3QenotAPDjRHLLtt2+N2mjylF5OoQxx
	xjHdmMqrABrThcfW9N/J1XcChGoPqDkqI3BkT6RPJBpiYWc7ZGyxdyG+MRfHWdiP
	8pHe2ZRKUhYJSafA2BRabfoZ9OI8MQBZsOupE8plDnDJ9Gppqk24XLxiDwqBC7T2
	N9F+qFzu/8+36X0kZaXwNtqsp5zUaUl/PejafYGR66AJQSxQIlETHh3vdsfVA6C2
	N3oYifQ3WAm7YH2ctdC95lF6YV0OeAM6YbK0AKJC5mSU8sthxG6w7T3I4X+rYPDi
	XHO+Mg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5299w3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 16:52:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e2eb47455so4571072b3a.3
        for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 09:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755881566; x=1756486366;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9wPGqZNvncckZvIAEYt+eG8B2TwIHRqaRE1CVjxYTI=;
        b=XvNSSSYDOTR7cQMG6qiXVzIMcGfNvOxY8VYAjnUK+KU8cAt8/GaKFGs0QQsmP64TJl
         N66pPmUf9ArENmwkHrH62YOvqlQQffqf/MUzQR8r+i1JYQRM1+GEOWl0gconEMs+rjHV
         bO4Rc5fFafrQbxS7SwXG5AyCNpYxQGtW3+yvteSBtLOQo8kImWDd8ISqKLQKMvcbTDSv
         gtJ+mn06vKua9qvyqxztlm418PjBQ6Nf6EoszP7KAMH6J0ZXRmJkmSNdSv3jfEqVpwv+
         zzPN/tUAEyaZHmQibm6TFcFj+BYOy5eSE8hjYZqgjyDUg7V4qP8A6vaRxLFPjTtz2AAe
         OJ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUo80Di42l2W+k+bMWPXlSfa26yxIozZCtZpDzwpvU56R2fX9xbA8SDygSO0VBoAgGuJ1M0QpCRyuCKZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSNKKFRi+9A3/Z3aSG4io19h8pJe/pkYkM6nfkGbEbLLR2stQS
	BmWbbdnOO6+8rZYRTuDArU4MGnzvMVQ9C67Xcjo9RGSBHwHU35+5D9SQeXprXjo4kEUVllEsyIB
	l1VdsHzIqkG3sTzmU2OOAmUieVOF3ZtALMYXsPdeWXyk0LHvkIMLKIZLXM1qPHi9K6g==
X-Gm-Gg: ASbGncsKUPnompe1GIUKSSC9PxtUvrP4oxQvsxsjHu123jokwICritm16WbOjOAxW4r
	6IORYfKwkVmMOlEVrZLeuKCQaAnkSaHFcWmPGGYvwujsyIlxHQ26kuUvirvZ+KPE7NjXseZEJ8t
	IxkK72gl1Zq4KGdl2Zv9JG9HJu5ias+InOdKnlUtqNw6wzU47dL8duxCsddNbMEtzKI9T9+HOhT
	HyzKNSuw06+bWGtZsmg29aBd+YySwosUrkAhHptpQvRMNMBo5Ondq6k4C8sj13VKDGnxdY3Yfsd
	KYYJy71BMAC1Vqx/wsHiv5VYKpbApyEzQs49fHVSNP869f+Voyqv4TlXsFRC/2r/Q9s=
X-Received: by 2002:a05:6a20:1582:b0:240:22a0:f23d with SMTP id adf61e73a8af0-24340ca5793mr5340954637.15.1755881565654;
        Fri, 22 Aug 2025 09:52:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElCiySNnsgRKrjBd1ikSgIv2xnBEpiq+H+51uXWMpi/z136OJJTBWbV9rhbkODYBFC1llurQ==
X-Received: by 2002:a05:6a20:1582:b0:240:22a0:f23d with SMTP id adf61e73a8af0-24340ca5793mr5340927637.15.1755881565075;
        Fri, 22 Aug 2025 09:52:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401f29c7sm364882b3a.81.2025.08.22.09.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 09:52:44 -0700 (PDT)
Date: Fri, 22 Aug 2025 22:22:38 +0530
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
Subject: Re: [PATCH v2 05/11] firmware: qcom_scm: Add shmbridge support to
 pas_init/release function
Message-ID: <20250822165238.ayslhgrjrbipojjk@hu-mojha-hyd.qualcomm.com>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-6-mukesh.ojha@oss.qualcomm.com>
 <de4b4872-061c-4f03-ae1d-1ad93b35ed71@linaro.org>
 <20250821170337.y7vzhtiugaeydqmh@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821170337.y7vzhtiugaeydqmh@hu-mojha-hyd.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a8a05f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=w0KPkksJRfO9XYSnt20A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: GQcwt72ryVKjQf-nWRKFDJCokSaMrbsQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX2o6+GbzdhCJu
 QD4HJsIz/v1Ca1vw8Ufj6zm/E/dH++5qk0Vv0I36D6UiSICiEtKE1IyBQPhMJJFv5OHvIECNrsV
 FZeXvU5eU+tSFyiTfrki2YqK2e3FM9e7jxvSI+y0eovTbxeuzyf9v795O6r00CiRdYu07rLrZXp
 QoaajgqAkMYbdvKJ2N6gLynwKCkRzPZA9Di3h+PQjrKjPtsCH1gkcVAq03hoNV+xf4sGbDpuOHS
 D5G7PFQBTXbZ9hV0YmGJnE2zInyDGvD+FDcE2Jy2z/FFrSriAByScXS+rLXMxi3HTN7AubIQ+HK
 zVTIkz0FlmF+dnJCWi9fSva9yV16hyjjpqyQbIoU2s4Cv1hft6tYdA0Xdo5D1W/djaIgylQ6QX7
 bjCld9OP4YjZwgsJiTKct/TbqDCEFQ==
X-Proofpoint-GUID: GQcwt72ryVKjQf-nWRKFDJCokSaMrbsQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013

On Thu, Aug 21, 2025 at 10:33:37PM +0530, Mukesh Ojha wrote:
> On Thu, Aug 21, 2025 at 04:23:53PM +0100, Bryan O'Donoghue wrote:
> > On 19/08/2025 17:54, Mukesh Ojha wrote:
> > > Qualcomm SoCs running with QHEE (Qualcomm Hypervisor Execution
> > > Environment—a library present in the Gunyah hypervisor) utilize the
> > > Peripheral Authentication Service (PAS) from Qualcomm TrustZone (TZ)
> > > also called QTEE(Qualcomm Trusted Execution Environment firmware)
> > > to securely authenticate and reset remote processors via a sequence
> > > of SMC calls such as qcom_scm_pas_init_image(), qcom_scm_pas_mem_setup(),
> > > and qcom_scm_pas_auth_and_reset().
> > > 
> > > For memory passed to Qualcomm TrustZone, it must either be part of a
> > > pool registered with TZ or be directly registered via SHMbridge SMC
> > > calls.
> > > 
> > > When QHEE is present, PAS SMC calls from Linux running at EL1 are
> > > trapped by QHEE (running at EL2), which then creates or retrieves memory
> > > from the SHM bridge for both metadata and remoteproc carveout memory
> > > before passing them to TZ. However, when the SoC runs with a
> > > non-QHEE-based hypervisor, Linux must create the SHM bridge for both
> > > metadata (before it is passed to TZ in qcom_scm_pas_init_image()) and
> > > for remoteproc memory (before the call is made to TZ in
> > > qcom_scm_pas_auth_and_reset()).
> > > 
> > > For the qcom_scm_pas_init_image() call, metadata content must be copied
> > > to a buffer allocated from the SHM bridge before making the SMC call.
> > > This buffer should be freed either immediately after the call or during
> > > the qcom_scm_pas_metadata_release() function, depending on the context
> > > parameter passed to qcom_scm_pas_init_image(). Convert the metadata
> > > context parameter to use PAS context data structure so that it will also
> > > be possible to decide whether to get memory from SHMbridge pool or not.
> > > 
> > > When QHEE is present, it manages the IOMMU translation context so, in
> > > absence of it device driver will be aware through device tree that its
> > > translation context is managed by Linux and it need to create SHMbridge
> > > before passing any buffer to TZ, So, remote processor driver should
> > > appropriately set ctx->has_iommu to let PAS SMC function to take care of
> > > everything ready for the call to work.
> > > 
> > > Lets convert qcom_scm_pas_init_image() and qcom_scm_pas_metadata_release()
> > > to have these awareness.
> > 
> > I like the effort in the commit log here but its also a bit too long.
> > 
> > Please go through these paragraphs and try to reduce down the amount of text
> > you are generating.
> 
> I was writing to set context for each commit and for the record and hence, the
> repetition of text you would see in some of the lines used.
> 
> I will take your suggestion and reduce it.
> 
> > 
> > > 
> > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > ---
> > >   drivers/firmware/qcom/qcom_scm.c       | 71 +++++++++++++++++++++-----
> > >   drivers/remoteproc/qcom_q6v5_pas.c     | 14 ++---
> > >   drivers/soc/qcom/mdt_loader.c          |  4 +-
> > >   include/linux/firmware/qcom/qcom_scm.h |  9 ++--
> > >   4 files changed, 73 insertions(+), 25 deletions(-)
> > > 
> > > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > > index 7827699e277c..301d440f62f3 100644
> > > --- a/drivers/firmware/qcom/qcom_scm.c
> > > +++ b/drivers/firmware/qcom/qcom_scm.c
> > > @@ -616,6 +616,35 @@ static int __qcom_scm_pas_init_image(u32 peripheral, dma_addr_t mdata_phys,
> > >   	return ret;
> > >   }
> > > +static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_ctx *ctx,
> > > +					    const void *metadata, size_t size)
> > > +{
> > > +	struct qcom_scm_pas_metadata *mdt_ctx;
> > > +	struct qcom_scm_res res;
> > > +	phys_addr_t mdata_phys;
> > > +	void *mdata_buf;
> > > +	int ret;
> > > +
> > > +	mdt_ctx = ctx->metadata;
> > > +	mdata_buf = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
> > > +	if (!mdata_buf)
> > > +		return -ENOMEM;
> > > +
> > > +	memcpy(mdata_buf, metadata, size);
> > > +	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
> > > +
> > > +	ret = __qcom_scm_pas_init_image(ctx->peripheral, mdata_phys, mdata_buf, size, &res);
> > > +	if (ret < 0 || !mdt_ctx) {
> > 
> > if ret is an error or mdt_ctx is null free the memory
> > 
> > > +		qcom_tzmem_free(mdata_buf);
> > > +	} else if (mdt_ctx) {
> > 
> > if mdt_ctx is valid do this
> 
> Nothing change, it is similar to the earlier code.
> 
> > 
> > > +		mdt_ctx->ptr = mdata_buf;
> > > +		mdt_ctx->addr.phys_addr = mdata_phys;
> > > +		mdt_ctx->size = size;
> > > +	}
> > > +
> > > +	return ret ? : res.result[0];
> > 
> > so we can have ctx_mtd valid but return the value at ret but also mtd valid
> > and return the res.result[0]
> > 
> > That seems like an odd choice - surely if you are enumerating the
> > data-structure the result code we care about is res.result[0] instead of ret
> > ?
> > 
> > OK I see this return logic comes from below..
> > 
> > But
> > 
> > drivers/soc/qcom/mdt_loader.c::qcom_mdt_pas_init
> > 
> > ret = qcom_scm_pas_init_image(pas_id, metadata, metadata_len, ctx);
> > kfree(metadata);
> > if (ret) {
> >     /* Invalid firmware metadata */
> >     dev_err(dev, "error %d initializing firmware %s\n", ret, fw_name);
> >     goto out;
> > }
> > 
> > So if ret as returned from your function is > 0 you will leak the memory
> > allocated @ mdata_buf ..
> > 
> > Do you expect something else to come along and call
> > qcom_scm_pas_metadata_release() ?
> 
> You just identified a bug in the existing code where qcom_mdt_pas_init()
> does not call qcom_scm_pas_metadata_release() for firmware image for
> failure case from qcom_q6v5_pas().

This could be bug only if some odd firmware return > 0 response code
even if the SMC was a success.

> 
> 
> > 
> > > +}
> > > +
> > >   /**
> > >    * qcom_scm_pas_init_image() - Initialize peripheral authentication service
> > >    *			       state machine for a given peripheral, using the
> > > @@ -625,7 +654,7 @@ static int __qcom_scm_pas_init_image(u32 peripheral, dma_addr_t mdata_phys,
> > >    *		and optional blob of data used for authenticating the metadata
> > >    *		and the rest of the firmware
> > >    * @size:	size of the metadata
> > > - * @ctx:	optional metadata context
> > > + * @ctx:	optional pas context
> > >    *
> > >    * Return: 0 on success.
> > >    *
> > > @@ -634,13 +663,19 @@ static int __qcom_scm_pas_init_image(u32 peripheral, dma_addr_t mdata_phys,
> > >    * qcom_scm_pas_metadata_release() by the caller.
> > >    */
> > >   int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
> > > -			    struct qcom_scm_pas_metadata *ctx)
> > > +			    struct qcom_scm_pas_ctx *ctx)
> > >   {
> > > +	struct qcom_scm_pas_metadata *mdt_ctx;
> > >   	struct qcom_scm_res res;
> > >   	dma_addr_t mdata_phys;
> > >   	void *mdata_buf;
> > >   	int ret;
> > > +	if (ctx && ctx->has_iommu) {
> > > +		ret = qcom_scm_pas_prep_and_init_image(ctx, metadata, size);
> > > +		return ret;
> > > +	}
> > > +
> > >   	/*
> > >   	 * During the scm call memory protection will be enabled for the meta
> > >   	 * data blob, so make sure it's physically contiguous, 4K aligned and
> > > @@ -663,10 +698,11 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
> > >   	ret = __qcom_scm_pas_init_image(peripheral, mdata_phys, mdata_buf, size, &res);
> > >   	if (ret < 0 || !ctx) {
> > >   		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
> > > -	} else if (ctx) {
> > > -		ctx->ptr = mdata_buf;
> > > -		ctx->phys = mdata_phys;
> > > -		ctx->size = size;
> > > +	} else if (ctx->metadata) {
> > > +		mdt_ctx = ctx->metadata;
> > > +		mdt_ctx->ptr = mdata_buf;
> > > +		mdt_ctx->addr.dma_addr = mdata_phys;
> > > +		mdt_ctx->size = size;
> > >   	}
> > >   	return ret ? : res.result[0];
> > 
> > is this return path still valid now that you've functionally decomposed into
> > qcom_sm_pas_prep_and_init ?

Yes, should be the same as it was earlier.

I believe, there is a duplication but its worth it to avoid confusion to
among different allocators used here one is DMA and other is TZmem.

> > 
> > > @@ -675,18 +711,27 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
> > >   /**
> > >    * qcom_scm_pas_metadata_release() - release metadata context
> > > - * @ctx:	metadata context
> > > + * @ctx:	pas context
> > >    */
> > > -void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
> > > +void qcom_scm_pas_metadata_release(struct qcom_scm_pas_ctx *ctx)
> > >   {
> > > -	if (!ctx->ptr)
> > > +	struct qcom_scm_pas_metadata *mdt_ctx;
> > > +
> > > +	mdt_ctx = ctx->metadata;
> > > +	if (!mdt_ctx->ptr)
> > >   		return;
> > > -	dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
> > > +	if (ctx->has_iommu) {
> > > +		qcom_tzmem_free(mdt_ctx->ptr);
> > > +		mdt_ctx->addr.phys_addr = 0;
> > > +	} else {
> > > +		dma_free_coherent(__scm->dev, mdt_ctx->size, mdt_ctx->ptr,
> > > +				  mdt_ctx->addr.dma_addr);
> > > +		mdt_ctx->addr.dma_addr = 0;
> > > +	}
> > > -	ctx->ptr = NULL;
> > > -	ctx->phys = 0;
> > > -	ctx->size = 0;
> > > +	mdt_ctx->ptr = NULL;
> > > +	mdt_ctx->size = 0;
> > >   }
> > >   EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
> > > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > > index e376c0338576..09cada92dfd5 100644
> > > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > > @@ -209,9 +209,9 @@ static int qcom_pas_unprepare(struct rproc *rproc)
> > >   	 * auth_and_reset() was successful, but in other cases clean it up
> > >   	 * here.
> > >   	 */
> > > -	qcom_scm_pas_metadata_release(pas->pas_ctx->metadata);
> > > +	qcom_scm_pas_metadata_release(pas->pas_ctx);
> > >   	if (pas->dtb_pas_id)
> > > -		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx->metadata);
> > > +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> > >   	return 0;
> > >   }
> > > @@ -244,7 +244,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
> > >   	return 0;
> > >   release_dtb_metadata:
> > > -	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx->metadata);
> > > +	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> > >   	release_firmware(pas->dtb_firmware);
> > >   	return ret;
> > > @@ -313,9 +313,9 @@ static int qcom_pas_start(struct rproc *rproc)
> > >   		goto release_pas_metadata;
> > >   	}
> > > -	qcom_scm_pas_metadata_release(pas->pas_ctx->metadata);
> > > +	qcom_scm_pas_metadata_release(pas->pas_ctx);
> > >   	if (pas->dtb_pas_id)
> > > -		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx->metadata);
> > > +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> > >   	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
> > >   	pas->firmware = NULL;
> > > @@ -323,9 +323,9 @@ static int qcom_pas_start(struct rproc *rproc)
> > >   	return 0;
> > >   release_pas_metadata:
> > > -	qcom_scm_pas_metadata_release(pas->pas_ctx->metadata);
> > > +	qcom_scm_pas_metadata_release(pas->pas_ctx);
> > >   	if (pas->dtb_pas_id)
> > > -		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx->metadata);
> > > +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> > >   disable_px_supply:
> > >   	if (pas->px_supply)
> > >   		regulator_disable(pas->px_supply);
> > > diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> > > index 509ff85d9bf6..a1718db91b3e 100644
> > > --- a/drivers/soc/qcom/mdt_loader.c
> > > +++ b/drivers/soc/qcom/mdt_loader.c
> > > @@ -240,7 +240,7 @@ EXPORT_SYMBOL_GPL(qcom_mdt_read_metadata);
> > >    */
> > >   static int __qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
> > >   			       const char *fw_name, int pas_id, phys_addr_t mem_phys,
> > > -			       struct qcom_scm_pas_metadata *ctx)
> > > +			       struct qcom_scm_pas_ctx *ctx)
> > >   {
> > >   	const struct elf32_phdr *phdrs;
> > >   	const struct elf32_phdr *phdr;
> > > @@ -491,7 +491,7 @@ int qcom_mdt_pas_load(struct qcom_scm_pas_ctx *ctx, const struct firmware *fw,
> > >   	int ret;
> > >   	ret = __qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->peripheral,
> > > -				  ctx->mem_phys, ctx->metadata);
> > > +				  ctx->mem_phys, ctx);
> > >   	if (ret)
> > >   		return ret;
> > > diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> > > index a31006fe49a9..bd3417d9c3f9 100644
> > > --- a/include/linux/firmware/qcom/qcom_scm.h
> > > +++ b/include/linux/firmware/qcom/qcom_scm.h
> > > @@ -68,7 +68,10 @@ int qcom_scm_set_remote_state(u32 state, u32 id);
> > >   struct qcom_scm_pas_metadata {
> > >   	void *ptr;
> > > -	dma_addr_t phys;
> > > +	union {
> > > +		dma_addr_t dma_addr;
> > > +		phys_addr_t phys_addr;
> > > +	} addr;
> > >   	ssize_t size;
> > >   };
> > > @@ -85,8 +88,8 @@ struct qcom_scm_pas_ctx {
> > >   void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_phys,
> > >   			    size_t mem_size, bool save_mdt_ctx);
> > >   int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
> > > -			    struct qcom_scm_pas_metadata *ctx);
> > > -void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
> > > +			    struct qcom_scm_pas_ctx *ctx);
> > > +void qcom_scm_pas_metadata_release(struct qcom_scm_pas_ctx *ctx);
> > >   int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr, phys_addr_t size);
> > >   int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_ctx *ctx);
> > >   int qcom_scm_pas_auth_and_reset(u32 peripheral);
> > 
> > Please review the error paths here especially WRT to qcom_mdt_pas_init();
> 
> Sure, will send the fix patch for the existing bug.

For existing code, consider a bug only if it is buggy firmware.

> 
> > 
> > ---
> > bod
> 
> -- 
> -Mukesh Ojha

-- 
-Mukesh Ojha

