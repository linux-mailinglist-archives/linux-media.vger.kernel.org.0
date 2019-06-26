Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41DDF5639A
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 09:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbfFZHoi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 03:44:38 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:50687 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727078AbfFZHoe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 03:44:34 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id g2bNh3RUP7KeZg2bZhhHrA; Wed, 26 Jun 2019 09:44:34 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH 15/16] ti-vpe: set device_caps in struct video_device
Date:   Wed, 26 Jun 2019 09:44:20 +0200
Message-Id: <20190626074421.38739-16-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
References: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNCjFJhN1Fb9b8791SEdpL66jnzKmHxA7Y2YcugEaS6lZhnfnYwS7Wy6OLrQnLe7km97hwYQIdginfY0t3a7ODFpVWISW4gTrQ6QkI5rBX13sjTA7Mnw
 aTwBMHX2g69MJnvTQZPAgwEG5GK+Qdl1zjQDHBPS00C4vWGsGsv5CfWZJSuX2YePe3NV1RagXv39Y9QevMPSN3qaXZRRKHYU+5agTsZWa9Kv2eonzIJr+rXD
 25kr0h6t5IDYdItxv5Q3sQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of filling in the struct v4l2_capability device_caps
field, fill in the struct video_device device_caps field.

That way the V4L2 core knows what the capabilities of the
video device are.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 8d075683e448..3fa306a45787 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -916,9 +916,6 @@ static int cal_querycap(struct file *file, void *priv,
 
 	snprintf(cap->bus_info, sizeof(cap->bus_info),
 		 "platform:%s", ctx->v4l2_dev.name);
-	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
-			    V4L2_CAP_READWRITE;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -1422,6 +1419,8 @@ static const struct video_device cal_videodev = {
 	.ioctl_ops	= &cal_ioctl_ops,
 	.minor		= -1,
 	.release	= video_device_release_empty,
+	.device_caps	= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
+			  V4L2_CAP_READWRITE,
 };
 
 /* -----------------------------------------------------------------
-- 
2.20.1

