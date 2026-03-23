Return-Path: <linux-media+bounces-56776-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KK0QOOfMwWm4WwQAu9opvQ
	(envelope-from <linux-media+bounces-56776-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 00:29:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D0A2FEF9E
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 00:29:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB4D5307C259
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 23:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3223845DA;
	Mon, 23 Mar 2026 23:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iRZ/+YBl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA652384228
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 23:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774308362; cv=pass; b=MkD9zqUgsrM5BJiD48ln0MZ6Jlk3CSQ66y6CcjEH1o4XNBlw1wuJlHsLHyEvAFwrObQiD4t7GtKa7vzK/AwCkuYLOxl8jjBz9BaMjOOxEHUTDa+yck3Zs0tNBLQr4XbCth0Sdhq7zQz6zsrc+V4XF2cdV/envOxO224EuZdHLSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774308362; c=relaxed/simple;
	bh=09UBAf8xcfnmqaigEjrBhwyzAMugRPC7W07kbYmjjKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kHe9JTT2hxkIK/m1lKQsODrQiLUxT+6RyISlsHZlNUAOteUOe2pbV6OvDc8lSSzJ552DaMlQvEjptLNtwTE4SuiBs2nyqBHs+JhkYX3pldUAsDE5wfpyzLbfUbb1pqcmCRBXMsVSIKyu6lDMvpoHHnTjwqQVafbKv05eGJYCUKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iRZ/+YBl; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852ef20fe8so17545e9.1
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 16:25:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774308358; cv=none;
        d=google.com; s=arc-20240605;
        b=JHRGyrLzlwy8c1I9DM/OeL2rXejLdAL1RuxqeGPB5wRXbAqi5kpMhDgfhOYGg6tkbC
         rut7LPQ1Cji7FsMYmM5SxnBpIAvkku//TcShwLINhDMy1+Vf0hoGXVfl1yM2MUYRG9r1
         GNMkHYi6M6ccgXFYzIddLmdNGsFgU/uD2wFLzyNwYwrgDUPcyRPJpa7I4rm3oUW15OxH
         AvnpHCALrDZY6GnH8xTeXxwk3sInyegm9gbOUjNb0mXAeO9TmhA5E8nFPT8Uo7Lr864u
         DA5Flil812/3IZujx48PLxjdVJKmHuPy1IsVr3GXlOIz9RgX79hHZXeH+245HsMy4NiZ
         iCbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wsdu7cH+tJM9BcvV/aAG6iPqbhR4QDoeSOE9glJa45Q=;
        fh=HYxpo90ywNpiiG+AiE8Wo509U+NPAuwvs26jTujdk5w=;
        b=gycYvxk8hobyR3DdNf262xEplkuK6BNXapNkPL0ycP83arDWW1xYuW6VK1Prf9hQcm
         HVaAM2g/qOlARsqVFQit7+oMBG192aOgWM0/lv7WFTKzYKz8Ppl4N7hL90YTZhOMUBF6
         MA59diORfZk5zyONu67Zb7r6tiCa0GxrSIRIVEoZH3njHHqAhPkAmptf+2Dj+0XCpqUy
         b/dnUWSqEW2OhFZNDP3ib5ePxR+fAThENTTetpeNqKimwqAovZNeM7TxEeftiAkdABDh
         mCQm4drCEt+xIuKkZia78A2tlcBWM+JqdmuQwkuH4gQWUL78kfBUtJXzWre2GeNyb2JN
         qbXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774308358; x=1774913158; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsdu7cH+tJM9BcvV/aAG6iPqbhR4QDoeSOE9glJa45Q=;
        b=iRZ/+YBlOyCIxEAUxL6hKMxdLZ5pBnh5otnPdUQbuHHzEoOTn6J9d3VmvM2522Higw
         Qr5xfy5ZV8/eUI0ppGo0rQC23TtMbq0szxLGKaLQDObWbHmS4s76mZ+/csXkAZQTwbF0
         AVstHIRu8p5BA/Mo29+CGu9qZjYvvP1bISYdWubO9I9UDhKvM22vFlSIXPbClCeK8hrC
         ZDuFZHMC2y6LjESW96yaAHJWNZJwvhiioIj6uO0d5FL7f9V+okDNYQaAOjVU5kViE/vl
         GgSwhd1t9+uu3NL0W3YZtfpDiky1EyzF7g1VJKqZ84+hzqR+RfDSftsNZPaf8FxB5Oed
         xHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774308358; x=1774913158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wsdu7cH+tJM9BcvV/aAG6iPqbhR4QDoeSOE9glJa45Q=;
        b=JpQ0TDUIhRKTlID1jil8amOB+KhnyesOK1F9aZ9ymroRuu7BcmwI2viIbXMtu3AwnU
         QgZ1AytVObmboLdEMU4+gnaL7WxrIus8cMTdqAevHTdI/r7BZG8VmThn6AE4C9xFBvQA
         qUNeAPigFzXLTjSNTcMJQ9l1hGL3Do02YQ+a06qM36Rl0l3TqUkLwEWoo757d2OZG6VW
         7ZlkjfsBmy5QNuPvflH5oq52wfAqzAC4hNGj96gqNpScGRKbOlcYsf6TunPUXjvD2W/Z
         ibxsrumdPsb6dYTdpgwyBqMwkX8coAlll3so7W1nqb9nwHefRWXPvP32B92tGRFQAZI9
         XoSw==
X-Forwarded-Encrypted: i=1; AJvYcCVxId2UQYpoSSz3S/RIb2u6KLF0DYdTZg/ODwImTNbSQTydah/T0yvlxRt2UEtNoFvxqKQ61foQQ0rnLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCbOhaDU5zsiJEFD1y0/RyqNH8ZPJ3842Sv9Y8gFaxLd2S2kSH
	N7RcQqoIpgrqMp2Rl1iRi8RifZ2eeSlGi9sgnpd6oPlCY9RzDtjxiedYO5qidSUGVVXfXG1pVDU
	AknafNlbwzNi1qwwuJZdAU2szZD8MZxDXRqb7t0PO
X-Gm-Gg: ATEYQzz74dHxQICneBuuLZcZSTEB/yf0V0HZIZ+WMA/CIPm8FvDVGxVWA+RMVRRK/HO
	Vc9l+StG0vIzCw6jl9Y/l1Oxw2eMl8wkp9lTmPTYpCF11kpgb3tXFR16YSWqsaReSfEzAtg9QHp
	gIgz0xntD6l19yNi57GHNXklxH07tax8OHYqbmzHNVjDZ38D6Yfkd+6ZZV53prkWOeZGCN/4RQc
	6VDaItWJW9CHLZcHL3YcCi2uJfGOV/mpMta8lnfKXV0gn6IYZ8BhkZea/0TEQYh9hEzexCIo53i
	Jk4nHwm6QvJiIte2v54JptZvEittXm6xsGp8Kw==
X-Received: by 2002:a05:600c:4e14:b0:485:1a54:9407 with SMTP id
 5b1f17b1804b1-4870f497b4fmr377175e9.0.1774308357801; Mon, 23 Mar 2026
 16:25:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316125857.617836-1-jiri@resnulli.us> <20260316125857.617836-3-jiri@resnulli.us>
In-Reply-To: <20260316125857.617836-3-jiri@resnulli.us>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 23 Mar 2026 16:25:46 -0700
X-Gm-Features: AQROBzDCFwWsy0-ozjsBb2bwEOaZ0_wnDJdRRApw7r8ld8wpTu_Wh01I0Gdm1Bs
Message-ID: <CABdmKX0Ux2HMTTuOnvZryBBRwCjH0zUe-EMvL9k1VxZtz+BWiA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] dma-buf: heaps: system: add system_cc_decrypted
 heap for explicitly decrypted memory
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, 
	jgg@ziepe.ca, leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56776-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,exp_info.name:url,nvidia.com:email,resnulli.us:email]
