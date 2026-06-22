Return-Path: <linux-media+bounces-65424-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GSbhLK7BOWpGxAcAu9opvQ
	(envelope-from <linux-media+bounces-65424-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 01:13:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B69336B2CBC
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 01:13:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=shazbot.org header.s=fm3 header.b=WUziQHNE;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="O V4/ZkV";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65424-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65424-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=shazbot.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D252B30148E1
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 23:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1013E35201E;
	Mon, 22 Jun 2026 23:13:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C9430C177;
	Mon, 22 Jun 2026 23:13:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782170024; cv=none; b=mrk0MAUfz/SMf58oWvQb+IlUuThMsNN2yob4qO0CKlvhXuZa/blkIDMevAMHdi/0/A81wePSS9EGfr7Utom9Gtq1pIOBvMgSuEkqMcuIhChj0d6sJ9l2XlQAuvh+WpUvSaHmS3zVbVo6g5bMHwZitp1MTi+uSD6Pise1/OGnBTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782170024; c=relaxed/simple;
	bh=oh7A0RAI7tER7bqo8zvulV+7B3H4XJvkEeb7ZI9wWNE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AQLKQpRxOwqd1ubtC915XBUeZUz3jWFzdr1t+i+t9N3jBJ+PGcsFJ12cOuXyTvL7P9KTk20PzKseBkE2eS8LqBAgOqlwGG9BYEuaOFDnxnxdgFDLjn4HTO280okSOWZFp+wHDyGPauS6CL3d+NCg40qpQEzl23TKy/segVBDIhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org; spf=pass smtp.mailfrom=shazbot.org; dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b=WUziQHNE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OV4/ZkVe; arc=none smtp.client-ip=202.12.124.151
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 8D0601D0007E;
	Mon, 22 Jun 2026 19:13:39 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 22 Jun 2026 19:13:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1782170019;
	 x=1782256419; bh=uucNtPV0I4MmovhtQhP25ytZEAiupQRi/0ihEK8Rhgo=; b=
	WUziQHNE7zVmdQgAmci+JZYcwo5KkO7QkV18LNAwi7KpDkmZNhnzcYFcpJ3s0i/M
	vNREOL3IJz7PpYtITSnURTXJ57NoKKtI3p8VdnvvqSByGNgqwb1K7ZYv4LWzS4RA
	eGv77QMZNsNPOKWuMvM1u/Y/vGWVhPMaP4pDOjOppZPTk4Lo8pCwb1U285lX0mlr
	LU5wlhsrTvA9a/4vuG0IS2vA4/tzWFQ4hyAGJv1Ote0P448ilKVTwjoqLvmTgETJ
	OwMJ5DwEQcB9yyC8YwngLajZNQPzFpYXW2VCjtXQQhw2J+Nfuchc5nhLAyh1pFhZ
	DlkzfMuA+M+8++cskbekUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782170019; x=
	1782256419; bh=uucNtPV0I4MmovhtQhP25ytZEAiupQRi/0ihEK8Rhgo=; b=O
	V4/ZkVegwfYWhFi0CV7x3abQDcI+EMvP45aV65xUXGtBskn14RQSorce+nkWRjYT
	0vUGzsysby5GrQmfBqRPvk3q5Sw0hugavUFZKFpoMMgcv9AU1yvyy3W+nImUH7kS
	SjZ9hUrIx21b1w8iKUk4ZoSZZ/hyni3dzn4Y4rW/Tn+KmJFahhUaGlLCJ1HEtbsZ
	liIrrHtxpgMUXWhG1yE0zc/1ID7ryZkyO6/L5edSt0ZPnpaOSBMp3f1FUifbx8QE
	yLCSp9BFxoc1A92qOC7tdkgtmNtqVDR+ZbZx8lN2afLKCauJBD5nDne8uBZD5W1f
	9+CUmnJk4mdEJL7Aasgxw==
X-ME-Sender: <xms:osE5amVAIHeztFw-x6Jk2cu55pC7pZjRmwM1b6KSRuWDVIR_KTwJvg>
    <xme:osE5auT4VLIfXIAUlUSHsDevdDOku6mOhxO5YVA14ZP6wQU4fUtEtfDHpEMcONgLa
    IyEYJJ6uwCk3lY4ms7SZGpQuP2VZ8TxsKa5tcvL7lJN_k22wfgP4A>
X-ME-Received: <xmr:osE5alEqQwwWFiCYO4WZS1y5iWQi4KDBwYCSMyaTEHpytxplrQpDKe4ePGE>
X-ME-Proxy-Cause: dmFkZTGuB1iEvMd+xObr0XHRyjLZ564bpkukI0Iv4VBGAc8kgQK8balQPxjO1J5KLzYhKR
    605IkjMxDcJA3PQXGOzAsP/a2qqkAveVav1mQz9sz74ejDOcAB1nKTxQ7Az8dn9NDB7h8n
    +L2GIz2S0KD7QFR9SCO4MwHg5bwilIvRQO7bD+P5oYMomqi4MEOeSdsCHP7Rf6V1uHGLX2
    l7K4NU176pHC8FwN4H4t7mIC+q15Zr24Jg9CULQ0OPMN5s1BgXLPViD1WwvdGiaSncZTkr
    vUvs/iZX+9xQgrK4KW+Mao1JDSNl0pLKn1jUH20f08qmwfuaHj/qztG6zl30Uq93PjoxQZ
    wS77CvLYhcgPkDVyh4OTwLfcbYCQBsP49N/qo4B5pGr3VrP4wC3EX/HMbpI0o7tnDHb8Vr
    dUC4KsTR3XohX349NH0qkcYTAnuTvQmU/XTH8vCSFrDenwTlit8BbuyrmZseJPmljYQw3o
    PWcMojRyNylo1GmUE6eVDYC9by8NKCN+P0P1PQ5Ihrtv1L5gGdXsmSAS4/IA5pgOjuwoIi
    NSBRh+8VABI8itiZZG5BczewX+sa5k66o9ZINFwJJwvHN0vYAKq36XZ/yTRhj3byJ0e9qU
    HKnIZbA0Hu543idA6+zPiDc8rMNS/K44j7bYaQUhGnsbNgzDb/OZthtS+zpQ
X-ME-Proxy: <xmx:osE5auQRdJ-u5l69g5wM4Vu2WcHAuhdDct942-89KQW2FN0yytXFAA>
    <xmx:osE5avq1a6u06jjKTm1185wY59wOCaNiXYckcLCmpR46D3RNQpZi4w>
    <xmx:osE5akoor8Je3GunK-NO3i0DgcNRVxJ6W3IxDvfEK4Pb1RMhly4orw>
    <xmx:osE5ai32xmGiXLj6RW-XweJ-e7SwioBikp0RZ0FO4IbKQbCKHT5hNQ>
    <xmx:o8E5al5-Lz15wn6QttNoyZquTps-g1qYfxAJNhiR6Nk3RW_7DR1N8Mu8>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Jun 2026 19:13:37 -0400 (EDT)
Date: Mon, 22 Jun 2026 17:13:36 -0600
From: Alex Williamson <alex@shazbot.org>
To: Matt Evans <matt@ozlabs.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 Pranjal Shrivastava <praan@google.com>,
 Leon Romanovsky <leon@kernel.org>, Alex Mastro <amastro@fb.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Mahmoud Adam <mngyadam@amazon.de>,
 David Matlack <dmatlack@google.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Ankit Agrawal <ankita@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 alex@shazbot.org
Subject: Re: [PATCH v3 6/9] vfio/pci: Clean up BAR zap and revocation
Message-ID: <20260622171336.7d13f548@shazbot.org>
In-Reply-To: <55ea7422-08d8-4c92-aa59-8ff6f9e9d781@ozlabs.org>
References: <20260610154327.37758-1-matt@ozlabs.org>
	<20260610154327.37758-7-matt@ozlabs.org>
	<aixgZQiBQKgS7yIM@google.com>
	<DM6PR11MB3690489DB5FA611413BF60558CE52@DM6PR11MB3690.namprd11.prod.outlook.com>
	<ajGbRE3WWJxNxcrg@google.com>
	<BYAPR11MB3687AE280241C9E00B46FCF98CE42@BYAPR11MB3687.namprd11.prod.outlook.com>
	<24f34e59-7c3b-4b56-83bf-cb07e3f369a6@ozlabs.org>
	<20260619133116.GB278945@nvidia.com>
	<55ea7422-08d8-4c92-aa59-8ff6f9e9d781@ozlabs.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[shazbot.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[shazbot.org:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65424-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matt@ozlabs.org,m:jgg@nvidia.com,m:kevin.tian@intel.com,m:praan@google.com,m:leon@kernel.org,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:alex@shazbot.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[shazbot.org:+,messagingengine.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[alex@shazbot.org,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@shazbot.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,ozlabs.org:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B69336B2CBC

On Fri, 19 Jun 2026 16:13:17 +0100
Matt Evans <matt@ozlabs.org> wrote:

> Hi Jason,
> 
> On 19/06/2026 14:31, Jason Gunthorpe wrote:
> > On Thu, Jun 18, 2026 at 05:02:58PM +0100, Matt Evans wrote:
> >   
> >> My understanding is that the sequences above wake a device that happens
> >> to have previously been put into D3, and AFAICT it could only have got
> >> there because of a previous vfio_pci_set_power_state().  Seems its only
> >> caller is from the emulation of PCI_PM_CTRL using
> >> vfio_lock_and_set_power_state(), and this zaps/revokes BAR access before
> >> a transition to D3.  Similarly, an attempt to access a BAR via an
> >> ioctl/through vfio_pci_core_do_io_rw() fails the D3 check in
> >> __vfio_pci_memory_enabled(), and besides will try to take the memory_lock.  
> > 
> > I thought the general design was the bars were made inaccessible
> > before going to a low power state, and remain inaccessible while it is
> > in low power?
> > 
> > So the order of D0 doesn't matter. If it is not in D0 then there is no
> > mappings and zap/revoke is a NOP.
> > 
> > If is it in D0 then it doesn't matter because D0 is a nop.  
> Yes, that's what I'm getting at. :)  If it's in D3 then BARs are
> inaccessible, so as long as we go into D0 before the DMABUF move, the
> order of the zap relative to the "go to D0" doesn't matter.

I believe this is correct as well, but importantly we cannot assume
that a stray read or write just returns -1 or gets dropped.  This is
exactly why we have such hard protections against the user accessing
the device while it's disabled.  Not all platforms, even within
architectures that might otherwise be considered lenient of such
accesses, consider this benign and might escalate to system level
faults.

Let's be careful not to frame this as "the access doesn't matter
anyway", the answer is instead that non-D0 devices already lack any
mappings to access the device.  Thanks,

Alex

