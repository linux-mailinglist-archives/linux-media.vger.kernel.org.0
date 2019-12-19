Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2E81125AC2
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 06:28:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbfLSF1z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 00:27:55 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44966 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbfLSF1z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 00:27:55 -0500
Received: by mail-ot1-f68.google.com with SMTP id h9so3038044otj.11
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2019 21:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YiNT2OwN1PC5xiClJXvmIxtU8FKdWcajydHQPOKowMQ=;
        b=dqorifJ4f+v2Gylbu8oAiFDcKa1F8skIpz6V3IgWOqRB33n7U59EJyePbqvuTj6Vy4
         uOPeG7Kob1GhJUtITzia2N5iO6b+FgQt0PfBLv1SShdXtnPTkzPXC4wv8NlfHewxSVCr
         BWaS5xgO+C3htMgxe5c7ubvEmgYEe4TsZt+Zn5XRlxBQhxFahwlW/Mo0S+TgOXqQ/47k
         mtfOMZwImte59GAX6ig1VEn2mK8lUBxmhPPLTpVmIFFbH4EVvah9nw+1Oh0aFp9cBJiW
         sz8ohgGLCmoNne0NYqks6igeYI3pnrq7++p4oBryH4HFQcsawtXKY12nyEVckq37Q8q+
         63BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YiNT2OwN1PC5xiClJXvmIxtU8FKdWcajydHQPOKowMQ=;
        b=FEOzYlau+ZPxt11GCyF2ctLdwdXMoz8DQ7cbcfwdE9Hrz3kjLbLZ0FH97QpOsQI44a
         BTnegWvcj3daaNRNDnPsmhwWajYKOM+X6xak9e0D1n+eo9tR6rKgPEvxMMyYVS902ypx
         jKkKdrAorJfPe7qqdDCzSc+qEu4yhWtTIe8YLq7fo0PPbmklupajKmk688dn3PQQn52d
         d+Vu5yZJn3I7cyMfxQ6pLFoaYAicduwgCMhu+qJ1M07ByhvU7pESi1UVKpzr7DFW1u1W
         fsR89t4dWsU7whOIVl8O1Hen5ZtjckjjYapFxtHH9a5I/KYNKO/lev6imZFeOzZiGXKw
         h/cQ==
X-Gm-Message-State: APjAAAVJ5Zllt/554Su33LtWNvOrfdg7cD3N/Xa/fWTGSb3BseI5+ZVS
        Ru0nckNHw2okEd1Sq3BbHEDXmQpSQIjJ5dL6LCcRww==
X-Google-Smtp-Source: APXvYqzIho60C4tgIgH4FPSEG3bP2Gra7VUCaG88r8S6eX3efYPsOK7esN+4WGhr8L+TiHfEgJwBcHps0ms7QGyGe6Y=
X-Received: by 2002:a05:6830:1744:: with SMTP id 4mr6583360otz.71.1576733274234;
 Wed, 18 Dec 2019 21:27:54 -0800 (PST)
MIME-Version: 1.0
References: <20191216222537.491123-1-jhubbard@nvidia.com> <20191216222537.491123-5-jhubbard@nvidia.com>
In-Reply-To: <20191216222537.491123-5-jhubbard@nvidia.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 18 Dec 2019 21:27:43 -0800
Message-ID: <CAPcyv4hQBMxYMurxG=Vwh0=FKWoT3z-Kf=dqES1-icRV5bLwKg@mail.gmail.com>
Subject: Re: [PATCH v11 04/25] mm: devmap: refactor 1-based refcounting for
 ZONE_DEVICE pages
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Alex Williamson <alex.williamson@redhat.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        Christoph Hellwig <hch@infradead.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Chinner <david@fromorbit.com>,
        David Airlie <airlied@linux.ie>,
        "David S . Miller" <davem@davemloft.net>,
        Ira Weiny <ira.weiny@intel.com>, Jan Kara <jack@suse.cz>,
        Jason Gunthorpe <jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Magnus Karlsson <magnus.karlsson@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Hocko <mhocko@suse.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Paul Mackerras <paulus@samba.org>,
        Shuah Khan <shuah@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, bpf@vger.kernel.org,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, KVM list <kvm@vger.kernel.org>,
        linux-block@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-kselftest@vger.kernel.org,
        "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Netdev <netdev@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Dec 16, 2019 at 2:26 PM John Hubbard <jhubbard@nvidia.com> wrote:
