Return-Path: <linux-media+bounces-37949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C027B08660
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 09:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB2AA7B7E13
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 07:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF7D21C177;
	Thu, 17 Jul 2025 07:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FkLfl+U7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC8521772D
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 07:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752736769; cv=none; b=aFQazC6zGZVVLxnlYpwSdwqF2u6VQ86BHlTvxCOyKqtRydIrWXvrq2FnHuJvkCWUooqb5u1RyTuOxD6HfXz0UDCO17SoeOjCVJNGkbcKiyIMJTyL9QiEKbWkm6c3RwnB0yhWDj9XfB/c0sUvJg89i824foeYxOuFFWoOBThRIx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752736769; c=relaxed/simple;
	bh=dK+IulqJT+bf8nz8hR2gDtD0q6IDmJogijGsIezlICc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GIR8kuEcxrU9a7XzunKLMZxcy2QAPny7Gmh3v4GebKn63B9cCANL5iRbG5peSAqEnxKziEmB+vatW1Cv2TZShvwQ9p42qizQFJei2F/2Dd6MnvH/iSnA+F0btkowuGDan5huV3H2S0qCgofUGlVf/qtVHPek9DKqauJ0UmtESHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FkLfl+U7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H46UYQ003821
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 07:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KCdZbuCHSkjA2qVzQFwkUsQo
	w09n+kD1MscVQ/Uk4Sg=; b=FkLfl+U7utM0NBtFKISz4XklPLnFQlA/MQFtE5kb
	GOLh5AkPKi2RlryLe8alVRmBDo3kVw7V1Z+Bc+lQ2jk/mkTcexYpTsSxYESCY0fT
	R7YduMMvKnHd+FaJA4GZ3XfF65DgXK8WiJCVRz2/JrN7Cmmk+H6yl5pBX/aqkiAw
	naKmOYa4wy6zp21WYwyLsdPxc3E2LCeZH2V9KdcVQxDgOLjfUGH/YQyFuApGQHeW
	A8aJGRJyzdOel3blVq9Sp74QWNl0x++a4HtME3aG1kJTemgraB9/KyJAv4JSOw/6
	yoUW1jq/+3Sgrfp/tYYTOcQ/JUWJGVYSviS+brcRX+/3HA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xsukrfjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 07:19:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab878dfc1aso13118241cf.0
        for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 00:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752736764; x=1753341564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCdZbuCHSkjA2qVzQFwkUsQow09n+kD1MscVQ/Uk4Sg=;
        b=QeO0T6FbIomWs1U3PHaFWguWrqc2kTe7qH7i1b4YGjyzSf21dULG3AyfKVRouFUvWC
         ASccoA6KdJmba0bEBsqTc0AyfDUPVZKIHRwwOvB0awMcW2XvAH0adyldaWczlp5Q0LGT
         tthQ6a8VbcUrKXRQyngsf9NY6xe5qHgtyO7gG0mWt/31epRmbVQFOdmLBXbIRf6AEGpe
         5SXj6Xb2rJ2tkia50s8sWD3RBGLLzndCUe6HR6khvtFw7QBaqEwd9rUHrLmzewo1WJ/+
         A2y4nvyRbBip227YxQCwKlw8hgix/HGr5oX2J+a+RL0R/16FbE+JYUt83e6q9bWDODVN
         DZiA==
X-Forwarded-Encrypted: i=1; AJvYcCWFvOrvxfxLbySGIvz2dJOtGpvc+zrnRtJM2tfBh2kh71TOKaNxnqcbegAwBphHwVEA9G1X6xkh1R2Aag==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDUlyqrGqPycWtWEoBca3rMld7ubvGlIPMD9CunHE05ol13DaA
	1jUXauU64WBA5Qhwzp+qZ/Vb59FcVwXUSHzstUZ3cK9NWw7wHXaj2UUv9dVUsJZiJxutAlWv7Us
	LsW/XK2itAInUBWH2radnagXyFwiSyec2wOah3dkovDTOb0SBAHr8nlthZ8gy45P19g==
X-Gm-Gg: ASbGncuOBMah3ZRzGVXVquypXelFmgTM/42wml2ROIiaLrKDq8Lc7k1tbqVIwoEp9ey
	K+hdFmmZfaUGzXxZU6dnEyvsSYyPBK5jJu5CnOUGyLtDNsKkxRIv11WNAIg71XqE3PXTY267Hda
	BvKdNliBmTBv+ImXXN7pLVVHWMQ0SCfLMrvquRsYq5rCxVcMu0sUF9AhJk+oOHPyGmWxApBtZ2F
	qpGPCFycxAEYfVuq3zov5OzpujIbGet2qHXJ0+0Tl7YOkcve+cxWYHyTuNDjrs8FuM27nXy1jhH
	xGjxbM2CQR2x7VKF4ymYy3bQTKPMO8tYgFo5ogjV05AZ7fL3my7VyfieC3+v0GP7RwzMs7iuS1o
	=
