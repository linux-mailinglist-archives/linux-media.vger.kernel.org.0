Return-Path: <linux-media+bounces-49207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58715CD0BBF
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 17:07:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90C513086CE7
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 16:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8BA536BCE6;
	Fri, 19 Dec 2025 15:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H9VKfjuJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="N6IPCKQI"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F78E36B07E
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 15:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159945; cv=none; b=Nx2lNocEnLsef21cAgrEPUly2GX02NHG/tpWSyq8XJjDsX/FyIOKCP1PNcK+hTL8mlf5TVIlCAs59v8liweWR10FG8uegp0uLqtjYMF+kxx/ZiurWy5xo7UdiLdjuGCqOVjELYyprfP+AKI3C1jHt2LDVItIYalm8hhOfVMD1CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159945; c=relaxed/simple;
	bh=NuVKMRCOXiL/q8JSNbJx7Vrep0Xak1sDKET9rwhN+f4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+LNOL6KVsP64bg0Df5GfX2r8ZFfj1TJJXMGTGBiaKP7jTKPOewFrtzCGbN4Pm21Z2oNSB2mWBxe9aDlQt5JbS50cUGiQ3QLruV/BafDkySXLuIBner5kB7Grn9/FPLPpQI/Fnd8Pzv4sA+tZnaoz/T9PXJVRLjgQ7ogzELQ50A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H9VKfjuJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=N6IPCKQI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766159943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NuVKMRCOXiL/q8JSNbJx7Vrep0Xak1sDKET9rwhN+f4=;
	b=H9VKfjuJT7xTqp8ZjSQBSxnRbYYyNIpsYsirggZx97RwCWpFgAsz9gvMcHiejxuWyZAOTe
	gG1DXGygvOgOhSG4UAMWZHvk4+b7HMXgzxdg6D7/UGMsFNjS6Q1V4Gwa2cQB4XgpTUpzNH
	WFFDs2XPLx/uP4JwtaPcoQOx0oacLKs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-B4QvkBnGM9m2O9cXSS9E9A-1; Fri, 19 Dec 2025 10:59:01 -0500
X-MC-Unique: B4QvkBnGM9m2O9cXSS9E9A-1
X-Mimecast-MFC-AGG-ID: B4QvkBnGM9m2O9cXSS9E9A_1766159940
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-477563e531cso13020555e9.1
        for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 07:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1766159940; x=1766764740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NuVKMRCOXiL/q8JSNbJx7Vrep0Xak1sDKET9rwhN+f4=;
        b=N6IPCKQILlNFEijbjaTTEW/OGh4e0Qx/vl2CnC1a2egATRkboXgVu8lCfBDs7IJJDg
         zICFy2OXgBy3ohVL+/84go0cFneOLBDqcTYTmvkhefgx/1rTI0alnGfBH0Pc4Iw6mqHB
         NjSbJLg450GDb+PpOt8RJ0koqcM9FFDLQiA+lXAlim02rS3Xdl1+oXzlAT9M+LHym+U7
         HCQjCzIxTshdvAEQy+83aWA74vNMzJv73D5j51Y1jbsarzy+OYe0kImj4vIwn17fsKOe
         LKNZBD2vVZC14maecUM/paHaG4NDmGFLAbocIfsZEWWJBYo5Vu6fjm4HfPoms+L2EMcq
         vlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766159940; x=1766764740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NuVKMRCOXiL/q8JSNbJx7Vrep0Xak1sDKET9rwhN+f4=;
        b=lRcwjYv1O/iSkDugp64kYOBTrKtjGIA9eqVRpze96zoVh0d82EiR4cZ7NDeWiUtqIg
         Dw1f3mmf0BEtKC3MrXC7yR6B9QBYOGmrX+0b4bjvICpPKmNIID4kxd+95xJrRaMLyxbb
         fuq6ufQhvNh1DDV7yoqoLJaPfkp9mwsvFnR9F2GLM94n5BuJh2JmvzuqZ3aLytM+mRxQ
         c8ZaCiNaVexK0kfPMg37wvzjgOjswf615wa9qIILUq7Itb5KaKXRfT6XJiODPe8le2vn
         H1hq8dDASDp3Hb96P0dWVQbUM9ilUmm+UW5STA0ml55hXS8Vzqc+BrCYCRqzeCwAV4Pw
         0csw==
X-Forwarded-Encrypted: i=1; AJvYcCWLN6x16wIOhoVVOedMrzL0zM+10hCJMTDVlEaJmG9O7+gQxaQYTHpNHb2pjWWqiIWhp9skL456eGYPrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvAsVK0iR58MQEr3nI+7Dqyp9UhFR63Ovrk4peiX52/LJCf4jG
	sQ43fS0VtUlAv1OpEn4yIY1AqEtYSaYyiM/+0orlPGaSXl4V8lKRXWR7ESAe1RQw2G/uf5Sc+mE
	1P/HtPStSprwH+2t1HgMQp3ZEcTJQ46V3w71CNuDvecsEJNZPxv6eUANZJM4ycM83
