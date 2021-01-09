Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8EEF2EFF57
	for <lists+linux-media@lfdr.de>; Sat,  9 Jan 2021 13:15:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbhAIMOd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Jan 2021 07:14:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbhAIMOd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Jan 2021 07:14:33 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D7CBC061786;
        Sat,  9 Jan 2021 04:13:53 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id v3so7077376plz.13;
        Sat, 09 Jan 2021 04:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=zctrNyZGNRXLLOpyzhP9Lk7+QAPBbJgpD9SsDuS4des=;
        b=hL0JeNtjtg8dLCHAfWnPsW4hRMEPCLiV2gLD8rX2CpivUSriIMbUyJ7aavOZ29TAS0
         zMEqYpObsL1hUN9A8RsN3mWAQGDtY6jKQsXwrRlYQexh3wg+5YQyo8dPtO8UUvFY9vU/
         lHkjYqD8GvnLB42C3rreCWh7GPwl3EZbwJ3QLTOwZd9efOlphNfKAxGmbegBLTi/beuc
         d1Pl1xDjMVMybYtZ5AWP+q5KqTnRqlfh/U8IU/x5XazI2UXkW1jLwqswn54OnfAZEMwI
         811PSx/O2mWD0lCEWp5w+ZcTswMIjXFtqxnPsleiBNtmjMZMteZKjor5Wz3VGCmuVtRw
         q1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=zctrNyZGNRXLLOpyzhP9Lk7+QAPBbJgpD9SsDuS4des=;
        b=cJnAUqF4Lb1j+Y4KH+0LCIbAY3T0z5JTwbn7G4fUyHyTwiY0fHOUlorJB5tNUNDfPv
         GrBWLv7aD5DrCyyaYy4BYZViPJrVY6nj5n6Hsq0KLfC1pID7b5fOeKCZjMEEckQMcJJH
         R97Np9ZSoMT8VotAg6RFuj4q0kzXS66HXBMZ0HKjnaqNJh1nsDzZlK583VZzcyQYGhTi
         4VRPsc4fCmCuuPFnBGTNZnWnoBClj6ohPCXQkyFO5fiIU3rApzot79GDlMqIgVN3l1nZ
         +LzSl99LIESVN0xFjG3JULrO9gYPgKOLuBzzTuc5bwZZ/m4lm3NFosVjR2ovlITHeMgQ
         vy+g==
X-Gm-Message-State: AOAM531fzgTyQS+2U4RSM16lPYtPnN/+nOBeynAvVJOU8iW4QrI03SKK
        kjG1fU3Ty9WGY4jStijsaTU=
X-Google-Smtp-Source: ABdhPJyiNs/So4oCQvhV3GtWBG4CWOV4A/nDoh4W8LIPRbOqFzQZVT3kmCWWBGdZBdxpck1qlt+d/w==
X-Received: by 2002:a17:902:ac98:b029:da:cd0f:b6a4 with SMTP id h24-20020a170902ac98b02900dacd0fb6a4mr8378468plr.71.1610194432580;
        Sat, 09 Jan 2021 04:13:52 -0800 (PST)
Received: from localhost ([183.83.253.110])
        by smtp.gmail.com with ESMTPSA id r123sm11963982pfr.68.2021.01.09.04.13.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Jan 2021 04:13:51 -0800 (PST)
Date:   Sat, 9 Jan 2021 17:43:49 +0530
From:   Sri Laasya Nutheti <nutheti.laasya@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: media: rkvdec: rkvdec.c: Use semicolon in place
 of comma
Message-ID: <20210109121349.wuf7xpkqicjadlnf@nutheti>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zugsqpbzv55qcogp"
Content-Disposition: inline
User-Agent: NeoMutt/20171215
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--zugsqpbzv55qcogp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Line 146 had a comma in place of a semicolon. Fix it.

Signed-off-by: Sri Laasya Nutheti <nutheti.laasya@gmail.com>
---
v3: Corrected email recipients
 drivers/staging/media/rkvdec/rkvdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/=
rkvdec/rkvdec.c
index aa4f8c287618..d3eb81ee8dc2 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -143,7 +143,7 @@ static void rkvdec_reset_fmt(struct rkvdec_ctx *ctx, st=
ruct v4l2_format *f,
 	memset(f, 0, sizeof(*f));
 	f->fmt.pix_mp.pixelformat =3D fourcc;
 	f->fmt.pix_mp.field =3D V4L2_FIELD_NONE;
-	f->fmt.pix_mp.colorspace =3D V4L2_COLORSPACE_REC709,
+	f->fmt.pix_mp.colorspace =3D V4L2_COLORSPACE_REC709;
 	f->fmt.pix_mp.ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;
 	f->fmt.pix_mp.quantization =3D V4L2_QUANTIZATION_DEFAULT;
 	f->fmt.pix_mp.xfer_func =3D V4L2_XFER_FUNC_DEFAULT;
--=20
2.17.1


--zugsqpbzv55qcogp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCgAdFiEEXx10aON5ycvuBoyzehMF4uTokeMFAl/5nf0ACgkQehMF4uTo
keOvJwwAkBRovj9NfA2rSfBazuDwku9DOkGh5se9ma/zz7Lcs1iva7OE+p8HG2/e
m0SP+kH+mdKJMt2oxLwHfSNppCE+n3YImInVgkhnOT86cO6YQRGjcy/ONHSFFWVW
YyUSSMKOgAtPweSoeo2+cQHg4v2Pjf4bajgfqArXSel8ayhWgqJFB1cyxUwtekxl
lhG7vfOTUk2c9ySJz+T8uKQnWkxg6dzrSgHfCh4Ho5ylwKMRos3KtsG9REI6Uly4
qdGvMmfkOShpPdhYZq00ZMrTzZ67JPqPrySBjdtBtK6zDJnYZZfO91GgRsL+AmLT
fVuGWrd47JwuIOwnVabKQHZYdu4J2EnbH6t1unQRYIhHx4Illd7XOxn0KYCd1QbV
U9f+JcAIkHu97NNl7ZhjtJwoiCewwzoo+Nm0RqooHXZ6ZyXRcXr7k961n6UHtjNE
JXBEGLkA3LVojJv3tNcPNtin4sRpKCceaK3iBWE8UGqDXAHHnk+4TNT3cMHXFYAa
5CzjVree
=E7I4
-----END PGP SIGNATURE-----

--zugsqpbzv55qcogp--
