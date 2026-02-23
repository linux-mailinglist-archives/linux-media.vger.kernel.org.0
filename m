Return-Path: <linux-media+bounces-53240-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEVCJIvTnGkJLAQAu9opvQ
	(envelope-from <linux-media+bounces-53240-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 23:24:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AF61B17E463
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 23:24:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D1BD9302C6DE
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 22:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DAD37A4B9;
	Mon, 23 Feb 2026 22:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RQ0YBPrm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZnU/uqBo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65DB378826
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 22:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771885257; cv=none; b=MHBFY9zc17g00oj7M/MMsHhiGF3EHFt2rjs2/30ytflBBmIcjLLajHXISEU/23tFaSTInol+stnXasRFFecdDI8+e5+sIp+S641JZJqRsC8fbQwJvIrX5vgLqXtgh4c6Dw3w50bHTF1CEzv2YAHzJNiT6l40SSXDKybJquiIaZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771885257; c=relaxed/simple;
	bh=/58PtBnw2sF8abm1Fbhkt+r6ghRvdKgmeSB3QByvAZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8Zgoe7FAmJWIXfqD8MxstlvnM2Wl6yF/PvqSgVKof/WPgPu4OfE/SXMjGBGLvctMGy+f6Kx+9tCqeDk2+cmGLjWXzeSDqfvsBU6KyAb7otnad168X084vY4HjTQxrJ4l2+IDh2dWllGdrwC0NG8p5oWJcC1vwyKhW/hd143RQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RQ0YBPrm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZnU/uqBo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NISF473151787
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 22:20:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3T4PeH87tzer/BxO3NLS+Z5b
	dStUULU/A8xhL/S5OgM=; b=RQ0YBPrml89hdSmkuGU61ND+Zy4XWqOk0uNe+rgn
	VMA+sel3eLgiankD/ScPOZJecycfE4yhtDcj5MiNI5E7XpkonU4BAlKyiLrVjoCN
	xFNDdP46uZ9rXosaJrJjuoh30rknH9j+ArXXIVKW2LgrUStVxiFf+1mUIrEzXGyA
	sDotFZ477vuagQ+Phq+wb44X9HKID2BygdVZgApjk0l0KPfFLbXeEFmbVMRxXJ7K
	PQhrbfF7qK9TPEYQHn+xxti9f5yli/huUq/6rAq6+Njro0N7Q18cD92HCiQacn+m
	tqSOl2lGrj+d/kkg8f/4AJYTnLvwRPUZ/KWm8wG70ZS48A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj89tmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 22:20:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-896ff58f17aso657866846d6.2
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 14:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771885254; x=1772490054; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3T4PeH87tzer/BxO3NLS+Z5bdStUULU/A8xhL/S5OgM=;
        b=ZnU/uqBoJinJVu7m3jhl2H4AfsbdaW/Ik5O2zP5R8E2GcWruBzkYFPRsjqu5zbb1GR
         oUH51teDn32CVGRwhc0o8mD+sAbf06yrj0Jguknhn60XM9c2bUEQIY7/uV1LCTL+nGTa
         9oNMRl6RwYXfaf+DhPczpdSuQhNTvUc1r7zrZ6iOR1hXX7SBcMbx8hbD1YcJTH+qadO7
         vfoiyzEQKPDPhgtdWUgB2ZnBXJ3fca58J8lCijHiWbkdXKoVQnkFg38lAONN4/GuMP/f
         iEDrzuI2U/ISMMweSRpeDrmvg1Z1hplm/CDSaZyxeg0SCs0mtUSIWrf8sJLZiKXY/vB1
         dsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771885254; x=1772490054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3T4PeH87tzer/BxO3NLS+Z5bdStUULU/A8xhL/S5OgM=;
        b=Guo4GmPxXeRHn2r/Ya/lAhe+4z623XG83q7VJHeJmAqxFo1eCyVTYgJJeLKSoRo8eu
         APCf9I9cfN0y6R3Xa5qBYSy3sT9jAu1715sA8RDETwpOp9bvl4EAvP5n78nkgMOwqVhF
         LU9ojSroqzayJHKYWfRxzAlrCz7BlWv/eah6IkPmYlRHqEVS5dRuNMEuV+/plogiLIDL
         q2jaTfXomU+hcAeP+FDQKRqytluzF1yBrbYoIZ7CEd4vPAHh+dqv1ZwXOK53deA2lrpe
         cWZZNCQzD8sEQLYb2H36ezIUV5sRjDuDCCYzILVwJ8y/nGlVPThhAbhFCdyI+Gc6l5iE
         nGeA==
X-Forwarded-Encrypted: i=1; AJvYcCXGoeMKkm5aP0EM3FBPoWQTmJvDZw32e0juEmfKJ19zR0s2w1529EkovEgDoZU4ARJzigYJ7M2Ewb3Uew==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH0hteX+4azpwdoqKjNTvEC95+iNFDhmv/rDGo7JGSTLWOofy8
	vS2mHBlw448bTJn68zOzqmdMH5q3SgzdnhweO4euiomEzTWDL5p99nb06cz9KCOHo2GGkkHXXrs
	Z4Cvf1aT9yxHEjamJ6Kgw+2yGaZ8rcmoSid9k/ZSAdnFQ05KQGEgHhCS7w2imPrjNIg==
X-Gm-Gg: AZuq6aIdTIYyRUNw7Z/PH2ZlNUL4kuCp/1gupRD0SN/Jc1YKX2mqC3C8ErDqHNUu3wC
	r8ELYBCz9YRCzlwrQH2fgBtcqjDkTG5D+OFB5Gfd0T2PxZmteM95EKAL90Yv/zZtZNQYLgvETV6
	RtJU5FMxpfMkLChEL97FCeOfw6BD7KHAPurFh/lhRPnYsVxSNa44EMKwmbIC9y/FSu0vUOv6Kwt
	N4SxVwSL4rLezEx+fFlyZe7jUA0e063h7Vbago/tO9yJ3rfXUxsTiDPCj3umbdy/vEi6b96OLAs
	B4YiVzHGsYQ2mMhnPnE254ez5IZajlu1Q972/uVvIynF3dPCbRwCI+6RJ8WpW236Zt1Tu/1flEi
	ZkBZSnLlqxlx2Y/5IthmqTmpMcIC2lzU6ZIYuWOV+PrCYRxBKRvrDb1Vlf5Yw/ZdxLBnrH0An7W
	/VhSKFcmyNhOieKu904VvFjfRVSIlBLBMvLOY=
X-Received: by 2002:a05:620a:7112:b0:8be:e0c4:26ca with SMTP id af79cd13be357-8cb8ca76d0amr1295285285a.61.1771885253911;
        Mon, 23 Feb 2026 14:20:53 -0800 (PST)
X-Received: by 2002:a05:620a:7112:b0:8be:e0c4:26ca with SMTP id af79cd13be357-8cb8ca76d0amr1295279485a.61.1771885253294;
        Mon, 23 Feb 2026 14:20:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb45938sm1797527e87.69.2026.02.23.14.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:20:52 -0800 (PST)
Date: Tue, 24 Feb 2026 00:20:50 +0200
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
Subject: Re: [PATCH RFC 08/18] accel/qda: Add per-file DRM context and
 open/close handling
Message-ID: <rnhqwqtd66fmvmyobhrodzoa7x2etzjjh7xhqrn5hkmibms5cd@ucggzznrx7j6>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-8-fe46a9c1a046@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-8-fe46a9c1a046@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5NCBTYWx0ZWRfX0hcHia/peiak
 XcIDovoFr0Huv+Z/BwOwsyiEgKyAZcCpmbmsNNe3Z6qDnaaIyEU9cq0fcW0v+ZmvQ4kyo14wBzV
 iCws2cwyiwLIxLNw9MdIAzMT3iWRqEQ/NRauFka2XLnbwL3sQoK/P3TxFMPhYDhjTWDC6MAq8f2
 C4+K4BhLljgGvtrwczE0TJ9u98XrDAZAoJ7HS+QFE3lUr0CjnwxvASbNPgPNxQuOe8OVQ9FjiZn
 8SXxL0X4nTOiyfsskRIrp3VlMMuy4L+QtBj4Wmmff3El2KkUEzuaGkAD2JT9mKNTZYHEH/f4HpJ
 E3vQP9QZwdzOT8KSqJ/ZJoq85C+LVRkM65LfuB7tYj5Y3WSaOvjKMDMo+W3fddM1/XG5vO16OwG
 SG7PUAd5C+/wW0DzqCzpdP28+iPDCf9a5YR81wycZ8NpPxnyvzYfA5HfvB92MLzwHYONdn/XJ3l
 kJaD5iFWj4uHEgiG+Iw==
X-Proofpoint-GUID: HBo0y3hXIBVesejjSCHbWAisYy51rjjJ
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699cd2c6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=i04C7yyKdwGZ-rgJMjYA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: HBo0y3hXIBVesejjSCHbWAisYy51rjjJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230194
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53240-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AF61B17E463
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:39:02AM +0530, Ekansh Gupta wrote:
> Introduce per-file and per-user context for the QDA DRM accelerator
> driver. A new qda_file_priv structure is stored in file->driver_priv
> for each open file descriptor, and a qda_user object is allocated per
> client with a unique client_id generated from an atomic counter in
> qda_dev.
> 
> The DRM driver now provides qda_open() and qda_postclose() callbacks.
> qda_open() resolves the qda_dev from the drm_device, allocates the
> qda_file_priv and qda_user structures, and attaches them to the DRM
> file. qda_postclose() tears down the per-file context and frees the
> qda_user object when the file is closed.
> 
> This prepares the QDA driver to track per-process state for future
> features such as per-client memory mappings, job submission contexts,
> and access control over DSP compute resources.

Start by describing the problem instead of stuffing it to the end. Can
we use something better suited for this task, like IDR?

> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/qda_drv.c | 117 ++++++++++++++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_drv.h |  30 ++++++++++++
>  2 files changed, 147 insertions(+)
> 
> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
> index a9113ec78fa2..bf95fc782cf8 100644
> --- a/drivers/accel/qda/qda_drv.c
> +++ b/drivers/accel/qda/qda_drv.c
> @@ -12,11 +12,127 @@
>  #include "qda_drv.h"
>  #include "qda_rpmsg.h"
>  
> +static struct qda_drm_priv *get_drm_priv_from_device(struct drm_device *dev)
> +{
> +	if (!dev)
> +		return NULL;
> +
> +	return (struct qda_drm_priv *)dev->dev_private;
> +}
> +
> +static struct qda_dev *get_qdev_from_drm_device(struct drm_device *dev)
> +{
> +	struct qda_drm_priv *drm_priv;
> +
> +	if (!dev) {
> +		qda_dbg(NULL, "Invalid drm_device\n");
> +		return NULL;
> +	}
> +
> +	drm_priv = get_drm_priv_from_device(dev);
> +	if (!drm_priv) {
> +		qda_dbg(NULL, "No drm_priv in dev_private\n");
> +		return NULL;
> +	}
> +
> +	return drm_priv->qdev;
> +}
> +
> +static struct qda_user *alloc_qda_user(struct qda_dev *qdev)
> +{
> +	struct qda_user *qda_user;
> +
> +	qda_user = kzalloc_obj(*qda_user, GFP_KERNEL);
> +	if (!qda_user)
> +		return NULL;
> +
> +	qda_user->client_id = atomic_inc_return(&qdev->client_id_counter);
> +	qda_user->qda_dev = qdev;
> +
> +	qda_dbg(qdev, "Allocated qda_user with client_id=%u\n", qda_user->client_id);
> +	return qda_user;
> +}
> +
> +static void free_qda_user(struct qda_user *qda_user)
> +{
> +	if (!qda_user)
> +		return;
> +
> +	qda_dbg(qda_user->qda_dev, "Freeing qda_user client_id=%u\n", qda_user->client_id);
> +
> +	kfree(qda_user);
> +}
> +
> +static int qda_open(struct drm_device *dev, struct drm_file *file)
> +{
> +	struct qda_user *qda_user;
> +	struct qda_file_priv *qda_file_priv;
> +	struct qda_dev *qdev;
> +
> +	if (!file) {
> +		qda_dbg(NULL, "Invalid file pointer\n");
> +		return -EINVAL;
> +	}
> +
> +	qdev = get_qdev_from_drm_device(dev);
> +	if (!qdev) {
> +		qda_dbg(NULL, "Failed to get qdev from drm_device\n");
> +		return -EINVAL;
> +	}
> +
> +	qda_file_priv = kzalloc(sizeof(*qda_file_priv), GFP_KERNEL);
> +	if (!qda_file_priv)
> +		return -ENOMEM;
> +
> +	qda_file_priv->pid = current->pid;
> +
> +	qda_user = alloc_qda_user(qdev);
> +	if (!qda_user) {
> +		qda_dbg(qdev, "Failed to allocate qda_user\n");
> +		kfree(qda_file_priv);
> +		return -ENOMEM;
> +	}
> +
> +	file->driver_priv = qda_file_priv;
> +	qda_file_priv->qda_user = qda_user;
> +
> +	qda_dbg(qdev, "Device opened successfully for PID %d\n", current->pid);
> +
> +	return 0;
> +}
> +
> +static void qda_postclose(struct drm_device *dev, struct drm_file *file)
> +{
> +	struct qda_dev *qdev;
> +	struct qda_file_priv *qda_file_priv;
> +	struct qda_user *qda_user;
> +
> +	qdev = get_qdev_from_drm_device(dev);
> +	if (!qdev || atomic_read(&qdev->removing)) {
> +		qda_dbg(NULL, "Device unavailable or removing\n");
> +		return;

Even if it is being removed, no need to free the memory?

> +	}
> +
> +	qda_file_priv = (struct qda_file_priv *)file->driver_priv;
> +	if (qda_file_priv) {
> +		qda_user = qda_file_priv->qda_user;
> +		if (qda_user)
> +			free_qda_user(qda_user);
> +
> +		kfree(qda_file_priv);
> +		file->driver_priv = NULL;
> +	}
> +
> +	qda_dbg(qdev, "Device closed for PID %d\n", current->pid);
> +}
> +
>  DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
>  
>  static struct drm_driver qda_drm_driver = {
>  	.driver_features = DRIVER_COMPUTE_ACCEL,
>  	.fops			= &qda_accel_fops,
> +	.open			= qda_open,
> +	.postclose		= qda_postclose,
>  	.name = DRIVER_NAME,
>  	.desc = "Qualcomm DSP Accelerator Driver",
>  };
> @@ -58,6 +174,7 @@ static void init_device_resources(struct qda_dev *qdev)
>  
>  	mutex_init(&qdev->lock);
>  	atomic_set(&qdev->removing, 0);
> +	atomic_set(&qdev->client_id_counter, 0);
>  }
>  
>  static int init_memory_manager(struct qda_dev *qdev)
> diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
> index 2b80401a3741..e0ba37702a86 100644
> --- a/drivers/accel/qda/qda_drv.h
> +++ b/drivers/accel/qda/qda_drv.h
> @@ -10,6 +10,7 @@
>  #include <linux/list.h>
>  #include <linux/mutex.h>
>  #include <linux/rpmsg.h>
> +#include <linux/types.h>
>  #include <linux/xarray.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
> @@ -20,6 +21,33 @@
>  /* Driver identification */
>  #define DRIVER_NAME "qda"
>  
> +/**
> + * struct qda_file_priv - Per-process private data for DRM file
> + *
> + * This structure tracks per-process state for each open file descriptor.
> + * It maintains the IOMMU device assignment and links to the legacy qda_user
> + * structure for compatibility with existing code.
> + */
> +struct qda_file_priv {
> +	/* Process ID for tracking */
> +	pid_t pid;
> +	/* Pointer to qda_user structure for backward compatibility */
> +	struct qda_user *qda_user;
> +};
> +
> +/**
> + * struct qda_user - Per-user context for remote processor interaction
> + *
> + * This structure maintains per-user state for interactions with the
> + * remote processor, including memory mappings and pending operations.
> + */
> +struct qda_user {
> +	/* Unique client identifier */
> +	u32 client_id;
> +	/* Back-pointer to device structure */
> +	struct qda_dev *qda_dev;
> +};
> +
>  /**
>   * struct qda_drm_priv - DRM device private data for QDA device
>   *
> @@ -52,6 +80,8 @@ struct qda_dev {
>  	struct qda_drm_priv *drm_priv;
>  	/* Flag indicating device removal in progress */
>  	atomic_t removing;
> +	/* Atomic counter for generating unique client IDs */
> +	atomic_t client_id_counter;
>  	/* Name of the DSP (e.g., "cdsp", "adsp") */
>  	char dsp_name[16];
>  	/* Compute context-bank (CB) child devices */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

