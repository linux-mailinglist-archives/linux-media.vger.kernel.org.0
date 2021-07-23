Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 515FA3D4062
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 20:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbhGWSFR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 14:05:17 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:50836 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbhGWSFR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 14:05:17 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 4CCC61FFF3;
        Fri, 23 Jul 2021 18:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1627065949; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=374VqK3beLA4u7TcvD9d0pUXeEHQF+W+U/hTfuavUVM=;
        b=ZC+7dIxSHniSd4h62NVHijlUxibwgasvZF9wWFjS/HaUEoVBWpaAb1ENxwkzzH8ZHDBmsb
        VL5iP58b8QpFLojqC21jNinM+XoEAGdCyM8ayokWcVtY8rqNenZiFnE53oGP/jNOTDGdpA
        xlGpxwWe1fKhNUVtqk7gYkzp6hp8mm8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1627065949;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=374VqK3beLA4u7TcvD9d0pUXeEHQF+W+U/hTfuavUVM=;
        b=/jMV4jNtODVWHf6qghTw10igWlyyP0HrqNMItb949xo7ePtR8HM47NWmE/p+XFhKHCMUvy
        hX5NWjV3yNl+1XCQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 12BAD13809;
        Fri, 23 Jul 2021 18:45:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id UxnqAl0O+2AaYwAAGKfGzw
        (envelope-from <tzimmermann@suse.de>); Fri, 23 Jul 2021 18:45:49 +0000
Subject: Re: [PATCH v4 1/4] dma-buf: Require VM_PFNMAP vma for mmap
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc:     Matthew Wilcox <willy@infradead.org>,
        linaro-mm-sig@lists.linaro.org, Jason Gunthorpe <jgg@ziepe.ca>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Suren Baghdasaryan <surenb@google.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org
References: <20210713205153.1896059-1-daniel.vetter@ffwll.ch>
 <20210713205153.1896059-2-daniel.vetter@ffwll.ch>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <7009d234-a19a-bc37-5b1f-9f11bd5db747@suse.de>
Date:   Fri, 23 Jul 2021 20:45:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713205153.1896059-2-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="U10chBrx1i8ohB3Hqy1rKySOCXBNq6D0t"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--U10chBrx1i8ohB3Hqy1rKySOCXBNq6D0t
Content-Type: multipart/mixed; boundary="zafYGsYFjuaSkJcPUvI1cUhQDoYSPW7TS";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: Matthew Wilcox <willy@infradead.org>, linaro-mm-sig@lists.linaro.org,
 Jason Gunthorpe <jgg@ziepe.ca>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Message-ID: <7009d234-a19a-bc37-5b1f-9f11bd5db747@suse.de>
Subject: Re: [PATCH v4 1/4] dma-buf: Require VM_PFNMAP vma for mmap
References: <20210713205153.1896059-1-daniel.vetter@ffwll.ch>
 <20210713205153.1896059-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20210713205153.1896059-2-daniel.vetter@ffwll.ch>

