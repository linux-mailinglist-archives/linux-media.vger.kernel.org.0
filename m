Return-Path: <linux-media+bounces-37267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFFBAFFC1A
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 10:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93FA93A1CD7
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 08:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D92E28C5CC;
	Thu, 10 Jul 2025 08:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="K0RiQHIW"
X-Original-To: linux-media@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59129286D55;
	Thu, 10 Jul 2025 08:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752135871; cv=none; b=Ua2iOuKLzQY3OTLFZtBG1Xw9Eq9xoDD1Xd2TuqUZNtaLDAOp5bm4bHwJ2MYIjIpO1VcJ/leykypiYgVa+B7kdtr9lDqhe5C58FiwYGqcj+XPAqUPxeCCrqkr2DxyaMUCjyoqlMSP+tSPWtwn/tPy//UnNjr/yxi0p+YrHb8nA88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752135871; c=relaxed/simple;
	bh=HaTdolnUZbkwC5qeDXCjTRC1Si57s5ggTljhTLmb+mE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n0gehJueAQdlHfx7esz2uRujFg873lW8yZHGJLaDv+LVcFFeUlJd0V8CLdiU9BBiD+3AbfafEPB3NJapu32ETSQqOfPWuuSeB0QJCRZegF+fk4Hkubg8QTMmdkrmP9X2tzrqAGE/FswuNp0HjyEK5UXUg08H47L8eVNPtROSRio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=K0RiQHIW; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 167861C00A4; Thu, 10 Jul 2025 10:24:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1752135865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=pDDwx/8Xa9qxt/kIJD4o4HRI/VK/dHZbF4B5VrNxjo0=;
	b=K0RiQHIWBElKO73p34htQt7Pb7ZxY3ubIf0tapH7e59Cr7bzz+sphMPbWuMEIACfLhBezv
	erCQD4k2aJdKVkSu/sAeqar6JD9UYx8/gAgiamoD1G7l4lIFKaLobMcoU9oVlbFn1mGPKZ
	gK73YxOMaDlRlDONVISXqFKjqJkMLvs=
Date: Thu, 10 Jul 2025 10:24:24 +0200
From: Pavel Machek <pavel@ucw.cz>
To: kraxel@redhat.com, vivek.kasireddy@intel.com,
	dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	kernel list <linux-kernel@vger.kernel.org>,
	laurent.pinchart@ideasonboard.com, l.stach@pengutronix.de,
	linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
	etnaviv@lists.freedesktop.org, phone-devel@vger.kernel.org
Subject: DMA-BUFs always uncached on arm64, causing poor camera performance
 on Librem 5
Message-ID: <aG94uNDrL1MdHJPM@duo.ucw.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Hy5IfTgkPzmMQMNi"
Content-Disposition: inline


--Hy5IfTgkPzmMQMNi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

It seems that DMA-BUFs are always uncached on arm64... which is a
problem.

I'm trying to get useful camera support on Librem 5, and that includes
recording vidos (and taking photos).

memcpy() from normal memory is about 2msec/1MB. Unfortunately, for
DMA-BUFs it is 20msec/1MB, and that basically means I can't easily do
760p video recording. Plus, copying full-resolution photo buffer takes
more than 200msec!

There's possibility to do some processing on GPU, and its implemented here:

https://gitlab.com/tui/tui/-/tree/master/icam?ref_type=3Dheads

but that hits the same problem in the end -- data is in DMA-BUF,
uncached, and takes way too long to copy out.

And that's ... wrong. DMA ended seconds ago, complete cache flush
would be way cheaper than copying single frame out, and I still have
to deal with uncached frames.

So I have two questions:

1) Is my analysis correct that, no matter how I get frame from v4l and
process it on GPU, I'll have to copy it from uncached memory in the
end?

2) Does anyone have patches / ideas / roadmap how to solve that? It
makes GPU unusable for computing, and camera basically unusable for
video.

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--Hy5IfTgkPzmMQMNi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaG94uAAKCRAw5/Bqldv6
8pgQAKCIzyOsWHWgCDHHRvv8N/YvGO3c0QCdFeWLgWJbGw7+2Zf5gSBmRo2Gf5U=
=v0KO
-----END PGP SIGNATURE-----

--Hy5IfTgkPzmMQMNi--

