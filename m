Return-Path: <linux-media+bounces-11392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AF28C3D6E
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 10:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 720FB281009
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 08:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ECB2147C8C;
	Mon, 13 May 2024 08:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tdm+v7jH"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A0E147C8F
	for <linux-media@vger.kernel.org>; Mon, 13 May 2024 08:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715589596; cv=none; b=WOHFpop8UnE0fo2x2bVR8oTLc/V1/posAxN2z9ND7Ti86NWPEa3QFEiqBsJBQPQSRx+N9lnbU/HMAiDh9+E+vUTclLRkNEM1RQFh7YbCBymGhXruCgK+u1eF6g0PDK+1rdWPbTLy2ZS45oNpvomnx31CdBdH3Fqg8Dbqa50uBus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715589596; c=relaxed/simple;
	bh=NafnT6nxtfip1QG/byPJKrL48bOdfUlcszFB+gXZGRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSxVSr1eXP0GBk0fXVbEHIYZKNaVqZA5yZ1xX3XJAbCsH/SJr189YEXzLX5mMNXaAPTyuCPhdhovuOm1mS7TAoulYKRWW8xYQNPgaE9XDDtDW4emrmzxvRveKnD+hWEnfGkGKI8yD4FWwttE0JITvsNyG6RvG6cS8V3hnU1Qsgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tdm+v7jH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715589594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NafnT6nxtfip1QG/byPJKrL48bOdfUlcszFB+gXZGRk=;
	b=Tdm+v7jHeLpTwb8dlGwi1x02wb1/BoYiXNzKM0T1flPEOLL3xTxINFiOLWEtFzDFZ49DpF
	LDGg2NbsPjOMIw4tyyhuWPBYzE5/3pdSVY/QczxvDfsmS+AYsWfM07DdKEuGS5QTnhClr9
	mYhEhMZ4kDYydW1RzTSqs0dutIwN+ZU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-Qq5nN4OsNRGe9Hs13ClHYA-1; Mon, 13 May 2024 04:39:50 -0400
X-MC-Unique: Qq5nN4OsNRGe9Hs13ClHYA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-420122cf3eeso4644095e9.0
        for <linux-media@vger.kernel.org>; Mon, 13 May 2024 01:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715589589; x=1716194389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NafnT6nxtfip1QG/byPJKrL48bOdfUlcszFB+gXZGRk=;
        b=rUzMDStisqt0+EXvjDUf3KLEJJtKs4Dvg498alwSrKBU0D6Y5P6YKutJmK5pIX5wSe
         TToTjAu4UH7zjFgi9zoaBeQQuX/gAlrlFusuiIUZEK04l6J2nj+N/cofjYvtvbCGZjZh
         cIFRByc7AsCjAvQVDVHFHSfMKciowptArp9Z8+ToBFcYzYbzKDIwq2Ln9jSO4O/3wCBn
         Zu+0vbzCK/NO8PDZBW5cVomDNsmAoRJ/acukgqCq8cT/MlLWJhHx76WC+zAg8eq0PUgf
         hduBKZ7VfPZBn32LFtg6WzVM2vSG8UT2U6QqFggjjf+OlkBAsx83wRBbHN4UKt3vDJke
         Yu8A==
X-Forwarded-Encrypted: i=1; AJvYcCU/3DO3ZbqbZ7SNIEQlJrrs6frlyKqDeL/achRCnCjFm712GpBURsfxhC03qG6/kgX+6maxxiSWAKNMpvEdTwrkD7bYwl0SmO8A5CE=
X-Gm-Message-State: AOJu0Yw4Z5PmgpK5VqWtOwKL0TRDnQvUyraTap+E1Qpi8oohFkzkK5O5
	NuxahvPDzdbUlayrOqC8aQz92RVWQWzg7jUfJFPKggr4k7Y696AtH8/EyuR6KpD+UOiMws7EFb8
	KfYIGSzZIuZfXWpHg+519dXPKUsaNYE16PCzxW3A8/4M1XfYnSG9rkig4QE4n
X-Received: by 2002:a05:600c:3caa:b0:41b:55b1:6cfc with SMTP id 5b1f17b1804b1-41feaa2f3a3mr60665285e9.1.1715589589254;
        Mon, 13 May 2024 01:39:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSHY3Vs6wnO8Hqo+e75wM+DuYwRlx0w2YGHoHP++IqYSQpbYZoInfS6/LKCMB/0qMhU4uo5Q==
