Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5F746366E
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 15:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242104AbhK3OUb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 09:20:31 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41004 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242105AbhK3OUO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 09:20:14 -0500
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58DBB3524;
        Tue, 30 Nov 2021 15:16:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638281813;
        bh=/O3fgUS8jPxN9Y6YCR8jOMlveMGNmXZ7+rvjt6Nf4ho=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YiF2ex26aQ5hKTA70CRH1vPOcmGH4tFbwO3AUWYDqjKPHASisQjYSSgHQTWUjDswM
         Y7tPWuO4vbQAEdhX/NtGGx/agXxM8zM/3GlBXLHjAWFW98pZM8D+GWkew5BheC6bUQ
         LDGLtUGbE+MDIMAeNE0OSNZLs/WqlLS6IhxYcar4=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 26/38] media: add V4L2_SUBDEV_CAP_MPLEXED
Date:   Tue, 30 Nov 2021 16:15:24 +0200
Message-Id: <20211130141536.891878-27-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index 2053fe1cd67d..721148e35624 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -419,7 +419,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 
 		memset(cap->reserved, 0, sizeof(cap->reserved));
 		cap->version = LINUX_VERSION_CODE;
-		cap->capabilities = ro_subdev ? V4L2_SUBDEV_CAP_RO_SUBDEV : 0;
+		cap->capabilities =
+			(ro_subdev ? V4L2_SUBDEV_CAP_RO_SUBDEV : 0) |
+			((sd->flags & V4L2_SUBDEV_FL_MULTIPLEXED) ? V4L2_SUBDEV_CAP_MPLEXED : 0);
 
 		return 0;
 	}
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 658106f5b5dc..d91ab6f22fa7 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -188,6 +188,9 @@ struct v4l2_subdev_capability {
 /* The v4l2 sub-device video device node is registered in read-only mode. */
 #define V4L2_SUBDEV_CAP_RO_SUBDEV		0x00000001
 
+/* The v4l2 sub-device supports multiplexed streams. */
+#define V4L2_SUBDEV_CAP_MPLEXED			0x00000002
+
 /* Backwards compatibility define --- to be removed */
 #define v4l2_subdev_edid v4l2_edid
 
-- 
2.25.1

