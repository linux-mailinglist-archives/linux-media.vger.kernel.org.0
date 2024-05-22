Return-Path: <linux-media+bounces-11736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FC18CC237
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 15:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FB69B21FE4
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 13:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F65140381;
	Wed, 22 May 2024 13:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eMXd6peJ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEA413F44F
	for <linux-media@vger.kernel.org>; Wed, 22 May 2024 13:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716384899; cv=none; b=eDfSYgFWLgK3Fr3q71cXyLQkD2lMk1pPU+WSUW13i3+CZO46aFz+tVsHV+jznM6EW+t7UAyxTxha8WGBzdciUIV0mp0s6UuE2PNbJkUa2Q/2f0yrO8AZ5+G7KBLeyzVPt62aafG/8JTJxAy2O0kUFeMAndv6vAt77VXAY5jkZPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716384899; c=relaxed/simple;
	bh=9csiwcmOfg3mSOV0xDC+NQzLfT9XUuA2G1lm9ivaPcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xwiv5MrsQD7umQ7wnYtpl3Z9dWCH9S4BrN5II5wFHtGi1+PHaTTQuYNnZbvdW8gW8oxOktrlWEApAkKjzQLKyro3MjXSaDG6Rl32sIoq5L5TlH+Jul3h8lOREn7E31FQpQ4yyU/wnovaIe1UDGhUnAxVWI7X6P+EhN3JiASvXHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eMXd6peJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716384896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dUqK+C+8pYfPJIKtQMFJE42yDM9CCMGY3faQLsz8g6w=;
	b=eMXd6peJ8uAJbBm8BoOMuw+XDpZ2u38VG+f7XJ4LW+WZbwxOq4B0ewWuJCePFzRXIl8o38
	Ox3KEq3BvC6U91clMb+RSpvbuDqUsJnK8hQfv7M7iLevx/UeYe34Q8mx4sLKoiVvgGpR/d
	VgMnji3cQNlUZ+QrdyUpbGqq96fXyeM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-0SYf7TlbPyekQbfInVM3Mw-1; Wed, 22 May 2024 09:34:55 -0400
X-MC-Unique: 0SYf7TlbPyekQbfInVM3Mw-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-354de3c747bso394079f8f.0
        for <linux-media@vger.kernel.org>; Wed, 22 May 2024 06:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716384894; x=1716989694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUqK+C+8pYfPJIKtQMFJE42yDM9CCMGY3faQLsz8g6w=;
        b=BlAJHZezeiTjhqsqjTcy1XTd757Hk2N4PyYi8TYInpi/kea8KUCbmWp4NorHa/kQjT
         uVY7Ft9LUHfY9RD1f0Mfn0DF6qjEur93l8VOboQ5zrU7Zwh+uVCMM7GdRbnONRW3VMFM
         uoyOJvLSIbKKW9daiyJjPtP0W1at5pbOUA9cnmqrpavg6fQxaXWKYyf/fDDvWmdMvs/U
         ZmjHqxNpKZh+eihK1dFdfL79ZLU2roo3CwTpLhlDtPQRv4Ro4K3Pty6WmvW60ZTor0Vn
         Q7SNnNvEHwuRydsguv7kiCn0058SJR1DCorEHrMy0Qgsnm9tV4fhgJPqdtZ2KumJt9PF
         ENPw==
X-Forwarded-Encrypted: i=1; AJvYcCX9JEeIlnYdbLcuFH4+OD+CcC/eXXvG0MyVFoknzkKQyxb3pgAuCt/B17acN07efA8AS5rFwVsUl/GTE2Qk/JZVR6qpNoPE/p9xaI4=
X-Gm-Message-State: AOJu0YxttFdjB6xLxXsykJsqqyclgWaUx83kHcL2JKXh6V6MhmN+KiKw
	ZFyZpc6dDftGSme7B+mG6DOqyknVm6oc/Js+BuH1w6fv0BMghk7o7FqNhgYJ07ZWobbzSwe7q7R
	r2wcgdpAP08NXLRZEWai58KtReDbsYfsepBgC6LTpsQLIMSGQSBZRr9EbEWrH
X-Received: by 2002:a05:6000:b8a:b0:34b:e446:3d4 with SMTP id ffacd0b85a97d-354d8da39demr1439954f8f.58.1716384893876;
        Wed, 22 May 2024 06:34:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErtdZkkoK6JkxFwy4LNegEoex81yx9NccIdCSNk/jLtIVySlgXMJi/3cvC6sJfv/m8nqQrUw==
