Return-Path: <linux-media+bounces-53246-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFMSM3HYnGkFLwQAu9opvQ
	(envelope-from <linux-media+bounces-53246-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 23:45:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 752E017E861
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 23:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5E27312F0B0
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 22:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A152B37BE6E;
	Mon, 23 Feb 2026 22:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CIL0pWDy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WyneIuo1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010C936EAB3
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 22:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771886434; cv=none; b=sanxO/56wU14gCtEpgAbNjKQUgMx2ytFS4+EcbbDNiAmosUGV/AXiwuPbsLDIcbHTxRdaH+Mwe6JwQPrb/x7JpNtxnDYAYayPjLJs5RzEl52POB92QV/A5fosok5pE3ey7I+8iZXHGdcNuH3FC7e6E4mIXzBEbp6vtKA4kCYzLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771886434; c=relaxed/simple;
	bh=Qih0QhTFQ3wj9ErAiKpynh4DfMe40Ro0OOLK8vFqRyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPQj3cBxduItmYC0ei2C4G6H1ZEVGcxO/rXhhkDKCeYCebJpuTgBnJpBEM4lfbti06ZhLXRHxCpG5eHGnePca+a709YG1xEU9F7azVjODZ4lIzHhszmgyWSjmbQGLe5qkudo0rTjUIo2Q+NOFjptKudGutOynFl4H5jtBFqn3iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CIL0pWDy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WyneIuo1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NJ9hlc3698125
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 22:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u/ELNB5NNSNmVG1lAxOxXYaU
	P/G6z2rnLtuVVe2l8Dc=; b=CIL0pWDyAHnR5vXk18SDZA7lb6nyCoTjULcjQfez
	Fd8EZfTPq5EtM25/5Al218WuFiIs1Mds6C/q0/EfPi6fYF11Kjzwx6jCUAbIgDF3
	A1rfdspmIF8aTktTYjxCTIWXiOVT49AQe6OgVD/d7sqgV9sm429j8EW2IRKZz4jR
	fB5J9wnQcdSkjZaVqOSd5qSOwTco8FKnmcALeH23N4obi36U1A7KduH1zlGlZF0v
	fzA8y6OA1hpylxOWNBU4cB3CfpjfygvgTMTuSKgbyOZQlcaUIs+2f9R6JhJfZLxW
	zAHG0AR/GsaSlxM7FdpK2WFea2c5ABblEUPd36w12xuwXA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn81a4hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 22:40:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb390a0c4eso1905454385a.1
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 14:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771886431; x=1772491231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u/ELNB5NNSNmVG1lAxOxXYaUP/G6z2rnLtuVVe2l8Dc=;
        b=WyneIuo1J1f2eXXF7uTdQXyXG6wN32O+HKc1UDkmHI5EpM8f7T5n7bEGnHXQ/vUKPt
         WzcB17nSGM9jtt/hdXfw/UvMLZ234/fIAJpYpDjUZP5K/wMR3kWtqogEBN07mPWW0AX5
         XSgwQk1/7Iy/CloixO9TBbTQkkL+BnQbFN2aN0jg3sCsSuBwQU/XZbx6X8yWC5jt7YKR
         52IS3PjZFi5Kx1G/dAsuPwAbah07K5L6zLVH7ocKymB0GW5It67KZ95QTIAxb3Gffc4C
         rUgVMIpk/cC1ySB+2wOyEGrazESV8BtrEJW1uRtKKwssYVHE9Cqr8uoJHiIG1liqB8nP
         fUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771886431; x=1772491231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/ELNB5NNSNmVG1lAxOxXYaUP/G6z2rnLtuVVe2l8Dc=;
        b=qjk5cWfGZzRv9HLGnmMeUN/OFnEcnjxT846lF3gDRYHKa84m82YgX2ti13nrBx3UHC
         XJn57M+PwN9olQRxls4z4nQ2ta1FyN0LkO9c6qIpFU6143Dl/dqtD3SMZiuAl+5xgXlB
         Na9qZFUsOmtq6T+BHHQmcjKtwcIB6KKmr1cQPDdsAP8k9kPsKws4d1G0WJ3biEUrU888
         MqvtCMvgmrFC0HrP40VfFkJcS/3LCkHBeDKknnuptWHdExC6dl3NY0OC6mSp/twFoaZb
         HQ5okfheROwqukDQR/K5DQdlgxS82Awm1Xr0NPHtAdXGBMgRP2YSnem94xp0omBcRu3I
         jPCw==
X-Forwarded-Encrypted: i=1; AJvYcCWXftYmN66dF23NMuwJSlvI79KAxYB2qVWbCGl2pDQxBKbvAAF+wi6U/akS1PcpA94CWFvnjkwrmzIDFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwDWFPLDreQwOpkiMOssh643KhVa26iCsOmvAsvwPOGqK/J8Lz
	73a2lQ+J6VZ1WsOEUyhZA9NB7cElocULtgEwVgLkuI3QjcwEFqFv+BQwbLhR3+RhugI++f1TH/g
	Ymee40wpS5D5UF/ct6Uy0uhXTiMgyKAZWGwLO9IG31QAbmeBlfHSii1kiiqF+PO7jfg==
X-Gm-Gg: AZuq6aIDuy6nvqk1SPhdHPJ0MqEuUkGKZf2MquZ6+MTeW/ZJ5WconuAqBadK8u1KBil
	7zU+31aiY3NJeN1KeEjaHPJVylnx+Ff5MC0OiYqOJTAqRSDgpYqMMWAIo4/FgJMyMwP0tDUAX4+
	bOPsNFNMUDOubR9IgtKQZ8yKywSow52o8avlH58bqXHgjRJFc+LTQFlvdOvQTlZ9HpUtSgMJX5q
	C8QqALoFj5GpmO+NnSOgMeOW4IyQEcxLnDrVcYLPSYLmpVQpNa3OSfzAW6qv3oSuRh0VCe0q5L8
	uNikqCBfouU6jDfwluij1IjWNlJAgWXDPNx2rSLllRtF/Bo1svuCz//gYp01pCV3n49m+7uhIWw
	0fs8wBCgMFtAS2IYWyObdUov8vhesVbCPZzLUZdVbH0YrgnLnI/i80vJjjUhrHxchgBnp2IALnE
	J7Sah3dlwA7+f5cLMlRNEFQqi6Kj+RVFxfPgI=
X-Received: by 2002:a05:620a:f15:b0:8c5:2d4c:4f0e with SMTP id af79cd13be357-8cb8c9fd576mr1266005985a.25.1771886431276;
        Mon, 23 Feb 2026 14:40:31 -0800 (PST)
X-Received: by 2002:a05:620a:f15:b0:8c5:2d4c:4f0e with SMTP id af79cd13be357-8cb8c9fd576mr1266002285a.25.1771886430804;
        Mon, 23 Feb 2026 14:40:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a78b4a45sm18140691fa.13.2026.02.23.14.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:40:28 -0800 (PST)
Date: Tue, 24 Feb 2026 00:40:25 +0200
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
Subject: Re: [PATCH RFC 18/18] MAINTAINERS: Add MAINTAINERS entry for QDA
 driver
Message-ID: <zideovhb7djvsbydqmdyxbgh6cte7xc5ouhm6gsreww6klqqae@o6w6wd4tic4r>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-18-fe46a9c1a046@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-18-fe46a9c1a046@oss.qualcomm.com>
X-Proofpoint-GUID: v-jONB3D0twR1ndI337Yg8qfAjhzNIU-
X-Proofpoint-ORIG-GUID: v-jONB3D0twR1ndI337Yg8qfAjhzNIU-
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=699cd760 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=gmMn6fPPSMme9wD3190A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5NyBTYWx0ZWRfX+MOLb0Wjf3eU
 oyDMDRXD9IzDRGxj8zS2GDDvs6lU9bz+9DMlCi/LyMFo7uJhgCailfeQmB1V9bcjgAi0vZDxwSy
 oKx1t/bGbI8BjcEMDaNyi1wrrrnHnBGKv/oedJL6gOgmUFVw/QQwhxIl9jl+F5uKRSBjfYMHFD0
 PWKXjBxouu1+5DBidPM9Yw3/pDTf+z5EJWUB9W295RauxdGnmGynVGaBpEOFNA3ovVkjeelVe3a
 mNFQa6XhLZWtPtccZobTQBy2f6Ej/rt1Uq+CL9BlcpvCWkMvP7vhyKoaiiNrmZgGvmmh2piqPMR
 gKmoX9fQSwdz26be87bxGLG49u0971eDLUc0Nr1Xqt4vHP6qCT35dou0+dYRrpMf9Tyh69yRp6h
 wipVm1LdiDES0vsH4B4fLlgl9Av+jcOjS6LFttscQbRp8GGUQijwOSOWSIYWjnWPpFmdGEUkTw+
 YOHyiPjakbfRTUmafmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230197
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
	TAGGED_FROM(0.00)[bounces-53246-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 752E017E861
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:39:12AM +0530, Ekansh Gupta wrote:
> Add a new MAINTAINERS entry for the Qualcomm DSP Accelerator (QDA)
> driver. The entry lists the primary maintainer, the linux-arm-msm and
> dri-devel mailing lists, and covers all source files under
> drivers/accel/qda, Documentation/accel/qda and the UAPI header
> include/uapi/drm/qda_accel.h.
> 
> This ensures that patches to the QDA driver and its public API are
> tracked and routed to the appropriate reviewers as the driver is
> integrated into the DRM accel subsystem.

Please add it in the first patch.

> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 71f76fddebbf..78b8b82a6370 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21691,6 +21691,15 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>  F:	drivers/crypto/qce/
>  
> +QUALCOMM DSP ACCELERATOR (QDA) DRIVER
> +M:	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> +L:	linux-arm-msm@vger.kernel.org
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +F:	Documentation/accel/qda/
> +F:	drivers/accel/qda/
> +F:	include/uapi/drm/qda_accel.h
> +
>  QUALCOMM EMAC GIGABIT ETHERNET DRIVER
>  M:	Timur Tabi <timur@kernel.org>
>  L:	netdev@vger.kernel.org
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

