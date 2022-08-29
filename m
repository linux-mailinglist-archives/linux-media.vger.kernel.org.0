Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84F3A5A40AD
	for <lists+linux-media@lfdr.de>; Mon, 29 Aug 2022 03:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbiH2Bdv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Aug 2022 21:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbiH2Bdt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Aug 2022 21:33:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F31112F022
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 18:33:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4FD2AFD6;
        Mon, 29 Aug 2022 03:33:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661736827;
        bh=S7AT1rq6ZOAuO9hRvFLeDfbY9wbaP1HQSqq4mM7hOLA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RDg2HSabfAKNrbq/sdfuM9Rpv2epuhcnuthDwqNFBVw8YUBgqEWQRNiPEz7OrBI3l
         jAFB1s8QXiwPcDAnLT+4+NZGwb2W7DEZHae0EnR43snNNDt+vTD6hHSxd6nHDs31EE
         yJYdLpyYpZBktNJ/hV35q60aQw+4zGMdlpmq3wVQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, gjasny@googlemail.com, hverkuil@xs4all.nl,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com
Subject: [PATCH v6 08/13] [FIXUP] meson: Fix SDL dependency fallback check
Date:   Mon, 29 Aug 2022 04:33:22 +0300
Message-Id: <20220829013327.5791-9-laurent.pinchart@ideasonboard.com>
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

The SDL2 or SDL2_image can't be found using pkgconfig, we fall back to
searching for them using the find_library() function. This treats the
dependencies as required by mistake, unlike the dependency() calls that
correctly set 'required' to false. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index fce8a09b390b..a6816e2bee16 100644
--- a/meson.build
+++ b/meson.build
@@ -81,12 +81,12 @@ endif
 
 dep_sdl = dependency('SDL2', required: false)
 if not dep_sdl.found()
-    dep_sdl = cc.find_library('SDL2', has_headers: 'SDL2/SDL.h')
+    dep_sdl = cc.find_library('SDL2', has_headers: 'SDL2/SDL.h', required: false)
 endif
 
 dep_sdl_image = dependency('SDL2_image', required: false)
 if not dep_sdl_image.found()
-    dep_sdl_image = cc.find_library('SDL2_image', has_headers: 'SDL2/SDL_image.h')
+    dep_sdl_image = cc.find_library('SDL2_image', has_headers: 'SDL2/SDL_image.h', required: false)
 endif
 
 dep_threads = dependency('threads')
-- 
Regards,

Laurent Pinchart

