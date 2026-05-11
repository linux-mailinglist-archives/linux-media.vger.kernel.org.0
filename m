Return-Path: <linux-media+bounces-61051-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOqWKLmSAWrsegEAu9opvQ
	(envelope-from <linux-media+bounces-61051-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 10:26:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B91750A118
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 10:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08840314F8C3
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 08:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585AE3B6C0B;
	Mon, 11 May 2026 08:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NHGqlV7b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XAt6uQFP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAA53AD51A
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 08:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486491; cv=none; b=G3TRwQ5zSyiJBve7yvzC7pvsmTyMtphAurT+G2+f7Jnr1JixXTl5YoQpWEBv/m9vrvHDqr6NA+PE8WlL4IENYg2LZDhcgu5gbM/oSS/5HKtmgawm91fQt0AHLcixfTH+WpRzui7pN4A9FoN4mgPsD0Lc4hexFCx/ok09uh2FKHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486491; c=relaxed/simple;
	bh=9At6bN/HQOqxg3TZidbgne5rrgZKG4x7j0HUT9ppzqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0krgoTbXjnfU5uUB0xUWEWKyFYHFSETvl8spUxzfHqaYKdbkDHVxoLaNUtK539uXmfasboNOuoTqFDyd+pCDLPpB9RwZtLJjX6cnkjqG2nguFzdVdqpAHHSiIS3SvacSZBi9ejtupTJkwjOlR7uhdGzyM579sUOuyJbCSGXFcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NHGqlV7b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XAt6uQFP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B4GXEw017877
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 08:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wTnLLM3bNR0ig+1jIwsqUgQH
	Tql4t8I0K2Rs/RNYSTs=; b=NHGqlV7bdneSmgiHoUkYtNdrrfJhGYPO8Kc7tJyE
	t60BBdC1OACJgYvTOx5bMS+2QeQeKOYU0uiFq8Mt5gQrYVM89GJEfsREC/yrvanT
	kwomtX4dDcMzwFIqjP6hevdd2PW6DsA4L45bporqi9lo6kj5GuRz/b4n4G7kDYkB
	s3mEFUpz+jRl+nhIJmGwp1Zkt5nbTYsaa9Wtp3dnT9/qsRQAvpGArbWwB89y3t72
	1C8kB6IccymXwRFrAKaUprYHtd4fHbhHarrvoOvdJJPFEhcLRvyOeYzpH/Ss0zZx
	JCGRJiLjskLNChBK87AL5TEgiyMox+wLaC3i+IlK7lZYIg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xfrq7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 08:01:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba86e35aa1so60972015ad.1
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 01:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778486475; x=1779091275; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wTnLLM3bNR0ig+1jIwsqUgQHTql4t8I0K2Rs/RNYSTs=;
        b=XAt6uQFPY53qOGf7nhm2Lze8weSlh/FgPWdYhEK8628jrMl1LcCKT1mnN4O33ouSXj
         Hn4YKPiYxo0pn2ejX6xmTFhgSTzcUYNC39kqvY+kOaqqU2tYI2/CjAOxwHpm8K7CYHMg
         QFjcUcB/jZZv5bBhKsYM08EFirS4aBxFppFlQqn9d1XSqLI7Diy3NFqTLN870qv7H2fV
         gjL6B9Vy0iQu9bnHGyuU5+zQjKormRvyzw5pLm5on1v9/HtNT3pcvvrx9d0fSzIrXGUE
         isIr6AEFnSoBJPLbVh+vqonnqjOOvZYBgqXXaUfBM6wmh38QIX+JVy6k9JbiIawRbviJ
         O6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778486475; x=1779091275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTnLLM3bNR0ig+1jIwsqUgQHTql4t8I0K2Rs/RNYSTs=;
        b=JjIjOiO9jnPo2cPPSUcfqQ9uZ3tzdhmQmZC6b2aMbMDdeh75NxESchbzORefABcZOp
         uxwvxAwBY0vyjYg8SQv4drk/hPcEjawDnqDeU/sNXQEoCtIKCAW49KREFR8YsHuoKZ66
         snpV9qLaBMOPnMZiQPGecdx+7acxOzzJ0jLaqbp7er87Y/qnmFElx9YRAFw4//pPoWnF
         8CeXQhbNf+eii7eHvyaxeZ09LWSqPNSrgyicgqFtyKdCk0k8ac8ub0oVOHOCfHYBu6Jo
         zHkUiB4OKNaAVzcNptFPhkFPjKs+3mJ26VfE+baGYh/O55db9De0FnpA1LscjcHGlArN
         +blg==
X-Forwarded-Encrypted: i=1; AFNElJ/NmScNxkVZ8sIhaekSmAIeb+g6vyRI8DxzCje2V6NYitOJoPV7m7ReNGFq1txV0l+vtQaGqQh2J69CBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcD9WtjtdDpAUQJL5AS24XLRZ9JrejIpYtw5B2SO3Ib85dJ7Du
	oTbAyIKQUJh+37rfo5YgdCyRcaT56sa2AZ/hM9KlIQHTTHunpXsP6qQ6uTpPGA06TPhZdo7ORvL
	cBa71ABnmHF11rkxqSGh7njMCzpi/oJeQS6eUYVpVoK0eFu88J4EisNTKY8aKdhN0MA==
X-Gm-Gg: Acq92OHyOf1pyKcO5xXfH2vXX/VjMkJ86ZHVm7heMz5/mI8qMRFhbdMtSetOGY85VOV
	kqQBl8pv5lQjcqaAp+PucOTHTEUHXZt0Pd+UUID6EgzSu69kDuOG6DUAxGFnto9a6b1P3YeaInC
	xfNaJoB13zwAPK7/qT8VnvKmy+CtVfDzkx5sDtJvxBlEYA9n02MdxabRqvwo+OV2qvecA/IQ4DH
	lDp3NasulU1i/KmrE4waX7IoNks9wHFxiwmrvr0C3rocosVFkX0uxId46h54oSTw3ghzEXq0q4y
	MIAZEaKDxSgVclZa8v4j7TUQUdw4JWGNqTdJ1tcjW8Lqbq0dsU47QMSnWVyJO8VIHKkjmHUfPMM
	X063z8a9EeQPVE26nkgVD6PzNfxm6XD+yHG4kYZAhUbsQ34Bz
X-Received: by 2002:a17:903:1ad0:b0:2b0:6e60:9586 with SMTP id d9443c01a7336-2ba792a0c08mr261081765ad.17.1778486474724;
        Mon, 11 May 2026 01:01:14 -0700 (PDT)
X-Received: by 2002:a17:903:1ad0:b0:2b0:6e60:9586 with SMTP id d9443c01a7336-2ba792a0c08mr261081065ad.17.1778486473994;
        Mon, 11 May 2026 01:01:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e374besm98532815ad.47.2026.05.11.01.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:01:13 -0700 (PDT)
Date: Mon, 11 May 2026 13:31:04 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 07/14] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <20260511080104.c4nhhmm2xgzm67fi@hu-mojha-hyd.qualcomm.com>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-7-7fbb340c5dbd@oss.qualcomm.com>
 <elhlmmmisecn7vylpsboiicn7dn4umrggktabyixthmevdv7eo@a4keayee2um7>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <elhlmmmisecn7vylpsboiicn7dn4umrggktabyixthmevdv7eo@a4keayee2um7>
