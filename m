Return-Path: <linux-media+bounces-53228-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAxkIVPFnGnJKAQAu9opvQ
	(envelope-from <linux-media+bounces-53228-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 22:23:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC5017D8BE
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 22:23:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B21BA3053CD4
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 21:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E02E378D73;
	Mon, 23 Feb 2026 21:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IqNI42IP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gtokaO4o"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66954378D61
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 21:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771881802; cv=none; b=UzwiTP3I/SmkAGEW75+D8K8cbRWZhYPEPzkaOV4eYgyPvlUg/Nb8ZGQ5uLsCBa3NiR7FCWT/9bMH2b3/VzUJP0AFC+DZXdsmgl0+ez62m4JQVA5iT6kaujVVyibEdaNd3LQlFJxKIfInQd+arQaMABqBsbXmBLQ582zWP4qyZNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771881802; c=relaxed/simple;
	bh=b7cxy0TLQMymvEBqkpS0fgEb3QwwVbrBQBHSafIS+Pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sr67N0P0ProVchzNOJYfFz4OUUDj7QILcDDOqYCFI98Oj5YBHXdmFUC+0N0kodaSQ7y7HgWBdqsnON6kUwY5JWoAhT9WLxTmQ5ib2eez/myBuQQyLThjtdgLsomkMoqjWp4UoD5PU2bK92TGJRcZxWRU2GK41k1u7HbOYmkCNPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IqNI42IP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gtokaO4o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGRLec1640663
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 21:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rHCvAT6pGLEz/0NL/hsRib41
	8oQJ6Hopoh+QwMfIbuI=; b=IqNI42IPWY0pM0iOT424kudTyoGHsyZ7C26NGHCV
	RivUhI4dX3hB18HHwU1AvqMEhF/76svauhbQmubh2mMeJhiDoSrqD1qrT2NX1CN/
	LF8h0+sMpdx97KzqjpDmfa+9JQ3+E9LIdB0y51tASGPK7iWGQfdBaXmfGW3dPyUI
	tkSSzuPKC3CKqKOtP/ffQIU4TpR6xmGlHRQcRmGWTzATNOFjW8w5fKp40PXLCh8n
	pLKj3CZqqgdLcyUDd41xPwnRS/MA56dTGiU/4chJcMpgPiXHKs0yMr9f6KO3mHhT
	gNWzie+xpGCcD2Oou8T4CkjqUnPS4r3dB49qd6C1I+m/gg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8rv9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 21:23:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71500f274so541038685a.1
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 13:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771881798; x=1772486598; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rHCvAT6pGLEz/0NL/hsRib418oQJ6Hopoh+QwMfIbuI=;
        b=gtokaO4o6vFr/kGo2MWxpdVrKx/fa0UNM1doP/itz5IJEOpJssiTrfpFwhBuPwd/EC
         +ONsaLJq+rBB3HZ7r69UNtNfRVYe5Nm+GtDCl21rbrZfcbsN22CrtgTM9pvUBxIeBSdl
         Kj5EaPp23f50x5UuWiBHK80Ip+xhBFSpe0PmV8fEEIYcsx9R3MYFmsCOHJ8pFcH9glXA
         Lcz4z1+KEmWFq0hPSThoXYRKCftVdYbPtimbBjlL4yg5+ZoPpDMFsJchkZ26SC0OmKLA
         X5sYKH05q4O6DQHJzitron7/jdtbdTn/CGw9BxHw/8l0IFU9xQ5RbdF/sk41UCgUod4w
         Tnvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771881798; x=1772486598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHCvAT6pGLEz/0NL/hsRib418oQJ6Hopoh+QwMfIbuI=;
        b=i6cgvN3wp2oKEfbaQYNf2G/dx7HmPt5E8tX7sW8sb/CGvdOxy4QL3qPBoNBz9UuT1r
         YcAY5cSh9DmkZaKMJ83nSIDnCRO/Jg1g2wGpcvpimAqSzn3nmRVBzQ4IJzxyyd3q7wx1
         fJZD4Zw6vgLxdNG2vFaEaM6Rv5Wf2HTf4SGORgMT6k1Qrhwj0dLeoRshz+S0FrlsOILu
         Jhc74zEpthT+0C7p9aLAHvONNbujJyX8gGoolPAce01O+lEiJPp5HLLhPYtidHzyrfZu
         KEK5aKdJ6GGZ2l/vuyu1S7GRTzN/gWx4e8UpBXbf7+04ldQ+BmRgPa46u2gE21GcKNPd
         LfAw==
X-Forwarded-Encrypted: i=1; AJvYcCVxc+1rpsVl54LnoSvYzTsRWwkmwRGeKG8+vGO7nKDmHu8gZpy333hCTzJsnlohWel7pS5AKwMlTYGbaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/9no3TGP8WZBmF2Pf21/eKAs2Q2Lv5sVmPzeOyYsuak6YMaFS
	EKe1mqMwr3zz95BdMvJ4ts1BXot4j4KmD4JdoQe3g+JOV3X2M6cB8hcx1aVqSh08wJJhpNovpLs
	YYNyLnpiE0ROb0/y1alUPn6o9pqp/GmHGW4kZf1sKo04poKxcxwEGLeTLMw8SCp7efA==
X-Gm-Gg: AZuq6aJDYDpXIH6/NBOQbHfFsd1RPajt5bIqIPYhq5hvOOkaH4N5uLxBgQmNkajiByr
	j1NlwZ0RifV91oXBntwHrVK8NJeRpgGzuk94uN9HjlC6O0bkDYbz+YZ21r49nysf//zR3DOP8CR
	uUlDncOqti6zbjBlCxce/METB4F1w0p+4WxgL1OJ9HuqhFbLySCPE5In1W85B7bRN1/ypgK9DCF
	rWxLyaoMfRjLiVdMfjVIblMbnNfqIkjPh8pL3nirdukTbIW8pxGlTXcK0xW52qZuKJSfrWNRAmy
	G0o0raLUFc7UatlUXrJg3mCUDPMhz8UNAc5dHLR1okAZ7pLh7YmwBMppI5HdowL0ueEWaViLRoR
	ubwCBmixKBdYyOp4n78lURjzSO3d90XHxQiAg5H/6vPZ0eDJVaaWhklY9ea2mmonqnDkth96qd4
	waeRrzx5we8lHEgdK+rtpe4rVGTue7G3107Lw=
X-Received: by 2002:a05:620a:29d1:b0:8c6:a809:862a with SMTP id af79cd13be357-8cb8ca656f6mr1196018785a.45.1771881797404;
        Mon, 23 Feb 2026 13:23:17 -0800 (PST)
X-Received: by 2002:a05:620a:29d1:b0:8c6:a809:862a with SMTP id af79cd13be357-8cb8ca656f6mr1196013485a.45.1771881796495;
        Mon, 23 Feb 2026 13:23:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb4cba3sm1754560e87.90.2026.02.23.13.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 13:23:15 -0800 (PST)
Date: Mon, 23 Feb 2026 23:23:13 +0200
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
Subject: Re: [PATCH RFC 03/18] accel/qda: Add RPMsg transport for Qualcomm
 DSP accelerator
Message-ID: <tqsdbijgjomrn7fq3sdz7v2axwxqvbccpjh4fmvod4kbrq7pod@af3igw5dx66p>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-3-fe46a9c1a046@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-3-fe46a9c1a046@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: bKV-nsURTDz_huO24rz-V6p8AKYWmlJT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE4NSBTYWx0ZWRfXzuExz9LWjI5z
 vGN6sWaGyFlvLOEGe1VkIJJXeH+0b7Awn5KvtjQWjaH2jQS5ihlptNzXiN3vs0nBiGvxtJeA9VR
 IBYs2nqQPbTnzn4CTOdzPY3PecRoms6KUIjgH7coD5/IQ86tYPZIlWiXfvt9ZRPzoUP901KmvEC
 ptt37aSBQSu5XyWBSDdlB8NCswoCJZ3Hk78rE7F1k9QlCJJDzs7yVFVMn6ivG7ZgVySBabZtvN9
 WCDH4e17yNtcYdjxRC8Y098uW718RFDfe9HgsBza6sNvQNQHOkLL8uZgOl6b50JGxdqMxMTKfE0
 MYTejgU/6GXreJCwDH5K6LP6R5KspOC6n8Y73SkszomkcENym6t5uAJ3rhi3NCl5RBEESdmI4fB
 l+s3dLbiCOhk1BRxp2X8X7pPMbgfjPdB+jzRG2prwX3XZzl5Esh6VmuL3z+O9ibwc30Jzv/Y4xt
 NUOzLZRkW9nwKTZrZQQ==
X-Proofpoint-GUID: bKV-nsURTDz_huO24rz-V6p8AKYWmlJT
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699cc548 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=UyRWXFl-5J4keBKrG3IA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230185
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53228-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2FC5017D8BE
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:38:57AM +0530, Ekansh Gupta wrote:
> Extend the Qualcomm DSP accelerator (QDA) driver with an RPMsg-based
> transport used to discover and manage DSP instances.
> 
> This patch introduces:
> 
> - A core qda_dev structure with basic device state (rpmsg device,
>   device pointer, lock, removal flag, DSP name).
> - Logging helpers that integrate with dev_* when a device is available
>   and fall back to pr_* otherwise.
> - An RPMsg client driver that binds to the Qualcomm FastRPC service and
>   allocates a qda_dev instance using devm_kzalloc().
> - Basic device initialization and teardown paths wired into the module
>   init/exit.
> 
> The RPMsg driver currently sets the DSP name from a "label" property in
> the device tree, which will be used by subsequent patches to distinguish
> between different DSP domains (e.g. ADSP, CDSP).
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/Kconfig     |   1 +
>  drivers/accel/qda/Makefile    |   4 +-
>  drivers/accel/qda/qda_drv.c   |  41 ++++++++++++++-
>  drivers/accel/qda/qda_drv.h   |  91 ++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_rpmsg.c | 119 ++++++++++++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_rpmsg.h |  17 ++++++
>  6 files changed, 270 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/accel/qda/Kconfig b/drivers/accel/qda/Kconfig
> index 3c78ff6189e0..484d21ff1b55 100644
> --- a/drivers/accel/qda/Kconfig
> +++ b/drivers/accel/qda/Kconfig
> @@ -7,6 +7,7 @@ config DRM_ACCEL_QDA
>  	tristate "Qualcomm DSP accelerator"
>  	depends on DRM_ACCEL
>  	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on RPMSG
>  	help
>  	  Enables the DRM-based accelerator driver for Qualcomm's Hexagon DSPs.
>  	  This driver provides a standardized interface for offloading computational
> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
> index 573711af1d28..e7f23182589b 100644
> --- a/drivers/accel/qda/Makefile
> +++ b/drivers/accel/qda/Makefile
> @@ -5,4 +5,6 @@
>  
>  obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
>  
> -qda-y := qda_drv.o
> +qda-y := \
> +	qda_drv.o \

Squash these parts into the previous patch.

> +	qda_rpmsg.o \
> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
> index 18b0d3fb1598..389c66a9ad4f 100644
> --- a/drivers/accel/qda/qda_drv.c
> +++ b/drivers/accel/qda/qda_drv.c
> @@ -2,16 +2,53 @@
>  // Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>  #include <linux/module.h>
>  #include <linux/kernel.h>
> +#include <linux/atomic.h>
> +#include "qda_drv.h"
> +#include "qda_rpmsg.h"
> +
> +static void cleanup_device_resources(struct qda_dev *qdev)
> +{
> +	mutex_destroy(&qdev->lock);
> +}
> +
> +void qda_deinit_device(struct qda_dev *qdev)
> +{
> +	cleanup_device_resources(qdev);
> +}
> +
> +/* Initialize device resources */
> +static void init_device_resources(struct qda_dev *qdev)
> +{
> +	qda_dbg(qdev, "Initializing device resources\n");
> +
> +	mutex_init(&qdev->lock);
> +	atomic_set(&qdev->removing, 0);
> +}
> +
> +int qda_init_device(struct qda_dev *qdev)
> +{
> +	init_device_resources(qdev);
> +
> +	qda_dbg(qdev, "QDA device initialized successfully\n");
> +	return 0;
> +}
>  
>  static int __init qda_core_init(void)
>  {
> -	pr_info("QDA: driver initialization complete\n");
> +	int ret;
> +
> +	ret = qda_rpmsg_register();
> +	if (ret)
> +		return ret;
> +
> +	qda_info(NULL, "QDA driver initialization complete\n");
>  	return 0;
>  }
>  
>  static void __exit qda_core_exit(void)
>  {
> -	pr_info("QDA: driver exit complete\n");
> +	qda_rpmsg_unregister();
> +	qda_info(NULL, "QDA driver exit complete\n");
>  }
>  
>  module_init(qda_core_init);
> diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
> new file mode 100644
> index 000000000000..bec2d31ca1bb
> --- /dev/null
> +++ b/drivers/accel/qda/qda_drv.h
> @@ -0,0 +1,91 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __QDA_DRV_H__
> +#define __QDA_DRV_H__
> +
> +#include <linux/device.h>
> +#include <linux/mutex.h>
> +#include <linux/rpmsg.h>
> +#include <linux/xarray.h>
> +
> +/* Driver identification */
> +#define DRIVER_NAME "qda"
> +
> +/* struct qda_dev - Main device structure for QDA driver */
> +struct qda_dev {
> +	/* RPMsg device for communication with remote processor */
> +	struct rpmsg_device *rpdev;
> +	/* Underlying device structure */
> +	struct device *dev;
> +	/* Mutex protecting device state */
> +	struct mutex lock;

Which parts of the state?

> +	/* Flag indicating device removal in progress */
> +	atomic_t removing;

Why do you need it if we have dev->unplugged and drm_dev_enter() /
drm_dev_exit()?

> +	/* Name of the DSP (e.g., "cdsp", "adsp") */
> +	char dsp_name[16];

Please replace with the pointers to the static array.

> +};
> +
> +/**
> + * qda_get_log_device - Get appropriate device for logging
> + * @qdev: QDA device structure
> + *
> + * Returns the most appropriate device structure for logging messages.
> + * Prefers qdev->dev, or returns NULL if the device is being removed
> + * or invalid.
> + */
> +static inline struct device *qda_get_log_device(struct qda_dev *qdev)
> +{
> +	if (!qdev || atomic_read(&qdev->removing))
> +		return NULL;
> +
> +	if (qdev->dev)
> +		return qdev->dev;
> +
> +	return NULL;
> +}
> +
> +/*
> + * Logging macros
> + *
> + * These macros provide consistent logging across the driver with automatic
> + * function name inclusion. They use dev_* functions when a device is available,
> + * falling back to pr_* functions otherwise.
> + */
> +
> +/* Error logging - always logs and tracks errors */
> +#define qda_err(qdev, fmt, ...) do { \
> +	struct device *__dev = qda_get_log_device(qdev); \
> +	if (__dev) \
> +		dev_err(__dev, "[%s] " fmt, __func__, ##__VA_ARGS__); \
> +	else \
> +		pr_err(DRIVER_NAME ": [%s] " fmt, __func__, ##__VA_ARGS__); \

What /why? You are under drm, so you can use drm_* helpers instead.

> +} while (0)
> +
> +/* Info logging - always logs, can be filtered via loglevel */
> +#define qda_info(qdev, fmt, ...) do { \
> +	struct device *__dev = qda_get_log_device(qdev); \
> +	if (__dev) \
> +		dev_info(__dev, "[%s] " fmt, __func__, ##__VA_ARGS__); \
> +	else \
> +		pr_info(DRIVER_NAME ": [%s] " fmt, __func__, ##__VA_ARGS__); \
> +} while (0)
> +
> +/* Debug logging - controlled via dynamic debug (CONFIG_DYNAMIC_DEBUG) */
> +#define qda_dbg(qdev, fmt, ...) do { \
> +	struct device *__dev = qda_get_log_device(qdev); \
> +	if (__dev) \
> +		dev_dbg(__dev, "[%s] " fmt, __func__, ##__VA_ARGS__); \
> +	else \
> +		pr_debug(DRIVER_NAME ": [%s] " fmt, __func__, ##__VA_ARGS__); \
> +} while (0)
> +
> +/*
> + * Core device management functions
> + */
> +int qda_init_device(struct qda_dev *qdev);
> +void qda_deinit_device(struct qda_dev *qdev);
> +
> +#endif /* __QDA_DRV_H__ */
> diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
> new file mode 100644
> index 000000000000..a8b24a99ca13
> --- /dev/null
> +++ b/drivers/accel/qda/qda_rpmsg.c
> @@ -0,0 +1,119 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +#include <linux/module.h>
> +#include <linux/rpmsg.h>
> +#include <linux/of_platform.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include "qda_drv.h"
> +#include "qda_rpmsg.h"
> +
> +static int qda_rpmsg_init(struct qda_dev *qdev)
> +{
> +	dev_set_drvdata(&qdev->rpdev->dev, qdev);
> +	return 0;
> +}
> +
> +/* Utility function to allocate and initialize qda_dev */
> +static struct qda_dev *alloc_and_init_qdev(struct rpmsg_device *rpdev)
> +{
> +	struct qda_dev *qdev;
> +
> +	qdev = devm_kzalloc(&rpdev->dev, sizeof(*qdev), GFP_KERNEL);
> +	if (!qdev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	qdev->dev = &rpdev->dev;
> +	qdev->rpdev = rpdev;
> +
> +	qda_dbg(qdev, "Allocated and initialized qda_dev\n");
> +	return qdev;
> +}
> +
> +static int qda_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len, void *priv, u32 src)
> +{
> +	/* Dummy function for rpmsg driver */
> +	return 0;
> +}
> +
> +static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
> +{
> +	struct qda_dev *qdev = dev_get_drvdata(&rpdev->dev);
> +
> +	qda_info(qdev, "Removing RPMsg device\n");
> +
> +	atomic_set(&qdev->removing, 1);
> +
> +	mutex_lock(&qdev->lock);
> +	qdev->rpdev = NULL;
> +	mutex_unlock(&qdev->lock);
> +
> +	qda_deinit_device(qdev);
> +
> +	qda_info(qdev, "RPMsg device removed\n");
> +}
> +
> +static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
> +{
> +	struct qda_dev *qdev;
> +	int ret;
> +	const char *label;
> +
> +	qda_dbg(NULL, "QDA RPMsg probe starting\n");
> +
> +	qdev = alloc_and_init_qdev(rpdev);
> +	if (IS_ERR(qdev))
> +		return PTR_ERR(qdev);
> +
> +	ret = of_property_read_string(rpdev->dev.of_node, "label", &label);
> +	if (!ret) {
> +		strscpy(qdev->dsp_name, label, sizeof(qdev->dsp_name));
> +	} else {
> +		qda_info(qdev, "QDA DSP label not found in DT\n");
> +		return ret;
> +	}
> +
> +	ret = qda_rpmsg_init(qdev);
> +	if (ret) {
> +		qda_err(qdev, "RPMsg init failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = qda_init_device(qdev);
> +	if (ret)
> +		return ret;
> +
> +	qda_info(qdev, "QDA RPMsg probe completed successfully for %s\n", qdev->dsp_name);
> +	return 0;
> +}
> +
> +static const struct of_device_id qda_rpmsg_id_table[] = {
> +	{ .compatible = "qcom,fastrpc" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, qda_rpmsg_id_table);
> +
> +static struct rpmsg_driver qda_rpmsg_driver = {
> +	.probe = qda_rpmsg_probe,
> +	.remove = qda_rpmsg_remove,
> +	.callback = qda_rpmsg_cb,
> +	.drv = {
> +		.name = "qcom,fastrpc",
> +		.of_match_table = qda_rpmsg_id_table,
> +	},
> +};
> +
> +int qda_rpmsg_register(void)
> +{
> +	int ret = register_rpmsg_driver(&qda_rpmsg_driver);
> +
> +	if (ret)
> +		qda_err(NULL, "Failed to register RPMsg driver: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +void qda_rpmsg_unregister(void)
> +{
> +	unregister_rpmsg_driver(&qda_rpmsg_driver);
> +}
> diff --git a/drivers/accel/qda/qda_rpmsg.h b/drivers/accel/qda/qda_rpmsg.h
> new file mode 100644
> index 000000000000..348827bff255
> --- /dev/null
> +++ b/drivers/accel/qda/qda_rpmsg.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __QDA_RPMSG_H__
> +#define __QDA_RPMSG_H__
> +
> +#include "qda_drv.h"
> +
> +/*
> + * Transport layer registration
> + */
> +int qda_rpmsg_register(void);
> +void qda_rpmsg_unregister(void);
> +
> +#endif /* __QDA_RPMSG_H__ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

