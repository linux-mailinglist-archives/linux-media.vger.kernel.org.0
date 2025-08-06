Return-Path: <linux-media+bounces-38979-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AC5B1CE20
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 22:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A095E627C2F
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 20:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4658C21FF26;
	Wed,  6 Aug 2025 20:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mjn/KwJD"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D18204583
	for <linux-media@vger.kernel.org>; Wed,  6 Aug 2025 20:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754513913; cv=none; b=TuglT93srHN1ARWFAzx7erOnLBXVHEgZoSd8iJunatajrU71WzU/ehEIY7W/WQYyz1vvoPjawWzlVvpErlVliZya1bsskQ+uv7Wx4rora4/LraSCAU1rVTJoXWwSaONtYT4JckPZPESzGJW7CGp3ERMMnSHfc2lnvVj8T6uF/+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754513913; c=relaxed/simple;
	bh=U1FeQRtLiG+q4sfmdpJ9bCgp5uUUcwrffLKyNe3Rxms=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cuPyF32K0X8YMZbRsh8mUvFV+GfECTrGX+/K/IE5z1oDD7B32wWSa9mBk2KEnHTPgqmQBgNyhCsgWcW3+3rYGorXv8zhVmGWiQdAtkXV9ywG9hyPeHxn/dBpeAaoi+eAy0LV1pG0qLXiJ4YOC8t5Jlw1eDW13Tv1qfApB1GTXCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mjn/KwJD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754513911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XL3JtSDnypcZCdbt3A90Mr99TpavO/k4/VrpLyiBez8=;
	b=Mjn/KwJDx4NWLHwmUop1Nqv4WAyrfRGGPQ6VLWLppjTzE2fHxEDvXhWKsDEjLYkfuCFLbn
	AjIl1GJZS0YnG13/Xqcrhdvw0jy+6kR8Pn5RnfUDpi25BypfqRn7oCyHUidd0u0p1gFlYn
	ROE/bZzCah4n6hvqXHras3zGrMdDY0Q=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-5srO-zKOOwOiHhUMbddl1Q-1; Wed, 06 Aug 2025 16:58:29 -0400
X-MC-Unique: 5srO-zKOOwOiHhUMbddl1Q-1
X-Mimecast-MFC-AGG-ID: 5srO-zKOOwOiHhUMbddl1Q_1754513909
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3e3fdfa4b39so512575ab.2
        for <linux-media@vger.kernel.org>; Wed, 06 Aug 2025 13:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754513909; x=1755118709;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XL3JtSDnypcZCdbt3A90Mr99TpavO/k4/VrpLyiBez8=;
        b=H3EhS6QG8WPCI7Bi/qqNwiEgwjprDbAQcnuAXbzRVUaajBKQ9uaNMBOn7IkW9Ikmae
         nEHQPlXBqzdX2hGwNgPsRRLN5aiQ9Fnr/fEWQkNj0odnvJR4WJKYIU+j3rOCYupKA+KE
         qFWtkyC2qLOCRSRQyNMxcQI5q+JdLpTzm1hpc5BRzmJEhZn3mCunCCU2Tw8lwkVB13SB
         /Kc21PM6hQA4VMNpmAwly8MJhSE15ff4yvil80MLmSXI0mkb9rv5DlJP2qzq6dv0DRz1
         SLh2AChny6GoFZoMZl/oTywnWUY+8hOWZQtycvka10OwJpguCNMurjXZBHz+uX/WuMoU
         zB3A==
X-Forwarded-Encrypted: i=1; AJvYcCXZRP/j2fdh6zozaCoCEHLOODjEG8sPy3kigZ1MwNuq4PcI0Fvm6aOOGSU1WmGDcCJSBNnZ5Xk3Lnzujw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIQg74kGX8S8twwmm9dKcEE4S0IQR2kuOjbsWYqTN/zEjLJ81u
	Uur62NaKNJ0Mn9GqvGrLR8JKIJq0Ze5iYIlzj5hbninPq1LY266Zg4R3wkt/OVwoaogsbzRbC23
	d2l9mJn/qQSV79JscC0FpFfUCu+C2k2BSQnYNQq5CympZVF0+37FP3v/4gjHMzyDe
X-Gm-Gg: ASbGncsXcVsjDrDq+8fsHkSmnS4Sb0GSBOSXro5cgoV3VU8jcxr0RXLa1WZWJzeqizZ
	0qxFueLONscQyKHeBGtTGBH7V3NK0Kxug6aMf7iUEgBX58LOoBnqBXEz7P8BOXhDrk2422wvvje
	y3Zm9iJrxBpVZNC4cTV8/x7FvfZ8xVAYzMK7Liwz3t3T3oEtYCV/3GO/lm1NUA847evWSCnv+9J
	WQg3zJ1zIbhRGxOEyKVlc9ROlwS8UII9LZpzRTDzXODrK/v8vTS3jyReKliz5EAy8cJnY9Yb4Jb
	uj9Cy695cuuPu1N+NXB5GbwiFmp8siAhg8pLOS4SqQg=