X-Received: by 2002:a05:600c:3caa:b0:41b:55b1:6cfc with SMTP id 5b1f17b1804b1-41feaa2f3a3mr60665135e9.1.1715589588807;
        Mon, 13 May 2024 01:39:48 -0700 (PDT)
Received: from localhost ([2a01:e34:ec60:48a0:b89c:e3fb:cb18:893d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f87b2648fsm185332075e9.7.2024.05.13.01.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 01:39:48 -0700 (PDT)
Date: Mon, 13 May 2024 10:39:48 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Hans de Goede <hdegoede@redhat.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Lennart Poettering <mzxreary@0pointer.de>, Robert Mader <robert.mader@collabora.com>, 
	Sebastien Bacher <sebastien.bacher@canonical.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Milan Zamazal <mzamazal@redhat.com>, 
	Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <20240513-delectable-busy-serval-fbe3fe@penduick>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <ojduxo54lpcbfg2wfuhqhy7k3phncamtklh65z7gvttcwztmhk@zkifewcy4ovi>
 <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
 <e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
 <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
 <CAA8EJpr4bJUQt2T63_FZ=KHGEm4vixfpk3pMV9naABEONJfMmQ@mail.gmail.com>
 <20240507184049.GC20390@pendragon.ideasonboard.com>
 <CAA8EJpqLu5w7gnqtDyuDDQBd7AEROTd6LTYi8muzjToXmkKR3w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="qh6aaiqzlccizapn"
Content-Disposition: inline
In-Reply-To: <CAA8EJpqLu5w7gnqtDyuDDQBd7AEROTd6LTYi8muzjToXmkKR3w@mail.gmail.com>


--qh6aaiqzlccizapn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2024 at 10:59:42PM +0300, Dmitry Baryshkov wrote:
> On Tue, 7 May 2024 at 21:40, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > On Tue, May 07, 2024 at 06:19:18PM +0300, Dmitry Baryshkov wrote:
> > > On Tue, 7 May 2024 at 18:15, Bryan O'Donoghue wrote:
> > > > On 07/05/2024 16:09, Dmitry Baryshkov wrote:
> > > > > Ah, I see. Then why do you require the DMA-ble buffer at all? If =
you are
> > > > > providing data to VPU or DRM, then you should be able to get the =
buffer
> > > > > from the data-consuming device.
> > > >
> > > > Because we don't necessarily know what the consuming device is, if =
any.
> > > >
> > > > Could be VPU, could be Zoom/Hangouts via pipewire, could for argume=
nt
> > > > sake be GPU or DSP.
> > > >
> > > > Also if we introduce a dependency on another device to allocate the
> > > > output buffers - say always taking the output buffer from the GPU, =
then
> > > > we've added another dependency which is more difficult to guarantee
> > > > across different arches.
> > >
> > > Yes. And it should be expected. It's a consumer who knows the
> > > restrictions on the buffer. As I wrote, Zoom/Hangouts should not
> > > require a DMA buffer at all.
> >
> > Why not ? If you want to capture to a buffer that you then compose on
> > the screen without copying data, dma-buf is the way to go. That's the
> > Linux solution for buffer sharing.
>=20
> Yes. But it should be allocated by the DRM driver. As Sima wrote,
> there is no guarantee that the buffer allocated from dma-heaps is
> accessible to the GPU.

And there is no guarantee that the buffer allocated from the GPU is
accessible to the display engine. In practice, I've yet to see an issue
with that assumption.

And there's the other elephant in the room that hasn't been addressed.
Buffers typically allocated by the data-consuming frameworks are
coherent buffers, which on arm/arm64 usually mean non-cacheable.

Performances are *terrible*. Meanwhile, dma-heaps and dma-buf provide
cacheable buffers with a cache synchronization API, which allow to have
it run much faster.

Maxime

--qh6aaiqzlccizapn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZkHR0wAKCRAnX84Zoj2+
dmpnAYCn9sxfeRSm1Faf0OjKfvfKYpA6+XhCEJJVQzH6jGId/Sk32BahqCR3ZucO
/1TsALQBf160+BzC2jF6k7Xud+ixD5QuBdXfxo6UziSenQ1ClVh2UFdyf0TG2Tzj
I+TfIOqSEg==
=cY/A
-----END PGP SIGNATURE-----

--qh6aaiqzlccizapn--


