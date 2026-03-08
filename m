Return-Path: <linux-media+bounces-54899-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Js4OHvDrWmf7AEAu9opvQ
	(envelope-from <linux-media+bounces-54899-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 08 Mar 2026 19:44:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CF5231C26
	for <lists+linux-media@lfdr.de>; Sun, 08 Mar 2026 19:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 790DF303C613
	for <lists+linux-media@lfdr.de>; Sun,  8 Mar 2026 18:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C5F395262;
	Sun,  8 Mar 2026 18:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OO5VH0YX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8D6393DCA
	for <linux-media@vger.kernel.org>; Sun,  8 Mar 2026 18:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772995321; cv=pass; b=ANoj80WPKZ7Tvhm46GE0wLKTuJImm+0vCl0sTmnCHUXI+20TiGe6X33tLDxanNpPFKHSCPIdFSUsh+Q3y6aYwFkBDBrjhkf1HMy1VQcLuVG8Ipuqwsz1dCIBTQO8SBkBXJjpn+WZVCYPtIZnMWXIMPSP5Fusam70xUzIxYVfDt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772995321; c=relaxed/simple;
	bh=dd/2spyM4ttJfOLcRoRr1Yscl0nbVv+FbKOYT2d/i7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iD8o6I6XawPtWiDTavgzRk78jftaj9aKUuS9x5clpWWTP/FBc1U8ddc5FHad/puWg0y/SiGk58vD4MrQgPHf8OYIDtEerAEWgbyD34jZe0hxkcKlXoIYaxpGwNmjNUGF62JtqN1JFCVqa1aswdvtzg25B/LjjQ4BF5wF5UXe3XU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OO5VH0YX; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64acd19e1dfso9129142d50.0
        for <linux-media@vger.kernel.org>; Sun, 08 Mar 2026 11:41:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1772995319; cv=none;
        d=google.com; s=arc-20240605;
        b=bGx1ohPCb5Q06Np0PHoY/qs3kIR1H+ec0jQWC/PNsH1a5U3i506dHbRbgm56U1WUsF
         s1ruMHLD+00Fy28MVxWg4djQrQUD53K/w9yCXRb1Sl9Zg932FDR/51b7ogB3g42fng/F
         2/825nAZEax/0pwpWEbeiY6p7ksz+rtW8uKprCEwcOKQ/XBifRDsYytoonhg0CPvrnnb
         7r0MH6vxVbF181giHD9V71HYW1cniYH8TEYVJt5FyArXBg7KjqYgLu7e6HX33TCVQ6rA
         0zL5ZaEZaV9D8iXtkdb69qmFwkq4dX6sJEZZRTwNmA6YIcgEmxqbDBy4vhisJU1CDu9R
         FyaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZpzDnHDe78iWEUGuOKrGYfeMK0pcHHei4ODQ9kclWaI=;
        fh=w69zA/GpLMq8H8zU8Nj8LX0dWiJ73/imboS/I6C+qvU=;
        b=LqqWklEJU41rIYNK1lpGhaXI3R9YbOx/yHPVXD41pNkeYnIyDv5lwN8Q0mRcV429JK
         aoymwpCEX7Cl3Kq8v49vfiwQUWjV+9rJ5RuPV7V8cvRJ/Ieca5bxiTUDdX606zCdKszj
         Z4VGSsAquZEbaKA5aCHo5/ZWJ8hoijG3ou9Pbk4OUV17cJrWi/wFW/oLFYbMDE/eXV8o
         5Tb0JZM7NzK6hKVE+9lQZC7nn+P5sr0s8EN2ki0GufL0VT716RFkrNgJlihCGlzDWMrq
         8KzsQ/xdZCI5ssU9U5a6ZQt2RngmJ8fzNi5oMf9PevN4iNrTxOE0y1c09Nyr+BJiTTDf
         te6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772995319; x=1773600119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpzDnHDe78iWEUGuOKrGYfeMK0pcHHei4ODQ9kclWaI=;
        b=OO5VH0YXamhcXhzPg5h4LjRyX4Adj4uFgCfQUaH5HQg4vph+5erEckpWHzMzTWIFJ2
         LZmYF5azbkKKUJkn36qNYxIowsJ44YGw/Zxm3a7EreNm7AunkeRaWbMYI5giaw4m11/P
         9/2Q+Tu74gZWEG4VF9C2dyifeeverdstC2DaZkz/qSRuvsf6fV5egI2MexMA5IOjCgRV
         Gu5ZEtzqM5PwjczClVBOmNGUZdIQPMzBmPxMaYXvnQc9L8N3iu5HBEe6VJqO01Or+XrS
         ECV1s5IK4xN4ZThTK7h88R5ypCKPkfzpWp6WGv260baedUIOWVEBjof0gU089B4fmX6b
         3ftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772995319; x=1773600119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZpzDnHDe78iWEUGuOKrGYfeMK0pcHHei4ODQ9kclWaI=;
        b=FwcH++fDB1mYK1n8GGmYkyjUUabFtIRoWbmcNHCxHMV1yiRbNzJfKj4/1Ky7XNnfnF
         KHf2myYPqJrFVGZ58cWUzIIJqrX36bnZWy6Ll81GdAUK5Fj2facmyys6FzyZunDoSnKD
         vPTVjg4AE8MMd711LkXAKSHMoEZhF/WLtWGmiXoUqc/YX93+peo6NNT2+ZhQ36P77Kum
         gSwfd2VgpOiXQSm4OWcJEhtZiA/2A26fCJAc8oQ0X+qWrVsHJOaeeLe2kAOcaFVPIgTD
         L5DoEKBQUCuMjxuYPJzEX37fh5KqGLGjkzrdehVUTYrK+WRkbA66aA/O3aZ4jK21U+Rv
         HWhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvLeNCil/9aCNcvAQRMqmiVA/jDNJcsmHvHiHd3loWtv/hrFoqoQKhpvtae4SrksdTV1WEOgZmGaVyBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5ZtOBgcJB3SNR+XlIsgDLFuthUX/oiYsPuzBLN1YtTDuTZ9dg
	5cBMV8u8vFBclRIaxsYBZdrHidwcHnf8UwZpyNUT21iDQzVHzPSEybsBSWxjQaxBPDOflSnLHQ+
	j2JjfRbhOQeqr6H5rLujhzAQ6fsOCgJ8=
X-Gm-Gg: ATEYQzz5gLZ+bX90GYcOBKe8ZjRG2d1hvY2PBS+/PqW5Rwq5J89CS2tZO7llpE53lfE
	lTtyjlWdJ6DxshUeYLuMV99DtBEGiAjK5JeTB2w899iD6q2864dseMiWRArnlOsRsJwls2R1CDO
	lA51C02KP+LtptiYaitXWOAXATieZ6clDxPpcPFT+P13DkBSDZU2eWKVLDSIyp82NV6UMOwnYv2
	cql3whtijTsoWX+Kv9UjLk3zUlfMFlD7gdFoKnwzUyd4PvgVvkmVNi8v6SnUXCREtxTBj5B543x
	qv++c8ucjAaA9zV/S711u4HAY5IrAeHaehnSUOab47iNzRdR
X-Received: by 2002:a53:b442:0:b0:64c:ed24:13da with SMTP id
 956f58d0204a3-64d142c7f83mr6741794d50.57.1772995318771; Sun, 08 Mar 2026
 11:41:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308-scatterlist-v1-1-39c4566b0bba@gmail.com> <20260308180826.GG1687929@ziepe.ca>
In-Reply-To: <20260308180826.GG1687929@ziepe.ca>
From: Julian Orth <ju.orth@gmail.com>
Date: Sun, 8 Mar 2026 19:41:48 +0100
X-Gm-Features: AaiRm51KnGt1Ocvg1JS9VA3riuFsR3OYVC6SxA9saLbhpmRB0QADzrk-wJNj6tE
Message-ID: <CAHijbEX=LN_ntp6zwsqy3sW7EB+E6cBCWnrKZb_RqdNG=Et_3g@mail.gmail.com>
Subject: Re: [PATCH] lib/scatterlist: fix sg_page_count and sg_dma_page_count
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Andrew Morton <akpm@linux-foundation.org>, Imre Deak <imre.deak@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Thomas Hellstrom <thellstrom@vmware.com>, 
	linux-kernel@vger.kernel.org, Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 49CF5231C26
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54899-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.894];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[juorth@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,ziepe.ca:email]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 7:08=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrote=
:
>
> On Sun, Mar 08, 2026 at 02:55:27PM +0100, Julian Orth wrote:
> > A user reported memory corruption in the Jay wayland compositor [1]. Th=
e
> > corruption started when archlinux enabled
> > CONFIG_TRANSPARENT_HUGEPAGE_SHMEM_HUGE_WITHIN_SIZE in kernel 6.19.5.
> >
> > The compositor uses udmabuf to upload memory from memfds to the GPU.
> > When running an affected kernel, the following warnings are logged:
> >
> >     a - addrs >=3D max_entries
> >     WARNING: drivers/gpu/drm/drm_prime.c:1089 at drm_prime_sg_to_dma_ad=
dr_array+0x86/0xc0, CPU#31: jay/1864
> >     [...]
> >     Call Trace:
> >      <TASK>
> >      amdgpu_bo_move+0x188/0x800 [amdgpu 3b451640234948027c09e9b39e6520b=
c7e5471cf]
> >
> > Disabling the use of huge pages at runtime via
> > /sys/kernel/mm/transparent_hugepage/shmem_enabled fixes the issue.
> >
> > udmabuf allocates a scatterlist with buffer_size/PAGE_SIZE entries. Eac=
h
> > entry has a length of PAGE_SIZE. With huge pages disabled, it appears
> > that sg->offset is always 0. With huge pages enabled, sg->offset is
> > incremented by PAGE_SIZE until the end of the huge page.
>
> This was broken by 0c8b91ef5100 ("udmabuf: add back support for
> mapping hugetlb pages") which switched from a working
> sg_alloc_table_from_pages() to a messed up sg_set_pages loop:
>
> +       for_each_sg(sg->sgl, sgl, ubuf->pagecount, i)
> +               sg_set_page(sgl, ubuf->pages[i], PAGE_SIZE, ubuf->offsets=
[i]);
> [..]
> +               ubuf->offsets[*pgbuf] =3D subpgoff << PAGE_SHIFT;
>
> Which is just the wrong way to use the scatterlist API.
>
> This was later changed to sg_set_folio() which I'm also suspecting has
> a bug, it should be setting page_link to the proper tail page because
> as you observe page_offset must fall within 0 to PAGE_SIZE-1 to make
> the iterator work.
>
> I think the whole design here in udmabuf makes very little sense. It
> starts out with an actual list of folios then expands them to a per-4K
> double array of folio/offset. This is nonsensical, if it wants to
> build a way to direct index the mapping for mmap it should just build
> itself a page * array like the code used to do and continue to use
> sg_alloc_table_from_pages() which builds properly formed scatterlists.
>
> This would save memory, use the APIs properly and build a correct and
> optimized scatterlist to boot. It uses vmf_insert_pfn() and
> vm_map_ram() anyhow so it doesn't even use a folio :\
>
> Here, a few mins of AI shows what I think udmabuf should look like. If
> you wish to persue this please add my signed-off-by and handle testing
> it and getting it merged. I reviewed it enough to see it was showing
> what I wanted.

I don't know enough about folios or udmabuf to efficiently work on this.

If offset is supposed to be in [0, PAGE_SIZE-1], then my patch is
incorrect and it's probably better if some of the udmabuf maintainers
take a look at this. I've added them to CC.

>
> Jason
>
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 94b8ecb892bb17..5d687860445137 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -26,10 +26,10 @@ MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf=
, in megabytes. Default is
>
>  struct udmabuf {
>         pgoff_t pagecount;
> -       struct folio **folios;
> +       struct page **pages;
>
>         /**
> -        * Unlike folios, pinned_folios is only used for unpin.
> +        * Unlike pages, pinned_folios is only used for unpin.
>          * So, nr_pinned is not the same to pagecount, the pinned_folios
>          * only set each folio which already pinned when udmabuf_create.
>          * Note that, since a folio may be pinned multiple times, each fo=
lio
> @@ -41,7 +41,6 @@ struct udmabuf {
>
>         struct sg_table *sg;
>         struct miscdevice *device;
> -       pgoff_t *offsets;
>  };
>
>  static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
> @@ -55,8 +54,7 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf=
)
>         if (pgoff >=3D ubuf->pagecount)
>                 return VM_FAULT_SIGBUS;
>
> -       pfn =3D folio_pfn(ubuf->folios[pgoff]);
> -       pfn +=3D ubuf->offsets[pgoff] >> PAGE_SHIFT;
> +       pfn =3D page_to_pfn(ubuf->pages[pgoff]);
>
>         ret =3D vmf_insert_pfn(vma, vmf->address, pfn);
>         if (ret & VM_FAULT_ERROR)
> @@ -73,8 +71,7 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf=
)
>                 if (WARN_ON(pgoff >=3D ubuf->pagecount))
>                         break;
>
> -               pfn =3D folio_pfn(ubuf->folios[pgoff]);
> -               pfn +=3D ubuf->offsets[pgoff] >> PAGE_SHIFT;
> +               pfn =3D page_to_pfn(ubuf->pages[pgoff]);
>
>                 /**
>                  * If the below vmf_insert_pfn() fails, we do not return =
an
> @@ -109,22 +106,11 @@ static int mmap_udmabuf(struct dma_buf *buf, struct=
 vm_area_struct *vma)
>  static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
>  {
>         struct udmabuf *ubuf =3D buf->priv;
> -       struct page **pages;
>         void *vaddr;
> -       pgoff_t pg;
>
>         dma_resv_assert_held(buf->resv);
>
> -       pages =3D kvmalloc_objs(*pages, ubuf->pagecount);
> -       if (!pages)
> -               return -ENOMEM;
> -
> -       for (pg =3D 0; pg < ubuf->pagecount; pg++)
> -               pages[pg] =3D folio_page(ubuf->folios[pg],
> -                                      ubuf->offsets[pg] >> PAGE_SHIFT);
> -
> -       vaddr =3D vm_map_ram(pages, ubuf->pagecount, -1);
> -       kvfree(pages);
> +       vaddr =3D vm_map_ram(ubuf->pages, ubuf->pagecount, -1);
>         if (!vaddr)
>                 return -EINVAL;
>
> @@ -146,22 +132,18 @@ static struct sg_table *get_sg_table(struct device =
*dev, struct dma_buf *buf,
>  {
>         struct udmabuf *ubuf =3D buf->priv;
>         struct sg_table *sg;
> -       struct scatterlist *sgl;
> -       unsigned int i =3D 0;
>         int ret;
>
>         sg =3D kzalloc_obj(*sg);
>         if (!sg)
>                 return ERR_PTR(-ENOMEM);
>
> -       ret =3D sg_alloc_table(sg, ubuf->pagecount, GFP_KERNEL);
> +       ret =3D sg_alloc_table_from_pages(sg, ubuf->pages, ubuf->pagecoun=
t, 0,
> +                                       ubuf->pagecount << PAGE_SHIFT,
> +                                       GFP_KERNEL);
>         if (ret < 0)
>                 goto err_alloc;
>
> -       for_each_sg(sg->sgl, sgl, ubuf->pagecount, i)
> -               sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE,
> -                            ubuf->offsets[i]);
> -
>         ret =3D dma_map_sgtable(dev, sg, direction, 0);
>         if (ret < 0)
>                 goto err_map;
> @@ -207,12 +189,8 @@ static void unpin_all_folios(struct udmabuf *ubuf)
>
>  static __always_inline int init_udmabuf(struct udmabuf *ubuf, pgoff_t pg=
cnt)
>  {
> -       ubuf->folios =3D kvmalloc_objs(*ubuf->folios, pgcnt);
> -       if (!ubuf->folios)
> -               return -ENOMEM;
> -
> -       ubuf->offsets =3D kvzalloc_objs(*ubuf->offsets, pgcnt);
> -       if (!ubuf->offsets)
> +       ubuf->pages =3D kvmalloc_objs(*ubuf->pages, pgcnt);
> +       if (!ubuf->pages)
>                 return -ENOMEM;
>
>         ubuf->pinned_folios =3D kvmalloc_objs(*ubuf->pinned_folios, pgcnt=
);
> @@ -225,8 +203,7 @@ static __always_inline int init_udmabuf(struct udmabu=
f *ubuf, pgoff_t pgcnt)
>  static __always_inline void deinit_udmabuf(struct udmabuf *ubuf)
>  {
>         unpin_all_folios(ubuf);
> -       kvfree(ubuf->offsets);
> -       kvfree(ubuf->folios);
> +       kvfree(ubuf->pages);
>  }
>
>  static void release_udmabuf(struct dma_buf *buf)
> @@ -344,8 +321,8 @@ static long udmabuf_pin_folios(struct udmabuf *ubuf, =
struct file *memfd,
>                 ubuf->pinned_folios[nr_pinned++] =3D folios[cur_folio];
>
>                 for (; subpgoff < fsize; subpgoff +=3D PAGE_SIZE) {
> -                       ubuf->folios[upgcnt] =3D folios[cur_folio];
> -                       ubuf->offsets[upgcnt] =3D subpgoff;
> +                       ubuf->pages[upgcnt] =3D folio_page(folios[cur_fol=
io],
> +                                               subpgoff >> PAGE_SHIFT);
>                         ++upgcnt;
>
>                         if (++cur_pgcnt >=3D pgcnt)
>

