Return-Path: <linux-media+bounces-61310-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCNIHSBqA2rf5gEAu9opvQ
	(envelope-from <linux-media+bounces-61310-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 19:57:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B641B526597
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 19:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 94640307B058
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0233955F7;
	Tue, 12 May 2026 17:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZ8nfoMw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cJLVYlvt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BDD3955D6
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 17:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778608079; cv=none; b=F2AixSYO2mdIknocr5luNwYB96+JCedabbwN2SI+ZOABm4JHbvvqnXEgEU2/E1Iot63hPPhdfz9q8T13DF2aiLXsbevdzis0efBrbz24C9Rt0GbawnGoHQsO5FBDdlHISjeZcEXr3g6Z0gM1Wt9IXCbPx69QvEuXLLOtmwmo2Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778608079; c=relaxed/simple;
	bh=DwYJm/KUPqaUbwMpqMU5t+6EJiU7ZnLM6qTLt4ipgY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idMJSc7DDSU7mrp2gP63k+5sATqd3L5tIUGUtUaFpSbyk33o1RdTF8PNcRHQ88xbGZc3ZC88bp2QjWtv69gxdDAyMR4TZBU4T/M3pKObPFj1moozlHhGaA7e1TFLCGLw/SKD606PDah5q6cpkGmP0OpCSXli01PGDl0eNK3EPRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZ8nfoMw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cJLVYlvt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CEJLYL424410
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 17:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ijRH5lTd6epdmiIDuFY/1XST
	bAXhnghIOg5/FAB1KmU=; b=hZ8nfoMwoHkq55QEhooR2itkAHcgHdxJ8rpgxDdF
	CMRnDh6Ep0D60GsO8K6PjgW9UyGodLC3AE9yBCvxBNZJ14W6DqMcu154BSuPuRam
	P0C7NvxloVcEbuw5W2BDwFva8wGnvlUcZ9f2BeOaUwEcDcWXPdHv2u7bEVzEwf9J
	glYGEVbj8gZpGhKINKOMCT2oudb4R1oHSH1hd29ZYtQVNhUzZiFDAE3dH3Xl5X6h
	jXr+cvZAfgn4AThIvy5+l/nOPODyVlJlzn5wvYGk7z9WGW9g/j0oVVFlI8lGB2lx
	tRKcgKwuU27JJZEBYJNFsiolzDiRtb095qQLFWSKDefiXw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e45v58ue6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 17:47:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514a182b90dso40779981cf.1
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 10:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778608076; x=1779212876; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ijRH5lTd6epdmiIDuFY/1XSTbAXhnghIOg5/FAB1KmU=;
        b=cJLVYlvtfargtK0W9hdXTWzbzM7SOC0rVa0kTwrd7ZIQ3iJkCDoncwzh57c6JWqi3J
         AE0RX2J8Wv6sdh3zpXoNDN+FLEtbhcqGJpl9XZ26aeltHXo01iyGbWxAKoL/Atviw+I+
         VvXyomMlSCRvZbvme1WvWNZP6Oi0x9YySDIJCKVHKI8tH0sjmPsfkK7XMm/VJPvLQ4Oy
         hxDAT5l+778XcGahVP0oHtgk8rbhTVe4gfHGMh/+qhJeo6XU0Ghe5rXuxkqJ3d6Rxi/K
         9dlkNXLAJ+D6Vt5HSJ59RCg5VeKYLbwfj+lboUk/gYZAzqUAsGJ5fraDEe1R8a4BjEMP
         uYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778608076; x=1779212876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ijRH5lTd6epdmiIDuFY/1XSTbAXhnghIOg5/FAB1KmU=;
        b=XIMz/WWOZqShcONiyev/2q6QzWf+A0/WRyCkuHCKll1dHnSzncrEbz2tNWeY/nKbC7
         az34+v/iRJPw74XQ3Je3VYjCVI2/rKmzvGWxqIIuRgJBzzGWCacBoTjazusONYt3aygJ
         kX5+1/I+7aq/5ig18PELsR2rtfVXl6nLcTTgrflR08AooiaEzFbrtCqEIJdOBr7aL74h
         MSYS4qXcnvKxXxobDZ+XJzhhbjrqCYFtVFIyEMz2F4pQgliw5IJ8OUI3NqCCb1oD2J8Y
         oYVxwc1ZF41tEjXl+cIGIe2xzXzdUFQ70Md65jyIXavSThgOjAT9iMhp50gb4hJR+dRS
         52pw==
X-Forwarded-Encrypted: i=1; AFNElJ9Czx8m8e0e8EAhr0YH1TlWfWflx/jGqynOUjKDYKmWSTWCnYPJE1o/uEiAXlghx71jDLbGJoFaY0GwpA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+gJlvJyRcAQK2sLVP+cjxc7Tczb2IrGaIpCeerfK74EvChJ74
	mu+5O0aLJurWiyPT8/XFQuAfFIco4aRWJvdVi1lcqNbklYfCzD7ATIaeW/ppToFOvIVZMCX+5M0
	xMuH7LnPg9Ap7Pw7UOyuN51H5ZsMx4KtHyY1tbcGaE0rYgAm/JzR/077zPPVb42b0xQ==
X-Gm-Gg: Acq92OG0FcHbLPaJQ2rgL80wExXE1qDo1XplSg64PkC3/v/WeKqMSjKjL9qJ6j+1LCq
	kloiE0rq5kGP5TkVQPCJTdlJe77pFJHlYmWf5p615S7wNSyOyVfxua5yQSvC7esN2umavfwQM4A
	uADjq1E08HErVQsmAu8XMUC0f0czOcyboddlBbW3Nz03ps/CokDQN2P2HT6EvsWecXNqLlMY4om
	ZLPLfAk9ZhRboi1W/egw2kcv8utQqAWSHHCZuCqCjlMEgH4MA1vc//S39tywJlonV/70xdBWqWl
	SByla7Jaf/ttj3j2ZLdYQIyVSUOAOkMAXWNHv13zzSoa3uYBFr3ahsGn/8RD5gP1f4my5pJQ1Vq
	B54gDLaG/8Z3UILORcaL5NNCnQ9enwundS5JEF+YJ1iYARrVSNK9LpuVIEcYq84kILSJMVWTgrs
	sbg2CXZAv/AUL3ylG6xoqFPLUWZWiSL1Ur1D8=
X-Received: by 2002:a05:622a:558a:b0:50f:c54f:cc42 with SMTP id d75a77b69052e-51461c10c5fmr417520121cf.14.1778608075681;
        Tue, 12 May 2026 10:47:55 -0700 (PDT)
X-Received: by 2002:a05:622a:558a:b0:50f:c54f:cc42 with SMTP id d75a77b69052e-51461c10c5fmr417519631cf.14.1778608075022;
        Tue, 12 May 2026 10:47:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f60db4f1sm35364911fa.27.2026.05.12.10.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 10:47:53 -0700 (PDT)
Date: Tue, 12 May 2026 20:47:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
Subject: Re: [PATCH v6 4/6] media: qcom: iris: Add rotation support for
 encoder
Message-ID: <rcywvs7cf4u5dpgjygov3mov22dak5zkrv2iao7k4p5hi3u632@jap7la5ioqnd>
References: <20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com>
 <20251114-iris_encoder_enhancements-v6-4-d6d35a92635d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-iris_encoder_enhancements-v6-4-d6d35a92635d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE4NSBTYWx0ZWRfX43nzWQf4QP1d
 ANPpBHXemP0OzUYeXr0ceKLSZroFeGsrqTiCB19VHn5Gqh/H6UCAOSvDGc2MFSnbQZd7div4+d/
 AXKvT7O6fPyOFQQb79fbcO2jtYsn8UYdHMsVy+K4PmmGRbGY6aMQzIaE+Niccdx2cbRngqSVvPV
 YslcL5M2WH7PevO0MpIgTpZ1Z8BD2PjlJOPKW3EbN/fJ1Y6E6n6RVPibxNwPZXhI4NheF/eqBvs
 P+eLUCRWLo49Lbao7zjFZilBUlW+kMhstXZbmvNXHrLiWtY6nUut/b/86GVr8hK1BlQ3e1b2uWe
 zHZek3NCFxpPl5RJOlMk3spPGVFsgZ9WPW1PDU861jaR0/Lk/JsUsute43U9oVXNxBUkvktX66c
 MBwM1wYQ6L/U19GIWclFE5kl4PFLuVEji6tXCGcmh6HourxOayJB6KTmxQ1ig7qiTnZDI/g94QO
 ebMXCZvxTzrAR+wFC/Q==
X-Authority-Analysis: v=2.4 cv=GZ8nWwXL c=1 sm=1 tr=0 ts=6a0367cc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=jUYNYx_xJCf85QsOHrsA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: UHs-5z2bZHPCVK_RltGtekkfEiC-v33e
X-Proofpoint-ORIG-GUID: UHs-5z2bZHPCVK_RltGtekkfEiC-v33e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120185
X-Rspamd-Queue-Id: B641B526597
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61310-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, Nov 14, 2025 at 11:09:01AM +0800, Wangao Wang wrote:
> Add rotation control for encoder, enabling V4L2_CID_ROTATE and handling
>  90/180/270 degree rotation.

Drop space in the beginning of the line.

The commit message fails to capture, why do we need to handle the
resolution in addition to just handling the rotation property.

> 
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Co-developed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 34 +++++++++++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 41 ++++++++++++-----
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  9 ++++
>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 10 +++++
>  drivers/media/platform/qcom/iris/iris_utils.c      |  6 +++
>  drivers/media/platform/qcom/iris/iris_utils.h      |  1 +
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 51 +++++++++++++---------
>  9 files changed, 123 insertions(+), 31 deletions(-)
> 

-- 
With best wishes
Dmitry