--zafYGsYFjuaSkJcPUvI1cUhQDoYSPW7TS
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.07.21 um 22:51 schrieb Daniel Vetter:
> tldr; DMA buffers aren't normal memory, expecting that you can use
> them like that (like calling get_user_pages works, or that they're
> accounting like any other normal memory) cannot be guaranteed.
>=20
> Since some userspace only runs on integrated devices, where all
> buffers are actually all resident system memory, there's a huge
> temptation to assume that a struct page is always present and useable
> like for any more pagecache backed mmap. This has the potential to
> result in a uapi nightmare.
>=20
> To stop this gap require that DMA buffer mmaps are VM_PFNMAP, which
> blocks get_user_pages and all the other struct page based
> infrastructure for everyone. In spirit this is the uapi counterpart to
> the kernel-internal CONFIG_DMABUF_DEBUG.
>=20
> Motivated by a recent patch which wanted to swich the system dma-buf
> heap to vm_insert_page instead of vm_insert_pfn.
>=20
> v2:
>=20
> Jason brought up that we also want to guarantee that all ptes have the
> pte_special flag set, to catch fast get_user_pages (on architectures
> that support this). Allowing VM_MIXEDMAP (like VM_SPECIAL does) would
> still allow vm_insert_page, but limiting to VM_PFNMAP will catch that.
>=20
>  From auditing the various functions to insert pfn pte entires
> (vm_insert_pfn_prot, remap_pfn_range and all it's callers like
> dma_mmap_wc) it looks like VM_PFNMAP is already required anyway, so
> this should be the correct flag to check for.
>=20
> References: https://lore.kernel.org/lkml/CAKMK7uHi+mG0z0HUmNt13QCCvutuR=
VjpcR0NjRL12k-WbWzkRg@mail.gmail.com/
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> --
> Resending this so I can test the next two patches for vgem/shmem in
> intel-gfx-ci. Last round failed somehow, but I can't repro that at all
> locally here.
>=20
> No immediate plans to merge this patch here since ttm isn't addressed
> yet (and there we have the hugepte issue, for which I don't think we
> have a clear consensus yet).
> -Daniel
> ---
>   drivers/dma-buf/dma-buf.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 510b42771974..65cbd7f0f16a 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -130,6 +130,7 @@ static struct file_system_type dma_buf_fs_type =3D =
{
>   static int dma_buf_mmap_internal(struct file *file, struct vm_area_st=
ruct *vma)
>   {
>   	struct dma_buf *dmabuf;
> +	int ret;
>  =20
>   	if (!is_dma_buf_file(file))
>   		return -EINVAL;
> @@ -145,7 +146,11 @@ static int dma_buf_mmap_internal(struct file *file=
, struct vm_area_struct *vma)
>   	    dmabuf->size >> PAGE_SHIFT)
>   		return -EINVAL;
>  =20
> -	return dmabuf->ops->mmap(dmabuf, vma);
> +	ret =3D dmabuf->ops->mmap(dmabuf, vma);
> +
> +	WARN_ON(!(vma->vm_flags & VM_PFNMAP));

Maybe change this to WARN_ON_ONCE(), so it doesn't fill up the kernel=20
log. Same comment below.

For either version

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

> +
> +	return ret;
>   }
>  =20
>   static loff_t dma_buf_llseek(struct file *file, loff_t offset, int wh=
ence)
> @@ -1276,6 +1281,8 @@ EXPORT_SYMBOL_GPL(dma_buf_end_cpu_access);
>   int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>   		 unsigned long pgoff)
>   {
> +	int ret;
> +
>   	if (WARN_ON(!dmabuf || !vma))
>   		return -EINVAL;
>  =20
> @@ -1296,7 +1303,11 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct =
vm_area_struct *vma,
>   	vma_set_file(vma, dmabuf->file);
>   	vma->vm_pgoff =3D pgoff;
>  =20
> -	return dmabuf->ops->mmap(dmabuf, vma);
> +	ret =3D dmabuf->ops->mmap(dmabuf, vma);
> +
> +	WARN_ON(!(vma->vm_flags & VM_PFNMAP));
> +
> +	return ret;
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_mmap);
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--zafYGsYFjuaSkJcPUvI1cUhQDoYSPW7TS--

--U10chBrx1i8ohB3Hqy1rKySOCXBNq6D0t
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmD7DlwFAwAAAAAACgkQlh/E3EQov+DD
hhAAmElKhwlZMAlEVejk+rSZM6YvDwkUM8BU0yTnToLAtuaSFcMdVHhdAW4A9NjVO2oSKJd7/Ld2
IVL/NRGzU0Ze0J5tbI9Z2mQ+MIRp4djYLLDpVqH20k1IOtxRq1TsFexKcBOA4jiFcdwKtrigptsT
X+ormKmEbw1P8Nbx5+kZdmfK6S/KQt/zE0RyG11bYvb8TIeR8G0qpwdyNkI0eBLQlvAGDjRAv1gr
4rVkaw/Xyo8WhEP6WZHQCv0ro631kbQlxLn+e4wu1lxtx5ytei43pE+P4RXkq1mlldb+P7GYMEVw
YQCaqW961EqFH/dBa4jF/nmyM6Bg1i1TIcsczIen61CW6HcZH45w2WNBpLPdVLPcPJymlH8i55d6
k3Zy3aEkxprs3XHSh+YNTyVHtHMopjLGkX70cQO1bzJZcma1xv/uP7U8lxZOgosdToDpbwtLgA+9
6UYXNZ3C6eR2lLrpWDz0woVzYoj9io//WGgtmEwEHZmkaIxsD0P/CepK0wTVb0powmrAyYwMG15C
bAWSPj8UEiVMnOb4NgLr/oZaXuVjgaM5hmwyOG/RNrZKSyN8GZWO3ajcp6VSiwZoIML0UiRMQ4AH
FdQJuJJB/MhtTl2EXxVZ3ppJKEy7p4e3kRSuhYfRX/A4hO2eI+SAUxkkNE/+xuXJJjw+n8o2LmPs
b/0=
=zv29
-----END PGP SIGNATURE-----

--U10chBrx1i8ohB3Hqy1rKySOCXBNq6D0t--
