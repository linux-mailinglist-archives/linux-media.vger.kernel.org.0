Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38B1E5F543A
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 14:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbiJEMMj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 08:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbiJEMMi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 08:12:38 -0400
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3681A41519
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 05:12:35 -0700 (PDT)
Date:   Wed, 05 Oct 2022 12:12:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1664971952; x=1665231152;
        bh=OYhK2PnD/kzbUIGy8BCP+ZesRla8gBOOWRw65Sm5cm0=;
        h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID;
        b=lXsubILuNxeuRYTM6B/fie0bz9BtrpXk8y7fjzVg5fifU6K1ip/iI3SsPDh+p40DI
         ucGldc8mZ34F1fPJgb7tsN/EwS0uZ3QMn4bVAiSqTM9O+lxVaQzs1Qh3aFfZhv7fps
         hgQ4lh8jyYAMYY1LrxMD0VJhVbcLAiUx6eBFZ9MVZ4R/NkqCAPAZAEH6sPrIy/DlZ7
         8Jh6YIgvVJTwpCFSaCNibFIDfAE5YyGfzeVADVjiLqgVEd9/do0E3E6FfN9n9tM85G
         sdPx4KKY6QWkdI6rwjxQOzzQv1rD0q1mBHkXvTHSENSGxiOeZiIHaKTuuRDOD+Stae
         75oS84pjtdFqw==
To:     linux-media@vger.kernel.org
From:   Simon Ser <contact@emersion.fr>
Subject: [PATCH] edid-decode: fix clock step for CVT RBv3
Message-ID: <20221005121221.14882-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to CVT 2.0 table 3-2, C_CLOCK_STEP =3D 0.001 for both
RBv2 and RBv3.

Signed-off-by: Simon Ser <contact@emersion.fr>
---
 calc-gtf-cvt.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/calc-gtf-cvt.cpp b/calc-gtf-cvt.cpp
index dc22ad535135..6330bb7ac814 100644
--- a/calc-gtf-cvt.cpp
+++ b/calc-gtf-cvt.cpp
@@ -152,7 +152,7 @@ timings edid_state::calc_cvt_mode(unsigned h_pixels, un=
signed v_lines,
 =09double interlace =3D int_rqd ? 0.5 : 0;
 =09double total_active_pixels =3D h_pixels_rnd + hor_margin * 2;
 =09double v_field_rate_rqd =3D int_rqd ? ip_freq_rqd * 2 : ip_freq_rqd;
-=09double clock_step =3D rb =3D=3D RB_CVT_V2 ? 0.001 : 0.25;
+=09double clock_step =3D rb >=3D RB_CVT_V2 ? 0.001 : 0.25;
 =09double h_blank =3D (rb =3D=3D RB_CVT_V1 || (rb =3D=3D RB_CVT_V3 && alt)=
) ? 160 : 80;
 =09double rb_v_fporch =3D rb =3D=3D RB_CVT_V1 ? 3 : 1;
 =09double refresh_multiplier =3D (rb =3D=3D RB_CVT_V2 && alt) ? 1000.0 / 1=
001.0 : 1;
--=20
2.38.0


