Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31C40F5F37
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2019 13:57:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbfKIM5C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Nov 2019 07:57:02 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:35277 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfKIM5B (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Nov 2019 07:57:01 -0500
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 72DDFFF806;
        Sat,  9 Nov 2019 12:56:57 +0000 (UTC)
Date:   Sat, 9 Nov 2019 13:56:57 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Stefan Monnier <monnier@iro.umontreal.ca>
Cc:     linux-sunxi@googlegroups.com, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [linux-sunxi] Re: [PATCH 1/3] media: cedrus: Properly signal
 size in mode register
Message-ID: <20191109125657.GB845368@aptenodytes>
References: <20191026074959.1073512-1-jernej.skrabec@siol.net>
 <20191026074959.1073512-2-jernej.skrabec@siol.net>
 <20191104100228.GD502900@aptenodytes>
 <7309638.L6IRxaGt1L@jernej-laptop>
 <20191105081034.GC584930@aptenodytes>
 <jwv1ruj7on7.fsf-monnier+gmane.comp.hardware.netbook.arm.sunxi@gnu.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline
In-Reply-To: <jwv1ruj7on7.fsf-monnier+gmane.comp.hardware.netbook.arm.sunxi@gnu.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--gatW/ieO32f1wygP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Thu 07 Nov 19, 09:24, Stefan Monnier wrote:
> > Do you know if we have a way to report some estimation of the maximum s=
upported
> > fps to userspace? It would be useful to let userspace decide whether it=
's a
> > better fit than software decoding.
>=20
> Even if the fps ends up too low for the player's taste, I can't imagine
> why software decoding would be preferable: it seems it could be only
> even (substantially) slower.  Or are there speed-up options in software
> decoding not available in hardware decoding (such as playing only every
> N'th frame, maybe?).

This may be true for the Allwinner case as we know it today but not true in
general. It could happen that the CPU is perfectly able to decode as fast a=
s or
faster than the hardware implementation, but userspace would still try to u=
se
hardware video decoding when it can provide good enough performance so that=
 the
CPU can do other things in the meantime.

Having a good idea of the expected performance is important for userspace to
make this kind of policy decision.

This is kind of a common misconception that hardware offloading always impl=
ies
a performance improvment. In our cases where the CPU is a bottleneck, it is
more often true than not, but this is by far not true in general.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl3Gt5gACgkQ3cLmz3+f
v9G+SQf/VkRK362zU+fWkU5EBkELTY0Sc9p6L4QbI9EJuQxHG4d6HimlPe7D2d8N
QVMKBoyL5Sy1bH02gwOwdqiCDWLdJRhLVqT0utO102Hl0kTA4///BZPXhPg+9eLX
Uw/gQA7tXTMH2qeT+VcP8DjcB9GKpFw4o5gpwDG1d/UE+hPBfKvqtI4zhh/GFz/l
FfXxD/SrAlDzjJQiHjxVGWSuqXn7GI/zoxV9r/A13WT1axiLgXt96RtiMZuIXg+4
FIS3K0LKB92gNA/eQYbwPCQjtrumoTA6r32t/zNzPDIRNE5J+fN53iSpcpB4pJfP
41eUPKEtTNQyum2cmUj3e50dl3+wWQ==
=/o/m
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
