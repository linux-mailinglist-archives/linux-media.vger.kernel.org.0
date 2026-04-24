Return-Path: <linux-media+bounces-59564-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFtRD+H062mcTQAAu9opvQ
	(envelope-from <linux-media+bounces-59564-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 00:55:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91760463EEA
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 00:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3F333011864
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 22:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7532376496;
	Fri, 24 Apr 2026 22:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="L0pqJjKg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C816536681B
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 22:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777071318; cv=none; b=KvK7NTrbOFa6JtzMZTUDj7lYF6lDCxEF/95t+rE9d0RsRmGITAfrsd6v4FUlOWNCgvHeDroPeb8m2MRREoYWDGWx1MC7FUDJVxdxrQaEg1OQzUHPBzSBzdyWON64ZMRssHIZn/SfiYYg7ybY9b8ycivPT1aFVYzJZ78MCTXC8mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777071318; c=relaxed/simple;
	bh=cV0Gxz7W/U+/DxuSBdghEEEy6w6inDWrgGPifnEQWHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cfys4mLP6MndIKXNenf3BeMtZM/li6++xfzML9kHkVM+HS4cfZP4inmYbeY8AWWgOTUPkRs5YAkwZlptuYZ3iJVJi3vGRsfXDqF4AdneBVNNUPkvB/Vh+X5TvzyEMrgRcvOuU1jghV7hZO7/jGKTNcbp5tGxbDY92+Ppxw2Ii3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=L0pqJjKg; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8a5800772f3so62280616d6.2
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 15:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777071316; x=1777676116; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dw33gELuGUNq59I/OY2f7G4Yqpl4DyjVQaY1TU/E47I=;
        b=L0pqJjKgWMGBvWnvTZOqsFccK/Fhk2jHIjd9N/zjbz5PJH3m1XriAff0oUn2epxo8K
         tOfUoH3UYAbkVg5vXfjjfpZNoUuFVu/PHlN1PQfGDXYlIVotdrjNHQJTDkGW23kcL5ax
         9Q523zpe5xvQbrz72BtzWR5B4hfNiS0B566YHYZxc19gOIEO9moytf46LE23oV0tM+IN
         YM6rQjw/kDa8F0ZPskhQ0Qnsl4LtuGkhekaldHCmIFLHvBUnNiq86nYxV9WxUitL182p
         41faqMylG5+btXlCwpgvo1XxKzWqKYr7obydnjJQOjhSUjAaIrrIpnyv3Fft6y4eVy52
         PpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777071316; x=1777676116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dw33gELuGUNq59I/OY2f7G4Yqpl4DyjVQaY1TU/E47I=;
        b=XSL2pytdXJ4uNkuIdOK9zVwAr7eGXnd+AaGeAJDl13Uml+EYgabXRU4ozq4lRmL3RB
         /rRxhjLT1OHE3PNXlFiA2FQ3SzEMQXZuEeSY+xPIilvH+Zc8eV2GN3x4m2m32i9eCwhV
         KrG70MNHrihqEqOnyT07tZL5sdAmeVSyYVyL+AbOYAv3Zjwg3fWjKHqqQsdHpndMh2UB
         gcCfxA191OkJH/4TXyPjqacLdX3C2Ml76iJp/i4exRGyV/JllARAZM4RyUDmulkA1XjW
         ZxllD2nqvR23iV57FBqTDgugF4+GnyrDgbRmJ4me/WJ1UXQ9Mt/2gssEY79gzKuyRDmC
         khHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zkjK+KoJYWGQjHoB5PnCzM1V2bzWPA0p6vkM9aIEHJfY5QOmuRcjGzRdW0ipkODzCXUHrk0KyQIxRWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKL+NxWZx+kBaoTnsB2TrnF97wkz4LeQ1NEL2+tXBBpvcKMh9c
	bQYhdPh0KHzYGNG4lUbk5km2MTX7EwA464S5YYqfY46o/1gNXPfBI/bcCoknvzXlNeA=
X-Gm-Gg: AeBDietIKknQ1wOY51FAez11GZg13GBIhjWI6My4CSyb1LOaOENXMaSQBGxPWkswMk8
	OPImVr1UWu4GEjwFnfvAnc4R31WMZUAatYr0LNMfAQc1Es04CZUmer6vORJz3GV3H7dn0OS9GzJ
	gzecXD5tPHhqfQu6jtwbLaDV7+HBgi5p2BJoi22MHCrppOnezPXtswFoNKHs1Xs7WM+gz1RYH4C
	SAZ/IbariIcls4WNw7Nw4OwHr7HyQTk4LBpJOXQ2uZ8KKfrqvUMvmHBbsg0W4fHLWkiWVUlDEeK
	ExEFrKJvlgT5n3kA3oriyfleNR4ftTdM4ri6KsHi76gaVCDBKfe9Z3dBMA8ewjzSjVKOF6z1N8P
	tbuBdAqeEJSgMcUGm9zjug6I3tsnF3rhUhGMUhFxfsePjolFGiyT2IssskPFbFff5OQjV5oBFJa
	gVBeXiASeJRl54PICzm7LgdQy7yJQ7SjoqBp3FUdvMQbbGasviI2s3026fwheCDRLNMFz5NhTj7
	Wg10ZeJdRC/MGY8
X-Received: by 2002:ad4:5f0e:0:b0:8b2:2474:8f3a with SMTP id 6a1803df08f44-8b224749034mr37604816d6.25.1777071315667;
        Fri, 24 Apr 2026 15:55:15 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac78513sm198480506d6.19.2026.04.24.15.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 15:55:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wGPQY-00000004wIG-2XfJ;
	Fri, 24 Apr 2026 19:55:14 -0300
Date: Fri, 24 Apr 2026 19:55:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com, leon@kernel.org,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	suzuki.poulose@arm.com, steven.price@arm.com,
	thomas.lendacky@amd.com, john.allen@amd.com, ashish.kalra@amd.com,
	suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH v5 1/2] dma-mapping: introduce DMA_ATTR_CC_SHARED for
 shared memory
