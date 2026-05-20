Return-Path: <linux-media+bounces-62309-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBoOA+7HDWr93AUAu9opvQ
	(envelope-from <linux-media+bounces-62309-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 16:40:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 759EB58FD30
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 16:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A8CE4309DD9F
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122633ED5BB;
	Wed, 20 May 2026 14:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eZmVQFG/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XY1sgy5l"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6E73EA94B
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 14:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287396; cv=none; b=WilFOlRRZrulW1aqes+c0wbT6HruNV/imwv8JOI8nl6B1ms0+5PtkYdONmMKJ+AKngug7MC4N31094BUiUO70Dbz/DdRZwXbjYDSZLWB4TbmCVusSDVzVRV8M1Hff6L3ddXtTVn7JUko0lGwcq+WNY7T8PzXsBLrOpuVjOE3CmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287396; c=relaxed/simple;
	bh=oTAaOfFsFc8YiZ5sMXWMZAs7U4u7jgj04sZm//ztqmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TACb3FXJ0V1rqlA/bG6pjT+R9jv/9yHhwlyV+E5c8jsEWoYtlsbaYdGo+O6SK06W034PzyR7UQFqaP4SYwbGCzh9eyddo/f8BzCBKui3/Q0AmHZmrV9oM+GT1aihlhFYi7OPyJzs9/p5k2DecuDitOoDZ/16CNGC6b6l9R1VV44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eZmVQFG/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XY1sgy5l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9lfHu266960
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 14:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pxOt6IK/i3ibZ79BpGFSHKfb
	P+cfEih0yG4dCpDnkIo=; b=eZmVQFG/A3xV3qUS4A0vUqI9P0C7ARkGzo0UX+4z
	ttYkvelNRt8/3mtaxRtZiGQMTYFTeZa0qD+e+bbTtQHPMtb1q4FYEuaA+E6SpUun
	Rx865+RpRmohzVR612Om1+ptNWx/pRYRS3zumRhYDpLpUS8x9iJiLkusgJmgrPR1
	9tIDn/ZN/vkOXo416xZlg4nJ6VktEK112DGJ6p3UWQ3vbesOi1ZExRo3Nsy/p4H2
	WHiuTbU8kIvFlttlPUhPEDnlSV37cheZyCntY42NL/EsMEsbGpG+KF0imZCp9Peq
	hCYYKSLFaSysZA8ODrnuxfkbMTqKpPyj8oz87joZg74c8g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9amxs0qu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 14:29:52 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-577c69d3f04so5433470e0c.0
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 07:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779287392; x=1779892192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pxOt6IK/i3ibZ79BpGFSHKfbP+cfEih0yG4dCpDnkIo=;
        b=XY1sgy5l+3Ol6vZbV3kMcXCKv78tcGIbin8uOj24cHsgeXBwNTbSDwi9IxXakQWJdq
         oHLL3BiJT3wVLJqaKypt3atzSpTtrGrIZJBnfyRWlPzkFo4akqguxCOh1GhoxMcpABR0
         u8KmIQMWY08LG6h4+MMEr+P9NLWWNPRRkxJBUrPP/8b2n7r0Lus1rwIQpp52zqBUpMnt
         BWYjH8Dh9E7SLyp3f/ot/77NbqYUhA6XBBrLf9QRWx8mHPoDtBHsDG+192c4wIVfeOJO
         ouWPRH2Z+hsSa6DvV45e3BzdcuZKtOZZ6bxYyUJD8s/2l9z8PfgSMdOQYyJ6iAj3SAiZ
         93Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779287392; x=1779892192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pxOt6IK/i3ibZ79BpGFSHKfbP+cfEih0yG4dCpDnkIo=;
        b=llMWrLnpp8EGHX9EEm036TH01kToGfK5cg7es3LqTXLMS1+21fqxURpar5EyqQaq/r
         6+CKVSDFM+9MRpvjiOhDKU396Aehh8Ts/ZBddkkgany81VlbFJPndWI9VxV6Flvbz/VA
         EqMmhwjwH0Gp/vWXY2CYf7uWCXWaov1lIczaV5rVzFZmjDvEIl0WXWZOcklhDFTJUPxh
         Y8tv+HQIkPX78anuQNWOI02IV65BlCo76DtqXM/hz/KBpSi+9KzNiEEwdH/ZhQ0mGfSy
         P0W3IPg+EiN4g6yMi151+TGDrHpIsyJ/DadTsm2460Z3DcGAViOD2HEAEN1sh4/UQknc
         NqMw==
X-Forwarded-Encrypted: i=1; AFNElJ9afR9ymAR9+Qc5WVRqF7igNzaPKSpJCGZMehCbnGJHqBaa1nOOSbOjUCIZoPKG0hgg8yICZYDwPJZWfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwA7JH3KEPJV1xOenLMLFGvE6l4HxmNSHY1HuPAe5JogHaMdmnC
	D1oEbUoKbqA+wmBZ8hcDWuFKxPxi5Rx+zZeUSSZGR+dXXHxGdHiGssiBMeKbqV3PZ+WtYBoy8/F
	X8ulFgNjcWUTHgKQVW270DLUWuFpAJqrIfAvqF8F/CxpSXPBQBHDhU8qKXMKDZXlQ7A==
X-Gm-Gg: Acq92OEuf+QB1Rwo0ezxbqpwCJ+Umv6Wi03zSBABVXmMOvsNW8bIMDuTmmxd86MY4Ey
	47/cyJ9a0AjJhx5fbv83DxxkOrWhlroVbBhnxKR6wjem+8X0wefecBX1aSxVwc3qHrh6SvuObn3
	pTjVYKAbUcqEUKQRCXggVB64ml0z3Ieipp/aOxbb/4mCzOjDmK3WxNgF4TfyYdzh4KViYAm8wQe
	zD0zFLWfFcHPWAHFX5SlgmCPyIx3kx4RjwEqer+53r5MKfE6KGApdBvIcHXkJ2R2dTPrHaitvA1
	6zEagzuP73iSfs1lQIvHWelbSItlmIvrQgdYA0jwKmc7xSqaXkAVB5xx5/FipTmczKkrIaSk+FW
	OnMSmL8Ud0rk2fvFPPuN4h6we3Um0axzXOWyD4GQiZgoLXEetdekgVo0km0iUCFloFuZwCA3JVo
	fc+sJ7XQKKE0qq6WyMV8fhEIOIWJM7uGzRH5Q=
X-Received: by 2002:a05:6122:910:b0:56e:e9cf:7134 with SMTP id 71dfb90a1353d-5760be33374mr13875388e0c.3.1779287391897;
        Wed, 20 May 2026 07:29:51 -0700 (PDT)
X-Received: by 2002:a05:6122:910:b0:56e:e9cf:7134 with SMTP id 71dfb90a1353d-5760be33374mr13875318e0c.3.1779287391196;
        Wed, 20 May 2026 07:29:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164cf0a5sm4942878e87.75.2026.05.20.07.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:29:50 -0700 (PDT)
Date: Wed, 20 May 2026 17:29:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: ekansh.gupta@oss.qualcomm.com
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        robin.clark@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 08/15] accel/qda: Add QUERY IOCTL and QDA UAPI header
Message-ID: <m4zo2nkxtl5yeyo7riuata6r5saflmdgqf37cz2g2ezrwhk53m@mnad6bb7n3ik>
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-8-b2d984c297f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-qda-series-v1-8-b2d984c297f8@oss.qualcomm.com>
X-Proofpoint-GUID: ncs2t4RLt-aYXXjOpbyZNjb4GQ2uJmzx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0MSBTYWx0ZWRfX+6Hh7vB118FD
 +p/SHdo4eq4I3AIPyyo8E3Z/A6UFb3S4MFe9IjZtXiKrcOsJxYf4thb9esERN6XwEl1lUqhluig
 uZLSZUWexf/XvCmYBPmgMFP1W4ZmnATeBbVg9smJZW+zdlR8Rq4/34XqsxRj/6ruU66tBx+AbDQ
 5dyVG5BToIKQmASjwuYQ/UujqtvbD3PjPwTKqRXuXbTCuicv87fTtki6xlhF3u6pe0tqK1eiXHi
 4tTQWwEuA0iHP2ZFpW7uh2qtOsT+fLtPCM28EodbcrU1BC+wZ+SpsX6leFVuET//sNv/dMJJaFy
 TkU7N70ms/d2c8+16woRlB7ZtjYAlZ8sm9EjUin5Kbm2jsOUt5hD3k8uka5K4Pwh05apWJ5Yt8x
 YmgZHaPcxQFzCVyez64pFRRL3Ug7Cn459Ogzvs1jTUN0CnMUWafPjCYmy8xNROuGkYFNqzLu+2A
 0iP6kt9yWAraod950EA==
