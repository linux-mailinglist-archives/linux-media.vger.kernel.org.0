Return-Path: <linux-media+bounces-24100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4709FCA7F
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 12:26:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30B101882F38
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 11:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F661D432F;
	Thu, 26 Dec 2024 11:26:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BA81CEE97;
	Thu, 26 Dec 2024 11:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735212402; cv=none; b=ii2y7PBP593Agb+CAiw6d6XRVzPkSHG6q1Xpe+LM231cGwBcf+4NdeKdNpPZEBkKnLmf5jAJDMMx4tuKzvdWCEIQL5xuNDhNsaA8RK32IrMF1rQWC3QCDqkI6cNZrM2VLd6y7ftA8X1xVWABhVJdrVH9O1sp5thEQvVdDDP7xFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735212402; c=relaxed/simple;
	bh=l2d9iiFp9yQIwq+9FuJBOu4w2gBJxorfZCr8o9X1RK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u7YRwCJjcFtTeboSRYNDw+ZULjO4p5reI9Gf11iEm0hS2N8xJOw5c/eArL8DA01G/a915FEttmiCArwBDwHr1rDhAeM3WsWIx9GuQON8IomgasT/IkTOQz5/ajBOMAHc4t4TSKgIJH1UOMV7hZT3yGyEixGzRB+MHTBnb7DPwlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=176.9.242.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 73F66100D9404;
	Thu, 26 Dec 2024 12:26:29 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 476F630F89E; Thu, 26 Dec 2024 12:26:29 +0100 (CET)
Date: Thu, 26 Dec 2024 12:26:29 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: simona.vetter@ffwll.ch, Jens Wiklander <jens.wiklander@linaro.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
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
	azarrabi@qti.qualcomm.com
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
Message-ID: <Z209ZegsmgN1xlNG@wunner.de>
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <Z2KsuAs-Dd4ZDaXR@phenom.ffwll.local>
 <CAFA6WYNVHu7_-bNAuTYBRBdoJwfk2VrW5M4aFVkb_UWQ=uxTvQ@mail.gmail.com>
 <Z2p-v-xjhzhPso6u@wunner.de>
 <CAFA6WYMEjT5EAG3AL8NpbET6L=M86LBgnhLnWirvDZg9cUUiuA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFA6WYMEjT5EAG3AL8NpbET6L=M86LBgnhLnWirvDZg9cUUiuA@mail.gmail.com>

On Thu, Dec 26, 2024 at 11:29:23AM +0530, Sumit Garg wrote:
> On Tue, 24 Dec 2024 at 14:58, Lukas Wunner <lukas@wunner.de> wrote:
> > However in the case of restricted memory, the situation is exactly
> > the opposite:  The kernel may *not* be able to access the data,
> > but the crypto accelerator can access it just fine.
> >
> > I did raise a concern about this to the maintainer, but to no avail:
> > https://lore.kernel.org/r/Z1Kym1-9ka8kGHrM@wunner.de/
> 
> Herbert's point is valid that there isn't any point for mapping
> restricted memory in the kernel virtual address space as any kernel
> access to that space can lead to platform specific hardware error
> scenarios. And for that reason we simply disallow dma_buf_mmap() and
> don't support dma_buf_vmap() for DMA-bufs holding TEE restricted
> memory.

The API for signature generation/verification (e.g. crypto_sig_sign(),
crypto_sig_verify()) no longer accepts scatterlists, only buffers in
virtual address space:

https://lore.kernel.org/all/ZIrnPcPj9Zbq51jK@gondor.apana.org.au/

Hence in order to use buffers in restricted memory for signature
generation/verification, you'd need to map them into virtual address
space first.

Thanks,

Lukas

