Return-Path: <linux-media+bounces-12767-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7658B900B92
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 19:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13BB01F22B7A
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 17:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA4119B3D2;
	Fri,  7 Jun 2024 17:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FPZ+d/fE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F8F1A270;
	Fri,  7 Jun 2024 17:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717782906; cv=none; b=KjUfx48g/ugWCQ7iAmPJfH2vajCcinpadR/SdY4zBfnZ5X/a8AmcRBCLCvM1ukiQuYrGY7e1/5tkaMc6GHTCvpV1mID58ziwiqHVId2yXW1xOXv70/9dmOFPq2rRTV7FijmG8tYnx1fgI03rhI8QvC/5qgQiFCGWufcz4cZ/7z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717782906; c=relaxed/simple;
	bh=HD0CNJsnyrAY0zkA4I2PSdkOkOGbjF8U3akPL1ESpAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KiBSLM2RRjGDpQ4BLyoyGp+cB5OOJfFOZ63g3v4iDcgwhzBNFQ4kQBAndMJmEdMbNS2eyWnxIVKtemVgYTPilNvHzuwNubVXqU6nnh0qtLre3eIj/ZmunNgXmuKnY8B6ia20djSMz8WbzaL7jpHHFDFN+Jpx4ytnqCWefe2bGyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FPZ+d/fE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8444FC2BBFC;
	Fri,  7 Jun 2024 17:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717782905;
	bh=HD0CNJsnyrAY0zkA4I2PSdkOkOGbjF8U3akPL1ESpAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FPZ+d/fE292ir14XQOlp1qgh6VU8SzmRuxFG28EUAlxlxCQ2GuBtBdspfMqRMGYL9
	 OS5/E57lFwekOh4/bsAVHT6/E3l1tpnQOfsr0lK4cilEfwn3z0stB2Byi030AfK9Zc
	 xzUopxz6oIX8bSj1BHuUCFuBDXrT9eOHXbN5ofHBu2UbYxBceKuS4/y/pYsdErpolf
	 9Mro+gfV1/sGKh61DTzmaZaCvf2XmojTsnYuuUfvoq7jBsIuk/4JmONDKiLAhuHI8p
	 qoVZzzeNw8t31MfZk6szHmZQfd+qqVZkhJT3r1giRCRWdY+dOCb/lw/H1vF8lNUKYe
	 pj0zFQeSmtKkQ==
Date: Fri, 7 Jun 2024 18:55:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Adam Ford <aford173@gmail.com>,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [PATCH v1] media: i2c: imx219: fix msr access command sequence
Message-ID: <20240607-celibacy-contend-c4a6be15804b@spud>
References: <20240607-trimmer-pummel-b452ed15e103@spud>
 <20240607155704.GB1242@pendragon.ideasonboard.com>
 <CAPY8ntBNNOFR1nn05g4Y-SOv_tN0YJv9wygO=+S80-zA1oq7mg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZHqfjYu5ggA4rXeE"
Content-Disposition: inline
In-Reply-To: <CAPY8ntBNNOFR1nn05g4Y-SOv_tN0YJv9wygO=+S80-zA1oq7mg@mail.gmail.com>


--ZHqfjYu5ggA4rXeE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 07, 2024 at 06:29:49PM +0100, Dave Stevenson wrote:

> > > ---
> > > I got the report of this third hand, I don't have a device and can't
> > > test this. I do wonder why the RPis get away with the sequence that
> > > seemingly doesn't work for the guy that reported this to me. My theory
> > > is either that they noticed the sequence was wrong while adding some
> > > other MSR access that is needed on this board while either cross
> > > checking the values written or because the other MSR accesses didn't
> > > take effect.
>=20
> Did the change fix it for the reporter? We're using the driver with no
> changes to the register settings cf mainline.
> Why it works on the Pi but not on a Microchip board is likely to be
> something quite subtle.

I've asked, maybe it turns out to just be the first of my suggestions,
and they noticed it was not matching in passing. They did introduce two
additional MSR accesses, both outside of the range documented in the
datasheets I could find online. They did have explanations for what those
undocumented MSRs did (0x5040 and 0x5041) in the mail I got, but given
it's third hand info to me, I dunno if we have the datasheet etc. I'll
try to find out some more next week.

Thanks,
Conor.

--ZHqfjYu5ggA4rXeE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmNJdQAKCRB4tDGHoIJi
0hcbAPsHvPUOTSJc2HpAEmSrUMUDYTe9VQQ4vevAj/EA8dGIagD/aBBdj/I3srth
4UOhyFkHCKR8pWt06mPdRr0fHvuI6gw=
=snAw
-----END PGP SIGNATURE-----

--ZHqfjYu5ggA4rXeE--

