Return-Path: <linux-media+bounces-43738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A75BB6FEE
	for <lists+linux-media@lfdr.de>; Fri, 03 Oct 2025 15:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D339C19C0F48
	for <lists+linux-media@lfdr.de>; Fri,  3 Oct 2025 13:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853712F069E;
	Fri,  3 Oct 2025 13:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HodfxINm"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6AA1B6D06
	for <linux-media@vger.kernel.org>; Fri,  3 Oct 2025 13:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759497815; cv=none; b=iooLoJEnyBnPK+jZ+uxYU/MToTbbaelP9BuyFMtrI5Bu0ZiIhv4ny4qBDDOP3S9wE+HxGvx0Lg0l6ECzFQaptDhXWNCL6jqYnyaMPholud/fvtFGGwlRl2H6FQLhAPLbVBoFgptTAEsXsOYeB6iYDOOlTn9ONNgzsoq+/irjf+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759497815; c=relaxed/simple;
	bh=dsc0ppfIPY/8mXhi22n4Pmr2Qi2oy/rvVbX2avU6HNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rF1Vup3G1UrgV6wvgbJw9L+PWboG215e98+DCfVQAgVf73eMytmIObANFy3Egj1tS89TaAd/hyots2fU4A+yV2muO4fHzVMvjmelfkWI1oWyCoQbnYWS5usSrJcOFMCMXRAh56qaJOcKrlOL74n/aJ3xISB5zOd3m2ZCkjEr+p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HodfxINm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759497812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i3OgrM6kqtp8r+T8wasXEeO2qtaqUyEZzjkjuxIwoHg=;
	b=HodfxINm++2lnUCJAgORolHxNFS8j2NMJoCS5kUkFYzLUAaBBDYczn6Wnvi0xGWDz1JozI
	NQTUh71/CjNs58PK5PzqU+AWj6UJUhKLjBASmcBg4iLsCfmP8cVHzH9fbBDqvhUYBoJjwm
	Ku18QXmWL6j7EbePPL79O3aJ4eeyCfA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-IT_Wc25DNvSJMm93LyYtCQ-1; Fri, 03 Oct 2025 09:23:28 -0400
X-MC-Unique: IT_Wc25DNvSJMm93LyYtCQ-1
X-Mimecast-MFC-AGG-ID: IT_Wc25DNvSJMm93LyYtCQ_1759497808
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e35baddc1so15534805e9.2
        for <linux-media@vger.kernel.org>; Fri, 03 Oct 2025 06:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759497807; x=1760102607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3OgrM6kqtp8r+T8wasXEeO2qtaqUyEZzjkjuxIwoHg=;
        b=p/gpYfi9pJrtM5L+Fahculh4yp6OPxG3s16DARPTmfYv8KCzKRhp1WiS5E4LF1zcUG
         KU/jt8fEEcFj73s/7pSJsSkfydztoY9+rT8dnSJBzahPG6tu6FfPg0y90saTW5R6HyhN
         x2OoOLujB9OxxSkbHAL9ryuKZSAueKKidJlXMO5lsLE2NK/39jm2qnBe2v2nbGiL4FUD
         O/KW2vxxi1iRefTsuLKyZX0NSi6Dm59r0k2le7/CNEE/PiiXhnobyA02CyJSU1uAluym
         1H8GFvHJsULZLGJ1ajBbl1ugNwoTjLfNDv/J9+k9FH43i3VyxH/Ltl4/dcdmPVO1a99K
         eSSw==
X-Forwarded-Encrypted: i=1; AJvYcCWBwXRPCNF88hIMnLVvQfjaa6bHTa/32sjQk0sY48ArjxbduHu1l6E7rm9CoMah6dOlxmZ/HsYomW8Eug==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFxOF3zBI6qVNlzfG7BuTwhQlwA+h1X43mVU05K74dE5Ddb6vN
	RIx2vWSz/L8BvjmeAPPEhIWkOXKIyCbI1z4Dau6ZwIYfXJISdexg+C93BVIAVIDzz8+19I0MgqT
	H24GKuGJo7ImNOggDtZwq+EX6dlaqYAf5ZujrCd9/SctTHzh591LJKMMrXTc2bRro
X-Gm-Gg: ASbGncuHvN9dsYxPe0LGStSetbIiKAQPoZiE2PSqdoomqDsUURppJc+Pm6/EiJE1xdS
	/vMUHZurp1LdplMjGVdX97L7J3FxABNd1s9RJ/XZLHDc2DZsqFcnX6j70hAEgfGxcbnV/YOc6gY
	SIocAAEplYOktPhnlXVPRce2S1W7DVgirThXKmPPYdUQCf6w0avlsBoOyyCHS8AkRn8Qr94SNrb
	kLgiDucmhuHC9xRA8abKP1Pk2ZD1W6yU2j3aUs4I4gwCW2XW/nT0QnGs9sdQ3OZvWCfUEIIBIPv
	ADBQtYScAOKEJrMssAr1iQ==
