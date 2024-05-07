Return-Path: <linux-media+bounces-11099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C22C88BEB99
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 20:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BB1B281AA0
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 18:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4B716D9A0;
	Tue,  7 May 2024 18:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JNScMGGU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B064C8A;
	Tue,  7 May 2024 18:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715107262; cv=none; b=V2Z1F8XrSRUtGkq36ZJc8w4UIUswPdMPXwe6QVuHg2wQykiu/skpqUOjdO7xPEPwDF6hQ83hoe/0KpZ8LUOKM+5jBUAjVEoshf6U0AM88GaXCoztoAD+3FXQGeC6+KIKDaiDnVFqIxsxB1u2Xtj2tKSCj8Kew9Yh2VZjKdnEODU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715107262; c=relaxed/simple;
	bh=p/IcQ+0/ki9c8UCWMn4TWKcFEbdzwdDYzo4liTtC+UQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkdXQAkiOPGqCM4b4moBk6726jlD41IVbUOuLSesT8cWRMvunBvdmwwiK4gxUK8WF1135JW/9p3vrQF33WzEtaCOjo+ls1LyocADA64nCBxX4+VjgMZopHuSge085OSoI99AXySK1BdPyWuU6wB0RsAx372Au8jhR8CKfXEBdU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JNScMGGU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CAD6DFB;
	Tue,  7 May 2024 20:40:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715107255;
	bh=p/IcQ+0/ki9c8UCWMn4TWKcFEbdzwdDYzo4liTtC+UQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JNScMGGUJG2sgxS4xzdnjIukoaTm8RZYSIgz/Z5KYcogo+BSxUuAHo7wZ2NMnBOpM
	 eukL/PAEpt7XhyDnZ9FleFCwIM9lNk4nfeaTOPb9VJWokA5AXu1z1IqtlQcqjW0eGd
	 d1LOymbOTEeLfLCAYecjZXXCzuAYBYIDyBol0rGs=
Date: Tue, 7 May 2024 21:40:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Lennart Poettering <mzxreary@0pointer.de>,
	Robert Mader <robert.mader@collabora.com>,
	Sebastien Bacher <sebastien.bacher@canonical.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	linaro-mm-sig@lists.linaro.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Milan Zamazal <mzamazal@redhat.com>,
	Maxime Ripard <mripard@redhat.com>,
	Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <20240507184049.GC20390@pendragon.ideasonboard.com>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <ojduxo54lpcbfg2wfuhqhy7k3phncamtklh65z7gvttcwztmhk@zkifewcy4ovi>
 <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
 <e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
 <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
 <CAA8EJpr4bJUQt2T63_FZ=KHGEm4vixfpk3pMV9naABEONJfMmQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAA8EJpr4bJUQt2T63_FZ=KHGEm4vixfpk3pMV9naABEONJfMmQ@mail.gmail.com>

On Tue, May 07, 2024 at 06:19:18PM +0300, Dmitry Baryshkov wrote:
> On Tue, 7 May 2024 at 18:15, Bryan O'Donoghue wrote:
> > On 07/05/2024 16:09, Dmitry Baryshkov wrote:
> > > Ah, I see. Then why do you require the DMA-ble buffer at all? If you are
> > > providing data to VPU or DRM, then you should be able to get the buffer
> > > from the data-consuming device.
> >
> > Because we don't necessarily know what the consuming device is, if any.
> >
> > Could be VPU, could be Zoom/Hangouts via pipewire, could for argument
> > sake be GPU or DSP.
> >
> > Also if we introduce a dependency on another device to allocate the
> > output buffers - say always taking the output buffer from the GPU, then
> > we've added another dependency which is more difficult to guarantee
> > across different arches.
> 
> Yes. And it should be expected. It's a consumer who knows the
> restrictions on the buffer. As I wrote, Zoom/Hangouts should not
> require a DMA buffer at all.

Why not ? If you want to capture to a buffer that you then compose on
the screen without copying data, dma-buf is the way to go. That's the
Linux solution for buffer sharing.

> Applications should be able to allocate
> the buffer out of the generic memory.

If applications really want to copy data and degrade performance, they
are free to shoot themselves in the foot of course. Applications (or
compositors) need to support copying as a fallback in the worst case,
but all components should at least aim for the zero-copy case.

> GPUs might also have different
> requirements. Consider GPUs with VRAM. It might be beneficial to
> allocate a buffer out of VRAM rather than generic DMA mem.

Absolutely. For that we need a centralized device memory allocator in
userspace. An effort was started by James Jones in 2016, see [1]. It has
unfortunately stalled. If I didn't have a camera framework to develop, I
would try to tackle that issue :-)

[1] https://www.x.org/wiki/Events/XDC2016/Program/Unix_Device_Memory_Allocation.pdf

-- 
Regards,

Laurent Pinchart

