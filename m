Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1461587D0C
	for <lists+linux-media@lfdr.de>; Tue,  2 Aug 2022 15:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236062AbiHBN0a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Aug 2022 09:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236225AbiHBN02 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Aug 2022 09:26:28 -0400
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24439183A2
        for <linux-media@vger.kernel.org>; Tue,  2 Aug 2022 06:26:27 -0700 (PDT)
Date:   Tue, 02 Aug 2022 13:26:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1659446783; x=1659705983;
        bh=iCKEnj8Js+5aWwtQbshh2/2JLGurn4Z7wNEfkZEwyEs=;
        h=Date:To:From:Reply-To:Subject:Message-ID:Feedback-ID:From:To:Cc:
         Date:Subject:Reply-To:Feedback-ID:Message-ID;
        b=adogYFCFHgi11nH1oR4Ena8NCAe64GZhE5NG1fBKgwCcNAMdWvhLF0Q9revcneZrv
         q9K5tMs9xqwPGdBu1Lt1Qmooi7qZTSh/V/DbAQzCSYnZbT841XRMIzteeUXR0X/Hh1
         yBaVWPCRberbyHZbDAUXo0E/b6YjV9rlC0MhEcifX8ksjyX54+EC5iOnL1TWbB2NM5
         EcKgaw5YVHtu72+f8Ol0blZbsNLgFKxzrL4p91jmACLUmg2YPHgmVJjSV6QaZGYkfu
         g7snM0H0+RQtvzT5NRM/F2MDLxYUrh6AcJVGBh0gGNN3VD8UDs74/B95rQo6vjbnCN
         7Tm74DPCqr1Mw==
To:     linux-media@vger.kernel.org
From:   Simon Ser <contact@emersion.fr>
Reply-To: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2] edid-decode: downgrade missing display product name to warning
Message-ID: <20220802132613.47141-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The E-EDID 1.4 spec says:

> The model name of the display product may be listed (optional
> but recommended) in the Display Product Name (ASCII) String
> Descriptor (tag #FCh).

So a missing Display Product Name descriptor shouldn't fail
conformance.

E-EDID 1.3 still requires the monitor name, so keep failing in
that case.

Signed-off-by: Simon Ser <contact@emersion.fr>
---

v2: keep this a failure for EDID 1.3

 parse-base-block.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parse-base-block.cpp b/parse-base-block.cpp
index 9644577bab70..a27505abec98 100644
--- a/parse-base-block.cpp
+++ b/parse-base-block.cpp
@@ -1673,7 +1673,7 @@ void edid_state::parse_base_block(const unsigned char=
 *x)
 =09do_checksum("", x, EDID_PAGE_SIZE);
 =09if (base.edid_minor >=3D 3) {
 =09=09if (!base.has_name_descriptor)
-=09=09=09fail("Missing Display Product Name.\n");
+=09=09=09msg(base.edid_minor >=3D 4, "Missing Display Product Name.\n");
 =09=09if ((base.edid_minor =3D=3D 3 || base.supports_continuous_freq) &&
 =09=09    !base.has_display_range_descriptor)
 =09=09=09fail("Missing Display Range Limits Descriptor.\n");

base-commit: 582c935652b0303b87ddad4551e6f97f8bb883ac
--=20
2.37.1


