Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3215A40AE
	for <lists+linux-media@lfdr.de>; Mon, 29 Aug 2022 03:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbiH2Bdw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Aug 2022 21:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbiH2Bdv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Aug 2022 21:33:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 475692E6AE
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 18:33:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A37828BD;
        Mon, 29 Aug 2022 03:33:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661736828;
        bh=Cgfu8ec5EwxpI8wDRxcZmu8m/gUeHmVEFwp49Ihw/gw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ol6YnGWzPk0Z98GLbVUys0YL2SglQXAVoE57PZ3Q79GGEs8/xV4zJtqhfsJjun2+3
         CG0IUhH2DEpnpNmN3ZYrtu/c7gkc1qUghSNXLhcAJwU+9KWd1JWkJoJQ6EE0Sde8vN
         QY14JBFTKx0m2M/XhALhEYeZPrlrXTaSHqTPjgI8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, gjasny@googlemail.com, hverkuil@xs4all.nl,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com
Subject: [PATCH v6 09/13] [FIXUP] meson: Set the default build type to debugoptimized
Date:   Mon, 29 Aug 2022 04:33:23 +0300
Message-Id: <20220829013327.5791-10-laurent.pinchart@ideasonboard.com>
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

v4l-utils is compiled by default with -g -O2 when using autoconf.
Replicate this with meson by setting the default build type to
debugoptimized.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meson.build b/meson.build
index a6816e2bee16..88b0be3c0e93 100644
--- a/meson.build
+++ b/meson.build
@@ -2,6 +2,7 @@ project('v4l-utils', 'c', 'cpp',
     version: '1.21.0',
     meson_version : '>= 0.57',
     default_options : [
+        'buildtype=debugoptimized',
         'warning_level=1',
         'c_std=gnu99',
         'cpp_std=gnu++11',
-- 
Regards,

Laurent Pinchart

