Return-Path: <linux-media+bounces-55454-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEXEJgcKsmlnIAAAu9opvQ
	(envelope-from <linux-media+bounces-55454-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 01:34:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4514426BB3B
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 01:34:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A062A302511F
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 00:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5137A33507E;
	Thu, 12 Mar 2026 00:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Ke1fOa9i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFCA2512DE
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 00:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773275652; cv=none; b=bkUZYEoxoYzTMzEAY7XFC7wsG2qzxLoR1FdhSn8XDweq27dP1VnqxFAOn6z6YGhzhLdRI9XH7U/wduV1kNhamUj7z5G1DwlriXC6bKL7VimgNK8M2J5nnNxFEPa7v+GaBQp5CItSJknXH3erAr81e/cGwkfAIOPYocY6HZBZNDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773275652; c=relaxed/simple;
	bh=Jwj40ySNMYku3d2yjr55Yeih0XswBk9HBherb/fv8B4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MMireyKC9hF/BOoND9V2LZREFit58ZsbAXqNFzrqkOQysztrp4AIwzaiFwM+gzWRaooM9klIr1iWIwjgfoldS6DDFvyEh28V3lUv9ZfCK3albrXpQRrPP+hcY88LICI0i9tiBRBfEgLx9ZmnIqURurwgAdEqjJwedzxrfWvQSL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Ke1fOa9i; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8cd759f502dso39176685a.3
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 17:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1773275650; x=1773880450; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oVlsIEeUlShNo2vVDcti72NQw3N4AQ0tu/N5/EFylTo=;
        b=Ke1fOa9i4Hm1p0iyNH4sOLACbToqt2gSDyscEbsAKNOzPHO0Uh2aQk6u6+D1r74ris
         kj/DLEerZibBqHCA92eTaMB32ldZbbNeqzgOViE9+dn07NNc/r8e6Vi9lS+J+6EjtfP3
         O8TNC9/G4ZE9lGyzbwIXpglK19b7Q698gMsH2+cUxQAKIz53qPYZhcVPgofjTYspiD5A
         iuuPNVYLq8MoyPiywVCW8OYF++nAXbiZ9mSljYXKm0DAWjiUCPrS5sL1J3Ot0P420HJi
         FzZ7SPB7+zWfmetW04uy7vbUUzGz5Qj7dbV9lJ7N0MXBA8Qukh0ahRj/NZmETY6tcpOJ
         9v/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773275650; x=1773880450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVlsIEeUlShNo2vVDcti72NQw3N4AQ0tu/N5/EFylTo=;
        b=YL/yfNqe/GroJszXZQkQqP2pFbnWwsgryUoJnwD4WCDNloUdDQXOCyMWn1h2E+7Uzd
         EFM+xNd6lGqJBmKkvXv90bAF2eTtbCudbJZ4GVwPDYWIL7lpcUnbKaEwWBfjlVK/11Fl
         r3GmTK9BoR8fbhwUZAkGmbbo5UCyGaOu2kARpsepLklrbcvnbanigWGkvaa49LCtKFeB
         SBKygqrDs3q/h0SuAmD3W0U0FNDIohItNLAak6B6cF16uwTRqfJRsC8LhjCWi8waVeJq
         u5tPCLv5CZaLvYr7pJee3tKho5/hwW5up4zl67rb/n/dBYU/q7srefMmmXtzc6oUWDQu
         sO0w==
X-Forwarded-Encrypted: i=1; AJvYcCVCYPKqukIsfjaOai/M9bJ7/4bIZHeW4QA0cWhmrCZoRZNXSi+dtOUF+a54Y+G/78sewejyJqQEdJjH+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yymimqp2O7iHWrclarjzFgstLzVii3tRhhS1FRTsmZw253S/Kyj
	2bon+lbwoI/lVJtVodhX59MEpRG7PkmASxy7ZycTTVGnf/mVLpR8BWWJ+WO55qOHEOA=
X-Gm-Gg: ATEYQzz2ejvxelggCZxJ9UKhZK/VWltM38hb5KTkHE0KLvR/WalUgUaDOaYlEYxy1M0
	G8EYEp/DlRL6+oABJZD87oJM1qMXbgwPvGu8WJodH9puy2AGRKCNreFjHk5EdqDWpWWxan7RQ99
	+df0vizMiINRnovkrnzGjJkVJCAMSqPnIgs3xq7t+khVRYZO0qzhYTyI1I1xDHQbHWpFelQf6cS
	TeSIomALl6/SwK7IqfnxtKOpV7Q0pzeLTeRDtMCgf47b54kAU+RKOPXeZprV71Q4UmK7LTZyY/q
	qTtuRzP+hMb1m3nLPvjfM+4LT1FVmL7zosGK0dm3A23lQ/6UVon2p4nmaH0c9j60+RVoBds7M6b
	HrIfm/nzSeYoZk2LELSd2G21VgUQMUHQo+GiGwqLdum/MfEVaBp7C5JbqkCMZr01rLfOjGo/ECj
	x2Iq8ZYBQVXhl3BpGJeRZ0Xv6TFs76JgOtNGM6VaVulU6eVAO3m9phDYKJPa6Z+4YU7LGyFRDVk
	K+4jrwi
X-Received: by 2002:a05:620a:298e:b0:8ca:305b:749b with SMTP id af79cd13be357-8cda1ac2072mr553438885a.60.1773275650360;
        Wed, 11 Mar 2026 17:34:10 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda212cac1sm263453685a.33.2026.03.11.17.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 17:34:09 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1w0U08-00000006Zyx-3dXg;
	Wed, 11 Mar 2026 21:34:08 -0300
Date: Wed, 11 Mar 2026 21:34:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiri Pirko <jiri@resnulli.us>
Cc: Leon Romanovsky <leon@kernel.org>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/2] dma-mapping: introduce
 DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Message-ID: <20260312003408.GA1469476@ziepe.ca>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-2-jiri@resnulli.us>
 <20260308101948.GO12611@unreal>
 <20260309131530.GJ1687929@ziepe.ca>
 <20260309140233.GW12611@unreal>
 <20260309151857.GO1687929@ziepe.ca>
 <phry3e2dtgxzxdqvrnqfuskangp4al64f2auithwme5kwkgepe@7qtftrhgv4l7>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <phry3e2dtgxzxdqvrnqfuskangp4al64f2auithwme5kwkgepe@7qtftrhgv4l7>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55454-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:dkim,ziepe.ca:email,ziepe.ca:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4514426BB3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 09, 2026 at 06:51:21PM +0100, Jiri Pirko wrote:
