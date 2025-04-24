Return-Path: <linux-media+bounces-30957-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B617A9B38A
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 18:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56F401711BD
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 16:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC377280A37;
	Thu, 24 Apr 2025 16:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OgKHJI9H"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6500C27FD48
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 16:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745511095; cv=none; b=Xipdd7VoXw5OFb+m5wPi5iiWHJGlWGu6kOFHuh31Z2ywa5wPwjQ9UULIAm/rxGWS+VGrz9pele/TzDWXSUx6ZSZBugVXgRP/Srf2jrpX6wTsM/U0uoZBe5mNkzICYlV4rGJmq32LR9cnWK+2aENg2L8ByIb/ZFh4ghho/eCnRCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745511095; c=relaxed/simple;
	bh=NdkqoKf1d1JEdx5XewadhXF1HsV4BHe8OdRH9zZMPSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjANU0zvRqIpQH58eDhFE18NU7aZtjc+ITbKJCDBGexkkEjvGG7EXhE4c2PuQ/bXmc2yW6Md6NVsSXFkNzJHx8ccx0z5Ck1z2aTqOyZj1DmsXpgyuiAlnMqIvkM9BnOjL8E2BQEeBCloun6VGM4kMg8xzc1ko6joH2HQFPgcCU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OgKHJI9H; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745511091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8xsE74yKYPMH+2VlPy+Ra90/yb4WgqS6fEIO1+kVqG4=;
	b=OgKHJI9H5noil+8helMA03ido6cCbv25EiwCG3mZZ+PezcV5yzlKIMUoP5qA0iceUuYDJ5
	kVC2izdt58zIxYUcif9Pc5I+VTZxAOXS1aKsFPzMj3xzzfRX+2jiuqAkyOiShQubT+Qz9r
	unLMuQSo4f4+Dzz+FrCSy42cA7KdUfs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-w-8pyTgHOxm4hqPkNy5KZw-1; Thu, 24 Apr 2025 12:11:29 -0400
X-MC-Unique: w-8pyTgHOxm4hqPkNy5KZw-1
X-Mimecast-MFC-AGG-ID: w-8pyTgHOxm4hqPkNy5KZw_1745511089
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8ed78717eso19221896d6.2
        for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 09:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745511089; x=1746115889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xsE74yKYPMH+2VlPy+Ra90/yb4WgqS6fEIO1+kVqG4=;
        b=Z9bFjn8SYHlisOXFuZUpKRHT9z3bDoyvsnWe+VjY+FZ+HTwjGl0q9H3nXph3zAXvou
         5gBs+caSFeBDeg/EUoFG0k22NeXSphhBotkgBn9CWkrajf2U01COeqHIkTGS8OyN/vNC
         OA3Vks3dp1o22De6PlLJATizLdUQTeReAakMBoF9anKeGSugVPg/KHJR5c3EMemQcWLD
         99KaYVQy8WaFaLq7iL9fs08xABXllc20YnOW/n2bW181EYC2Ibrv4fGgz8P7bES2U3G5
         qhvQSUBkzplugNt0TrFAwB/TJ7+3oj/Ujw2pXNZw17haD7+XP0Lf26BlB+IEUgRYDrb+
         pJaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1hUNEViRvUZFjWBS4RjqaY+p7lM0KMVrD3+QWNZ5eumWI2gbnZa732e1jzdA9zl0bRtAr42sLXfDuLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqXxsGDT4cN1XzzoQPm+/9IQ2SDGyyw0Q3KnMzXtjjcDpAIDc6
	aw6YnJNO2ay9K3ijYoa0DHcr3VtTl0aE4JXFbprYNeFF8gb/FEe4xbAaHPigVQG81goz8DeAzpd
	urzxfrmrlsFFrjWEehyTygBQ6zu3ztZ9SRVphBHwfqzo5caTisaDt18arv6uC
X-Gm-Gg: ASbGncsLH+emvSxE+Abjc3qeHWI8bhUvVSimJWVx2ZL4KltvNChQHp6FbZTBnxOhZSe
	cGfgtudlGj5fxMqSVnmpJwk1KoHmQLEPkdw3F20lH60b00moXSSv5q4mUjuN708VrFGL72IBxko
	MDjCwrnevYl+pdKnvsiHuIFfFGiqJmyelopTJw699NqevW/rEEFLhXo4okZ4u0MVuqhM0pfQawQ
	T5cLbVeHmT2bOxMZBq78NZaAs1TY65EVe7CWM47/vGpuRDfRpVb5jGbm+gioq0fZbUpvlUiffAE
	9wSz7HEcc8Mv2fWnFG25+KdIOg2XR9xl0S2vOVpFN2k=
