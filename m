Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 788792CE258
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 00:10:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728922AbgLCXIX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 18:08:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:33834 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726179AbgLCXIX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 18:08:23 -0500
From:   Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: ti-vpe: cal: avoid FIELD_GET assertion
Date:   Fri,  4 Dec 2020 00:07:30 +0100
Message-Id: <20201203230738.1481199-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

FIELD_GET() must only be used with a mask that is a compile-time
constant:

drivers/media/platform/ti-vpe/cal.h: In function 'cal_read_field':
include/linux/compiler_types.h:320:38: error: call to '__compiletime_assert_247' declared with attribute error: FIELD_GET: mask is not constant
include/linux/bitfield.h:46:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
   46 |   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),  \
      |   ^~~~~~~~~~~~~~~~
drivers/media/platform/ti-vpe/cal.h:220:9: note: in expansion of macro 'FIELD_GET'
  220 |  return FIELD_GET(mask, cal_read(cal, offset));
      |         ^~~~~~~~~

The problem here is that the function is not always inlined. Mark it
__always_inline to avoid the problem.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/platform/ti-vpe/cal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 4123405ee0cf..20d07311d222 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -215,7 +215,7 @@ static inline void cal_write(struct cal_dev *cal, u32 offset, u32 val)
 	iowrite32(val, cal->base + offset);
 }
 
-static inline u32 cal_read_field(struct cal_dev *cal, u32 offset, u32 mask)
+static __always_inline u32 cal_read_field(struct cal_dev *cal, u32 offset, u32 mask)
 {
 	return FIELD_GET(mask, cal_read(cal, offset));
 }
-- 
2.27.0

