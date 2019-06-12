Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80F8041ED0
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 10:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436839AbfFLIQE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 04:16:04 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35855 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730638AbfFLIQE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 04:16:04 -0400
Received: by mail-pg1-f193.google.com with SMTP id f21so2489937pgi.3;
        Wed, 12 Jun 2019 01:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=l4AptQ/lp/40HceSKPfzGNYkbh2nIq8GF58tsuXwpVM=;
        b=h9aaMqXO9mqsSq6/NERYGEDB3ZRdlE7WRXesAHzRiGrGWxIWLuIu0wx+0IQ5W6tYkd
         X/N/DRdjcE7yMQJBlIeKxq3RzqszGF17TC8kDoY/ODFFxA/Ma1iGRRQsAD2sap8VWoy5
         1LWrmN7Vg2evNc7g9EXfrBmiTXWyyou1AJMq6rutcmKGzCeW2E02spIlgEvmDzg9RNGb
         tTQ3hNJif6eSfnx2SgyzENLn5Ck1SvGlXQS+SrSxRxfEs6U+ntYBQ1HqkzXI/KS1FfDz
         82D+Exkuxp/+JOeUSuwWW7DEJZrDSHHFFwCNyirD1ithDHDdP0k0HqMRf3tmT9pkuCp/
         jzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=l4AptQ/lp/40HceSKPfzGNYkbh2nIq8GF58tsuXwpVM=;
        b=VTnK4U3W+fc1p66ugi8STQB0gmq0luYEIngcHld2DaPYqaChbWziAjAS8PAQNz5Ib0
         y6wlRxV87I5LZN9VeJiYwVEjCZjRCkTFYZCf5mZjoReEneu5BIRCNPGf4riyftElv0kG
         /h3ZgVGlDt7vJ1AYLhHrBb5LEkWtaSbpHWZM4MLy/5YlhcN8UOkTqRAfjwT1WrVIC97t
         0vW89O7yUdnP7AHgrFwKWN68iGC/R3XC3e+F9ESK9mWddIrlO9kLXJ5PwlW11dSwIBW+
         6ils0LSggJ3K0cvkxI0bnAK8g4TKVKmm8F5IBB0HTLJWbgWp3PiPoVyZQWriSW3/0lkQ
         N/Qg==
X-Gm-Message-State: APjAAAUCDhPvLLqq42LeAUtjVQNZmaeE08VVBTY0LhxlXuZf8Z7T5lEo
        vG3MxcAsOSnyMQHygWOSgzY=
X-Google-Smtp-Source: APXvYqyHNMtcfEGWDtb5uxEj3HmmDu4AqP01gbIb1yLs8zGnDR9CaSVWAjn+4niP8Ae6MJ3PWyv7AQ==
X-Received: by 2002:a65:4806:: with SMTP id h6mr23286286pgs.299.1560327363279;
        Wed, 12 Jun 2019 01:16:03 -0700 (PDT)
Received: from Asurada (c-98-248-47-108.hsd1.ca.comcast.net. [98.248.47.108])
        by smtp.gmail.com with ESMTPSA id d5sm18174050pfn.25.2019.06.12.01.16.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 01:16:03 -0700 (PDT)
Date:   Wed, 12 Jun 2019 01:15:54 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     "Koenig, Christian" <Christian.Koenig@amd.com>
Cc:     "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] dma-buf: refcount the attachment for cache_sgt_mapping
Message-ID: <20190612081554.GB8876@Asurada>
References: <20190612012219.21652-1-nicoleotsuka@gmail.com>
 <261b46c7-0c5e-4268-619d-f8381fbc3aeb@amd.com>
 <20190612080214.GA8876@Asurada>
 <170c3828-115b-38e5-35fc-1b88c08c492a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170c3828-115b-38e5-35fc-1b88c08c492a@amd.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christian,

On Wed, Jun 12, 2019 at 08:05:53AM +0000, Koenig, Christian wrote:
> Am 12.06.19 um 10:02 schrieb Nicolin Chen:
> > Hi Christian,
> >
> > Thanks for the quick reply.
> >
> > On Wed, Jun 12, 2019 at 07:45:38AM +0000, Koenig, Christian wrote:
> >> Am 12.06.19 um 03:22 schrieb Nicolin Chen:
> >>> Commit f13e143e7444 ("dma-buf: start caching of sg_table objects v2")
> >>> added a support of caching the sgt pointer into an attach pointer to
> >>> let users reuse the sgt pointer without another mapping. However, it
> >>> might not totally work as most of dma-buf callers are doing attach()
> >>> and map_attachment() back-to-back, using drm_prime.c for example:
> >>>       drm_gem_prime_import_dev() {
> >>>           attach = dma_buf_attach() {
> >>>               /* Allocating a new attach */
> >>>               attach = kzalloc();
> >>>               /* .... */
> >>>               return attach;
> >>>           }
> >>>           dma_buf_map_attachment(attach, direction) {
> >>>               /* attach->sgt would be always empty as attach is new */
> >>>               if (attach->sgt) {
> >>>                   /* Reuse attach->sgt */
> >>>               }
> >>>               /* Otherwise, map it */
> >>>               attach->sgt = map();
> >>>           }
> >>>       }
> >>>
> >>> So, for a cache_sgt_mapping use case, it would need to get the same
> >>> attachment pointer in order to reuse its sgt pointer. So this patch
> >>> adds a refcount to the attach() function and lets it search for the
> >>> existing attach pointer by matching the dev pointer.
> >> I don't think that this is a good idea.
> >>
> >> We use sgt caching as workaround for locking order problems and want to
> >> remove it again in the long term.
> > Oh. I thought it was for a performance improving purpose. It may
> > be a misunderstanding then.
> >
> >> So what is the actual use case of this?
> > We have some similar downstream changes at dma_buf to reduce the
> > overhead from multiple clients of the same device doing attach()
> > and map_attachment() calls for the same dma_buf.
> 
> I don't think that this is a good idea over all. A driver calling attach 
> for the same buffer is doing something wrong in the first place and we 
> should not work around this in the DMA-buf handling.
> 
> > We haven't used DRM/GRM_PRIME yet but I am also curious would it
> > benefit DRM also if we reduce this overhead in the dma_buf?
> 
> No, not at all.

From you replies, in a summary, does it means that there won't be a case
of DRM having a dma_buf attaching to the same device, i.e. multiple calls
of drm_gem_prime_import() function with same parameters of dev + dma_buf?

If so, we can just ignore/drop this patch. Sorry for the misunderstanding.

Thanks
Nicolin
