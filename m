Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0AA14C2C47
	for <lists+linux-media@lfdr.de>; Thu, 24 Feb 2022 13:58:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234065AbiBXM6e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Feb 2022 07:58:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231355AbiBXM6d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Feb 2022 07:58:33 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24E6E1CF093
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 04:58:03 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA00BDD;
        Thu, 24 Feb 2022 13:58:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645707482;
        bh=dMP785DF8PqK1dVBIJgx0U+EpcvcKm79rwfwAsZXZB0=;
        h=From:To:Cc:Subject:Date:From;
        b=K//7MBI67uDZTTNAg1cES40kCXohayIJtJI948KbI+77Wpv20n+FxRllzXJwMzqpV
         RoYskzCrUogmeU18O+En5bMt9wVQA10wIUBZFYXeJHC6xoGh9QCkEy0x2b7ZE79gmj
         esyWM+5xaT3KYbUjQK/E7DEh20Ol0I98JZU8Wv04=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH] media: media-entity: Clarify media_entity_cleanup() usage
Date:   Thu, 24 Feb 2022 14:57:47 +0200
Message-Id: <20220224125747.2099-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
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

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Being able to call cleanup functions on objects that haven't been
initialized but whose memory has been zeroed simplifies error handling.
The media_entity_cleanup() function documentation doesn't tell whether
this is allowed or not, and inspection of its implementation doesn't
provide any clue as the function is currently empty. Update the
documentation to explicitly allow this usage pattern.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 include/media/media-entity.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 1419a327c78d..95499d0f458b 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -671,6 +671,10 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
  *
  * This function must be called during the cleanup phase after unregistering
  * the entity (currently, it does nothing).
+ *
+ * Calling media_entity_cleanup() on a media_entity whose memory has been
+ * zeroed but that has not been initialized with media_entity_pad_init() is
+ * valid and is a no-op.
  */
 #if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
 static inline void media_entity_cleanup(struct media_entity *entity) {}
-- 
Regards,

Laurent Pinchart