X-Authority-Analysis: v=2.4 cv=TO11jVla c=1 sm=1 tr=0 ts=6a0dc560 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=KrLRuONc4nWYnVYYFb0A:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: ncs2t4RLt-aYXXjOpbyZNjb4GQ2uJmzx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200141
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62309-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,quicinc.com,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 759EB58FD30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 11:45:58AM +0530, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Introduce the DRM_IOCTL_QDA_QUERY IOCTL, which allows user-space to
> identify which DSP domain a given /dev/accel/accel* node represents
> (e.g. "cdsp", "adsp").
> 
> include/uapi/drm/qda_accel.h
>   Defines the QDA IOCTL command numbers and the associated data
>   structures. The header follows the standard DRM UAPI conventions:
>   __u8/__u32 types, a C++ extern "C" guard, and GPL-2.0-only WITH
>   Linux-syscall-note licensing.
> 
> drivers/accel/qda/qda_ioctl.c / qda_ioctl.h
>   Implements qda_ioctl_query(), which copies the DSP domain name
>   stored in qda_dev.dsp_name into the user-supplied drm_qda_query
>   buffer using strscpy().
> 
> drivers/accel/qda/qda_drv.c
>   Registers the qda_ioctls[] table with the drm_driver so that the
>   DRM core dispatches DRM_IOCTL_QDA_QUERY to qda_ioctl_query().
> 
> Assisted-by: Claude:claude-4-6-sonnet
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/Makefile    |  1 +
>  drivers/accel/qda/qda_drv.c   |  8 +++++++
>  drivers/accel/qda/qda_ioctl.c | 26 +++++++++++++++++++++++
>  drivers/accel/qda/qda_ioctl.h | 13 ++++++++++++
>  include/uapi/drm/qda_accel.h  | 49 +++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 97 insertions(+)
> 
> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
> index 701fad5ffb50..b658dad35fee 100644
> --- a/drivers/accel/qda/Makefile
> +++ b/drivers/accel/qda/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
>  qda-y := \
>  	qda_cb.o \
>  	qda_drv.o \
> +	qda_ioctl.o \
>  	qda_memory_manager.o \
>  	qda_rpmsg.o
>  
> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
> index 0ad5d9873d7e..becd831d10be 100644
> --- a/drivers/accel/qda/qda_drv.c
> +++ b/drivers/accel/qda/qda_drv.c
> @@ -8,8 +8,10 @@
>  #include <drm/drm_gem.h>
>  #include <drm/drm_ioctl.h>
>  #include <drm/drm_print.h>
> +#include <drm/qda_accel.h>
>  
>  #include "qda_drv.h"
> +#include "qda_ioctl.h"
>  #include "qda_rpmsg.h"
>  
>  static int qda_open(struct drm_device *dev, struct drm_file *file)
> @@ -36,11 +38,17 @@ static void qda_postclose(struct drm_device *dev, struct drm_file *file)
>  
>  DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
>  
> +static const struct drm_ioctl_desc qda_ioctls[] = {
> +	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
> +};
> +
>  static const struct drm_driver qda_drm_driver = {
>  	.driver_features = DRIVER_COMPUTE_ACCEL,
>  	.fops = &qda_accel_fops,
>  	.open = qda_open,
>  	.postclose = qda_postclose,
> +	.ioctls = qda_ioctls,
> +	.num_ioctls = ARRAY_SIZE(qda_ioctls),
>  	.name = QDA_DRIVER_NAME,
>  	.desc = "Qualcomm DSP Accelerator Driver",
>  };
> diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
> new file mode 100644
> index 000000000000..761d3567c33f
> --- /dev/null
> +++ b/drivers/accel/qda/qda_ioctl.c
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +#include <drm/drm_ioctl.h>
> +#include <drm/qda_accel.h>
> +#include "qda_drv.h"
> +#include "qda_ioctl.h"
> +
> +/**
> + * qda_ioctl_query() - Query DSP device information
> + * @dev: DRM device structure
> + * @data: User-space data (struct drm_qda_query)
> + * @file_priv: DRM file private data
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv)
> +{
> +	struct drm_qda_query *args = data;
> +	struct qda_dev *qdev;
> +
> +	qdev = qda_dev_from_drm(dev);
> +
> +	strscpy(args->dsp_name, qdev->dsp_name, sizeof(args->dsp_name));
> +
> +	return 0;
> +}
> diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
> new file mode 100644
> index 000000000000..b8fd536a111f
> --- /dev/null
> +++ b/drivers/accel/qda/qda_ioctl.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __QDA_IOCTL_H__
> +#define __QDA_IOCTL_H__
> +
> +#include "qda_drv.h"
> +
> +int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv);
> +
> +#endif /* __QDA_IOCTL_H__ */
> diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
> new file mode 100644
> index 000000000000..1971a4263065
> --- /dev/null
> +++ b/include/uapi/drm/qda_accel.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __QDA_ACCEL_H__
> +#define __QDA_ACCEL_H__
> +
> +#include "drm.h"
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +/*
> + * QDA IOCTL command numbers
> + *
> + * These define the command numbers for QDA-specific IOCTLs.
> + * They are used with DRM_COMMAND_BASE to create the full IOCTL numbers.
> + */
> +#define DRM_QDA_QUERY		0x00
> +
> +/*
> + * QDA IOCTL definitions
> + *
> + * These macros define the actual IOCTL numbers used by userspace applications.
> + * They combine the command numbers with DRM_COMMAND_BASE and specify the
> + * data structure and direction (read/write) for each IOCTL.
> + */
> +#define DRM_IOCTL_QDA_QUERY		DRM_IOR(DRM_COMMAND_BASE + DRM_QDA_QUERY, \
> +					 struct drm_qda_query)
> +
> +/**
> + * struct drm_qda_query - Device information query structure
> + * @dsp_name: Name of DSP (e.g., "adsp", "cdsp", "cdsp1", "gdsp0", "gdsp1")
> + *
> + * This structure is used with DRM_IOCTL_QDA_QUERY to query device type,
> + * allowing userspace to identify which DSP a device node represents. The
> + * kernel provides the DSP name directly as a null-terminated string.
> + */
> +struct drm_qda_query {
> +	__u8 dsp_name[16];

Are you sure that you want to query only the name? No extra options, no
attributes, no hardware capabilities?

> +};
> +
> +#if defined(__cplusplus)
> +}
> +#endif
> +
> +#endif /* __QDA_ACCEL_H__ */
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry

