Return-Path: <linux-media+bounces-61052-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOROMt2QAWrTeQEAu9opvQ
	(envelope-from <linux-media+bounces-61052-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 10:18:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B07509F94
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 10:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0287930C72FF
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 08:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6FE3B8BBB;
	Mon, 11 May 2026 08:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PnB0Wwl+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GFs0Ax+M"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CE03BA225
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 08:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486806; cv=none; b=C3sB7nGTouaigfuA8Dr7/eRvGW3QIbuCo02T+ZlRDifDtQt4sxnNvzE+0pNL0QdhSemfYJnJXHMBaDV9LjYBCV/n8UtO6jVeAwI06FbQs/QLu0YWWlBDB6GivmiWIXnehgkZYx70jrngW8G5N7wyfZDR3oQTxsD5rYLi5tp+uRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486806; c=relaxed/simple;
	bh=3Tz2OjDF5lCkQ7m1u9fa1A8Pfz/yv22mmCYTrI0gwfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JkNYDKC8Pvn92vm5jO1swIl8x4HXMCjkMowffeWlMqS5SxaCnDEZ+Y1NxKrHfoC74PRN81mTo89f/a0l7lNjnEBV/JSOY6tZIw/oaLHY+wJY33lFI8ciqtO6CRCQ1T6bRjbVoIahz9u5nDVjyEfhqslEp9rLZDcw1JdKBk2NQ1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PnB0Wwl+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GFs0Ax+M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5NjCA2793068
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 08:06:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/6OY4QeYUbWXnau99ZtZcmYK
	nWqdx8LqgKBOO25F1fk=; b=PnB0Wwl+S8dEIo2K3MJIQLzRvgJEzIVOKb03bCU5
	4Xkkoa/rzeLu1KoO5+hCUeEtsgwglXUbRgQTG3MDQhMbKAMgdEjsnETaOy7Xl3Gs
	nCIa8WHRJ254UnzU8Dw1GVgdukuZg8kZ7KDt/74KXwXH7GoIVDCLScsMAwBTIyeJ
	tknK0JzBesKmT9dnw3oct21v9FoCURyydRx4VUQS+Gv2Zij737HBX54jaxAXc+uX
	PRiFVARo/c63CDp6dxLs21hfIgA4bMwCy8ShbO22cW/H0LBCqDztxjCqwUTyIfhO
	JNN+cKL7LZtrhKk16qNommZEJal0RAUA6OvmTfD5hn2MlA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e240h49cd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 08:06:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-366122e01fcso4526403a91.2
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 01:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778486787; x=1779091587; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/6OY4QeYUbWXnau99ZtZcmYKnWqdx8LqgKBOO25F1fk=;
        b=GFs0Ax+MKj4PnxmnOLYMAAS9y0ag8OObxQo+gA0upOz4GcUBMbiLCD65/yfO1GaxVV
         5wneooFnLZBJCeYCeLxJMcKeP5s8Oc2zfKX9sBdxFh9dxLjqi+l6JUKb+030cv3JVMkU
         Rp0UnfjUiLCLyaOtRQdAK0Z9ADuFs8p0WlYcvz+0fH/uJ1xtxIov0rjoqfsQstfA0UeU
         P19CSyLyglJGoz2pLxpOAcEJ9fxqyJoOGcdlMa4eftrR58+3Pd77LAJUuoRHP/UBjIgc
         Ed+mYdNBpZaol1V3iAtPBw5wJfZJBTEnECUg4Mmf4zBPuU8Eqja8n2VEKz6w6NaOyUcQ
         fDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778486787; x=1779091587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6OY4QeYUbWXnau99ZtZcmYKnWqdx8LqgKBOO25F1fk=;
        b=EHPOeE1iGrIaqyQB0p0RIHTC2e+qYd2pA7xDsm6OWNN8W9j8htPToxhJ1QbZHlTr6s
         g5RlsvKGvVa+0zbWgpYo6ANI04Sw/8XYeSCUUvwVoJYv0fSvut09lfYzRhEj39OAHfBp
         IeU8qGReia2K9PUBblGpQnLjqUQtawIqeZHsfSJtgektOqF4YWEi0tHl0m2etyUwFpMl
         a1yuF1Pfm00wlQPLyOa5MgMxKtnVAx1rBwKJrMvvfn0Rk6NgWzkWxlbdP/Fc/n68ZEHK
         f40GF+ouRjSd4YXIN/tXH0NXdBrjCBFswiJ/bBeasvxvTs8mEnzzD8Kxwc4035X0tPeQ
         6SVg==
X-Forwarded-Encrypted: i=1; AFNElJ8o3ebB7WmYwVe46wZ132AOZqvHv2i7Nz7/dkFmZP189InkD4Zmr0N2W32vun1m35hrdgI6zj6b+ehhHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfXVbgvGV6U1rYL1rnpH/JfolA+BEOJxMjESvqC1l9fTOXpjY/
	Kl/pFgLzI70m7E8mVXYyPLiH54q5IqzD9+Rr7OeGyfxRem4GfjnB4wmvY5VWXrVD7Dnmd8inO69
	Ryc6JBCj+jm1jkbmYB3p+muDjJg3r3S3O9VdTpaV65H4ORlsYL/tDR0ODlV7jz1KzXw==
X-Gm-Gg: Acq92OHZ0auJ82XXu8Pip4Sj9RxQgucLpECjbSK/NQ5eBOHrrE4X3dvmxnPV3MXGQG6
	7jKHGFOZEZ1MyXdIH1Sd0S1klOtFdEgpoRmrvHMw3fp7gII7V2xq52vQZQpMUNyySGnSFxMwTol
	W9WeoZkOkNvzzJZEDvZ/kdQT6CxVWRjuxaUsQjvgjZTV7D2BzsptZc1/PhTDMXdW4RJipZqdapT
	8SlfiivdsN4nNIN01oLhO2LDxVKFii0Xfh01BnjMDclA1jxfhWmjHRGbEcMPVvGPou/79XGWPiq
	4ocvCLJ1gfpJl8kTIRmqw6shvMdqvRVmctdzdTos8qx+PqbFeoBATHTJUl1sGbzdMHu5PfI4jBc
	AkkkNRG+1mEv3lJNylhKB/FtZO2Bb1lEWzTPmrme36D71FeIS
X-Received: by 2002:a17:90b:224f:b0:35f:b69d:7292 with SMTP id 98e67ed59e1d1-365ac080dc9mr23365396a91.15.1778486786634;
        Mon, 11 May 2026 01:06:26 -0700 (PDT)
X-Received: by 2002:a17:90b:224f:b0:35f:b69d:7292 with SMTP id 98e67ed59e1d1-365ac080dc9mr23365320a91.15.1778486786006;
        Mon, 11 May 2026 01:06:26 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d683fb92sm6583882a91.12.2026.05.11.01.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:06:25 -0700 (PDT)
Date: Mon, 11 May 2026 13:36:16 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
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
Message-ID: <20260511080616.6niytw6t5kitf7ug@hu-mojha-hyd.qualcomm.com>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-7-7fbb340c5dbd@oss.qualcomm.com>
 <4e132e7c-ffa0-4954-876b-67b53870e832@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e132e7c-ffa0-4954-876b-67b53870e832@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA4NyBTYWx0ZWRfX92h4NGVnMzgc
 AFvphdSuuXq78YWz/nEJ5oG1KyY08bRYFhDQqj1On2wt59fgvg1QZLfpHCyCvIz+jxi7dAt/gmt
 LTkMste7no1CTaj+3wHvkMB1dQ3dOtGGr7gWr1Fnneh3QIlUDMgIn8CXYeyb5kaaQBOPtsT4329
 3fJj4r2uZjwrKxdrkKg911nbFv9Ya/6M1CG1TCMcTQjGiKWYaNFfl8MXJ4nodco/3J3p3eufLTq
 8naWXn0dB9Y/lOkceNPRwxLrZOHBVp+fGLTxDPCmgCyyf2jo9zueM2kCHgU4ZYArGqE8STR/0c4
 C5Ym9yz1pSM00OMJUIc9NTiU82pYnipWOsknZMctp8XdajyCgkQy4/MzoqpJlM9pI08t2nyuUQk
 D+Ag2DtyEIvNIxPE+zz/I7F5qrH6uzWlLOcfJ+FOWNwIoCUvVCGeoqSySwydJ94kMACUxPtUTsb
 2LAH5x+709ubVNaaJ1w==
X-Proofpoint-GUID: cL5HTENeZwZDIGSdAEfr4guysVpiEleI
X-Authority-Analysis: v=2.4 cv=X5Bi7mTe c=1 sm=1 tr=0 ts=6a018e03 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=H2__nBlnFGDM6hqOEFYA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: cL5HTENeZwZDIGSdAEfr4guysVpiEleI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110087
X-Rspamd-Queue-Id: 43B07509F94
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
	TAGGED_FROM(0.00)[bounces-61052-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,hu-mojha-hyd.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
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

On Fri, May 08, 2026 at 12:05:15PM -0700, Trilok Soni wrote:
> On 5/8/2026 11:59 AM, Vishnu Reddy wrote:
> > From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > 
> > Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> > or QHEE),
> 
> Gunyah has open-source version as well. Can we make it little less ambiguous? 

I doubt, Gunyah open versions handles PIL bring up sequence which only
done by QHEE module., Yes, we can just mention QHEE here to be precise..

> 
> ---Trilok Soni

-- 
-Mukesh Ojha

