Return-Path: <linux-media+bounces-67371-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yOxbFIjnUmqdVQMAu9opvQ
	(envelope-from <linux-media+bounces-67371-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 03:02:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B780E7435A5
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 03:01:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=F2Bcm8Hw;
	dmarc=pass (policy=reject) header.from=google.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67371-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67371-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E596301F9D6
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 01:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1CE21FF5E3;
	Sun, 12 Jul 2026 01:01:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0F53A1DB
	for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 01:01:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783818096; cv=pass; b=tW+cwta4Tz06sOtUKgxbsn9gKMBRsIVQWi1pUz6gvQUuA9oE36y7qm1okxbF7wUT4niVbtu0KxR8hEWSqOSavRtdiuqI0y6Z9Cd1qqCO5bXiTgImENCT1szf0qLfhT42BnsD+9HZoBS1Niei/qJrTviZ0/pUxLIGFI/dJ5fbtmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783818096; c=relaxed/simple;
	bh=R8xlg3RI6zLmG7lgrIZL1li1QImUsqosewBmuLTRodU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TwR6Qd7yki1NqF+JmPbP/upL78QJ+76Zhi1WxC3qpErA61Nol9+cZj0nHxZ3JLweWgq6hGNgaw77MSLn2MLuNAJ8RvYK/4dLPV12F6wPQ8TWY+73R+h7XSOOrkXd06u78gE0OITLcNgnbE7TZWy5fzonkpYhbJBROglynu05hs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F2Bcm8Hw; arc=pass smtp.client-ip=209.85.215.170
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso1493609a12.0
        for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 18:01:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783818094; cv=none;
        d=google.com; s=arc-20260327;
        b=NaKQHBrk74I+7RhOCzQlteDK5/nKxjH7pKCmYhVvaf7ff1Cb32WdpKutgCZttXsqHu
         jL+BLZCM0+g6CsADNrlVd2ZTZoH7jUVo1+Y1sKcNO/b6Q/ntmKzI4shMtuij9GDtaTRJ
         FCIG14xWtKNkIRRpD4k4hSj/wQA65gklBGrvEBONQCICoP0QtBytkqRH4rlYR7//gZh4
         cLs56bai0UiskOqBCncm8L0u4YGIjWw0HIZQVyqNOnpQiKCxOnFI3xnd0GUp9GUBX6lO
         pL+fzlO3mHVJUwGQrO7AI9Tze+++PZsFnLrP3ojHhqRbhwI45JIAb8pQ+ngP5Pi6K1iH
         GeeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=gGEYW3UAXERRsGZl8/IlnSaBkO9PGZLTdY+qnlryyhU=;
        fh=Et1mVx4vl1S6lVVQsFQe6e+H52YUaRVaQkh4mJbMJdg=;
        b=FhdSrh72gmgFqyIkXd+a0QufgDnjPaPVXwsOWCPdb9/W5Jss2hQXX4lhcck+xXkSrJ
         Z8i1Tb4f1fIAZmAF3/Jk5EryIzXWiwxpjhuZzNL5foxqeVkICsKG3xlQYiCKoSHLNOfx
         c/8gnKI2j0YmE3bwMLuxT1kwOV5+Dcm344cM5CXvShNqTbaxhRO+dAzQeStr/Nkxo1qQ
         OJ4CJ7h6qnEZcCQpGbV1+W1Z30UJ18pED6b4GjmDb7A3T3geqlxv7b4S1glCiHyeyLEQ
         0dMc46l4ejuj3/ce6bmSPPF8Pq0UpD9g9vKebYGFHTV1dMI9JhBJ0FHLrTOYoTxTwICo
         haNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783818094; x=1784422894; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gGEYW3UAXERRsGZl8/IlnSaBkO9PGZLTdY+qnlryyhU=;
        b=F2Bcm8HwvOLs7bxy896OiDRS7aOVkXzSRJUgxn73pPsUhRXl90cRBS7fWeF9Pq3i4P
         6WF4MlA/qmoiDZyT4/6EZCgWbHBs7BHU/SEJlV1KHoEKOTV509ukjVajnPveJcqhRLzA
         H4VeEjDgBH1i+to9Y+rirt/kVSzSt9LYgl7M8a0sh0p/lBukORhcnzPCxs6CDPwFEbGV
         ya9lBdjhTycogmawCL+ZGwIYaqxCx+drVf/hhVHlRxHBXHeTvlXHfcVH0/L0RGmPpq3L
         fUp6erk2+3hEnf9ynGSI5RbRvqqGid5Ng6zLWYZohb6uvBZX7A5VGQruM8nGFYeKrhff
         XAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783818094; x=1784422894;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gGEYW3UAXERRsGZl8/IlnSaBkO9PGZLTdY+qnlryyhU=;
        b=QYLXJ2s7R3hR6rhJEamvWnR5CkQouI0cLqXmFvtOQ9/HCkyDPRdXocXVRhEwbPV9S6
         oGGkoPH8BfkGL4Q25G5Cf4DOT6oWSPT34S6zNjpLRPn/XsH2XZElKxHAF/uKpFargVTy
         D51vr4MJ5zYtNzxxWVCnw2ydQZUIhBUvY76Nul5E3xRzw8W4LK4BAo24mDcR4SCStdB6
         SDyNlwr2KF2lgV/VxCknS+cgw0DtbGdQzFHkp3XY3tquA9F+0emwdgA2Qel/M1QGQs+D
         05xzStSikHI0ddnkXMWLPG7ODoR1xmXJH+EPdmTKfLSyLfWjnmuvNJpov+a4oQAsaCgX
         wpFw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0l+0Lx3wYFv3LWWBBDb4DilL6ALRNSWT1pYEJhdkzcMs/XjIEhxRCaCZXuib8P4BO3dBasejg5UeRew==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOzd6/vEUqO3Lvzk1ugWgE6aVRig8euPorq4xSChN3o605Jl5t
	CWhAFRCmFDjAmGHOK/LwMXx2rsO2cXbG32Zr/JDGp3PzjbXq7UvAZ9nrhx1rEBdlDzuV7i+o72i
	ur+du5/5h9WklBGv6hnZydYkLH4SZph94pU275I/Q
X-Gm-Gg: AfdE7ckFVNbztFvLfEQpGsJd4P7ygqBKmaSNW4ND7TjPNxSA0X0jh2gbq1GfMo8iA+N
	rxgmtSwcLzQRQVEOuVWh64E6U1q+TiEjs+CN2C4hPjYZH2iO5aZ0WJG/J/jy7hAY5xcWIrLI7WP
	JQyLCpCY6go6vlXkopQp4UmcNNiMx/rn9kX+fI0ePPy4uLma2Aga9HMHYF0HYVNmSRYSNtWadFv
	c6RnxVI5psC177arYbKE3IhcQVaLkvJzG9dCGBSrsbowXNrG3vmOIQndI/Rx7ZnBgLDMqY3Wp/M
	Q6z1UYJwb/gzo9SDIRpkQ+god3Qg
X-Received: by 2002:a05:6a21:3990:b0:3bf:a7d5:df38 with SMTP id
 adf61e73a8af0-3c11075f8f6mr4812182637.9.1783818093599; Sat, 11 Jul 2026
 18:01:33 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 11 Jul 2026 18:01:31 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 11 Jul 2026 18:01:31 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20250602133009.GC233377@nvidia.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-11-yilun.xu@linux.intel.com> <20250602133009.GC233377@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 11 Jul 2026 18:01:31 -0700
X-Gm-Features: AVVi8Cd0bGOMjMsYrL4vU20fXx-xb2mKPsbs-m9K5p8jfizmd9no0laxFphKWjw
Message-ID: <CAEvNRgFpJWQ5M5sQhGpQUV3GbBq9N+MQhhaxdxa=D8ky94SCsw@mail.gmail.com>
Subject: Re: [RFC PATCH 10/30] vfio/pci: Export vfio dma-buf specific info for importers
To: Jason Gunthorpe <jgg@nvidia.com>, Xu Yilun <yilun.xu@linux.intel.com>
Cc: kvm@vger.kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com, 
	pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com, 
	dan.j.williams@intel.com, aik@amd.com, linux-coco@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com, yilun.xu@intel.com, 
	linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com, 
	daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com, 
	zhenzhong.duan@intel.com, tao1.su@intel.com, linux-pci@vger.kernel.org, 
	zhiw@nvidia.com, simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com, 
	aneesh.kumar@kernel.org, iommu@lists.linux.dev, kevin.tian@intel.com
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
	TAGGED_FROM(0.00)[bounces-67371-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jgg@nvidia.com,m:yilun.xu@linux.intel.com,m:kvm@vger.kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:pbonzini@redhat.com,m:seanjc@google.com,m:alex.williamson@redhat.com,m:dan.j.williams@intel.com,m:aik@amd.com,m:linux-coco@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:vivek.kasireddy@intel.com,m:yilun.xu@intel.com,m:linux-kernel@vger.kernel.org,m:lukas@wunner.de,m:yan.y.zhao@intel.com,m:daniel.vetter@ffwll.ch,m:leon@kernel.org,m:baolu.lu@linux.intel.com,m:zhenzhong.duan@intel.com,m:tao1.su@intel.com,m:linux-pci@vger.kernel.org,m:zhiw@nvidia.com,m:simona.vetter@ffwll.ch,m:shameerali.kolothum.thodi@huawei.com,m:aneesh.kumar@kernel.org,m:iommu@lists.linux.dev,m:kevin.tian@intel.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,nvidia.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B780E7435A5

Jason Gunthorpe <jgg@nvidia.com> writes:

> On Thu, May 29, 2025 at 01:34:53PM +0800, Xu Yilun wrote:
>> Export vfio dma-buf specific info by attaching vfio_dma_buf_data in
>> struct dma_buf::priv. Provide a helper vfio_dma_buf_get_data() for
>> importers to fetch these data. Exporters identify VFIO dma-buf by
>> successfully getting these data.
>>
>> VFIO dma-buf supports disabling host access to these exported MMIO
>> regions when the device is converted to private. Exporters like KVM
>> need to identify this type of dma-buf to decide if it is good to use.
>> KVM only allows host unaccessible MMIO regions been mapped in private
>> roots.
>>
>> Export struct kvm * handler attached to the vfio device. This
>> allows KVM to do another sanity check. MMIO should only be assigned to
>> a CoCo VM if its owner device is already assigned to the same VM.
>
> This doesn't seem right, it should be encapsulated into the standard
> DMABUF API in some way.
>

I'd like to propose an alternative. I've been working on guest_memfd and
new to the world of IO, please help me along! :)

It seems like using dmabufs are used a little awkwardly here. IIUC
dmabufs were originally meant to expose memory of one device to another
device, mostly meant to share memory. Dmabufs do expose MMIO too, for
device to device communications. Without virtualization, userspace MMIO
would be done by mmap()-ing a VFIO fd and having the userspace program
write to the userspace addresses.

Before CoCo, device passthrough (MMIO) is mostly handled by mmap()-ing a
VFIO fd and setting up the userspace address in a KVM memslot for the
guest.

With CoCo, is the problem we're solving that we want KVM to know what
pfns to set up in stage 2 page tables, but not via userspace addresses?

guest_memfd already does that for regular host memory, tracks the
private/shared-ness of the memory, tracks which struct kvm the memory
belongs to.

guest_memfd functions as KVM's bridge to host memory. KVM already can
ask guest_memfd for the pfn to map into stage 2 page tables, and already
asks guest_memfd for the shared/private state of the memory. guest_memfd
already also blocks the host from faulting guest private memory
(mmap()-ing is always allowed).


Instead of using dmabuf as the intermediary between the MMIO PFNs and
KVM, why not use guest_memfd?

What if we make guest_memfd accept a VFIO fd, or a dmabuf fd?

guest_memfd can then take the mmap() calls from userspace and .fault()
from mm, and then forward them to VFIO or dmabuf. This way, VFIO/dmabuf
can stick to their original functions, and the changes to VFIO/dmabuf
would probably revolve around disabling access.

Disabling access would probably involve some of these:

+ When guest_memfd receives the fd, it could return error for existing
  mappings, or perhaps it could just force-unmap.
+ 1 extra flag or field to indicate that guest_memfd is controlling this
  file, so that if userspace tries to take some actions with the
  original VFIO or dmabuf fd, the request should be blocked.
+ Perhaps just close the original fd, like dup2(oldfd, newfd) closes
  newfd?


I'm about to restart work on guest_memfd HugeTLB and I'm thinking about
a similar approach for guest_memfd HugeTLB, where perhaps the interface
could be that userspace will give guest_memfd a HugeTLB fd at creation
time, and then the original HugeTLB fd would be rendered unusable in the
same way as above, perhaps like with the S_IMMUTABLE inode flag, but
also blocking reads, and not userspace-modifiable.


In the course of a CoCo guest's operation, will the guest need to
convert between private/shared MMIO? Will the guest need some pages
shared and others private? If these are required operations, guest_memfd
already provides the tracking and is going to have a conversion ioctl
very soon. Instead of further extending dmabuf to track more things, how
about letting guest_memfd track it?

