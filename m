Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA614972D0
	for <lists+linux-media@lfdr.de>; Sun, 23 Jan 2022 17:09:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238442AbiAWQJV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jan 2022 11:09:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238437AbiAWQJV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jan 2022 11:09:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE96C06173B;
        Sun, 23 Jan 2022 08:09:21 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21527D41;
        Sun, 23 Jan 2022 17:09:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642954158;
        bh=i3ofNbCQD8+Oh+oNjXsm99gpWh2SU1NNLToXOporhAk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=K/OzT/60ctNSK0tEHYjPdC9OzJut0EeFN/W1yhtgEQltpq+6ee1MhlXnFJi0/glIR
         ZU9zxh6TJGV9fqscFKVrfHEmBSkAYW8Devjo3yI5qt2K6cjtIdY9STgeUBoWerI37f
         LpYpSiyM1zjxY8CJMYN0SSOb4Z6gEgbxK1sEo63s=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Maxime Ripard <mripard@kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH 1/6] media: Define MIPI CSI-2 data types in a shared header file
Date:   Sun, 23 Jan 2022 18:08:52 +0200
Message-Id: <20220123160857.24161-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220123160857.24161-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220123160857.24161-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are many CSI-2-related drivers in the media subsystem that come
with their own macros to handle the CSI-2 data types (or just hardcode
the numerical values). Provide a shared header with definitions for
those data types that driver can use.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 include/media/mipi-csi2.h | 45 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 include/media/mipi-csi2.h

diff --git a/include/media/mipi-csi2.h b/include/media/mipi-csi2.h
new file mode 100644
index 000000000000..392794e5badd
--- /dev/null
+++ b/include/media/mipi-csi2.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * MIPI CSI-2 Data Types
+ *
+ * Copyright (C) 2022 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ */
+
+#ifndef _MEDIA_MIPI_CSI2_H
+#define _MEDIA_MIPI_CSI2_H
+
+/* Short packet data types */
+#define MIPI_CSI2_DT_FS			0x00
+#define MIPI_CSI2_DT_FE			0x01
+#define MIPI_CSI2_DT_LS			0x02
+#define MIPI_CSI2_DT_LE			0x03
+#define MIPI_CSI2_DT_GENERIC_SHORT(n)	(0x08 + (n))	/* 0..7 */
+
+/* Long packet data types */
+#define MIPI_CSI2_DT_NULL		0x10
+#define MIPI_CSI2_DT_BLANKING		0x11
+#define MIPI_CSI2_DT_EMBEDDED_8B	0x12
+#define MIPI_CSI2_DT_YUV420_8B		0x18
+#define MIPI_CSI2_DT_YUV420_10B		0x19
+#define MIPI_CSI2_DT_YUV420_8B_LEGACY	0x1a
+#define MIPI_CSI2_DT_YUV420_8B_CS	0x1c
+#define MIPI_CSI2_DT_YUV420_10B_CS	0x1d
+#define MIPI_CSI2_DT_YUV422_8B		0x1e
+#define MIPI_CSI2_DT_YUV422_10B		0x1f
+#define MIPI_CSI2_DT_RGB444		0x20
+#define MIPI_CSI2_DT_RGB555		0x21
+#define MIPI_CSI2_DT_RGB565		0x22
+#define MIPI_CSI2_DT_RGB666		0x23
+#define MIPI_CSI2_DT_RGB888		0x24
+#define MIPI_CSI2_DT_RAW24		0x27
+#define MIPI_CSI2_DT_RAW6		0x28
+#define MIPI_CSI2_DT_RAW7		0x29
+#define MIPI_CSI2_DT_RAW8		0x2a
+#define MIPI_CSI2_DT_RAW10		0x2b
+#define MIPI_CSI2_DT_RAW12		0x2c
+#define MIPI_CSI2_DT_RAW14		0x2d
+#define MIPI_CSI2_DT_RAW16		0x2e
+#define MIPI_CSI2_DT_RAW20		0x2f
+#define MIPI_CSI2_DT_USER_DEFINED(n)	(0x30 + (n))	/* 0..7 */
+
+#endif /* _MEDIA_MIPI_CSI2_H */
-- 
Regards,

Laurent Pinchart