Message-ID: <20260424225514.GE804026@ziepe.ca>
References: <20260325192352.437608-1-jiri@resnulli.us>
 <20260325192352.437608-2-jiri@resnulli.us>
 <yq5atst6ywbl.fsf@kernel.org>
 <4qdizkkoeke3cvkcf35upa7p7ick6s654eqlrizmi7ozkw5eze@tnpk2e34xgwl>
 <yq5awly0d504.fsf@kernel.org>
 <tteiecxfqy4k24wnzvp6ocxnuopyhmqtne2xwh5htwldlbzjnp@o6cbzdlurxld>
 <20260421121004.GA3611611@ziepe.ca>
 <yq5aik9jcpzm.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aik9jcpzm.fsf@kernel.org>
X-Rspamd-Queue-Id: 91760463EEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59564-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ziepe.ca:email,ziepe.ca:dkim,ziepe.ca:mid]

On Wed, Apr 22, 2026 at 02:48:37PM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Tue, Apr 21, 2026 at 01:53:31PM +0200, Jiri Pirko wrote:
> >> >> You reach there when is_swiotlb_force_bounce(dev) is true and
> >> >> DMA_ATTR_CC_SHARED is set. What am I missing?
> >> >>
> >> >
> >> >So a swiotlb_force_bounce will not use swiotlb bouncing if
> >> >DMA_ATTR_CC_SHARED is set ? 
> >> 
> >> Correct. Bouncing does not make sense in this case, as shared memory is
> >> already being mapped.
> >
> > It is a little bit mangled, there are many reasons force_swiotlb can
> > be set, but we loose them as it flows through - swiotlb_init()
> > just has a simple SWIOTLB_FORCE
> >
> > Ideally DMA_ATTR_CC_SHARED would skip swiotlb only if it is being
> > selected for CC reasons. For instance if you have the swiotlb force
> > command line parameter I would still expect it bounce shared memory.
> >
> > Arguably I think this arch flow is misdesigned, the
> > is_swiotlb_force_bounce() should not be used for CC. dma_capable() is
> > the correct API to check if the device can DMA to the presented
> > address, and it will trigger swiotlb_map() just the same without
> > creating this gap.
> >
> > Jason
> 
> Something like this?

Yeah that reads pretty sanely.

> static inline dma_addr_t dma_direct_map_phys(struct device *dev,
> 		phys_addr_t phys, size_t size, enum dma_data_direction dir,
> 		unsigned long attrs, bool flush)
> {
> 	dma_addr_t dma_addr;
> 
> 	if (is_swiotlb_force_bounce(dev)) {
> 		if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT))
> 			return DMA_MAPPING_ERROR;
> 
> 		return swiotlb_map(dev, phys, size, dir, attrs);
> 	}
> 
> 	if (attrs & DMA_ATTR_MMIO) {
> 		dma_addr = phys;
> 		if (unlikely(!dma_capable(dev, dma_addr, size, false, attrs)))
> 			goto err_overflow;
> 		goto dma_mapped;

I suspect P2P is probably broken on CC because this doesn't make
sense..

This should flow into the
phys_to_dma_unencrypted/phys_to_dma_encrypted block as well AFAICT, it
shouldn't just assign phys. Assigning phys to dma on a CC system is
always wrong, right?

It is is more like

        /* To be updated, callers should specify MMIO | CC_SHARED instead of
	 * implying it. */
        if (attrs & DMA_ATTR_MMIO)
	   attrs |= DMA_ATTR_CC_SHARED;

        if (attrs & DMA_ATTR_CC_SHARED) {
 		dma_addr = phys_to_dma_unencrypted(dev, phys);
 	} else {
 		dma_addr = phys_to_dma_encrypted(dev, phys);
 	}

        if (!dma_capable()) {
            if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT)
	       fail
        }

> and dma_capable() now does
> static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size,
> 		bool is_ram, unsigned long attrs)
> {
> ....
> 
> 	/*
> 	 * if phys addr attribute is encrypted but the
> 	 * device is forcing an encrypted dma addr
> 	 */
> 	if (!(attrs & DMA_ATTR_CC_SHARED) && force_dma_unencrypted(dev))
> 		return false;

Yeah

And with the above little edits it works for MMIO now too.

Jason

