Return-Path: <linux-media+bounces-67529-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hwoQLMlxVWoQogAAu9opvQ
	(envelope-from <linux-media+bounces-67529-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 01:16:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED1274FA92
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 01:16:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=dtrAYmM5;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67529-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67529-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10A30302CB7F
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 23:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F123D34B3;
	Mon, 13 Jul 2026 23:16:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E4E3D091C
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 23:16:04 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783984568; cv=pass; b=VihHg2kt6KezW0RafNB1C08zlCP9oex3LNZt8dVialbL5s4yYdk/WruYZ4rgvgDeQQLt6XIVqneupFNp+OmNknR8Zj5YbwFugXcL+bwRfo4GiU07JPxYyJrngjsDYuyHsO8fYBTreFZ8GE2YZfeHdV7kA1mZvdvznxQ7g6Rzb/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783984568; c=relaxed/simple;
	bh=jNitDBOyiAnqLYAVTV2WWuN1NaJEYQUlElQBlTgvBIA=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sK/b44Ej5PeVXmacDe//9EltNmlo1KfgX1KWvDI+mhtFWvSn7MD0FJlfQowKKhvUH1L9r7J/Jtir2oPNnT59w3Hq7whPGTvG5LwtsMdBFICXBxEnF91W8Boyu7715EmhelUNG7Yd98EeBenq/HZUDD4m1Hmbc5VLv6KVNUK3TFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dtrAYmM5; arc=pass smtp.client-ip=209.85.215.171
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-caf45fc5202so1361789a12.1
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 16:16:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783984564; cv=none;
        d=google.com; s=arc-20260327;
        b=W8YQ9ehGJ5NrY6gTrS6GBl369DUEZ6AGqAEoQAAbUgS1H5p1z8Y+4PpRZkJjqDjLX6
         a83VLN/2kmJi7SkuwQzKoTpbO1Ft5gfaZfJSpPKxF7ry5uUjpL+g/psWOVWsOs24mbuu
         QR7QvO74f+Y6WAalR+01/sAl8uRox7dGs9DZwFsoBZPpCQWguuTVt+Ksb1o32jInNeeL
         2JvAk13x3yU13AB0Os77Ybt1GDhWX2y6BEd5HMoAmYHjOHdmUaOOJsPLnydHPbNDwyTB
         rjmpA2FP90G7h/VmKB5SHDh7XcYk7b6Epn04WAFl0z6RfAONLYNMnvpqagxuv6fcAmOa
         LJDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=mNe9rM8ZI02kYm64C7ciEQBT8YD2/cothZS9irUHQA8=;
        fh=4U38qv57eFm7OyrgB0IAUUV/9SG1Nql4JfCr0RM4JHw=;
        b=rPgc3i5LVCGMvFhfVrJ3ngLgiPS3oRcC7gTAKUL2pP3pIRjZ/dakamDMcrB9HqEf8s
         rLXtgn5xqFVmytWsWPD4DkwuQrqT2rC6vYtaSzBqUNM9WD5OuVulBW/C/rFPo8fDCrJE
         Tu0Y59HBiEMDJTs7w7HbSgy4JXMHyH3NqkhPToxg9tVa3DB0EYr/lL4yBc2M7eh6sUS2
         BccHZKH4gzr8feFZGD+gKsMZ0rFNvlsS7zs+p/Wy5H7avcjCqWPiPxD5a+9nKfBA0oLb
         VstM/fUHCfmG5TbGa3/ijPI/1SMxP6Y0I3bD0vJ7MbmF8+HxV84gDbqUr9YoWZ2xHc3D
         WeMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783984564; x=1784589364; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mNe9rM8ZI02kYm64C7ciEQBT8YD2/cothZS9irUHQA8=;
        b=dtrAYmM5gcCKTMBJFLfIdvxLIN1TFGu7RAukrH3sgUGEoQIdT8jn7K/J0o1Ob92z8T
         a0cprolYrryzquVOKVdD9Tso/apjFQx0S/TWnaNDzT+4XKP8+TZVK4AJYQG+obu3DXBq
         oPXv+706nt3OtvYOng38qlKNuVbBw98VjmQZMMpw9xy4EDPIiaM3AFPrQrSI0vGXNKQd
         efsZF/YHau9aw97qE71JeoAQlOSlS859bm0v+3++nIT4x6FAjIMt/wlG5frQ9FXlar25
         BVqUYnbQe/TsL8Sr0LkuE8MunM54JmYxjhxr0hvppPg0JBL0pEzFq0FC6FlGAxqBiR8+
         ALDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783984564; x=1784589364;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mNe9rM8ZI02kYm64C7ciEQBT8YD2/cothZS9irUHQA8=;
        b=dhh09ucKEg8r3myyITvSo37E8Pyu7PynSjapVCFcoSQVwFvX43Pf9qqTASAGgyWtGK
         2eFui7xKHO2pED0Vii8x785U7E1rgE0fnNuGbmMMhltYl1fExn8l7ZAKmHd0AbuLyac3
         jkBI9O2HKRt4sMvEmt+7YuzD3vqp8ijn0eVEWcoSvm7QnlaY3ZrPSFB7UCxEwCNsMvDH
         uoyMHZdbnltBJmHiXmajsbaeJaHhoUypmUQ4kO3iqYjMom1UHz6hp2pnQ77Ub0UYo3QQ
         n2S3+EtoW+vd6i8rFKGEPcsgFuTSeTYgG7wkDfDitVrabXMtbX786TzzHaPjxT3nneuI
         ee2w==
X-Forwarded-Encrypted: i=1; AHgh+RpI4dV04SGnyPlksm5gDdlVvH0tZq6mKY85IT9ovcYRYGcCx7PMA5D5HhV4Va+mves8HhemIw5uY04R5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2BYdFbd3GBCsVxVFaKMnqrouPOCxAYhh1nYlSpH1835xm12Kc
	PuZKQTKggCDUh2P2n5z3h8YfX7NZEeMOnqOsynVcTTUZc6tLPGDvLZBGDsK2bQ61EopjslqdD7f
	G51fCVt/Iy77IOzXEnAopyPWki+E1wP4t7PIfeo0u
X-Gm-Gg: AfdE7cku9av4YeYOmqer5v88nPwA1DQoJXo+9vTVTWxAV5n5MDvf+3tv2NvwXXfbQZM
	qdjZDXNu3M4moqaDq8OCWdOU6YUh9x7ysRYwiwmyhXImaFD6J1/avD+WV3ihraz9hZ1E3NLFWhl
	/7B9UPtJnr2/Qk2Cji85nngdLY7WKFSX5U9GR4YVgeoCBG+5uCgM4fg2LJd0OrQZnKCqF+4RACO
	H3p0fF0eOeC98IZv68t03pWVdWuG1cwW6eJt6yLDiRnsyhu8iR9cxGZjGTvMVHbHMTam+lkeCCT
	vf2w78XkStbp2xtvi5FofGAkfcccu9wfFsIo8xs94RKWdDZYlWhBiZ4GviE=
X-Received: by 2002:a05:6a20:cd8f:b0:3bf:83f3:b810 with SMTP id
 adf61e73a8af0-3c110a7b287mr11689858637.29.1783984563364; Mon, 13 Jul 2026
 16:16:03 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 16:16:02 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 16:16:02 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260712221934.GF674038@nvidia.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-11-yilun.xu@linux.intel.com> <20250602133009.GC233377@nvidia.com>
 <CAEvNRgFpJWQ5M5sQhGpQUV3GbBq9N+MQhhaxdxa=D8ky94SCsw@mail.gmail.com> <20260712221934.GF674038@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 13 Jul 2026 16:16:02 -0700
X-Gm-Features: AVVi8CczeGanVcGdhsy5HlDfD2XYPmjZautNceRH5dXiMXcxQCHaSODxjV4xdX8
Message-ID: <CAEvNRgEo2kLUmaGU-Vsgx2sTQvU_NNUJ4bRp5Z4Ygs_xvVLOYA@mail.gmail.com>
Subject: Re: [RFC PATCH 10/30] vfio/pci: Export vfio dma-buf specific info for importers
To: Jason Gunthorpe <jgg@nvidia.com>
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
	aneesh.kumar@kernel.org, iommu@lists.linux.dev, kevin.tian@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67529-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,nvidia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1ED1274FA92

Jason Gunthorpe <jgg@nvidia.com> writes:

> On Sat, Jul 11, 2026 at 06:01:31PM -0700, Ackerley Tng wrote:
>
>> In the course of a CoCo guest's operation, will the guest need to
>> convert between private/shared MMIO? Will the guest need some pages
>> shared and others private? If these are required operations, guest_memfd
>> already provides the tracking and is going to have a conversion ioctl
>> very soon. Instead of further extending dmabuf to track more things, how
>> about letting guest_memfd track it?
>
> Use another FD type was sort of my fallback if we couldn't get DMABUF
> into something workable. I'm kind of surprised to see guestmemfd
> proposed as the other FD, but I don't know much about its insides.
>

For now guest_memfd only supports 4K pages, so the interfaces we're
interested in are:

+ The .fault() handler, which core mm calls to service any page
  faults. For this, guest_memfd first checks if the page is shared, and
  if so, proceeds to return a struct page.
    + For VFIO, guest_memfd could call vfio_pci_mmap_huge_fault() and do
      vmf_insert_pfn().
+ The kvm_gmem_get_pfn() function, which kvm calls to get a pfn and a
  max_order to set up stage 2 page tables. Now guest_memfd returns
  folio_pfn(folio) and max_order = 0 since guest_memfd only supports
  PAGE_SIZE pages now.
    + For VFIO, guest_memfd would need some way to get the PFN, so
      probably something like dma_buf_get_pfn_unlocked() [1], but
      probably from VFIO instead of dmabuf. Perhaps pci_resource_start()
      is good enough to get a pfn.

[1] https://lore.kernel.org/all/20250529053513.1592088-2-yilun.xu@linux.intel.com/

> If VFIO can create one

At guest_memfd creation time, guest_memfd is always created for a
KVM. This is the first place where it is bound to a kvm instance. This
is one place where it helps Yilun with Confidential VMs, so KVM can be
sure that the memory was meant for a specific CoCo kvm and not any VM.

I think it might be weird to have VFIO take a kvm fd to create a
guest_memfd?

I was thinking that the userspace VMM could do something like:

  int vfio_fd = open("/dev/vfio/devices/vfio0");
  int gmem_fd = ioctl(KVM_CREATE_GUEST_MEMFD, { .fd = vfio_fd });

and creating from a template fd would also disable/close the vfio_fd so
that the following will fail:

  addr = mmap(vfio_fd);  // Maybe this should fail too?
  *addr = 1;             // But this should definitely fail so that
                         // guest_memfd gets to block private writes.

> and fill it with MMIO physical addresses then
> maybe it is OK?
>
> Jason

What interface would be used fill a guest_memfd with MMIO physical
addresses?

When a vdev is associated with a vfio file, can some other vfio file be
created that can also do MMIO to the vdev's PFNs? Would I be able to set
something to block any future associations to those PFNs? This will help
guest_memfd to prevent any other writes to private PFNs.

