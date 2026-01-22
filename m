Return-Path: <linux-media+bounces-51346-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ID8DNCELcmmOagAAu9opvQ
	(envelope-from <linux-media+bounces-51346-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 12:33:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AE466108
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 12:33:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C2ADD704ABF
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 11:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7AE4418F9;
	Thu, 22 Jan 2026 11:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="atDu5xow";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hGC+U0Vf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F010643E4A9
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 11:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079879; cv=none; b=pMXFi0tnPdDvve69IbM1KrfGK+zkLaFm9U1Jxv6tw9jWa+a8YgqmNS0ZUjP881XKO9kunS3Dr4eu1Su2A7GIHN4uxbLSigSiTHOoEbXgale/IRogefjhR2mVva+dKuQPv3K3GBrqUQ6fqB0jcYm3kkJ+QNYyVKBmA+uUAkAzkfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079879; c=relaxed/simple;
	bh=fkAYeCgBvo99N2Nt9+mGGBZC9j2ppYQ5lmM3o52fWq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TJMejYycwF0NBOs5m91OQX6r/fFNfofFi1jJHTgQXOPY7JM7SVEfMGxbyFe2DVxt1qFKJbkUstvuhB4Lx1o3McNbxWGUvePvY8BpCQGxbA7cen++B1yZG4rck9Vipw0fC19HqjEoIMPzB7Tq7Y419CivY/UNe8gePFUqVCbOFe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=atDu5xow; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hGC+U0Vf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M7rAdE2275478
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 11:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t0KlvkM5KQlhi9X1NhLsO3/hA2b2nzw1RRo2lI06OH4=; b=atDu5xowozGMAuUZ
	GzTtRyhJQ2wqIsuDLs7r9ve+/Ed1V5cy9CzphuYN01LXzxL/RVZWp4hu/nDoNk+3
	TCwhJUsz/ORIjI16HRuDW8xFabYsz0DgkWTdvrmUoG3JvWhiPOnKAqDNHq2IyyuJ
	xaSQh2qgg2FJDegmMLs37HqsKzmJSPCHkS7JrjolG/zBbpOUXKFvUch7uQr6m02/
	NAVlITpNvBiNOW8BZKxFktIr8KWt1xipbBpL493HGz7UoLElGipusI/zFLkMACmP
	Ae3W/XJWF+f4gCBe8MKE130TmCtczKSyeknY1copj2+dgEa5R1cdbTkVqLPULtkE
	gG3xgw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7fat22c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 11:04:34 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5662fd7773aso599024e0c.2
        for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 03:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769079874; x=1769684674; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t0KlvkM5KQlhi9X1NhLsO3/hA2b2nzw1RRo2lI06OH4=;
        b=hGC+U0Vf6oCO9fnzGn9zKWz87GvDtZO2zi/4iFMB1RJPoY56FlNjpa8hFi9z2p4NRT
         rMcJXPUWO1UiFVHJ87+vIPDaRsE5HizMd1XfKSrL0IXqd43jpL/v48ur11mlXbY7oA6P
         bUex8CkyNPPF9W7gtDXRAGHlgtG2eNf31cruxuRX8uOSIkR+mAF7aKsH4Gbh09w4ewq2
         qAW13B0ffDKXhyWMYIWg5ZtZGqS3y6GxHJybtUDDqn9sSDFF7fGqn0ZYjbmgN4709ZoQ
         eSmZXentqwdgT5TAw0LpzEaxwtAT7ElsmYYX5ChjczhdlFu3LLpyoovNHJXOLKWKxUlp
         c3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769079874; x=1769684674;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t0KlvkM5KQlhi9X1NhLsO3/hA2b2nzw1RRo2lI06OH4=;
        b=cz7Q5CIQ+h8DxD0gRKaFg/3b/dzkeGhGVyiEvVnFC6ceZEApgB9GkV2kAR1t4Gi1Ad
         egc0dRuC3LxRWxKvd8No1vB+OVO45b++cmb/vAYMbfL+NQzsEaL0PNrKDk1N4CCjNxp0
         C8MLxDHynkUeSX4cyaWQ+sezZ11+5bx/JG6tUCUcRz6eWOmOthwhCVsgo5RRZY0r8VJQ
         FL67mFw8FcSYzGMUCi+y1ZwjVykMzRVdjGeYY26pgpbdqoacpgS6tdLv/6ksN1567sU4
         6uptwA+8+hyRWgJijKLq1zXRTWl4tbWMJKcIQzsLPsnXLSLySojN1rNK35drVW0P3Hwa
         LywA==
X-Forwarded-Encrypted: i=1; AJvYcCU/44BDm7WBUOzjTqm+WH5LKSF5MnSDfQcYtDjfVdx6/dAnyQz4v6yMJcGv3K0B0ZELh+eMuuoRLebhlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi641+0sFO+kzLFljqMNLp0kb+B31uLF0UOIfpnF5sAy+LdEXV
	gML0tKCd+h010XH9z7PLVSHysI4/PgkQjh6/BKaEAnnvAhInCo9QZv0M77wFciZk17mazWKX3+S
	hvl0yWLpHFkr6QKkwIDBqpDKlZE8YDql0zy/XqbnKDRP8DpY8LTZ05mvgwjaFdy3c6w==
X-Gm-Gg: AZuq6aIFrOMomEI+e3zhiUAAierONOvS+IvRrzKj1s/IEtS8KC28oblRV4d6gkG99OG
	Vr8lNfHbpYwtwiyy8sgLkDaFjte/jFoC/k3gtFJPiLuKSt/vMJxSmPccb23HYdH2V2Ez60AkU9l
	zcGzr/Um62zKVSzgh7vpdBeiYzIZzZC6L+9qfnBSqCzd0O4O5cKX941GBpe+kGQ2g109S2MQRsr
	PPWOQGibJCd9lVz28zatsIiNB/01VB63DZ0JYPeANeXP+viSvH6QLFopHKOvS3zgstm+0e6V7Cb
	iZBSr3P92xZdGJV5pWw7x4GHV+lcy6bug1Ulqt3Csz9vfM4F0kybtOsDg8RAil2ygJ+LtbFFzu5
	jQrRjTdNqbTD8AvZjeSxMIxUSKrSxzHmEnZOqi118+kJqeI3sdNXjbwhPdrOERgiIpgrhfPE4GF
	gqAjtd8Gf2DKL+5e1qCH7zgeE=
X-Received: by 2002:a05:6102:6cf:b0:5ee:a2a8:2e73 with SMTP id ada2fe7eead31-5f1a551ef9amr6077507137.26.1769079873657;
        Thu, 22 Jan 2026 03:04:33 -0800 (PST)
X-Received: by 2002:a05:6102:6cf:b0:5ee:a2a8:2e73 with SMTP id ada2fe7eead31-5f1a551ef9amr6077487137.26.1769079873108;
        Thu, 22 Jan 2026 03:04:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3543d2sm5368629e87.43.2026.01.22.03.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 03:04:32 -0800 (PST)
Date: Thu, 22 Jan 2026 13:04:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/3] Add support for QC08C format in iris driver
Message-ID: <sa6y3vjstutglftts3ucoouj6js53p6an4wjcvqhbjsazmmxrf@v35pf2dqvfdh>
References: <20251008-video-iris-ubwc-enable-v2-0-478ba2d96427@oss.qualcomm.com>
 <s2qjimx4tq2jdnir7b5dljf4onsbcmvb5prxcvc22q76l5cgnz@wrgcqdrl26sb>
 <50137983757d754609d8164dbdfc429b32e3d6b5.camel@ndufresne.ca>
 <qkkjsjvhwovbh7stjc53htkt3wucd34nzcvnkilnbxv4ukbozj@e4ierwjhs7wp>
 <0841b98d-32b3-4e7d-940b-9be204fad7af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0841b98d-32b3-4e7d-940b-9be204fad7af@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Hrx72kTS c=1 sm=1 tr=0 ts=69720443 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=nY9ItIvBOz0YvIiU8-8A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3OSBTYWx0ZWRfXw5ZQ3BDXnI89
 za86Y8WVRaY3REyCWzDZNhXcMJ0wZEEqN+EjZEx98Mqh08KaTMldG76d0WNXiNz4x1VbwNz1aPx
 Gjnj6hr8PgGwzCEj1TZG36wyKe9XuyV/WDzBZqPtzvcEU+Ue82g9EwZit5N+efIvRujxNZMPWsC
 ZW/uLJpkohnoDnb8se92V+IEDsBVhVrPs8qYMJNhFl3T2Rkdklkb9CH5c9/JyteycAOFlhh+rlK
 kfD9Rqrw0fvkXzE2VGEl8tjqNBHC/ZkDRRMAGf7klNp+4enP4Da3u5WFoFmGvvqfYjeLStY9RHZ
 Kw0a8avA8nNvA8PlxeGUs6obsAMdkNVif/Ji8r+a3p5IC8ZpDRLpN8He039My/84+fXUfmjqc6Q
 v0YolvmpAAubDKfFzqJt3Wo8PGK3Rghme+9IqJP0lqW6/TuhumPeVPAx4xbKZ/GwwlWFDDnOkG2
 aLEbaHPYKK+0iBhyFuw==
