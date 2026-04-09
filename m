Return-Path: <linux-media+bounces-58292-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDnIM6zs1mkyJwgAu9opvQ
	(envelope-from <linux-media+bounces-58292-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 02:02:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7DD3C4E0F
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 02:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56FCB302335B
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 00:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8209BA34;
	Thu,  9 Apr 2026 00:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYe36Wo4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U0jiCta/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AF340DFD8
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 00:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775692965; cv=none; b=RjCrXXZf0C2fCYJ/77zZs/14uHRsuHuLOi8Qmlz8Wl9b4cCLHSVriBLO6CZwqGxJWc/eryxGjw5iRVN624CCiYnaSNbROh2xyQBVvM/uGXl+WmWjV31HqGzLZ0Uc1+Org8wRH2YCs9BlMtYBmuqxdTnBmcl6loilmcgoPxGQtYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775692965; c=relaxed/simple;
	bh=ehkgCXUDgiC81qj0KCx3ZmC1hcz2AZKxEwd+p/3Yeow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LfE5Mcl/c34h/3S+U7EhH9LNIN0iKy3g9Rcfrew474QGbcQ7UIWYhfi9wRQiWVVxsztdUjBwQrveRpbSMdPSk2a/2UiaOoUPLLXlRj9QuTDrJb4sMZ+NF9cQCiF0NUpUDJXhRo66JrV76eR0H20NUQ8OeNmOZVX5VFYqWkpbIIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IYe36Wo4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U0jiCta/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638Nc23V675581
	for <linux-media@vger.kernel.org>; Thu, 9 Apr 2026 00:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dOFDBkzWVMkeD/67GbWRtIyV
	rqN3JWMImuJe+M9N2gU=; b=IYe36Wo4fTV1l2lVgW7uVNzbPerOmN4Fpmq3qLHF
	LzaXH0dr54sRsBqgUa3K3fd8kMlVXdvAQqxyyelP+DND80Up4+aBWRthOojHcPl9
	jmuv0VyErAeiM2f9Zq+sSs4FL1RsHIjR5ic7DDtU40r+8b4CRYdKLXRFlz/UEHO8
	KQwlTTGLbQJvZiwLdkprMkPdH9wzGwWG+v3tB2iKwdNA/xfhTMXl8kh0pmKEbVk5
	YqJnpYBt+hjtQalepU9JzsYL56jQdKgQ5IxcFcvABaL5uACu0cSf0b08Ki7E8kgr
	0C99FUpHHd7BuoviSFeYeMrS/mJE6OkVXCc/Brb2dKlTBw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtbmsnws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 00:02:42 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4723af8974fso242174b6e.3
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 17:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775692962; x=1776297762; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dOFDBkzWVMkeD/67GbWRtIyVrqN3JWMImuJe+M9N2gU=;
        b=U0jiCta/HDrXdsaUHTFYJj8kf0TVTdaPmptQXIWtS93dWdfX1ioIlY4xMb12MzrLw4
         xo4PhB5LpYcw140VRP8MPXfnaXoO+b7lXxy/vFnHJl6Rq+f1//vPVaeCZrBbF5KJyIe4
         dToVH9YTGMM6USjHqcabVRUYPDFJ2My5DuqCQRrI0Y31wnkihO0a88//nJe4SA5srnfu
         eekJvFvYhMgLy+bpnfJ/ciAd/zw6DMDZcwbABn7PsdQpp7gD6EZPYcvbiA3cbhSqaEW2
         NrPLEnXLDJrG7e4ZcI+a5V3nO3PfJvxehyiBQtz/FSiBbGh85XVaYk5m61QG0MFUgBp5
         Ldsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775692962; x=1776297762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dOFDBkzWVMkeD/67GbWRtIyVrqN3JWMImuJe+M9N2gU=;
        b=If+rsAeEaChhGWHViMXUUT0f7vMDhXAwHhqI3+06Tc31dDq7Q/yMQiS/DXSGpfObw/
         j627FVYdbElZQFg4aIBNyXI8dvlne8YcQN9xKjUEeWja7nTcdefxvEWPMe6kqo7sCpfK
         o7M4L9+60UqsJHmqzP7v0EUWI3hUlKKFptPS1efxcNJTd6guPF1Gw3cKBOpF8WdlwaQ/
         HU1po5RXOD3BDqxNuNlT6iUI4Vxs78wvo/yRGDU2Wapz3yMBAbRWoxtLFqqNC83eGKg2
         9nPu2E0UXxPJrc/trr1QO7neYn1rtuEdGeZ7dLhwYdWhA457TlwaLNE6tp/38FaIBuMC
         xIiw==
X-Forwarded-Encrypted: i=1; AJvYcCXxLXD0mCaaOaFe51Rky3z0T6OcvaCV2dMuy48SQElO6iJMaiUCbCro8gl4LMQu7zM/KhMObtNP7FB6UQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdXkWSUTbDa+Mg6ww9jMb/LIYRLilNheAZCSO96khw5DW1UsPs
	nZDT5JGJtTokeiHu3bQu6daEcUjD1LM+R0uT8DJgKbo5T2o4MybxfIs7esY1feiAvJgsLlw4KXV
	tJJLz2XiIi/ytBldv/9zogcEazR+I6H4GhA1euarlqBO19YYFbMwjfawPSjXvXXSK4A==
X-Gm-Gg: AeBDies9Qrvi1eF9dXD8eVmGlDGiU5foF2k5YDHWdKdtpKoiXZEUwrh0EhimBbGMUWl
	mJZt6lIoC9ypQN9pAJKgeL5tPf4S/rPeJlu5EAcpFQeI8HhpKBDlx9CNsI3CPfWsnUq1DUM8uEt
	EeXSlUL34LR2wXmf0Ya0JuLhUZh45kxQ+uksIAPqpJ3ZMdOXAhnEw9UtrRzh0N+O7//CXAGx+Sh
	u0muSKGywgoGpadrp+e6ivmcorg3NMxvsFddxn8jhfKa2Xclme/SBbZEtMVvmvtd8Gb1+L6IRe2
	WO3SY80Bt7dJKRUqctlJyG+pxoXliRS0dhSAk11TC28i4MwIPTr2fHB1Q7lR3KnS9bFFUAu/i+2
	JnVtxOXSssWGgz/8s5tD5MbJEIuEzwAawrJ+uH3VpeFegjaTEUAts7kMd3Q2QOgggIq/hLT5P+W
	ykxNMjAG1Og69U61lmF27YZ7dATCUYKR5Ppiw=
X-Received: by 2002:a05:6808:c1a9:b0:467:ff72:95af with SMTP id 5614622812f47-477244992dfmr810745b6e.50.1775692961783;
        Wed, 08 Apr 2026 17:02:41 -0700 (PDT)
X-Received: by 2002:a05:6808:c1a9:b0:467:ff72:95af with SMTP id 5614622812f47-477244992dfmr810721b6e.50.1775692961283;
        Wed, 08 Apr 2026 17:02:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9cd43sm4939389e87.24.2026.04.08.17.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 17:02:38 -0700 (PDT)
Date: Thu, 9 Apr 2026 03:02:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/7] media: qcom: iris: add support for decoding
 10bit formats