X-Received: by 2002:a05:600c:4510:b0:46e:59bb:63cf with SMTP id 5b1f17b1804b1-46e71140be1mr25355425e9.24.1759497807555;
        Fri, 03 Oct 2025 06:23:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOOjaj75XO52nWI2I6UTsKjmFKM3jXrNLUe3y6zOumiOqPFkEXqNu9rSWvZBXSmGhaUe3KVg==
X-Received: by 2002:a05:600c:4510:b0:46e:59bb:63cf with SMTP id 5b1f17b1804b1-46e71140be1mr25355005e9.24.1759497807018;
        Fri, 03 Oct 2025 06:23:27 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8a6b5csm7942733f8f.5.2025.10.03.06.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 06:23:26 -0700 (PDT)
Date: Fri, 3 Oct 2025 15:23:26 +0200
From: Maxime Ripard <mripard@redhat.com>
To: John Stultz <jstultz@google.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, "T . J . Mercier" <tjmercier@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Sumit Garg <sumit.garg@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v12 2/9] dma-buf: dma-heap: export declared functions
Message-ID: <20251003-brilliant-golden-lion-fbedc9@houat>
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
 <20250911135007.1275833-3-jens.wiklander@linaro.org>
 <20251002-shaggy-mastiff-of-elevation-c8e1f0@houat>
 <CANDhNCqS+WKhTWjeC7yBL+x4erK4S4bievTxdneaCu1haA8=hA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="bmweveq2oxpjd6s2"
Content-Disposition: inline
In-Reply-To: <CANDhNCqS+WKhTWjeC7yBL+x4erK4S4bievTxdneaCu1haA8=hA@mail.gmail.com>


--bmweveq2oxpjd6s2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v12 2/9] dma-buf: dma-heap: export declared functions
MIME-Version: 1.0

On Thu, Oct 02, 2025 at 12:45:41PM -0700, John Stultz wrote:
> On Thu, Oct 2, 2025 at 12:47=E2=80=AFAM Maxime Ripard <mripard@redhat.com=
> wrote:
> > On Thu, Sep 11, 2025 at 03:49:43PM +0200, Jens Wiklander wrote:
> > > Export the dma-buf heap functions to allow them to be used by the OP-=
TEE
> > > driver. The OP-TEE driver wants to register and manage specific secure
> > > DMA heaps with it.
> > >
> > > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > Reviewed-by: T.J. Mercier <tjmercier@google.com>
> > > Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > ---
> > >  drivers/dma-buf/dma-heap.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > > index 3cbe87d4a464..8ab49924f8b7 100644
> > > --- a/drivers/dma-buf/dma-heap.c
> > > +++ b/drivers/dma-buf/dma-heap.c
> > > @@ -11,6 +11,7 @@
> > >  #include <linux/dma-buf.h>
> > >  #include <linux/dma-heap.h>
> > >  #include <linux/err.h>
> > > +#include <linux/export.h>
> > >  #include <linux/list.h>
> > >  #include <linux/nospec.h>
> > >  #include <linux/syscalls.h>
> > > @@ -202,6 +203,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
> > >  {
> > >       return heap->priv;
> > >  }
> > > +EXPORT_SYMBOL_NS_GPL(dma_heap_get_drvdata, "DMA_BUF_HEAP");
> > >
> > >  /**
> > >   * dma_heap_get_name - get heap name
> > > @@ -214,6 +216,7 @@ const char *dma_heap_get_name(struct dma_heap *he=
ap)
> > >  {
> > >       return heap->name;
> > >  }
> > > +EXPORT_SYMBOL_NS_GPL(dma_heap_get_name, "DMA_BUF_HEAP");
> > >
> > >  /**
> > >   * dma_heap_add - adds a heap to dmabuf heaps
> > > @@ -303,6 +306,7 @@ struct dma_heap *dma_heap_add(const struct dma_he=
ap_export_info *exp_info)
> > >       kfree(heap);
> > >       return err_ret;
> > >  }
> > > +EXPORT_SYMBOL_NS_GPL(dma_heap_add, "DMA_BUF_HEAP");
> >
> > It's not clear to me why we would need to export those symbols.
> >
> > As far as I know, heaps cannot be removed, and compiling them as module
> > means that we would be able to remove them.
> >
> > Now, if we don't expect the users to be compiled as modules, then we
> > don't need to export these symbols at all.
> >
> > Am I missing something?
>=20
> For things like distro kernels (or in Android's case, the GKI),
> there's a benefit for modules that can be loaded permanently (not
> having a module_exit hook).
> One doesn't have to bloat the base kernel image/memory usage for
> everyone, while still not having to necessarily deal with
> complications from module unloading issues.

Ack. We should at least document it then.

Maxime

--bmweveq2oxpjd6s2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaN/OTQAKCRAnX84Zoj2+
dtj+AX9Z6mfBBmJxP6k0eTgjg+qG1U5U8jSi9QuHw6zfKnsmrcwgrOYtur1R6Pew
cpDvn3QBfR0GnE+hRXWrYWoFPItAzGGTqManWkqHoYmL3MvlOwO7ECQmeIAe8L4a
Hi/ZAVgLUQ==
=rb0f
-----END PGP SIGNATURE-----

--bmweveq2oxpjd6s2--


