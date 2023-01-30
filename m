Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6340681782
	for <lists+linux-media@lfdr.de>; Mon, 30 Jan 2023 18:22:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237655AbjA3RWp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Jan 2023 12:22:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236037AbjA3RWn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Jan 2023 12:22:43 -0500
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A7A342BE2
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 09:22:41 -0800 (PST)
Date:   Mon, 30 Jan 2023 17:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail; t=1675099358; x=1675358558;
        bh=pmo4z0XPK0vRFYh8pWRCLi7NtxRhKqwfiEQHTG4Av6c=;
        h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
        b=Gm4N0z1QraydmYL1+18obnSdKX2963mMQeLVnDU84lwyZpJowkRJSoNFR0saWh8q2
         HyXm6zb+cmd4UdQscCIRy3ocbh+anQd73XngE3BvinG/eT/y6RgO0bXJ3e+XBqYZfS
         3k1GrpeNfm8i3eDeByjPM3/7YeqMUhy0Pa1U60QHUjzmDhkl86oahluFTuRgJo1x99
         n2Xzvhn8pGru9J59/bTOb4d7NQl1v/SNwKaadMBLO7/w20cyg293tDq0HCRZZT/IuD
         iD16fuhBzr8IGLTb1bqPBsqja6I8Z7/SK8HUFIASiSWoF7DjI8uU90i9r7z6YoqbZr
         a+PQtQ/pTNw+w==
To:     linux-media@vger.kernel.org
From:   Simon Ser <contact@emersion.fr>
Subject: [PATCH] edid-decode: print human-readable CTA infoframe types
Message-ID: <20230130172224.65193-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of printing the code, print the human-readable infoframe
type. This is more informative.

Signed-off-by: Simon Ser <contact@emersion.fr>
---
 parse-cta-block.cpp | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
index 02730a9eafb1..3a6be3972e50 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -2203,6 +2203,17 @@ static void cta_hdr_dyn_metadata_block(const unsigne=
d char *x, unsigned length)
 =09}
 }
=20
+static const char *infoframe_types[] =3D {
+=09NULL,
+=09"Vendor-Specific",
+=09"Auxiliary Video Information",
+=09"Source Product Description",
+=09"Audio",
+=09"MPEG Source",
+=09"NTSC VBI",
+=09"Dynamic Range and Mastering",
+};
+
 static void cta_ifdb(const unsigned char *x, unsigned length)
 {
 =09unsigned len_hdr =3D x[0] >> 5;
@@ -2218,16 +2229,24 @@ static void cta_ifdb(const unsigned char *x, unsign=
ed length)
 =09x +=3D len_hdr + 2;
 =09while (length > 0) {
 =09=09int payload_len =3D x[0] >> 5;
+=09=09unsigned char type =3D x[0] & 0x1f;
+
+=09=09const char *name =3D NULL;
+=09=09if (type < ARRAY_SIZE(infoframe_types))
+=09=09=09name =3D infoframe_types[type];
+=09=09if (name)
+=09=09=09printf("    %s InfoFrame", name);
+=09=09else
+=09=09=09printf("    Unknown InfoFrame (%u)", type);
=20
-=09=09if ((x[0] & 0x1f) =3D=3D 1 && length >=3D 4) {
+=09=09if (type =3D=3D 1 && length >=3D 4) {
 =09=09=09unsigned oui =3D (x[3] << 16) | (x[2] << 8) | x[1];
=20
-=09=09=09printf("    InfoFrame Type Code %u, OUI %s\n",
-=09=09=09       x[0] & 0x1f, ouitohex(oui).c_str());
+=09=09=09printf(", OUI %s\n", ouitohex(oui).c_str());
 =09=09=09x +=3D 4;
 =09=09=09length -=3D 4;
 =09=09} else {
-=09=09=09printf("    InfoFrame Type Code %u\n", x[0] & 0x1f);
+=09=09=09printf("\n");
 =09=09=09x++;
 =09=09=09length--;
 =09=09}

base-commit: e052f5f9fdf74ca11aa1a8edfa62eff8d0aa3d0d
--=20
2.39.1


