Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7943324EBA7
	for <lists+linux-media@lfdr.de>; Sun, 23 Aug 2020 07:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgHWFDb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Aug 2020 01:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725139AbgHWFDa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Aug 2020 01:03:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 207F3C061573
        for <linux-media@vger.kernel.org>; Sat, 22 Aug 2020 22:03:29 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2664279;
        Sun, 23 Aug 2020 07:03:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1598158999;
        bh=pCzlECsGsGlZ009xXDAzUUxxYRXREdIH2Vxcu2J4NoA=;
        h=From:To:Cc:Subject:Date:From;
        b=wna3R5amAoR1l5Bmtiiw+v3SgMfm4JGvJoymrg8wCxrgljpMw51vRaGS5lfqlBLAx
         SkDqbTJZUQJjKa0GsXajUzf8ZHpISmrWLNVuWuw66UhpZoZGzNy7aGhZEvT6bHCD8a
         87cN/DkwIVoRggoROSztWe6nUCcHqFElhdsy6oGA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH] media: ti-vpe: cal: Fix compilation on 32-bit ARM
Date:   Sun, 23 Aug 2020 08:02:57 +0300
Message-Id: <20200823050257.564-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When compiled on 32-bit ARM, the CAL driver fails with the FIELD_PREP()
macro complaining that the mask is not constant. While all callers of
the inline cal_write_field() function pass a constant mask, the mask
parameter itself is a variable, which likely doesn't please the
compiler.

Fix it by replacing FIELD_PREP() with a manual implementation.

Fixes: 50797fb30b95 ("media: ti-vpe: cal: Turn reg_(read|write)_field() into inline functions")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index e496083715d2..4123405ee0cf 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -226,7 +226,7 @@ static inline void cal_write_field(struct cal_dev *cal, u32 offset, u32 value,
 	u32 val = cal_read(cal, offset);
 
 	val &= ~mask;
-	val |= FIELD_PREP(mask, value);
+	val |= (value << __ffs(mask)) & mask;
 	cal_write(cal, offset, val);
 }
 
-- 
Regards,

Laurent Pinchart

