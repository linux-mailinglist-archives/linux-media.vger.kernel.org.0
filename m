Return-Path: <linux-media+bounces-29105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BB6A775CC
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 09:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58E4E188BE17
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 07:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4011E9B02;
	Tue,  1 Apr 2025 07:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8+R1PlS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA5A1519B8;
	Tue,  1 Apr 2025 07:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743494338; cv=none; b=Ss17pmMRswW/qSWn9lW+xQwN1Ryktx+yNef0OqCAYF2eqBSs4+gce2LF4a+OUumZSgiW0O1asopPGaCU8VUjJfqxC0jWoROfVfdhRdiv07NXjG4CUnaGSogVcc2I3njU0MFuy/PXV9t241QyH60/c4uSbmoCiTrQW/2cgA8BYY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743494338; c=relaxed/simple;
	bh=N0aOQujaXvl0WI/8gV+qMIDU5kNcN5JuX3zlJZZiu3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=svHccCans8V/Cy5eLTYSZKb1T/2Hunno8OzQLp6uQ1uURmjZMDFKUt06211n/H3Eo8graczAp8nS4U3j0vaJdY1Iq5WEU5z9hAxw2KLbG/LVeOsBOuMt8D7oip+JNUH/tKK6616horEgA2Yux4cpMMOx67gYPslsf7CXuy89qsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8+R1PlS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF80C4CEE4;
	Tue,  1 Apr 2025 07:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743494337;
	bh=N0aOQujaXvl0WI/8gV+qMIDU5kNcN5JuX3zlJZZiu3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C8+R1PlSU58+Xkj6v72qEazJhScUDulxNjdpNdBObwRkmx1nQQVyx5DoIXo0oDXb3
	 DUbsHsJPJ04TvJZlceBAPqq9QkTPIMKh6IXC6qu4nocokujzVQjpexdRqGk7SN3xtW
	 81U6DERoHeJJEis3pWXYwt6uB1lewwO0wBKmsch+n+GAlvVVPsYOZibwbkME2snpHp
	 B+tAAUbmMcabcKha4jynjvRH7/YzHnGvLZOrRTF1F/DAybYREdxkPiQavIgTOSuWhi
	 lzNTh+JMThlogM3oqTMYcy0mWZAlLmTlyTKBEX4y1GI9wd5LeqfCghwPaN/wN8SIeB
	 KutfL59NdHQ6g==
Date: Tue, 1 Apr 2025 13:28:48 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v6 05/10] tee: implement restricted DMA-heap
Message-ID: <Z-ucuPzwz4IqVTgb@sumit-X1>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-6-jens.wiklander@linaro.org>
 <Z-JOPgcWlpTlskgd@sumit-X1>
 <CAHUa44GjpHT5Nqo+Ar5jNYNPV-YJQYpLTCf=7oJ1o0VjP-t0nA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHUa44GjpHT5Nqo+Ar5jNYNPV-YJQYpLTCf=7oJ1o0VjP-t0nA@mail.gmail.com>

On Tue, Mar 25, 2025 at 11:55:46AM +0100, Jens Wiklander wrote:
> Hi Sumit,
> 

<snip>

> 
> >
> > > +
> > > +#include "tee_private.h"
> > > +
> > > +struct tee_dma_heap {
> > > +     struct dma_heap *heap;
> > > +     enum tee_dma_heap_id id;
> > > +     struct tee_rstmem_pool *pool;
> > > +     struct tee_device *teedev;
> > > +     /* Protects pool and teedev above */
> > > +     struct mutex mu;
> > > +};
> > > +
> > > +struct tee_heap_buffer {
> > > +     struct tee_rstmem_pool *pool;
> > > +     struct tee_device *teedev;
> > > +     size_t size;
> > > +     size_t offs;
> > > +     struct sg_table table;
> > > +};
> > > +
> > > +struct tee_heap_attachment {
> > > +     struct sg_table table;
> > > +     struct device *dev;
> > > +};
> > > +
> > > +struct tee_rstmem_static_pool {
> > > +     struct tee_rstmem_pool pool;
> > > +     struct gen_pool *gen_pool;
> > > +     phys_addr_t pa_base;
> > > +};
> > > +
> > > +#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_DMABUF_HEAPS)
> >
> > Can this dependency rather be better managed via Kconfig?
> 
> This was the easiest yet somewhat flexible solution I could find. If
> you have something better, let's use that instead.
>

--- a/drivers/tee/optee/Kconfig
+++ b/drivers/tee/optee/Kconfig
@@ -5,6 +5,7 @@ config OPTEE
        depends on HAVE_ARM_SMCCC
        depends on MMU
        depends on RPMB || !RPMB
+       select DMABUF_HEAPS
        help
          This implements the OP-TEE Trusted Execution Environment (TEE)
          driver.

-Sumit

