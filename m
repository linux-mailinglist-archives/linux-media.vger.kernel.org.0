Return-Path: <linux-media+bounces-13319-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC565909CA4
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 10:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E4A3B210DC
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 08:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3BB21802BE;
	Sun, 16 Jun 2024 08:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="YXkojlq5"
X-Original-To: linux-media@vger.kernel.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22E416DED7
	for <linux-media@vger.kernel.org>; Sun, 16 Jun 2024 08:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718527230; cv=none; b=S5UTn9wtr9UUbYraxivav9EV5ylc4MtSI0Ex3Y011yAo9Ad6SKxZYSnd9wFebFn1RsFTd1+N7Q+KhA1gQIruH52xZ6R+OTHBo1dvq6FfhEtT3P2SCzv1t/Jv58HsCTBMUoowQl6Bspbb1Wypm/5d3UuYe+tcO7n6LqHYMPS5SSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718527230; c=relaxed/simple;
	bh=Rwz1eLyDZpyGaLmV9Q6EQj0tE8TAtj2wYn3Mrp5X8eE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VPbKMrdJDz+uni5eV/zptUS/8B9dbYoOmYsLYvvhDVWfesCt4C7crakhl2sVj0fldN3qN9lObc5IwimA7kdx6m2hHrQod0dM6yPhZ4e8olbhfT8kgUzJ2uEuDRRMKcu3XfaPu+6NfkyMB8ooBZK7JUvBmNmGGTSy/2MDAwrgr1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=YXkojlq5; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1718527225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mNi+PH5RLD8itRn2E7pfwYYjUwdKdnKZfifQMNUnJqs=;
	b=YXkojlq5by40U31tFBjqxq/nApInlzg7NQ9Z4bKdJ6DN1iO80ZMTh2XQYaBljkldMgRgrk
	GDuQjOAZSvwcKokqN403t3N5OT8XVLIX9QEK81TLScI0o4oJYO2HOdc5uU29BZ2vTyIxrB
	qrwo4fJE0djRRUnIS/zKPJUZty6/DqlPOYKWr+6O9XMOg/j2jbbnwuA5hFA/1+q3YS/Pks
	bUIaupqS3tLMymFwoIOa3cCzjwuxE06SZIeCqURbyNcyeVLunDDYYLr+WNEfAYyuO8Jesp
	M9u87B2dPbjTJW/PO8MjPxHo5Da/GQCg3Rs5pjAZMTutPJchGM3a8pnO5ehltw==
X-Envelope-To: detlev.casanova@collabora.com
X-Envelope-To: mchehab@kernel.org
X-Envelope-To: robh@kernel.org
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: heiko@sntech.de
X-Envelope-To: gregkh@linuxfoundation.org
X-Envelope-To: sebastian.reichel@collabora.com
X-Envelope-To: dsimic@manjaro.org
X-Envelope-To: alchark@gmail.com
X-Envelope-To: cristian.ciocaltea@collabora.com
X-Envelope-To: andy.yan@rock-chips.com
X-Envelope-To: linux-media@vger.kernel.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-rockchip@lists.infradead.org
X-Envelope-To: linux-staging@lists.linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Diederik de Haas <didi.debian@cknow.org>
To: linux-kernel@vger.kernel.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
Date: Sun, 16 Jun 2024 10:40:13 +0200
Message-ID: <5087685.q4sLEYJVHI@bagend>
Organization: Connecting Knowledge
In-Reply-To: <5969581.LvFx2qVVIh@arisu>
References:
 <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <3333233.eAoTOS8U2s@bagend> <5969581.LvFx2qVVIh@arisu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1990021.sKJYiLvgGz";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Migadu-Flow: FLOW_OUT

--nextPart1990021.sKJYiLvgGz
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
Date: Sun, 16 Jun 2024 10:40:13 +0200
Message-ID: <5087685.q4sLEYJVHI@bagend>
Organization: Connecting Knowledge
In-Reply-To: <5969581.LvFx2qVVIh@arisu>
MIME-Version: 1.0

On Saturday, 15 June 2024 21:44:32 CEST Detlev Casanova wrote:
> > So is this just an (unfortunate) use of the same words or is that wiki
> > page just wrong ... or better yet: does rkvdec2 support RK356x too?
> 
> Yes, the vdpu34x decoder on rk356x socs should be supported by this driver
> but I don't have boards to test that unfortunately.
> 
> This might also be used on future rockchip releases like the rk3576. But
> they all have their own adaptations. If you can test it on rk3568 based
> hardware, I'll happily add a compatible for it.

It would be great if you'd add a compatible for it.
I don't have rk3568 based HW, but I do have rk3566 based HW and AFAIK those 
are the same when it comes to the 'video' stuff.
--nextPart1990021.sKJYiLvgGz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZm6k7QAKCRDXblvOeH7b
blJqAP92iJCMOhayMHvD+XK8tlKapsot0g/Sv96s1CPReip9CgD8DvR1XoZ6FF1z
JeqgYTTZPYzljJdmx1CrAs8vEW6LKwI=
=aEUC
-----END PGP SIGNATURE-----

--nextPart1990021.sKJYiLvgGz--




