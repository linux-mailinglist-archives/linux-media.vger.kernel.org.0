Return-Path: <linux-media+bounces-53200-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFx+MlaenGmyJgQAu9opvQ
	(envelope-from <linux-media+bounces-53200-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 19:37:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D2817B97B
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 19:37:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC72B311AE65
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 18:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB2C366DCB;
	Mon, 23 Feb 2026 18:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PbDBCokd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED3F366DAC
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 18:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771871603; cv=pass; b=RVWVGfXWNJDk+ZwtGqelA4YXWfje3u/EAheao1RpKoufSA+fMBNJPfaVDWmWxFP/s2n5GsvwZPF2UvOThzXGSNMsl+9DDuorbfCFmX9XDHf5iIKAHeggAIhBzFYBWnH4qQ9JkuWkSTQCjgIkXil0vcbh6ysSQcxAw/pSb76PnVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771871603; c=relaxed/simple;
	bh=OlksQpzsFEkRVJRE9g419OdwGDh3+i8ICDHTevP//cg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ifpbUe3HDvvieX9tyFrGW6EGggsYV/prAJ21nRX6bmp1oCgfz8RZYHw/2i6/h0G91A3yl1vcOLEbX5HlpkIHRCK7wr0+rvo3khRL33mT2EK42rktk2tLXtW4ixUasJVrmMy74iJhURYTg16K+Sz9zrOiE0jcVCTabhacG4lTQYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PbDBCokd; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b8876d1a39bso642730966b.1
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 10:33:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771871600; cv=none;
        d=google.com; s=arc-20240605;
        b=UCrcpJaaiPiNj7b47gG3Vb8Sh2eO38R+RaFY3oDMjsm6qDxp5tikvUKbTai1cynJtA
         htxsCWFi2+vOSIfRvJ3hNzoMGXRaW8WQmJb2znas4I9umu38+rGltN7IbQWgymkhqba8
         IfHRVu+hMQ28a0n0lhOoq83k3B1U/uj1PBbyYQpBR2QvJGZNT6tPnPsUeu68V0CHdPHY
         gG2D+R/+WbhkZGUTGYfk+e9JLls42uLObLo2uWKBhMxWIFgjYJhOmVCWcturtKhoHYGQ
         bFO3bd5sbIJn7a/Kl4m7jokUa2ZWgfDy1flE/fy6WAW4rOxsNjFVPx5Q/q20q9fLGaOQ
         xuog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SdXTYyc+CZiWHvNxIlGUblHb7sAtxXqArT15DTb3rus=;
        fh=BoMztLetd3ueE54FEZUsLAXp2RdhFT663jtyhDC4FYI=;
        b=TPFdA52Mp6xhGfMFToPkphC/b/3V68IST3zo9deMKD7qKb3HCoolbv8sNLCGL+jVqF
         L5MoTiaAxUiusuYLDJxW22Vo5NbqEgeo8tdk3l/FH1PiYQ0298I1ahbGcy/Ii6KAY+hj
         io43USZYIHb83LMmDylxnSS9NS3m6i3Am7PTqS0b/wfadH4GEhnA9A4UWjQ90b/0m2xO
         HbowiHJ04au7Xy6Eq8RbEjWhR6AWYTLuQCSfehMmxkk6hi7suw3y+W+ZY951KfGWkDQL
         fZPCNgKOwSmHVz8E3tuDTCLLpfsqXRsjG/NsI2E2iAgwbCVv8HcsqF9ySckGl1CN0qlM
         kS6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771871600; x=1772476400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SdXTYyc+CZiWHvNxIlGUblHb7sAtxXqArT15DTb3rus=;
        b=PbDBCokdi4is6o2mpk5d+/IduV9v1e3piv0iO/T7LJQP8Pyfs7J0geEoy0DRe5uy3r
         AhV+1Qo5g9uVsmjOlpSgOWmtvAxvyX81tzJcdcGEfYG6F/eaEo9sFuEqjaSU/KRDLEvi
         WZeySB/62aMrU1FYLIK618k+h7tq7NsnF8P5V9goZzsyH7PON+A99DisUHBWQ6tXGssN
         Hrn7K7m/CYpUPfk5MS15sBJSH2Rg1ov1wQ7cW3IUUjVP+ydOP6Lc509XgkSDZDMUu2Oi
         QEBmhtHXFYVDrHe0PMqhdU/qpcZiXzadWdGft66Ju+OCJNXuMO8szRkXPeFDAJ1/nJWX
         LgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771871600; x=1772476400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SdXTYyc+CZiWHvNxIlGUblHb7sAtxXqArT15DTb3rus=;
        b=BfPXDsU/RgXjkyDptYr6qLyo34YLfH/KkgEN04muBb86Q3BE5GP+BLxcYHodbffLqQ
         sIoL3meeRj46Zhk4a/lsLFXFZHtog5h/Y8t6ydRhvQ/8FWbPBzEx6VadN+JjUfKtQdgT
         aCC96q65Pb2au3741n0HIxzv112xUNxA4msNVvgYio8eQqCzcQYz9B2i8gbSMZB8VkJP
         3AEJJavLt1i/bh0L6tuset+aSXwMvEffBZHiXIb3sJQY0u3ucyVZBMpo3cUt4T81FDf+
         tHdroUFUT+nymLKQdrwqhU1tEdkkwPL9D9xgB6luS76xsHpr5+heL5dHsuWgSPTgXw2W
         k5fw==
X-Forwarded-Encrypted: i=1; AJvYcCUgqzP3m7tJIx18boHiBWVTIm+X8iABh9w1n2+Mf3BI8IPEY4EthEKG+z8ByVX/YSqhKr1SO4KhjRyxQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywom8a544zFJgV+FmS9OcIGH08hWjHBoelHfPHQajqHxzX0EItQ
	h5QpVZIGNt+WymHVZEg9HgNvhzCCmEVH5azT/8L5IfF4jISG/cTZ1z8/vJ6GhVvOQG3bUhklJyc
	zCCF85ezgjzILVbCzmpQrFqJ+egIrDCLX6IWet2M=
X-Gm-Gg: AZuq6aLLf4nEgnsqf5n3YMZdIpiUgyqH0E0W7VPhVTncnSGDVLLncNaUMz9qQkl2bmB
	wt4wYJHly0kgjgxHpm/mutYAPMEjsBQ2L/xKlJXkeUlG9aWHJ1y+6h8FAwPF8GFrSaNVzgpsoe9
	AgATBLECFTt0vjOkfEJTjPoorjxh99V9gbUuv6NALF9qP+r9T+Ye99F9J29wTKhah3hbTLKUitR
	+FtAR39NI6ltTS6NXKT9vl53VUNI0B0xi3CCYkyX04ApTQv+rzdGnoiE1Wb+DqZa/tNRdok/C/p
	/fqBd1QmEeBdAiHM7r/hDnQLIUQgDheI1Hap
X-Received: by 2002:a17:907:9452:b0:b88:713e:78a5 with SMTP id
 a640c23a62f3a-b9081aeedf7mr579641266b.28.1771871599312; Mon, 23 Feb 2026
 10:33:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223095136.225277-1-jiri@resnulli.us> <20260223095136.225277-3-jiri@resnulli.us>
In-Reply-To: <20260223095136.225277-3-jiri@resnulli.us>
From: John Stultz <jstultz@google.com>
Date: Mon, 23 Feb 2026 10:33:07 -0800
X-Gm-Features: AaiRm51mY0mKY0_1_wq03WmYtA7Qg-aNpUveVzAZTLNHpqLqVMbVU7X_E2imwkI
Message-ID: <CANDhNCp94KG06P_7ivMTNA27qEM9g8ox-h3b_tZ=v6e-25xJ3g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: system: add system_cc_decrypted
 heap for explicitly decrypted memory
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, tjmercier@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, 
	jgg@ziepe.ca, leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53200-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jstultz@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,resnulli.us:email,mail.gmail.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 29D2817B97B
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 1:51=E2=80=AFAM Jiri Pirko <jiri@resnulli.us> wrote=
:
>
> From: Jiri Pirko <jiri@nvidia.com>
>
> Add a new "system_cc_decrypted" dma-buf heap to allow userspace to
> allocate decrypted (shared) memory for confidential computing (CoCo)
> VMs.
>
> On CoCo VMs, guest memory is encrypted by default. The hardware uses an
> encryption bit in page table entries (C-bit on AMD SEV, "shared" bit on
> Intel TDX) to control whether a given memory access is encrypted or
> decrypted. The kernel's direct map is set up with encryption enabled,
> so pages returned by alloc_pages() are encrypted in the direct map
> by default. To make this memory usable for devices that do not support
> DMA to encrypted memory (no TDISP support), it has to be explicitly
> decrypted. A couple of things are needed to properly handle
> decrypted memory for the dma-buf use case:
>
> - set_memory_decrypted() on the direct map after allocation:
>   Besides clearing the encryption bit in the direct map PTEs, this
>   also notifies the hypervisor about the page state change. On free,
>   the inverse set_memory_encrypted() must be called before returning
>   pages to the allocator. If re-encryption fails, pages
>   are intentionally leaked to prevent decrypted memory from being
>   reused as private.
>
> - pgprot_decrypted() for userspace and kernel virtual mappings:
>   Any new mapping of the decrypted pages, be it to userspace via
>   mmap or to kernel vmalloc space via vmap, creates PTEs independent
>   of the direct map. These must also have the encryption bit cleared,
>   otherwise accesses through them would see encrypted (garbage) data.
>
> - DMA_ATTR_CC_DECRYPTED for DMA mapping:
>   Since the pages are already decrypted, the DMA API needs to be
>   informed via DMA_ATTR_CC_DECRYPTED so it can map them correctly
>   as unencrypted for device access.
>
> On non-CoCo VMs, the system_cc_decrypted heap is not registered
> to prevent misuse by userspace that does not understand
> the security implications of explicitly decrypted memory.
>
> Signed-off-by: Jiri Pirko <jiri@nvidia.com>

Thanks for reworking this! I've not reviewed it super closely, but I
believe it resolves my objection on your first version.

Few nits/questions below.

> @@ -296,6 +345,14 @@ static void system_heap_dma_buf_release(struct dma_b=
uf *dmabuf)
>         for_each_sgtable_sg(table, sg, i) {
>                 struct page *page =3D sg_page(sg);
>
> +               /*
> +                * Intentionally leak pages that cannot be re-encrypted
> +                * to prevent decrypted memory from being reused.
> +                */
> +               if (buffer->decrypted &&
> +                   system_heap_set_page_encrypted(page))
> +                       continue;
> +

What are the conditions where this would fail? How much of an edge
case is this? I fret this opens a DoS vector if one is able to
allocate from this heap and then stress the system when doing the
free.

Should there be some global list of leaked decrypted pages such that
the mm subsystem could try again later to recover these?

> diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> index 648328a64b27..d97b668413c1 100644
> --- a/include/linux/dma-heap.h
> +++ b/include/linux/dma-heap.h
> @@ -10,6 +10,7 @@
>  #define _DMA_HEAPS_H
>
>  #include <linux/types.h>
> +#include <uapi/linux/dma-heap.h>
>
>  struct dma_heap;
>
> diff --git a/include/uapi/linux/dma-heap.h b/include/uapi/linux/dma-heap.=
h
> index a4cf716a49fa..ab95bb355ed5 100644
> --- a/include/uapi/linux/dma-heap.h
> +++ b/include/uapi/linux/dma-heap.h
> @@ -18,8 +18,7 @@
>  /* Valid FD_FLAGS are O_CLOEXEC, O_RDONLY, O_WRONLY, O_RDWR */
>  #define DMA_HEAP_VALID_FD_FLAGS (O_CLOEXEC | O_ACCMODE)
>
> -/* Currently no heap flags */
> -#define DMA_HEAP_VALID_HEAP_FLAGS (0ULL)
> +#define DMA_HEAP_VALID_HEAP_FLAGS (0)
>
>  /**
>   * struct dma_heap_allocation_data - metadata passed from userspace for

Are these header changes still necessary?

thanks
-john

