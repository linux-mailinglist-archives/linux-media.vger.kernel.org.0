Return-Path: <linux-media+bounces-63595-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RH8bIuwsIGrUyAAAu9opvQ
	(envelope-from <linux-media+bounces-63595-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 15:32:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A317638187
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 15:32:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ODNZo4nN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A3kEI0a2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63595-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63595-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 695CC308F613
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 13:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3408A2DA762;
	Wed,  3 Jun 2026 13:25:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E91129DB6C
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 13:25:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780493156; cv=none; b=eb0cgY1IFhq0LQzq6g8ViBy2WRLODQMRsZ052vIiJqtY+ARrirDziAs++j7KjFFOdT9FPNqgmP1j5/90TNQbTBu/6zUVyvoIYS0jVTlGXJxDWURxVeuKeuryMNJeUg6eFq1sK28KVl1IJQJEzwkltGqoV6/kZY6+tqVxSoV5lNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780493156; c=relaxed/simple;
	bh=qKuP1aYXbsLJv6x6e4VAWHfEB3D/VfGQIgMjqDkaRw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9W8S+IBrrd08ovCwpXVaant6SIxJYd7IO37oPG2RWgkzJ/36ddn55D+ImUSZzNnlvPm0z7CegqK+690T1Kmx1Jad84oyIVZOqDA6qCrT1G8QXUhOCA5+I2iGbMGCxPasidGrffft0fScMgI1yKDMxUqztVVe83TNER8WT/2P3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ODNZo4nN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A3kEI0a2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6537F1td1956647
	for <linux-media@vger.kernel.org>; Wed, 3 Jun 2026 13:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UhFwddlTFY09oF6cy7oYeNVke04XX3DNuQUC89hSDWQ=; b=ODNZo4nNljDaEEsi
	1dIvaUauNqUhkE5Fr31T394FGhgER/rCJQmyJBP1E+y1HnlSMLtKzu4uVtE+5e0A
	GTGjk5Z3FWKAq11NdlAKHmno2R+/mnw0barEmTPEZ/d4dKsWpSz2iBND3GpY/8q1
	+W/x/yk7omU/OqmyDBntXvKs4JPTMJcN6AVR/o08V4KgVkKl49lO5ce0uauypmdi
	aNiimcbLZTdoJBZAlKgUtz4Rp4CX6PtW00AFT/5gRhHhRobXcLfGEDIU1ZFdKfpI
	lXu8ClEOdxoMM0Jr+LoK89idmcGNfciwX+l9ud9ovRuYF4ZptNkozDdSMIi2tYLm
	0lTb5g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejfqc1enj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 13:25:54 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5a83b662fb8so486984e0c.0
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 06:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780493154; x=1781097954; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UhFwddlTFY09oF6cy7oYeNVke04XX3DNuQUC89hSDWQ=;
        b=A3kEI0a2V8nsl2ArM71DR50lH3kwKeT0LHZFFOWa/5mcjWJjVrsdLofbJavji0VzJy
         nKkyjiNbAl60yO5u/4bCFGdV27bv3IrSH0OMlR/KfT1YQza8V5ocGKIUWbGeU7JLRsUE
         7awiyU/akUHzqGxgk+SjkSeJwq7/xuMVMUE9u3rhkPoOn2Mx06VznSL3bWGq1oEjXRJD
         AIWq5eZVv4qfW9T1cBdT5McCaTtpbM+cuxiQTficnIJ6crrVR0zsmOJooaoF/HQrvidp
         AxKL9uccj3sR/aHS3hENw2Kwu3rDUBlTRKBte3jk1WJvGmF2VmfigelFismRnSUnVgz9
         oA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780493154; x=1781097954;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UhFwddlTFY09oF6cy7oYeNVke04XX3DNuQUC89hSDWQ=;
        b=iLs4E1iVio34rH1V73FxzFpi5W/BMdG5GKfvfL0TduQlHMzq0MOfxO6GFYJMVXR9OD
         MMu8GpAfWbbrsI/BdJbpXq1JmEyOaFOOExguGmd4Zmhb6LrQm9+nuIDuYDLqd6yv82TX
         Gnx+kFp/ux8lR2RjUwLyrMDNIJqihFpckM6tgvupEQvVc7PjTKX1QuSxqnztJxAbLipn
         /awDHZvfdvYSRRpXYNGPqDrCx5nOS6l6AMoOhKcRm39Cli/ftsu5eArtqNLENylUP5ag
         HjSCdhPDIi5ivRiuROQeRoPiI8dgub/bWFZJSbTz3OCH5oMYHyq2VX++AQR4VBDNL1Dn
         lK8g==
X-Forwarded-Encrypted: i=1; AFNElJ+aqN1pEk0qPLmfug5yhFvpZZYcesRr2THCZMSq+7DXtAG59ZM1UfF+J5y6OKW1eExfPp/hoN8fFHSUqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3nn2qi3YRR6VRuyDcARTcYFTNo+IGqxBRTcGHM57fXAA0RHlx
	gGGvC1+Ij/O54Mfnsmibdla9aifZBsdnoijYIsOTFPkgcn1rCSqh5d/1HIGFrXTypBD4T0TSLHw
	rXNF7wgffd7BpFejOrEyd/Voxjx0PG+viYxRNl6dvhYUDF+TT/0qfhphbUXg9OaAE7g==
X-Gm-Gg: Acq92OHhOqlsoSGtDoUxNoiZx4uhKQIHAXg21t809+VbP9ZC9goNIrquz0iICvuPLTl
	moeK3aydoZ4S3gjlkmFxc283BcM1Nuu2PjPh8LzYtrE3GjwwS11oBK7lWRYdvd9J8N3WyD0kx1q
	DG2PRmuzfZP3YlARHsJrg/mbIBvWckzcNaSSDRkHTYmeor8wUbkmTp2g2WXJBpSrroKbMpmFlPg
	t7x8HVrI2FQwa70piKq5eFLwAL9VP+MvpRxT0pYe7HD4EV51Hw3PP3QRGl9zzAfIGLgf5xoATfc
	lI5+wLYwAXAW+kjzXWpqq3/dRcwjsp9nztuhF7Ktsw1b/NGdkRh2gGKu7mLAM6WU+htzIx7o1U6
	o7c05ah3wIB11BsFVIhTJCE3hCYaVgpDUFt+/sPdwGXu8KxyuYb0FZ1hoq1CSYrSzZt32R6Vjy3
	erBCOJ1YASMCJZmJRrQ8JY+2Hcz96+MsfqBHozqzJzbTNJWw==
X-Received: by 2002:a05:6122:46a2:b0:59b:7fbd:39f8 with SMTP id 71dfb90a1353d-5a6e852c12bmr1998150e0c.10.1780493153848;
        Wed, 03 Jun 2026 06:25:53 -0700 (PDT)
X-Received: by 2002:a05:6122:46a2:b0:59b:7fbd:39f8 with SMTP id 71dfb90a1353d-5a6e852c12bmr1998093e0c.10.1780493153309;
        Wed, 03 Jun 2026 06:25:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b990d37sm653480e87.70.2026.06.03.06.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:25:52 -0700 (PDT)
Date: Wed, 3 Jun 2026 16:25:50 +0300
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
Subject: Re: [PATCH 04/15] accel/qda: Add compute bus for QDA context banks
Message-ID: <t4dcxboazzy6mxtbcjntcccxl6gc5oxjaituzyoijy2i6wfq3n@hxcrglx7bftk>
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-4-b2d984c297f8@oss.qualcomm.com>
 <gnlpw4ijwtjv43nhcv5iirhjnuc7dntx5vucdrhnxeyznyxa5x@t65o5owldu5s>
 <587b450c-c527-4c6a-b48b-8a7a266bd673@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <587b450c-c527-4c6a-b48b-8a7a266bd673@oss.qualcomm.com>
X-Proofpoint-GUID: ZYI9fQT76BxNd9_5KBCxcI-lMSyejyZ5
X-Proofpoint-ORIG-GUID: ZYI9fQT76BxNd9_5KBCxcI-lMSyejyZ5
X-Authority-Analysis: v=2.4 cv=e602j6p/ c=1 sm=1 tr=0 ts=6a202b62 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=w4rcs2q4Tst63B3XjnYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEyNyBTYWx0ZWRfX1P+PXytD4wm1
 l7nDKMgMlYeFd4UCS2hdTJ/QATPaA3L2apLVrYbRU87ALq/zS4qFA9DtQhgarIU4HgDU8nXHC8N
 mfUZF7/28c9D9gaMc8cAcQM6YbJGw7Z9IRMUFLy8MrtEDqit5SJYqpwpjHtmad+ZHBoI4mzDLuL
 i0MphapLaT5OAJQtvHZAzgky5+AYEyg9sRnVnzkxZkPEWkLpxm9c0dgKd4hJmdyjv1vx7X8iinO
 /1icwB72YLweDNduXtJIJi1brun4968vMUxz4RrquG4S96s5Xl4uZTP8l9S5eg800bME3QnK4+g
 aps8XCBe+bhJ/Y700n7znQXPqTdReLoKQIVi2AenFez0FRKycAhql2DXStugKzk1FJSViGIG3lP
 nFNJSQwJtdwcCz2odefFk+jQTRHawIjD9C2C41lX1bQTWFF+3GpIXk3trDMwCN+5Rbcgbae15TX
 5wLi2YZnkS18/KdZSWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63595-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,quicinc.com,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,hxcrglx7bftk:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A317638187

On Wed, Jun 03, 2026 at 10:58:09AM +0530, Ekansh Gupta wrote:
> On 20-05-2026 19:49, Dmitry Baryshkov wrote:
> > On Tue, May 19, 2026 at 11:45:54AM +0530, Ekansh Gupta via B4 Relay wrote:
> >> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >>
> >> Introduce a custom virtual bus (qda-compute-cb) for managing IOMMU
> >> context bank (CB) devices used by the QDA driver.
> >>
> >> IOMMU context banks are synthetic constructs — they are not real
> >> platform devices and do not appear as children of a platform bus node
> >> in the device tree. Using a platform driver to represent them was
> >> therefore incorrect and introduced a probe-ordering race: device nodes
> >> were created before the RPMsg channel resources were fully initialized,
> >> and because probe runs asynchronously, user-space could open a CB
> >> device and attempt to start a session before the underlying transport
> >> was ready.
> >>
> >> The qda-compute-cb bus solves this by allowing the main QDA driver to
> >> create CB devices explicitly and under its own control, making their
> >> lifetime strictly subordinate to the parent qda_dev. The bus provides
> >> a dma_configure callback that calls of_dma_configure() so that each CB
> >> device gets its own IOMMU domain derived from its device-tree node,
> >> enabling per-session memory isolation.
> >>
> >> The bus type and the CB device constructor (create_qda_cb_device) are
> >> exported for use by the QDA memory manager.
> >>
> >> A hidden Kconfig symbol (DRM_ACCEL_QDA_COMPUTE_BUS) is introduced and
> >> automatically selected by DRM_ACCEL_QDA so that the bus initialisation
> >> runs via postcore_initcall before any QDA device probes.
> >>
> >> Assisted-by: Claude:claude-4-6-sonnet
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/accel/Makefile              |  1 +
> >>  drivers/accel/qda/Kconfig           |  4 +++
> >>  drivers/accel/qda/Makefile          |  2 ++
> >>  drivers/accel/qda/qda_compute_bus.c | 68 +++++++++++++++++++++++++++++++++++++
> >>  include/linux/qda_compute_bus.h     | 32 +++++++++++++++++
> >>  5 files changed, 107 insertions(+)
> >>
> >> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
> >> index 58c08dd5f389..9ed843cd293f 100644
> >> --- a/drivers/accel/Makefile
> >> +++ b/drivers/accel/Makefile
> >> @@ -6,4 +6,5 @@ obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
> >>  obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
> >>  obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
> >>  obj-$(CONFIG_DRM_ACCEL_QDA)		+= qda/
> >> +obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda/
> > 
> > Ugh. The previous line should be enough (but don't trust me).
> I was seeing build failures if I don't add this. Took it as a reference
> from host1x driver and recent iris patch.>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

