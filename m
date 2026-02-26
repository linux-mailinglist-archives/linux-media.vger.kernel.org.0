Return-Path: <linux-media+bounces-53480-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4J3GEMQkoGkDfwQAu9opvQ
	(envelope-from <linux-media+bounces-53480-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 11:47:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FC61A4825
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 11:47:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1589C3062FAA
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B0D30EF63;
	Thu, 26 Feb 2026 10:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C1liJdau";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YvNoeSBR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445782EB87B
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 10:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772102789; cv=none; b=WHvxnRMeJ9+phIC9QIzGJE4T6WrOHAyvgPaj5sHm9iCHXJZPyyi7KxxiZb+m/wsJ3cYuIa4Ojw7oin7kS+oxXk/qmJheJmtGxydp+cr8ky+cYPTXnduywuoGQYYO+wRLjwGHuFGBmSarEsl/3c7+TSDN5MiLRaGTYn25SgL+zeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772102789; c=relaxed/simple;
	bh=x5QsUgHTLILuKL85clF/hSpHD9ULs8iSoklDCm1XTEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdBQoznvvz9PeVzmDpiDbZh3IpJQAJN2m+w2oAhV98jWPoosW26afCOm3qwO0gpsloDnW9D+kyqD6R4gQtEWcaI3wusc0PHoj8/PYhwmJZs8u4j1BiQzYKpXeNNO4T3ggoRjqlNYR+erkmcVTNwRLHcD6DT5f+T7KNAP1ZZPgUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C1liJdau; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YvNoeSBR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QAKipf287800
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 10:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zwCZAKTqPxoAPp//XCVoK8Lk
	kN9XjJo3gF5cOknkSTU=; b=C1liJdauVkvXUPdz9x3HsYm8gc/a5RB/NKVhsVYK
	SykF8PnuqWMn/B6ChdB94munsY3p5MRzDGHWRf1gr/FtBV+TCNu1GRMZaIkWu1SR
	aWlke4e7iWwkqQ+Tb2dI89FBFpR9bGHyr6PKk+t73OIh9DATfiKmi0gd5eCUvrJ5
	05ZLuogLemIBdseCQdKoOfZF/NYjBpcNC/t3HunV03G7Z8jITBNYt/afGHdcrowM
	K1YB5UbJTdwwW6fRI6kLaylwsB1pFToENxXJy0/XnOcOedpUioyM5anP9CQEvPxW
	WsVmxUvoKrTeZssoLuYaJQq4PMdgbfprUmepih4wFY9gVg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjm8u02p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 10:46:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4a241582so412653485a.0
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 02:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772102786; x=1772707586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zwCZAKTqPxoAPp//XCVoK8LkkN9XjJo3gF5cOknkSTU=;
        b=YvNoeSBRJ6ZFsveOOquMoi9rkTHXEfVfWC1JwMMoCSfeEi9u5CIjGxUKprkB3JyC5t
         5j3j2J3Q/HTL12vXOMtzL/VhDTBoZKJrDW74wGx92/x2RmeYKBrVRUwNZMbQifGrTl2F
         PdJnrndA8Q01ZJaHQBwEj7j9c51LnTf/SJpnJVXpFQ/DaH30arhqPYetYYiOVsfOquga
         Cn+ODDcI/xT2wNc1stb/iqZ+Ls3WrcaYjLF5d8kzRt0nGqPKhliEBk6lpcFZBUyXEVcF
         dByaOMb1ZE4wpSmZmMNnrv1TqqRf9hqMF976RsJ2ch2oDXSthKH5UmlznBfZGPfPErFN
         c2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772102786; x=1772707586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zwCZAKTqPxoAPp//XCVoK8LkkN9XjJo3gF5cOknkSTU=;
        b=ppGi/HcGkqpzZaspaWo6w2FNY4SPVDjUU49pqi3YdxqZ5ruVZMKMyeCpukVZS36UdV
         /p9XDI3PLoeoE8eFT6vkyOdGxO0vfrPj4aaOyjftBX8XKoUtoDTOIgVdpToJoWlm/hvI
         m7M2XWYHFjorM6/TvYjMwt8nr53oNKhKWT38lhpmALJgSN0Ri2ofJItZpcF6w9hfuTHH
         meJJWVAaYkaDDosUIDoimhKz2Ye8PK1qVJp53Wajz5Egyfpe/zKbKUdWQoYuEGaN/P1D
         RI4+0Rp/0p/4uGo3iaH5LGcOBPvdjOgrGSfes0oqcx5HF3D6eM5ZdF2N197Hx1UWs0ei
         mD9w==
X-Forwarded-Encrypted: i=1; AJvYcCXQF6wF2pDxzI4n8oJsQitni9h52+rkgOeAPORrcRkhDrKPVrjJytHnUnJQmKCO7C2SxRUDTrRhU4FQXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfdMYaANjQ94Rgh77fF63jgx9t8TrdsnB6geoTjktnkSCney8T
	nn0pQ8rDtBuP1e4QmQsPuSsXhoG/AqjcYrfVkP410sH9dNvyFzxrkqobwjZFm2xic+1jzCykcib
	FwFb76K/AAoWRPpUFImV4fDekiI6vW08ZoP2nTjqUMZcPo8Vw1nYv0tN0Sjph5dEZlQ==
X-Gm-Gg: ATEYQzzg87BFHA+WR/ls6Cs4WEq0kmkTO8+ypmF/qXz6fCJGy99E3KfoKMe7WOyX7kM
	0+IdXi6GZVBuWjUpwvQcGS4Tycb3GlmleWKvA2qMelBMTZVVc61N6N1qBQwxAJ8cvivz+JJQYkz
	/UktEQwwkKLZ0hLNwPOWVVcmnyK7Rgp5L5N20emx3qZKCfw/zzvz62vmP3iQGFDPkExW1xsBH+y
	smiG8M7q5IDg24nmnBZckgjIuwRc0avs9/dck4ZUPtK7LmTglpTN8KgNufhwXgaXiwKnFYREUh4
	oupI+K2dZAIgAzgkGBRjL1DgBytY5lBtO1OA/7zWooz1wwL27SctmC/2nNekyLBelkmzqu9BPCg
	J4iLmvzTFHedQSgxVFUwppT8LHWmEKT3HB4w49WxhFBcEYWMdvWF6SbTah5MokH7HpiYa9KATbR
	ldjkIMs3hR3BcRwIXwPrle3sj/O2Tyxlszh94=
X-Received: by 2002:a05:620a:4587:b0:8c7:106c:cbd4 with SMTP id af79cd13be357-8cb8c9cdef9mr2566359685a.12.1772102786444;
        Thu, 26 Feb 2026 02:46:26 -0800 (PST)
X-Received: by 2002:a05:620a:4587:b0:8c7:106c:cbd4 with SMTP id af79cd13be357-8cb8c9cdef9mr2566355985a.12.1772102785838;
        Thu, 26 Feb 2026 02:46:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a109df8dc4sm685189e87.59.2026.02.26.02.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 02:46:25 -0800 (PST)
Date: Thu, 26 Feb 2026 12:46:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 05/18] accel/qda: Create compute CB devices on QDA
 compute bus
