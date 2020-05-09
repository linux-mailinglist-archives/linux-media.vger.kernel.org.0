Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 515F81CBF85
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2020 11:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728010AbgEIJCb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 May 2020 05:02:31 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:38735 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgEIJCb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 May 2020 05:02:31 -0400
X-Originating-IP: 212.216.150.148
Received: from uno.homenet.telecomitalia.it (a-ur1-85.tin.it [212.216.150.148])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E0AF91C0003;
        Sat,  9 May 2020 09:02:26 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), libcamera-devel@lists.libcamera.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh@kernel.org>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, tfiga@google.com, pavel@ucw.cz,
        devicetree@vger.kernel.org
Subject: [PATCH v11 13/13] dt-bindings: Add media properties
Date:   Sat,  9 May 2020 11:04:56 +0200
Message-Id: <20200509090456.3496481-14-jacopo@jmondi.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200509090456.3496481-1-jacopo@jmondi.org>
References: <20200509090456.3496481-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a DT header file to contain definitions for standard media properties.

The file is named after:
Documentation/devicetree/bindings/media/video-interfaces.txt
which contains the standard media properties definitions.

Initially add three macros to define the supported 'orientation'
property values.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---

I currently don't have users in mainline for this, I understand this implies
this is probably not going to be accepted. At the same time we don't have a
common place for media-related definitions, which support properties defined in
video-interfaces.txt

I leave it here at the end of the series for discussions, but I'm fine dropping
it from the series.

Thanks
  j

---
 include/dt-bindings/media/video-interfaces.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 include/dt-bindings/media/video-interfaces.h

diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
new file mode 100644
index 0000000000000..404c697d6bd6e
--- /dev/null
+++ b/include/dt-bindings/media/video-interfaces.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * include/dt-bindings/media/video-interfaces.h
+ *
+ * Copyright (C) 2020 Jacopo Mondi <jacopo@jmondi.org>
+ */
+
+#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
+#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
+
+#define FRONT_CAMERA		<0>
+#define BACK_CAMERA		<1>
+#define EXTERNAL_CAMERA		<2>
+
+#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */
--
2.26.1

