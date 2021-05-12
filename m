Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6386837EF41
	for <lists+linux-media@lfdr.de>; Thu, 13 May 2021 01:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238414AbhELXBD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 May 2021 19:01:03 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:56078 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347719AbhELVsM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 May 2021 17:48:12 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 5765D1C0B87; Wed, 12 May 2021 23:47:02 +0200 (CEST)
Date:   Wed, 12 May 2021 23:47:02 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     agx@sigxcpu.org, phone-devel@vger.kernel.org, martijn@brixit.nl,
        linux-media@vger.kernel.org
Subject: Recording videos on phones and camera on Librem 5 devboard
Message-ID: <20210512214702.GB27652@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Who is the right person to talk about Librem 5 cameras? Is there
mailing list I should use?

AFAICS from bugzillas, it is still not compeletely working. I see
megapixels packaged in the repository, but without required config
files. Are there work-in-progress configurations somewhere? Would it
be useful if I tried to get it to work on the devboard?

I created simple python+gtk+gstreamer application to take photos,
pictures and record videos. It is in tui repository; it is work on
progress but some functionality is available on PinePhone, Librem 5
devboard and a PC. If someone could test it on actual Librem 5... that
would be nice.

https://gitlab.com/tui/tui/-/tree/master/cam

Best regards,
										Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek


--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYJxM1gAKCRAw5/Bqldv6
8vnoAKC3leq1zUjg3+oG0fXWK1p7bWRBKQCdHMD9RUIo4TUphX7fU7HiTNqy6ZU=
=5ayr
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--
