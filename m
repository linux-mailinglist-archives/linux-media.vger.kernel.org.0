Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2082A1F8B6E
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbgFOAAX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:23 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728060AbgFOAAV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:21 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B05C31250;
        Mon, 15 Jun 2020 02:00:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179213;
        bh=6lIwMDPvKgYPI+JwF/2nL+6il7im5lRCeEGGl/bGOEI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NKZC7N2DR+A0DerPmloWxxSlLMFnMaNPB/dzCqJCFLpGNH9JuhKiqoGP1YZ71NgPj
         0zJxEjo5bOl0BJacbmZEkN5UWrm98+sjQiAXLqeHuHACivJhFjMsPmRl+wpetXfiKX
         Phtz5Fu3Br6vBosFNfN6fQszPsT7lwM5kWBHlQBE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 008/107] media: ti-vpe: cal: Turn reg_(read|write)_field() into inline functions
Date:   Mon, 15 Jun 2020 02:58:05 +0300
Message-Id: <20200614235944.17716-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
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
---
 drivers/media/platform/ti-vpe/cal.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index fa86a53882cc..8c068af936f0 100644
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

