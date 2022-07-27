Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B985582480
	for <lists+linux-media@lfdr.de>; Wed, 27 Jul 2022 12:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231978AbiG0KhQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jul 2022 06:37:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231982AbiG0KhO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jul 2022 06:37:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FAD5474C2
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 03:37:12 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49F6D1269;
        Wed, 27 Jul 2022 12:37:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658918224;
        bh=S2azRpRgnqcMHpgn5NrUjHPpv3QDEwMrNtWT0sDO1mk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AZqx9qwSwHXwqiLEJeq0pEkVmUiEXjodB5kyMzd8E6IiBMYWigpL/yswio81Dz1us
         GCEYBzMG4F4ESshEAHYA7Iq+QD08Op7Pdj2OC9DCNI8xtaKQlASk4CHX5Ba/GbGlBx
         eZ5lFdd8yQ5/c7kJGlITqoD+yaTavuteg7lrRmuk=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v12 11/30] media: add V4L2_SUBDEV_CAP_MPLEXED
Date:   Wed, 27 Jul 2022 13:36:20 +0300
Message-Id: <20220727103639.581567-12-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
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

