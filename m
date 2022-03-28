Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC5964E98CB
	for <lists+linux-media@lfdr.de>; Mon, 28 Mar 2022 15:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243535AbiC1N63 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Mar 2022 09:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240793AbiC1N62 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Mar 2022 09:58:28 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 663EE5D678
        for <linux-media@vger.kernel.org>; Mon, 28 Mar 2022 06:56:47 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 1450C1C0007;
        Mon, 28 Mar 2022 13:56:43 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH] media-ctl: Add MEDIA_BUS_FMT_JPEG_1X8
Date:   Mon, 28 Mar 2022 15:56:28 +0200
Message-Id: <20220328135628.96966-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the "JPEG" identifier to enable setting MEDIA_BUS_FMT_JPEG_1X8
media bus code.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 utils/media-ctl/libv4l2subdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/media-ctl/libv4l2subdev.c b/utils/media-ctl/libv4l2subdev.c
index eb9e1cc43b7e..0f9ccc0a1552 100644
--- a/utils/media-ctl/libv4l2subdev.c
+++ b/utils/media-ctl/libv4l2subdev.c
@@ -1084,6 +1084,7 @@ static const struct {
 	{ "RBG24", MEDIA_BUS_FMT_RBG888_1X24 },
 	{ "RGB32", MEDIA_BUS_FMT_RGB888_1X32_PADHI },
 	{ "ARGB32", MEDIA_BUS_FMT_ARGB8888_1X32 },
+	{ "JPEG", MEDIA_BUS_FMT_JPEG_1X8 },
 };

 const char *v4l2_subdev_pixelcode_to_string(enum v4l2_mbus_pixelcode code)
--
2.35.1

