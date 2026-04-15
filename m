Return-Path: <linux-media+bounces-58784-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPibFAxA32kxRAAAu9opvQ
	(envelope-from <linux-media+bounces-58784-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 09:36:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7724016DB
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 09:36:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 075E230C7187
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 07:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E853A452A;
	Wed, 15 Apr 2026 07:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cs6qslBN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tlq3Ccxb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815911A8F84
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 07:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776238578; cv=none; b=D05kVSMGzaY1rZSI1+0AV4gGBHtVNGeTDLhCFcFzqRtKlGDAwe8/S2dYkjenJssvn8MkfmRtuPRlebN5cnnUBr8Mo5ktFZNY5RMSwURQwTC+ulGE0kwu1E2v1YjIrPGANOcne33CZopnh5U6ApFc7p7Iqq0bjAw/ye2XIcsUUlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776238578; c=relaxed/simple;
	bh=qvDtdBalEmpqzQiiJSiWIWmcoXbpmQi1SZdtaW9ofJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Za8kublhMxdDSnzdLAyMyYfMP7c81HvdnMRyPyoQ32dEziYC3sFnEXeVjpLZU/d49ZTBB3uA+dB4XJzcfQpgAaFiaWq6r0LOXvwMtJ8ZxPpmv0P4biyWSBUmKgwzJ+FqV416/0QYwaWLPjHkaLQK7ZTtCC3QsJiMfeNCyGJLBqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cs6qslBN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tlq3Ccxb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F5xFic2772630
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 07:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DQkQ13VwYk7y9WZVFoKj2Sxw
	SlJE02nLR/KA9q/+7vU=; b=cs6qslBN8gKJVFG7Cyf79Oht1+uP6N0af+hA0CTT
	+Ns6+D3jzgmyk69Ml5FE8qEgGhL+AYPFMinM+qW+0AMpyvSISYDunxheFU4mbXYP
	13mNbsssXND+NEvJcgMz3yVSFEyG/lzmOZeHQ1veiHr3o/7BBz1DUHxJQv2PPjQf
	EpfODVEL9CuFHSeTJGpU3IbqxsBynJpEXk+u76HzDIOMcYLc/K6whC4t8zZwgrKB
	/cAmmf+lkwqdi66zElrBZvUCp3yT3886sQxeCfJqMo5FclzkiggAjhXvpP+nLyQj
	fEqewHOJtDf1fWfG9Y88zK8SP6p7/pVCvGqhxfrqii1Ymg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj50v0a8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 07:36:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b258636d16so62747475ad.2
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 00:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776238575; x=1776843375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DQkQ13VwYk7y9WZVFoKj2SxwSlJE02nLR/KA9q/+7vU=;
        b=Tlq3CcxbTEg3jEsD2KSNuszsQCTLh8VJe4Z81iCsqHnr+Ac765luqrernjWq54kplx
         SKb/K4TXQDBivtQVkWTvpOXRXXqlwGAezsCrePlFGMoHqVPIMVcLXQdqhnM/TnjUDwPu
         4CllYAWPYveTDAAwqWiZ361Cjqgu62blNHPoNYv3VYFxgVcwT82ckkd0y6WI3x8YK62P
         r7HbgTS+ShDsBzz9LMuWAo0KudZrFRjXcVD81V4xPnlvmL1Gx3rBzwSNBBzLETFicxpU
         Uvw5wp1EMSNTO5g/Fd4ZWXVSSFxVobOzTMXXVQW+Dc+r68B0dyhCCzzooSzWU51qHlCz
         Mpfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776238575; x=1776843375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQkQ13VwYk7y9WZVFoKj2SxwSlJE02nLR/KA9q/+7vU=;
        b=dIhw7FJMCmBtxcqWRW8IRmfGODGhEq5GeYGdPA1cJDBYhCNTNGK2krBOF2KoGiN6WL
         lmQmn1B/V4XVMHBqmQ/l7V/R/ry6UbyFgU6DxieeHWK4sDZXnaMx0fPEG7XkG/Ak1OUm
         xUIP3m+g6dunnrYXYRpX5UbF07fbN1WhDLCkp+drz3GsaxAgZ2+6Jqk9ovljQRD4SMkC
         uUJhqO3AhJMieP8CXE87gOu2mHVPjDQejLXmVjLh0MSnT7F8l+vX/mjSe+jIv1l5uaiP
         o3562skMJTJ0kDzCr9QUv8Spzw5NKIL0m8ZLCVuEKO6ezmzmjVcEIaQ/M13mlN0Gcl9i
         Zpkw==
X-Forwarded-Encrypted: i=1; AFNElJ/oyuRgq5Z1eMQjUfsnSdt6hbaRxt6Voteap1iTDKN4hZnIoRBVr49mbZfZCe/NWD8cbVQnOKMCrtshIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsw0AmQcd9oxSVkhwJZp8J7WvPNxQe/y2mNNz4Xd+0EkTkvqMS
	wgKI98dnwxn/td4Yn6f+ZEQJGqa+drj2VBrCXfdBSqKTzQJfLb6D32xdbI4RRwfi79RJahWpevP
	LMUsqWbsjPq+FbRBeIm+EvtELWyoKYmI6DINUxIl2LLqkxywA3GYxj6mQYPZ86iI9ZA==
X-Gm-Gg: AeBDietHwhEZABU25JSLWzMp6x3zfEru5ZllRtitnL1RMKJtGFz1HtMXjbi8HT8IK7h
	aiwAuKwkRPn6DLpF+H3MbnbJ24upUXp/xPMW1s4kgdKspHAiwDNffmAtzfSPqTWPBsFHKOGLI7e
	QA0HQAcP/e42MRM+Bu/UPhvpYnKfjsPBHu2UY8+7mJZsdxWbUWuuRFYSmh5rjTCTOCf8+njWU7g
	sV9bt5teS+1dkrk1/ugi6YRJOYCQ11fiCbUaaCsym5l85r0O4X/fVzUt9LqVMQw7rexAtXavWi+
	NYWBRry/C79juJMMYtIbrJEpLZhsp0vUDRMVS79No6iWQFWW6r8UJm/9j7/cRhA6orXAzMzfvdh
	LZB/yzPah+fRCfYrL9ZVyFr/di8ZqjTG8rsKos9yNxB/ZEljY
X-Received: by 2002:a17:903:4765:b0:2b2:6cab:313c with SMTP id d9443c01a7336-2b2d5a54f0emr213238915ad.20.1776238574952;
        Wed, 15 Apr 2026 00:36:14 -0700 (PDT)
X-Received: by 2002:a17:903:4765:b0:2b2:6cab:313c with SMTP id d9443c01a7336-2b2d5a54f0emr213238545ad.20.1776238574354;
        Wed, 15 Apr 2026 00:36:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4782acaf0sm12863135ad.67.2026.04.15.00.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 00:36:13 -0700 (PDT)
Date: Wed, 15 Apr 2026 13:06:05 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 05/11] media: iris: Enable Secure PAS support with IOMMU
 managed by Linux
