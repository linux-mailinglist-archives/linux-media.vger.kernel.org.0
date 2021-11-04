Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 815F744526A
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 12:44:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231487AbhKDLrZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 07:47:25 -0400
Received: from comms.puri.sm ([159.203.221.185]:37190 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231500AbhKDLrY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Nov 2021 07:47:24 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id A868ADFE44;
        Thu,  4 Nov 2021 04:44:16 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id LAqdrt1XkV3F; Thu,  4 Nov 2021 04:44:16 -0700 (PDT)
Date:   Thu, 4 Nov 2021 12:43:58 +0100
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
Subject: [PATCH v4 5/5] media: imx: Fail conversion if pixel format not
 supported
Message-ID: <20211104113631.206899-5-dorota.czaplejewicz@puri.sm>
In-Reply-To: <20211104113631.206899-1-dorota.czaplejewicz@puri.sm>
References: <20211104113631.206899-1-dorota.czaplejewicz@puri.sm>
Organization: Purism
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Hpyw1oqwQbxb4c7G67PFRHO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/Hpyw1oqwQbxb4c7G67PFRHO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

imx_media_find_mbus_format has NULL as a valid return value,
therefore the caller should take it into account.

Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
---
 drivers/staging/media/imx/imx-media-utils.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/=
media/imx/imx-media-utils.c
index c0a84c79947e..8646f6ba1108 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -544,6 +544,9 @@ static int imx56_media_mbus_fmt_to_pix_fmt(struct v4l2_=
pix_format *pix,
 		cc =3D imx_media_find_mbus_format(code, PIXFMT_SEL_YUV);
 	}
=20
+	if (!cc)
+		return -EINVAL;
+
 	/* Round up width for minimum burst size */
 	width =3D round_up(mbus->width, 8);
=20
--=20
2.31.1


--Sig_/Hpyw1oqwQbxb4c7G67PFRHO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExKRqtqfFqmh+lu1oADBpX4S8ZncFAmGDx34ACgkQADBpX4S8
ZndhaRAApw5LegIVY6suup1BvDOkatUqDIQtQRA/VeGHNvwUjUZ0pJuvlIHGCaDy
Eo9HPSUk9N+EaDsG/b/aLLgwxYBoKLC7yqN8LEupWny+y2aVsHHirNEzV9UUnHbP
mm3vqx8CBXPQ1MAsOfZyV3b3z/wGFaJoFnqltCqh5rvWZHNk+Kx29Sd8rQBmdv3J
95WUu3ab0j+JdRBRNq+lflyoBew2VbwNG4c5lwujiXNaZ57ZJUfHRwceaNdhZT67
iL0NVyG/AOkznFCYN2gi5SPzdUOrAG1z6aGrDik1zCwDaNkgkDlN5ohHFOs6/JgH
vz9s/SY1JKz7QjIBGt523vqXhTBQ3iowZmGqFGCPQOQMoRFUDBNZMUFKh6EdFmqC
DVwpy0dshpAQqcBtqGWZ13OaXPFdnG/1C+gNsiH0hm5ydQWrHcC2DIAaaOg9Yg/L
KvC4Uiu7nZ4j3TRzRWniCohycYjiTwYli8aKiWxwlY3rTfvMYt5XJ6oVkKh88ydW
okAlCG+a9dTm7I0kIiGUJN6gmxNmCcrLzn3ZVQHTGW9PxrrtB4x/83ytReb0jawW
D/6VqtpYRCZwOTgbvTRW7RDaJFlk3dtB10pWHSMzNGaO5KsUmSVpVxHTO8L6u3gC
C8WLQn6GqRymU7mwgRL+He/8wRe1FbIn9Ddfnhroud42is6sC00=
=eu3n
-----END PGP SIGNATURE-----

--Sig_/Hpyw1oqwQbxb4c7G67PFRHO--
