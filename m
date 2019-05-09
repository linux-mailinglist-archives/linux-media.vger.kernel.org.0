Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A84A218752
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2019 11:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbfEIJAF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 May 2019 05:00:05 -0400
Received: from mx2.suse.de ([195.135.220.15]:42890 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726174AbfEIJAE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 May 2019 05:00:04 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 552E7B0DA;
        Thu,  9 May 2019 09:00:03 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     hverkuil@xs4all.nl, linux-media@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] media: pwc: convert to BIT macro
Date:   Thu,  9 May 2019 10:59:30 +0200
Message-Id: <20190509085930.8940-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This converts the driver to using the BIT macro to increase readability

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/usb/pwc/pwc.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/usb/pwc/pwc.h b/drivers/media/usb/pwc/pwc.h
index 67010010d2a2..28b2c0cb79ac 100644
--- a/drivers/media/usb/pwc/pwc.h
+++ b/drivers/media/usb/pwc/pwc.h
@@ -55,15 +55,15 @@
 
 
 /* Trace certain actions in the driver */
-#define PWC_DEBUG_LEVEL_MODULE	(1<<0)
-#define PWC_DEBUG_LEVEL_PROBE	(1<<1)
-#define PWC_DEBUG_LEVEL_OPEN	(1<<2)
-#define PWC_DEBUG_LEVEL_READ	(1<<3)
-#define PWC_DEBUG_LEVEL_MEMORY	(1<<4)
-#define PWC_DEBUG_LEVEL_FLOW	(1<<5)
-#define PWC_DEBUG_LEVEL_SIZE	(1<<6)
-#define PWC_DEBUG_LEVEL_IOCTL	(1<<7)
-#define PWC_DEBUG_LEVEL_TRACE	(1<<8)
+#define PWC_DEBUG_LEVEL_MODULE	BIT(0)
+#define PWC_DEBUG_LEVEL_PROBE	BIT(1)
+#define PWC_DEBUG_LEVEL_OPEN	BIT(2)
+#define PWC_DEBUG_LEVEL_READ	BIT(3)
+#define PWC_DEBUG_LEVEL_MEMORY	BIT(4)
+#define PWC_DEBUG_LEVEL_FLOW	BIT(5)
+#define PWC_DEBUG_LEVEL_SIZE	BIT(6)
+#define PWC_DEBUG_LEVEL_IOCTL	BIT(7)
+#define PWC_DEBUG_LEVEL_TRACE	BIT(8)
 
 #define PWC_DEBUG_MODULE(fmt, args...) PWC_DEBUG(MODULE, fmt, ##args)
 #define PWC_DEBUG_PROBE(fmt, args...) PWC_DEBUG(PROBE, fmt, ##args)
-- 
2.16.4

