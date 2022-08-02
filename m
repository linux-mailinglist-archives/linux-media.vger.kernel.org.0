Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 610335879E4
	for <lists+linux-media@lfdr.de>; Tue,  2 Aug 2022 11:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236050AbiHBJdA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Aug 2022 05:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236397AbiHBJcg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Aug 2022 05:32:36 -0400
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02AF04BD3E
        for <linux-media@vger.kernel.org>; Tue,  2 Aug 2022 02:32:34 -0700 (PDT)
Date:   Tue, 02 Aug 2022 09:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1659432753; x=1659691953;
        bh=EmWhWVTXXvx+GlVibywJmR4SG0k0OtM9AJn8GH7msF8=;
        h=Date:To:From:Reply-To:Subject:Message-ID:Feedback-ID:From:To:Cc:
         Date:Subject:Reply-To:Feedback-ID:Message-ID;
        b=dE5nRd1yZ57ok1nB1BxFYCZVV9wGvJ3kkvr6VDUHpOh/RBu2S51KT+SBFGeWjIuNz
         2/GTjYltouHXTgIDx4zHyBp8b7Dk2bAopsS/veUWeU7TZxAV/ABaOfygzwNCCbqBUT
         dhnVqUyyXv1LqJqkvjEZdvsk4kM813Hg7LAPMBKgahcCJQo0pPmLvd1DCYt9pcQ/ZY
         HdaZg4rmSxaLZ0aVoc9O9UsU7Nb1luqpMLGeizK8j6wITHiOxvU2BPIDZJuvNJNAV2
         apUwhssLmg/xdUzyHu4F+6eIODbAwjkrbNGdhjf+MY0ek+00xU0Z0ysgbpwpCabiiC
         jJnlz7IqU5h6w==
To:     linux-media@vger.kernel.org
From:   Simon Ser <contact@emersion.fr>
Reply-To: Simon Ser <contact@emersion.fr>
Subject: [PATCH] edid-decode: downgrade missing display product name to warning
Message-ID: <20220802093219.30599-1-contact@emersion.fr>
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

The spec says:

> The model name of the display product may be listed (optional
> but recommended) in the Display Product Name (ASCII) String
> Descriptor (tag #FCh).

So a missing Display Product Name descriptor shouldn't fail
conformance.

Signed-off-by: Simon Ser <contact@emersion.fr>
---
 parse-base-block.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parse-base-block.cpp b/parse-base-block.cpp
index 9644577bab70..525cd4c02257 100644
--- a/parse-base-block.cpp
+++ b/parse-base-block.cpp
@@ -1673,7 +1673,7 @@ void edid_state::parse_base_block(const unsigned char=
 *x)
 =09do_checksum("", x, EDID_PAGE_SIZE);
 =09if (base.edid_minor >=3D 3) {
 =09=09if (!base.has_name_descriptor)
-=09=09=09fail("Missing Display Product Name.\n");
+=09=09=09warn("Missing Display Product Name.\n");
 =09=09if ((base.edid_minor =3D=3D 3 || base.supports_continuous_freq) &&
 =09=09    !base.has_display_range_descriptor)
 =09=09=09fail("Missing Display Range Limits Descriptor.\n");

base-commit: 582c935652b0303b87ddad4551e6f97f8bb883ac
--=20
2.37.1


