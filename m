Return-Path: <linux-media+bounces-13869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BADF7911291
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 21:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED5C61C223E9
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 19:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 078851B9AAA;
	Thu, 20 Jun 2024 19:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ht++Brg+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E542C43156
	for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 19:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718913129; cv=none; b=DtGSi/pL0UmZKg9ShOm9etX9ll6hIUc0h6VIOyGHDXkTT5FjEWpKBHvaNR781ZbT4/o43YsF6qXS8S5EQ2zPMrxYh8GnIH7uJSqDTS49NEz5vvTAGSOfNEUO7sPgep/SiOMfaPMur5tfxGRxotVzVW5cGcak+BzBjMpg1iQHO4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718913129; c=relaxed/simple;
	bh=Lxd0A/ymLlgq1NLAqH6gp+Tz2Z6MtWZaGRa9lnIZxqo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nIfXWUE5/Lv5b5glNf6AB5mHim2KNcvqc/gDJNGHyPpc7TC8HdM0lzcWv5GjjSNyYuADvPn+4V/YszHIxC4hsxfNRfbjrs0NtfsFyPMKw0bO9pUaeeNJWgMbfHDo9zmKvbRayP4O5jfzTvZqbFLOMe8M6YfVc+dIMn0XWLOl0pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ht++Brg+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=3Qjr
	Tfewunqmi3guALSlW/rkGvjYxvnEYinY9sCdl9Y=; b=Ht++Brg+BuUEpiUw5rpm
	6YLa34uYyKC3yzPzEW+ondj2eSAvQ1oXGdCJwwe9uMr538fKmYdD0MFdeMnPCCXG
	cJLwF2rqp4eprH13I05panG/+W2f3G5aSXJh/+5/6H+vAnc7ocOAtmBkiR0fF9J5
	D9VfZUtnGKwQFUvXiIiRtX1Gr30obQEDAncuSclWHvNM5pnDnfjqeYjdNHOIFUFr
	lco3lEySTJK5gWWGEBHZHp0LLoXMeAeOWZiY5OEUFOjeRVECGGfEnMOPpntk+twm
	gGa+kfu0NZgQh6CoGiJa4BCwtXLJcCW/XBKuqDKeKQjRn+RK3ssiigSx+QeWrQQv
	UA==
Received: (qmail 1130492 invoked from network); 20 Jun 2024 21:52:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Jun 2024 21:52:01 +0200
X-UD-Smtp-Session: l3s3148p1@tsT1pVcbNNRehh9j
Date: Thu, 20 Jun 2024 21:52:00 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Michael Tretter <m.tretter@pengutronix.de>, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/8] media: allegro: use 'time_left' variable with
 wait_for_completion_timeout()
Message-ID: <edc2zis66qqgmu3xqlzknzvlnqpvf2r2bk65mw4zsqlt4q5t23@ytewfthk7iyv>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Michael Tretter <m.tretter@pengutronix.de>, linux-kernel@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org
References: <20240603092841.9500-1-wsa+renesas@sang-engineering.com>
 <20240603092841.9500-2-wsa+renesas@sang-engineering.com>
 <ZmqwQV6Qm1kqoM8t@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3wxoheqr4jg7zx7s"
Content-Disposition: inline
In-Reply-To: <ZmqwQV6Qm1kqoM8t@pengutronix.de>


--3wxoheqr4jg7zx7s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

> There is another instance of wait_for_completion_timeout() in the
> driver, which uses tmo instead of timeout. Maybe this patch should
> change that, too.

Good point. I will update the patch (after waiting some more for review
comments).

Thanks,

   Wolfram


--3wxoheqr4jg7zx7s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ0iFwACgkQFA3kzBSg
KbYaqw//eCYthXAFAaVKFBP+MfIxhZQtHZi1Ppq46rI4tMXIRTOXOE9dOJ9QCqjg
EcBZRtASSONq+L8CtGGTWw37SB1chASN12JWN7Qkzn0YKy5v0Xc7fmE4XZJlHA6p
GEmQkAIBrsY91u51byemHY+DZnQSVNHtD6CTTZiRzKkpM02pRQXrqYPuLZLF/6Xw
p2Q7VzC2q8Mow9AE/fOMmg7KajgXGxF84HQ5njS58KF2NgKOntiJIsMOySG9zUA1
faL9jBrdTAU+UsstcoZmYXN9kU46gxdJHC1E4QQMwv8ahHngM9TFWr05Tcw6Zzfx
6OLQWdPvTID3QzqRazSc32tdVEcwNG4pAVHu829EaXI/ARYw/+v42IVHDFsJ6oXd
N6yTEkbebS1/xa6qhCasuyVap2mQMQK5YI7ZezpoIeOd0UeV2xsAfMBniVGySVpR
By1umiXcKJBdbsqlEfcpJEsSjyrJtUrxX4YiuDrBo9B+yrtP1yiDhl5ScWm/G0Pe
WtbGSYeQfBMBFyH/oDHlvGg1P09ZshYqztoDUOFWtslAzsaG8CP7u4xUZgRQ7CtI
W62Tox6WjRGp2LjeOFJkJdXvWIi8IWoPBmG2YDQsZpi8mJGod87IGY2Ykj22PMbt
f+hYdF0Hr55yDT7eXmyEh8HkRDf8Pb1ytaJqkPOT0gCA9pDYql4=
=iqhk
-----END PGP SIGNATURE-----

--3wxoheqr4jg7zx7s--