X-Received: by 2002:a05:6000:b8a:b0:34b:e446:3d4 with SMTP id ffacd0b85a97d-354d8da39demr1439928f8f.58.1716384893361;
        Wed, 22 May 2024 06:34:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-351b55b4655sm27866245f8f.76.2024.05.22.06.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 06:34:53 -0700 (PDT)
Date: Wed, 22 May 2024 15:34:52 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Lennart Poettering <mzxreary@0pointer.de>, Robert Mader <robert.mader@collabora.com>, 
	Sebastien Bacher <sebastien.bacher@canonical.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Milan Zamazal <mzamazal@redhat.com>, Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <20240522-thankful-cow-of-freedom-f0cbf8@houat>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <20240506-dazzling-nippy-rhino-eabccd@houat>
 <ZjjdUBYYKXJ1EPr5@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="hxnhtv33zytmu6lb"
Content-Disposition: inline
In-Reply-To: <ZjjdUBYYKXJ1EPr5@phenom.ffwll.local>


--hxnhtv33zytmu6lb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 06, 2024 at 03:38:24PM GMT, Daniel Vetter wrote:
> On Mon, May 06, 2024 at 02:05:12PM +0200, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Mon, May 06, 2024 at 01:49:17PM GMT, Hans de Goede wrote:
> > > Hi dma-buf maintainers, et.al.,
> > >=20
> > > Various people have been working on making complex/MIPI cameras work =
OOTB
> > > with mainline Linux kernels and an opensource userspace stack.
> > >=20
> > > The generic solution adds a software ISP (for Debayering and 3A) to
> > > libcamera. Libcamera's API guarantees that buffers handed to applicat=
ions
> > > using it are dma-bufs so that these can be passed to e.g. a video enc=
oder.
> > >=20
> > > In order to meet this API guarantee the libcamera software ISP alloca=
tes
> > > dma-bufs from userspace through one of the /dev/dma_heap/* heaps. For
> > > the Fedora COPR repo for the PoC of this:
> > > https://hansdegoede.dreamwidth.org/28153.html
> >=20
> > For the record, we're also considering using them for ARM KMS devices,
> > so it would be better if the solution wasn't only considering v4l2
> > devices.
> >=20
> > > I have added a simple udev rule to give physically present users acce=
ss
> > > to the dma_heap-s:
> > >=20
> > > KERNEL=3D=3D"system", SUBSYSTEM=3D=3D"dma_heap", TAG+=3D"uaccess"
> > >=20
> > > (and on Rasperry Pi devices any users in the video group get access)
> > >=20
> > > This was just a quick fix for the PoC. Now that we are ready to move =
out
> > > of the PoC phase and start actually integrating this into distributio=
ns
> > > the question becomes if this is an acceptable solution; or if we need=
 some
> > > other way to deal with this ?
> > >=20
> > > Specifically the question is if this will have any negative security
> > > implications? I can certainly see this being used to do some sort of
> > > denial of service attack on the system (1). This is especially true f=
or
> > > the cma heap which generally speaking is a limited resource.
> >=20
> > There's plenty of other ways to exhaust CMA, like allocating too much
> > KMS or v4l2 buffers. I'm not sure we should consider dma-heaps
> > differently than those if it's part of our threat model.
>=20
> So generally for an arm soc where your display needs cma, your render node
> doesn't. And user applications only have access to the later, while only
> the compositor gets a kms fd through logind. At least in drm aside from
> vc4 there's really no render driver that just gives you access to cma and
> allows you to exhaust that, you need to be a compositor with drm master
> access to the display.
>=20
> Which means we're mostly protected against bad applications, and that's
> not a threat the "user physically sits in front of the machine accounts
> for", and which giving cma access to everyone would open up. And with
> flathub/snaps/... this is very much an issue.
>=20
> So you need more, either:
>=20
> - cgroups limits on dma-buf and dma-buf heaps. This has been bikeshedded
>   for years and is just not really moving.

For reference, are you talking about:

https://lore.kernel.org/r/20220502231944.3891435-1-tjmercier@google.com

Or has there been a new version of that recently?

Maxime

--hxnhtv33zytmu6lb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZk30ewAKCRAnX84Zoj2+
draWAYDLJIiS8Msi/y+wAUwHnzf1kXf7kVHqMhUIoYE8ndNmYlwqBzACVvj3PUVB
N0AgXyoBfioOGDi7CM19X5rtjvPyTVNdo3UuTQN/8N35V28aULcBS8FlUqHm1UCO
jZ9Oi4jvXA==
=rT0Y
-----END PGP SIGNATURE-----

--hxnhtv33zytmu6lb--