Message-ID: <b4uqpepf6caojxe463izkmnrlayrdrgce6jusak33ewcr5yd4w@ukwbo7zfphn2>
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
X-Proofpoint-GUID: QG-QIHJQlKBYKQxz5Mv2bntSlYFixjpL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDIyMiBTYWx0ZWRfX9TOdoO3nUh1y
 8sdUjm+/uanzM7xEl2tQo0MEMQgeW5K8VwCRIq3kIzidN6WHLDLgsvovyi+a9Z+NadAc6EZ0zlo
 bGGI16tcE7ohJLOH3rli2B8Y6OixYZNBxTkmM/HXIQ5gtkySGgc8Ut2Nnpqwg5k4Y5oi8nkjcms
 cd+kF4bxONrrCiv8erzatBc1lUBD/bA5zbFWgw5DyYh+7pwO/epIQYO5UlimkXZYJP697r+PZY0
 VT6RlB0FElbgclusvhZwQz+wJo0+i5FVP3gYNwORm+v1kRduGWqaRHf73SWMEJFxGEPJbz4fia2
 +3KaEoVXJ2xuE5U7UU1pA7RgUXKFuT3P/pIrry5I/h2/ZKyqNEifN8R1+cnsIgPNvJOub/bekP5
 T0claqH8o14pndn+YMmwp264oZ1FYLJsaePZKvnu28Dn9SIq71Q9KyTkK8GOQuE6DdwQR9wCKiP
 JAqBGXr0NlAKWL5JWkA==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69d6eca2 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8
 a=KKAkSRfTAAAA:8 a=q4nUtBw6PG95HCND5SkA:9 a=CjuIK1q_8ugA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: QG-QIHJQlKBYKQxz5Mv2bntSlYFixjpL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_06,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080222
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58292-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,linaro.org:email,qualcomm.com:dkim];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7A7DD3C4E0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 06:43:53PM +0200, Neil Armstrong wrote:
> This adds the plumbing to support decoding HEVC and AV1
> streams into 10bit pixel formats, linear and compressed.
> 
> This has only been tested on SM8650 with HEVC, and was inspired by
> Venus and the downstream vidc driver for the buffer
> calculations and HFI messages.
> 
> I was unable to get 10bit decoding working with Gstreamer
> and ffmpeg, but v4l2-ctl works with:

