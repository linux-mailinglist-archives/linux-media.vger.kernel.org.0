Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C031E4452B1
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 13:07:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbhKDMKT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 08:10:19 -0400
Received: from comms.puri.sm ([159.203.221.185]:38310 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229809AbhKDMKS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Nov 2021 08:10:18 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id C67B4DF574;
        Thu,  4 Nov 2021 05:07:40 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 0IrDUh3k8UZK; Thu,  4 Nov 2021 05:07:39 -0700 (PDT)
Date:   Thu, 4 Nov 2021 13:07:27 +0100
From:   Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@puri.sm, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] media: imx: Remove unused functions
Message-ID: <20211104130727.36c3813f.dorota.czaplejewicz@puri.sm>
In-Reply-To: <20211104113631.206899-1-dorota.czaplejewicz@puri.sm>
References: <20211104113631.206899-1-dorota.czaplejewicz@puri.sm>
Organization: Purism
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q5PI3rGK1fl9l5ev1Vw220r";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/Q5PI3rGK1fl9l5ev1Vw220r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 4 Nov 2021 12:41:53 +0100
Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm> wrote:

> Neither imx_media_mbus_fmt_to_ipu_image nor imx_media_ipu_image_to_mbus_f=
mt
> were used anywhere.
>=20
> Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
> ---
>=20
> Hi,
>=20
> Compared to v3, this patch series introduces the checks of imx_media_find=
_mbus_format return values in patch 4 and 5.
>=20
> Cheers,
> Dorota
>=20

I should mention that this part from v3 still applies:

> The use of `v4l2_fill_pixfmt` comes with the downside of breaking 10-bit =
Bayer formats, or at least until my other series gets accepted

The other series is:

Message-id: 20211019114718.827400-1-dorota.czaplejewicz@puri.sm

https://lore.kernel.org/linux-media/20211019114718.827400-1-dorota.czapleje=
wicz@puri.sm/

Regards,
Dorota Czaplejewicz

--Sig_/Q5PI3rGK1fl9l5ev1Vw220r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExKRqtqfFqmh+lu1oADBpX4S8ZncFAmGDzP8ACgkQADBpX4S8
ZndeGA//eby98r7C2ZuWtSUGEfYITeItVE2TPkuNSLv9JPYAv8kSLepsXi5hd0uR
kxavcUBlnPgpUDFW4JlfU0YKiXgA9Y3uESBPrGH9DVg7WbQbFsRU6E89CLnwqlM8
g0Q3ssCKHnj/pa0aQLB8V0v0ObD+qq3ymWCiwuEmsGqSBkFo3vigCiOYMSkLpBVJ
W+1G4sUTOLjhaCPUpG7BuRzUusWrB8zwY9wdR+TV/hCxDKtn202WRn/XllaJ/dKq
4Utk+UUYY1qTpe7iv/QEa8t6KX5Di80PqE5/DzMbD/tvHwqPpXJlcqLn8jJ2NF1c
soPTN+/tVw3GLWwzke0CXNt/1vkAxPHZTxyliI8tROfS9qQqGH7hZVW5uPweQVkc
3KzyTBbJ9BUGAtVBMmaax0Y8mjD4VasQsGVR2eTgeLyPYggQZQEd+f73QKXgbwnb
My/Duyc6JFwxfG80sAHpwgLk2wdpgfKpbSnFvk0zq1yQKvF2IQ6mQ2ZodqLERKYc
VWvkkv0u3pxho8GhIFN/xM7nR/btWEO070BX1PSD1Hk40IRG5/ESLgr7zkcEoQ7J
c9gdSjeBGumi4S0C+eeC7noSDR+YalBvNF5dVrRL06mkGxkHqcCUd9MrQz57xNZh
WffLh43mQEpJnWYu3lhQuSEkNPPkoRrV7lg/ClQEAbBneJsWMMU=
=mfUS
-----END PGP SIGNATURE-----

--Sig_/Q5PI3rGK1fl9l5ev1Vw220r--
