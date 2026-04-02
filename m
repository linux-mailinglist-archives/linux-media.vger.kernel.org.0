Return-Path: <linux-media+bounces-57949-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHKYLzdgzmnvnAYAu9opvQ
	(envelope-from <linux-media+bounces-57949-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 14:25:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2C538903F
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 14:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E5643060AE9
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 12:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4ADA3DFC9E;
	Thu,  2 Apr 2026 12:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LjGKf2zr";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pv+e99zb"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82EE3CB2DC
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 12:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775132599; cv=none; b=IxzMMGNfRZoPBdC8HH8H9ODptTaoHvDqqHVSKvKFSo+eeL1/85OZfoYOvqEa3ryE0TD1jvHwZ1Ky30LYAJj3tkifEdL9h2DO6DciabEyvMsZM5O2Z8YjuIoMXCdT9mmd8UyvFWPgoNE6GhfVgKfZBjOQ0/kufLAo/7jNBKD1+zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775132599; c=relaxed/simple;
	bh=ZmBGSEKxrm2sD1+zHMG9w0btvdw9ZsL148HNd6FLqgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5UfOuNZOMc7NKNEd/vtntFIWKno+NgGsYN6F7F9J/RscizkiXBNtJOSiTRh1DKA8+euPvgxTIjM1m89TTy7OAfD6edME0tfaQnqUdkHwhcMjZdVlGnbtAItRx8o8q2C1y8OYzTr+oUKmdiBK6AhMuydOlWuJuHpEXduB8CBAhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LjGKf2zr; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pv+e99zb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775132596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xRxSNukj518ppA3ZO+j946SBDUenrVVHerZheyJEcDQ=;
	b=LjGKf2zr/aRN2tOMCkH/oG/HIdRBC5uKqP6cQPGO8HHAZEo2aWMkwGJPnwtQMjQ1WfvEss
	X7lW/Qvv5sFC5A2wc2MmRq7OE13+Oly3HQBVJIRIx7h90ZT6ZRWNfdQ8D6Qkxm+ypkkJpy
	vQaBHQ1oaIwxQ0p6GN0PTaVV4PLNuRA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-qte7yeUrNDWBxDRMr66JvA-1; Thu, 02 Apr 2026 08:23:15 -0400
X-MC-Unique: qte7yeUrNDWBxDRMr66JvA-1
X-Mimecast-MFC-AGG-ID: qte7yeUrNDWBxDRMr66JvA_1775132594
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43d022974acso877822f8f.2
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 05:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775132594; x=1775737394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xRxSNukj518ppA3ZO+j946SBDUenrVVHerZheyJEcDQ=;
        b=Pv+e99zbXqzbS+FHIyllukokK1bt2Vz/6fHeLr3PH10BWlAxmTYBRpZcv0vVmpdtI/
         l+Z8M45q+RE9ICVDYpFTXy8o5S+/rq91MAFxMR6TxpcdJzMA4/815n9y/Wu7Cb+lfkg3
         wSbZOUHc1gLvidV0VQglOfPm2fxfXYMb4sJISNOxpcWJ5ObS2OCJNcn1TMvhkVLtAwO6
         BA7XTLJkVodKAX0HHCCq3emXlrQJg6MttoPSLciHcf4V/817RdRDvEiXpQJANA5mBxgv
         euOSmKKwUiNkXznzGLLyFXAmWnq0notvEZGnEcgdo0vVLktZJCIBKE8wuUnnrdJbCdjh
         0Xrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775132594; x=1775737394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRxSNukj518ppA3ZO+j946SBDUenrVVHerZheyJEcDQ=;
        b=Fw7qTdV4Q0t6hTzeG9rVcUMo99UmqgDoLZDl2aJd2ocwCeJxnvk4DbQQx6TOMUWXB0
         tOMbKcKXxjm0mBtgCrF1UqChcdcLBAQ38LhIh/kNEdEfqcnqXUjAdSKen0S05yR021fg
         oHzxBXC1KOal1yj4uLCekDWf1b4NPe9TZeo7OaPDMakqlNVVrBmMmMIkq1wGGS3jh6+k
         /CQiiKKmve5tbkbeNT+RC9hNATlss4kOpAqL6q0OhhHGhwEOjs8QB4akL2wpKNDucZBh
         3NK6utyUSOjS+g5TZN4jIMmJqwW7DhuT1eCHxEbIcUp679WHEfyjMvJhkvjgkCzfpY74
         HkiA==
X-Forwarded-Encrypted: i=1; AJvYcCVK+KSgNMgErc80TI0OU+X6N+bdnVgVUzr72FzkeUwGKsUkRR0Z1I9UuAeLCenmS0eErWw4W9m2tK4WYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNk6/E3ZCDIcz/MiCQSAbpcSxIha/V1bMcrFr2W3E1B2b6R3TX
	QAfPsqq6vRQdUDTef6+T2LNPBfzr3QLkyqlE8vWhafm4VQdbfTjdRMuqhRJNNOzNK09Vldqb1Qw
	lQGjWihXWHqyTEEN5W7R0NtXx/sqe9vAir8xi9azK2B2UxrORL/f1l8216z9hth3f
X-Gm-Gg: AeBDietVgtBHNsAq4jWA1f85TvTluTGod+57Ri8UVIZLD5HlOC4qu1q7MNVFJENgetS
	paet9r4DERuuPtW9xe9cm1Qyog9a8SV069FR8/k7UGC6uoUnXuLoPw1dbs8H/tL9WgOls7y0oCj
	EmB2HbJ74/1V1m/BY35J1h7J+IEEBk92tD1Lq8FhTp+QlWHuN2xnnbhlvxdn8XtsszRkpBo7sh+
	hsN8KLcMoO5+F9vnjytfWUcWjVtVfcVmYWDZRCjl3v9fUi+NLIGfVCtTACfpRpJEOG34MCXAQaw
	Ukafnl50e8ptm6Bmv31FBw5EBRjYh7arftqBLSXdeu76elDFMICJc/qWDOGzv1axJ7gCYTCCag=
	=
X-Received: by 2002:a05:6000:2409:b0:43b:6a16:17e with SMTP id ffacd0b85a97d-43d1505b105mr13705388f8f.11.1775132594204;
        Thu, 02 Apr 2026 05:23:14 -0700 (PDT)
X-Received: by 2002:a05:6000:2409:b0:43b:6a16:17e with SMTP id ffacd0b85a97d-43d1505b105mr13705319f8f.11.1775132593703;
        Thu, 02 Apr 2026 05:23:13 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d214f2b63sm4510096f8f.28.2026.04.02.05.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:23:13 -0700 (PDT)
Date: Thu, 2 Apr 2026 14:23:12 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, jgg@ziepe.ca, 
	leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH v5 2/2] dma-buf: heaps: system: add system_cc_shared heap
 for explicitly shared memory
