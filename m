Return-Path: <linux-media+bounces-64075-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lzFYBtbfJWoWNAIAu9opvQ
	(envelope-from <linux-media+bounces-64075-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 23:17:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E92F16519D2
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 23:17:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=But72Gez;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="fX5Zc6r/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64075-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64075-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E95B30022EC
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 21:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 957783203B6;
	Sun,  7 Jun 2026 21:17:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FC92EEE69
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 21:17:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780867023; cv=none; b=R4QqR+6RlAcLBZeNlTM5/xa0IeKkoy86MekLAkYnCY17tGFYx6Ntly2vCRnpwW5f5pbP1dpjminsmOrkJ0m1QwTzz4NJYiVrUSSAgB/YG2nq1YanwSEKjGi/l3aCUwZ8eS1h3xnxxgN2zP9YPbrMqGMgN///pzen8Ulo9Or/Qw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780867023; c=relaxed/simple;
	bh=K05rDR/kI8f6Lkx/1x5sjLiZhZshxFfSfklW9pxpF8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SqLj+H1/eDvXvSEurB1Je2EwykHetLDLDfsA1LZ8H3Xf31Qj6a3PC5lpYQadIOuBU1WBmEyljvOLF4jHuZpujjpkfiAii/71XDPoAPQN9AAJUO9AwQzEC1mGmZKfXgOUCfc2hZ6M+2BvYgOLqHzE4vbyBH8+Mhqrl7PDPvOcKLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=But72Gez; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fX5Zc6r/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EmJGr888723
	for <linux-media@vger.kernel.org>; Sun, 7 Jun 2026 21:17:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b7j6fWH2ZTuBoYf3DikwUXDF
	crJUfkjfuq65I6UYILE=; b=But72Gezh3J8O2kC7pcCgCeUO5B83TzWPdicivQA
	g19bqR3eLMsg6WosHQ36cxQOtkV5o6n+puHlydTYJg9M+usFF2y/WDRnVMD/m5tC
	LI4wPKcHTMp5c+znAZb4hadOrDuF1f60I6rywu0fRAkeKosyfnwZd9Uxr9HHTDfW
	KwRXI8Xq1Xnr7nDD0TVtDmCQLFeb04rNMSgc4ZAwJ8OoalbIu330DN5gPgPmsbZa
	RSKO85OmfXjzkldAeL90tkekubBWeWcWRwQv6CEt6YLnpTotwTGNzIuU+MUT/vYP
	8eyF/eliV3HLq6qYlVZMJ2ptEHT30V8N/QOm0w4exF9mDw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrcu5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 21:17:01 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-59eb9191180so2631050e0c.1
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 14:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780867020; x=1781471820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b7j6fWH2ZTuBoYf3DikwUXDFcrJUfkjfuq65I6UYILE=;
        b=fX5Zc6r/Oh1mwVQawEJISygcP40wRFIw3XowHuTduIdxR1AMfR0yoInw7HOtvWNAEt
         UfvcE6rSmD7XFbXJJSAShi35ilY1MMAD9W3NlpVf7MoeKi4KMFDJcL1K8UqEKZteuSKy
         dRVnZHzlQAlT8QyJ3LwZSLJYryj8GCnR6UJAU3gQFDlQEudID5RjLABibXQ+YDGoOgHe
         9NDKccf42CBDSMDnD9cFbYSFROkuqNXiu1anGzDSZhmH2yB/Qvl2DloRoPiWOBDA2UH9
         oLWe2nbDmjFKQq4g0oWmK7RWLfXj/eNU6aV9NgHioJC7hKW+k034O+WChYP4k9W+KnA9
         N9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780867020; x=1781471820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7j6fWH2ZTuBoYf3DikwUXDFcrJUfkjfuq65I6UYILE=;
        b=M29aRr9C1DpyKpQM3CE9CKllR1QYDHryHAF94a7XWyF0x8lwTj87Z4JkLF2NnOdSdX
         RmlFS5e6+S7kc5kFHiHWqur9Lr4tWmm+U8oJts5h2eSBhFNemcf8j4DpikrSXHpxiNDM
         ft/nMPY8uRdFOmSq3KARtAAfccTWFQwuD90WuNrb2LsWYP+2JcTxHwNkpA/pjHVRoe03
         B5JNJ4pnozLHrOAuuN6Vy/b2bcKfUsxLK2paSZB7wdYBznyoxLu8nxoDQZi1Zq7Jm0YJ
         M+TLERdSgEHA6Hi+Ze/1+7qIlhYS3oNWkRoV3s3swr/sB0dsRLexMjEJHfBZo+R/LnEM
         /cRg==
X-Forwarded-Encrypted: i=1; AFNElJ/objZCf8uKwaPgF3fHfaFiiPfOt9iS9GXyh5FyK/OeDjH7WI4J8W4bgRb6khYSo11nRVs72rbK0EAuxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5HdcjJRioxIs99yTenXwD2ePO/vlOk++NsagFxo99MdPFhF6B
	lJTvTrCGtj0m7EHB1aA0xezmaJ1CTbMVnpRXrV1aBxgt6WxUc7e9nfZjjhXZ8Nz4xYBxW9W/2v+
	5sS6qV2B9X5Z+HolhfFXxTzoYsNNERqeBKTxcpPThsHq3sx9Tmo44ijFKWT30YCU80w==
X-Gm-Gg: Acq92OGSIigXjSC6DDoC8r7GRdj0aXF7bYMJpfYMU1TAZ0/2dHSVmarcP5NBmyx2BSN
	fOWtCDh1PZ53nu9HjuRtb9mBrnQiakEzh84GrmiKCqWWZW5LPvN2fyTtqExWnfE6wyXb6Voojua
	0a+VjmPML3W1ySgWL2zh5ojSEUfGQZhuAnEMnFslYA9mBdynN4zFzeJprJu38CXYYuEsOEU53MY
	8leFPHSVSGrZpQcuPmknCpUT/Zxxj+SjOCFcBgDseamk+xShimON0Bn5pX3CFlTSk5BrDrrvaK0
	f2qCw3EF4Uh0qHJ1ewAksnP4IiBHH1EDh17o/FcLRLWygh9k1ywTdFlDyjyn1QXXuasaXvK30Sw
	oYDZaRPrW1lCsrdL82d/j6WNWZaN7DlOVWhgAswSNffZiuyP9OgI+TXMPtFIsbUT002gi83lIuU
	R+E4GgoRN6J7qRXvVnUwVVOHyflBbpg6AhviNyms2Z8MOb8Q==
X-Received: by 2002:a05:6102:4191:b0:634:a573:c097 with SMTP id ada2fe7eead31-6fef36392d5mr4964763137.13.1780867020074;
        Sun, 07 Jun 2026 14:17:00 -0700 (PDT)
X-Received: by 2002:a05:6102:4191:b0:634:a573:c097 with SMTP id ada2fe7eead31-6fef36392d5mr4964739137.13.1780867019635;
        Sun, 07 Jun 2026 14:16:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9040fesm3273761e87.31.2026.06.07.14.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:16:58 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:16:56 +0300
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
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        robin.clark@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 13/15] accel/qda: Add DSP process creation and release
Message-ID: <5gz4m3mfsnlwmyfiqtl34rgt7krgo546l6kslux2ibyinep3td@zs7xjxrk557o>
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-13-b2d984c297f8@oss.qualcomm.com>
 <w44qzw2ryg7bpbte3hegopmtkfjd2gby532rdjarm4i3tylpv2@2rmruincfdgc>
 <568987b0-6f54-4b51-b1c0-416435e3f564@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <568987b0-6f54-4b51-b1c0-416435e3f564@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNCBTYWx0ZWRfX7VzpyCw7q8tF
 RW0Hn8CYjAmXXtEFTe7aMUOB+Ra2KRq+o4122ujG0YdmO9623TvlBCLakNA5tDOE8tBLeB4XhAB
 IYus2Xn9CIbYzQ7eAj2lwNUsBecA6QDXuTM+x4phLURvrpT5xkY05pXb2LGHP50MDIexMoOC+K+
 QjNCRUiSuWPwPBCR2HthoV5esgwkwbJFA2tY2Bqc+8b6iqgJAsTotNPLNnY8U6Mwe1R7GNVHNoM
 1l2cD9jd/CN5tmKkCZsu/OZLIW7O/Vih86wIn3oyLD6hB5r2YA4xGHvIlK1u3joV+SYUdcLzSUi
 wIy0OgvRHbqrZLeB0l0JbH+90jhbrO84dEDuZA9WSFJcQdvbwQnSLUtknIlV0h5ebwQ3DGSzWGZ
 DEIm0haUsUcjdRNKXHFspKyAJLOeIkK4TFn5gOZIzD5UfGU1TytQOnD0IHOqcSozAyrwTkVLaP8
 pl2m5RRlTcFNND4SEEg==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a25dfcd cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=DtFIhfJECZ_mmoY6xYkA:9
 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: suZ5Yna_z0ryDTQ0Mt86-hTaJ5-pBJEa