>
> An upcoming patch changes and complicates the refcounting and
> especially the "put page" aspects of it. In order to keep
> everything clean, refactor the devmap page release routines:
>
> * Rename put_devmap_managed_page() to page_is_devmap_managed(),
>   and limit the functionality to "read only": return a bool,
>   with no side effects.
>
> * Add a new routine, put_devmap_managed_page(), to handle checking
>   what kind of page it is, and what kind of refcount handling it
>   requires.
>
> * Rename __put_devmap_managed_page() to free_devmap_managed_page(),
>   and limit the functionality to unconditionally freeing a devmap
>   page.
>
> This is originally based on a separate patch by Ira Weiny, which
> applied to an early version of the put_user_page() experiments.
> Since then, J=C3=A9r=C3=B4me Glisse suggested the refactoring described a=
bove.
>
> Cc: Christoph Hellwig <hch@lst.de>
> Suggested-by: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> Reviewed-by: Jan Kara <jack@suse.cz>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  include/linux/mm.h | 17 +++++++++++++----
>  mm/memremap.c      | 16 ++--------------
>  mm/swap.c          | 24 ++++++++++++++++++++++++
>  3 files changed, 39 insertions(+), 18 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index c97ea3b694e6..77a4df06c8a7 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -952,9 +952,10 @@ static inline bool is_zone_device_page(const struct =
page *page)
>  #endif
>
>  #ifdef CONFIG_DEV_PAGEMAP_OPS
> -void __put_devmap_managed_page(struct page *page);
> +void free_devmap_managed_page(struct page *page);
>  DECLARE_STATIC_KEY_FALSE(devmap_managed_key);
> -static inline bool put_devmap_managed_page(struct page *page)
> +
> +static inline bool page_is_devmap_managed(struct page *page)
>  {
>         if (!static_branch_unlikely(&devmap_managed_key))
>                 return false;
> @@ -963,7 +964,6 @@ static inline bool put_devmap_managed_page(struct pag=
e *page)
>         switch (page->pgmap->type) {
>         case MEMORY_DEVICE_PRIVATE:
>         case MEMORY_DEVICE_FS_DAX:
> -               __put_devmap_managed_page(page);
>                 return true;
>         default:
>                 break;
> @@ -971,7 +971,14 @@ static inline bool put_devmap_managed_page(struct pa=
ge *page)
>         return false;
>  }
>
> +bool put_devmap_managed_page(struct page *page);
> +
>  #else /* CONFIG_DEV_PAGEMAP_OPS */
> +static inline bool page_is_devmap_managed(struct page *page)
> +{
> +       return false;
> +}
> +
>  static inline bool put_devmap_managed_page(struct page *page)
>  {
>         return false;
> @@ -1028,8 +1035,10 @@ static inline void put_page(struct page *page)
>          * need to inform the device driver through callback. See
>          * include/linux/memremap.h and HMM for details.
>          */
> -       if (put_devmap_managed_page(page))
> +       if (page_is_devmap_managed(page)) {
> +               put_devmap_managed_page(page);
>                 return;
> +       }
>
>         if (put_page_testzero(page))
>                 __put_page(page);
> diff --git a/mm/memremap.c b/mm/memremap.c
> index e899fa876a62..2ba773859031 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -411,20 +411,8 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pf=
n,
>  EXPORT_SYMBOL_GPL(get_dev_pagemap);
>
>  #ifdef CONFIG_DEV_PAGEMAP_OPS
> -void __put_devmap_managed_page(struct page *page)
> +void free_devmap_managed_page(struct page *page)
>  {
> -       int count =3D page_ref_dec_return(page);
> -
> -       /* still busy */
> -       if (count > 1)
> -               return;
> -
> -       /* only triggered by the dev_pagemap shutdown path */
> -       if (count =3D=3D 0) {
> -               __put_page(page);
> -               return;
> -       }
> -
>         /* notify page idle for dax */
>         if (!is_device_private_page(page)) {
>                 wake_up_var(&page->_refcount);
> @@ -461,5 +449,5 @@ void __put_devmap_managed_page(struct page *page)
>         page->mapping =3D NULL;
>         page->pgmap->ops->page_free(page);
>  }
> -EXPORT_SYMBOL(__put_devmap_managed_page);
> +EXPORT_SYMBOL(free_devmap_managed_page);

This patch does not have a module consumer for
free_devmap_managed_page(), so the export should move to the patch
that needs the new export.

Also the only reason that put_devmap_managed_page() is EXPORT_SYMBOL
instead of EXPORT_SYMBOL_GPL is that there was no practical way to
hide the devmap details from evey module in the kernel that did
put_page(). I would expect free_devmap_managed_page() to
EXPORT_SYMBOL_GPL if it is not inlined into an existing exported
static inline api.
