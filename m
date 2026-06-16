Return-Path: <linux-media+bounces-65060-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9zC0K1+cMWqtoAUAu9opvQ
	(envelope-from <linux-media+bounces-65060-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 20:56:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AF869496E
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 20:56:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=boKy3whj;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65060-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65060-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F94C3257B54
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 18:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13ED647A0B2;
	Tue, 16 Jun 2026 18:52:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BC446AEE1
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 18:51:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781635919; cv=none; b=NMY6R8rjau/ocWK4hPin3dlPLHsa3fM2chc8Nj0HtqdgcQYzkuDoUw8p2w2CI/c5lwk/CnwhckfXdCyevzMEDA5T1DmnKD5Sd96VzGLkksssy8w9z8H7Ra0eAOrb0CGFN++s2ahubRZyoUgcIvEYcUpMFAReuIW8fyFzGuSU8Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781635919; c=relaxed/simple;
	bh=sZ7UNLwehwopPc6t3eGTeaf90dQl3G+H2ei/ClIX/X8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=opbcU+88tySAIHpLBbHW6iNXCKoVpJvvevSSYCAsYypORNrmJJvqmnGKDGZUx+wbyOHziXC7VKm7VarDx2Q/GzU0Cm+NQ23A9TIzs5HGklcotl1LmN3K14PSXubWp9h51fUQbzgzCLZoDy/2Ku+KX0pVET5MdQ6ds7cEc4v7Ejk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=boKy3whj; arc=none smtp.client-ip=209.85.214.178
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c6b7bd4e8dso10895ad.0
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 11:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781635918; x=1782240718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wvE0aCg+gv1l26GtSCjQQyNi/5Rf7OW5qgPEji4d+Bg=;
        b=boKy3whjYEJJm0rGPxoZsPFUXrYLfkE0KmCJKkJGtvZJWHAYiy9k3W7FxK9E35C+vv
         hnHOopHaPVWpMvT3JvtiIAaz97js7EBwzLbLdZJnxdhhTDubshQ/A0yd28nc7FViBqno
         W4ARWojYwqvib6My3+4Qon6aiOLWJd1HvcT87W6wgDn2An5yPZLt/7v10PAvQda79Fpc
         ySQy9XhVcZ+4HLhF2pka7k834a2GQUTRVpW7DiGQx2dUFNzVBtIOcFFua96S3nh0V+BJ
         +Ec/Zzgk1Gjm2C8VE+Ftn6lircTYtMvlkxqHzH1NHIHLI/kzqmWGJMNw9k9ZZu3OHU+Y
         5/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781635918; x=1782240718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wvE0aCg+gv1l26GtSCjQQyNi/5Rf7OW5qgPEji4d+Bg=;
        b=Isqfm9WdI1vIjP1Qese5I3co+c9Y1uP3SHVqJvswYKdYWDZJy/lutJYPXAg1mDW8vu
         1DVjvHPZ4wQn/2r2bqvuI0YdaKrHSpXXpe8KkJARjaaZD3P/biL/xgEohZqXE7tTuzgX
         OMbuEjXoHI0K+Plh4r8ubHmlscM+WKNXp8LGDFFhIxPoN3yYeIYxn+J/RUB0LgxUOQnY
         Hbkk8QndLJup+CXZfqUg6JA1nv5tTKjc1pSg29eKYiEThH3LxF9I0fQsouCdH/b6SGui
         f9E0TtHdf1IvxcwCVwxHKj0uiwK3pWawF5mlTDHwsl8aczjiUVsRI9+rlPbTkEBfnlrU
         CNqA==
X-Forwarded-Encrypted: i=1; AFNElJ/o3M6lTz4vQf2UABweoihdiGeb/d4PunZuvaeJbW+CClANvgl1Ri+5H5dCyEC23lrmZzq+K0k/HHZ9lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB2ktpVw7siN3bm6bIvx/Bfr9fzVuH49PHuwqwXC3uUW18niCi
	cg8JjYqoXHYUkdpJ9CJE5oLtsJ8VXakendKQ8H/TooUGR40z0UgOQOZwR1EwijwIew==
X-Gm-Gg: AfdE7clHbXe+Nq1jMcJfIReFj1vEBx4wvaxHigxIgS7kuc7n/w7O6lg5lxJnYpXDvBv
	mRTkfq0AQ7TCBe9sGdsgPYbSuI3jBZyPTZSi8Wb28DNh66PksOFC2t6KzX/Rd9A16xa4Cqqbmqe
	P0zjBnGlSBxHu68FJ1jDHNishRY69UPOnXnuBF3V14lv/nH2E0XtqEqxj2/RzbJfwUYe67jq0g3
	bRJwfVz4Ql7fKMhhHaZ2oSuu5MpBQpXuIsOKAW9/8DPAox6FZL+fFCAorsTtMRCEpiq70Oo8o6m
	DMO2Vp17DVcAhoM4ttM5wCLbKA1hddebstAtIudKbiynWoD6QJMKVghwudXLLz+cWuRgpMJGmxd
	tDHxVkNFZ+flmiYBV2O9Qr7b15fbKCLoP7slotQkQI98WlCQNGv7Vh78ffZDnp+C2WDc6FKYiPw
	bI6EzjgQhvzlH1Kr+Ofdqbv+XBrZYRBMcfyeirqndwQGgxEId/K8B6ppUVZmKD
X-Received: by 2002:a17:903:2f84:b0:2b0:b925:da98 with SMTP id d9443c01a7336-2c6bbc5d4eemr256505ad.19.1781635917134;
        Tue, 16 Jun 2026 11:51:57 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ad03fdcsm13472996b3a.24.2026.06.16.11.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 11:51:56 -0700 (PDT)
Date: Tue, 16 Jun 2026 18:51:48 +0000
From: Pranjal Shrivastava <praan@google.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Matt Evans <matt@ozlabs.org>, Alex Williamson <alex@shazbot.org>,
	Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	Alex Mastro <amastro@fb.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Mahmoud Adam <mngyadam@amazon.de>,
	David Matlack <dmatlack@google.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	"Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v3 6/9] vfio/pci: Clean up BAR zap and revocation
Message-ID: <ajGbRE3WWJxNxcrg@google.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-7-matt@ozlabs.org>
 <aixgZQiBQKgS7yIM@google.com>
 <DM6PR11MB3690489DB5FA611413BF60558CE52@DM6PR11MB3690.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB3690489DB5FA611413BF60558CE52@DM6PR11MB3690.namprd11.prod.outlook.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[google.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65060-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kevin.tian@intel.com,m:matt@ozlabs.org,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[praan@google.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praan@google.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 27AF869496E

On Tue, Jun 16, 2026 at 09:48:14AM +0000, Tian, Kevin wrote:
> > From: Pranjal Shrivastava <praan@google.com>
> > Sent: Saturday, June 13, 2026 3:39 AM
> > 
> > On Wed, Jun 10, 2026 at 04:43:20PM +0100, Matt Evans wrote:
> > > @@ -1264,7 +1265,7 @@ static int vfio_pci_ioctl_reset(struct
> > vfio_pci_core_device *vdev,
> > >  	if (!vdev->reset_works)
> > >  		return -EINVAL;
> > >
> > > -	vfio_pci_zap_and_down_write_memory_lock(vdev);
> > > +	down_write(&vdev->memory_lock);
> > >
> > >  	/*
> > >  	 * This function can be invoked while the power state is non-D0. If
> > > @@ -1277,10 +1278,11 @@ static int vfio_pci_ioctl_reset(struct
> > vfio_pci_core_device *vdev,
> > >  	 */
> > >  	vfio_pci_set_power_state(vdev, PCI_D0);
> > >
> > > -	vfio_pci_dma_buf_move(vdev, true);
> > > +	vfio_pci_zap_revoke_bars(vdev);
> > 
> > I'm wondering if this change in behavior is correct?
> > BEFORE this patch the sequence was:
> > 
> > 1. zap vma mappings
> > 2. Enter D0
> > 
> > After this patch the sequence becomes
> > 
> > 1. Take the lock
> > 2. Enter D0
> > 3. zap vma mappings
> > 
> > My worry is if user-space accesses a BAR *during* the transition to D0,
> > it could crash since the mappings still exist during the transition?
> 
> not 'crash' as you also noted later with all Fs on read and dropped writes.

Ack, "crash" is definitely a strong word, I just meant that the
user-space program isn't expecting to see all Fs today. Since today any
access during reset is faulted, however with this all apps may have to
lookout for all Fs during a read. Could this change cause existing apps
to crash?

> 
> > 
> > The old code is immune to it because it removed user-mappings first.
> > 
> > Following the discussion from v1 regarding the ordering of
> > vfio_pci_dma_buf_move() and the D0 transition.. while it makes sense to
> > perform the DMABUF revocation/move after the hardware is in D0.. I'm not
> > too confident about moving zap after D0 :/
> 
> probably add a comment to remind that ordering requirement for dma
> 

+1. That'd be helpful.

> > 
> > I mean, sure, the user would just see all Fs on a read and writes will
> > be dropped silently until we are in D0.. but the behaviour before this
> > change was that the user access will fault and hang on the memory_lock
> > instead which ensures that the user observes a consistent dev state..
> > 
> 
> I see this more consistent from another angle.
> 
> Old code only removes/blocks cpu access but not for device. DMAs
> are allowed to this device while it's transitioning between D0/D3.
> 
> New code at least make this part consistent - both cpu/p2p are allowed
> in the transition window.
> 
> Ideally a sane userspace shouldn't rely on the content read back when
> it has initiated a reset in parallel. So this behavior change sounds ok?

I agree on the CPU / P2P consistency part. However, my concern is for a
shared reset scenario where a reset triggered by one process (I guess it
was vfio_assign_device_set?) can affect multiple devices in a dev_set
that are owned by different, unrelated processes. 

In the old code, these peer processes are protected because their BAR
mappings are zapped immediately. Their MMIO threads simply stall in
a page fault until the reset is complete.

I agree for a single-reset scenario, sane user-space should never access
regions during a self-triggered reset.

Am I missing something?

Thanks,
Praan

