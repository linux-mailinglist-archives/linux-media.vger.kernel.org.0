Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B586664CC83
	for <lists+linux-media@lfdr.de>; Wed, 14 Dec 2022 15:42:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238694AbiLNOm0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Dec 2022 09:42:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238517AbiLNOmV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Dec 2022 09:42:21 -0500
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF60C24F28
        for <linux-media@vger.kernel.org>; Wed, 14 Dec 2022 06:42:18 -0800 (PST)
Date:   Wed, 14 Dec 2022 14:42:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1671028936; x=1671288136;
        bh=U7BeY+EAMGMBS3T8UNyz85Xeol74vIkp7lYD0+1Ob20=;
        h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
        b=anawJ7yCyyGL5DBUIHFVjG/0nCk5atTT5TbMVW+TuXHym12hm9HCuH55+IzhgpMsY
         hujxcC1G84AA6CWk0S3FBesez6iP698jMBOQjayZcFfq8wHMdmszsmB+CMJZj2Vetj
         eIhdxEe6JCRrxo77zeNSjsGLE/Y4esfZKmI2tV5V21W77pVdZLKGVx+p8ohPuwhtji
         1MfL7ADYLRcOFuskwMVt65paMPqvlnuXVS2UHNcCOxuPI0Iqx0s3R6SVhl20w1tWwi
         KKWniEQH97ry3PsvaUMy+Kc/e1sccH1oyvXrUDnXAtNdNrm2Vy/bYotPN4osYkQboU
         I+M4pd/1ZyrSA==
To:     linux-media@vger.kernel.org
From:   Simon Ser <contact@emersion.fr>
Subject: [PATCH] edid-decode: fix error message for tiled topo pixel multiplier
Message-ID: <20221214144202.8468-1-contact@emersion.fr>
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

This message was copy-pasted from a few lines below.

Signed-off-by: Simon Ser <contact@emersion.fr>
---
 parse-displayid-block.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parse-displayid-block.cpp b/parse-displayid-block.cpp
index 6dddad37584d..aa956e0dd5fb 100644
--- a/parse-displayid-block.cpp
+++ b/parse-displayid-block.cpp
@@ -1036,7 +1036,7 @@ void edid_state::parse_displayid_tiled_display_topolo=
gy(const unsigned char *x,
 =09=09=09printf("    Left bezel size: %.1f pixels\n",
 =09=09=09       pix_mult * x[15] / 10.0);
 =09=09} else {
-=09=09=09fail("No bezel information, but the pixel multiplier is non-zero.=
\n");
+=09=09=09fail("Bezel information bit is set, but the pixel multiplier is z=
ero.\n");
 =09=09}
 =09=09printf("    Tile resolution: %ux%u\n", tile_width + 1, tile_height +=
 1);
 =09} else if (pix_mult) {
--=20
2.39.0