X-Proofpoint-ORIG-GUID: _gB7wzTPFm6jbmypo2uc3kIeeIyk73ko
X-Proofpoint-GUID: _gB7wzTPFm6jbmypo2uc3kIeeIyk73ko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51346-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[ndufresne.ca,oss.qualcomm.com,poorly.run,gmail.com,linux.dev,kernel.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,gitlab.freedesktop.org:url,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 78AE466108
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 11:29:32AM +0530, Vikash Garodia wrote:
> 
> On 1/16/2026 1:16 AM, Dmitry Baryshkov wrote:
> > I should have added GPU maintainers and ML beforehand. Fixing it now.
> > 
> > On Thu, Jan 15, 2026 at 09:02:07AM -0500, Nicolas Dufresne wrote:
> > > Le jeudi 15 janvier 2026 à 10:08 +0200, Dmitry Baryshkov a écrit :
> > > > On Wed, Oct 08, 2025 at 03:22:24PM +0530, Dikshita Agarwal wrote:
> > > > > Add support for the QC08C color format in both the encoder and decoder
> > > > > paths of the iris driver. The changes include:
> > > > > 
> > > > > - Adding QC08C format handling in the driver for both encoding and
> > > > > decoding.
> > > > > - Updating format enumeration to properly return supported formats.
> > > > > - Ensuring the correct HFI format is set for firmware communication.
> > > > > -Making all related changes required for seamless integration of QC08C
> > > > > support.
> > > > > 
> > > > > The changes have been validated using v4l2-ctl, compliance, and GStreamer
> > > > > (GST) tests.
> > > > > Both GST and v4l2-ctl tests were performed using the NV12 format, as
> > > > > these clients do not support the QCOM-specific QC08C format, and all
> > > > > tests passed successfully.
> > > > > 
> > > > > During v4l2-ctl testing, a regression was observed when using the NV12
> > > > > color format after adding QC08C support. A fix for this regression has
> > > > > also been posted [1].
> > > > > 
> > > > > [1]:
> > > > > https://lore.kernel.org/linux-media/20250918103235.4066441-1-dikshita.agarwal@oss.qualcomm.com/T/#u
> > > > > 
> > > > > Changes in v2:
> > > > > - Added separate patch to add support for HFI_PROP_OPB_ENABLE (Bryan)
> > > > > - Updated commit text to indicate QC08C is NV12 with UBWC compression
> > > > > (Bryan, Dmitry)
> > > > > - Renamed IRIS_FMT_UBWC to IRIS_FMT_QC08C (Dmitry)
> > > > > - Link to v1:
> > > > > https://lore.kernel.org/r/20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com
> > > > > 
> > > > > Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > > > > ---
> > > > > Dikshita Agarwal (3):
> > > > >        media: iris: Add support for HFI_PROP_OPB_ENABLE to control split mode
> > > > >        media: iris: Add support for QC08C format for decoder
> > > > >        media: iris: Add support for QC08C format for encoder
> > > > > 
> > > > 
> > > > Looking at the series again... What is the definition of V4L formats?
> > > > Are they expected to be self-compatible? Transferable between machines?
> > > > In DRM world we made a mistake, making use of a single non-parametrized
> > > > UBWC modifier, and then later we had to introduce OOB values to
> > > > represent different params of UBWC compressed images.
> > > > 
> > > > So, I wanted to ask, is single "UBWC-compressed NV12" enough for V4L2 or
> > > > should we have different format values (at least for different swizzle
> > > > and macrotile modes)?
> > > 
> > > Our expectation is that the decoder will produce the same format regardless the
> > > resolution. And that format should be shareable, so that same format coming from
> > > two drivers means the same thing without out of band data, except that
> > > resolution and strides are needed oob anyway and can obviously be used as an
> > > acceptable workaround the issue you describe. It should also have a single
> > > translation to DRM fourcc + modifier, and hopefully the other way around is
> > > possible too, otherwise its a bit broken and unusable.
> > 
> > Well... As I wrote, we made a certain decision several years go: there
> > is only one DRM modifier. At that point the decision was made by
> > open-source people which had a very limited information about hardware
> > internals. We can probably try deprecating it and shifting towards
> > multiple entries. On the other side, most of the blocks would only be
> > able to support only one of very few possible configurations.
> > 
> > > 
> > > So bottom line, since V4L2 does not have modifiers, you have to treat one V4L2
> > > format as a pair of DRM fourcc + modifier. Decoders typically only support a
> > > subset, or hardware engineers can generally pick a handful of performant
> > > configurations that works for all cases (its all 2D with similarly sized
> > > macroblocks).
> > 
> > This is not quite applicable: even if we try to fix all other settings,
> > the format differs from platform to platform because of the memory
> > organisation (highest_bank_bit in drivers/soc/qcom/ubwc_config.c).
> > 
> > There is a description of swizzling in Mesa ([1])
> > 
> > [1] https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/freedreno/fdl/fd6_tiled_memcpy.cc
> > 
> > > Since these formats are only usable when consumed by GPU or
> > > display controllers, its important that all party uses the same convention for
> > > the limited information available.
> 
> Would there be a need for any client, other than GPU/display, to peek into
> the data OR to validate it, it need to decompress it. For that as well, it
> would need all the associated info to decompress it.

It doesn't really matter. This is uAPI. There might be no such client
now, but there might be one later. Also, with the tiling format being
defined, userspace apps can start poking into the meta / color buffers
(e.g. for the sake of clipping / blitting the part of the image).

> Again in same SOC, camera can produce compressed YUV with different
> parameter while VPU different, it would again need the associated info
> alongwith single "UBWC-compressed NV12" to decompress it.

Yes. It's actually a good point, it clearly shows a need to describe the
stream rather than stating that it is "just UBWC".

> 
> > 
> > Yes, we added UBWC config database in order to have a single source of
> > information for the kernel.
> > 
> > So... On the practical side there can be:
> >   - UBWC 1.0, 2.0, 3.0, 4.0, etc.
> > 
> >   - swizzle 1-2-3, 2-3 and 3, partially depends on UBWC version.
> > 
> >   - HBB or 13, 14, 15, 16
> > 
> >   - bank spreading (true or false)
> > 
> >  From the practical point of view, drivers/soc/qcom/ubwc.c defines the
> > following formats (currently, I'd like to cross-check some of them):
> > 
> > - linear
> > - 1.0_123_14
> > - 1.0_123_14_spread
> > - 1.0_123_15
> > - 2.0_23_14
> > - 2.0_23_14_spread
> > - 2.0_23_15
> > - 3.0_23_13_spread
> > - 3.0_23_14_spread
> > - 3.0_23_15
> > - 3.0_23_16
> > - 4.0_23_15_spread
> > - 4.0_23_16_spread
> > - 4.0_3_13_spread
> > - 5.0_23_15_spread
> > - 5.0_23_16_spread
> > - 6.0_23_16_spread
> > 
> > Would it be benefitable to define separate DRM modifiers (and NV12
> > compressed variant for V4L2) for each of them?

-- 
With best wishes
Dmitry