X-Received: by 2002:a05:6214:2b56:b0:6f4:c824:9d4a with SMTP id 6a1803df08f44-6f4c824a12emr9235796d6.13.1745511088977;
        Thu, 24 Apr 2025 09:11:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpF/KPHX3XupnXyOW//4CbII7OI3Fx0Pl8hvYFBhQZabQLo2Ocev5iqYKgDBjH6eF1US/txw==
X-Received: by 2002:a05:6214:2b56:b0:6f4:c824:9d4a with SMTP id 6a1803df08f44-6f4c824a12emr9235276d6.13.1745511088411;
        Thu, 24 Apr 2025 09:11:28 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0aaf5e9sm10784096d6.99.2025.04.24.09.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:11:28 -0700 (PDT)
Date: Thu, 24 Apr 2025 09:11:24 -0700
From: Jared Kangas <jkangas@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
	christian.koenig@amd.com, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Give default CMA heap a fixed name
Message-ID: <aApirJb9P-LOOB8j@jkangas-thinkpadp1gen3.rmtuswa.csb>
References: <20250422191939.555963-1-jkangas@redhat.com>
 <20250422191939.555963-3-jkangas@redhat.com>
 <20250424-sassy-cunning-pillbug-ffde51@houat>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-sassy-cunning-pillbug-ffde51@houat>

Hi Maxime,

