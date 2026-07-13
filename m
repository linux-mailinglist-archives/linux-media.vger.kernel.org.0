Return-Path: <linux-media+bounces-67528-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZIvKGXVpVWoVoAAAu9opvQ
	(envelope-from <linux-media+bounces-67528-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 00:40:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E120C74F8EC
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 00:40:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=MET43OUc;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67528-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67528-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F22BE30480FF
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 22:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85FF03B8BC5;
	Mon, 13 Jul 2026 22:40:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3715F35DA5D
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 22:40:23 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783982425; cv=pass; b=K7dZKxqk0rH/Vkdq2Xfpy8bLdXVNWvWYYt3+NUmbA3jMdtCNIA8nYKQAfY/OEaFJ4evtB0AdMy6yKth78QAHmcGg9Lj+cgXFGo+bPHQW/847bmYRfqE0SHtQqLJaxGdS/12//WCRr9/JLbJEnBNK+9CRxJ6L33h59vMXuNrQ5H0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783982425; c=relaxed/simple;
	bh=7LkfD6aXl9dK90wHStXoX1dSfuVb2Ck7kctZehI6Xxk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E9LN8RLSnz5IE4xlhlD6uXZSIYKP2EZRAIFySGpAQGJt7x3B9AY7ozjBZvcGZ+e3sWxHtojE/XwM3VAwFLGjlR/jNG8BcQjhxaQgAdkkH6S+PdnG5j3rXgo7RDZsnTWZdXKBpPB5igjofSveUGgqhdJH6Dbsvq2ne6xmaglRERo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MET43OUc; arc=pass smtp.client-ip=209.85.218.48
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c15cf78d1a2so62946366b.1
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 15:40:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783982421; cv=none;
        d=google.com; s=arc-20260327;
        b=cbOtvH0LaPRt9mnr6XBtzFxp8IQW0qA7crGFrJWGNbpuUjXp7m9zVk9RUj8h6qk+HB
         aKZ30E/K0M6FEgbOSe8KKVhzAd86vAn+/tJjyDrKQsuPZo2epGibO0daL3uMPm+cRO2m
         LTO16az4+HqgY72c1Wi6OQQtKVS8HEp0SvWZZO+1Wbjn2jjezxqxd3t2rNu75sQiSf/c
         NpoleapBaXBOG5pqbf0fKkSkTesYAkveBJVv7++X6TYZAlBmG0CYKuivLDtyOa0Qmgn0
         rW9dyTpaJJ473R+CPJWSKokWmX5bErwc/FIEd7ZFrdOgr9nL+vrak72VwkZHeVMAaraV
         nLOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=7LkfD6aXl9dK90wHStXoX1dSfuVb2Ck7kctZehI6Xxk=;
        fh=XzR+YQ5ZfK2rHEE4EC1AO1LSIg8r7EHuQgB5vS/bGQU=;
        b=i10RtDWTYj6xtqmU4uZ2qQk2w7uO/hgnbZQnpDCEpAE8DuJdG/PgB2Jk1T6BPXYcz3
         c8QfrZhb+LE4M0mwCcJnF6a+t1gegjVPDFe4v1b3QBPGcwJ4bWiBayp7h+DWTeLkHJ0k
         Nug/kwsAirye//12qOHvmU04M88eQmvl4t2dWd1w+qD0Nx7xFFiey0VLe1jaijXFRLBt
         d6hFe3vi5HZTuwxN+UviK9dVE8k9IPESZ7RAHuNqEvTPTHe/m+pMPKPJTWVxYFiqZREl
         WLO/TLmfRxA8Bv4Vdo3iML12l08JCmHiygqSVKSmy3seR1H7Mc7Q1aQX8MSqSksq+2vw
         gIQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783982421; x=1784587221; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7LkfD6aXl9dK90wHStXoX1dSfuVb2Ck7kctZehI6Xxk=;
        b=MET43OUcURM8pFPrJQDWyENy3H19795XEqQCyrqsduHYio7M5nTQXLYG/OmO9cp7pu
         NSSIOdLDvXWVZ9I0oqHIPHx2CUMjFjdXlMjUOYtxQRcEe+Dvyq3MDcJYRF4IZqwcNW2Z
         1hfEhawPHBmOGGjG5SGkQ5i2ptqFmy8aS9H0YzRMa+i6hYP7EPL5lZkT/Eo5A9f2ZEIF
         xZcjgdxAwdiRI8yIW1fMgK8wsKugVNDr7Cl3XaNqvTN64quYFZc3g5Rxu1pspm/jay9b
         GeMTQKsBFEdtQKWr0fqjg8EB0f2b9eodHg8CqAhpyh5mMy+THoxXrrWrVf7r1k2OZbPh
         uuag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783982421; x=1784587221;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7LkfD6aXl9dK90wHStXoX1dSfuVb2Ck7kctZehI6Xxk=;
        b=SrivX5jPFw8DnOzIE635y1fCJKBu0rZirYPMWgCRIhU7/eS2eVcpafNeLxir4v3tg0
         Am/+1JxhZ/72RQ5KHTroQwKaqLjYNzsEr3tgG978IFgt/54SAuC8nDgUb0aWHaXHSEyZ
         zx8Z1u75IXwvuU1uZzEY1unTM+z053Knr57FulvspIj78rwUIuKhZMh6nRyspVftTq0B
         9F0PoNS7EyXqUkNpKHrtqoziJfW/VMlr04bDo1TJKeF87zq5micIA24+fjGj29BYtpEa
         fmJhhVgd7ygecYJKg7c6SIAdO8ujSixXiUjVYZO9iqpNTTlt+X/dLBnLgDtKk0tnBGil
         oZqA==
X-Forwarded-Encrypted: i=1; AHgh+Rp14p0lxy5qppKqyrEl3COGlNeERS+QMtIct8sD6Uan9N6Lpk1+eGcdT9BLZFk/f7KJkv/XwIaAeg5Pqw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2thUKdaf9HeYUVo4ajnVD+TXE2O7HRZQBq/c6908FugAZHrhI
	BYfKG1jUppGYYaexyJM/KTbgFMZ65TgruWrtLJO1NTe6hOi1zv6zIipMJydYJGp77e0ZSm1hYbD
	xxjMKalaz4Crm9hEgKo9Q0z37reMaGV/fnpBUpsOR
X-Gm-Gg: AfdE7ckKw9O69rKUf+3kDCgAhyjiYOyfhfGPv4GXBL+jWS5yTdiUlVZLr+S+BoiYYZh
	ZwlRb5dZoviIDCISBWIRojoyszD5MNofH7bPLsL3omH01dnaCb2QyEpmgDV60styDR29ZYyIJXx
	4kxff4iGW1d0BXg2JqXYN64hf6bibvR00fWmwvrL9aaIof/FBG7WXU0zpbr/V1/0r+Q7FV9T7+b
	X/7f55Yf3GCEMLdXKyrygqBXEYwFZVUWcf2Rh0z77NdP+uQO+L0yhAiRREbiEABBS0UpK0KP5Cs
	hTMHS8GucZ9WM6d2oqp5OpAWKNNDlxCyWxH4yPw5X3bpW4uclKZPQqJfn7o=
X-Received: by 2002:a17:907:398c:b0:c16:13e7:fd63 with SMTP id
 a640c23a62f3a-c161de05ceemr462764166b.0.1783982420699; Mon, 13 Jul 2026
 15:40:20 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 15:40:18 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 15:40:18 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260713191727.GH674038@nvidia.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-11-yilun.xu@linux.intel.com> <20250602133009.GC233377@nvidia.com>
 <CAEvNRgFpJWQ5M5sQhGpQUV3GbBq9N+MQhhaxdxa=D8ky94SCsw@mail.gmail.com>
 <CA+EHjTwd9uku-ZV5y8xcK8VWdOfhcchyW=_fzjpCf5Vk2wQoGQ@mail.gmail.com> <20260713191727.GH674038@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 13 Jul 2026 15:40:18 -0700
X-Gm-Features: AVVi8CeLrPp9U0h6s0bW1dfkDuvwNQDlx835UcZJGSgXNK2eLWnyQH0juXRBY34
Message-ID: <CAEvNRgEvGmOK3dXD4qdw5uXYD2sXNEVGT9NV2Zz-4H8VPb+KUw@mail.gmail.com>
Subject: Re: [RFC PATCH 10/30] vfio/pci: Export vfio dma-buf specific info for importers
To: Jason Gunthorpe <jgg@nvidia.com>, Fuad Tabba <fuad.tabba@linux.dev>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, pbonzini@redhat.com, seanjc@google.com, 
	alex.williamson@redhat.com, dan.j.williams@intel.com, aik@amd.com, 
	linux-coco@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	vivek.kasireddy@intel.com, yilun.xu@intel.com, linux-kernel@vger.kernel.org, 
	lukas@wunner.de, yan.y.zhao@intel.com, daniel.vetter@ffwll.ch, 
	leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com, 
	tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com, 
	simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com, 
	aneesh.kumar@kernel.org, iommu@lists.linux.dev, kevin.tian@intel.com, 
	fvdl@google.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67528-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jgg@nvidia.com,m:fuad.tabba@linux.dev,m:yilun.xu@linux.intel.com,m:kvm@vger.kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:pbonzini@redhat.com,m:seanjc@google.com,m:alex.williamson@redhat.com,m:dan.j.williams@intel.com,m:aik@amd.com,m:linux-coco@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:vivek.kasireddy@intel.com,m:yilun.xu@intel.com,m:linux-kernel@vger.kernel.org,m:lukas@wunner.de,m:yan.y.zhao@intel.com,m:daniel.vetter@ffwll.ch,m:leon@kernel.org,m:baolu.lu@linux.intel.com,m:zhenzhong.duan@intel.com,m:tao1.su@intel.com,m:linux-pci@vger.kernel.org,m:zhiw@nvidia.com,m:simona.vetter@ffwll.ch,m:shameerali.kolothum.thodi@huawei.com,m:aneesh.kumar@kernel.org,m:iommu@lists.linux.dev,m:kevin.tian@intel.com,m:fvdl@google.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_SENDER(0.00)[ackerleytng@google.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[google.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ackerleytng@google.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,nvidia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E120C74F8EC

Jason Gunthorpe <jgg@nvidia.com> writes:

> On Mon, Jul 13, 2026 at 08:08:14PM +0100, Fuad Tabba wrote:
>> On Sun, 12 Jul 2026 at 02:02, Ackerley Tng <ackerleytng@google.com> wrote:
>> >
>> > Jason Gunthorpe <jgg@nvidia.com> writes:
>> >
>> > > On Thu, May 29, 2025 at 01:34:53PM +0800, Xu Yilun wrote:
>> > >> Export vfio dma-buf specific info by attaching vfio_dma_buf_data in
>> > >> struct dma_buf::priv. Provide a helper vfio_dma_buf_get_data() for
>> > >> importers to fetch these data. Exporters identify VFIO dma-buf by
>> > >> successfully getting these data.
>> > >>
>> > >> VFIO dma-buf supports disabling host access to these exported MMIO
>> > >> regions when the device is converted to private. Exporters like KVM
>> > >> need to identify this type of dma-buf to decide if it is good to use.
>> > >> KVM only allows host unaccessible MMIO regions been mapped in private
>> > >> roots.
>> > >>
>> > >> Export struct kvm * handler attached to the vfio device. This
>> > >> allows KVM to do another sanity check. MMIO should only be assigned to
>> > >> a CoCo VM if its owner device is already assigned to the same VM.
>> > >
>> > > This doesn't seem right, it should be encapsulated into the standard
>> > > DMABUF API in some way.
>> > >
>> >
>> > I'd like to propose an alternative. I've been working on guest_memfd and
>> > new to the world of IO, please help me along! :)
>> >
>> > It seems like using dmabufs are used a little awkwardly here. IIUC
>> > dmabufs were originally meant to expose memory of one device to another
>> > device, mostly meant to share memory. Dmabufs do expose MMIO too, for
>> > device to device communications. Without virtualization, userspace MMIO
>> > would be done by mmap()-ing a VFIO fd and having the userspace program
>> > write to the userspace addresses.
>> >
>> > Before CoCo, device passthrough (MMIO) is mostly handled by mmap()-ing a
>> > VFIO fd and setting up the userspace address in a KVM memslot for the
>> > guest.
>> >
>> > With CoCo, is the problem we're solving that we want KVM to know what
>> > pfns to set up in stage 2 page tables, but not via userspace addresses?
>> >
>> > guest_memfd already does that for regular host memory, tracks the
>> > private/shared-ness of the memory, tracks which struct kvm the memory
>> > belongs to.
>> >
>> > guest_memfd functions as KVM's bridge to host memory. KVM already can
>> > ask guest_memfd for the pfn to map into stage 2 page tables, and already
>> > asks guest_memfd for the shared/private state of the memory. guest_memfd
>> > already also blocks the host from faulting guest private memory
>> > (mmap()-ing is always allowed).
>> >
>> >
>> > Instead of using dmabuf as the intermediary between the MMIO PFNs and
>> > KVM, why not use guest_memfd?
>> >
>> > What if we make guest_memfd accept a VFIO fd, or a dmabuf fd?
>>
>> This is interesting for pKVM too, provided it covers more than MMIO.
>>
>> We need guest_memfd to be backable by a dmabuf for ordinary guest memory, not
>> only for device MMIO. There is mobile hardware that doesn't tolerate scattered
>> private memory (DMA engines that can't gather, IOMMU page-table size
>> constraints), and a CMA-backed dmabuf heap is the practical way to get
>> contiguous memory at runtime.
>
> Why can't guestmemfd allocate directly from CMA? Allocating struct
> page memory through dmabuf just to put it back in a guestmemfd sounds
> very ugly to me.
>

I'd like to understand this use case better too, is using CMA through
dmabuf basically because CMA doesn't really have a direct userspace
interface? As in, for HugeTLB there's fd = memfd_create(HUGETLB) and
HugeTLBfs fds, but not CMA?

I did hope for this API shape to extend beyong VFIO and HugeTLB to
anything that has an fd today, but Frank did bring up the counter point
that not all memory has an fd.

>> HugeTLB doesn't help, it wants boot-time
>> reservation. Those pages are struct-page backed, so it's a different problem
>> from the non-struct-page MMIO case, and the shared parts still need to be
>> GUP-able.
>
> Isn't dmabuf pretty allergic to mmaping refcounted struct page backed
> memory since that wrecks its lifetime model?
>
>> More important for the API shape: conversions have to work on subsets of such a
>> region, at page granularity. A pKVM guest doesn't know what backs its memory, so
>> it will issue share/unshare hypercalls over arbitrary ranges of whatever it was
>> given.

For my future reference, does this mean for the CMA case, some page
splitting on conversion to shared (so each page can have its own
refcount to track users) will be necessary? (and merging)

>> If a dmabuf-backed guest_memfd can only be converted as a whole, we can't
>> use it for memory, and the guest can't be taught to care.
>
> More reasons not to involve DMABUF since guestmemfd already does all
> of this...
>
> Jason

