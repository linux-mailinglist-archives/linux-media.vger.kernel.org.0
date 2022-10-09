Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4786B5F8EF8
	for <lists+linux-media@lfdr.de>; Sun,  9 Oct 2022 23:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbiJIVfV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Oct 2022 17:35:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbiJIVfT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Oct 2022 17:35:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B2101C915;
        Sun,  9 Oct 2022 14:35:18 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3520B9C4;
        Sun,  9 Oct 2022 23:35:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665351315;
        bh=G039zjAux/RiMi/GUO2mIlJOW1hz3O4bVoFnIHRELoY=;
        h=From:To:Cc:Subject:Date:From;
        b=ta8zRipDyLUBh/MjWNX50cjYaBMx862MqfEkdd2FfiqIuKm2CZJKd62CfhM/v+wmL
         4sj3FUZ1eU8/28vplMFFV37P/KBHvjGu/dZRdTNr2YpfQj9dhzwh7DhUKCdnGVPhQi
         3LUDT31OmqjiOCSQ4+keFBwIP/YPt3KDsbvEpBkw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [RFC PATCH] media: Documentation: Drop deprecated bytesused == 0
Date:   Mon, 10 Oct 2022 00:35:09 +0300
Message-Id: <20221009213509.860-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
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

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The V4L2 API historically allowed buffers to be queued with bytesused
set to 0 on output devices, in which case the driver would use the
buffer length. This behaviour is deprecated, and videobuf2 prints a
warning message in the kernel log. Drop it from the documentation.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---

This patch aims at starting (or continuing) the discussion related to
handling of bytesused == 0 on video output devices. videobuf2 currently
printes a warning that indicates the behaviour is deprecated, but the
API documentation allows it explicitly. This discrepency bothers me and
I think we should fix it.

We probably won't be able to drop support for the deprecated behaviour
in the near future, if ever. If we want to push applications to get
fixed, we may want to replace the dev_warn() with a WARN_ONCE(), which
could be done in a v2 of this patch, or in another patch.

Another option would be to consider that the behaviour is fine and keep
official support for it in the documentation, in which case vb2 should
stop warning about it. This wouldn't be my preference.

---
 Documentation/userspace-api/media/v4l/buffer.rst | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
index 4638ec64db00..04dec3e570ed 100644
--- a/Documentation/userspace-api/media/v4l/buffer.rst
+++ b/Documentation/userspace-api/media/v4l/buffer.rst
@@ -187,10 +187,8 @@ struct v4l2_buffer
 	on the negotiated data format and may change with each buffer for
 	compressed variable size data like JPEG images. Drivers must set
 	this field when ``type`` refers to a capture stream, applications
-	when it refers to an output stream. If the application sets this
-	to 0 for an output stream, then ``bytesused`` will be set to the
-	size of the buffer (see the ``length`` field of this struct) by
-	the driver. For multiplanar formats this field is ignored and the
+	when it refers to an output stream. For multiplanar formats this field
+        is ignored and the
 	``planes`` pointer is used instead.
     * - __u32
       - ``flags``
@@ -327,10 +325,7 @@ struct v4l2_plane
       - ``bytesused``
       - The number of bytes occupied by data in the plane (its payload).
 	Drivers must set this field when ``type`` refers to a capture
-	stream, applications when it refers to an output stream. If the
-	application sets this to 0 for an output stream, then
-	``bytesused`` will be set to the size of the plane (see the
-	``length`` field of this struct) by the driver.
+	stream, applications when it refers to an output stream.
 
 	.. note::
 
-- 
Regards,

Laurent Pinchart

