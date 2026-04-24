Return-Path: <linux-media+bounces-59538-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKc0JmmW62m7OgAAu9opvQ
	(envelope-from <linux-media+bounces-59538-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 18:12:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 346F746134B
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 18:12:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B580302DF4E
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 16:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D933E1228;
	Fri, 24 Apr 2026 16:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RgzAqBgs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bt0FV4y4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1AD3E0C76
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 16:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777047103; cv=none; b=auhpXSfIRsV2yjuLW2YA53iu/+6EUJ1UpKzH0eorLxhjqLvrwPefejEyaBdrvLly7ASGh6a94u2ENDfGuBeQmaMAWnWtPqKZQnSsjdZbkradXThDcybqPPuZIGi8oEoGpvLT52lkWxw1VBtt+ZepRmmxR2NA7Fia0kunRZxVZDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777047103; c=relaxed/simple;
	bh=cQxyjvvo6SHHGDnT8HL4AQEYPPr0G3qnZblljXvxfbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uBzaTLrs7d/0WSif9AQciLmMpdDOqwgoY5Y7THFJxoFnvYvJDP8FZ0wx+oFdED6W++AZFOnQR062fkncsAVRczlL96l/pAg32+prIg080HwRWNnFbz9+XJZAHf3GeCZKMi9bOluYts9iZE2t8/fFRLY8WFTsCaqZqd7aC8nNVQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RgzAqBgs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bt0FV4y4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OFY6qg518589
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 16:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QmsYx3pvgYXAO1jZPjQXfdfP
	yIwVCxRQ49qD+yx6sQU=; b=RgzAqBgst8mSwk93KlB/HsQ8M3+1B5WUWhboVVSt
	1VvJTYEzGzQ4lwATMwM1b3p7v0x+tk7eznRaMA/9gmgDGs2uVYDXr/6q/G+EWUaD
	cbLNKTNFgdVYztZzVXNeKPHYhjXLV3jS3vSCmLiMo+ch+8xf8mLNaHIt6ueeOIEv
	ts0KrQA0P+eJANsfTBFHAb6ZRMsLDAcBh3QSPJEYs3J3ygj5kqvqpIy3n2vBAq8B
	3bzXkmpEKifiISdgHA7/tmFrVvhsnNL448iH42cpBtC7dfCSUEPfK4AWXHYqmr6R
	+VgfAbQEJBEyV30IJQ+dMtoJf35AhLBEPA54bU7hU/uy0Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr0fnjy1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 16:11:39 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-610503b689eso9871059137.0
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 09:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777047099; x=1777651899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QmsYx3pvgYXAO1jZPjQXfdfPyIwVCxRQ49qD+yx6sQU=;
        b=bt0FV4y4OOu/UnArYfURKbpJ2/57qIDXIe+eqvm9PVhOlF3/JAOZezbmFZ57UVgXeL
         XbFus1ouHMbRvR/4bdv7hQ4IoOpxPejJO/PN19VvKPhDGVcirKewlR5uWRgTLlW5sobP
         4KFwkU5A2yBiaDNu6DcVukjQn+ZbVIQTB2IiMEoB0kNaLwr36bb5nhU/hXi1QBujJNT9
         B6CIb/k8qeA2abiuPJbRdIYO2IbellihpiQHDhegpAQ0CquovQgyLYZZJ9hgNaewU0Po
         sUBAsSjX+m8QwLdI5qTvVuAdpw3C3kd19sd9i7suK3h0vzLJgvI1TIaaQabXizJ7enLP
         jsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777047099; x=1777651899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QmsYx3pvgYXAO1jZPjQXfdfPyIwVCxRQ49qD+yx6sQU=;
        b=UhBdfpMAPhzMdt1Tg4A6fxOzyJS4rRo8LuKwXaH1nTiytls9F7Dr+DUw/I1iUc0Skn
         8wQ9F97M2EtgAqOjpOX590SonoofJnn3Wng5hGBN+PDvNuVzF0eUXHMd1yhyFGpZqmr2
         eby29Xg2z6KxNT0FDcRAgjGIPaAdkvHqKHb8VmS42Nwlzi7Xsj3Z6im7qkM4S8QiAcKR
         qbNMHOMKhKZLPmLniPX0ygqq7mo1twhsM7D2djuX6WmDY7uV6k6LVgU1Cc2HYDa5zXhC
         nV+ZeKlvo3srAzgSyZIWguAYQV8HxY7DY86Lk/ScDnDrJJ8plbJeD+p/xiSfgxfvXAWj
         2xEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/92WowwDsDi3nlVr5oDyxyii50KHmljhLSK1erIiMVP5tdqzP4Y5cckNah6GVJiJPHvuIx6atEioD7qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxS8ymUtv/L/Fa3xz3CYVNYn4M8QuzhjWTnYZf2QiIIVw1F3sC
	owIpEviqtQhpcwN/s5JUtcqLSOqdGPfOuScacHLkxqdwVW3pbh56e1XI7xKx0jG6eY2uudu+Pt2
	Ncv3uDdXHYaYeY1FiLy+Pwbs769VVAT5Y6MjIDGt9kRNxWo4zNhzwPGSNw49zPvIxYQ==
X-Gm-Gg: AeBDievdNkaKxHvpETsOAemH4ubxBw74P/fUhJCt6c8eabSpcvN3MwX30ZvZ8KiWKi7
	2X9sj3y8XhiAjzUPyq5qsz1TkLRM7bxDfAs2psK7b2kBfR2yPskp4+kadRpP/bM+XnnnI9SNplw
	OtoPhxXaGmNaZSXVx38+SWHJhxm8WRH/zQbUkyhNBbtR/JoQ5yN8FpEIIvxgDEqDF7nQgLIJugK
	EkVE5ChXQtdEneRuHnn3PjoQwT6r762Adxc5v8woU82XacSqKqGZMxR1jiiyFUd1Iqmre8Z4fIz
	8QTc/gJTGUvFG+G6Sdoo/k6NkVSrdEANX351bRTsMoA2EIBXSpV72Q33L3OPQvy3mVutxJHSTsh
	gDbyR+qeUQFCrmOrRLgl4XNRUYMc3vL8BCEVK9ztvPL1l4l+rBxPmYtoscjSR0EYJ7yqCLjnyBN
	ywoywNpOI5KxaEjgeptpHHsI+NT7zHiPc86qewkM+aEPJWJA==
X-Received: by 2002:a05:6102:41a6:b0:60f:c9ba:b992 with SMTP id ada2fe7eead31-616f68d760dmr17881101137.16.1777047098748;
        Fri, 24 Apr 2026 09:11:38 -0700 (PDT)
X-Received: by 2002:a05:6102:41a6:b0:60f:c9ba:b992 with SMTP id ada2fe7eead31-616f68d760dmr17881013137.16.1777047098170;
        Fri, 24 Apr 2026 09:11:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad0c5sm6134967e87.10.2026.04.24.09.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 09:11:36 -0700 (PDT)
Date: Fri, 24 Apr 2026 19:11:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
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
        Hans Verkuil <hverkuil@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v2 02/13] drivers: base: Add generic dma context bus
