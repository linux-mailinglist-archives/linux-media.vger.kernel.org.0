Return-Path: <linux-media+bounces-59423-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNSKA8Yg6mntuQIAu9opvQ
	(envelope-from <linux-media+bounces-59423-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 15:38:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6756745315C
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 15:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8695A303A8FE
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 13:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60DB22C11D7;
	Thu, 23 Apr 2026 13:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="au64Nxy3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A974718BBAE;
	Thu, 23 Apr 2026 13:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776951427; cv=none; b=ae1qqdWJoSDBRnUNzT7hV71KKczsNG5yWRD8rpFqmQep8+eH7K+mkvR1UzVd2TymEZCf+kezLOo62vQNQmx/brzcTqgR/fm6fVRI55kvPBOjx4EVV+40hu5mweon3NFq6Xc+OxJHjGGuxJLuLesp0Kh2SqPSoO/+WgjfoZd3RLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776951427; c=relaxed/simple;
	bh=SCMeXc6iNHZVhRhU78udGlaYW9NkW14onQYu/AiF6M4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7LdzhQcL3vN43mHa1BoCZis0uXlR8COTZmcAtYZDemq7IDHjdf8EjI7VSMfPXZh56mFhS/nJxIKFA6J2z+Y6VCYKusJ07gy9lWC1WmGPFUCuUyBhrM5J7pYto1AvtQqSe/FMWKojNoTSpcFqXHx7Wpa1oDk7NIwgXic+rLEWfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=au64Nxy3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA45C2BCAF;
	Thu, 23 Apr 2026 13:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776951427;
	bh=SCMeXc6iNHZVhRhU78udGlaYW9NkW14onQYu/AiF6M4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=au64Nxy3WFohQJGnz3FSUq8C7RO3sPhLi5iwbU952kiR0Ope5w7kJ7cYGLG4z5SMC
	 e/VFjhoABO6Y7Anyln2loRbXXujZZXjWCvV/JbnsUf8poq5HkVfBCsog9kgnuwaH8M
	 BBlgRx59Y7oEpJWqqpEH2KOrwWDxjL8NrCi1uVSs=
Date: Thu, 23 Apr 2026 15:37:04 +0200
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
Message-ID: <2026042346-trustable-register-095a@gregkh>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
 <20260423-glymur-v2-2-0296bccb9f4e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-glymur-v2-2-0296bccb9f4e@oss.qualcomm.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59423-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,8bytes.org,arm.com,linaro.org,nvidia.com,gmail.com,ffwll.ch,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.234.253.10:server fail];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 6756745315C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 23, 2026 at 06:59:31PM +0530, Vishnu Reddy wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> When a driver needs to create virtual device at runtime and map it to
> an IOMMU context for memory isolation, there is no common bus available
> for this purpose. Each driver ends up implementing its own bus type,
> leading to duplicated logic across multiple drivers.
> 
> host1x driver implemented its own bus type to attach an IOMMU context to
> a dynamically created device. The Iris VPU driver now has the same
> requirement. Rather than duplicating the same bus logic again, a shared
> bus type is introduced under drivers/base that multiple drivers can use
> directly.
> 
> The bus takes care of creating a device and attaching the IOMMU context
> to it based on the client inputs.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/base/Kconfig            |  3 ++
>  drivers/base/Makefile           |  1 +
>  drivers/base/dma_context_bus.c  | 77 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/dma_context_bus.h | 26 ++++++++++++++
>  4 files changed, 107 insertions(+)

as you can not have a device on multiple busses at the same time, this
makes no sense to me at all.  "dma context" is a bus-specific thing, so
please add it to the bus that you are wanting it for.  It can't be a
generic bus as that just doesn't work.

Or what am I missing here?

And why is DMA somehow "special" here from any other hardware attribute?

thanks,

greg k-h

