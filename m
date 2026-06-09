Return-Path: <linux-media+bounces-64339-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m4eVB3yYKGp8GgMAu9opvQ
	(envelope-from <linux-media+bounces-64339-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 00:49:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3CB664A7C
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 00:49:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BTr+6a2F;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64339-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64339-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A5EF3068459
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 22:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537593EEAEA;
	Tue,  9 Jun 2026 22:45:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84C73E450A;
	Tue,  9 Jun 2026 22:45:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781045141; cv=none; b=AUzTHYsVYzYQCMgZy+5moO7mvgBSMyy7C5oTXPpX7CRvEXlaKSVugRX3dtxVKKX+trne2bV6oGROGqfWMXLbJ0RF4sjVMOUdk9R8EzAmbUiDqVVxxFCC9ILhjqyEC+a5IO5VbV1IT0VI4XpLseTBfThp3eOe76t210qLr6/taP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781045141; c=relaxed/simple;
	bh=Yl6uFB7h4FcM9O57SFPkn7nr1pJ4LVyJ2RloXgxYQdY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=MJ8bUBNnjO0i8GxCo8TE9wMMIjrJ+wMEw90hODP/5eaXcy0JB0ZWOKPQ3XM1XobQHgBO71ECc++DhkK+KAO97q4CcK8cYrgvhzmfvudjD/kYz39Qndi3Yz2dZ8l7TiPe6QmD9XE2NJOn7ODpBqyQ4zSPaL8bb4DUEtlNsbbaP5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BTr+6a2F; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516961F00893;
	Tue,  9 Jun 2026 22:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781045140;
	bh=RsrMhm/FSh8bMoXqXZM8Zp+wWxL61CZwNUdEQaR+aVc=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=BTr+6a2FceXyQwi6ug2vSzw899jOk6cKAsipEiFouGdN9G5sFC+hWzeyurQ3aerOW
	 jZ5HtkIKmyJeIw+s2izHlxhEM4UH4RTn5T0V8Yph1VdbYJuLzCYRHjRqHWDyI+DWXX
	 W8XiGb9XZ8DfBHSBZrr66ugzufM+I9p6dcgO5IdVOcmJa+pRNYsSUgveLhah9qgHcO
	 wPhfrXGEcLgBnMXGoxVlaenHLPexD+iMFew2tzVTd7HAG5/uzkFq9dnsCm8GW2d/1B
	 u91VtOSzJsOgGlWZfopQOt2TKhdRL9ZI21iaTzIjzJnpOTDqNl1qw826z51K6Mtwwu
	 9anj7xfA6487g==
Date: Tue, 9 Jun 2026 17:45:39 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex.williamson@nvidia.com>,
	Matt Evans <mattev@meta.com>, Leon Romanovsky <leon@kernel.org>,
	Alex Mastro <amastro@fb.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Mahmoud Adam <mngyadam@amazon.de>,
	David Matlack <dmatlack@google.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Alistair Popple <apopple@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	kvm@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 1/9] PCI/P2PDMA: Add CONFIG_PCI_P2PDMA_CORE
Message-ID: <20260609224539.GA175244@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529230553.GE3195266@nvidia.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jgg@nvidia.com,m:alex.williamson@nvidia.com,m:mattev@meta.com,m:leon@kernel.org,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER(0.00)[helgaas@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64339-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bhelgaas:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A3CB664A7C

On Fri, May 29, 2026 at 08:05:53PM -0300, Jason Gunthorpe wrote:
> On Wed, May 27, 2026 at 03:09:46PM -0600, Alex Williamson wrote:
> > This deserves a /* CONFIG_PCI_P2PDMA */ reference like the previous
> > long span, though potentially a better solution would be to split the
> > core code out to a separate file with shared header.  I asked opus to
> > see what this would look like and it generated the patch below
> > (unverified, compile tested only).  Bigger diff, harder to follow
> > blame, but the shape of the core is much more apparent.  You're welcome
> > to take or leave it.
> 
> I think it is a good idea, it will make it easier to add more stuff to
> these different aspects.
> 
> Really they are now two different things with one layered on top of
> the other.

Sounds good to me too.