Message-ID: <20260415073605.qqvpf36uhqmghg5h@hu-mojha-hyd.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-5-7d3d1cf57b16@oss.qualcomm.com>
 <20260414063128.6ass64wfi7nmtzti@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414063128.6ass64wfi7nmtzti@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-GUID: WfHiyVdxAYLu0LAqK-N4uBn-TgceCG-H
X-Authority-Analysis: v=2.4 cv=eLMjSnp1 c=1 sm=1 tr=0 ts=69df3fef cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=NJZFz37QnK9jbI9AIaUA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA2OCBTYWx0ZWRfX/SmkCMG8ts4B
 DJHTFOogzGoq2/tnibzyKZ7NTOTupHPTV7+7MXMU2KFDeZRsqbyLvjfWvoKxAP7hmX7eQm32io/
 VX9gru03kEUt1NBzXk3xnP2LgYuZ9rcPuxh3qBQ1NRaAoczQHNlk3S9+CvPja47Eji5CCSewI5P
 yUtk40jaGikxOptYoy7D2xioB4qyM/d+cPz5PAEyOm5zwRzZgdR7K3iqYSqHbbe5rW3Aj4fdikt
 oq6VbCxa9JTKB4131IFqCPQsSRQEjRlYaJYwvrajEexPSDFxxKJVAtzUBYDkx/t5F2C+GLMdmX0
 EWhltbEveuEmyNo0JmLaof/x2gSuLzp8Ots+pCK4PQoMYCe2Pp7PqXQLSYQDbXn/ndg5xahu7vm
 bLk5uoxLAAaHs3Pa2O7FFcJNslo2byDx4nEFJrN0xAqBWez+0tMkeOvS5P62LRCq5dIgKH0+QWh
 w7FwS5pcECA93mHi4iw==
