Return-Path: <linux-media+bounces-54424-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMfSGUrmp2mrlAAAu9opvQ
	(envelope-from <linux-media+bounces-54424-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 08:59:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3E31FC143
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 08:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E8A9301222B
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 07:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C55388379;
	Wed,  4 Mar 2026 07:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wp8BKSAs";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gXvkxwCx"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B7838657B
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 07:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611139; cv=pass; b=AUfJTtvrlLFoJQ82cJDgxXwbUwiwmf6Oip1B+/EznikNu3BkQcYYPIRL+4XEzaTLOU7fn9DgIRFe3isOisZ7GB6mBoGJTGZNDXoTzqwtNoiINKNAPX3xv91ybXs7+yIWpRt2Sa1gmottByFQa9NArLAB8sjdzfKmTW06ty/9GNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611139; c=relaxed/simple;
	bh=7DX6Xti3V185YiZv0qsnJejX66rVhLRc4dUIutVTUlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YuQ6LJQeVsMeHsYi20alI4A1SMPQIWnU5+/7kW1KK+NgXLQ+G0BsqXSHRQDmGBf+fvioZx7TcFiwQdBFjUXB7ZnFznBZr5OMesN1zmCCPojOB/EmZNOtlGgIWlY7xOOyELyocvnr74ck5Ad2g9+OBUkCPkOR1UQ8YmR1gSx2/4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wp8BKSAs; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gXvkxwCx; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772611136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wcqpRt8jvMP8XWtSPkO4bteIZfJG5tmplM3Y6kGZdoo=;
	b=Wp8BKSAsphuka/rWK1RBRi6EyLkevNdS+gOFPkRt8jbyRklUu/bmcGxM6NVupBkCcc+ABq
	zgbW6Ce+TdsUPhYyyLnOfyGAiqF24PrygpXk/ZCvhWBm3CwR1coHtVq19qm2qmomlnPVB2
	TRS/xaSnqIIaPfckzGYMZ9k05aAeQCo=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-vMhiSEICOrqwDfFHihllvg-1; Wed, 04 Mar 2026 02:58:54 -0500
X-MC-Unique: vMhiSEICOrqwDfFHihllvg-1
X-Mimecast-MFC-AGG-ID: vMhiSEICOrqwDfFHihllvg_1772611134
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-649deeeb00fso8561612d50.0
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 23:58:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772611134; cv=none;
        d=google.com; s=arc-20240605;
        b=f8wEvg8CHvMiGMdwl8V0/f2zbl2Xq7tNahj6MGRs2sFYbIruJ8f/VIasD1b7EWoC18
         zt88jgt4gLPjCP7F3hpyCsHc57HowbDkLQAENLFeR0oMiWNcMWWNlqfWJrpdSxMgGA4A
         qs/pF2dCYBt8k1hJiR/64WTmtoxx8Z8mxk1EzZcQHhiaW81VdnCaNbZkB0yTWxWdCXof
         RezB1HV4Rcef9Xn9vr7jbYX/m/36eyhycm6fFqogZmer/YZiZMs4GvbdVfeC5iC5LHuQ
         MG/08W4Wd/3zCNkktPxJkQu3SVAJQdwhxZnlKX20iMyZcd/8OiDkJamhFCuLIrbqMRei
         I3Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wcqpRt8jvMP8XWtSPkO4bteIZfJG5tmplM3Y6kGZdoo=;
        fh=PPyYsYcemJWJ2XtKNNYc4E3VZI/h8CHafkTxRp04BfY=;
        b=StN5VaxMaG6n1IE5TLBuKYGtxSqQTYHK6DKBqrTguZ81WbuvAin6fmaohblmrfe+9J
         KWNx5AtVAUe8NJ21lhjyBZDAxo2DxOKYi6n6KYknpdeGtRKgWgCe5vRrSHSCT7LCQz0y
         JZizRdn9H+sl7/PeKm8ZJbXxEgaf6UZgtIfoz/PxCADsGg5yEqwELvOdnDgDfil2PbBh
         2pDs0Sdp6uZA1K6fQzIOdFDLO5SNOl7w5Zb7p5oYy1RJyyIGTtzIwRPmwH9t4i2TL6Us
         ZFt9Bw7V/orSI6P7UrNNUKSDNoo9OpKWGTrVmlP59P5CnCJF+lrciIkIiLsoCxLjLCed
         UCyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772611134; x=1773215934; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcqpRt8jvMP8XWtSPkO4bteIZfJG5tmplM3Y6kGZdoo=;
        b=gXvkxwCx5UGJ7aDb/360IBk8YmmNLdLJ9rSCtR1DFv7nkNQ+veNdtyKTmf9Az1tCpd
         tZL9rXxya/5GTLBEtNLitFAz6iCzwnqvmzvvt29nFypz8W2nAXqnkcHNjLApJuH2I8yU
         ZbVaWuSsQV91XTXwWKQ16eAFc1rIH+2fR7+/z+Nl9+VIRoFBVaTHY5fs2WfkoBvjjYU2
         4iYo/ACApWuFuuYGJRycMlxgwCa/VOtAb7RJTRIFc0e3sHoxGsZBFUbMsPehwnIFVDdV
         9f278yyIJ89pml0f+eqxTLSSUx8u3mAUXO7wbKaBIQ3j79Sz1lFZAnHrhPRNIQWSh/1f
         HbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772611134; x=1773215934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wcqpRt8jvMP8XWtSPkO4bteIZfJG5tmplM3Y6kGZdoo=;
        b=t9ut4QdxywrAR+90t1bQ3HZYWMIQxlrlPB/OplYMEPY5t6TutbYGYWDSWH6YhhFBxM
         Jn3uWSAtyiLK7DX72KdPpM4Np019k+29Bo6sTaw48BdUPaRY0qcrpUvHA8K4zWBuwSC1
         WM6G3o5gWYFUQXEC7J6eUINiWG0aEPEtxmGu4VDNi+zsnw69KzjsvXaLs6L0m6FUOKbO
         J70gDz2ALirx85AGduj13NYPfV9sAQU/58J1/KV6Dtuo39bBimDC3zew24x0HLiRKzFR
         21NLpK3dB/wGIujwTo4sssBM+CM1u6tNworb2GRpH+rr62gE3+Ciq5OPmVeL97KdnRkd
         EGGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2mNrK49ibx6pojbwXvBIISUbu9G6ZfYu+q1Z/kU8mMOd0q1bC85DwZbXFmzm1zSEqYMxHhP3JGT5HVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGVlj6Z7kPMUxg5CGknqs8tbO9k+IhgGpqp5fx1OG5v6sxgzjH
	rhTEYt4+gqd/g6nvdrwyX6UFk7lthkAxh4ol9m6JCRddfTcVfIfhxEcQYk+Yp86E9U3wOQ7J3hM
	oqmc9WlxsBbTM83pqrhmi2e0iHlzTFaUBxkIA4w91psBZl8BVVPN695J5MJ5C3okzfaWD3dw5ZV
	bFIYFcsPL8fjBtpdnV7O/rYmS9k9qlqMnstXTxnIM=
X-Gm-Gg: ATEYQzxrWbksEvbFAKLG9wZoXsM5Mrc0SRXdefm1UX59yRC2jBJlV+2kzwY2dUvlkVg
	p8r9AyHqH5yvG2zKRqw8R72/7325De59urnqU3tsnQutshF/qapjNe6fJXhAhadZSGF0IAOxFeT
	yWbI5YDq4nvKuaL2sSzNpmTQ2pqiO0OPt0Hw883lP6z/PjD2d8Km+ZO94kTzAXVa4cbw2TivM26
	Q==
X-Received: by 2002:a53:ee53:0:b0:649:b04c:25c3 with SMTP id 956f58d0204a3-64cf9c1872amr761647d50.62.1772611134088;
        Tue, 03 Mar 2026 23:58:54 -0800 (PST)
X-Received: by 2002:a53:ee53:0:b0:649:b04c:25c3 with SMTP id
 956f58d0204a3-64cf9c1872amr761636d50.62.1772611133749; Tue, 03 Mar 2026
 23:58:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303-b4-dmabuf-heap-coherent-rmem-v2-0-65a4653b3378@redhat.com>
 <20260303-b4-dmabuf-heap-coherent-rmem-v2-3-65a4653b3378@redhat.com> <20260303-weightless-crafty-hyrax-bdf1ca@houat>
In-Reply-To: <20260303-weightless-crafty-hyrax-bdf1ca@houat>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 4 Mar 2026 08:58:42 +0100
X-Gm-Features: AaiRm50vjbd8iZF9aZq1Cno_RqIuyn0PYTIuzz9Iq5d5rpEaa4iOCaZKKjWryT4
Message-ID: <CADSE00LodeTg8Xfvo4VOZDvHh25=8+Jsqq+V8iynmpYx2bBRjA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] of_reserved_mem: add a helper for rmem device_init op
To: Maxime Ripard <mripard@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, echanude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 0E3E31FC143
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54424-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 2:13=E2=80=AFPM Maxime Ripard <mripard@redhat.com> w=
rote:
>
> On Tue, Mar 03, 2026 at 01:33:46PM +0100, Albert Esteve wrote:
> > Add a helper function wrapping internal reserved memory
> > device_init call and expose it externally.
> >
> > Use the new helper function within of_reserved_mem_device_init_by_idx()=
.
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  drivers/of/of_reserved_mem.c    | 27 +++++++++++++++++++++++----
> >  include/linux/of_reserved_mem.h |  8 ++++++++
> >  2 files changed, 31 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.=
c
> > index 1fd28f8056108..3a350bef8f11e 100644
> > --- a/drivers/of/of_reserved_mem.c
> > +++ b/drivers/of/of_reserved_mem.c
> > @@ -605,6 +605,28 @@ struct rmem_assigned_device {
> >  static LIST_HEAD(of_rmem_assigned_device_list);
> >  static DEFINE_MUTEX(of_rmem_assigned_device_mutex);
> >
> > +/**
> > + * of_reserved_mem_device_init_with_mem() - assign reserved memory reg=
ion to
> > + *                                       given device
> > + * @dev:     Pointer to the device to configure
> > + * @rmem:    Reserved memory region to assign
> > + *
> > + * This function assigns respective DMA-mapping operations based on th=
e
> > + * reserved memory region already provided in @rmem to the @dev device=
,
> > + * without walking DT nodes.
> > + *
> > + * Returns error code or zero on success.
> > + */
> > +int of_reserved_mem_device_init_with_mem(struct device *dev,
> > +                                      struct reserved_mem *rmem)
> > +{
> > +     if (!dev || !rmem || !rmem->ops || !rmem->ops->device_init)
> > +             return -EINVAL;
> > +
> > +     return rmem->ops->device_init(rmem, dev);
> > +}
> > +EXPORT_SYMBOL_GPL(of_reserved_mem_device_init_with_mem);
> > +
> >  /**
> >   * of_reserved_mem_device_init_by_idx() - assign reserved memory regio=
n to
> >   *                                     given device
> > @@ -643,14 +665,11 @@ int of_reserved_mem_device_init_by_idx(struct dev=
ice *dev,
> >       rmem =3D of_reserved_mem_lookup(target);
> >       of_node_put(target);
> >
> > -     if (!rmem || !rmem->ops || !rmem->ops->device_init)
> > -             return -EINVAL;
> > -
> >       rd =3D kmalloc_obj(struct rmem_assigned_device);
> >       if (!rd)
> >               return -ENOMEM;
> >
> > -     ret =3D rmem->ops->device_init(rmem, dev);
> > +     ret =3D of_reserved_mem_device_init_with_mem(dev, rmem);
> >       if (ret =3D=3D 0) {
> >               rd->dev =3D dev;
> >               rd->rmem =3D rmem;
>
> I think you need to take the allocation of rd, and everything below.
> Otherwise, your device, despite being attechd, wouldn't be listed
> anywhere.

True, I did not pay enough attention to that part. I will fix it in
the next version.

>
> Maxime