Message-ID: <3y6rn5ujkdbc6cd2ooq7gobjvokwwrey2xoj4d3h2pavi7r5k6@rrc6bbmutz73>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-5-fe46a9c1a046@oss.qualcomm.com>
 <x3s26yr7oy2dokp4plsp67yndr7o4ps6nuj7i4zjze77ifljux@ap537se6npfg>
 <57937a68-7f22-4ca1-8980-0be12cf06c66@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57937a68-7f22-4ca1-8980-0be12cf06c66@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA5NyBTYWx0ZWRfX7TWoM2JPdNX1
 07eOQVMjm7GKA9nx9pkW4PeRMVMzd19jMbeVMUVycs9xzdV52+gYtYIzgJyKTESD8fsDeusY5DR
 6puJVt55r760ITIMHP/voM2JScaGpBNSlTzFBOpxFhRwbaQ0owp4aDR6Sqyw64jDfivwWvSyUqe
 3iQ+gN0Abfw34I/kLfapZQ9gRxnAJociRCfntOKRUvHJ0z/KDtgcl3mKFWvI9R+msfWec02vabn
 rruWQieaaR7LFtMDAR3yzu/n7EXq3NN+DwIvC9XZrxtUSi/4C03F+9moAf3ftffaMHqk2rrzuMd
 I232oimi85jvOJGncBWw6kA/IfdeptohT+/A3Ka+/Xrse8T58HiQ8FyWMwolkJ7CMghfUCQj729
 INGuZMTneXREr11HJA5cGFzK6zOlmdCdNBImK+x3xloApjku1oxbrmn6ix/S/ZK5b0Wpe6iJnJy
 aO2G/2EJaOgj+2UlpvA==