X-Rspamd-Queue-Id: 43D0A2FEF9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 5:59=E2=80=AFAM Jiri Pirko <jiri@resnulli.us> wrote=
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
> ---
> v2->v3:
> - removed couple of leftovers from headers
> v1->v2:
> - fixed build errors on s390 by including mem_encrypt.h
> - converted system heap flag implementation to a separate heap
> ---
>  drivers/dma-buf/heaps/system_heap.c | 103 ++++++++++++++++++++++++++--
>  1 file changed, 98 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/=
system_heap.c
> index b3650d8fd651..a525e9aaaffa 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -10,17 +10,25 @@
>   *     Andrew F. Davis <afd@ti.com>
>   */
>
> +#include <linux/cc_platform.h>
>  #include <linux/dma-buf.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dma-heap.h>
>  #include <linux/err.h>
>  #include <linux/highmem.h>
> +#include <linux/mem_encrypt.h>
>  #include <linux/mm.h>
> +#include <linux/set_memory.h>
>  #include <linux/module.h>
> +#include <linux/pgtable.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/vmalloc.h>
>
> +struct system_heap_priv {
> +       bool decrypted;
> +};

Hi Jiri,

I wonder if it'd better to call this cc_decrypted (or I guess
cc_shared based on Robin's comment in the previous patch) like the DMA
attr? There's a separate effort for "restricted" heaps with TEE for
(encrypted) video playback, which doesn't involve VMs or RDMA. I think
the cc_ prefix might help avoid any confusion between the usecase here
and restricted heaps.



