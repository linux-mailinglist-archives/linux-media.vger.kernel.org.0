Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBD9069D42
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 23:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731832AbfGOVHC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 17:07:02 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52696 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731381AbfGOVHB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 17:07:01 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id EBB4E28B690
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com, linux-media@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 1/6] media: v4l2-core: Cleanup Makefile
Date:   Mon, 15 Jul 2019 18:06:42 -0300
Message-Id: <20190715210649.31681-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715210649.31681-1-ezequiel@collabora.com>
References: <20190715210649.31681-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the videodev-$(CONFIG_FOO) syntax to simplify the Makefile.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/v4l2-core/Makefile | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index 9ee57e1efefe..4d42418e603e 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -8,15 +8,11 @@ tuner-objs	:=	tuner-core.o
 videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
 			v4l2-event.o v4l2-ctrls.o v4l2-subdev.o v4l2-clk.o \
 			v4l2-async.o
-ifeq ($(CONFIG_COMPAT),y)
-  videodev-objs += v4l2-compat-ioctl32.o
-endif
-obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
-ifeq ($(CONFIG_TRACEPOINTS),y)
-  videodev-objs += v4l2-trace.o
-endif
+videodev-$(CONFIG_COMPAT) += v4l2-compat-ioctl32.o
+videodev-$(CONFIG_TRACEPOINTS) += v4l2-trace.o
 videodev-$(CONFIG_MEDIA_CONTROLLER) += v4l2-mc.o
 
+obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
 obj-$(CONFIG_VIDEO_V4L2) += videodev.o
 obj-$(CONFIG_VIDEO_V4L2) += v4l2-common.o
 obj-$(CONFIG_VIDEO_V4L2) += v4l2-dv-timings.o
-- 
2.22.0