X-Proofpoint-ORIG-GUID: WfHiyVdxAYLu0LAqK-N4uBn-TgceCG-H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150068
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58784-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,hu-mojha-hyd.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0E7724016DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 12:01:28PM +0530, Mukesh Ojha wrote:
> On Tue, Apr 14, 2026 at 10:30:01AM +0530, Vishnu Reddy wrote:
> > From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > 
> > Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> > or QHEE), which typically handles IOMMU configuration. This includes
> > mapping memory regions and device memory resources for remote processors
> > by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
> > later removed during teardown. Additionally, SHM bridge setup is required
> > to enable memory protection for both remoteproc metadata and its memory
> > regions.
> > 
> > When the hypervisor is absent, the operating system must perform these
> > configurations instead.
> > 
> > Support for handling IOMMU and SHM setup in the absence of a hypervisor
> > is now in place. Extend the Iris driver to enable this functionality on
> > platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).
> > 
> > Additionally, the Iris driver must map the firmware and its required
> > resources to the firmware SID, which is now specified via iommu-map in
> > the device tree.
> > 
> > Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
> >  drivers/media/platform/qcom/iris/iris_firmware.c | 71 +++++++++++++++++++++---
> >  2 files changed, 66 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> > index fb194c967ad4..aa7abef6f0e0 100644
> > --- a/drivers/media/platform/qcom/iris/iris_core.h
> > +++ b/drivers/media/platform/qcom/iris/iris_core.h
> > @@ -34,6 +34,8 @@ enum domain_type {
> >   * struct iris_core - holds core parameters valid for all instances
> >   *
> >   * @dev: reference to device structure
> > + * @dev_fw: reference to the context bank device used for firmware load
> > + * @ctx_fw: SCM PAS context for authenticated firmware load and shutdown
> >   * @reg_base: IO memory base address
> >   * @irq: iris irq
> >   * @v4l2_dev: a holder for v4l2 device structure
> > @@ -77,6 +79,8 @@ enum domain_type {
> >  
> >  struct iris_core {
> >  	struct device				*dev;
> > +	struct device				*dev_fw;
> > +	struct qcom_scm_pas_context		*ctx_fw;
> 
> fw_dev suits better and ctx_fw is always for firmware, maybe pas_ctx is
> better.
> 
> >  	void __iomem				*reg_base;
> >  	int					irq;
> >  	struct v4l2_device			v4l2_dev;
> > diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> > index 5f408024e967..93d77996c83f 100644
> > --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> > +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include <linux/firmware.h>
> >  #include <linux/firmware/qcom/qcom_scm.h>
> > +#include <linux/iommu.h>
> >  #include <linux/of_address.h>
> >  #include <linux/of_reserved_mem.h>
> >  #include <linux/soc/qcom/mdt_loader.h>
> > @@ -13,12 +14,15 @@
> >  #include "iris_firmware.h"
> >  
> >  #define MAX_FIRMWARE_NAME_SIZE	128
> > +#define IRIS_FW_START_ADDR	0
> >  
> >  static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> >  {
> > +	struct device *dev = core->dev_fw ? core->dev_fw : core->dev;
> >  	u32 pas_id = core->iris_platform_data->pas_id;
> >  	const struct firmware *firmware = NULL;
> > -	struct device *dev = core->dev;
> > +	struct qcom_scm_pas_context *ctx_fw;
> > +	struct iommu_domain *domain;
> >  	struct resource res;
> >  	phys_addr_t mem_phys;
> >  	size_t res_size;
> > @@ -29,13 +33,17 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> >  	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
> >  		return -EINVAL;
> >  
> > -	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> > +	ret = of_reserved_mem_region_to_resource(core->dev->of_node, 0, &res);
> >  	if (ret)
> >  		return ret;
> >  
> >  	mem_phys = res.start;
> >  	res_size = resource_size(&res);
> >  
> > +	ctx_fw = devm_qcom_scm_pas_context_alloc(dev, pas_id, mem_phys, res_size);
> > +	if (IS_ERR(ctx_fw))
> > +		return PTR_ERR(ctx_fw);
> > +
> >  	ret = request_firmware(&firmware, fw_name, dev);
> >  	if (ret)
> >  		return ret;
> > @@ -52,9 +60,27 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> >  		goto err_release_fw;
> >  	}
> >  
> > -	ret = qcom_mdt_load(dev, firmware, fw_name,
> > -			    pas_id, mem_virt, mem_phys, res_size, NULL);
> > +	ctx_fw->use_tzmem = !!core->dev_fw;
> > +	ret = qcom_mdt_pas_load(ctx_fw, firmware, fw_name, mem_virt, NULL);

We need to release the metadata because this is the change compared to
the previous qcom_mdt_load() API, which silently released DMA memory for
metadata in the pas_init SCM call for clients that passed metadata ctx
as NULL. Since with this new API every new client must pass the new pas
ctx, it cannot be NULL anymore. I intended to document this clearly when
introducing qcom_mdt_pas_load() API, but I did not do so. but thinking
it over again, we should not be asking client to release the memory
which they not allocated, so let me write a patch for this where I
client like remoteproc explicitly ask or set it if they do not want to
release this memory as their XPU locked and can only released after auth
and reset successful.


> > +	if (ret)
> > +
> > +	if (ctx_fw->use_tzmem) {
> > +		domain = iommu_get_domain_for_dev(core->dev_fw);
> > +		if (!domain) {
> > +			ret = -ENODEV;
> > +			goto err_mem_unmap;
> > +		}
> > +
> > +		ret = iommu_map(domain, IRIS_FW_START_ADDR, mem_phys, res_size,
> > +				IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);
> > +		if (ret)
> > +			goto err_mem_unmap;
> > +	}
> >  
> > +	core->ctx_fw = ctx_fw;
> > +
> > +err_mem_unmap:
> >  	memunmap(mem_virt);
> >  err_release_fw:
> >  	release_firmware(firmware);
> > @@ -62,6 +88,19 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> >  	return ret;
> >  }
> >  
> > +static void iris_fw_iommu_unmap(struct iris_core *core)
> > +{
> > +	bool use_tzmem = core->ctx_fw->use_tzmem;
> > +	struct iommu_domain *domain;
> > +
> > +	if (!use_tzmem)
> > +		return;
> > +
> > +	domain = iommu_get_domain_for_dev(core->dev_fw);
> > +	if (domain)
> > +		iommu_unmap(domain, IRIS_FW_START_ADDR, core->ctx_fw->mem_size);
> > +}
> > +
> >  int iris_fw_load(struct iris_core *core)
> >  {
> >  	const struct tz_cp_config *cp_config;
> > @@ -79,10 +118,10 @@ int iris_fw_load(struct iris_core *core)
> >  		return -ENOMEM;
> >  	}
> >  
> > -	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
> > +	ret = qcom_scm_pas_prepare_and_auth_reset(core->ctx_fw);
> >  	if (ret)  {
> >  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
> > -		return ret;
> > +		goto err_unmap;
> >  	}
> >  
> >  	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
> > @@ -93,17 +132,31 @@ int iris_fw_load(struct iris_core *core)
> >  						     cp_config->cp_nonpixel_size);
> >  		if (ret) {
> >  			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
> > -			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> > -			return ret;
> > +			goto err_pas_shutdown;
> >  		}
> >  	}
> >  
> > +	return 0;
> > +
> > +err_pas_shutdown:
> > +	qcom_scm_pas_shutdown(core->ctx_fw->pas_id);
> > +err_unmap:
> > +	iris_fw_iommu_unmap(core);
> > +
> >  	return ret;
> >  }
> >  
> >  int iris_fw_unload(struct iris_core *core)
> >  {
> > -	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> > +	int ret;
> > +
> > +	ret = qcom_scm_pas_shutdown(core->ctx_fw->pas_id);
> > +	if (ret)
> > +		return ret;
> > +
> > +	iris_fw_iommu_unmap(core);
> > +
> > +	return ret;
> >  }
> >  
> >  int iris_set_hw_state(struct iris_core *core, bool resume)
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> -Mukesh Ojha

-- 
-Mukesh Ojha

