Return-Path: <linux-media+bounces-59519-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YO/jHIxQ62nkKwAAu9opvQ
	(envelope-from <linux-media+bounces-59519-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 13:14:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EA52545D8F5
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 13:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A400301CD97
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 11:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD043AC0C7;
	Fri, 24 Apr 2026 11:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bmWYFYeG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DDC3A962E;
	Fri, 24 Apr 2026 11:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777029211; cv=none; b=cBG2I7zV3gVdKRe3Hk1vCLvywVwH5BfAM0xbJmAOx8ZJdHUmfwxFSerGWRHhA8jM+FcvCaRy+0Q3U7r0SUJrNIN0dPy4XAF1nXOFwPElChpgvzvkqseJ5GRNKtqouIxqmRZUCSzJ/8CzSpWpyQe84jADnXGJ/gbORdWQjUJfZPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777029211; c=relaxed/simple;
	bh=GqTs5ygTosFneocKlPAOSsqLvTcgAi1JqGhpB7fqPO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ahmXJ2clxcAt0tUIlGwsdSNVAtrDWE+Y2AJ0uwAU700b6pOT7VaJD21tPEhgEYc5oCjW1doMfEMnJ0TgTymxl1XPTEy99RwoKSHBJ9PqcxqnTp+CpGEkkHX/SU6GUe3hWzyL7F/GtGix9TGkifEolu9KylYE0N4UY9tbTht92ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bmWYFYeG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B317C19425;
	Fri, 24 Apr 2026 11:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777029210;
	bh=GqTs5ygTosFneocKlPAOSsqLvTcgAi1JqGhpB7fqPO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bmWYFYeGbYMYG+FurHRaKqSkn/WAjZM4tyqApKy29MaSa0pS2QhfJ7BhV2FWlS7R8
	 +7naXHvd44tPIESI0DP0qLKtvg8i1pa7ncTFH6RgzPvrsurmEumHnN043jovr6nj5n
	 gP/JSsNiCdL2v0v9kbUJE99lp8N7eJBBJJrsQH10=
Date: Fri, 24 Apr 2026 13:13:28 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 02/13] drivers: base: Add generic dma context bus
Message-ID: <2026042422-deem-chemist-8d0f@gregkh>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
 <20260423-glymur-v2-2-0296bccb9f4e@oss.qualcomm.com>
 <2026042346-trustable-register-095a@gregkh>
 <06c04947-e72e-679b-493b-e112d693f391@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06c04947-e72e-679b-493b-e112d693f391@oss.qualcomm.com>
X-Rspamd-Queue-Id: EA52545D8F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59519-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,8bytes.org,arm.com,linaro.org,nvidia.com,gmail.com,ffwll.ch,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	TO_DN_SOME(0.00)[]

On Fri, Apr 24, 2026 at 04:01:13PM +0530, Vishnu Reddy wrote:
> 
> On 4/23/2026 7:07 PM, Greg Kroah-Hartman wrote:
> > On Thu, Apr 23, 2026 at 06:59:31PM +0530, Vishnu Reddy wrote:
> >> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >>
> >> When a driver needs to create virtual device at runtime and map it to
> >> an IOMMU context for memory isolation, there is no common bus available
> >> for this purpose. Each driver ends up implementing its own bus type,
> >> leading to duplicated logic across multiple drivers.
> >>
> >> host1x driver implemented its own bus type to attach an IOMMU context to
> >> a dynamically created device. The Iris VPU driver now has the same
> >> requirement. Rather than duplicating the same bus logic again, a shared
> >> bus type is introduced under drivers/base that multiple drivers can use
> >> directly.
> >>
> >> The bus takes care of creating a device and attaching the IOMMU context
> >> to it based on the client inputs.
> >>
> >> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >> ---
> >>  drivers/base/Kconfig            |  3 ++
> >>  drivers/base/Makefile           |  1 +
> >>  drivers/base/dma_context_bus.c  | 77 +++++++++++++++++++++++++++++++++++++++++
> >>  include/linux/dma_context_bus.h | 26 ++++++++++++++
> >>  4 files changed, 107 insertions(+)
> > as you can not have a device on multiple busses at the same time, this
> > makes no sense to me at all.  "dma context" is a bus-specific thing, so
> > please add it to the bus that you are wanting it for.  It can't be a
> > generic bus as that just doesn't work.
> >
> > Or what am I missing here?
> >
> > And why is DMA somehow "special" here from any other hardware attribute?
> 
> Let me give brief information which was discussed, in the initial series,
> the iris VPU used platform bus for dynamically created devices and we got
> the comment/suggestion from Robin to implement a proper bus_type with a
> .dma_configure callback.
> 
> https://lore.kernel.org/all/02b3d0f5-f94c-43cd-93af-97cfcf7751b1@arm.com/
> 
> based on the discussion, implemented the dma_context_bus and used for iris
> VPU devices instead of platform bus.

Why not make a irus_vpu_bus where you can do what you want?

> Here, the device have only one bus (dma_context_bus), not multiple buses.
> 
> Regarding the "DMA" naming, the core operation of this bus is its
> .dma_configure callback, which calls of_dma_configure_id() to map the device
> to a corresponding IOMMU stream ID. The name "dma_context" reflects this
> purpose.
> 
> I am open to suggestions from you or Robin or anyone else, if there is a
> better or preferred way to achieve this, I am happy to consider it and
> rework the implementation accordingly.

As there is only one user, just make this your own bus please and do all
of the needed bus operations for your devices there (i.e. don't hang an
"empty" device off of it.)

thanks,

greg k-h

