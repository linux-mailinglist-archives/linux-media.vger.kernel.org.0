Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC0154D461
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 00:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345493AbiFOWOc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 18:14:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349105AbiFOWO2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 18:14:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6222A562E3;
        Wed, 15 Jun 2022 15:14:28 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09D78BAC;
        Thu, 16 Jun 2022 00:14:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655331266;
        bh=X4VAEaTQTKnkyaZPESA6BesMEuNlxpGI2l6hsWy9eI0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=is+KaZEF3cyWDxv4uVVnNNSI7FTo5isYApwsDRrqyM6aHgS6Kw7Ci1b0IRUecKMGR
         5X7hhq2dzWhWAiWbh+3RXt9DLFEdUlnps9Bx0l+4jbnmKPO82B1WYN+Iq1w4hxMOh7
         TF5cRnt1FmcaP2F3CWRLK69U6w4IlpMq6A8WOHvs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH v3 1/6] dt-bindings: media: Add macros for video interface bus types
Date:   Thu, 16 Jun 2022 01:14:05 +0300
Message-Id: <20220615221410.27459-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
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

Add a new dt-bindings/media/video-interfaces.h header that defines
macros corresponding to the bus types from media/video-interfaces.yaml.
This allows avoiding hardcoded constants in device tree sources.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v2:

- Go back to PARALLEL

Changes since v1:

- Dual-license under GPL-2.0-only or MIT
- Rename PARALLEL TO BT601
---
 include/dt-bindings/media/video-interfaces.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 include/dt-bindings/media/video-interfaces.h

diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
new file mode 100644
index 000000000000..68ac4e05e37f
--- /dev/null
+++ b/include/dt-bindings/media/video-interfaces.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (C) 2022 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ */
+
+#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
+#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
+
+#define MEDIA_BUS_TYPE_CSI2_CPHY		1
+#define MEDIA_BUS_TYPE_CSI1			2
+#define MEDIA_BUS_TYPE_CCP2			3
+#define MEDIA_BUS_TYPE_CSI2_DPHY		4
+#define MEDIA_BUS_TYPE_PARALLEL			5
+#define MEDIA_BUS_TYPE_BT656			6
+
+#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */
-- 
Regards,

Laurent Pinchart