> +
>  struct system_heap_buffer {
>         struct dma_heap *heap;
>         struct list_head attachments;
> @@ -29,6 +37,7 @@ struct system_heap_buffer {
>         struct sg_table sg_table;
>         int vmap_cnt;
>         void *vaddr;
> +       bool decrypted;
>  };
>
>  struct dma_heap_attachment {
> @@ -36,6 +45,7 @@ struct dma_heap_attachment {
>         struct sg_table table;
>         struct list_head list;
>         bool mapped;
> +       bool decrypted;
>  };
>
>  #define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO)
> @@ -52,6 +62,34 @@ static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, HIGH_O=
RDER_GFP, LOW_ORDER_GFP};
>  static const unsigned int orders[] =3D {8, 4, 0};
>  #define NUM_ORDERS ARRAY_SIZE(orders)
>
> +static int system_heap_set_page_decrypted(struct page *page)
> +{
> +       unsigned long addr =3D (unsigned long)page_address(page);
> +       unsigned int nr_pages =3D 1 << compound_order(page);
> +       int ret;
> +
> +       ret =3D set_memory_decrypted(addr, nr_pages);
> +       if (ret)
> +               pr_warn_ratelimited("dma-buf system heap: failed to decry=
pt page at %p\n",
> +                                   page_address(page));
> +
> +       return ret;
> +}
> +
> +static int system_heap_set_page_encrypted(struct page *page)
> +{
> +       unsigned long addr =3D (unsigned long)page_address(page);
> +       unsigned int nr_pages =3D 1 << compound_order(page);
> +       int ret;
> +
> +       ret =3D set_memory_encrypted(addr, nr_pages);
> +       if (ret)
> +               pr_warn_ratelimited("dma-buf system heap: failed to re-en=
crypt page at %p, leaking memory\n",
> +                                   page_address(page));
> +
> +       return ret;
> +}
> +
>  static int dup_sg_table(struct sg_table *from, struct sg_table *to)
>  {
>         struct scatterlist *sg, *new_sg;
> @@ -90,6 +128,7 @@ static int system_heap_attach(struct dma_buf *dmabuf,
>         a->dev =3D attachment->dev;
>         INIT_LIST_HEAD(&a->list);
>         a->mapped =3D false;
> +       a->decrypted =3D buffer->decrypted;
>
>         attachment->priv =3D a;
>
> @@ -119,9 +158,11 @@ static struct sg_table *system_heap_map_dma_buf(stru=
ct dma_buf_attachment *attac
>  {
>         struct dma_heap_attachment *a =3D attachment->priv;
>         struct sg_table *table =3D &a->table;
> +       unsigned long attrs;
>         int ret;
>
> -       ret =3D dma_map_sgtable(attachment->dev, table, direction, 0);
> +       attrs =3D a->decrypted ? DMA_ATTR_CC_DECRYPTED : 0;
> +       ret =3D dma_map_sgtable(attachment->dev, table, direction, attrs)=
;
>         if (ret)
>                 return ERR_PTR(ret);
>
> @@ -188,8 +229,13 @@ static int system_heap_mmap(struct dma_buf *dmabuf, =
struct vm_area_struct *vma)
>         unsigned long addr =3D vma->vm_start;
>         unsigned long pgoff =3D vma->vm_pgoff;
>         struct scatterlist *sg;
> +       pgprot_t prot;
>         int i, ret;
>
> +       prot =3D vma->vm_page_prot;
> +       if (buffer->decrypted)
> +               prot =3D pgprot_decrypted(prot);
> +
>         for_each_sgtable_sg(table, sg, i) {
>                 unsigned long n =3D sg->length >> PAGE_SHIFT;
>
> @@ -206,8 +252,7 @@ static int system_heap_mmap(struct dma_buf *dmabuf, s=
truct vm_area_struct *vma)
>                 if (addr + size > vma->vm_end)
>                         size =3D vma->vm_end - addr;
>
> -               ret =3D remap_pfn_range(vma, addr, page_to_pfn(page),
> -                               size, vma->vm_page_prot);
> +               ret =3D remap_pfn_range(vma, addr, page_to_pfn(page), siz=
e, prot);
>                 if (ret)
>                         return ret;
>
> @@ -225,6 +270,7 @@ static void *system_heap_do_vmap(struct system_heap_b=
uffer *buffer)
>         struct page **pages =3D vmalloc(sizeof(struct page *) * npages);
>         struct page **tmp =3D pages;
>         struct sg_page_iter piter;
> +       pgprot_t prot;
>         void *vaddr;
>
>         if (!pages)
> @@ -235,7 +281,10 @@ static void *system_heap_do_vmap(struct system_heap_=
buffer *buffer)
>                 *tmp++ =3D sg_page_iter_page(&piter);
>         }
>
> -       vaddr =3D vmap(pages, npages, VM_MAP, PAGE_KERNEL);
> +       prot =3D PAGE_KERNEL;
> +       if (buffer->decrypted)
> +               prot =3D pgprot_decrypted(prot);
> +       vaddr =3D vmap(pages, npages, VM_MAP, prot);
>         vfree(pages);
>
>         if (!vaddr)
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
>                 __free_pages(page, compound_order(page));
>         }
>         sg_free_table(table);
> @@ -347,6 +404,8 @@ static struct dma_buf *system_heap_allocate(struct dm=
a_heap *heap,
>         DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>         unsigned long size_remaining =3D len;
>         unsigned int max_order =3D orders[0];
> +       struct system_heap_priv *priv =3D dma_heap_get_drvdata(heap);
> +       bool decrypted =3D priv->decrypted;
>         struct dma_buf *dmabuf;
>         struct sg_table *table;
>         struct scatterlist *sg;
> @@ -362,6 +421,7 @@ static struct dma_buf *system_heap_allocate(struct dm=
a_heap *heap,
>         mutex_init(&buffer->lock);
>         buffer->heap =3D heap;
>         buffer->len =3D len;
> +       buffer->decrypted =3D decrypted;
>
>         INIT_LIST_HEAD(&pages);
>         i =3D 0;
> @@ -396,6 +456,14 @@ static struct dma_buf *system_heap_allocate(struct d=
ma_heap *heap,
>                 list_del(&page->lru);
>         }
>
> +       if (decrypted) {
> +               for_each_sgtable_sg(table, sg, i) {
> +                       ret =3D system_heap_set_page_decrypted(sg_page(sg=
));
> +                       if (ret)
> +                               goto free_pages;
> +               }
> +       }
> +
>         /* create the dmabuf */
>         exp_info.exp_name =3D dma_heap_get_name(heap);
>         exp_info.ops =3D &system_heap_buf_ops;
> @@ -413,6 +481,13 @@ static struct dma_buf *system_heap_allocate(struct d=
ma_heap *heap,
>         for_each_sgtable_sg(table, sg, i) {
>                 struct page *p =3D sg_page(sg);
>
> +               /*
> +                * Intentionally leak pages that cannot be re-encrypted
> +                * to prevent decrypted memory from being reused.
> +                */
> +               if (buffer->decrypted &&
> +                   system_heap_set_page_encrypted(p))
> +                       continue;
>                 __free_pages(p, compound_order(p));
>         }
>         sg_free_table(table);
> @@ -428,6 +503,14 @@ static const struct dma_heap_ops system_heap_ops =3D=
 {
>         .allocate =3D system_heap_allocate,
>  };
>
> +static struct system_heap_priv system_heap_priv =3D {
> +       .decrypted =3D false,
> +};
> +
> +static struct system_heap_priv system_heap_cc_decrypted_priv =3D {
> +       .decrypted =3D true,
> +};
> +
>  static int __init system_heap_create(void)
>  {
>         struct dma_heap_export_info exp_info;
> @@ -435,8 +518,18 @@ static int __init system_heap_create(void)
>
>         exp_info.name =3D "system";
>         exp_info.ops =3D &system_heap_ops;
> -       exp_info.priv =3D NULL;
> +       exp_info.priv =3D &system_heap_priv;
> +
> +       sys_heap =3D dma_heap_add(&exp_info);
> +       if (IS_ERR(sys_heap))
> +               return PTR_ERR(sys_heap);
> +
> +       if (IS_ENABLED(CONFIG_HIGHMEM) ||
> +           !cc_platform_has(CC_ATTR_MEM_ENCRYPT))
> +               return 0;
>
> +       exp_info.name =3D "system_cc_decrypted";
> +       exp_info.priv =3D &system_heap_cc_decrypted_priv;
>         sys_heap =3D dma_heap_add(&exp_info);
>         if (IS_ERR(sys_heap))
>                 return PTR_ERR(sys_heap);
> --
> 2.51.1
>

