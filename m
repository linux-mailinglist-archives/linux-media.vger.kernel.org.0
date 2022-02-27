Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9714C5EA4
	for <lists+linux-media@lfdr.de>; Sun, 27 Feb 2022 21:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231672AbiB0Uer (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Feb 2022 15:34:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbiB0Ueq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Feb 2022 15:34:46 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C81D45BE48;
        Sun, 27 Feb 2022 12:34:09 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C0B247C;
        Sun, 27 Feb 2022 21:34:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645994048;
        bh=Rr8utHrbX6O5PABBy2xdpCwhkVudslIAeti8w/BasdM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=crGsVO2wWIVaIlUiPIpoSNipplBIBHyYjsQw3/ak0i6Mvl9Ua9BaVtrVPJgf6HPcA
         VCnkDvWK549xIYpsmeggdbGwWfhxQrk+xwzvTgXBcjA2xluYMJcGeUb6GRfbu+KMAt
         QiAyt/bVuk2rwaMdoTM+oe4XRb8nFW2OV9QpQ3ig=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH 1/2] dt-bindings: media: Add macros for video interface bus types
Date:   Sun, 27 Feb 2022 22:33:51 +0200
Message-Id: <20220227203352.17314-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220227203352.17314-1-laurent.pinchart@ideasonboard.com>
References: <20220227203352.17314-1-laurent.pinchart@ideasonboard.com>
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
 include/dt-bindings/media/video-interfaces.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 include/dt-bindings/media/video-interfaces.h

diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
new file mode 100644
index 000000000000..e38058e1cca7
--- /dev/null
+++ b/include/dt-bindings/media/video-interfaces.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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

