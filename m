Return-Path: <linux-media+bounces-53407-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Jc9Ah9Jn2kuZwQAu9opvQ
	(envelope-from <linux-media+bounces-53407-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 20:10:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B23319C92E
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 20:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D02C30498EA
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 19:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F063333ADA1;
	Wed, 25 Feb 2026 19:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="deEDZpuC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IjSDXKqH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD082ED848
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 19:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772046600; cv=none; b=WZJC1sTK5HMlqve4aSdr6LvUT+5gqAenUZNlkoilci1ahdziA26U9oM198Yds4Yd0v37igcvczpHK9f18rfJmW3JDR+JAkTr/JQWUs7jwq1bROtgHy+eQh3tSCSjXxPNRQMLP0iwU/UW+a7TsrR5zm07OYYQlH9529vrc1IOs68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772046600; c=relaxed/simple;
	bh=CzfU35N3pjq6xy3wil9kM7JXhYOUU0JGjdRVEwu0+gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWBoBQKmIYjponkTy06niw4j/KvtDIsxUnWvNI9g/O2aHkQU+3kHYTl55OZIauBchAu4DTCzlSV0arI9W3NMcbYyeBWCBqoleHqPw3LrCFL4eNt07lmUs/TnMA1we4LqSderCz6NRj/UisfhxQD/JBXkGm52deI2clAn3tW9/Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=deEDZpuC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IjSDXKqH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PB3Gkv789069
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 19:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pZEpDcrfMrqqrHue5nZhulZF
	qXVRR9YBcn3GTIB6GfE=; b=deEDZpuCFaGh0XyjzUZOyK0hDDEqcK6/Q8xviVo8
	f4DzXIpDz6jIg0dOrqEWjiyZRnsRXjZahXaUHgSjcY4hE+0TuOxFb3cIpjlhiWXO
	EMqG//Dmp5K8OiZY04WhLhOxkBHvE5subNv+ebJkQ1fm1PFylogeaaJpjQ/IUbwg
	bmDwBPPzBsfJPH+EXvISMBJQv+U2mQTGNNREV6xK5QiIvITBGx5ahrnC2lj4Ggvf
	kAUHDy6kIjJGD4ae1n9TSz7sNZ16SM27+PDkJmbSnmvPa49Gfc/WVHke683i7+A9
	ULivLKJqK5NlQTiFt9Gbj2lWTyCDeteu1eDJedoBVLLxFA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chyv9hh44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 19:09:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3a129cd2so554365485a.0
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 11:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772046597; x=1772651397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pZEpDcrfMrqqrHue5nZhulZFqXVRR9YBcn3GTIB6GfE=;
        b=IjSDXKqH9ea9aDhAJFpCrrYPsckPwLkbe1fnvK/3jzNEypZtpEZlfWL7kUoZswmhOQ
         mmgAr+swlCmrCPARCZIYbiwWyvFhS2ChEO5jEqPOeyYGHcCQNdG2bRHJL1m2hUJjy4ap
         X2SDzWd39aARN1yW82gZyroltjbARLkBr4lmBSP4Yx1G9ehqqY9sbZq+nj0szF2eOAJn
         eh5TBf5Or4bDUDDrvUHIHIaKwsutaL4AahcGImLOEmYFyTVK/sphd6hxqKx2u9v8hCHn
         u6rxuCRZeB/Cr9vEl4IBh61yq89S3ADJAk4Xzwrn1VLgV8nd4qQNEPdogr4eKpfY2N+Y
         Guag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772046597; x=1772651397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZEpDcrfMrqqrHue5nZhulZFqXVRR9YBcn3GTIB6GfE=;
        b=BgrvecwDWd8SKCTjNY4+BG8XjjpcQ/1hgij5GX/6yDRCI41yx4dH/H9vXqB62p3f60
         f5eqq255Yc/9zn0O31nXdfyi7kHATcupTfBe9PlTTskiPET9dn14vf7ba49s+Wogs6EN
         S4xCyKVU0ezuOLw02KIgg3DCHVrHuVBK+eP4QQeQUq0BtTdJHNcA2ybiAXojP06SsSKd
         da+1UWdAUlF5qtUnUhvAtJ5PCIHeaW0vS09JPqCub1DJPf4zj6c7m0HVQtLk0y57CMu/
         Tx/PwuHiWRR3yHyL88HJAthsZREftgodchjByOizW/pWTslp4dNIxTW5ys+rqI+pd4Si
         CA+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlQjUhElU0eFxLvfZKEMOdw6y5v3RlpCtGblvaDSKqKiokNXfsD5329G8S20MTqtLO8Nf3PDTOcfLinA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHd1tKVPF6U+gLwFTBR1iSQvThoe+pdki9j771jT/FsRLYHlNY
	mBDuRox8Y5CohMMEfYA2BVmSFqlLNh6WChfDboPS98SVXxsqd0LWU5zqdzO8INIUaBhmPjFR1Jz
	SLApXChH+gwb5TZnRsAmr5VWZBtQ5mPhTCO8NIWiZo4UO8uzZJOYN+4vCHAipE7B0Zw==
X-Gm-Gg: ATEYQzwe9ovxSZvx9HZY77bAcmP6M5hvE0dJ0k41rgha/yoptsiqGGnUg2r+aE1Dyyg
	r0VyJwwKmaRczekWmBqMtF9JPyOQ/1MRAHNKF39dRM+LJvmEJR4AoXhAqMpPdCKeDHktRmZiV0C
	x6Rk44+cPCi+98u7zeYo4JPwviOTSNPbTlabH6dYCuvGU0g0zZmZrKnXcxyxcFaeUQkzySKNqlY
	N2rfhsjmoLj7ZK1Csu+iPIziQP5QyZ92+UNYEDa2JbK3IaYCWwOvVU61gSAAw7ITJUMhdEG6L1V
	t+cA6AvADDHl0BuuURf9yP3TZgiUnbBm48naLCrjh0x3A+mLK5K2UOwpmREeukBby3DFvgNHag3
	Gcjx6rpOzmyrSCDzTXFQQvMALPilUS/EjKRfD0YBfAbzlmlgdK6uKIvOv1/XQkZ4Jntjo4G+tOP
	PMbfarDOVkBEpcDzRzgy+mXmiz6G9tszMdcOA=
X-Received: by 2002:a05:620a:4451:b0:8cb:4d46:7a6e with SMTP id af79cd13be357-8cbbf3658dfmr20929685a.10.1772046596980;
        Wed, 25 Feb 2026 11:09:56 -0800 (PST)
X-Received: by 2002:a05:620a:4451:b0:8cb:4d46:7a6e with SMTP id af79cd13be357-8cbbf3658dfmr20924285a.10.1772046596434;
        Wed, 25 Feb 2026 11:09:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7a1fcb1sm30525601fa.27.2026.02.25.11.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 11:09:55 -0800 (PST)
Date: Wed, 25 Feb 2026 21:09:53 +0200
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
Subject: Re: [PATCH RFC 04/18] accel/qda: Add built-in compute CB bus for QDA
 and integrate with IOMMU
Message-ID: <x6zseuf7g3ngtdlszf3vxj3nqexlkbtrp5kifo4tg4muzdef4n@5rngfg4gu47m>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-4-fe46a9c1a046@oss.qualcomm.com>
 <ox7jnqkjo3frhbgpp63sse7ram72obihe4qlbbn4z22wbw4szr@7pzoeecdvsyg>
 <e82443ff-f6c1-4b8e-b573-f4620dd0f17c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e82443ff-f6c1-4b8e-b573-f4620dd0f17c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: -vmnv5FDY-i7sy3iEHS5DT1MseWguWPy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE4MCBTYWx0ZWRfX515Fvh7q40KZ
 y6AJUr58H4Jyr8Z7WmjsXuE58vbmZsb4NKCHosd8LN7gdaSezu/+eXfU6Hpjfv2Ke5FXh8cfewM
 LXaCwJLKOs6cAmjj/vlzhg0qtBQmCPS5KvK6K9F4QBNfeZelAAWNJTEA94JfoU6nCRQM2g1Cy30
 Z7xo+Y0LFLI+B/Iyy0YyS0GevCjbiUwyUytwpbO9ewjIpF++HJivCO+h03npLOet2rF7D7Svl54
 f+xOn8H7/C3wmoVjBy7fAdqLTbBNmgfyqt2YdFaIGOD4ngul4hracUWEJh45YcLIA8FCT40wuXN
 5jmgBuZCyMtvZ4RwSA6UgJTA4edWcoAlwWFDqUSdqZ9Gg9MsIIZ7Y89nMdmoSXe0xHBFZnmKB+l
 WDjBp3kJR6R09w7Ii7NX+2NSccHhxyzDvpHBumIw0uGixokudh/0npxzCp29Sc+VzyR/AsLZ8AM
 cKZR8KVUv3trvNGmZuA==
X-Authority-Analysis: v=2.4 cv=GZwaXAXL c=1 sm=1 tr=0 ts=699f4905 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=yBEyVpS31OZj4jLVKcoA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: -vmnv5FDY-i7sy3iEHS5DT1MseWguWPy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250180
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
	TAGGED_FROM(0.00)[bounces-53407-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 9B23319C92E
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 11:26:52PM +0530, Ekansh Gupta wrote:
> 
> 
> On 2/24/2026 4:14 AM, Dmitry Baryshkov wrote:
> > On Tue, Feb 24, 2026 at 12:38:58AM +0530, Ekansh Gupta wrote:
> >> Introduce a built-in compute context-bank (CB) bus used by the Qualcomm
> >> DSP accelerator (QDA) driver to represent DSP CB devices that require
> >> IOMMU configuration. This separates the CB bus from the QDA driver and
> >> allows QDA to remain a loadable module while the bus is always built-in.
> > Why? What is the actual problem that you are trying to solve?
> Bus needs to be built-in as it is being used by iommu driver. I'll add more details here.

It's an implementation detail. Start your commit message with the
description of the issue or a problem that you are solving.

> >
> >> A new bool Kconfig symbol DRM_ACCEL_QDA_COMPUTE_BUS is added and is
> > Don't describe the patch contents. Please.
> Ack.
> >
> >> selected by the main DRM_ACCEL_QDA driver. The parent accel Makefile is
> >> updated to descend into the QDA directory for both built-in and module
> >> builds so that the CB bus is compiled into vmlinux while the driver
> >> remains modular.
> >>
> >> The CB bus is registered at postcore_initcall() time and is exposed to
> >> the IOMMU core through iommu_buses[] in the same way as the Tegra
> >> host1x context-bus. This enables later patches to create CB devices on
> >> this bus and obtain IOMMU domains for them.
> > Note, there is nothing QDA-specific in this patch. Please explain, why
> > the bus is QDA-specific? Can we generalize it?
> I needed a custom bus here to use for the compute cb devices for iommu
> configurations, I don't see any reason to keep it QDA-specific. The only requirement
> is that this should be enabled built in whenever QDA is enabled.

Why? FastRPC uses platform_bus. You need to explain, why it's not
correct.

> 
> But if I keep it generic, where should this be placed? Should it be accel(or drm?) specific?

drivers/base? Or drivers/iommu? That would totally depend on the issue
description. E.g. can we use the same code for host1x?


-- 
With best wishes
Dmitry