Any particular errors? I assume Gstreamer needs to be taught about
Q10C. But P010 should (hopefully) work.

> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt-video=pixelformat=P010 --stream-mmap --stream-out-mmap --stream-from-hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.P010
> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt-video=pixelformat=Q10C --stream-mmap --stream-out-mmap --stream-from-hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.QC10
> 
> The non-10bit decoding still works as before.
> 
> With Big_Buck_Bunny_1080_10s_30MB reencoded in 10-bit profile
> and tranformed in v4l2 header format with [1]:
> ffmpeg -i Big_Buck_Bunny_1080_10s_30MB.h264 -pix_fmt yuv420p10le -c:v libx265 -crf 28 -x265-params profile=main10 Big_Buck_Bunny_1080_10s_30MB_main10.h265
> /path/to/mkhdr.sh Big_Buck_Bunny_1080_10s_30MB_main10.h265 raw Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr
> 
> The frames correctness has been verified buy displaying them
> via Vulkan DMA_BUF import, including QC10C and QC08C.
> 
> The support is probably incomplete for other platforms and
> I'm unsure what's required to conform to the V4L2 M2M stateless

stateful

> spec, especially since AFAIK the decoder doesn't support
> decoding 10bit streams in 8bit pixel format, thus the RFC state.
> Review is welcome !
> 
> [1] https://github.com/superna9999/pyv4l2compliance
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Neil Armstrong (7):
>       media: qcom: iris: add QC10C & P010 buffer size calculations
>       media: qcom: iris: gen2: add support for 10bit decoding
>       media: qcom: iris: add helpers for 8bit and 10bit formats
>       media: qcom: iris: vdec: update size and stride calculations for 10bit formats
>       media: qcom: iris: vdec: forbid g_fmt while waiting for first source change
>       media: qcom: iris: vdec: update find_format to handle 8bit and 10bit formats
>       media: qcom: iris: vdec: allow decoding into 10bit format
> 
>  drivers/media/platform/qcom/iris/iris_buffer.c     | 81 +++++++++++++++++++++-
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 71 ++++++++++++++++++-
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>  .../platform/qcom/iris/iris_hfi_gen2_response.c    | 35 ++++++++--
>  drivers/media/platform/qcom/iris/iris_instance.h   |  2 +
>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  3 +-
>  drivers/media/platform/qcom/iris/iris_state.c      |  6 ++
>  drivers/media/platform/qcom/iris/iris_state.h      |  1 +
>  drivers/media/platform/qcom/iris/iris_utils.c      | 16 ++++-
>  drivers/media/platform/qcom/iris/iris_utils.h      |  2 +
>  drivers/media/platform/qcom/iris/iris_vdec.c       | 70 +++++++++++++++++--
>  drivers/media/platform/qcom/iris/iris_vidc.c       | 14 +++-
>  13 files changed, 285 insertions(+), 18 deletions(-)
> ---
> base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
> change-id: 20260408-topic-sm8x50-iris-10bit-decoding-074c3ac7975c
> 
> Best regards,
> --  
> Neil Armstrong <neil.armstrong@linaro.org>
> 

-- 
With best wishes
Dmitry