> Mon, Mar 09, 2026 at 04:18:57PM +0100, jgg@ziepe.ca wrote:
> >On Mon, Mar 09, 2026 at 04:02:33PM +0200, Leon Romanovsky wrote:
> >> On Mon, Mar 09, 2026 at 10:15:30AM -0300, Jason Gunthorpe wrote:
> >> > On Sun, Mar 08, 2026 at 12:19:48PM +0200, Leon Romanovsky wrote:
> >> > 
> >> > > > +/*
> >> > > > + * DMA_ATTR_CC_DECRYPTED: Indicates memory that has been explicitly decrypted
> >> > > > + * (shared) for confidential computing guests. The caller must have
> >> > > > + * called set_memory_decrypted(). A struct page is required.
> >> > > > + */
> >> > > > +#define DMA_ATTR_CC_DECRYPTED	(1UL << 12)
> >> > > 
> >> > > While adding the new attribute is fine, I would expect additional checks in
> >> > > dma_map_phys() to ensure the attribute cannot be misused. For example,
> >> > > WARN_ON(attrs & (DMA_ATTR_CC_DECRYPTED | DMA_ATTR_MMIO)), along with a check
> >> > > that we are taking the direct path only.
> >> > 
> >> > DECRYPYED and MMIO is something that needs to work, VFIO (inside a
> >> > TVM) should be using that combination.
> >> 
> >> So this sentence "A struct page is required" from the comment above is
> >> not accurate.
> >
> >It would be clearer to say "Unless DMA_ATTR_MMIO is provided a struct
> >page is required"
> >
> >We need to audit if that works properly, IIRC it does, but I don't
> >remember.. Jiri?
> 
> How can you do set_memory_decrypted if you don't have page/folio ?

Alot of device MMIO is decrypted by nature and can't be encrypted, so
you'd have to use both flags. eg in VFIO we'd want to do this.

Jason


