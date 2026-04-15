Return-Path: <linux-media+bounces-58786-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFCbD9BB32kxRAAAu9opvQ
	(envelope-from <linux-media+bounces-58786-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 09:44:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8E5401844
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 09:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A23B308B26B
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 07:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA0A3AE706;
	Wed, 15 Apr 2026 07:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmv5bHmd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U2rB+mLJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A74E3A5435
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 07:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776238913; cv=none; b=eWV3f0eizCbhP6NUvPmyzrl8yIMSR1iPmxGE3XRen9frOhNJXa50WkDlVVvIOvmMRTulRRk6gq1kDmOqf9Vdjgtuhgxgzmx0gnDB+EFPOJn42NYwMChkNTa7m9xNRBhiXPrxOGTAn0CdbFr2/631bEyAOA1Doeo/eynZXMdMWBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776238913; c=relaxed/simple;
	bh=W62tWESM4gyLAD60Nr8FLrKgGfGIsNrx/lX0lAT80rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j28uH+GdwADGQiyn6ax/aMVF1zdVuzu1HYlg+p8WoC18Nzb93Fzq25WsV4LkgdcaoAsEsJdXgOFvnie2nZEGsDf75/tkRtEX/1mlRn87rH85fL8egth7n/5CHoMPUpAykq1gT3kbp3Ksml5CSXV+03AitH3JZSzJX2WUgv54kpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fmv5bHmd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U2rB+mLJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F4DYNY3101301
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 07:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fEE+gAEsFWtIb8J9lBZIYnIc
	JedOP7rud4t86JGVm1g=; b=fmv5bHmdyeeR0J5fV6LTm1j0KuQGJ82LUOLwOjAz
	vo4PmJagFxMmZ9AEE3iR5zYoXul7wvZf3Q5+GrLx3H3D4QpXCpcWhgk1L87G3rPK
	JPWULzEc2eL2oBpTh+ndk552gmtSdKBsynPemxzJ3N75mpHC7s8W2P4Bq/7AHfdZ
	4S2Ebb97lpbTqdxruC9969b+2EOGvE7dO7oWOo9ovmEO3h1A/tClDKqn96A1eWmM
	vNtReg1uUXxUAcBc3YZFXnLl2fnvaN6Khj5kqsXZuzwbITqbU5yRu4MF/oeQmgbA
	zC2CzHbjnPTeTpUuPDStzTHhFd99cAq94KU0FWQXR2RuKQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dht5h27x9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 07:41:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354490889b6so9392783a91.3
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 00:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776238910; x=1776843710; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fEE+gAEsFWtIb8J9lBZIYnIcJedOP7rud4t86JGVm1g=;
        b=U2rB+mLJ1myaRomB7PRriNhBBC276XOaW5mAt9pgQwA8hUQHSSSo1XiklspBllEPXk
         4XODwUI89BgJl7ac2VRaN55snzXSIuSmuQlnd6q9bNP4/3aFUue02gT7/bmslYNTijZS
         SySy5SyElQiiIP7D1xKPQ/j7YjL18FZZZzY8B5WvtMUPLXbh7xVuLWVrwAAXiWOzSrn1
         360aCj1mbuCZJ3dqLDqpHhS4LJwLqZ7UZOUgwA2X2MJQh7pnqsHIOTbZe6fR9cM8+5zc
         N0krLnYKeM9C+D8hXK5hxgJKifAQ84cwICLrJpPo9/VhA4MWVw34VBsbJXONp/PRnCMi
         qKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776238910; x=1776843710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEE+gAEsFWtIb8J9lBZIYnIcJedOP7rud4t86JGVm1g=;
        b=CB1q1w4HN8eh1AGxIC7+MEoMrZ+vlOO+bwPVrhMsn3czD8Tf+uGmi9jXUT6KSCS9ed
         VhGnQ7osHXw22VUkbqM/qwGmVrE7UklR9FxkFiKNcMUI1hxGFwQy3mhykW01fSW9jD6E
         gsEYDj+shp3p6RSrl2Y8/skWSmcx8O19q2E/VXGA6tZScfVvOg/tYEuIECvI8lLnmRQR
         3WeV4Jmb+yjV0gGAMiFv9yP5SN6bqhkKpsHab0VqZWIHQr3RNyBcBTeOqbvJCNVRZJhK
         b/KL0CND6D10+2R1o9hGZE06YfTWjrvFmEMQK1ngTFsZodtqrKBXdZQR+JnklZbtEiKA
         TU1g==
X-Forwarded-Encrypted: i=1; AFNElJ90XPjd18abZadYceTMQKBx7xoQAUX6gIpurKPLYHdQQSNl9m7GLhEuMmwfpXqVzKGouTi19pEzPfhHWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsl8sb/nfWtshME7ktPpn3KBkZQcyv4bauwaFSV2bkVDFE+lHy
	cPvXWF+kS0ljkAsOQ9Lu3/m6dCN816o3SoPsJJWzFdithVD9KedqZEM6zxe52A2aIah/Fkn6TpR
	ECz+n2V1B49V+UnBQj83Ny5yLlNENYzVpj1HTW2n55DtQTojakZH1aMduIsEzNpcuTQ==
X-Gm-Gg: AeBDiesAi0+En00hgD7CVsawNBUFz1ffoxbtBz3n2b/e5S180/QSATqgcZ+QxnNVfPY
	dOmsYkKqmjLueKUSrN9B9wQeh1tUq05Gcf0x3CdT3imlCKRMoHaopK6H+KyI0vwLXp8YioV+VaL
	98Bz/h5y7WK8BnCcbgIgXrCWsJos2xgDmerobRUt6kvfZyGrKRS0aNR7zwsSoPq9UhwbSQSMlPX
	0Xf/FKnD6OfpWb+NePbSpkTckQTqZVcdDIbl5Qh6EVg7IsJXbYWfBVBNTFyR42Mf9lQicqg9IlI
	7zCYxj4rBHioj9L7fgzT5SeBn/rLXYBYg8Otct5++XvoXQcqGkio1wfjQKP9bNuBtCnLH3xVgKm
	SGS8oZ3uFTDHY8WEvyCRnlTVlcFzh1tDt8gALkNzMS0MOKyIn
X-Received: by 2002:a17:90b:2890:b0:35f:bd29:75b9 with SMTP id 98e67ed59e1d1-35fbd2976d8mr9238427a91.22.1776238910418;
        Wed, 15 Apr 2026 00:41:50 -0700 (PDT)
X-Received: by 2002:a17:90b:2890:b0:35f:bd29:75b9 with SMTP id 98e67ed59e1d1-35fbd2976d8mr9238391a91.22.1776238909809;
        Wed, 15 Apr 2026 00:41:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fd2010246sm1863160a91.6.2026.04.15.00.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 00:41:49 -0700 (PDT)
Date: Wed, 15 Apr 2026 13:11:40 +0530
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
Message-ID: <20260415074140.46bg27tzbuyzjq3d@hu-mojha-hyd.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-5-7d3d1cf57b16@oss.qualcomm.com>
 <20260414063128.6ass64wfi7nmtzti@hu-mojha-hyd.qualcomm.com>
 <20260415073605.qqvpf36uhqmghg5h@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415073605.qqvpf36uhqmghg5h@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA2OSBTYWx0ZWRfX9qNjAiuiyiOl
 dChOnN8QFfVsRVGTzPJOXyLkzidLW6jyQVXp9fWa+X73PBqeOB7jKII83v6hZgcyTJ+7aTQkiiA
 CHvc4D5p3daF6upgYuoRfuRP+EXeDOp9WtopNZTr9BsAqFi2O4tQfbgtrAfPp4ieQwJFChjoBiS
 CFZNsDiPBRSSh7C6udGHYU/NZqh1reo7aC1PwZfhg5+8dGuGGEeh5XKpUR713d35c+YElob1ArU
 ghFVe3knjPtyb7BwA7p+8C1BslAMf436janQKUH1Oxs4G256Vc70QsV5EiaKTjlGbGujccdFxrN
 ck9Giq9DuN2WXkp7vmI8RpBRt/IbKH9TlUbMYQkYyyrvjUIaz+h2m+li/OyFfYakhN4hxScXilH
 ulbySEFw8mWnsQWSyl8lxa4A9++n+JBCWbS3ezvYyODmDUfuPOl9EDDX3s9bG8empV7I+d8P3MG
 7jimeVjrDSl8kwOxJIA==
X-Proofpoint-ORIG-GUID: MMWvoNEhB2l9Ts954ixJzxbjrjUFiH3f
X-Proofpoint-GUID: MMWvoNEhB2l9Ts954ixJzxbjrjUFiH3f
X-Authority-Analysis: v=2.4 cv=afFRWxot c=1 sm=1 tr=0 ts=69df413f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=No4tYzxTJ-fOGiIKadYA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150069
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58786-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hu-mojha-hyd.qualcomm.com:mid,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: AD8E5401844
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 01:06:05PM +0530, Mukesh Ojha wrote:
> On Tue, Apr 14, 2026 at 12:01:28PM +0530, Mukesh Ojha wrote:
> > On Tue, Apr 14, 2026 at 10:30:01AM +0530, Vishnu Reddy wrote:
> > > From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > 
> > > Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> > > or QHEE), which typically handles IOMMU configuration. This includes
> > > mapping memory regions and device memory resources for remote processors
> > > by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
> > > later removed during teardown. Additionally, SHM bridge setup is required
> > > to enable memory protection for both remoteproc metadata and its memory
> > > regions.
> > > 
> > > When the hypervisor is absent, the operating system must perform these
> > > configurations instead.
> > > 
> > > Support for handling IOMMU and SHM setup in the absence of a hypervisor
> > > is now in place. Extend the Iris driver to enable this functionality on
> > > platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).
> > > 
> > > Additionally, the Iris driver must map the firmware and its required
> > > resources to the firmware SID, which is now specified via iommu-map in
> > > the device tree.
> > > 
> > > Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > ---
> > >  drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
> > >  drivers/media/platform/qcom/iris/iris_firmware.c | 71 +++++++++++++++++++++---
> > >  2 files changed, 66 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> > > index fb194c967ad4..aa7abef6f0e0 100644
> > > --- a/drivers/media/platform/qcom/iris/iris_core.h
> > > +++ b/drivers/media/platform/qcom/iris/iris_core.h
> > > @@ -34,6 +34,8 @@ enum domain_type {
> > >   * struct iris_core - holds core parameters valid for all instances
> > >   *
> > >   * @dev: reference to device structure
> > > + * @dev_fw: reference to the context bank device used for firmware load
> > > + * @ctx_fw: SCM PAS context for authenticated firmware load and shutdown
> > >   * @reg_base: IO memory base address
> > >   * @irq: iris irq
> > >   * @v4l2_dev: a holder for v4l2 device structure
> > > @@ -77,6 +79,8 @@ enum domain_type {
> > >  
> > >  struct iris_core {
> > >  	struct device				*dev;
> > > +	struct device				*dev_fw;
> > > +	struct qcom_scm_pas_context		*ctx_fw;
> > 
> > fw_dev suits better and ctx_fw is always for firmware, maybe pas_ctx is
> > better.
> > 
> > >  	void __iomem				*reg_base;
> > >  	int					irq;
> > >  	struct v4l2_device			v4l2_dev;
> > > diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> > > index 5f408024e967..93d77996c83f 100644
> > > --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> > > +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> > > @@ -5,6 +5,7 @@
> > >  
> > >  #include <linux/firmware.h>
> > >  #include <linux/firmware/qcom/qcom_scm.h>
> > > +#include <linux/iommu.h>
> > >  #include <linux/of_address.h>
> > >  #include <linux/of_reserved_mem.h>
> > >  #include <linux/soc/qcom/mdt_loader.h>
> > > @@ -13,12 +14,15 @@
> > >  #include "iris_firmware.h"
> > >  
> > >  #define MAX_FIRMWARE_NAME_SIZE	128
> > > +#define IRIS_FW_START_ADDR	0
> > >  
> > >  static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> > >  {
> > > +	struct device *dev = core->dev_fw ? core->dev_fw : core->dev;
> > >  	u32 pas_id = core->iris_platform_data->pas_id;
> > >  	const struct firmware *firmware = NULL;
> > > -	struct device *dev = core->dev;
> > > +	struct qcom_scm_pas_context *ctx_fw;
> > > +	struct iommu_domain *domain;
> > >  	struct resource res;
> > >  	phys_addr_t mem_phys;
> > >  	size_t res_size;
> > > @@ -29,13 +33,17 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> > >  	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
> > >  		return -EINVAL;
> > >  
> > > -	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> > > +	ret = of_reserved_mem_region_to_resource(core->dev->of_node, 0, &res);
> > >  	if (ret)
> > >  		return ret;
> > >  
> > >  	mem_phys = res.start;
> > >  	res_size = resource_size(&res);
> > >  
> > > +	ctx_fw = devm_qcom_scm_pas_context_alloc(dev, pas_id, mem_phys, res_size);
> > > +	if (IS_ERR(ctx_fw))
> > > +		return PTR_ERR(ctx_fw);
> > > +
> > >  	ret = request_firmware(&firmware, fw_name, dev);
> > >  	if (ret)
> > >  		return ret;
> > > @@ -52,9 +60,27 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> > >  		goto err_release_fw;
> > >  	}
> > >  
> > > -	ret = qcom_mdt_load(dev, firmware, fw_name,
> > > -			    pas_id, mem_virt, mem_phys, res_size, NULL);
> > > +	ctx_fw->use_tzmem = !!core->dev_fw;
> > > +	ret = qcom_mdt_pas_load(ctx_fw, firmware, fw_name, mem_virt, NULL);
> 
> We need to release the metadata because this is the change compared to
> the previous qcom_mdt_load() API, which silently released DMA memory for
> metadata in the pas_init SCM call for clients that passed metadata ctx
> as NULL. Since with this new API every new client must pass the new pas
> ctx, it cannot be NULL anymore. I intended to document this clearly when
> introducing qcom_mdt_pas_load() API, but I did not do so. but thinking
> it over again, we should not be asking client to release the memory
> which they not allocated, so let me write a patch for this where I
> client like remoteproc explicitly ask or set it if they do not want to
> release this memory as their XPU locked and can only released after auth
> and reset successful.

Just to further clarify, nothing extra related to metadata release need
to done for unaffected client like video who were passing NULL as part
of qcom_mdt_load() earlier., so no changes needed in this patch., I will
basically introduce boolean and set this only for remoteproc clients.


> 
> 
> > > +	if (ret)
> > > +
> > > +	if (ctx_fw->use_tzmem) {
> > > +		domain = iommu_get_domain_for_dev(core->dev_fw);
> > > +		if (!domain) {
> > > +			ret = -ENODEV;
> > > +			goto err_mem_unmap;
> > > +		}
> > > +
> > > +		ret = iommu_map(domain, IRIS_FW_START_ADDR, mem_phys, res_size,
> > > +				IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);
> > > +		if (ret)
> > > +			goto err_mem_unmap;
> > > +	}
> > >  
> > > +	core->ctx_fw = ctx_fw;
> > > +
> > > +err_mem_unmap:
> > >  	memunmap(mem_virt);
> > >  err_release_fw:
> > >  	release_firmware(firmware);
> > > @@ -62,6 +88,19 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> > >  	return ret;
> > >  }
> > >  
> > > +static void iris_fw_iommu_unmap(struct iris_core *core)
> > > +{
> > > +	bool use_tzmem = core->ctx_fw->use_tzmem;
> > > +	struct iommu_domain *domain;
> > > +
> > > +	if (!use_tzmem)
> > > +		return;
> > > +
> > > +	domain = iommu_get_domain_for_dev(core->dev_fw);
> > > +	if (domain)
> > > +		iommu_unmap(domain, IRIS_FW_START_ADDR, core->ctx_fw->mem_size);
> > > +}
> > > +
> > >  int iris_fw_load(struct iris_core *core)
> > >  {
> > >  	const struct tz_cp_config *cp_config;
> > > @@ -79,10 +118,10 @@ int iris_fw_load(struct iris_core *core)
> > >  		return -ENOMEM;
> > >  	}
> > >  
> > > -	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
> > > +	ret = qcom_scm_pas_prepare_and_auth_reset(core->ctx_fw);
> > >  	if (ret)  {
> > >  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
> > > -		return ret;
> > > +		goto err_unmap;
> > >  	}
> > >  
> > >  	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
> > > @@ -93,17 +132,31 @@ int iris_fw_load(struct iris_core *core)
> > >  						     cp_config->cp_nonpixel_size);
> > >  		if (ret) {
> > >  			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
> > > -			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> > > -			return ret;
> > > +			goto err_pas_shutdown;
> > >  		}
> > >  	}
> > >  
> > > +	return 0;
> > > +
> > > +err_pas_shutdown:
> > > +	qcom_scm_pas_shutdown(core->ctx_fw->pas_id);
> > > +err_unmap:
> > > +	iris_fw_iommu_unmap(core);
> > > +
> > >  	return ret;
> > >  }
> > >  
> > >  int iris_fw_unload(struct iris_core *core)
> > >  {
> > > -	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> > > +	int ret;
> > > +
> > > +	ret = qcom_scm_pas_shutdown(core->ctx_fw->pas_id);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	iris_fw_iommu_unmap(core);
> > > +
> > > +	return ret;
> > >  }
> > >  
> > >  int iris_set_hw_state(struct iris_core *core, bool resume)
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > -Mukesh Ojha
> 
> -- 
> -Mukesh Ojha

-- 
-Mukesh Ojha

