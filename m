Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6D397D3EFC
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 20:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231417AbjJWSTT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 14:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbjJWSTS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 14:19:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70ABD8F
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 11:19:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D5E5D20;
        Mon, 23 Oct 2023 20:19:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698085144;
        bh=UiXzLi+OYDXJeTLhc+oijtA4TDBBx/XmPpe6x8AL54I=;
        h=From:To:Cc:Subject:Date:From;
        b=qUO29OgmWF9quzffBdKoBz1SrTnBeUbLAeplr1l+16zkcK892e9lzftZqnHYF1KOM
         SOY0QAUaFIySFxuPHgy5JNBhmlzEGGKDEr+urNwjxydiTzgISJ5vpQluW0sFnMcShP
         ZS95uXlg/metEDTSMR9BDrrT99zP7eykVJgK4Yig=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH] media: v4l2-subdev: Fix indentation in v4l2-subdev.h
Date:   Mon, 23 Oct 2023 21:19:22 +0300
Message-ID: <20231023181922.19886-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix a simple indentation issue in the v4l2-subdev.h header.

Fixes: f57fa2959244 ("media: v4l2-subdev: Add new ioctl for client capabilities")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/uapi/linux/v4l2-subdev.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 4a195b68f28f..0401385fd8e9 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -239,7 +239,7 @@ struct v4l2_subdev_routing {
  * set (which is the default), the 'stream' fields will be forced to 0 by the
  * kernel.
  */
- #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		(1U << 0)
+#define V4L2_SUBDEV_CLIENT_CAP_STREAMS		(1U << 0)
 
 /**
  * struct v4l2_subdev_client_capability - Capabilities of the client accessing
-- 
Regards,

Laurent Pinchart

