Return-Path: <linux-media+bounces-53253-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHnOHrfenGm4LwQAu9opvQ
	(envelope-from <linux-media+bounces-53253-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 00:11:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 397F417EF59
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 00:11:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE360308871A
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 23:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9171E37AA97;
	Mon, 23 Feb 2026 23:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBXLf8Bi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C4ywfKQm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C651D37E2EE
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 23:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771888263; cv=none; b=UNXC1tz3lRQ3vvXsMVALqU2B/gPxM5sMibL3DN/O1gdujCCqTE//QKnU79cK3CrViQqYQxjHDYktVE1UgqmMy3aZ1ALW6iUgwLWX8rPn97r36pprOV3Bv65s6esfsGcMuuaTNTxBrqHnybRvDPOCvcYvNfLtVYDqK+GwB6OCvA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771888263; c=relaxed/simple;
	bh=WnGKdIUcYL7z9JFmovjMu4/dxU9o18kWSrvICnvCT0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6Zof8uEZT9OPbpFlc/F0bzEK2PiqjDbyJe9wQcv+9YnQX3WtTe6CdWVsYspWhSZqLEEDLBmUnKzIpw6lqlZ9SKyUVheKW2UObFoZitGBb/KNcuW1Vw1C8EqSgsP5l1pOUyWIrbMbUGZ8fwYuI5beqXqc7gcICCitwBawF2WjH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBXLf8Bi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C4ywfKQm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGRHWU1640476
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 23:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lRbhlI+X+C8SmlSdJaBzOExh
	KR0OP/6AiGSM8L0TCJc=; b=RBXLf8BiegXOkwPWtRQtYtFfyJL0qhEWs0+qc8Ho
	lKN8iHF1+NSMTDLibV+MzhQakKa8rdbj4QhiPBEmIMROjSxAdg1XXXUZSSzrIJkr
	UdMrE/uhwR7ZR3igzg1Dx5IMolK0jXdR4a2WNHo4wzP0mGEGAquUCev4V98a85n1
	1emQXUWMOSE4bdTsdE3UooCiyJnSlcFLv73nLZ7CBtQrQes04NnWlWstwELTYOoC
	j0bkyDlleB3TdsVrrcF+qi0tguBcCJ2V+CU1ta6f7Myx9eb56Wg6vKDSXGO2VnWr
	nOnhXQxbw0hlPe/Dct0K42W5mqmAvoFzn2zRusRosOzgzQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8s3w5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 23:10:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71304beb4so3391165585a.3
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 15:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771888259; x=1772493059; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lRbhlI+X+C8SmlSdJaBzOExhKR0OP/6AiGSM8L0TCJc=;
        b=C4ywfKQmljoNsDBBM4JLNFlooneP53D2eNwxmJUMMfFW3LKSeaLPiMzLrBv9kB8pfj
         9XFjoCq7dNijtzBqYfZGT5A/FDAvRTjWzMULbuLlaynQ7hBlAQhSawFUYobAMvme2SFK
         Cm39qcQWcbJTSsmP68ZE3fsJbGAcSF22KRUmd17CcBPTJ7FpHKnKoyJd3AqhbDVfUGlk
         LqfyalJ3DhnOtpZcA3Rdjam9cxhV8GZxMHZDeE3XI3iSiTbzufmKVdbx2673sKdubDO+
         jhH3Pd4Q4tg0w6qxr5xcGkqXxeufckXW1YfXyhu9CHPopceJ5KmCAjAZ3A4bX+Y2CO+L
         PZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771888259; x=1772493059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRbhlI+X+C8SmlSdJaBzOExhKR0OP/6AiGSM8L0TCJc=;
        b=iZ99bdPykh5ejmkD6ChRZxCj1kRxaeJDkl+99ZP7juK69klh6MF0QEpW+Ko7oKqzyP
         4GfICSy0jKUdSP+9fN0RDwldDP51VXlvhjCkIDkMFXpAPONq5LBbli/hlwSzV11Q1wtN
         8WNmdlb2on8VnsYgzPwA136ns9Q872YkZWfV7uV1sKAwE2bZRd9GmTql1V3dw7+UKvrg
         mZCTmQjBt2uVAoBVRqrP6lMuA8S4OIDudHoGQswolLsH1BY/I56G/1gBq/rvi83lclPl
         FP4dvtXDpcYl1DFxD3mkmSTf4IKdPk+5cLQ3xXaMApKqXuYWbGUsw9+IvNV9/dTZSfxT
         seOA==
X-Forwarded-Encrypted: i=1; AJvYcCUFGJh9mHX8JwPqygbw5JMbsJGjK2ktF7UMWThaRe5mlAsP0YVamtnIM3g7PTp2VtE9k8baIbGLZQpOLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh5wZD+kPsAlpg1xmf8wBxGWiNNIws8Tj0ZDV/8IqPqJ2WZyi5
	/I6stVxFEQgE1NGUEOXSJF/eSfnBUyNw1jkVLtQF+gCAq0bBMt6Q11VhN+C7F/ndV2JlaTYdNeq
	H9cI8PvCGdaY7BmlySAyZhdgNtOvnKCcYraZ+HURewxHaY87aC25IKZtkckQriP+oXA==
X-Gm-Gg: AZuq6aIuYFqE4TKs5Gio8lPX4aa+3pUpVmHKDUcO1PpsLRsNR3Hbxet7nImDaRyNpWt
	ywhpLZUKyZaAOoL/XAQL0FgSZU/DVWIYGeIuTQG/PTWGJTAgR/y5WAIomU1cF9e3vIn7p0/hxrt
	LIJOGYJgSnSlgjZSnFcGs/lbCYSdqN7aALlL9IEaHLKR0iARLuR1R5psu1HayTqaJVF9oYGkImx
	oxdT+lCjzN58Q+yyPNir5SgYy+FVVuj2kyZYMuFE7oLetZnl2vJCQ8Z2SKRGDBwh6X68Uf9gq/X
	udbLNY6Vs0fq8sQ9GMC2EnYdHdU1bSei26j8gyev1uM/589f10eQk3BMpQDQYDkfIOGueYwmo24
	P1yLQYtw0WIweGiKXV58uV6UiygG0rqOADbc1Ljb5KcdyVJsQdAmXiTgAm6KZm+VO1lIb/kHhrJ
	yHuN/I32n4It+0EIspm6XX8Iz8CXENmIg1CuY=
X-Received: by 2002:a05:620a:f04:b0:8cb:3a1d:79fa with SMTP id af79cd13be357-8cb8ca76abemr1403755085a.58.1771888258857;
        Mon, 23 Feb 2026 15:10:58 -0800 (PST)
X-Received: by 2002:a05:620a:f04:b0:8cb:3a1d:79fa with SMTP id af79cd13be357-8cb8ca76abemr1403750985a.58.1771888258310;
        Mon, 23 Feb 2026 15:10:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb4760csm1835383e87.77.2026.02.23.15.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 15:10:57 -0800 (PST)
Date: Tue, 24 Feb 2026 01:10:55 +0200
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
Subject: Re: [PATCH RFC 14/18] accel/qda: Add FastRPC dynamic invocation
 support
Message-ID: <57we5xzyxvctwzgggqpemlqf7q524mbaqnczqxua6eaehqv6vw@bq4raxwkbava>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-14-fe46a9c1a046@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-14-fe46a9c1a046@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 1fZsdNDuv5bFyhZtpqpPxTzyxPwdCPDm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDIwMiBTYWx0ZWRfXxbhPXcuDuVum
 PwQHPRRuD7WInfRH2ZSxj9PmgEgPh8v1e5CIfxZmiSDJGLLA6fAXREouJGenCFPJrQSTmj4Fx3v
 GF/ZiTEp44BNvEsuMYsjsOTNiU5HE3OfE6x6vAMBgxVvL4P3fVD2spPY4Aq+GFgRioKvgfxPSlB
 EdUvZPB/0sMM+j+rDoW6fYRKyNAPX9EzV25rmpkdPzvSp+uUjh/k6wwKlrIHkTs/7PF8VfoSchZ
 hJvrbHhhQ8uwp/MARVGFgYsgNV4UEliCM3w9MUXqeXPIZMYbvAW5/wfaIU8B7QeVvSSkirj5aQR
 1ktlMHDO80ZWy30DDNyzpXBB3DMwvEWlnvAp1QG68YyYg1tU7XeEhR6H4VL+0FQCBcjr8LP+YZ+
 RaxPoWFl1dBTICehnDOAxa9PnNIC9plY93KQm7ujY9E2tGv9vMEYX6hXlWmWRzAuYCOKsjXkQfF
 JudgA7V7hAvgJPfCoWA==
X-Proofpoint-GUID: 1fZsdNDuv5bFyhZtpqpPxTzyxPwdCPDm
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699cde83 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=nKshNOZNSeXGH1bP4e4A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230202
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53253-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[inv.sc:url,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 397F417EF59
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:39:08AM +0530, Ekansh Gupta wrote:
> Extend the QDA FastRPC implementation to support dynamic remote
> procedure calls from userspace. A new DRM_QDA_INVOKE ioctl is added,
> which accepts a qda_invoke_args structure containing a remote handle,
> FastRPC scalars value and a pointer to an array of fastrpc_invoke_args
> describing the individual arguments. The driver copies the scalar and
> argument array into a fastrpc_invoke_context and reuses the existing
> buffer overlap and packing logic to build a GEM-backed message buffer
> for transport.
> 
> The FastRPC core gains a FASTRPC_RMID_INVOKE_DYNAMIC method type and a
> fastrpc_prepare_args_invoke() helper that reads the qda_invoke_args
> header and argument descriptors from user or kernel memory using a
> copy_from_user_or_kernel() helper. The generic fastrpc_prepare_args()
> path is updated to handle the dynamic method alongside the existing
> INIT_ATTACH and INIT_RELEASE control calls, deriving the number of
> buffers and scalars from the provided FastRPC scalars encoding.
> 
> On the transport side qda_ioctl_invoke() simply forwards the request
> to fastrpc_invoke() with the dynamic method id, allowing the RPMsg
> transport and context lookup to treat dynamic calls in the same way as
> the existing control methods. This patch establishes the basic FastRPC
> invoke mechanism on top of the QDA GEM and RPMsg infrastructure so
> that future patches can wire up more complex DSP APIs.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/qda_drv.c     |  1 +
>  drivers/accel/qda/qda_fastrpc.c | 48 +++++++++++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_fastrpc.h |  1 +
>  drivers/accel/qda/qda_ioctl.c   |  5 +++++
>  drivers/accel/qda/qda_ioctl.h   | 13 +++++++++++
>  include/uapi/drm/qda_accel.h    | 21 ++++++++++++++++++
>  6 files changed, 89 insertions(+)
> 
> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
> index 3034ea660924..f94f780ea50a 100644
> --- a/drivers/accel/qda/qda_drv.c
> +++ b/drivers/accel/qda/qda_drv.c
> @@ -162,6 +162,7 @@ static const struct drm_ioctl_desc qda_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(QDA_GEM_CREATE, qda_ioctl_gem_create, 0),
>  	DRM_IOCTL_DEF_DRV(QDA_GEM_MMAP_OFFSET, qda_ioctl_gem_mmap_offset, 0),
>  	DRM_IOCTL_DEF_DRV(QDA_INIT_ATTACH, qda_ioctl_attach, 0),
> +	DRM_IOCTL_DEF_DRV(QDA_INVOKE, qda_ioctl_invoke, 0),
>  };
>  
>  static struct drm_driver qda_drm_driver = {
> diff --git a/drivers/accel/qda/qda_fastrpc.c b/drivers/accel/qda/qda_fastrpc.c
> index eda7c90070ee..a48b255ffb1b 100644
> --- a/drivers/accel/qda/qda_fastrpc.c
> +++ b/drivers/accel/qda/qda_fastrpc.c
> @@ -12,6 +12,16 @@
>  #include "qda_gem.h"
>  #include "qda_memory_manager.h"
>  
> +static int copy_from_user_or_kernel(void *dst, const void __user *src, size_t size)
> +{
> +	if ((unsigned long)src >= PAGE_OFFSET) {
> +		memcpy(dst, src, size);
> +		return 0;
> +	} else {
> +		return copy_from_user(dst, src, size) ? -EFAULT : 0;
> +	}

Nah, it's a direct route to failure. __user is for user pointers, it
can't be a kernel data. Define separate functions and be 100% sure
whether the data is coming from the user (and thus needs to be
sanitized) or of it is coming from the kernel. Otherwise a funny user
can pass kernel pointer and get away with your code copying data from or
writing data to the kernel buffer.

> +}
> +
>  static int copy_to_user_or_kernel(void __user *dst, const void *src, size_t size)
>  {
>  	if ((unsigned long)dst >= PAGE_OFFSET) {
> @@ -509,6 +519,41 @@ static int fastrpc_prepare_args_release_process(struct fastrpc_invoke_context *c
>  	return 0;
>  }
>  
> +static int fastrpc_prepare_args_invoke(struct fastrpc_invoke_context *ctx, char __user *argp)
> +{
> +	struct fastrpc_invoke_args *args = NULL;
> +	struct qda_invoke_args inv;
> +	int err = 0;
> +	int nscalars;
> +
> +	if (!argp)
> +		return -EINVAL;
> +
> +	err = copy_from_user_or_kernel(&inv, argp, sizeof(inv));
> +	if (err)
> +		return err;
> +
> +	nscalars = REMOTE_SCALARS_LENGTH(inv.sc);
> +
> +	if (nscalars) {
> +		args = kcalloc(nscalars, sizeof(*args), GFP_KERNEL);
> +		if (!args)
> +			return -ENOMEM;
> +
> +		err = copy_from_user_or_kernel(args, (const void __user *)(uintptr_t)inv.args,
> +					       nscalars * sizeof(*args));

So... You are allowing users to specify the address in the kernel
address space? Are you... sure?

> +		if (err) {
> +			kfree(args);
> +			return err;
> +		}
> +	}
> +	ctx->sc = inv.sc;
> +	ctx->args = args;
> +	ctx->handle = inv.handle;
> +
> +	return 0;
> +}
> +
>  int fastrpc_prepare_args(struct fastrpc_invoke_context *ctx, char __user *argp)
>  {
>  	int err;
> @@ -521,6 +566,9 @@ int fastrpc_prepare_args(struct fastrpc_invoke_context *ctx, char __user *argp)
>  	case FASTRPC_RMID_INIT_RELEASE:
>  		err = fastrpc_prepare_args_release_process(ctx);
>  		break;
> +	case FASTRPC_RMID_INVOKE_DYNAMIC:
> +		err = fastrpc_prepare_args_invoke(ctx, argp);
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/drivers/accel/qda/qda_fastrpc.h b/drivers/accel/qda/qda_fastrpc.h
> index 744421382079..bcadf9437a36 100644
> --- a/drivers/accel/qda/qda_fastrpc.h
> +++ b/drivers/accel/qda/qda_fastrpc.h
> @@ -237,6 +237,7 @@ struct fastrpc_invoke_context {
>  /* Remote Method ID table - identifies initialization and control operations */
>  #define FASTRPC_RMID_INIT_ATTACH	0	/* Attach to DSP session */
>  #define FASTRPC_RMID_INIT_RELEASE	1	/* Release DSP session */
> +#define FASTRPC_RMID_INVOKE_DYNAMIC	0xFFFFFFFF	/* Dynamic method invocation */
>  
>  /* Common handle for initialization operations */
>  #define FASTRPC_INIT_HANDLE		0x1
> diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
> index 1066ab6ddc7b..e90aceabd30d 100644
> --- a/drivers/accel/qda/qda_ioctl.c
> +++ b/drivers/accel/qda/qda_ioctl.c
> @@ -192,3 +192,8 @@ int fastrpc_release_current_dsp_process(struct qda_dev *qdev, struct drm_file *f
>  {
>  	return fastrpc_invoke(FASTRPC_RMID_INIT_RELEASE, qdev->drm_dev, NULL, file_priv);
>  }
> +
> +int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_priv)
> +{
> +	return fastrpc_invoke(FASTRPC_RMID_INVOKE_DYNAMIC, dev, data, file_priv);
> +}
> diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
> index 044c616a51c6..e186c5183171 100644
> --- a/drivers/accel/qda/qda_ioctl.h
> +++ b/drivers/accel/qda/qda_ioctl.h
> @@ -63,4 +63,17 @@ int qda_ioctl_attach(struct drm_device *dev, void *data, struct drm_file *file_p
>   */
>  int fastrpc_release_current_dsp_process(struct qda_dev *qdev, struct drm_file *file_priv);
>  
> +/**
> + * qda_ioctl_invoke - Invoke a remote procedure on the DSP
> + * @dev: DRM device structure
> + * @data: User-space data containing invocation parameters
> + * @file_priv: DRM file private data
> + *
> + * This IOCTL handler initiates a remote procedure call on the DSP,
> + * marshalling arguments, executing the call, and returning results.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_priv);
> +
>  #endif /* _QDA_IOCTL_H */
> diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
> index 4d3666c5b998..01072a9d0a91 100644
> --- a/include/uapi/drm/qda_accel.h
> +++ b/include/uapi/drm/qda_accel.h
> @@ -22,6 +22,9 @@ extern "C" {
>  #define DRM_QDA_GEM_CREATE		0x01
>  #define DRM_QDA_GEM_MMAP_OFFSET	0x02
>  #define DRM_QDA_INIT_ATTACH		0x03
> +/* Indexes 0x04 to 0x06 are reserved for other requests */
> +#define DRM_QDA_INVOKE			0x07
> +
>  /*
>   * QDA IOCTL definitions
>   *
> @@ -35,6 +38,8 @@ extern "C" {
>  #define DRM_IOCTL_QDA_GEM_MMAP_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_GEM_MMAP_OFFSET, \
>  						 struct drm_qda_gem_mmap_offset)
>  #define DRM_IOCTL_QDA_INIT_ATTACH	DRM_IO(DRM_COMMAND_BASE + DRM_QDA_INIT_ATTACH)
> +#define DRM_IOCTL_QDA_INVOKE		DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_INVOKE, \
> +						 struct qda_invoke_args)
>  
>  /**
>   * struct drm_qda_query - Device information query structure
> @@ -95,6 +100,22 @@ struct fastrpc_invoke_args {
>  	__u32 attr;
>  };
>  
> +/**
> + * struct qda_invoke_args - User-space IOCTL arguments for invoking a function
> + * @handle: Handle identifying the remote function to invoke
> + * @sc: Scalars parameter encoding buffer counts and attributes

Encoding... how?

> + * @args: User-space pointer to the argument array

Which is defined at...?


Can you actually write the user code by looking at your uapi header?

> + *
> + * This structure is passed from user-space to invoke a remote function
> + * on the DSP. The scalars parameter encodes the number and types of
> + * input/output buffers.
> + */
> +struct qda_invoke_args {
> +	__u32 handle;
> +	__u32 sc;
> +	__u64 args;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

