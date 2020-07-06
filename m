Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 972FB215E76
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729724AbgGFShi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:37:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729849AbgGFShg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:37:36 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4EBCED6E;
        Mon,  6 Jul 2020 20:37:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060651;
        bh=kzu18YDkX9hNgaAE+VaUDaevg1JBquNoPW2OWRG9z68=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Sv4T62mURrAGpYf4+XCNe7s+L1ox8YcKEAuCMqCOsWXEtBOF7z6osZUNMQykauP2p
         uYBgnxLq40ACt6Z+p4DvawqxMex6PKAKW94Yua3NIF/hoW6Fhm5+fD/pnOhOs0wUL6
         MO79tN8VxrataulcrSY7vBvXZgLbpElnnxyMo5UI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 008/108] media: ti-vpe: cal: Turn reg_(read|write)_field() into inline functions
Date:   Mon,  6 Jul 2020 21:35:29 +0300
Message-Id: <20200706183709.12238-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Turn the reg_(read|write)_field() macros into inline functions for
additional type safety. Use the FIELD_GET() and FIELD_PREP() macros
internally instead of reinventing the wheel.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 9b5ad48538c1..278477cf0ae9 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -6,6 +6,7 @@
  * Benoit Parrot, <bparrot@ti.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
@@ -76,13 +77,6 @@ static const struct v4l2_fract
 #define reg_read(dev, offset) ioread32(dev->base + offset)
 #define reg_write(dev, offset, val) iowrite32(val, dev->base + offset)
 
-#define reg_read_field(dev, offset, mask) get_field(reg_read(dev, offset), \
-						    mask)
-#define reg_write_field(dev, offset, field, mask) { \
-	u32 val = reg_read(dev, offset); \
-	set_field(&val, field, mask); \
-	reg_write(dev, offset, val); }
-
 /* ------------------------------------------------------------------
  *	Basic structures
  * ------------------------------------------------------------------
@@ -418,6 +412,21 @@ struct cal_ctx {
 	bool dma_act;
 };
 
+static inline u32 reg_read_field(struct cal_dev *dev, u32 offset, u32 mask)
+{
+	return FIELD_GET(mask, reg_read(dev, offset));
+}
+
+static inline void reg_write_field(struct cal_dev *dev, u32 offset, u32 value,
+				   u32 mask)
+{
+	u32 val = reg_read(dev, offset);
+
+	val &= ~mask;
+	val |= FIELD_PREP(mask, value);
+	reg_write(dev, offset, val);
+}
+
 static const struct cal_fmt *find_format_by_pix(struct cal_ctx *ctx,
 						u32 pixelformat)
 {
@@ -453,11 +462,6 @@ static inline struct cal_ctx *notifier_to_ctx(struct v4l2_async_notifier *n)
 	return container_of(n, struct cal_ctx, notifier);
 }
 
-static inline int get_field(u32 value, u32 mask)
-{
-	return (value & mask) >> __ffs(mask);
-}
-
 static inline void set_field(u32 *valp, u32 field, u32 mask)
 {
 	u32 val = *valp;
-- 
Regards,

Laurent Pinchart