X-Proofpoint-ORIG-GUID: suZ5Yna_z0ryDTQ0Mt86-hTaJ5-pBJEa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070214
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64075-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,quicinc.com,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E92F16519D2

On Thu, Jun 04, 2026 at 10:47:13AM +0530, Ekansh Gupta wrote:
> On 20-05-2026 19:30, Dmitry Baryshkov wrote:
> > On Tue, May 19, 2026 at 11:46:03AM +0530, Ekansh Gupta via B4 Relay wrote:
> >>  
> >> +/**
> >> + * qda_ioctl_init_create() - Create a DSP process
> >> + * @dev: DRM device structure
> >> + * @data: User-space data (struct drm_qda_init_create)
> >> + * @file_priv: DRM file private data
> >> + *
> >> + * Return: 0 on success, negative error code on failure
> >> + */
> >> +int qda_ioctl_init_create(struct drm_device *dev, void *data, struct drm_file *file_priv)
> >> +{
> >> +	return fastrpc_invoke(FASTRPC_RMID_INIT_CREATE, dev, data, file_priv);
> > 
> > Where is INIT_CREATE_ATTR, which you described earlier?
> INIT_CREATE_ATTR is used while `sc` creation so the DSP considers the
> request is coming with some attributes, the ioctl functions are going to
> be the same in both the cases, so keeping it unchanged and the decision
> is taken while `sc` is getting created.>

Ack, I missed it earlier.


-- 
With best wishes
Dmitry