X-Authority-Analysis: v=2.4 cv=O780fR9W c=1 sm=1 tr=0 ts=69a02483 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=kIP-TH2kwnt34PtL7doA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: mdkkDdrexA5ozC97XyYMkxeIUBRbOuaZ
X-Proofpoint-GUID: mdkkDdrexA5ozC97XyYMkxeIUBRbOuaZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53480-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A0FC61A4825
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 02:08:57PM +0530, Ekansh Gupta wrote:
> 
> 
> On 2/24/2026 4:19 AM, Dmitry Baryshkov wrote:
> > On Tue, Feb 24, 2026 at 12:38:59AM +0530, Ekansh Gupta wrote:
> >> Add support for creating compute context-bank (CB) devices under
> >> the QDA compute bus based on child nodes of the FastRPC RPMsg
> >> device tree node. Each DT child with compatible
> >> "qcom,fastrpc-compute-cb" is turned into a QDA-owned struct
> >> device on qda_cb_bus_type.
> >>
> >> A new qda_cb_dev structure and cb_devs list in qda_dev track these
> >> CB devices. qda_populate_child_devices() walks the DT children
> >> during QDA RPMsg probe, creates CB devices, configures their DMA
> >> and IOMMU settings using of_dma_configure(), and associates a SID
> >> from the "reg" property when present.
> >>
> >> On RPMsg remove, qda_unpopulate_child_devices() tears down all CB
> >> devices, removing them from their IOMMU groups if present and
> >> unregistering the devices. This prepares the ground for using CB
> >> devices as IOMMU endpoints for DSP compute workloads in later
> >> patches.
> > Are we loosing the nsessions support?
> Yes, it's not part of this series. I'll try bringing that as well.
> >
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/accel/qda/Makefile    |   1 +
> >>  drivers/accel/qda/qda_cb.c    | 150 ++++++++++++++++++++++++++++++++++++++++++
> >>  drivers/accel/qda/qda_cb.h    |  26 ++++++++
> >>  drivers/accel/qda/qda_drv.h   |   3 +
> >>  drivers/accel/qda/qda_rpmsg.c |  40 +++++++++++
> >>  5 files changed, 220 insertions(+)
> >>
> >> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
> >> index 242684ef1af7..4aded20b6bc2 100644
> >> --- a/drivers/accel/qda/Makefile
> >> +++ b/drivers/accel/qda/Makefile
> >> @@ -8,5 +8,6 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
> >>  qda-y := \
> >>  	qda_drv.o \
> >>  	qda_rpmsg.o \
> >> +	qda_cb.o \
> >>  
> >>  obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
> >> diff --git a/drivers/accel/qda/qda_cb.c b/drivers/accel/qda/qda_cb.c
> >> new file mode 100644
> >> index 000000000000..77a2d8cae076
> >> --- /dev/null
> >> +++ b/drivers/accel/qda/qda_cb.c
> >> @@ -0,0 +1,150 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >> +#include <linux/dma-mapping.h>
> >> +#include <linux/device.h>
> >> +#include <linux/of.h>
> >> +#include <linux/of_device.h>
> >> +#include <linux/iommu.h>
> >> +#include <linux/slab.h>
> >> +#include "qda_drv.h"
> >> +#include "qda_cb.h"
> >> +
> >> +static void qda_cb_dev_release(struct device *dev)
> >> +{
> >> +	kfree(dev);
> > Do you need to put the reference on the OF node?
> Reference put is happening as part of qda_destroy_cb_device.

This way: you have a (small) window where of_node is already put (and
might be gone), but the pointer is not NULL. The of_node should be put
only when device is no longer accessible from the rest of the system, in
release function.


-- 
With best wishes
Dmitry

