Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA575F43C0
	for <lists+linux-media@lfdr.de>; Tue,  4 Oct 2022 14:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbiJDM67 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Oct 2022 08:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbiJDM5s (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Oct 2022 08:57:48 -0400
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41906647C
        for <linux-media@vger.kernel.org>; Tue,  4 Oct 2022 05:54:53 -0700 (PDT)
Date:   Tue, 04 Oct 2022 12:54:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1664888090; x=1665147290;
        bh=L4aMO6dCtkwy80fgIigNA6sy15pUSx1p9BBpJ/q48d4=;
        h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID;
        b=OAumLBJgYxNFxZb+jMKhA9PP0+y/s99CwOPVspgnArD123g2uUuPNlmkX/nRFE2IG
         CKAh3alJDWZ+c2LUjWClH8eGkF6pS3sPYMHEHbjYp+Ov4/b6Xe301aIrIbLPVa/XEV
         Cr275KNAtCdAkT/7kZ/k1BrqXGQFEhe3lQKLjhhoAzOvqUYEOi7W1F9Og4jWYSiAdT
         mDU1YM5hunHcGXKm+6/HuetLJnT91UXXiJ6vyvqh+fnMWwczK7kDxT5hdghEszximt
         VkM7akl42QiNjK6ycNkVCm3vEz4N8M7Jo41GXIMuyERGQbpYNBBeEb1YiSn5mrtSGF
         2eodTNs0ae4gA==
To:     linux-media@vger.kernel.org
From:   Simon Ser <contact@emersion.fr>
Subject: [PATCH] edid-decode: fix typo for tiled display bezel
Message-ID: <20221004125439.2826-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The spec uses the word "bezel", not "bevel".

Signed-off-by: Simon Ser <contact@emersion.fr>
---
 parse-displayid-block.cpp | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/parse-displayid-block.cpp b/parse-displayid-block.cpp
index a754483b3b73..6dddad37584d 100644
--- a/parse-displayid-block.cpp
+++ b/parse-displayid-block.cpp
@@ -1027,20 +1027,20 @@ void edid_state::parse_displayid_tiled_display_topo=
logy(const unsigned char *x,
 =09printf("    Tile resolution: %ux%u\n", tile_width + 1, tile_height + 1)=
;
 =09if (caps & 0x40) {
 =09=09if (pix_mult) {
-=09=09=09printf("    Top bevel size: %.1f pixels\n",
+=09=09=09printf("    Top bezel size: %.1f pixels\n",
 =09=09=09       pix_mult * x[12] / 10.0);
-=09=09=09printf("    Bottom bevel size: %.1f pixels\n",
+=09=09=09printf("    Bottom bezel size: %.1f pixels\n",
 =09=09=09       pix_mult * x[13] / 10.0);
-=09=09=09printf("    Right bevel size: %.1f pixels\n",
+=09=09=09printf("    Right bezel size: %.1f pixels\n",
 =09=09=09       pix_mult * x[14] / 10.0);
-=09=09=09printf("    Left bevel size: %.1f pixels\n",
+=09=09=09printf("    Left bezel size: %.1f pixels\n",
 =09=09=09       pix_mult * x[15] / 10.0);
 =09=09} else {
-=09=09=09fail("No bevel information, but the pixel multiplier is non-zero.=
\n");
+=09=09=09fail("No bezel information, but the pixel multiplier is non-zero.=
\n");
 =09=09}
 =09=09printf("    Tile resolution: %ux%u\n", tile_width + 1, tile_height +=
 1);
 =09} else if (pix_mult) {
-=09=09fail("No bevel information, but the pixel multiplier is non-zero.\n"=
);
+=09=09fail("No bezel information, but the pixel multiplier is non-zero.\n"=
);
 =09}
 =09if (is_v2)
 =09=09printf("    Tiled Display Manufacturer/Vendor ID: %02X-%02X-%02X\n",
--=20
2.37.3


