Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F39B56C1460
	for <lists+linux-media@lfdr.de>; Mon, 20 Mar 2023 15:08:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231572AbjCTOIw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Mar 2023 10:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbjCTOIu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Mar 2023 10:08:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 489726A58
        for <linux-media@vger.kernel.org>; Mon, 20 Mar 2023 07:08:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB8A5A25;
        Mon, 20 Mar 2023 15:08:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679321326;
        bh=wdiWAw3c3UBUfVzN3ef/tWYEUiXuA7dGETD3RW7PLBI=;
        h=From:To:Cc:Subject:Date:From;
        b=O3Tfr3w0p0IzVW5Eg0HqldwHJ3q/nUb7gaecGMRLvDp5ElF3LuvqKblFG9B51Gf3n
         5q5Z8QiE/gT6rwudkwUGM34vg3u9xYRB6+odQHL/qTT8uqk6/rEMfjTZ31r6vllyK1
         +d0htHHzklGJ5Xn7oBbifn57oPuw3Yio0MGvyrMw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Gregor Jasny <gjasny@googlemail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] meson: Fix libbpf detection
Date:   Mon, 20 Mar 2023 16:08:52 +0200
Message-Id: <20230320140852.25104-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The libbpf pkgconfig package is called libbpf.pc, not bpf.pc. Fix the
library detection by using the proper name.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 3412a09a9fbb..c7cb6d3255aa 100644
--- a/meson.build
+++ b/meson.build
@@ -80,7 +80,7 @@ dep_librt = cc.find_library('rt')
 dep_qt5 = dependency('qt5', modules: ['Core', 'Gui', 'Widgets', 'OpenGL'],
                      required : get_option('qvidcap').enabled() or get_option('qv4l2').enabled())
 
-dep_libbpf = dependency('bpf', required : get_option('bpf'), version : '>=0.7')
+dep_libbpf = dependency('libbpf', required : get_option('bpf'), version : '>=0.7')
 
 dep_sdl = dependency('SDL2', required: false)
 if not dep_sdl.found()

base-commit: 699bf6886e7c37a410daca7c227ea57fb416e7dd
-- 
Regards,

Laurent Pinchart

