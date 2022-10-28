Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD28F611466
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 16:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbiJ1OYZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Oct 2022 10:24:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbiJ1OYY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Oct 2022 10:24:24 -0400
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B21C07FE61
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 07:24:21 -0700 (PDT)
Date:   Fri, 28 Oct 2022 14:24:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1666967059; x=1667226259;
        bh=0rfEuL/taVsNacuSSv0AhkS1Zv1Dz2HWLflRbpycMpM=;
        h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
        b=DMz/XfkaNYJBbeUEO60yc9vIstQS8icI9NRq0nb/lhVQQMR7qiEP55/87YWsXDt5J
         mPXpvM2F8O/Jss3eUdpuXAIhOY4ElEUBr235lW1C5rJ6aLn5qDTLKVwTuKUHYp61LI
         VI3D9t7frKFQ9cGvO0Pg0hxz6k2/E6i/dRXc+4+lIsQD1fAQaJUBICSSr741bS5IbI
         Tkcl83oIOuUYgbEJxX9xeOrt9Nl9ufmsNx4T/euhxSwhctqZCkg32QtKChs513gsJn
         YFVhci08JhYI6DEHZLc8EGsl5w+mDoqUchIbJF8zcXZDe1J70eB4keQOkoye4Fotpa
         /kCXAH7q+cyww==
To:     linux-media@vger.kernel.org
From:   Simon Ser <contact@emersion.fr>
Subject: [PATCH] edid-decode: fix horizontal front porch for CVT RBv2
Message-ID: <20221028142405.81894-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to CVT 2.0 table 3-2, C_H_FRONT_PORCH is 8 for both
RBv2 and RBv3.

Signed-off-by: Simon Ser <contact@emersion.fr>
---
 calc-gtf-cvt.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/calc-gtf-cvt.cpp b/calc-gtf-cvt.cpp
index 6330bb7ac814..7d53ad9625a1 100644
--- a/calc-gtf-cvt.cpp
+++ b/calc-gtf-cvt.cpp
@@ -232,7 +232,7 @@ timings edid_state::calc_cvt_mode(unsigned h_pixels, un=
signed v_lines,
 =09t.vfp =3D v_blank - t.vbp - t.vsync;
 =09t.pixclk_khz =3D round(1000.0 * pixel_freq);
 =09t.hsync =3D h_sync;
-=09if (rb =3D=3D RB_CVT_V3)
+=09if (rb >=3D RB_CVT_V2)
 =09=09t.hfp =3D 8;
 =09else
 =09=09t.hfp =3D (h_blank / 2.0) - t.hsync;

base-commit: f1ff7ad7bcb2fbb85017bbb2baa6bed37c412895
--=20
2.38.1


