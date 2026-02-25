Return-Path: <linux-media+bounces-53378-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KU/O3ETn2nWYwQAu9opvQ
	(envelope-from <linux-media+bounces-53378-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:21:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5711997E5
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61404305B8E1
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 15:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5773D6465;
	Wed, 25 Feb 2026 15:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="olWIYesR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA72392800;
	Wed, 25 Feb 2026 15:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032371; cv=none; b=Y/TiUNJ4/KfWFn3y+55dksVkBgWbdfGhZMJIwj256yV6LG+S6rWRTnkkW2XD3qz8kHj0s6s/0RkHvuBDVpsk7TLIoEf8L0JAdZ34El+ELMpCeVz9tNMEL80SBKFRDtxYrnab3/gmS3e/Q9o6WXebKe/+u/tsSsit1xyL3sCmw+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032371; c=relaxed/simple;
	bh=WBE2By5FzkP5SLbnPSG3o0NgugwGTYXwxmVW/sbRDIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5rVnAgp/XPYlGqbeWC5ssrEAJ7YQc6ougQaNQBmpVM3INZ9ULwunvYd3sh/SDBQzCqnNiEj6Rab5scednPm8ABIW8xDbYbkai6cCSJa6xCG03gDb2wke820TKmNnTmsz15msA8lgJIu8ZrgXRZDBaPQoczNHNXaaSxCyXDC7yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=olWIYesR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73BEFC116D0;
	Wed, 25 Feb 2026 15:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772032370;
	bh=WBE2By5FzkP5SLbnPSG3o0NgugwGTYXwxmVW/sbRDIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=olWIYesRWiw65xkODMWGjed+aMm2qj32u6gVvmfLAViXpgfQ1gV5euIFOYqvzyXKS
	 1oBjv1D1FTk1wR7rMSeAmVBJmSYp1VZMujILP/lxeKQLisP+WFoCBJSvHgrg3aUY3G
	 o55VFauH6L5QLsO4DYrMf5yk93ODqho4R4lpocJaU2wzmq0zPxpd0cTDezXbJtbtdP
	 /OJCdoFKX0X5bkE917xIuyjMETyXUBUHJ86z0zVUQQOfhQ0d3fwlrlGb+29Bjbz5N6
	 c7uzqpRNp6BBV/ZOpgHGboQQIXulvsYguBBOqtlXiUDdZB9VHUdXaViALWDNYzYiOp
	 VtX+a33PmtVOA==
Date: Wed, 25 Feb 2026 09:12:46 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, 
	Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bharath Kumar <quic_bkumar@quicinc.com>, 
	Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 01/18] accel/qda: Add Qualcomm QDA DSP accelerator
 driver docs
Message-ID: <opjniedtfhkv7vlb57g3xyikcfkxelthx3lmspmypws4vxz4oc@4uypmmf4t6fb>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-1-fe46a9c1a046@oss.qualcomm.com>
 <e94ce683-d47c-4c8e-8b26-cd327c891cc8@oss.qualcomm.com>
 <5a278b02-f2ad-408b-b0ad-f2297817bd7e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a278b02-f2ad-408b-b0ad-f2297817bd7e@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53378-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,quicinc.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0F5711997E5
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 07:47:08PM +0530, Ekansh Gupta wrote:
> 
> 
> On 2/24/2026 9:03 AM, Trilok Soni wrote:
> > On 2/23/2026 11:08 AM, Ekansh Gupta wrote:
> >> Add initial documentation for the Qualcomm DSP Accelerator (QDA) driver
> >> integrated in the DRM accel subsystem.
> >>
> >> The new docs introduce QDA as a DRM/accel-based implementation of
> >> Hexagon DSP offload that is intended as a modern alternative to the
> >> legacy FastRPC driver in drivers/misc. The text describes the driver
> >> motivation, high-level architecture and interaction with IOMMU context
> >> banks, GEM-based buffer management and the RPMsg transport.
> >>
> >> The user-space facing section documents the main QDA IOCTLs used to
> >> establish DSP sessions, manage GEM buffer objects and invoke remote
> >> procedures using the FastRPC protocol, along with a typical lifecycle
> >> example for applications.
> >>
> >> Finally, the driver is wired into the Compute Accelerators
> >> documentation index under Documentation/accel, and a brief debugging
> >> section shows how to enable dynamic debug for the QDA implementation.
> > So existing applications written over character device UAPI needs to be
> > rewritten over new UAPI and it will be broken once this driver gets
> > merged? Are we going to keep both the drivers in the Linux kernel
> > and not deprecate the /char device one? 
> >
> > Is Qualcomm going to provide the wrapper library in the userspace
> > so that existing applications by our customers and developers
> > keep working w/ the newer kernel if the char interface based
> > driver gets deprecated? It is not clear from your text above. 
> Thanks for raising this, Trilok.
> 
> This is one of the open items that I have. I'm not exactly sure what would be the
> acceptable way for this. 
> 
> As you mentioned, applications that rely on /dev/fastrpc* might not work on QDA
> without modification.
> 
> I was thinking in the same lines as you have mentioned and  having some shim/compat
> driver to translate FastRPC UAPI to QDA. The compat driver would expose the existing
> character devices and route the calls to QDA. The compat driver could be built via Kconfig.
> 

This is a fundamental requirement, you need to address this in order for
this to move forward.

Which makes me wonder if it would be possible to reach an accel driver
through incremental transition of the current driver, instead of just
dropping in a few thousand lines of new code/design.

> However, I haven’t encountered an example of such a UAPI‑translation driver in the kernel
> before, so I would want guidance from maintainers on whether this is an acceptable
> model or not.
> 
> Regarding your question about library, all the APIs exposed by github/fastrpc library are kept
> unchanged in terms of definitions and expectation. The same project can be build for both
> FastRPC and QDA based on configure options. So, the applications using github/fastrpc should
> not face any problem if the libs is built with proper configure options.
> 

You're assuming that the kernel and userspace are a unified piece of
software, they are not. It must be possible for me to install a new
kernel package without having to replace the userspace libraries.

Regards,
Bjorn

> I have noted your point regarding the doc not providing clear details, I have added interface
> compatibility information in cover letter and will try pulling the same to Doc.
> >
> > ---Trilok Soni
> 
> 

