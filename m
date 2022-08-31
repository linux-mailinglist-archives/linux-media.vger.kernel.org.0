Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56CE85A7FD9
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 16:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232241AbiHaOQ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 10:16:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232138AbiHaOP6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 10:15:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4578553D16
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 07:15:21 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6444F481;
        Wed, 31 Aug 2022 16:14:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661955271;
        bh=S2azRpRgnqcMHpgn5NrUjHPpv3QDEwMrNtWT0sDO1mk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YGq6PfWNxQj3AG07qEbo0FyktPz7jw22wu+GTzznrtRHWCK3k2LTgmhohFwnf3b9i
         M4/QSAxDPCR+Y0i+FTZ8guN4GS0x7c1RU8ZT8Whkki9Vd0ZINlnZ0sjoBMOxWipKYa
         eIGl4IYsYWXNziHSl94Ebh4pvdQcbvc6eN8k8EUw=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v14 18/34] media: add V4L2_SUBDEV_CAP_STREAMS
Date:   Wed, 31 Aug 2022 17:13:41 +0300
Message-Id: <20220831141357.1396081-19-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
References: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
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

Add a subdev capability flag to expose to userspace if a subdev supports
multiplexed streams.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 4 +++-
 include/uapi/linux/v4l2-subdev.h      | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 5c27bac772ea..90826b956693 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -439,7 +439,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 
 		memset(cap->reserved, 0, sizeof(cap->reserved));
 		cap->version = LINUX_VERSION_CODE;
-		cap->capabilities = ro_subdev ? V4L2_SUBDEV_CAP_RO_SUBDEV : 0;
+		cap->capabilities =
+			(ro_subdev ? V4L2_SUBDEV_CAP_RO_SUBDEV : 0) |
+			((sd->flags & V4L2_SUBDEV_FL_STREAMS) ? V4L2_SUBDEV_CAP_STREAMS : 0);
 
 		return 0;
 	}
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 658106f5b5dc..89af27f50a41 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -188,6 +188,9 @@ struct v4l2_subdev_capability {
 /* The v4l2 sub-device video device node is registered in read-only mode. */
 #define V4L2_SUBDEV_CAP_RO_SUBDEV		0x00000001
 
+/* The v4l2 sub-device supports routing and multiplexed streams. */
+#define V4L2_SUBDEV_CAP_STREAMS			0x00000002
+
 /* Backwards compatibility define --- to be removed */
 #define v4l2_subdev_edid v4l2_edid
 
-- 
2.34.1