X-Received: by 2002:a05:622a:1352:b0:4ab:690c:b2b5 with SMTP id d75a77b69052e-4aba3c48b6amr21506841cf.10.1752736763107;
        Thu, 17 Jul 2025 00:19:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhxogxpsGBqET0vvQuQ41HEW9UKJO+S1/fuwR+txa7JzpCw1waKaRToCB39V89f8ECL4R6fg==
X-Received: by 2002:a05:622a:1352:b0:4ab:690c:b2b5 with SMTP id d75a77b69052e-4aba3c48b6amr21506591cf.10.1752736762206;
        Thu, 17 Jul 2025 00:19:22 -0700 (PDT)
Received: from trex (153.red-79-144-197.dynamicip.rima-tde.net. [79.144.197.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd1a15sm19646727f8f.6.2025.07.17.00.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 00:19:21 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 17 Jul 2025 09:19:20 +0200
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        krzk+dt@kernel.org, konradybcio@kernel.org, mchehab@kernel.org,
        andersson@kernel.org, conor+dt@kernel.org,
        amit.kucheria@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/7] media: venus: Add support for AR50_LITE video core
Message-ID: <aHij+NHG5xbM1paO@trex>
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
 <20250715204749.2189875-4-jorge.ramirez@oss.qualcomm.com>
 <4734edd5-8224-4caa-8844-c38dabc6b6c0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4734edd5-8224-4caa-8844-c38dabc6b6c0@linaro.org>
X-Proofpoint-ORIG-GUID: 7KHteHWpI9VuGYeweZMdn3JTHTzjSgs6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDA2MiBTYWx0ZWRfX7x/lplOvQvGJ
 c2q/eW7Q9kw4R4IJgYoMmvX0ruTdNeWSOHX7SRJ0AD3W+NBzks6LDMMVQU2bi947yBNdFR3+Ws4
 81LA/Hrp1cOHZiFDmtD1tP4Q/4+zLxAiQMshm/rnyQEYoMA5izDy6hyj/8ZRro5FJhkpqHCEwti
 s5gWuCk12dcK+g5R8Zj7tMYlIG0lJPtl5HeORnmHq+kxMWKEgIHpIPObI4KHDKom5K7IVpeegoV
 fRkTZT0XVQIA3hp2fSUVq/OUF/ZkN0eOOBFB81nfYs8QLRh0iTjM3OupvHY8UbU4ro2geuwR5Ey
 Uy16OA9nHXSPvwI1H69B9Y3DGPBVVdvBs9bmChJ6REhb7DJ7oaltd+JkhAArww86oW8I4oEOp1k
 z5CrqqD2yAdrKb3ieqO2GuzBuJOgfb6cgDYqNofdGbdjk4NCizsNRlVOZ/w+MYGJ2unoriAx
X-Proofpoint-GUID: 7KHteHWpI9VuGYeweZMdn3JTHTzjSgs6
X-Authority-Analysis: v=2.4 cv=JJk7s9Kb c=1 sm=1 tr=0 ts=6878a3fd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Ki5fnJvzvo7yLsyA0quaxQ==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=xKlyOF9Lo1rPEIbgPB8A:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170062

On 17/07/25 00:50:29, Bryan O'Donoghue wrote:
> On 15/07/2025 21:47, Jorge Ramirez-Ortiz wrote:
> > The AR50_LITE is a simplified variant of the AR50 video core, designed for
> > power and cost-efficient platforms.
> > 
> > It supports hardware-accelerated decoding of H.264, HEVC, and VP9 formats,
> > and provides encoding support for H.264 and HEVC.
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/venus/core.c      | 15 +++++++--
> >   drivers/media/platform/qcom/venus/core.h      |  5 +++
> >   drivers/media/platform/qcom/venus/firmware.c  | 10 ++++++
> >   drivers/media/platform/qcom/venus/firmware.h  |  1 +
> >   drivers/media/platform/qcom/venus/helpers.c   | 30 +++++++++++++++--
> >   drivers/media/platform/qcom/venus/helpers.h   |  2 ++
> >   .../media/platform/qcom/venus/hfi_parser.c    |  5 +--
> >   .../media/platform/qcom/venus/hfi_platform.c  | 20 +++++++-----
> >   .../media/platform/qcom/venus/hfi_platform.h  | 25 ++++++++-------
> >   .../platform/qcom/venus/hfi_platform_v4.c     | 31 ++++++++++++------
> >   .../platform/qcom/venus/hfi_platform_v6.c     | 32 +++++++++++++------
> >   drivers/media/platform/qcom/venus/hfi_venus.c | 25 +++++++++++----
> >   .../media/platform/qcom/venus/hfi_venus_io.h  |  4 +++
> >   .../media/platform/qcom/venus/pm_helpers.c    |  2 +-
> >   drivers/media/platform/qcom/venus/vdec.c      |  7 +---
> >   15 files changed, 154 insertions(+), 60 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> > index b7d6745b6124..bad49f0b4a77 100644
> > --- a/drivers/media/platform/qcom/venus/core.c
> > +++ b/drivers/media/platform/qcom/venus/core.c
> > @@ -269,14 +269,19 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type,
> >   static void venus_assign_register_offsets(struct venus_core *core)
> >   {
> > -	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
> > -		core->vbif_base = core->base + VBIF_BASE;
> > +	if (IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
> >   		core->cpu_base = core->base + CPU_BASE_V6;
> >   		core->cpu_cs_base = core->base + CPU_CS_BASE_V6;
> >   		core->cpu_ic_base = core->base + CPU_IC_BASE_V6;
> >   		core->wrapper_base = core->base + WRAPPER_BASE_V6;
> >   		core->wrapper_tz_base = core->base + WRAPPER_TZ_BASE_V6;
> > -		core->aon_base = core->base + AON_BASE_V6;
> > +		if (IS_AR50_LITE(core)) {
> > +			core->vbif_base = NULL;
> > +			core->aon_base = NULL;
> > +		} else {
> > +			core->vbif_base = core->base + VBIF_BASE;
> > +			core->aon_base = core->base + AON_BASE_V6;
> > +		}
> >   	} else {
> >   		core->vbif_base = core->base + VBIF_BASE;
> >   		core->cpu_base = core->base + CPU_BASE;
> > @@ -476,6 +481,10 @@ static int venus_probe(struct platform_device *pdev)
> >   	if (ret)
> >   		goto err_firmware_deinit;
> > +	ret = venus_firmware_cfg(core);
> > +	if (ret)
> > +		goto err_venus_shutdown;
> > +
> >   	ret = hfi_core_resume(core, true);
> >   	if (ret)
> >   		goto err_venus_shutdown;
> > diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> > index 3af8386b78be..f5b59e81e3c2 100644
> > --- a/drivers/media/platform/qcom/venus/core.h
> > +++ b/drivers/media/platform/qcom/venus/core.h
> > @@ -538,6 +538,11 @@ struct venus_inst {
> >   #define IS_IRIS2(core)		((core)->res->vpu_version == VPU_VERSION_IRIS2)
> >   #define IS_IRIS2_1(core)	((core)->res->vpu_version == VPU_VERSION_IRIS2_1)
> > +static inline bool is_lite(struct venus_core *core)
> > +{
> > +	return IS_AR50_LITE(core);
> > +}
> > +
> >   #define ctrl_to_inst(ctrl)	\
> >   	container_of((ctrl)->handler, struct venus_inst, ctrl_handler)
> > diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> > index 66a18830e66d..c74988fd5ce2 100644
> > --- a/drivers/media/platform/qcom/venus/firmware.c
> > +++ b/drivers/media/platform/qcom/venus/firmware.c
> > @@ -207,6 +207,16 @@ static int venus_shutdown_no_tz(struct venus_core *core)
> >   	return 0;
> >   }
> > +int venus_firmware_cfg(struct venus_core *core)
> > +{
> > +	void __iomem *cpu_cs_base = core->cpu_cs_base;
> > +
> > +	if (IS_AR50_LITE(core))
> > +		writel(CPU_CS_VCICMD_ARP_OFF, cpu_cs_base + CPU_CS_VCICMD);
> > +
> > +	return 0;
> > +}
> > +
> >   int venus_boot(struct venus_core *core)
> >   {
> >   	struct device *dev = core->dev;
> > diff --git a/drivers/media/platform/qcom/venus/firmware.h b/drivers/media/platform/qcom/venus/firmware.h
> > index aaccd847fa30..3fea4ab63bf7 100644
> > --- a/drivers/media/platform/qcom/venus/firmware.h
> > +++ b/drivers/media/platform/qcom/venus/firmware.h
> > @@ -9,6 +9,7 @@ struct device;
> >   int venus_firmware_init(struct venus_core *core);
> >   void venus_firmware_deinit(struct venus_core *core);
> > +int venus_firmware_cfg(struct venus_core *core);
> >   int venus_boot(struct venus_core *core);
> >   int venus_shutdown(struct venus_core *core);
> >   int venus_set_hw_state(struct venus_core *core, bool suspend);
> > diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> > index 8295542e1a7c..438ed1abd8e8 100644
> > --- a/drivers/media/platform/qcom/venus/helpers.c
> > +++ b/drivers/media/platform/qcom/venus/helpers.c
> > @@ -230,6 +230,24 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
> >   }
> >   EXPORT_SYMBOL_GPL(venus_helper_alloc_dpb_bufs);
> > +void venus_helper_prepare_eos_data(struct venus_inst *inst,
> > +				   struct hfi_frame_data *data)
> > +{
> > +	struct venus_core *core = inst->core;
> > +
> > +	data->buffer_type = HFI_BUFFER_INPUT;
> > +	data->flags = HFI_BUFFERFLAG_EOS;
> > +
> > +	if (IS_V6(core) && is_fw_rev_or_older(core, 1, 0, 87))
> > +		return;
> > +
> > +	if (IS_V4(core) && is_lite(core) && is_fw_rev_or_older(core, 6, 0, 53))
> > +		data->alloc_len = 1;
> > +
> > +	data->device_addr = 0xdeadb000;
> > +}
> > +EXPORT_SYMBOL_GPL(venus_helper_prepare_eos_data);
> 
> This function doesn't appear to have alot to do with AR50_LITE as it
> pertains to IS_V6() and IS_V4().
> 
> This I think should be a separate patch with its own commit log to describe
> the quite complex logic of version numbers going on here.

Let me give it some background:

According to the HFI specification, EOS (End-of-Stream) buffers must
have 'valid' addresses. While the firmware currently appears to make no
use of the EOS buffer contents, allocating and mapping them would have
been a better driver choice IMO. Hoever this one has better performance
which is probably the reason why it has stayed.

The firmware then does perform operations involving the buffer's size
and length fields, and enforces boundary checks accordingly. On the
AR50_LITE platform, an earlier firmware version lacked a check on
alloc_len, leading to a division-by-zero scenario.

This has been addressed, and we plan to release firmware version 6.0.54,
which includes the necessary boundary check for alloc_len.

I should probaly replace IS_V4(core) && is_lite(core) with
IS_AR50_LITE() instead of trying to give it the appearence of a design
feature.

seems the sensible thing to do, right?

> 
> > +
> >   static int intbufs_set_buffer(struct venus_inst *inst, u32 type)
> >   {
> >   	struct venus_core *core = inst->core;
> > @@ -1715,11 +1733,17 @@ int venus_helper_session_init(struct venus_inst *inst)
> >   	if (ret)
> >   		return ret;
> > -	inst->clk_data.vpp_freq = hfi_platform_get_codec_vpp_freq(version, codec,
> > +	inst->clk_data.vpp_freq = hfi_platform_get_codec_vpp_freq(version,
> > +								  is_lite(inst->core),
> 
> I'm not trying to awkward questions but is there another 'lite' that this
> is_lite() logic is supposed to capture if not then why not
> IS_AR50_LITE()

And I asked myself the same questions.

I can't think of a reason why we wouldnt see additional LITE VPUs in the
future. So rather than creating a new platform definition - a
near-verbatim copy of the exisiting 4XX platform as was pointed out
during the review - I chose to extend the current platform support.

> 
> This differentation should be explained in commit log or inline /* comment
> */
> 
> > +								  codec,
> >   								  session_type);
> > -	inst->clk_data.vsp_freq = hfi_platform_get_codec_vsp_freq(version, codec,
> > +	inst->clk_data.vsp_freq = hfi_platform_get_codec_vsp_freq(version,
> > +								  is_lite(inst->core),
> > +								  codec,
> >   								  session_type);
> > -	inst->clk_data.low_power_freq = hfi_platform_get_codec_lp_freq(version, codec,
> > +	inst->clk_data.low_power_freq = hfi_platform_get_codec_lp_freq(version,
> > +								       is_lite(inst->core),
> > +								       codec,
> >   								       session_type);
> >   	return 0;
> > diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
> > index 358e4f39c9c0..62a734c1da1d 100644
> > --- a/drivers/media/platform/qcom/venus/helpers.h
> > +++ b/drivers/media/platform/qcom/venus/helpers.h
> > @@ -58,6 +58,8 @@ int venus_helper_get_out_fmts(struct venus_inst *inst, u32 fmt, u32 *out_fmt,
> >   bool venus_helper_check_format(struct venus_inst *inst, u32 v4l2_pixfmt);
> >   int venus_helper_alloc_dpb_bufs(struct venus_inst *inst);
> >   int venus_helper_free_dpb_bufs(struct venus_inst *inst);
> > +void venus_helper_prepare_eos_data(struct venus_inst *inst,
> > +				   struct hfi_frame_data *data);
> >   int venus_helper_intbufs_alloc(struct venus_inst *inst);
> >   int venus_helper_intbufs_free(struct venus_inst *inst);
> >   int venus_helper_intbufs_realloc(struct venus_inst *inst);
> > diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
> > index 1b3db2caa99f..55cee1c786a0 100644
> > --- a/drivers/media/platform/qcom/venus/hfi_parser.c
> > +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
> > @@ -277,12 +277,13 @@ static int hfi_platform_parser(struct venus_core *core, struct venus_inst *inst)
> >   	if (inst)
> >   		return 0;
> > -	ret = hfi_platform_get_codecs(core, &enc_codecs, &dec_codecs, &count);
> > +	ret = hfi_platform_get_codecs(core, &enc_codecs, &dec_codecs, &count,
> > +				      is_lite(core));
> >   	if (ret)
> >   		return ret;
> >   	if (plat->capabilities)
> > -		caps = plat->capabilities(&entries);
> > +		caps = plat->capabilities(&entries, is_lite(core));
> >   	if (!caps || !entries || !count)
> >   		return -EINVAL;
> > diff --git a/drivers/media/platform/qcom/venus/hfi_platform.c b/drivers/media/platform/qcom/venus/hfi_platform.c
> > index 643e5aa138f5..c6c248561793 100644
> > --- a/drivers/media/platform/qcom/venus/hfi_platform.c
> > +++ b/drivers/media/platform/qcom/venus/hfi_platform.c
> > @@ -21,7 +21,8 @@ const struct hfi_platform *hfi_platform_get(enum hfi_version version)
> >   }
> >   unsigned long
> > -hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec, u32 session_type)
> > +hfi_platform_get_codec_vpp_freq(enum hfi_version version, bool lite, u32 codec,
> > +				u32 session_type)
> >   {
> >   	const struct hfi_platform *plat;
> >   	unsigned long freq = 0;
> > @@ -31,13 +32,14 @@ hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec, u32 session
> >   		return 0;
> >   	if (plat->codec_vpp_freq)
> > -		freq = plat->codec_vpp_freq(session_type, codec);
> > +		freq = plat->codec_vpp_freq(session_type, codec, lite);
> >   	return freq;
> >   }
> >   unsigned long
> > -hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec, u32 session_type)
> > +hfi_platform_get_codec_vsp_freq(enum hfi_version version, bool lite, u32 codec,
> > +				u32 session_type)
> >   {
> >   	const struct hfi_platform *plat;
> >   	unsigned long freq = 0;
> > @@ -47,13 +49,14 @@ hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec, u32 session
> >   		return 0;
> >   	if (plat->codec_vpp_freq)
> > -		freq = plat->codec_vsp_freq(session_type, codec);
> > +		freq = plat->codec_vsp_freq(session_type, codec, lite);
> >   	return freq;
> >   }
> >   unsigned long
> > -hfi_platform_get_codec_lp_freq(enum hfi_version version, u32 codec, u32 session_type)
> > +hfi_platform_get_codec_lp_freq(enum hfi_version version, bool lite, u32 codec,
> > +			       u32 session_type)
> >   {
> >   	const struct hfi_platform *plat;
> >   	unsigned long freq = 0;
> > @@ -63,13 +66,14 @@ hfi_platform_get_codec_lp_freq(enum hfi_version version, u32 codec, u32 session_
> >   		return 0;
> >   	if (plat->codec_lp_freq)
> > -		freq = plat->codec_lp_freq(session_type, codec);
> > +		freq = plat->codec_lp_freq(session_type, codec, lite);
> >   	return freq;
> >   }
> >   int
> > -hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codecs, u32 *count)
> > +hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codecs, u32 *count,
> > +			bool lite)
> >   {
> >   	const struct hfi_platform *plat;
> > @@ -78,7 +82,7 @@ hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codec
> >   		return -EINVAL;
> >   	if (plat->codecs)
> > -		plat->codecs(enc_codecs, dec_codecs, count);
> > +		plat->codecs(enc_codecs, dec_codecs, count, lite);
> >   	if (IS_IRIS2_1(core)) {
> >   		*enc_codecs &= ~HFI_VIDEO_CODEC_VP8;
> > diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
> > index ec89a90a8129..a9f1ead18084 100644
> > --- a/drivers/media/platform/qcom/venus/hfi_platform.h
> > +++ b/drivers/media/platform/qcom/venus/hfi_platform.h
> > @@ -47,11 +47,12 @@ struct hfi_platform_codec_freq_data {
> >   };
> >   struct hfi_platform {
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
> >   	int (*bufreq)(struct hfi_plat_buffers_params *params, u32 session_type,
> >   		      u32 buftype, struct hfi_buffer_requirements *bufreq);
> >   };
> > @@ -60,12 +61,12 @@ extern const struct hfi_platform hfi_plat_v4;
> >   extern const struct hfi_platform hfi_plat_v6;
> >   const struct hfi_platform *hfi_platform_get(enum hfi_version version);
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
> >   int hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codecs,
> > -			    u32 *count);
> > +			    u32 *count, bool lite);
> >   #endif
> > diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v4.c b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> > index e3f0a90a567b..4ae7ed476c48 100644
> > --- a/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> > +++ b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> > @@ -245,14 +245,19 @@ static const struct hfi_plat_caps caps[] = {
> >   	.num_fmts = 4,
> >   } };
> > -static const struct hfi_plat_caps *get_capabilities(unsigned int *entries)
> > +static const struct hfi_plat_caps *get_capabilities(unsigned int *entries,
> > +						    bool lite)
> >   {
> > +	WARN_ON(lite);
> > +
> 
> Why add a parameter that triggers a warning ?

because this is the new interface that nobody is using at that time - so
if someone was to cherrypick this commit and not the other one and lite
was set by mistake it should trigger a warning IMO

not sure if it is the right thing to do though so happy to remove it if
you think is better

> 
> Just disjunct away from calling this function with the bool you are passing
> ?!?

is warning to the user that something has been wrongly configured.

> 
> >   	*entries = ARRAY_SIZE(caps);
> >   	return caps;
> >   }
> > -static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count)
> > +static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count, bool lite)
> >   {
> > +	WARN_ON(lite);
> 
> > +
> >   	*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> >   		      HFI_VIDEO_CODEC_VP8;
> >   	*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> > @@ -273,12 +278,14 @@ static const struct hfi_platform_codec_freq_data codec_freq_data[] =  {
> >   };
> >   static const struct hfi_platform_codec_freq_data *
> > -get_codec_freq_data(u32 session_type, u32 pixfmt)
> > +get_codec_freq_data(u32 session_type, u32 pixfmt, bool lite)
> >   {
> >   	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
> >   	unsigned int i, data_size = ARRAY_SIZE(codec_freq_data);
> >   	const struct hfi_platform_codec_freq_data *found = NULL;
> > +	WARN_ON(lite);
> > +
> 
> Yeah this pattern seems a bit mad to me, adding a bool as a parameter and
> then complaining about it with a WARN()

well, at that point, nobody should be using it. the user comes in the
following commit.

> 
> Why call the functioning if your bool already tells you its verboten ?

just being cautious an to help debug misconfigurations.

notice that the AR50_LITE support then removes the warning from the
plat_v4 but not from plat_v6 (since there are not plat_v6 lite
implementations yet).

> 
> 
> >   	for (i = 0; i < data_size; i++) {
> >   		if (data[i].pixfmt == pixfmt && data[i].session_type == session_type) {
> >   			found = &data[i];
> > @@ -289,33 +296,39 @@ get_codec_freq_data(u32 session_type, u32 pixfmt)
> >   	return found;
> >   }
> > -static unsigned long codec_vpp_freq(u32 session_type, u32 codec)
> > +static unsigned long codec_vpp_freq(u32 session_type, u32 codec, bool lite)
> >   {
> >   	const struct hfi_platform_codec_freq_data *data;
> > -	data = get_codec_freq_data(session_type, codec);
> > +	WARN_ON(lite);
> > +
> > +	data = get_codec_freq_data(session_type, codec, lite);
> >   	if (data)
> >   		return data->vpp_freq;
> >   	return 0;
> >   }
> > -static unsigned long codec_vsp_freq(u32 session_type, u32 codec)
> > +static unsigned long codec_vsp_freq(u32 session_type, u32 codec, bool lite)
> >   {
> >   	const struct hfi_platform_codec_freq_data *data;
> > -	data = get_codec_freq_data(session_type, codec);
> > +	WARN_ON(lite);
> > +
> > +	data = get_codec_freq_data(session_type, codec, lite);
> >   	if (data)
> >   		return data->vsp_freq;
> >   	return 0;
> >   }
> > -static unsigned long codec_lp_freq(u32 session_type, u32 codec)
> > +static unsigned long codec_lp_freq(u32 session_type, u32 codec, bool lite)
> >   {
> >   	const struct hfi_platform_codec_freq_data *data;
> > -	data = get_codec_freq_data(session_type, codec);
> > +	WARN_ON(lite);
> > +
> > +	data = get_codec_freq_data(session_type, codec, lite);
> >   	if (data)
> >   		return data->low_power_freq;
> > diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v6.c b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
> > index 4e8af645f8b9..ad08d26cd7ba 100644
> > --- a/drivers/media/platform/qcom/venus/hfi_platform_v6.c
> > +++ b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
> > @@ -245,14 +245,20 @@ static const struct hfi_plat_caps caps[] = {
> >   	.num_fmts = 4,
> >   } };
> > -static const struct hfi_plat_caps *get_capabilities(unsigned int *entries)
> > +static const struct hfi_plat_caps *get_capabilities(unsigned int *entries,
> > +						    bool lite)
> >   {
> > +	WARN_ON(lite);
> > +
> >   	*entries = ARRAY_SIZE(caps);
> >   	return caps;
> >   }
> > -static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count)
> > +static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count,
> > +		       bool lite)
> >   {
> > +	WARN_ON(lite);
> > +
> >   	*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> >   		      HFI_VIDEO_CODEC_VP8;
> >   	*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> > @@ -273,12 +279,14 @@ static const struct hfi_platform_codec_freq_data codec_freq_data[] = {
> >   };
> >   static const struct hfi_platform_codec_freq_data *
> > -get_codec_freq_data(u32 session_type, u32 pixfmt)
> > +get_codec_freq_data(u32 session_type, u32 pixfmt, bool lite)
> >   {
> >   	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
> >   	unsigned int i, data_size = ARRAY_SIZE(codec_freq_data);
> >   	const struct hfi_platform_codec_freq_data *found = NULL;
> > +	WARN_ON(lite);
> > +
> >   	for (i = 0; i < data_size; i++) {
> >   		if (data[i].pixfmt == pixfmt && data[i].session_type == session_type) {
> >   			found = &data[i];
> > @@ -289,33 +297,39 @@ get_codec_freq_data(u32 session_type, u32 pixfmt)
> >   	return found;
> >   }
> > -static unsigned long codec_vpp_freq(u32 session_type, u32 codec)
> > +static unsigned long codec_vpp_freq(u32 session_type, u32 codec, bool lite)
> >   {
> >   	const struct hfi_platform_codec_freq_data *data;
> > -	data = get_codec_freq_data(session_type, codec);
> > +	WARN_ON(lite);
> > +
> > +	data = get_codec_freq_data(session_type, codec, lite);
> >   	if (data)
> >   		return data->vpp_freq;
> >   	return 0;
> >   }
> > -static unsigned long codec_vsp_freq(u32 session_type, u32 codec)
> > +static unsigned long codec_vsp_freq(u32 session_type, u32 codec, bool lite)
> >   {
> >   	const struct hfi_platform_codec_freq_data *data;
> > -	data = get_codec_freq_data(session_type, codec);
> > +	WARN_ON(lite);
> > +
> > +	data = get_codec_freq_data(session_type, codec, lite);
> >   	if (data)
> >   		return data->vsp_freq;
> >   	return 0;
> >   }
> > -static unsigned long codec_lp_freq(u32 session_type, u32 codec)
> > +static unsigned long codec_lp_freq(u32 session_type, u32 codec, bool lite)
> >   {
> >   	const struct hfi_platform_codec_freq_data *data;
> > -	data = get_codec_freq_data(session_type, codec);
> > +	WARN_ON(lite);
> > +
> > +	data = get_codec_freq_data(session_type, codec, lite);
> >   	if (data)
> >   		return data->low_power_freq;
> > diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> > index cec7f5964d3d..d3da35f67fd5 100644
> > --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> > +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> > @@ -380,7 +380,7 @@ static void venus_soft_int(struct venus_hfi_device *hdev)
> >   	void __iomem *cpu_ic_base = hdev->core->cpu_ic_base;
> >   	u32 clear_bit;
> > -	if (IS_V6(hdev->core))
> > +	if (IS_V6(hdev->core) || (IS_V4(hdev->core) && is_lite(hdev->core)))
> >   		clear_bit = BIT(CPU_IC_SOFTINT_H2A_SHIFT_V6);
> >   	else
> >   		clear_bit = BIT(CPU_IC_SOFTINT_H2A_SHIFT);
> > @@ -501,9 +501,11 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
> >   	if (count >= max_tries)
> >   		ret = -ETIMEDOUT;
> > -	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
> > +	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core)) {
> >   		writel(0x1, cpu_cs_base + CPU_CS_H2XSOFTINTEN_V6);
> > -		writel(0x0, cpu_cs_base + CPU_CS_X2RPMH_V6);
> > +
> > +		if (!IS_AR50_LITE(hdev->core))
> > +			writel(0x0, cpu_cs_base + CPU_CS_X2RPMH_V6);
> >   	}
> >   	return ret;
> > @@ -569,6 +571,9 @@ static int venus_halt_axi(struct venus_hfi_device *hdev)
> >   	u32 mask_val;
> >   	int ret;
> > +	if (IS_AR50_LITE(hdev->core))
> > +		return 0;
> > +
> >   	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
> >   		writel(0x3, cpu_cs_base + CPU_CS_X2RPMH_V6);
> > @@ -1138,7 +1143,13 @@ static irqreturn_t venus_isr(struct venus_core *core)
> >   	wrapper_base = hdev->core->wrapper_base;
> >   	status = readl(wrapper_base + WRAPPER_INTR_STATUS);
> > -	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
> > +
> > +	if (IS_AR50_LITE(core)) {
> > +		if (status & WRAPPER_INTR_STATUS_A2H_MASK ||
> > +		    status & WRAPPER_INTR_STATUS_A2HWD_MASK_V4_LITE ||
> > +		    status & CPU_CS_SCIACMDARG0_INIT_IDLE_MSG_MASK)
> > +			hdev->irq_status = status;
> > +	} else if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
> >   		if (status & WRAPPER_INTR_STATUS_A2H_MASK ||
> >   		    status & WRAPPER_INTR_STATUS_A2HWD_MASK_V6 ||
> >   		    status & CPU_CS_SCIACMDARG0_INIT_IDLE_MSG_MASK)
> > @@ -1150,7 +1161,7 @@ static irqreturn_t venus_isr(struct venus_core *core)
> >   			hdev->irq_status = status;
> >   	}
> >   	writel(1, cpu_cs_base + CPU_CS_A2HSOFTINTCLR);
> > -	if (!(IS_IRIS2(core) || IS_IRIS2_1(core)))
> > +	if (!(IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)))
> >   		writel(status, wrapper_base + WRAPPER_INTR_CLEAR);
> >   	return IRQ_WAKE_THREAD;
> > @@ -1535,7 +1546,7 @@ static bool venus_cpu_and_video_core_idle(struct venus_hfi_device *hdev)
> >   	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
> >   	u32 ctrl_status, cpu_status;
> > -	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
> > +	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core))
> >   		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
> >   	else
> >   		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
> > @@ -1555,7 +1566,7 @@ static bool venus_cpu_idle_and_pc_ready(struct venus_hfi_device *hdev)
> >   	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
> >   	u32 ctrl_status, cpu_status;
> > -	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
> > +	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core))
> >   		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
> >   	else
> >   		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
> > diff --git a/drivers/media/platform/qcom/venus/hfi_venus_io.h b/drivers/media/platform/qcom/venus/hfi_venus_io.h
> > index 9735a246ce36..f2c3064c44ae 100644
> > --- a/drivers/media/platform/qcom/venus/hfi_venus_io.h
> > +++ b/drivers/media/platform/qcom/venus/hfi_venus_io.h
> > @@ -51,6 +51,9 @@
> >   /* Venus cpu */
> >   #define CPU_CS_SCIACMDARG3			0x58
> > +#define CPU_CS_VCICMD				0x20
> > +#define CPU_CS_VCICMD_ARP_OFF			BIT(0)
> > +
> >   #define SFR_ADDR				0x5c
> >   #define MMAP_ADDR				0x60
> >   #define UC_REGION_ADDR				0x64
> > @@ -100,6 +103,7 @@
> >   #define WRAPPER_INTR_MASK_A2HCPU_MASK		0x4
> >   #define WRAPPER_INTR_MASK_A2HCPU_SHIFT		0x2
> > +#define WRAPPER_INTR_STATUS_A2HWD_MASK_V4_LITE	0x10
> >   #define WRAPPER_INTR_STATUS_A2HWD_MASK_V6	0x8
> >   #define WRAPPER_INTR_MASK_A2HWD_BASK_V6		0x8
> > diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> > index 8dd5a9b0d060..e09b0d9ae610 100644
> > --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> > +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> > @@ -51,7 +51,7 @@ static int core_clks_enable(struct venus_core *core)
> >   	dev_pm_opp_put(opp);
> >   	for (i = 0; i < res->clks_num; i++) {
> > -		if (IS_V6(core)) {
> > +		if (IS_V6(core) || (IS_V4(core) && is_lite(core))) {
> >   			ret = clk_set_rate(core->clks[i], freq);
> >   			if (ret)
> >   				goto err;
> > diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> > index 29b0d6a5303d..ac3d2760b2e0 100644
> > --- a/drivers/media/platform/qcom/venus/vdec.c
> > +++ b/drivers/media/platform/qcom/venus/vdec.c
> > @@ -565,12 +565,7 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
> >   		if (!(inst->streamon_out && inst->streamon_cap))
> >   			goto unlock;
> > -		fdata.buffer_type = HFI_BUFFER_INPUT;
> > -		fdata.flags |= HFI_BUFFERFLAG_EOS;
> > -		if (IS_V6(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
> > -			fdata.device_addr = 0;
> > -		else
> > -			fdata.device_addr = 0xdeadb000;
> > +		venus_helper_prepare_eos_data(inst, &fdata);
> >   		ret = hfi_session_process_buf(inst, &fdata);
> 