X-Gm-Gg: AY/fxX4/6D9SS3ZXkrDw63MCBzy9LzfkEGAG2U3Rr+AXQmX/VLLxnmKgtSDzH82TFbc
	Y//4n60aXKm2RKiS/9VpPS9RxGpqMw9FALuKicXS2sf7d/1hEUntQwkYediSVcK8OjkfvyGuAkO
	+JPjfTJalqD7c+lsRFQ8guS/QCDlqkq6/Mzs6ynWZ1KeEfKweG1TC3ThdJ9spc3xzOHdttSTbgD
	q7MLEsvVwfqPoQZ3SQc7qrNajQmnjSBzDuha0KIQ6Kh1p83AAfoknzJ5TLJWAlgQAfs037XRZEo
	WEgayiEqDpniKt/bvhlSXXMqouNr2ySoZHD/rFCw7cSmRefe96x9h8/eW1FJjA==
X-Received: by 2002:a05:600c:8710:b0:475:da13:2568 with SMTP id 5b1f17b1804b1-47d19592102mr31215195e9.25.1766159940206;
        Fri, 19 Dec 2025 07:59:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGz4saKUE5xlJBqdu6Gk7rmDOjerDoiXpYwJNHDHvTSpuZXU0uy6ESaJF6LqfbEUnkQVRXGsw==
X-Received: by 2002:a05:600c:8710:b0:475:da13:2568 with SMTP id 5b1f17b1804b1-47d19592102mr31214855e9.25.1766159939720;
        Fri, 19 Dec 2025 07:58:59 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d192e88f5sm49165545e9.0.2025.12.19.07.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 07:58:59 -0800 (PST)
Date: Fri, 19 Dec 2025 16:58:58 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, 
	Eric Chanudet <echanude@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>
Subject: Re: [PATCH] dma-buf: system_heap: account for system heap allocation
 in memcg
Message-ID: <20251219-cuddly-platinum-cormorant-ae6d0e@houat>
References: <20251211193106.755485-2-echanude@redhat.com>
 <CABdmKX2MPhw121ZG8V+f-XoOReUsCdmcug-cWDg=3WZcJ=NHHA@mail.gmail.com>
 <20251215-sepia-husky-of-eternity-ecf0ce@penduick>
 <07cdcce2-7724-4fe9-8032-258f6161e71d@amd.com>
 <20251215-garnet-cheetah-of-adventure-ca6fdc@penduick>
 <ef52d9e9-6abe-421a-98f8-f96353652e1e@amd.com>
 <20251219-large-daffy-monkey-74665d@houat>
 <5eda1755-865c-4bb0-a1a0-a4e6dac5388c@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="62gvz4x3u7aurz3v"
Content-Disposition: inline
In-Reply-To: <5eda1755-865c-4bb0-a1a0-a4e6dac5388c@amd.com>


--62gvz4x3u7aurz3v
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dma-buf: system_heap: account for system heap allocation
 in memcg
MIME-Version: 1.0

On Fri, Dec 19, 2025 at 02:50:50PM +0100, Christian K=F6nig wrote:
> On 12/19/25 11:25, Maxime Ripard wrote:
> > On Mon, Dec 15, 2025 at 03:53:22PM +0100, Christian K=F6nig wrote:
> >> On 12/15/25 14:59, Maxime Ripard wrote:
> ...
> >>>>> The shared ownership is indeed broken, but it's not more or less br=
oken
> >>>>> than, say, memfd + udmabuf, and I'm sure plenty of others.
> >>>>>
> >>>>> So we really improve the common case, but only make the "advanced"
> >>>>> slightly more broken than it already is.
> >>>>>
> >>>>> Would you disagree?
> >>>>
> >>>> I strongly disagree. As far as I can see there is a huge chance we
> >>>> break existing use cases with that.
> >>>
> >>> Which ones? And what about the ones that are already broken?
> >>
> >> Well everybody that expects that driver resources are *not* accounted =
to memcg.
> >=20
> > Which is a thing only because these buffers have never been accounted
> > for in the first place.
>=20
> Yeah, completely agree. By not accounting it for such a long time we
> ended up with people depending on this behavior.
>=20
> Not nice, but that's what it is.
>=20
> > So I guess the conclusion is that we shouldn't
> > even try to do memory accounting, because someone somewhere might not
> > expect that one of its application would take too much RAM in the
> > system?
>=20
> Well we do need some kind of solution to the problem. Either having
> some setting where you say "This memcg limit is inclusive/exclusive
> device driver allocated memory" or have a completely separate limit
> for device driver allocated memory.

A device driver memory specific limit sounds like a good idea because it
would make it easier to bridge the gap with dmem.

Happy holidays,
Maxime

--62gvz4x3u7aurz3v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaUV2PQAKCRAnX84Zoj2+
doBbAYCwC6GM+nDbVQ+qPSj3EG6TPcebfy5+uYyIL8SOICJl/3ohBlkB/AN0k0qs
+sZn+aYBewZWQxkmfc2iSOFLjm35fV4hD2oDDGu74kWLPPrJefPelEf0OooFJoux
CX9E84nf8Q==
=seo3
-----END PGP SIGNATURE-----

--62gvz4x3u7aurz3v--


