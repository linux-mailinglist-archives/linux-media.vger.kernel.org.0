Return-Path: <linux-media+bounces-43444-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E927BAF2B2
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 08:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E07BB19206DE
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 06:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2928827AC21;
	Wed,  1 Oct 2025 06:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="Lno9QIue";
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="x+r31yfq"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FC917A305;
	Wed,  1 Oct 2025 06:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759298642; cv=pass; b=GcsKGmmRYJKdiGsIXHMulY0Sdvi6lN2RYE1cxa0mlyt1vo/PoRSliJTcQ7W6C6gwxr5z7nJY9SQSov+DOFobySU0NroZRutp8HZJgcW7NcgHGtR0NDJzp0s8iRAGgRaQ/SQnVq1yL8dVn3evW2HG6ZI+DkV8Z5xp7tPNuF4J3Dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759298642; c=relaxed/simple;
	bh=JxLk5jGqbQblNsSB0zOJAtfYJHn9g4zpvampSMxj2X8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fSjxl40HCgo6tz4ZWe6htgBs+/MD4wbKhHLUS3pPL//zK+wc0ENf+vMYXQAH+bJnSGPGBfywfkmwdIMp5eMpfJj5lnUNws7moxuRMk++bcPVWVCWczdXv02VgeEGAoYvAQvRAqJw2MTnATeOCZ8xyGeHh2RGZO8vMauu/SPmwfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=Lno9QIue; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=x+r31yfq; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lahtoruutu.iki.fi (Postfix) with ESMTPS id 4cc49w0MXjz49QFl;
	Wed,  1 Oct 2025 09:03:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1759298628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jW4Im9F8xFHKXmTGaRIQznWZloQR5WOD3R5kATp41j8=;
	b=Lno9QIue84M636bcXXO9sdLCVvQ7FC+G1khmwoeuAwlbdRwriZSFeUfEY6tvZMoZhQevNi
	vKYn1Oq5D9+R5DRIx13mxqqylCfgxd6kglF5BeGwKACZuBpawy4D5DJdjKNQMaTuzrVlVV
	M86AmCTDicPBMPYbNMI+FL2n2wvSlN3h5bvDnHgUDXEKXsri53Dg8DX/Bw+rAw9SC81hB6
	Y+1Srd+1OIfuWWesxD36TiFLCkXWSes++EQQzkHkTeTO8xhUo+ZCe+fgXf0qk68lyM/BZj
	nMkQoDOBdvFUjwjUR2Qbi57mZot89iobrJqlZ04i5FItRUyA3iJyLQwDzHNvIQ==
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4cc49k3M0lzyQK;
	Wed,  1 Oct 2025 09:03:38 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1759298619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jW4Im9F8xFHKXmTGaRIQznWZloQR5WOD3R5kATp41j8=;
	b=x+r31yfqnJTgNafbe8gt6eKvZX7qcTGa4yOnOMwjsNO7EYc5R74vQuUnrrbUTBOpmux/kA
	RcpwjWANvgJx6fjo6F2m4ib88lWE4EpREYTgmtSFVISGSv69NuWQaL+K1gsVzr9yZ5ZF76
	fCTLa63YR0VvoGN7y8lFyx90eG3TN/U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1759298619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jW4Im9F8xFHKXmTGaRIQznWZloQR5WOD3R5kATp41j8=;
	b=SzY6Mfc9JD0IvyQIp1lVcAcJdp1I17s1YixMSPlsK7Uhb0xCWQbmpmu3Ghgr5HHC972GuR
	S8KOYSWq7tj7H3vAcnpDGK9UkwveqYesdAc5Az7a568228gHAImI6ayc29SnF14fnqRQfo
	AnY3LsgrA/kSjMGhqvv55HZCsH8fuHE=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1759298619; a=rsa-sha256; cv=none;
	b=zLEkjZDrMCxfrPwCiI0WLd70dYmxEumaWlIPdgBBWSaVju1DL34mFlpLthoZs7NOzMvt89
	vy7IL66EnwrR7NuYAMbf2szByc9zPDL5Ott2ydWCwXi9oyKTPux+ug8HGIt3eM77FaovkB
	uncP/0UaLEiBEAoDuQC7dWbT5sS8zsg=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 95477634C93;
	Wed,  1 Oct 2025 09:03:37 +0300 (EEST)
Date: Wed, 1 Oct 2025 09:03:37 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, iommu@lists.linux.dev,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu: __iommu_attach_group: check for non-NULL
 blocking_domain
Message-ID: <aNzEOeCi8Zjn9S3N@valkosipuli.retiisi.eu>
References: <9a3ebe9b-518e-49ef-b87d-925d951a446f@kernel.org>
 <20250929120734.GG2617119@nvidia.com>
 <58aabb55-0030-49df-81ed-d4a68174b57e@kernel.org>
 <20250929130214.GK2617119@nvidia.com>
 <4037d353-0ec4-4f68-a09c-564b93ba313b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4037d353-0ec4-4f68-a09c-564b93ba313b@kernel.org>

Hi Hans, Jason,

On Mon, Sep 29, 2025 at 03:30:22PM +0200, Hans Verkuil wrote:
> On 29/09/2025 15:02, Jason Gunthorpe wrote:
> > On Mon, Sep 29, 2025 at 02:18:50PM +0200, Hans Verkuil wrote:
> >> On 29/09/2025 14:07, Jason Gunthorpe wrote:
> >>> On Mon, Sep 29, 2025 at 10:23:47AM +0200, Hans Verkuil wrote:
> >>>
> >>>> Since I am unfamiliar with the iommu core code, I am uncertain whether I am
> >>>> just papering over a bug elsewhere, or whether this is really the correct solution.
> >>>
> >>> It is papering over something, group->domain is not supposed to be
> >>> NULL at this point.. That probably means the iommu driver has not been
> >>
> >> It's group->blocking_domain that's NULL, not group->domain.
> > 
> > Er, I thought you were hitting a false positive on this:
> > 
> >   group->domain != group->blocking_domain
> > 
> > ie NULL != NULL
> > 
> > But I suppose the whole expression is checking for group->domain
> > already.
> > 
> > All your patch does is entirely disable the safetly logic :\
> > 
> > What is isp_attach_iommu() trying to accomplish? It does
> > arm_iommu_detach_device() and then arm_iommu_attach_device() ?
> > 
> > Why?
> > 
> > Is this trying to force a non-identity translation for ISP?

The omap3isp driver expects to use its own virtual address space for the
ISP: the video buffers are mapped there as virtually contiguous (physically
they can be whatever).

-- 
Kind regards,

Sakari Ailus