Message-ID: <xuitjl6tzfl6nl4ds4vdy3637i5cqtjuqntcpqt5fnkx2ogcws@iapcavrwhyzv>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
 <20260423-glymur-v2-2-0296bccb9f4e@oss.qualcomm.com>
 <2026042346-trustable-register-095a@gregkh>
 <06c04947-e72e-679b-493b-e112d693f391@oss.qualcomm.com>
 <2026042422-deem-chemist-8d0f@gregkh>
 <4c3fa710-f61a-4aad-622d-54909190cb9e@oss.qualcomm.com>
 <2026042428-blemish-helpline-7d8d@gregkh>
 <1e039dd5-da3f-19b2-ef98-29e64fdd925d@oss.qualcomm.com>
 <2026042442-luxurious-antonym-f20c@gregkh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026042442-luxurious-antonym-f20c@gregkh>
X-Authority-Analysis: v=2.4 cv=LfYMLDfi c=1 sm=1 tr=0 ts=69eb963b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=7jvbHUuHxlDJpGpAObkA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDE1NCBTYWx0ZWRfX0eK9Fb+G914G
 bsXkv4C5qzClIR7jZx1MxlpqFnAZS0/BdTg0QTTBQ4qJHusMRtU9JqtPBQT+MfbNht9WZUwtxZz
 KrQCdW2wwEATdfDwDqBKtLsyE9nD7n9gZ7zFq/f3PmDTza8vg/RcJJBE1tNL1+qgIOIBg6Url4b
 aD4clRg84vqAxg0N4EIHNIvVkg7vChJq83YZHuJae5ccH0OFhbqWKOt6ZLmQmt/Z3FmfAVr71aU
 ZvpiP32n+k6tkFeZcJ43tSfpEQntz4z3k3O2T9+SUy2KfaQipOx/aIjvzDR9tnGFRHOP5IolQ9h
 XdeBtdedAWD/c4FfcfMUNNpXSQQpnB4uGTW6nggHzclcR9bsrBXyvM5iSzK5FmYnShkMZZOgSR5
 zlL88GP0w3VSAr8XvzoXtJDfdUVBAo234YwkYuKDM7KUML6J+mGg7G9KNvWXeY0OH7WsxEUw8gh
 p/y1yNa8XbTLhGprPkA==
