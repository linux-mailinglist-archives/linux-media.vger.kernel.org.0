Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC40E326A36
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 23:51:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbhBZWuw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 17:50:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbhBZWuw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 17:50:52 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23ED1C061574;
        Fri, 26 Feb 2021 14:50:12 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C14F0580;
        Fri, 26 Feb 2021 23:50:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1614379810;
        bh=9xbPoCselTfaNNlFq/iLq9ax7icwUScwxe77vp6/2sE=;
        h=From:To:Cc:Subject:Date:From;
        b=EgSG0elkYNBxRPWqVrss9X85CeI4D0IvYDkmaiVRjw55Exn3kCsdZJ42XbvBvOo2E
         vQhi0iYxnEXTN0P1KvZQYtBW9DRfAroJ4goAxmPkYuPpkvEZW8gZkVY+eYvjAE4l+K
         lss1SmybeDqocMBnZpA0K/+Prym5f8Kn4LGjiIGs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH 1/2] list: Add list_is_null() to check if a list_head has been initialized
Date:   Sat, 27 Feb 2021 00:49:37 +0200
Message-Id: <20210226224938.18166-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The new function checks if the list_head prev and next pointers are
NULL, in order to see if a list_head that has been zeroed when allocated
has been initialized with INIT_LIST_HEAD() or added to a list.

This can be used in cleanup functions that want to support being safely
called when an object has not been initialized, to return immediately.
In most cases other fields of the object can be checked for this
purpose, but in some cases a list_head field is the only option.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 include/linux/list.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/list.h b/include/linux/list.h
index 85c92555e31f..e4fc6954de3b 100644
--- a/include/linux/list.h
+++ b/include/linux/list.h
@@ -29,6 +29,19 @@ static inline void INIT_LIST_HEAD(struct list_head *list)
 	list->prev = list;
 }
 
+/**
+ * list_is_null - check if a list_head has been initialized
+ * @list: the list
+ *
+ * Check if the list_head prev and next pointers are NULL. This is useful to
+ * see if a list_head that has been zeroed when allocated has been initialized
+ * with INIT_LIST_HEAD() or added to a list.
+ */
+static inline bool list_is_null(struct list_head *list)
+{
+	return list->prev == NULL && list->next == NULL;
+}
+
 #ifdef CONFIG_DEBUG_LIST
 extern bool __list_add_valid(struct list_head *new,
 			      struct list_head *prev,
-- 
Regards,

Laurent Pinchart

