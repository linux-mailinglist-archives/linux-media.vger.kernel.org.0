Return-Path: <linux-media+bounces-37470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 973CBB01A32
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 12:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 349EF7B2F6F
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 10:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A814C288C04;
	Fri, 11 Jul 2025 10:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gwOGH6YG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B079E28C2A3
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 10:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752231346; cv=none; b=l5Sr5kgOpqTJGqwYezmHeC7+Nxid4tyht1/9Scysv2C6ima1rUX9Xs2bKhwJt3k8le1th3JBtGDIRohIl0gBB7jw6Ihj6dviHdG9Delr0JPNmtjy1NMKHGU2mgi+seJjSzchKOVnzVNdOOIsZ15MgHZacxOGM7VNMz8of/B4CDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752231346; c=relaxed/simple;
	bh=ZB2NkAtITVRhbcjllXFBJhlImgoxJyuZLBOiRjDqSeg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=goxyh3L14kdMr0rGuKVBCclKQnUharajFcqWReMya6dQ1VDu5kukSSqJxV0IyUOBLEuDNEnICVEHGjLS/+ze7iVbgIf6sSvjn/5RPI9gsi8akEtENJHLycdSOh/gbN4sEpxdnac4sLElwRfnfbo5uSwL4XV8ScnonIjjJP0Od/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gwOGH6YG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1X5Wl001258
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 10:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=syB1KWLEe8aufLolsSvyT/o/
	2Ws8kE9bm53SnRn9h6o=; b=gwOGH6YG8Fbjet7MaKRSSpPQudj106aDM28YpNNb
	RvpYqGSsCWRT0HX7DRgUzyYOtzBRftBsXjv03cfj2391wa60m9/HUQiJnDrS7sVX
	gUOlKTT/tVZHTMAmFfzyoFoyGdohOK3qHvi07xRq63l4SlUjLrPBvw1Jg6GCoY35
	3/H7vcbGDafhspQnw72smAI+n+aB0HhEWvf7wyE7cPf3TDDGZC1MRk9GnFnMn+ga
	gLLJDg3SLeKIl4J8/OtjPVjYxuyYT9u8hUbad8/FjyLD/cRhnU0qkslyG9kgOXpa
	xn/SbmS5ju/gpuTQBrI5+SDLO/FqmgUgpiD3JiaA9twJxA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucnbrsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 10:55:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d413a10b4cso323771585a.1
        for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 03:55:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752231320; x=1752836120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syB1KWLEe8aufLolsSvyT/o/2Ws8kE9bm53SnRn9h6o=;
        b=c7tYBcwYNeGczwKUeF8iJ+84RTGdQ4HlvuJsRduZP6fZT8B3y7iYWmzGTJxxwP68MA
         k3z8PXmdIpuUzqo/5TH83Yd9b7Yb2r7CQQOt8ybaJSMxILL4HUgoo0oUX59AukrUF5He
         jlstGYGM6YMoDHtzNASlN1AMnmJqJKtrEgHq2fhHIuI5iieVuW1u2fXvUpikWXTpp2xy
         3bq+bqcoOJPc5I3hs2Btulv1KrzRejmbA2QBSbG4ChZ1f2BFzWWlPJeZ1YZQ6iwMd/2o
         Fx+1SpPuU/YAau+zneLMW+mzVZU4re6Ui6X3yF4c59mHktDox6iS0+1cJAHII1BdtH8Y
         p4gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlfkd05+ReLa5O77r5x/8RxXM2kZoFaJj6xsoRgsl6C+wEu4fOQntldyMXzKg2RDcevq5mIxsoFANvzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzW1bTaWlnnT3RKDA2SsqARzyWaCryrwGTJfDUG3eNexWj14NGd
	Q6raVMqmVuWYtR+ufeLnUjRpKEyUcOnMUjQErGIw5Qamg+JR6QAQ5JBt7SbANw6DULACZfwRC1I
	YctoKzEEEP+xDMWFdrpAiLxwDr0TDyd8sBIAgZdJ8FppzwrkrT0cDdQAEue0LIz4rLQ==
X-Gm-Gg: ASbGncvcOucIPVR76MIbnqD3FAMsBh2CUlgCA1gnmd25SLN3xgFr6DiFxLuvJGncLCv
	gHg5Kg0udMDHamseME0KE7A6AfbasjAIOhk/Y1RZv+jMw3f83wcGnAcW6MPUr0LxkU9ZyU7ViiU
	+vVy4XmZ8hnsXY4aKcuUwMRKHHWKm+s18h62nNJOiNaLuM6SPAc3yiZe7DaQvhQ3f1TwFwJ1jcW
	/UnSEUYA4kGrEBGNrB37sTgeEDrODSpePVPc/1vCAHsaSOR8mJSyJ2tPy3H1iueNofP8zcvw2LR
	nlEloJTUmWruE5O+9lcpJErNsudHOeCUBW+nh+IObzcGAO2Tv3SRgEETJSKKA2pxVIeERwFW09o
	=
