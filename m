Return-Path: <linux-media+bounces-64706-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Oxi6OHUkLGqjMAQAu9opvQ
	(envelope-from <linux-media+bounces-64706-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 17:23:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB7E67A80F
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 17:23:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=UEQjtDQs;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64706-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64706-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 609903259CB7
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 15:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031A2378811;
	Fri, 12 Jun 2026 15:17:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BACC2DCF41
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 15:17:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781277453; cv=none; b=MLqb5ygh/HEZfI7m+dhqvfrXhSiz+DMu5m0aAyyC4ULZUxEbJdQTH9dow9PSI25lDu1v4ldvklg7gFlisCCNxzyYE2NIsymTAI0COHXVgkH4SCgl7FwuytHgh8spU33nyShNzSVjUrP6JGEMLNvnm3RahndJ2sUl6c+4L7+pev8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781277453; c=relaxed/simple;
	bh=DqXswA747+6bYY1uTzSstZbbvVg2LEzGaCUeKcgc+fU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7SYK04WcNN6QIoIay7ThUQ990pzbJK02WMi7bee9oAvlrqM6zfEwqOdgWngRKp++R/3vxwCavbByUyK+Jnop+h9yQIHXDHaDDTkzuf3cJwHAfzh108btP7XzYyYXC2HwNMt8QMv9KStbi41LWfjB+IdIS7U99ymC9B9hbmmX4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UEQjtDQs; arc=none smtp.client-ip=209.85.214.177
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf22c18ad3so130665ad.0
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 08:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781277450; x=1781882250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TlOQuFqEcpnxb6HFkKMVShmOdVTUgHEmVlFieGLUVKw=;
        b=UEQjtDQsq/lIWi1Pg9wio9AzRjld2ZyfIkOFwjdET3EXPeCzyiibo6E1oXrfthJFUB
         0Un8XM89Wp1MVASPEp7Rbja2NwKr7FGWcCOQ3k2PN288cJ5SVhw3IUdB21kIJB6k+LKL
         JbqF+hVfaehq5vyNq6/QRVaNr5crULSsJ1U+/Stpoh2DnIwDjtUpVzsbD/VwynERgvBH
         s/7IADFDL99KS4Eitp3zbkpgu1gg5ZKVFNXYRnwgU8ZfRLf3MudqK3cWyVWp5JZkrluo
         JYuhWzu2uBV2+0UhcFbnkWqJDr1RA5YA/Q9WBiwPN4NuP/RB5cfwg73Z5EK6Z4BCx3KV
         Ik2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781277451; x=1781882251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TlOQuFqEcpnxb6HFkKMVShmOdVTUgHEmVlFieGLUVKw=;
        b=OUVHmIxZn+2++fdcjgMOG1uaovdXY409igr37QRDaQUqRo0sDvMWQGQmOL/zEAk6vs
         grS12p2gHrGBiCTruLAL8/HWZlIRSFUcH6oAmWekmAe6qlcvk/UIrJKW+9pPdljhOv38
         1x1d1xZyl0t4Ai8VUl17HVzsadmlPhKgnhz+G5slyDLVYxVDYlECL/LeO6Zl5t+8rxE9
         gwI6bJK00Awke5meX+o9ZrBVMo1wstYx13XEYJmnIDiddK5IFc2e9g4l1EY/sbM++P2d
         jHjqkBkMDxLPsRO0jpGn/LcLTOW3wyZztM0C+kq2MigKRmzzG5vGlj4DFWftrt6qozKX
         UhCQ==
X-Forwarded-Encrypted: i=1; AFNElJ9w+PlFROYiuH+zkFmAps4p99eMYcith0SS5oPqQkf14zPxK6M+3xzDgrAiqhg2U2bYGlrVlQKwEsfH1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLiHncLrjN6cfpnaT+uJzqOmLYKxWMLJ+zux6GTdHSajifE9lV
	lGcHxO0KItUjsKcJexep+o+Jxylbl9o/zCOubzjFy9sS6d+gSSpQt7SSpy2n32eQtw==
X-Gm-Gg: Acq92OFp2EbzJezuP0Yty2wvc48jm6hs1P89YqfGlknNRarCWs+7HC+Xaq+rXKIhfTS
	IgAHcmHPqukOxZpmELkg8QTXiFy0EB3DKUUtqqNvniAWHtLBAB0mVgBOjYKVQzO17c7ZYzLF1jO
	N+ViyNCRUehbdn/Rtu2xMJqXDesNZnB95FgKERZOLhaulUgYm9/HxDs21xaJtvl8W75NBBMZhCG
	67AWSDlyALbtsypbSKRE/mNtgZ0BlP05q0SsUMRhk5H62QsxnDREXxpcKID1AxPC9659pLhFFUX
	MzacVP+/PNtSRuSyYKdlwI5LCjErmCtmD6EjkGctP+4jfM0XuAI6jnXk3/UkqCfVoy0L7+OVxlj
	HEgCdHt0pxH9ivQCNz5C1vBulc3reUlwnac0tmGvA6k65EdkpBIKtm56G6rrzcdtK5RLjuhD5LS
	JJ2Yxb+GX2qimo4TbTQOxs1hMTCytWfS+KxNaFojamgjthCkyer/I5z6isvvOKHQB+9pYBQRY=
X-Received: by 2002:a17:902:e805:b0:2b2:70ba:305c with SMTP id d9443c01a7336-2c3e1160718mr2635095ad.8.1781277450033;
        Fri, 12 Jun 2026 08:17:30 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328a4c14sm22623545ad.43.2026.06.12.08.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 08:17:29 -0700 (PDT)
Date: Fri, 12 Jun 2026 15:17:21 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Matt Evans <matt@ozlabs.org>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
	Alex Williamson <alex@shazbot.org>,
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
Subject: Re: [PATCH v3 0/9] vfio/pci: Add mmap() for DMABUFs
Message-ID: <aiwjAbFVhPkkj-6U@google.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <DM6PR11MB3690A65EA9D8A9B77AF93E198C182@DM6PR11MB3690.namprd11.prod.outlook.com>
 <9812ae0f-8f22-4d62-a706-4c7232a5656b@ozlabs.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9812ae0f-8f22-4d62-a706-4c7232a5656b@ozlabs.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64706-lists,linux-media=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[vger.kernel.org:server fail,sea.lore.kernel.org:server fail,ozlabs.org:server fail];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matt@ozlabs.org,m:kevin.tian@intel.com,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	DKIM_TRACE(0.00)[google.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[praan@google.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praan@google.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ozlabs.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3EB7E67A80F

On Fri, Jun 12, 2026 at 04:11:50PM +0100, Matt Evans wrote:
> Hi Kevin,
> 
> On 12/06/2026 09:27, Tian, Kevin wrote:
> >> From: Matt Evans <matt@ozlabs.org>
> >> Sent: Wednesday, June 10, 2026 11:43 PM
> >>
> > [...]
> >>
> >>  vfio/pci: Support mmap() of a VFIO DMABUF
> >>
> >>    Adds mmap() for a DMABUF fd exported from vfio-pci.
> >>
> >>    It was a goal to keep the VFIO device fd lifetime behaviour
> >>    unchanged with respect to the DMABUFs.  An application can close
> >>    all device fds, and this will revoke/clean up all DMABUFs; no
> >>    mappings or other access can be performed now.  When enabling
> >>    mmap() of the DMABUFs, this means access through the VMA is also
> >>    revoked.  This complicates the fault handler because whilst the
> >>    DMABUF exists, it has no guarantee that the corresponding VFIO
> >>    device is still alive.  Adds synchronisation ensuring the vdev is
> >>    available before vdev->memory_lock is touched; this holds the
> >>    device registration so that even if the buffer has been cleaned up,
> >>    vdev hasn't been freed and so the lock can be safely taken.
> >>
> >>    This commit makes VFIO_PCI_CORE depend on PCI_P2PDMA_CORE
> >> (commit
> >>    1) to bring in (only) the P2PDMA provider code.
> > 
> > the last sentence is stale as the dependency is now added in patch4.
> 
> Right, will fix.
> 
> >>
> >> End
> >> ===
> >>
> >> This is based on VFIO next (e.g. at b9285405c5f6).
> >>
> > 
> > Sashiko failed to apply this series. Is there dependent work in vfio-next?
> > 
> > otherwise getting a Sashiko review is helpful here.
> 
> It _did_ depend on (at least the context of) some fixes in vfio-next.
> Looks like it'll rebase on master now those are merged.  I should've
> re-checked this for v3, oops. :|
> 
> (FWIW, I had Robot Claude Opus 4.8 to review several times up to v3.
> But I agree, Sashiko would be interesting too.  Can it be manually
> triggered with branch guidance?)

I guess relevant steps to run locally are here:
https://github.com/sashiko-dev/sashiko/blob/main/README.md

Additionally, we can try providing a base-commit (which points to a
public commit). 

Thanks,
Praan

