Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBFD41E86
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 10:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729880AbfFLIC0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 04:02:26 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44612 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbfFLIC0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 04:02:26 -0400
Received: by mail-pg1-f193.google.com with SMTP id n2so8470581pgp.11;
        Wed, 12 Jun 2019 01:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SXiUTg8P9kKRgYZobjR73yxrvyBI+QR3gHSn3xV2sNk=;
        b=P9M1dR9nnALM0dwbM3XxQXTmmeCHWxxCR3IdHx6vDUqJrBbj3MJw+iS5S5/t9RDNy8
         VXM0Wep6hlSbFgGcCd4t1g+rTd06lxmB90ehFdzKpl/nfPQkkJaaLXID0bb++uh5ZRWb
         4f+eIAuGIQnSryRWwgi45NBtdSPkdKegHBuGbZYbDgDdACaI3HsmF2yZ1mkdDte/HPTn
         MA7CPzCi+udHsV8KE61Vy23DzLpjmpJlkHiXrnQzduJsR8hnjOL988mxO+N43knNyH4j
         MEQOEY/QXxjH4Gk8+6G3M0peyt8kYn4YW85dLcb2p55BwVIImhoBA+TvMkPFoCTVvEj/
         pTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SXiUTg8P9kKRgYZobjR73yxrvyBI+QR3gHSn3xV2sNk=;
        b=GxLjlLMYgpOA6Qz6FurumSFs4IUd923W9E8xGHu69CIOOKIE9ejvJof+1LFTds7eXh
         GpiYerZ8E/mS3oTgyLsVQmJGRKZ8edIZsFGEXiPhHwyLEdL9DChXYGSs2zKdH3fFL/fT
         tFfJ0+ML/fkgehd/kaUmMYiia7pnKt5QY/QC06WEUf2Ykoiws69zTuseMd76coqTFgaS
         We7xjZ5eCOHc514qmBNVfrfAeNlLmumybEYxE99M0Wc4QHwBwck72a9llxjlOFIRnoDj
         Ih6EWR23c9lUB+37SnNkrm99dBSFxMVn7WM3P/BV0ZNnLHqMRNlv0+LzZzSJs7Vz0Ixp
         ianw==
X-Gm-Message-State: APjAAAVJ0xNatyYpSGQ7EjMJfabqSzfqoYnr4GR5P0MLHEew8bcXb+SN
        o2lY+x3NfzgUu9Smez4aYZTt0M2d
X-Google-Smtp-Source: APXvYqyXLoIbAePeHwNO0OOIUhplzQIrUNiANS5SrI0lvbzh0NuVJupyWFCAT364ZRU/Gs+muPfmOQ==
X-Received: by 2002:aa7:972a:: with SMTP id k10mr52413613pfg.116.1560326545252;
        Wed, 12 Jun 2019 01:02:25 -0700 (PDT)
Received: from Asurada (c-98-248-47-108.hsd1.ca.comcast.net. [98.248.47.108])
        by smtp.gmail.com with ESMTPSA id w62sm18263465pfw.132.2019.06.12.01.02.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 01:02:25 -0700 (PDT)
Date:   Wed, 12 Jun 2019 01:02:14 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     "Koenig, Christian" <Christian.Koenig@amd.com>
Cc:     "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] dma-buf: refcount the attachment for cache_sgt_mapping
Message-ID: <20190612080214.GA8876@Asurada>
References: <20190612012219.21652-1-nicoleotsuka@gmail.com>
 <261b46c7-0c5e-4268-619d-f8381fbc3aeb@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <261b46c7-0c5e-4268-619d-f8381fbc3aeb@amd.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christian,

Thanks for the quick reply.

On Wed, Jun 12, 2019 at 07:45:38AM +0000, Koenig, Christian wrote:
> Am 12.06.19 um 03:22 schrieb Nicolin Chen:
> > Commit f13e143e7444 ("dma-buf: start caching of sg_table objects v2")
> > added a support of caching the sgt pointer into an attach pointer to
> > let users reuse the sgt pointer without another mapping. However, it
> > might not totally work as most of dma-buf callers are doing attach()
> > and map_attachment() back-to-back, using drm_prime.c for example:
> >      drm_gem_prime_import_dev() {
> >          attach = dma_buf_attach() {
> >              /* Allocating a new attach */
> >              attach = kzalloc();
> >              /* .... */
> >              return attach;
> >          }
> >          dma_buf_map_attachment(attach, direction) {
> >              /* attach->sgt would be always empty as attach is new */
> >              if (attach->sgt) {
> >                  /* Reuse attach->sgt */
> >              }
> >              /* Otherwise, map it */
> >              attach->sgt = map();
> >          }
> >      }
> >
> > So, for a cache_sgt_mapping use case, it would need to get the same
> > attachment pointer in order to reuse its sgt pointer. So this patch
> > adds a refcount to the attach() function and lets it search for the
> > existing attach pointer by matching the dev pointer.
> 
> I don't think that this is a good idea.
> 
> We use sgt caching as workaround for locking order problems and want to 
> remove it again in the long term.

Oh. I thought it was for a performance improving purpose. It may
be a misunderstanding then.

> So what is the actual use case of this?

We have some similar downstream changes at dma_buf to reduce the
overhead from multiple clients of the same device doing attach()
and map_attachment() calls for the same dma_buf.

We haven't used DRM/GRM_PRIME yet but I am also curious would it
benefit DRM also if we reduce this overhead in the dma_buf?

Thanks
Nicolin