X-Received: by 2002:a05:620a:28c1:b0:7d2:fc7:9572 with SMTP id af79cd13be357-7decabbc057mr232981885a.57.1752231319565;
        Fri, 11 Jul 2025 03:55:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuZlQHI7QdMs+A4mi5Qs7kkIvouZYDiMinm2zCF2yxLz0W4s5agI5F0PgLFK3jccD4uxmY6g==
X-Received: by 2002:a05:620a:28c1:b0:7d2:fc7:9572 with SMTP id af79cd13be357-7decabbc057mr232976985a.57.1752231318722;
        Fri, 11 Jul 2025 03:55:18 -0700 (PDT)
Received: from trex (153.red-79-144-197.dynamicip.rima-tde.net. [79.144.197.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd537785sm44441015e9.23.2025.07.11.03.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 03:55:18 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Fri, 11 Jul 2025 12:55:16 +0200
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        krzk+dt@kernel.org, konradybcio@kernel.org, mchehab@kernel.org,
        robh@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        amit.kucheria@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/7] media: venus: Add support for AR50_LITE video core
Message-ID: <aHDtlMWsRIXs8+AK@trex>
References: <20250708180530.1384330-1-jorge.ramirez@oss.qualcomm.com>
 <20250708180530.1384330-4-jorge.ramirez@oss.qualcomm.com>
 <5e0d3fab-25ae-b4e1-a7a2-5c681642de75@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e0d3fab-25ae-b4e1-a7a2-5c681642de75@quicinc.com>
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=6870edae cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Ki5fnJvzvo7yLsyA0quaxQ==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=FqQH6GxpU3lmhe5LJP8A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: LEnMNy2gJoyN6WJ2nXejxXB4klYGf3yZ
X-Proofpoint-ORIG-GUID: LEnMNy2gJoyN6WJ2nXejxXB4klYGf3yZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3NyBTYWx0ZWRfX4jyz+nSqsjs2
 xE3Q78+oDMgZTrU8qdQ/fzp1YiMfZe1wOrwt8x/8H+I86Wz9BZqM1ykggzvib98K1pAimGvB3Hc
 wQicVCWHFWTfY6W1jaOCHC0LXQ5qNHjrZVhMxglveofa2VJC3fwkkHBhAvVuSXNurBfUtw4tQt8
 4M+XMs+bxwK83SzSo0cbjxoL5mgtJxyHbyDYkjbFi0sADpB9QAFfqo4MiE828mK+3st0HGlAzhd
 bCaZDhdl3nBf/NqlH2P4lxmwMAMzbopBJHZP2nX/6Kr0RMY5EL5s5LSLHHFTmi903ZZNM2zy+5q
 B5IS/mC8q+7IdlTmzo9Pgykz08IN75XwALx1H7GlBsL3oZOhHuytcif6xczIzVIiVqy/9lfYYwN
 ScLVQ+TRJ1SVN9VSFabXFdpvt2KVfoPhjdr3r9iMweCKZxKEKuUdcQP1OnbVfykPR6U1neLB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110077

On 10/07/25 15:35:10, Dikshita Agarwal wrote:
> 
> 
> On 7/8/2025 11:35 PM, Jorge Ramirez-Ortiz wrote:
> > The AR50_LITE is a simplified variant of the AR50 video core, designed for
> > power and cost-efficient platforms.
> > 
> > It supports hardware-accelerated decoding of H.264, HEVC, and VP9 formats,
> > and provides encoding support for H.264 and HEVC.
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/venus/core.c      | 11 ++-
> >  drivers/media/platform/qcom/venus/core.h      |  7 ++
> >  drivers/media/platform/qcom/venus/firmware.c  |  6 +-
> >  drivers/media/platform/qcom/venus/helpers.c   | 87 ++++++++++++++++++-
> >  drivers/media/platform/qcom/venus/helpers.h   |  2 +
> >  .../media/platform/qcom/venus/hfi_parser.c    |  5 +-
> >  .../media/platform/qcom/venus/hfi_platform.c  | 20 +++--
> >  .../media/platform/qcom/venus/hfi_platform.h  | 25 +++---
> >  .../platform/qcom/venus/hfi_platform_v4.c     | 33 ++++---
> >  .../platform/qcom/venus/hfi_platform_v6.c     | 32 +++++--
> >  drivers/media/platform/qcom/venus/hfi_venus.c | 16 ++--
> >  .../media/platform/qcom/venus/pm_helpers.c    |  2 +-
> >  drivers/media/platform/qcom/venus/vdec.c      | 16 ++--
> >  13 files changed, 196 insertions(+), 66 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> > index 9744c18af54d..a4472cc2088b 100644
> > --- a/drivers/media/platform/qcom/venus/core.c
> > +++ b/drivers/media/platform/qcom/venus/core.c
> > @@ -267,14 +267,19 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type,
> >  
> >  static void venus_assign_register_offsets(struct venus_core *core)
> >  {
> > -	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
> > -		core->vbif_base = core->base + VBIF_BASE;
> > +	if (IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
> >  		core->cpu_base = core->base + CPU_BASE_V6;
> >  		core->cpu_cs_base = core->base + CPU_CS_BASE_V6;
> >  		core->cpu_ic_base = core->base + CPU_IC_BASE_V6;
> >  		core->wrapper_base = core->base + WRAPPER_BASE_V6;
> >  		core->wrapper_tz_base = core->base + WRAPPER_TZ_BASE_V6;
> > -		core->aon_base = core->base + AON_BASE_V6;
> > +		if (IS_AR50_LITE(core)) {
> > +			core->vbif_base = NULL;
> > +			core->aon_base = NULL;
> > +		} else {
> > +			core->vbif_base = core->base + VBIF_BASE;
> > +			core->aon_base = core->base + AON_BASE_V6;
> > +		}
> >  	} else {
> >  		core->vbif_base = core->base + VBIF_BASE;
> >  		core->cpu_base = core->base + CPU_BASE;
> > diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> > index 3af8386b78be..3b55365a942c 100644
> > --- a/drivers/media/platform/qcom/venus/core.h
> > +++ b/drivers/media/platform/qcom/venus/core.h
> > @@ -392,6 +392,7 @@ enum venus_inst_modes {
> >   * @lock:	instance lock
> >   * @core:	a reference to the core struct
> >   * @clk_data:	clock data per core ID
> > + * @eosbufs:	a list of EOS buffers
> >   * @dpbbufs:	a list of decoded picture buffers
> >   * @internalbufs:	a list of internal bufferes
> >   * @registeredbufs:	a list of registered capture bufferes
> > @@ -460,6 +461,7 @@ struct venus_inst {
> >  	struct mutex lock;
> >  	struct venus_core *core;
> >  	struct clock_data clk_data;
> > +	struct list_head eosbufs;
> >  	struct list_head dpbbufs;
> >  	struct list_head internalbufs;
> >  	struct list_head registeredbufs;
> > @@ -538,6 +540,11 @@ struct venus_inst {
> >  #define IS_IRIS2(core)		((core)->res->vpu_version == VPU_VERSION_IRIS2)
> >  #define IS_IRIS2_1(core)	((core)->res->vpu_version == VPU_VERSION_IRIS2_1)
> >  
> > +static inline bool is_lite(struct venus_core *core)
> > +{
> > +	return IS_AR50_LITE(core);
> > +}
> > +
> >  #define ctrl_to_inst(ctrl)	\
> >  	container_of((ctrl)->handler, struct venus_inst, ctrl_handler)
> >  
> > diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> > index 66a18830e66d..00b13b203ed1 100644
> > --- a/drivers/media/platform/qcom/venus/firmware.c
> > +++ b/drivers/media/platform/qcom/venus/firmware.c
> > @@ -30,7 +30,7 @@ static void venus_reset_cpu(struct venus_core *core)
> >  	u32 fw_size = core->fw.mapped_mem_size;
> >  	void __iomem *wrapper_base;
> >  
> > -	if (IS_IRIS2_1(core))
> > +	if (IS_IRIS2_1(core) || IS_AR50_LITE(core))
> venus_reset_cpu is only relevant in the non-TZ configuration. Please drop
> this handling as it's not applicable in the current context.

ok


> >  		wrapper_base = core->wrapper_tz_base;
> >  	else
> >  		wrapper_base = core->wrapper_base;
> > @@ -42,7 +42,7 @@ static void venus_reset_cpu(struct venus_core *core)
> >  	writel(fw_size, wrapper_base + WRAPPER_NONPIX_START_ADDR);
> >  	writel(fw_size, wrapper_base + WRAPPER_NONPIX_END_ADDR);
> >  
> > -	if (IS_IRIS2_1(core)) {
> > +	if (IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
> >  		/* Bring XTSS out of reset */
> >  		writel(0, wrapper_base + WRAPPER_TZ_XTSS_SW_RESET);
> >  	} else {
> > @@ -68,7 +68,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
> >  	if (resume) {
> >  		venus_reset_cpu(core);
> >  	} else {
> > -		if (IS_IRIS2_1(core))
> > +		if (IS_IRIS2_1(core) || IS_AR50_LITE(core))
> This again is relevant in the non-TZ configuration. Please drop.

ok

> >  			writel(WRAPPER_XTSS_SW_RESET_BIT,
> >  			       core->wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
> >  		else
> > diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> > index 8295542e1a7c..aa61396e763e 100644
> > --- a/drivers/media/platform/qcom/venus/helpers.c
> > +++ b/drivers/media/platform/qcom/venus/helpers.c
> > @@ -230,6 +230,81 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
> >  }
> >  EXPORT_SYMBOL_GPL(venus_helper_alloc_dpb_bufs);
> >  
> > +static void free_eos_buf(struct venus_inst *inst, struct intbuf *buf)
> > +{
> > +	list_del_init(&buf->list);
> > +	dma_free_attrs(inst->core->dev, buf->size, buf->va, buf->da,
> > +		       buf->attrs);
> > +	kfree(buf);
> > +}
> > +
> > +int venus_helper_free_eos_bufs(struct venus_inst *inst)
> > +{
> > +	struct intbuf *buf, *n;
> > +
> > +	list_for_each_entry_safe(buf, n, &inst->eosbufs, list) {
> > +		free_eos_buf(inst, buf);
> > +	}
> > +
> > +	if (list_empty(&inst->eosbufs))
> > +		INIT_LIST_HEAD(&inst->eosbufs);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(venus_helper_free_eos_bufs);
> > +
> > +int venus_helper_alloc_eos_buf(struct venus_inst *inst,
> > +			       struct hfi_frame_data *data)
> > +{
> > +	struct venus_core *core = inst->core;
> > +	struct device *dev = core->dev;
> > +	struct intbuf *buf;
> > +	int ret = 0;
> > +
> > +	memset(data, 0, sizeof(*data));
> > +
> > +	data->buffer_type = HFI_BUFFER_INPUT;
> > +	data->flags = HFI_BUFFERFLAG_EOS;
> > +
> > +	if (IS_V6(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87)) {
> > +		data->device_addr = 0;
> > +		return 0;
> > +	}
> > +
> > +	if (IS_V4(inst->core) && is_lite(core)) {
> > +		/* We must send valid sizes and addresses */
> > +		buf = kzalloc(sizeof(*buf), GFP_KERNEL);
> > +		if (!buf) {
> > +			ret = -ENOMEM;
> > +			goto fail;
> > +		}
> > +
> > +		buf->type = HFI_BUFFER_INPUT;
> > +		buf->size = SZ_4K;
> > +		buf->attrs = DMA_ATTR_NO_KERNEL_MAPPING;
> > +		buf->va = dma_alloc_attrs(dev, buf->size, &buf->da, GFP_KERNEL,
> > +					  buf->attrs);
> > +		if (!buf->va) {
> > +			ret = -ENOMEM;
> > +			goto fail;
> > +		}
> > +
> > +		list_add_tail(&buf->list, &inst->eosbufs);
> > +
> > +		data->alloc_len = buf->size;
> > +		data->device_addr = buf->da;
> > +
> > +	} else {
> > +		data->device_addr = 0xdeadb000;
> > +	}
> > +
> > +	return 0;
> > +fail:
> > +	kfree(buf);
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(venus_helper_alloc_eos_buf);
> > +
> Special handling for EOS should be avoided unless there's a clear and
> compelling need.

once this lands, we should look into reverting what is upstream instead
(for reference, while this follows the HFI spec the current
implementation of EOS upstream does not).


> >  static int intbufs_set_buffer(struct venus_inst *inst, u32 type)
> >  {
> >  	struct venus_core *core = inst->core;
> > @@ -1715,11 +1790,17 @@ int venus_helper_session_init(struct venus_inst *inst)
> >  	if (ret)
> >  		return ret;
> >  
> > -	inst->clk_data.vpp_freq = hfi_platform_get_codec_vpp_freq(version, codec,
> > +	inst->clk_data.vpp_freq = hfi_platform_get_codec_vpp_freq(version,
> > +								  is_lite(inst->core),
> > +								  codec,
> >  								  session_type);
> > -	inst->clk_data.vsp_freq = hfi_platform_get_codec_vsp_freq(version, codec,
> > +	inst->clk_data.vsp_freq = hfi_platform_get_codec_vsp_freq(version,
> > +								  is_lite(inst->core),
> > +								  codec,
> >  								  session_type);
> > -	inst->clk_data.low_power_freq = hfi_platform_get_codec_lp_freq(version, codec,
> > +	inst->clk_data.low_power_freq = hfi_platform_get_codec_lp_freq(version,
> > +								       is_lite(inst->core),
> > +								       codec,
> >  								       session_type);
> >  
> >  	return 0;
> > diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
> > index 358e4f39c9c0..bf55fe3b8747 100644
> > --- a/drivers/media/platform/qcom/venus/helpers.h
> > +++ b/drivers/media/platform/qcom/venus/helpers.h
> > @@ -58,6 +58,8 @@ int venus_helper_get_out_fmts(struct venus_inst *inst, u32 fmt, u32 *out_fmt,
> >  bool venus_helper_check_format(struct venus_inst *inst, u32 v4l2_pixfmt);
> >  int venus_helper_alloc_dpb_bufs(struct venus_inst *inst);
> >  int venus_helper_free_dpb_bufs(struct venus_inst *inst);
> > +int venus_helper_alloc_eos_buf(struct venus_inst *inst, struct hfi_frame_data *data);
> > +int venus_helper_free_eos_bufs(struct venus_inst *inst);
> >  int venus_helper_intbufs_alloc(struct venus_inst *inst);
> >  int venus_helper_intbufs_free(struct venus_inst *inst);
> >  int venus_helper_intbufs_realloc(struct venus_inst *inst);
> > diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
> > index 1b3db2caa99f..55cee1c786a0 100644
> > --- a/drivers/media/platform/qcom/venus/hfi_parser.c
> > +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
> > @@ -277,12 +277,13 @@ static int hfi_platform_parser(struct venus_core *core, struct venus_inst *inst)
> >  	if (inst)
> >  		return 0;
> >  
> > -	ret = hfi_platform_get_codecs(core, &enc_codecs, &dec_codecs, &count);
> > +	ret = hfi_platform_get_codecs(core, &enc_codecs, &dec_codecs, &count,
> > +				      is_lite(core));
> >  	if (ret)
> >  		return ret;
> >  
> >  	if (plat->capabilities)
> > -		caps = plat->capabilities(&entries);
> > +		caps = plat->capabilities(&entries, is_lite(core));
> >  
> >  	if (!caps || !entries || !count)
> >  		return -EINVAL;
> > diff --git a/drivers/media/platform/qcom/venus/hfi_platform.c b/drivers/media/platform/qcom/venus/hfi_platform.c
> > index 643e5aa138f5..c6c248561793 100644
> > --- a/drivers/media/platform/qcom/venus/hfi_platform.c
> > +++ b/drivers/media/platform/qcom/venus/hfi_platform.c
> > @@ -21,7 +21,8 @@ const struct hfi_platform *hfi_platform_get(enum hfi_version version)
> >  }
> >  
> >  unsigned long
> > -hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec, u32 session_type)
> > +hfi_platform_get_codec_vpp_freq(enum hfi_version version, bool lite, u32 codec,
> > +				u32 session_type)
> >  {
> >  	const struct hfi_platform *plat;
> >  	unsigned long freq = 0;
> > @@ -31,13 +32,14 @@ hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec, u32 session
> >  		return 0;
> >  
> >  	if (plat->codec_vpp_freq)
> > -		freq = plat->codec_vpp_freq(session_type, codec);
> > +		freq = plat->codec_vpp_freq(session_type, codec, lite);
> >  
> >  	return freq;
> >  }
> >  
> >  unsigned long
> > -hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec, u32 session_type)
> > +hfi_platform_get_codec_vsp_freq(enum hfi_version version, bool lite, u32 codec,
> > +				u32 session_type)
> >  {
> >  	const struct hfi_platform *plat;
> >  	unsigned long freq = 0;
> > @@ -47,13 +49,14 @@ hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec, u32 session
> >  		return 0;
> >  
> >  	if (plat->codec_vpp_freq)
> > -		freq = plat->codec_vsp_freq(session_type, codec);
> > +		freq = plat->codec_vsp_freq(session_type, codec, lite);
> >  
> >  	return freq;
> >  }
> >  
> >  unsigned long
> > -hfi_platform_get_codec_lp_freq(enum hfi_version version, u32 codec, u32 session_type)
> > +hfi_platform_get_codec_lp_freq(enum hfi_version version, bool lite, u32 codec,
> > +			       u32 session_type)
> >  {
> >  	const struct hfi_platform *plat;
> >  	unsigned long freq = 0;
> > @@ -63,13 +66,14 @@ hfi_platform_get_codec_lp_freq(enum hfi_version version, u32 codec, u32 session_
> >  		return 0;
> >  
> >  	if (plat->codec_lp_freq)
> > -		freq = plat->codec_lp_freq(session_type, codec);
> > +		freq = plat->codec_lp_freq(session_type, codec, lite);
> >  
> >  	return freq;
> >  }
> >  
> >  int
> > -hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codecs, u32 *count)
> > +hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codecs, u32 *count,
> > +			bool lite)
> >  {
> >  	const struct hfi_platform *plat;
> >  
> > @@ -78,7 +82,7 @@ hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codec
> >  		return -EINVAL;
> >  
> >  	if (plat->codecs)
> > -		plat->codecs(enc_codecs, dec_codecs, count);
> > +		plat->codecs(enc_codecs, dec_codecs, count, lite);
> >  
> >  	if (IS_IRIS2_1(core)) {
> >  		*enc_codecs &= ~HFI_VIDEO_CODEC_VP8;
> > diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
> > index ec89a90a8129..a9f1ead18084 100644
> > --- a/drivers/media/platform/qcom/venus/hfi_platform.h
> > +++ b/drivers/media/platform/qcom/venus/hfi_platform.h
> > @@ -47,11 +47,12 @@ struct hfi_platform_codec_freq_data {
> >  };
> >  
> >  struct hfi_platform {
> > -	unsigned long (*codec_vpp_freq)(u32 session_type, u32 codec);
> > -	unsigned long (*codec_vsp_freq)(u32 session_type, u32 codec);
> > -	unsigned long (*codec_lp_freq)(u32 session_type, u32 codec);
> > -	void (*codecs)(u32 *enc_codecs, u32 *dec_codecs, u32 *count);
> > -	const struct hfi_plat_caps *(*capabilities)(unsigned int *entries);
> > +	unsigned long (*codec_vpp_freq)(u32 session_type, u32 codec, bool lite);
> > +	unsigned long (*codec_vsp_freq)(u32 session_type, u32 codec, bool lite);
> > +	unsigned long (*codec_lp_freq)(u32 session_type, u32 codec, bool lite);
> > +	void (*codecs)(u32 *enc_codecs, u32 *dec_codecs, u32 *count, bool lite);
> > +	const struct hfi_plat_caps *(*capabilities)(unsigned int *entries,
> > +						    bool lite);
> >  	int (*bufreq)(struct hfi_plat_buffers_params *params, u32 session_type,
> >  		      u32 buftype, struct hfi_buffer_requirements *bufreq);
> >  };
> > @@ -60,12 +61,12 @@ extern const struct hfi_platform hfi_plat_v4;
> >  extern const struct hfi_platform hfi_plat_v6;
> >  
> >  const struct hfi_platform *hfi_platform_get(enum hfi_version version);
> > -unsigned long hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec,
> > -					      u32 session_type);
> > -unsigned long hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec,
> > -					      u32 session_type);
> > -unsigned long hfi_platform_get_codec_lp_freq(enum hfi_version version, u32 codec,
> > -					     u32 session_type);
> > +unsigned long hfi_platform_get_codec_vpp_freq(enum hfi_version version, bool lite,
> > +					      u32 codec, u32 session_type);
> > +unsigned long hfi_platform_get_codec_vsp_freq(enum hfi_version version, bool lite,
> > +					      u32 codec, u32 session_type);
> > +unsigned long hfi_platform_get_codec_lp_freq(enum hfi_version version, bool lite,
> > +					     u32 codec, u32 session_type);
> >  int hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codecs,
> > -			    u32 *count);
> > +			    u32 *count, bool lite);
> >  #endif
> > diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v4.c b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> > index e3f0a90a567b..c8e0f8040649 100644
> > --- a/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> > +++ b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> > @@ -245,14 +245,19 @@ static const struct hfi_plat_caps caps[] = {
> >  	.num_fmts = 4,
> >  } };
> >  
> > -static const struct hfi_plat_caps *get_capabilities(unsigned int *entries)
> > +static const struct hfi_plat_caps *get_capabilities(unsigned int *entries,
> > +						    bool lite)
> >  {
> > +	WARN_ON(lite);
> > +
> Adding something, which is removed in next patch itself.

yes, that is correct: the first patch is the framework for lite, the second
one is the first user therfore removing the warning. Reverting the later
patch should not invalidate the framework hence why this should stay as
is.


> >  	*entries = ARRAY_SIZE(caps);
> >  	return caps;
> >  }
> >  
> > -static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count)
> > +static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count, bool lite)
> >  {
> > +	WARN_ON(lite);
> > +
> >  	*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> >  		      HFI_VIDEO_CODEC_VP8;
> >  	*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> > @@ -273,11 +278,13 @@ static const struct hfi_platform_codec_freq_data codec_freq_data[] =  {
> >  };
> >  
> >  static const struct hfi_platform_codec_freq_data *
> > -get_codec_freq_data(u32 session_type, u32 pixfmt)
> > +get_codec_freq_data(u32 session_type, u32 pixfmt, bool lite)
> >  {
> > -	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
> >  	unsigned int i, data_size = ARRAY_SIZE(codec_freq_data);
> >  	const struct hfi_platform_codec_freq_data *found = NULL;
> > +	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
> why is this needed? I don't see any difference.

it is not, just a leftover, will fix.

> > +
> > +	WARN_ON(lite);
> >  
> >  	for (i = 0; i < data_size; i++) {
> >  		if (data[i].pixfmt == pixfmt && data[i].session_type == session_type) {
> > @@ -289,33 +296,39 @@ get_codec_freq_data(u32 session_type, u32 pixfmt)
> >  	return found;
> >  }
> >  
> > -static unsigned long codec_vpp_freq(u32 session_type, u32 codec)
> > +static unsigned long codec_vpp_freq(u32 session_type, u32 codec, bool lite)
> >  {
> >  	const struct hfi_platform_codec_freq_data *data;
> >  
> > -	data = get_codec_freq_data(session_type, codec);
> > +	WARN_ON(lite);
> > +
> > +	data = get_codec_freq_data(session_type, codec, lite);
> >  	if (data)
> >  		return data->vpp_freq;
> >  
> >  	return 0;
> >  }
> >  
> > -static unsigned long codec_vsp_freq(u32 session_type, u32 codec)
> > +static unsigned long codec_vsp_freq(u32 session_type, u32 codec, bool lite)
> >  {
> >  	const struct hfi_platform_codec_freq_data *data;
> >  
> > -	data = get_codec_freq_data(session_type, codec);
> > +	WARN_ON(lite);
> > +
> > +	data = get_codec_freq_data(session_type, codec, lite);
> >  	if (data)
> >  		return data->vsp_freq;
> >  
> >  	return 0;
> >  }
> >  
> > -static unsigned long codec_lp_freq(u32 session_type, u32 codec)
> > +static unsigned long codec_lp_freq(u32 session_type, u32 codec, bool lite)
> >  {
> >  	const struct hfi_platform_codec_freq_data *data;
> >  
> > -	data = get_codec_freq_data(session_type, codec);
> > +	WARN_ON(lite);
> > +
> > +	data = get_codec_freq_data(session_type, codec, lite);
> >  	if (data)
> >  		return data->low_power_freq;
> >  
> > diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v6.c b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
> > index 4e8af645f8b9..ad08d26cd7ba 100644
> > --- a/drivers/media/platform/qcom/venus/hfi_platform_v6.c
> > +++ b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
> > @@ -245,14 +245,20 @@ static const struct hfi_plat_caps caps[] = {
> >  	.num_fmts = 4,
> >  } };
> >  
> > -static const struct hfi_plat_caps *get_capabilities(unsigned int *entries)
> > +static const struct hfi_plat_caps *get_capabilities(unsigned int *entries,
> > +						    bool lite)
> >  {
> > +	WARN_ON(lite);
> > +
> >  	*entries = ARRAY_SIZE(caps);
> >  	return caps;
> >  }
> >  
> > -static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count)
> > +static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count,
> > +		       bool lite)
> >  {
> > +	WARN_ON(lite);
> > +
> >  	*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> >  		      HFI_VIDEO_CODEC_VP8;
> >  	*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> > @@ -273,12 +279,14 @@ static const struct hfi_platform_codec_freq_data codec_freq_data[] = {
> >  };
> >  
> >  static const struct hfi_platform_codec_freq_data *
> > -get_codec_freq_data(u32 session_type, u32 pixfmt)
> > +get_codec_freq_data(u32 session_type, u32 pixfmt, bool lite)
> >  {
> >  	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
> >  	unsigned int i, data_size = ARRAY_SIZE(codec_freq_data);
> >  	const struct hfi_platform_codec_freq_data *found = NULL;
> >  
> > +	WARN_ON(lite);
> > +
> >  	for (i = 0; i < data_size; i++) {
> >  		if (data[i].pixfmt == pixfmt && data[i].session_type == session_type) {
> >  			found = &data[i];
> > @@ -289,33 +297,39 @@ get_codec_freq_data(u32 session_type, u32 pixfmt)
> >  	return found;
> >  }
> >  
> > -static unsigned long codec_vpp_freq(u32 session_type, u32 codec)
> > +static unsigned long codec_vpp_freq(u32 session_type, u32 codec, bool lite)
> >  {
> >  	const struct hfi_platform_codec_freq_data *data;
> >  
> > -	data = get_codec_freq_data(session_type, codec);
> > +	WARN_ON(lite);
> > +
> > +	data = get_codec_freq_data(session_type, codec, lite);
> >  	if (data)
> >  		return data->vpp_freq;
> >  
> >  	return 0;
> >  }
> >  
> > -static unsigned long codec_vsp_freq(u32 session_type, u32 codec)
> > +static unsigned long codec_vsp_freq(u32 session_type, u32 codec, bool lite)
> >  {
> >  	const struct hfi_platform_codec_freq_data *data;
> >  
> > -	data = get_codec_freq_data(session_type, codec);
> > +	WARN_ON(lite);
> > +
> > +	data = get_codec_freq_data(session_type, codec, lite);
> >  	if (data)
> >  		return data->vsp_freq;
> >  
> >  	return 0;
> >  }
> >  
> > -static unsigned long codec_lp_freq(u32 session_type, u32 codec)
> > +static unsigned long codec_lp_freq(u32 session_type, u32 codec, bool lite)
> >  {
> >  	const struct hfi_platform_codec_freq_data *data;
> >  
> > -	data = get_codec_freq_data(session_type, codec);
> > +	WARN_ON(lite);
> > +
> > +	data = get_codec_freq_data(session_type, codec, lite);
> >  	if (data)
> >  		return data->low_power_freq;
> >  
> > diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> > index cec7f5964d3d..4ee35049e797 100644
> > --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> > +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> > @@ -380,7 +380,7 @@ static void venus_soft_int(struct venus_hfi_device *hdev)
> >  	void __iomem *cpu_ic_base = hdev->core->cpu_ic_base;
> >  	u32 clear_bit;
> >  
> > -	if (IS_V6(hdev->core))
> > +	if (IS_V6(hdev->core) || (IS_V4(hdev->core) && is_lite(hdev->core)))
> >  		clear_bit = BIT(CPU_IC_SOFTINT_H2A_SHIFT_V6);
> >  	else
> >  		clear_bit = BIT(CPU_IC_SOFTINT_H2A_SHIFT);
> > @@ -501,7 +501,7 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
> >  	if (count >= max_tries)
> >  		ret = -ETIMEDOUT;
> >  
> > -	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
> > +	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core)) {
> >  		writel(0x1, cpu_cs_base + CPU_CS_H2XSOFTINTEN_V6);
> >  		writel(0x0, cpu_cs_base + CPU_CS_X2RPMH_V6);
> As previously commented on v5, CPU_CS_X2RPMH_V6 is not needed for
> AR50_LITE, pls drop.

ok

> >  	}
> > @@ -569,6 +569,9 @@ static int venus_halt_axi(struct venus_hfi_device *hdev)
> >  	u32 mask_val;
> >  	int ret;
> >  
> > +	if (IS_AR50_LITE(hdev->core))
> > +		return 0;
> > +
> >  	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
> >  		writel(0x3, cpu_cs_base + CPU_CS_X2RPMH_V6);
> >  
> > @@ -1138,7 +1141,8 @@ static irqreturn_t venus_isr(struct venus_core *core)
> >  	wrapper_base = hdev->core->wrapper_base;
> >  
> >  	status = readl(wrapper_base + WRAPPER_INTR_STATUS);
> > -	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
> > +
> > +	if (IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
> >  		if (status & WRAPPER_INTR_STATUS_A2H_MASK ||
> >  		    status & WRAPPER_INTR_STATUS_A2HWD_MASK_V6 ||
> >  		    status & CPU_CS_SCIACMDARG0_INIT_IDLE_MSG_MASK)
> As previously commented on v5, WD mask is incorrect, pls fix.

argh interesting - I wonder how the watchdog interrupt could work (I was
enabling and triggering the watchdog during the encoder analisys)...

but, you are right, will fix. thanks!


> 
> Thanks,
> Dikshita
> > @@ -1150,7 +1154,7 @@ static irqreturn_t venus_isr(struct venus_core *core)
> >  			hdev->irq_status = status;
> >  	}
> >  	writel(1, cpu_cs_base + CPU_CS_A2HSOFTINTCLR);
> > -	if (!(IS_IRIS2(core) || IS_IRIS2_1(core)))
> > +	if (!(IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)))
> >  		writel(status, wrapper_base + WRAPPER_INTR_CLEAR);
> >  
> >  	return IRQ_WAKE_THREAD;
> > @@ -1535,7 +1539,7 @@ static bool venus_cpu_and_video_core_idle(struct venus_hfi_device *hdev)
> >  	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
> >  	u32 ctrl_status, cpu_status;
> >  
> > -	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
> > +	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core))
> >  		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
> >  	else
> >  		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
> > @@ -1555,7 +1559,7 @@ static bool venus_cpu_idle_and_pc_ready(struct venus_hfi_device *hdev)
> >  	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
> >  	u32 ctrl_status, cpu_status;
> >  
> > -	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
> > +	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core))
> >  		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
> >  	else
> >  		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
> > diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> > index 8dd5a9b0d060..e09b0d9ae610 100644
> > --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> > +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> > @@ -51,7 +51,7 @@ static int core_clks_enable(struct venus_core *core)
> >  	dev_pm_opp_put(opp);
> >  
> >  	for (i = 0; i < res->clks_num; i++) {
> > -		if (IS_V6(core)) {
> > +		if (IS_V6(core) || (IS_V4(core) && is_lite(core))) {
> >  			ret = clk_set_rate(core->clks[i], freq);
> >  			if (ret)
> >  				goto err;
> > diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> > index 29b0d6a5303d..77ebb6bf1ca0 100644
> > --- a/drivers/media/platform/qcom/venus/vdec.c
> > +++ b/drivers/media/platform/qcom/venus/vdec.c
> > @@ -548,7 +548,7 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
> >  {
> >  	struct venus_inst *inst = to_inst(file);
> >  	struct vb2_queue *dst_vq;
> > -	struct hfi_frame_data fdata = {0};
> > +	struct hfi_frame_data fdata;
> >  	int ret;
> >  
> >  	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, fh, cmd);
> > @@ -559,18 +559,15 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
> >  
> >  	if (cmd->cmd == V4L2_DEC_CMD_STOP) {
> >  		/*
> > -		 * Implement V4L2_DEC_CMD_STOP by enqueue an empty buffer on
> > +		 * Implement V4L2_DEC_CMD_STOP by enqueue a buffer on
> >  		 * decoder input to signal EOS.
> >  		 */
> >  		if (!(inst->streamon_out && inst->streamon_cap))
> >  			goto unlock;
> >  
> > -		fdata.buffer_type = HFI_BUFFER_INPUT;
> > -		fdata.flags |= HFI_BUFFERFLAG_EOS;
> > -		if (IS_V6(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
> > -			fdata.device_addr = 0;
> > -		else
> > -			fdata.device_addr = 0xdeadb000;
> > +		ret = venus_helper_alloc_eos_buf(inst, &fdata);
> > +		if (ret)
> > +			goto unlock;
> >  
> >  		ret = hfi_session_process_buf(inst, &fdata);
> >  
> > @@ -1205,7 +1202,6 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
> >  
> >  	mutex_unlock(&inst->lock);
> >  	return 0;
> > -
> >  put_power:
> >  	vdec_pm_put(inst, false);
> >  error:
> > @@ -1330,6 +1326,7 @@ static void vdec_session_release(struct venus_inst *inst)
> >  		hfi_session_abort(inst);
> >  
> >  	venus_helper_free_dpb_bufs(inst);
> > +	venus_helper_free_eos_bufs(inst);
> >  	venus_pm_load_scale(inst);
> >  	INIT_LIST_HEAD(&inst->registeredbufs);
> >  	mutex_unlock(&inst->lock);
> > @@ -1680,6 +1677,7 @@ static int vdec_open(struct file *file)
> >  	if (!inst)
> >  		return -ENOMEM;
> >  
> > +	INIT_LIST_HEAD(&inst->eosbufs);
> >  	INIT_LIST_HEAD(&inst->dpbbufs);
> >  	INIT_LIST_HEAD(&inst->registeredbufs);
> >  	INIT_LIST_HEAD(&inst->internalbufs);

