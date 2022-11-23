Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7A31635A53
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 11:41:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237300AbiKWKkv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 05:40:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237188AbiKWKkQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 05:40:16 -0500
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 054E412636
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 02:24:19 -0800 (PST)
Date:   Wed, 23 Nov 2022 10:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1669199056; x=1669458256;
        bh=fyZZz658dqdjGD6Ls3r5etwoXVJ3G+ptgEhEy4uj8jo=;
        h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
        b=YUccv/UV7U/XXTxiio1HCjbR+nc2BrU7YP6Qtk4gtP6LsWZGFJD+BcwiX3YBnpL67
         8VO3q8279AUixDN8GPbQGBkqWZN5jqO7Gv91MwNCNw7v4xQPt5MCTlZ24ejEy/FHqT
         Y/qtmsT94BkOp9s895y3cGe0Q1fpfTWrP9dXOCA2PhhT3B0Ypy7HFMdLWnRtyRft4s
         D2xT4GlNUc/Ms7FVn7dr69LqfH7p+N3lQJ8+WBJr9DrjZ9QoRy0ML9QqGXRmOLhmGU
         2NE7bE2CX7T0RaTadOMrRL+z5uWeVXuuIOQE/YgxZmHiUq8UUfuRSzCyidDFqMZ9Ed
         OIL+wnC+dmMwA==
To:     linux-media@vger.kernel.org
From:   Simon Ser <contact@emersion.fr>
Subject: [PATCH] Add special case for 16:10 aspect ratio
Message-ID: <20221123102407.61827-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The mathematical aspect ratio is 8:5 but people use 16:10. For
instance:

    > git grep 16:10
    parse-base-block.cpp:749:                      x[14] & 0x20 ? " 16:10" =
: "",
    parse-base-block.cpp:764:                       printf("16:10");
    parse-displayid-block.cpp:284:          s +=3D "16:10";
    parse-displayid-block.cpp:471:          s +=3D "16:10";

Signed-off-by: Simon Ser <contact@emersion.fr>
---
 edid-decode.cpp | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/edid-decode.cpp b/edid-decode.cpp
index 96f095ce80de..a30165319cac 100644
--- a/edid-decode.cpp
+++ b/edid-decode.cpp
@@ -291,6 +291,11 @@ void calc_ratio(struct timings *t)
 =09}
 =09t->hratio =3D t->hact / d;
 =09t->vratio =3D t->vact / d;
+
+=09if (t->hratio =3D=3D 8 && t->vratio =3D=3D 5) {
+=09=09t->hratio =3D 16;
+=09=09t->vratio =3D 10;
+=09}
 }
=20
 std::string edid_state::dtd_type(unsigned cnt)
--=20
2.38.1