X-Authority-Analysis: v=2.4 cv=TqXWQjXh c=1 sm=1 tr=0 ts=6a018ccc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DTHjRCbF17pgsZGT9MoA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 1MfISZJzIYGBTlqem8iKyx714I6znK7g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA4NyBTYWx0ZWRfX9Kfw2VL1f8v7
 bjxcQ/8IYmDuXxYgVCc0GHhS7Lcd9asrgH+aHrtXQS+XJ4ogyiiWBdXowtVSkGwwSrqbH7snxs9
 QHZA6vsOiy9I11ROedvwYPUaT5Spl4TXsptQwzM4nTulXYdPRZGm9bpYR24S7QR7c2xGcfoKRKp
 yI7i9Cf/1mYvtMBZzGktrePb4gCH4UVyZ9evsEHYVVb1y6VKpPYhnIFyivJJjGsxfPxMrHXP3rg
 7YQKNYd8aZRyjUHsjjmJD1Wm2++Av6LqFgIORvIkKWALWdKadxYlj9KpVEm0zCuBY195Zcmso0D
 CApBCBvroMmdR96D+kRxfwkREHDW2lOd3RQdbHv/7OByj+5bzgKUDbkLKkIk1V0QFRqtkOJq/Rm
 2ZHnaNaMKPB1rGfx52ZRo4WfKBwgw1F3LO8yYqBSOHQTbKHj5ios/tM0Upp9y43JwIjzamHnj1e
 wHZx/7dWPRpC4JWt8Jw==
X-Proofpoint-ORIG-GUID: 1MfISZJzIYGBTlqem8iKyx714I6znK7g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110087
X-Rspamd-Queue-Id: 3B91750A118
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61051-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,hu-mojha-hyd.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[26];
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
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 11:20:06PM +0300, Dmitry Baryshkov wrote:
> On Sat, May 09, 2026 at 12:29:56AM +0530, Vishnu Reddy wrote:
> > From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > 
> > Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> > or QHEE), which typically handles IOMMU configuration. This includes
> > mapping memory regions and device memory resources for remote processors
> > by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
> 
> No the calls to those functions are not intercepted. Doesn't hypervisor
> simply implement the SCM calls?

All the SMC calls are intercepted whenever Gunyah or QHEE hypervisor is present
and in most of the case the preparational work for the TZ like in case of
qcom_scm_pas_auth_and_reset() it does create/register SHMbridge over PIL memory
so that the TZ can access the memory and then calls same SMC call to TZ for
authentication and once done it comes back does mapping the PIL region
and call bring up sequence of the co-processor.

    SMC  SHM setup    SMC (auth)        map memory/resource and trigger reset sequence
HLOS ==> Gunyah(QHEE)   ==> TZ    ==>    Gunyah(QHEE)        === ==>      IRIS 


> 
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
> 
> I fail to identify, which changes correspond to this description. If
> it's about the PAS context creation, could you please be more specific?

I think, commit text is trying to tell the Infra to support any Secure PIL when IOMMU is
managed by Linux at EL2 and the dependency related to SHM set up in Linux are done as
part of [1] are in upstream.

[1]
https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/

> 
> > 
> > Additionally, the Iris driver must map the firmware and its required
> > resources to the firmware SID, which is now specified via iommu-map in
> > the device tree.
> 
> Why? You miss the most important part here.

Sorry, I did not get.. are you looking for explaination here, why via iommu-map in
commit text ?

> 
> > 
> > Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
> >  drivers/media/platform/qcom/iris/iris_firmware.c | 72 ++++++++++++++++++++----
> >  2 files changed, 66 insertions(+), 10 deletions(-)
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
-Mukesh Ojha