On Thu, Apr 24, 2025 at 10:33:58AM +0200, Maxime Ripard wrote:
> Hi Jared,
> 
> Thanks for working on this
> 
> On Tue, Apr 22, 2025 at 12:19:39PM -0700, Jared Kangas wrote:
> > The CMA heap's name in devtmpfs can vary depending on how the heap is
> > defined. Its name defaults to "reserved", but if a CMA area is defined
> > in the devicetree, the heap takes on the devicetree node's name, such as
> > "default-pool" or "linux,cma". To simplify naming, just name it
> > "default_cma", and keep a legacy node in place backed by the same
> > underlying structure for backwards compatibility.
> > 
> > Signed-off-by: Jared Kangas <jkangas@redhat.com>
> > ---
> >  Documentation/userspace-api/dma-buf-heaps.rst | 11 +++++++----
> >  drivers/dma-buf/heaps/Kconfig                 | 10 ++++++++++
> >  drivers/dma-buf/heaps/cma_heap.c              | 14 +++++++++++++-
> >  3 files changed, 30 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
> > index 535f49047ce64..577de813ba461 100644
> > --- a/Documentation/userspace-api/dma-buf-heaps.rst
> > +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> > @@ -19,7 +19,10 @@ following heaps:
> >   - The ``cma`` heap allocates physically contiguous, cacheable,
> >     buffers. Only present if a CMA region is present. Such a region is
> >     usually created either through the kernel commandline through the
> > -   `cma` parameter, a memory region Device-Tree node with the
> > -   `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` or
> > -   `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
> > -   might be called ``reserved``, ``linux,cma``, or ``default-pool``.
> > +   ``cma`` parameter, a memory region Device-Tree node with the
> > +   ``linux,cma-default`` property set, or through the ``CMA_SIZE_MBYTES`` or
> > +   ``CMA_SIZE_PERCENTAGE`` Kconfig options. The heap's name in devtmpfs is
> > +   ``default_cma``. For backwards compatibility, when the
> > +   ``DMABUF_HEAPS_CMA_LEGACY`` Kconfig option is set, a duplicate node is
> > +   created following legacy naming conventions; the legacy name might be
> > +   ``reserved``, ``linux,cma``, or ``default-pool``.
> 
> It looks like, in addition to documenting the new naming, you also
> changed all the backticks to double backticks. Why did you do so? It
> seems mostly unrelated to that patch, so it would be better in a
> separate patch.

Ah, I thought that since it was touching the immediate area and it's a
small fix it would be suitable for this patch. Thanks for the catch,
I'll extract this in v3.

As for the rationale: as I understand it, the single backticks here are
semantically incorrect, at least in general reST -- they're mainly used
for links and roles. In this instance, the syntax is interpreted as the
default role:

    https://docutils.sourceforge.io/docs/ref/rst/roles.html

I believe double backticks are what the doc is looking for here, used
for code and rendered as monospaced text. Although there are a number of
places around existing documentation that use single backticks (which
happens to render as italics because the default role is
:title-reference: if not configured in conf.py), a look through doc
history points to double backticks being treated as correct for code,
such as f6314b76d826 ("docs: kbuild/kconfig: reformat/cleanup") or
2f0e2a39bbab ("docs/kbuild/makefiles: unify quoting").

> 
> > diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
> > index a5eef06c42264..83f3770fa820a 100644
> > --- a/drivers/dma-buf/heaps/Kconfig
> > +++ b/drivers/dma-buf/heaps/Kconfig
> > @@ -12,3 +12,13 @@ config DMABUF_HEAPS_CMA
> >  	  Choose this option to enable dma-buf CMA heap. This heap is backed
> >  	  by the Contiguous Memory Allocator (CMA). If your system has these
> >  	  regions, you should say Y here.
> > +
> > +config DMABUF_HEAPS_CMA_LEGACY
> > +	bool "DMA-BUF CMA Heap"
> > +	default y
> > +	depends on DMABUF_HEAPS_CMA
> > +	help
> > +	  Add a duplicate CMA-backed dma-buf heap with legacy naming derived
> > +	  from the CMA area's devicetree node, or "reserved" if the area is not
> > +	  defined in the devicetree. This uses the same underlying allocator as
> > +	  CONFIG_DMABUF_HEAPS_CMA.
> > diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> > index e998d8ccd1dc6..cd742c961190d 100644
> > --- a/drivers/dma-buf/heaps/cma_heap.c
> > +++ b/drivers/dma-buf/heaps/cma_heap.c
> > @@ -22,6 +22,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/vmalloc.h>
> >  
> > +#define DEFAULT_CMA_NAME "default_cma"
> 
> I appreciate this is kind of bikeshed-color territory, but I think "cma"
> would be a better option here. There's nothing "default" about it.

I'm a little uncertain about plain "cma"; John mentioned the possibility
of other CMA regions, suggesting that if we used "cma", we'd need to
rename it again in the future to disambiguate. It doesn't sound
guaranteed that other regions will be added, so I can see starting with
"cma" and adjusting later if needed, but "default_cma" seemed
inoffensive enough because it's consistent with current wording (e.g.,
"linux,cma-default", "default-pool"), and has a lower chance of changing
if other CMA regions/heaps were added. Let me know what you think.

> 
> >  struct cma_heap {
> >  	struct dma_heap *heap;
> > @@ -394,15 +395,26 @@ static int __init __add_cma_heap(struct cma *cma, const char *name)
> >  static int __init add_default_cma_heap(void)
> >  {
> >  	struct cma *default_cma = dev_get_cma_area(NULL);
> > +	const char *legacy_cma_name;
> >  	int ret;
> >  
> >  	if (!default_cma)
> >  		return 0;
> >  
> > -	ret = __add_cma_heap(default_cma, cma_get_name(default_cma));
> > +	ret = __add_cma_heap(default_cma, DEFAULT_CMA_NAME);
> >  	if (ret)
> >  		return ret;
> >  
> > +	legacy_cma_name = cma_get_name(default_cma);
> > +
> > +	if (IS_ENABLED(CONFIG_DMABUF_HEAPS_CMA_LEGACY) &&
> > +	    strcmp(legacy_cma_name, DEFAULT_CMA_NAME)) {
> > +		ret = __add_cma_heap(default_cma, legacy_cma_name);
> > +		if (ret)
> > +			pr_warn("cma_heap: failed to add legacy heap: %pe\n",
> > +				ERR_PTR(-ret));
> > +	}
> > +
> 
> It would also simplify this part, since you would always create the legacy heap.

By "always", do you mean removing the strcmp? I added this to guard
against cases where the devicetree node's name clashed with the default
name, given that the DT name isn't necessarily restricted to one of the
current names in use ("linux,cma" or "default-pool"). It seems like the
strcmp would be relevant regardless of the naming choice, but if this is
overly cautious, I can remove it in v3.

Jared

> 
> Maxime