X-Proofpoint-ORIG-GUID: tNEjJ7PB4Y8gCNVH5ggZ7mVxWjzjVZVW
X-Proofpoint-GUID: tNEjJ7PB4Y8gCNVH5ggZ7mVxWjzjVZVW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240154
X-Rspamd-Queue-Id: 346F746134B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59538-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,8bytes.org,arm.com,linaro.org,nvidia.com,gmail.com,ffwll.ch,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Fri, Apr 24, 2026 at 03:34:38PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Apr 24, 2026 at 06:12:09PM +0530, Vishnu Reddy wrote:
> > 
> > On 4/24/2026 5:25 PM, Greg Kroah-Hartman wrote:
> > > On Fri, Apr 24, 2026 at 05:15:02PM +0530, Vishnu Reddy wrote:
> > >> On 4/24/2026 4:43 PM, Greg Kroah-Hartman wrote:
> > >>> On Fri, Apr 24, 2026 at 04:01:13PM +0530, Vishnu Reddy wrote:
> > >>>> On 4/23/2026 7:07 PM, Greg Kroah-Hartman wrote:
> > >>>>> On Thu, Apr 23, 2026 at 06:59:31PM +0530, Vishnu Reddy wrote:
> > >>>>>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > >>>>>>
> > >>>>>> When a driver needs to create virtual device at runtime and map it to
> > >>>>>> an IOMMU context for memory isolation, there is no common bus available
> > >>>>>> for this purpose. Each driver ends up implementing its own bus type,
> > >>>>>> leading to duplicated logic across multiple drivers.
> > >>>>>>
> > >>>>>> host1x driver implemented its own bus type to attach an IOMMU context to
> > >>>>>> a dynamically created device. The Iris VPU driver now has the same
> > >>>>>> requirement. Rather than duplicating the same bus logic again, a shared
> > >>>>>> bus type is introduced under drivers/base that multiple drivers can use
> > >>>>>> directly.
> > >>>>>>
> > >>>>>> The bus takes care of creating a device and attaching the IOMMU context
> > >>>>>> to it based on the client inputs.
> > >>>>>>
> > >>>>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > >>>>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > >>>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > >>>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > >>>>>> ---
> > >>>>>>  drivers/base/Kconfig            |  3 ++
> > >>>>>>  drivers/base/Makefile           |  1 +
> > >>>>>>  drivers/base/dma_context_bus.c  | 77 +++++++++++++++++++++++++++++++++++++++++
> > >>>>>>  include/linux/dma_context_bus.h | 26 ++++++++++++++
> > >>>>>>  4 files changed, 107 insertions(+)
> > >>>>> as you can not have a device on multiple busses at the same time, this
> > >>>>> makes no sense to me at all.  "dma context" is a bus-specific thing, so
> > >>>>> please add it to the bus that you are wanting it for.  It can't be a
> > >>>>> generic bus as that just doesn't work.
> > >>>>>
> > >>>>> Or what am I missing here?
> > >>>>>
> > >>>>> And why is DMA somehow "special" here from any other hardware attribute?
> > >>>> Let me give brief information which was discussed, in the initial series,
> > >>>> the iris VPU used platform bus for dynamically created devices and we got
> > >>>> the comment/suggestion from Robin to implement a proper bus_type with a
> > >>>> .dma_configure callback.
> > >>>>
> > >>>> https://lore.kernel.org/all/02b3d0f5-f94c-43cd-93af-97cfcf7751b1@arm.com/
> > >>>>
> > >>>> based on the discussion, implemented the dma_context_bus and used for iris
> > >>>> VPU devices instead of platform bus.
> > >>> Why not make a irus_vpu_bus where you can do what you want?
> > >> Initially iris_vpu_bus was introduced, and it was made generic based on the
> > >> discussion,
> > >>
> > >> https://lore.kernel.org/all/20260227-kaanapali-iris-v2-3-850043ac3933@oss.qualcomm.com/
> > > I don't really see that request here, I see a "make this better and more
> > > generic for other busses" but that does not mean "dump it into
> > > drivers/bus/ for someone else to maintain" :)
> > >
> > >>>> Here, the device have only one bus (dma_context_bus), not multiple buses.
> > >>>>
> > >>>> Regarding the "DMA" naming, the core operation of this bus is its
> > >>>> .dma_configure callback, which calls of_dma_configure_id() to map the device
> > >>>> to a corresponding IOMMU stream ID. The name "dma_context" reflects this
> > >>>> purpose.
> > >>>>
> > >>>> I am open to suggestions from you or Robin or anyone else, if there is a
> > >>>> better or preferred way to achieve this, I am happy to consider it and
> > >>>> rework the implementation accordingly.
> > >>> As there is only one user, just make this your own bus please and do all
> > >>> of the needed bus operations for your devices there (i.e. don't hang an
> > >>> "empty" device off of it.)
> > >> The reasoning behind to make it generic was to have more users - host1x,
> > >> Iris VPU, QDA on the generic context bus, instead of each of them having
> > >> their own. Let me know if you suggest to have the iris_vpu_bus.
> > > But you did not add such users here, so how would we know this?
> > >
> > > And still, I have no idea what this bus really is doing.  Is it dynamic?
> > > Is it self-describing?  Why not just use aux-bus?  What is it supposed
> > > to be doing and used for?
> > 
> > This bus will allow users to create a dynamic device and map to IOMMU stream
> > ID via .dma_configure callback which calls the of_dma_confgure_id() based on
> > the user inputs. This bus is under the iommu_buses list to register for bus
> > notifier callbacks for iommu_probe_device() and iommu_release_device() during
> > add and remove.
> 
> But a device is nothing on its own.  You can not just have a random
> 'struct device' hanging out there that does nothing but iommu, right?
> It should be doing something else that is very "bus" specific.

Unfortunately, it is a pattern of IOMMU-only devices. All the actual
programmig is done through IO region associated with the main device,
while subdevices are mostly used for DMA buffer allocation.

> 
> Again, why not create a bus for your hardware type and have that control
> the bindings of drivers to the devices, like it should be done.  You
> better not be creating platform devices for these things :)
> 
-- 
With best wishes
Dmitry