Message-ID: <20260402-discreet-glossy-perch-bda4f9@houat>
References: <20260325192352.437608-1-jiri@resnulli.us>
 <20260325192352.437608-3-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="e65sn5i4kwgewwdb"
Content-Disposition: inline
In-Reply-To: <20260325192352.437608-3-jiri@resnulli.us>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57949-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 1B2C538903F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--e65sn5i4kwgewwdb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/2] dma-buf: heaps: system: add system_cc_shared heap
 for explicitly shared memory
MIME-Version: 1.0

Hi Jiri,

On Wed, Mar 25, 2026 at 08:23:52PM +0100, Jiri Pirko wrote:
> From: Jiri Pirko <jiri@nvidia.com>
>=20
> Add a new "system_cc_shared" dma-buf heap to allow userspace to
> allocate shared (decrypted) memory for confidential computing (CoCo)
> VMs.
>=20
> On CoCo VMs, guest memory is private by default. The hardware uses an
> encryption bit in page table entries (C-bit on AMD SEV, "shared" bit on
> Intel TDX) to control whether a given memory access is private or
> shared. The kernel's direct map is set up as private,
> so pages returned by alloc_pages() are private in the direct map
> by default. To make this memory usable for devices that do not support
> DMA to private memory (no TDISP support), it has to be explicitly
> shared. A couple of things are needed to properly handle
> shared memory for the dma-buf use case:
>=20
> - set_memory_decrypted() on the direct map after allocation:
>   Besides clearing the encryption bit in the direct map PTEs, this
>   also notifies the hypervisor about the page state change. On free,
>   the inverse set_memory_encrypted() must be called before returning
>   pages to the allocator. If re-encryption fails, pages
>   are intentionally leaked to prevent shared memory from being
>   reused as private.
>=20
> - pgprot_decrypted() for userspace and kernel virtual mappings:
>   Any new mapping of the shared pages, be it to userspace via
>   mmap or to kernel vmalloc space via vmap, creates PTEs independent
>   of the direct map. These must also have the encryption bit cleared,
>   otherwise accesses through them would see encrypted (garbage) data.
>=20
> - DMA_ATTR_CC_SHARED for DMA mapping:
>   Since the pages are already shared, the DMA API needs to be
>   informed via DMA_ATTR_CC_SHARED so it can map them correctly
>   as unencrypted for device access.
>=20
> On non-CoCo VMs, the system_cc_shared heap is not registered
> to prevent misuse by userspace that does not understand
> the security implications of explicitly shared memory.
>=20
> Signed-off-by: Jiri Pirko <jiri@nvidia.com>

I'm a bit late to the party, sorry.

This new heap must be documented in
Documentation/userspace-api/dma-buf-heaps.rst, but (and especially since
it seems like it was merged already) it can be done as a follow-up
patch.

Maxime

--e65sn5i4kwgewwdb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCac5frAAKCRAnX84Zoj2+
dnVEAX9CFXx//98RE08S4/htofGJDNunF07/14IluU1iYb8+94vCMi2iUvSzXSKI
zbgrVRgBfRy+pMU2nc+zOonhVfFvK813bX4cN9vLtMfH0/h/fKnFJKCc5msL12k4
8g97/3uO3A==
=FGaV
-----END PGP SIGNATURE-----

--e65sn5i4kwgewwdb--


