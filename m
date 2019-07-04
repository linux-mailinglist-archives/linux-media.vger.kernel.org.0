Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B80F15F66C
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 12:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727536AbfGDKOY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 06:14:24 -0400
Received: from mout.gmx.net ([212.227.17.21]:38011 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727249AbfGDKOX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jul 2019 06:14:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1562235242;
        bh=QkCJpGFSgUNuFdvdF9lwK624srSCvigRjgWwmebE/P4=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=kRtRCk1NCtawiZKymneKJ1kr1gNqM/POpzAp1+WiyYsvkHS4ZVdXvgrSJE3Pmzvp7
         Eds2d3AqppDTIvPO6CgXTL/jorARVApABLf9OalSK/oCCFV3m457vG/6D+hrp9Zxwe
         sULfo90vdoATnobydHtTfVlvJlqoYtwNMNbGTtms=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([109.90.233.87]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0LiIgB-1iMjTm4Ai3-00nUMT; Thu, 04
 Jul 2019 12:14:02 +0200
Date:   Thu, 4 Jul 2019 12:14:01 +0200
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Brad Love <brad@nextdimension.cc>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2] media: si2168: Refactor command setup code
Message-ID: <20190704101401.GG22408@latitude>
References: <c28a0da0-7264-4d23-94f1-3bd614383843@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tVmo9FyGdCe4F4YN"
Content-Disposition: inline
In-Reply-To: <c28a0da0-7264-4d23-94f1-3bd614383843@free.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:wD0VADbn4aMPuFxFWljJEsbuN/IC/v2ewNlb0Sp1w9t1uRtQKl3
 cvhxKK4wBETkDdq6Y8ZgRS/fa0scWKAqD2sPPrUK4q+Xv9x0obPXwNOVm2YIzX9p+K9eyuT
 Q91UvOBKWoPckMerhMat7c6wV3ZyfmXnZFtckijopeHHXgprXs6EjcyGcfqO1aB07okex1f
 k5WxyBlnR4owuDpxwCB+Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OuPds79/bws=:HUsAkxiPEFy5oWxjUPaiyL
 Hg9RPnHZ0wpMLcuAcnhl4A2SJkU8S76p+j5m+QbMYj3+yZOg/tC8/5uMg4GxVQC2BahOrLb9m
 sytMd5Hz84/vGHEzlCV422MYwgpI/G3v3mmMEImfkPZ7mgi9bBgvl6QLe3GDEPuSUTdzfKmIF
 iD3X9lDgQBO+7wE4OMxpww3fY9k9QB1k74Rrm9hhECyWVZ9a8VpbrDuStPgLnHdjjvu/Pn4aX
 3a1GHbvLstOg35ZVAY/ZK2mKv7t0i1ZLQAG7VhsTTFZgaABugllIRCldHUactswXzTHrgVgRJ
 O6cnk0h9w48Qw8LdhpWXO6p1TFCggF3fuMh4gO+rrLO3+FCl6I37Ked1bu+X5AKqHpeO43gam
 lLlg3TRySGS+9VUVGuv+b2s3ZENVHxRihfdN5KI/Knd7A8h94e+P2ldiTLD5eYHwM5udHwpA8
 GxfWaNr0Ezji3ziZXCZKQEJjfcu9IVXdRIEQCD/zm9a1OKsiPQpgUNYzYWJt5uUIiP4fnonSY
 1Iw42q8Fd+vesHFNnWZhFou/J/SC4eAp6NqqmrgZjkywM4WR4Q1AY8g/qXXY3oxM9t/DROV6W
 kc0nsF+HSIcCbzdAKc+atBKQyU55wNr8UdNDUxErtG6rm/Kn9/kraNDKf8fnW4lDTELl+Fa94
 wVSO/aoMrfYo4km71Y68YacQy1gkrVi9dKJZ3Ymdw1o4u8pk35zuTLRPpHakWzZRNSQY2Pdde
 p7Cuc7fylRnNdiezaWTZ5wunvqOoR65Z4FYX2jt2pe7qNQdgN0zc5MgOXwGBCiQhdeKDPTveL
 P0JCHnueUtsEHTEqVx2A/QEiBNj9v2BZQv3ODqofoZ9WTj4uXpsTRzvsGZF0jaYpdhQIE7ODn
 DhM6r8bIMRm6+ZI0ZUKuqC0n1VpAhTZzxARETEVrG2fme71K1ENW7aXruuiSpR5VONbZzsXIt
 69L//JqR4ZD1B/xhlToHe7I++kpm9S31BOGaYtZlJb8S9wYenV5MUQuYoddaSP8E9lLk2Akwg
 +uB+WpDPiJw8/UE0iE3szXJ4JnsszrH9EPy16p3e6v3ntYOQH7uYv4okRg6xMGU3iJSVt3whw
 WgVZ9OjnRkWXKk=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--tVmo9FyGdCe4F4YN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 04, 2019 at 11:58:45AM +0200, Marc Gonzalez wrote:
> >From ceb5f687f3f7dab2fb9d5b34408d9cf83a0be228 Mon Sep 17 00:00:00 2001
> From: Marc Gonzalez <marc.w.gonzalez@free.fr>
> Date: Mon, 1 Jul 2019 12:58:31 +0200
> Subject: [PATCH v2] media: si2168: Refactor command setup code
>=20
> Refactor the command setup code, and let the compiler determine
> the size of each command.
>=20
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>

Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>


Thanks,
Jonathan Neusch=C3=A4fer

--tVmo9FyGdCe4F4YN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl0d0UUACgkQCDBEmo7z
X9u1Uw//VzQPr9Ez7Z8bLgzo9u7ElCsmMWEjQhAL05Zvk3O5fxZbwlQYuH4cI2Vl
rfSwXqOyHoL+6IElX20nPNl4wx+QXMPNAVojH/swSbd2ImO36O/WyUB0DLJ3cdE5
bUhDCIO/egGGQIlgZx5eqhYeFyhTCvcswMBJr5v3bDLyirf9/E+7EzrdR94c9WMW
ggjlDcU9qh38wIUGS2kX+lZ6TZsP0O9YUV6Ya/K5lyJVJf/beFUSwD3czFFSdqt9
agjdUJESv6v93VFodIl5TF2Ql8wFy1SwTzCBA4neZKRuCCZk2PdzXtAe1Nxuc0z/
Id4U17o7bBuHz21MwNkE7E7C9TdEcZfbGUBdKkmlqpLl8vehD6tWVkbQj5EKWcxl
ZPwKyEiNvPSfgkOQ/VS8TkcRGpjulMw3eglZchnHnkQR0ERON9R7L7eBqYhZm9g+
USGrySA+1CA9hZ2B6nnZaYRahXshOCn577fHRXH87bGxOHgjaVDrNrIMJrUkDFJw
IQfyaZk8GDkpf5LF+OBWKXrxg2vYGmzSu8lleY9cFWM1PTBp1M1CfqpiFbcWkDHl
7SpK5kDRMWdkECunnE/nb3lQ5JlGbA9Tznqzwfna19bxKplc6k0WXtLGlqfAiHqu
C6puCwGkaUP+i/YLbaWIG90WL8Ja/dQHRLxBgsOYxdTfERTYMKE=
=0Q/E
-----END PGP SIGNATURE-----

--tVmo9FyGdCe4F4YN--
