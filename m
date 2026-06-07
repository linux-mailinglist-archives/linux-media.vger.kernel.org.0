Return-Path: <linux-media+bounces-64074-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /kTDAC/fJWrwMwIAu9opvQ
	(envelope-from <linux-media+bounces-64074-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 23:14:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9B76519B3
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 23:14:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZWryxAUI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="D2XyA/lV";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64074-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64074-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2728B30078B3
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 21:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F863346A5;
	Sun,  7 Jun 2026 21:14:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110D0253B73
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 21:14:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780866858; cv=none; b=EA9Tj+B5V9bEHZD6+6XQvbQPdnpIWdxIKGHcrb+k02ZVGUvwotfWpaqk/TBhnNr95/1MGriG92sSOqntZ2yWQQ6KbU2eckHUGevFp4aTYnXSmuorU5D3eSZYCleEAPWxGNiP/B8fpVzn47vl60Jcz9eIKrHCnpZyoEnHi4h32FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780866858; c=relaxed/simple;
	bh=GKVT5WTRMum/isCS5Uuw1MgFA2KOEuijCgjJZ5WY1Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iAfDPmmwccZG4hWqu4NttJkVtA06g0VlfGiQlmAmb+oUPdDUt0rVN1rjFhpOItDBrvxkigVVXLaQ5OAej3K09YZlB17ImK63/OiOcaqdu4NawgX7ro9M+y8Q17zCoTQtyLL0m7EJNYZx3qJ1xkepcyhhMTSvIz3vjq1rtNm1AlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZWryxAUI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D2XyA/lV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657FuidJ934474
	for <linux-media@vger.kernel.org>; Sun, 7 Jun 2026 21:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bVcqkhgaJSPD6A1e5VhyvGpy
	bYdJrSVM+2Bo77SiPkk=; b=ZWryxAUIOTOp6rfwOhdKZBk+CQzQ6VsRmUz1XzC5
	8RSgEsq/Ta0ZNlJ9UosaUKDUX3QJGyQfcB/QkOwozfF/wTLsUnsSLI/j8EDS1Hna
	JIdloOCxU+03Z8Kaync5G/qGsYj9UAdOnUn/kSX5fMzm10vt+rsGPZFWTjjRrtls
	q3s1WnzxmkO+WSaQT9LQHsZXj5M3tdPbCYkIfuWjDCyX3ts5bHj771OJQ16HzpjB
	Nx0dpheSf+Of+5+Fm0dnYvqDtUH08i6XTM+v5Nk53ylSPDoS+wlAK7CaJUGGMXqC
	Vl6/7lCtq9My06VETGlPcFoSnGxMpwKyUAqOiUAevwU8og==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf4yaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 21:14:16 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c5794db0eeso4341943137.2
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 14:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780866855; x=1781471655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bVcqkhgaJSPD6A1e5VhyvGpybYdJrSVM+2Bo77SiPkk=;
        b=D2XyA/lVkIlz72MFTjq3GvITZH8PTxRAQ6720heQ3R7KqWAPX9nvONqoRUt1ampP2/
         4OMaPHLqh4LbrWMoz3FhSHRkeAFf/pAF9d/S4/mLCd2bBFHWLxynLTaiP5LjDAJ8JArr
         L/zVG8TT1FOZWkr2y2p/kmpY9QfFjsvmL0BAheGTLKTjAiMzdgeNDSt/6Ldn3UgQi7lU
         7nL3mKkiThtRzlAnOXhqbHtuqt8lbJ0bqOKOvE10K3M5xbTT5oYmmNjmdKPUZYH4sCGm
         zNf9W+A8yiv2HD8f8rLkE9p3c4NhPN+l+JyhAaIzoQUikcleEs4d+CnZaqncR1I/M6SN
         gOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780866855; x=1781471655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVcqkhgaJSPD6A1e5VhyvGpybYdJrSVM+2Bo77SiPkk=;
        b=b3QweHBi4CzRxbG2MTk0xdTIZssiDT4bfmGqUW4LBC857IPS19h5EffxLFNv0NOns3
         PrvICX2mCMwYnDMRnif8Im1XlxxzG+T/d5VRAatdXE9u9NSzH8npOBuMvUGMgI7jJXum
         bqMWesgYNbITyKfO43TXUyw2rVzVdw4ot12BA18MyNmUv+qhJs7S3qVUilORNqWMIC0I
         /SVqQEDH41EhxLuGYrnaep7kT6koZGEDqwWL/kBNhy0nJLsRKc3C0Csk6yfPO6++t+oP
         zsXbFTRwdh/Lkv+YrXLsLe8wFSwVy3otKCdWCFp1REm0EbtWww14QQjHe80MbWzlQkJz
         NZOw==
X-Forwarded-Encrypted: i=1; AFNElJ9S4XBTqw6IkiEV6F3sUVH1pyrq9tNi38eZVmD7VjHcz1g9e+xAdQDkzX16d/auEnSVhNj8gPrOwnrlSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsoQLtYo72KIg4Yw8E89L16aJjyQ+ZLVUk7h0L4VHDoYmj2IPH
	t+TrakHp3YFPrx1jp4d+/zHKb5UARgHb2BDBp1/VjZvHrgmBiWI9QzJAG+gu+/wIuv5yQpQ7sxD
	HcO/JzBwFA08fco/5IFYQCABRPNuLOSjYGDGTDGHZZstaVz6w0RON916B9QwtpfgWcQ==
X-Gm-Gg: Acq92OFJU2VjKH7igNtuouzWF0FPCkCP1oJPecUoe0KAqP+XzZ73qesLmk/c2optI/D
	XMxlTQ3BOlRMhFs09AdasycBK7qQyZ+tM+T3kA6wSVgICT5xvTDkn81FN/spxfexxfWVJRQ3J8o
	94zK1QJQf65NexSI/pQnLWDW+HVYkWy0Cody5YmwCrczp3r95NGiAT/Ov1iRrTtBPWqYdRVo0ZI
	v9nUc4AVgfYeiBuDVFRCiZqIbhy3OzSDwUD0NMevSNy19lmOilIpQVQEmYf/wDMP7gJxAsTWKyz
	SK9pwmnhDUHirffRRERccmsRadNY2cXCOK1iAuSjRbiqhNINr7LcM19quUU+ObVcxevF4tM4146
	nEnU1as+5+GwZpEBNEh5OigOnd1MdwwWt+Wi2qtqwk2qhmwCXAhFjyg00meiZUFeRE8bOJ/SKiC
	yjLXHeYLd2NG4q2HWlwiDMSyKMi/wipvUuesJFXiILnLxWSQ==
X-Received: by 2002:a05:6102:c91:b0:6cc:16d2:3100 with SMTP id ada2fe7eead31-6fef1098102mr6567910137.13.1780866855322;
        Sun, 07 Jun 2026 14:14:15 -0700 (PDT)
X-Received: by 2002:a05:6102:c91:b0:6cc:16d2:3100 with SMTP id ada2fe7eead31-6fef1098102mr6567897137.13.1780866854873;
        Sun, 07 Jun 2026 14:14:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8edf4fsm3319707e87.16.2026.06.07.14.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:14:13 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:14:11 +0300
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
Subject: Re: [PATCH 12/15] accel/qda: Add FastRPC invocation support
Message-ID: <q2q6tfnas3kikapwehbp6q7mykvk2wbuvn6ypbzc5ta7azh65w@wdwphde7gcxc>
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-12-b2d984c297f8@oss.qualcomm.com>
 <43a7laqb7mnrvleunnmbxwhvzr6w3au4ofjri4r4ap7clsx6mc@jxqlr4a2lw56>
 <ba003d7d-03f5-4572-8321-3d1f666c8c27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba003d7d-03f5-4572-8321-3d1f666c8c27@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a25df28 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=SKmDr6HH6J8_EXO89VAA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: iohOvfwwoVDtK0kJjTow_IPDm0etyWDs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNCBTYWx0ZWRfX0WFkZ/EWnJoE
 nF3p4sS0GWSUgFedV1b3gPyoHSuCEl+lKpKfhNO4bWB0jl04SoCMrtlRwGeFL/3G2LXOe4Z+Rd2
 dgGqGlYahPEuRHyeQzCNKK0CTK8jNDVM47OoY1UhXA5flqh8nh7zFEutdWOraVEejrUwNZTbipb
 mPD/LVUlXO9aYkOBFPDY5RB9n5ZGg2zHP+g5h+BqqQFpX6/KaN4uuNiEjq/ygWT2mcsz9CKe0pl
 EaeswWqnXez8Yi/CUwEnYDntjmoojw4nebCx/dJKEGFsgU8tS57fAUtwBdVuwuL1qvapKGTL6qQ
 dIyoDhEZrj4XmzjqHelHtz08iZpcPOSH7XTt3IPCCHH8vkyZBFT3hzLsAw5vOtRCHi1AyLD0ema
 e8EC5c1wtORO/BjVcjLaGfI7hC3gwbMUTkx/rGm/0l9KsV1aHvjlgEqjGqC09L7fvfEwbiiMskH
 qQk7ysVzC1IGG3MndiQ==
X-Proofpoint-GUID: iohOvfwwoVDtK0kJjTow_IPDm0etyWDs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070214
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64074-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,quicinc.com,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A9B76519B3

On Thu, Jun 04, 2026 at 10:39:14AM +0530, Ekansh Gupta wrote:
> On 20-05-2026 19:26, Dmitry Baryshkov wrote:
> > On Tue, May 19, 2026 at 11:46:02AM +0530, Ekansh Gupta via B4 Relay wrote:
> >> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >>
> >> Implement the FastRPC remote procedure call path, allowing user-space
> >> to invoke methods on the DSP via DRM_IOCTL_QDA_REMOTE_INVOKE.
> >>
> >> qda_fastrpc.c / qda_fastrpc.h
> >>   Implements the FastRPC protocol layer: argument marshalling
> >>   (qda_fastrpc_invoke_pack), response unmarshalling
> >>   (qda_fastrpc_invoke_unpack), and invocation context lifecycle
> >>   management. Each invocation allocates a fastrpc_invoke_context
> >>   which tracks buffer descriptors, GEM objects, and the completion
> >>   used to synchronise with the DSP response.
> >>
> >>   Buffer arguments are handled in three ways:
> >>   - DMA-BUF fd: imported via PRIME, IOMMU-mapped dma_addr used
> >>   - Direct (inline): copied into the GEM-backed message buffer
> >>   - DMA handle: fd forwarded to DSP, physical page descriptor computed
> > 
> > No. This needs to go away. The QDA should support only one way to pass
> > data - via the GEM buffers. Everything else should be handled by the
> > shim layer, etc.
> each FD passed here is a GEM buffer. The reason to pass fd is that there
> are some APIs on DSP side which takes fd as an argument and the user
> might use the same on their skel implementation. So in this case the
> remote call will take fd to DSP and the skel implementation will use the
> FD.>

Then handle it all on the userspace side. In the end, bad library API is
not a reason to complicate kernel API and kernel driver.

> >> +#define FASTRPC_SCALARS(method, in, out) \
> >> +		FASTRPC_BUILD_SCALARS(0, method, in, out, 0, 0)
> >> +
> >> +/**
> >> + * struct fastrpc_buf_overlap - Buffer overlap tracking structure
> >> + *
> >> + * Tracks overlapping buffer regions to optimise memory mapping and avoid
> >> + * redundant mappings of the same physical memory.
> > 
> > WHat for? Even if this is a valid optimization, implement it as a
> > subsequent patch. The first goal should be very simple - get GEM buffers
> > from the app, pass them to the DSP, read the results.
> yes, this implementation is mimicking the existing fastrpc design where
> non-FD buffers are also supported. I am currently evaluating the
> maintainance of such buffers from userspace side and trying to
> understand the impacts of the same. I am planning to bring it as a
> future enhancement if there is no regression.>

Other way around. Drop it for now and bring it back if it has any
positive impact.

> >> + */
> >> +struct fastrpc_buf_overlap {
> > 
> > Stop clashing the names with the existing fastrpc driver.
> ack.>
> >> +	/** @start: Start address of the buffer in user virtual address space */
> >> +	u64 start;
> >> +	/** @end: End address of the buffer in user virtual address space */
> >> +	u64 end;
> >> +	/** @raix: Remote argument index associated with this overlap */
> >> +	int raix;
> >> +	/** @mstart: Start address of the mapped region */
> >> +	u64 mstart;
> >> +	/** @mend: End address of the mapped region */
> >> +	u64 mend;
> >> +	/** @offset: Offset within the mapped region */
> >> +	u64 offset;
> >> +};
> >> +
> >> +/**
> >> + * struct fastrpc_remote_dmahandle - Remote DMA handle descriptor
> >> + */
> >> +struct fastrpc_remote_dmahandle {
> >> +	/** @fd: DMA-BUF file descriptor */
> >> +	s32 fd;
> >> +	/** @offset: Byte offset within the DMA-BUF */
> >> +	u32 offset;
> >> +	/** @len: Length of the region in bytes */
> >> +	u32 len;
> >> +};
> >> +
> >> +/**
> >> + * struct fastrpc_remote_buf - Remote buffer descriptor
> >> + */
> >> +struct fastrpc_remote_buf {
> >> +	/** @pv: Buffer pointer (user virtual address) */
> >> +	u64 pv;
> >> +	/** @len: Length of the buffer in bytes */
> >> +	u64 len;
> >> +};
> >> +
> >> +/**
> >> + * union fastrpc_remote_arg - Remote argument (buffer or DMA handle)
> >> + */
> >> +union fastrpc_remote_arg {
> >> +	/** @buf: Inline buffer descriptor */
> >> +	struct fastrpc_remote_buf buf;
> >> +	/** @dma: DMA-BUF handle descriptor */
> >> +	struct fastrpc_remote_dmahandle dma;
> >> +};
> >> +
> >> +/**
> >> + * struct fastrpc_phy_page - Physical page descriptor
> >> + */
> >> +struct fastrpc_phy_page {
> >> +	/** @addr: Physical (IOMMU) address of the page */
> >> +	u64 addr;
> >> +	/** @size: Size of the contiguous region in bytes */
> >> +	u64 size;
> >> +};
> >> +
> >> +/**
> >> + * struct fastrpc_invoke_buf - Invoke buffer descriptor
> >> + */
> >> +struct fastrpc_invoke_buf {
> >> +	/** @num: Number of contiguous physical regions */
> >> +	u32 num;
> >> +	/** @pgidx: Index into the physical page array */
> >> +	u32 pgidx;
> >> +};
> >> +
> >> +/**
> >> + * struct fastrpc_msg - FastRPC wire message for remote invocations
> >> + *
> >> + * Sent to the remote processor via RPMsg. This is the exact layout
> >> + * the DSP expects; do not reorder or add fields without DSP firmware
> >> + * coordination.
> >> + */
> >> +struct fastrpc_msg {
> >> +	/** @remote_session_id: Session identifier on the remote processor */
> >> +	int remote_session_id;
> >> +	/** @tid: Thread ID of the invoking thread */
> >> +	int tid;
> >> +	/** @ctx: Context identifier for matching request/response */
> >> +	u64 ctx;
> >> +	/** @handle: Handle of the remote method to invoke */
> >> +	u32 handle;
> >> +	/** @sc: Scalars value encoding in/out buffer counts */
> >> +	u32 sc;
> >> +	/** @addr: Physical address of the message payload buffer */
> >> +	u64 addr;
> >> +	/** @size: Size of the message payload in bytes */
> >> +	u64 size;
> >> +};
> >> +
> >> +/**
> >> + * struct qda_msg - FastRPC message with kernel-internal bookkeeping
> >> + *
> >> + * The wire-format portion is kept in the embedded @fastrpc member (must
> >> + * be first) so that &qda_msg->fastrpc can be passed directly to
> >> + * rpmsg_send() without a copy.
> >> + */
> >> +struct qda_msg {
> >> +	/**
> >> +	 * @fastrpc: Wire-format message sent to the DSP via RPMsg.
> >> +	 * Must be the first member.
> >> +	 */
> >> +	struct fastrpc_msg fastrpc;
> >> +	/** @buf: Kernel virtual address of the payload buffer */
> >> +	void *buf;
> >> +	/** @phys: Physical/DMA address of the payload buffer */
> >> +	u64 phys;
> >> +	/** @ret: Return value from the remote processor */
> >> +	int ret;
> >> +	/** @fastrpc_ctx: Back-pointer to the owning invocation context */
> >> +	struct fastrpc_invoke_context *fastrpc_ctx;
> >> +	/** @file_priv: DRM file private data for GEM object lookup */
> >> +	struct drm_file *file_priv;
> >> +};
> >> +
> >> +/**
> >> + * struct fastrpc_invoke_context - Remote procedure call invocation context
> >> + *
> >> + * Maintains all state for a single remote procedure call, including buffer
> >> + * management, synchronisation, and result handling.
> >> + */
> >> +struct fastrpc_invoke_context {
> >> +	/** @node: List node for linking contexts in a queue */
> >> +	struct list_head node;
> >> +	/** @ctxid: Unique context identifier (XArray key shifted left by 4) */
> >> +	u64 ctxid;
> >> +	/** @inbufs: Number of input buffers */
> >> +	int inbufs;
> >> +	/** @outbufs: Number of output buffers */
> >> +	int outbufs;
> >> +	/** @handles: Number of DMA-BUF handle arguments */
> >> +	int handles;
> >> +	/** @nscalars: Total number of scalar arguments */
> >> +	int nscalars;
> >> +	/** @nbufs: Total number of buffer arguments (inbufs + outbufs) */
> >> +	int nbufs;
> > 
> > If it is inbufs + outbufs, why do you need it here?
> > 
> >> +	/** @pid: Process ID of the calling process */
> >> +	int pid;
> >> +	/** @retval: Return value from the remote invocation */
> >> +	int retval;
> >> +	/** @metalen: Length of the FastRPC metadata header in bytes */
> >> +	int metalen;
> > 
> > size_t, also why do you need it?
> > 
> >> +	/** @remote_session_id: Session identifier on the remote processor */
> >> +	int remote_session_id;
> >> +	/** @pd: Protection domain identifier encoded into the context ID */
> >> +	int pd;
> >> +	/** @type: Invocation type (e.g. FASTRPC_RMID_INVOKE_DYNAMIC) */
> >> +	int type;
> >> +	/** @sc: Scalars value encoding in/out buffer counts */
> >> +	u32 sc;
> > 
> > How is this different from the counts above?
> sc carries the method id and handle counts. The reason to maintain count
> separately is to avoid calculating it again and again.>

Is it just a sum of several values or something more complicated?

> >> +	/** @handle: Handle of the remote method being invoked */
> >> +	u32 handle;
> >> +	/** @crc: Pointer to CRC values for data integrity checking */
> >> +	u32 *crc;
> > 
> > Add it later. It's unused. Drop all unused fields.
> ack.>
> >> +	/** @fdlist: Pointer to array of DMA-BUF file descriptors */
> >> +	u64 *fdlist;
> > 
> > Why do you need DMA-BUFs in the invocation context? They all should be
> > GEM buffers.
> the reason is that the users are dependent on FDs as they can import
> buffers allocated from anywhere and there are DSP APIs which takes fd as
> an argument, so they might end up using the same in there skel
> implementation.>

No, DSP API can't take FD, they don't quite cross the OS and IOMMU
boundary. It's the userspace library API. Which might be improved,
rewritten, implemented underneath, etc. For the kernel side please,
pass _only_ GEM handles + offsets.

> >> +	/** @pkt_size: Total payload size in bytes */
> >> +	u64 pkt_size;
> >> +	/** @aligned_pkt_size: Page-aligned payload size for GEM allocation */
> >> +	u64 aligned_pkt_size;
> >> +	/** @list: Array of invoke buffer descriptors */
> >> +	struct fastrpc_invoke_buf *list;
> >> +	/** @pages: Array of physical page descriptors for all arguments */
> >> +	struct fastrpc_phy_page *pages;
> >> +	/** @input_pages: Array of physical page descriptors for input buffers */
> >> +	struct fastrpc_phy_page *input_pages;
> > 
> > I think you are trying to bring all the complexity from the old driver
> > with no added benefit. Please don't. Use the existing memory manager.
> > Let it handle all the gory details. If someting is not there, we should
> > consider extending GEM instead.
> I'm not changing the metadata format as the DSP might not understand the
> messages if we modify it.

Well, it's up to you to know if DSP will understand the message or not.
The probability ("might not") is not suitable here. Anyway, let's get
rid of the various data formats first, then maybe some of the items will
go away on their own.

> Also, the fd is still being used because of
> the client dependency on it. I'll check if there is any other logic that
> needs alteration here.>

If the client keeps on passing FD to the library calls, you can map
FD to GEM handles in the library code.

> >> +
> >> +static int fastrpc_context_get_id(struct fastrpc_invoke_context *ctx, struct qda_dev *qdev)
> >> +{
> >> +	int ret;
> >> +	u32 id;
> >> +
> >> +	if (!qdev)
> >> +		return -EINVAL;
> >> +
> >> +	ret = xa_alloc(&qdev->ctx_xa, &id, ctx, xa_limit_32b, GFP_KERNEL);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	ctx->ctxid = id << 4;
> > 
> > Why is it being shifted?
> this is to accomodate PD type>

Not really an answer.

> >> +	return 0;
> >> +}
> >> +
> > 
> 

-- 
With best wishes
Dmitry

