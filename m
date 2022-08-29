Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 682915A40A7
	for <lists+linux-media@lfdr.de>; Mon, 29 Aug 2022 03:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbiH2Bdo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Aug 2022 21:33:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbiH2Bdn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Aug 2022 21:33:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 573182F01E
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 18:33:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 650E8A1D;
        Mon, 29 Aug 2022 03:33:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661736820;
        bh=2Gax/OgAJtRuPPhVuWzHNc53hM/P76NaoBjMHjVPHSQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n5Xl0cka5Od45vNfCtJ+L7jK25XjwYZ50SscmmUA08ddygG2XMCBQVZXBlOWYbEt+
         vEH6biSUEYCnyVNhTKkoYrhLADRyA6WRLpCJgA9WQrO83jDl5UH2Y0C0cSeIGxy8Ws
         WgPhOrUHmpgSaw6UOtBMs4UGVB8K4PGJtd6fFQ/U=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, gjasny@googlemail.com, hverkuil@xs4all.nl,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com
Subject: [PATCH v6 03/13] [FIXUP] meson: Drop unneeded bpf option check
Date:   Mon, 29 Aug 2022 04:33:17 +0300
Message-Id: <20220829013327.5791-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220829013327.5791-1-laurent.pinchart@ideasonboard.com>
References: <20220829013327.5791-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is no need to manually check for the 'bpf' option to decide
whether or not to compile bpf support in the keytable utils, the
libbpf_dep dependency already provides that information.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 utils/keytable/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/keytable/meson.build b/utils/keytable/meson.build
index d5aad2628468..0ca84fd1871e 100644
--- a/utils/keytable/meson.build
+++ b/utils/keytable/meson.build
@@ -21,7 +21,7 @@ ir_keytable_c_args = [
     '-DIR_KEYTABLE_USER_DIR="@0@"'.format(ir_keytable_user_dir),
 ]
 
-if not get_option('bpf').disabled() and prog_clang.found() and dep_libbpf.found() and dep_libelf.found()
+if prog_clang.found() and dep_libbpf.found() and dep_libelf.found()
     ir_keytable_sources += files(
         'bpf_load.c',
         'bpf_load.h',
-- 
Regards,

Laurent Pinchart