X-Received: by 2002:a05:6e02:152e:b0:3e3:d2eb:52db with SMTP id e9e14a558f8ab-3e51b79eae2mr20687235ab.0.1754513909048;
        Wed, 06 Aug 2025 13:58:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvMHObcGautLtJ7984K/wyyriLvMdPXmyUUT5V0nwJ7vFbNm7fOcxZIXtiLyBYuGHd6raZZQ==
X-Received: by 2002:a05:6e02:152e:b0:3e3:d2eb:52db with SMTP id e9e14a558f8ab-3e51b79eae2mr20686945ab.0.1754513908609;
        Wed, 06 Aug 2025 13:58:28 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ab01e84desm2049992173.51.2025.08.06.13.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 13:58:27 -0700 (PDT)
Date: Wed, 6 Aug 2025 14:58:25 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Leon Romanovsky <leonro@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Christoph Hellwig <hch@lst.de>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, Jens Axboe
 <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org, Logan Gunthorpe
 <logang@deltatee.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin
 Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v1 01/10] PCI/P2PDMA: Remove redundant bus_offset from
 map state
Message-ID: <20250806145825.2654ee59.alex.williamson@redhat.com>
In-Reply-To: <c9b6237964b9606418af400bb6bec5178fcffff2.1754311439.git.leon@kernel.org>
References: <cover.1754311439.git.leon@kernel.org>
	<c9b6237964b9606418af400bb6bec5178fcffff2.1754311439.git.leon@kernel.org>
Organization: Red Hat
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon,  4 Aug 2025 16:00:36 +0300
Leon Romanovsky <leon@kernel.org> wrote:

> From: Leon Romanovsky <leonro@nvidia.com>
>=20
> Remove the bus_off field from pci_p2pdma_map_state since it duplicates
> information already available in the pgmap structure. The bus_offset
> is only used in one location (pci_p2pdma_bus_addr_map) and is always
> identical to pgmap->bus_offset.
>=20
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/pci/p2pdma.c       | 1 -
>  include/linux/pci-p2pdma.h | 3 +--
>  2 files changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
> index da5657a020074..274bb7bcc0bc5 100644
> --- a/drivers/pci/p2pdma.c
> +++ b/drivers/pci/p2pdma.c
> @@ -1009,7 +1009,6 @@ void __pci_p2pdma_update_state(struct pci_p2pdma_ma=
p_state *state,
>  {
>  	state->pgmap =3D page_pgmap(page);
>  	state->map =3D pci_p2pdma_map_type(state->pgmap, dev);
> -	state->bus_off =3D to_p2p_pgmap(state->pgmap)->bus_offset;
>  }
> =20
>  /**
> diff --git a/include/linux/pci-p2pdma.h b/include/linux/pci-p2pdma.h
> index 075c20b161d98..b502fc8b49bf9 100644
> --- a/include/linux/pci-p2pdma.h
> +++ b/include/linux/pci-p2pdma.h
> @@ -146,7 +146,6 @@ enum pci_p2pdma_map_type {
>  struct pci_p2pdma_map_state {
>  	struct dev_pagemap *pgmap;
>  	enum pci_p2pdma_map_type map;
> -	u64 bus_off;
>  };
> =20
>  /* helper for pci_p2pdma_state(), do not use directly */
> @@ -186,7 +185,7 @@ static inline dma_addr_t
>  pci_p2pdma_bus_addr_map(struct pci_p2pdma_map_state *state, phys_addr_t =
paddr)
>  {
>  	WARN_ON_ONCE(state->map !=3D PCI_P2PDMA_MAP_BUS_ADDR);
> -	return paddr + state->bus_off;
> +	return paddr + to_p2p_pgmap(state->pgmap)->bus_offsetf;
>  }
> =20
>  #endif /* _LINUX_PCI_P2P_H */

Looks like you're relying on this bogus code getting resolved in the
next patch...

In file included from kernel/dma/direct.c:16:
./include/linux/pci-p2pdma.h: In function =E2=80=98pci_p2pdma_bus_addr_map=
=E2=80=99:
./include/linux/pci-p2pdma.h:188:24: error: implicit declaration of functio=
n =E2=80=98to_p2p_pgmap=E2=80=99 [-Wimplicit-function-declaration]
  188 |         return paddr + to_p2p_pgmap(state->pgmap)->bus_offsetf;
      |                        ^~~~~~~~~~~~
./include/linux/pci-p2pdma.h:188:50: error: invalid type argument of =E2=80=
=98->=E2=80=99 (have =E2=80=98int=E2=80=99)
  188 |         return paddr + to_p2p_pgmap(state->pgmap)->bus_offsetf;
      |                                                  ^~
./include/linux/pci-p2pdma.h:189:1: error: control reaches end of non-void =
function [-Werror=3Dreturn-type]
  189 | }
      | ^

to_p2p_pgmap() is a static function and struct pci_p2pdma_pagemap
doesn't have a bus_offsetf member.  Thanks,

Alex


