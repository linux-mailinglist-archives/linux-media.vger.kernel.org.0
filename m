Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 934FA18A706
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 22:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbgCRVbG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 17:31:06 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:6137 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726894AbgCRVbG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 17:31:06 -0400
X-Halon-ID: b19d55db-695f-11ea-9f40-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2392.dip0.t-ipconnect.de [79.202.35.146])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id b19d55db-695f-11ea-9f40-0050569116f7;
        Wed, 18 Mar 2020 22:30:31 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [RFC 1/5] uapi/linux/media.h: add flag field to struct media_device_info
Date:   Wed, 18 Mar 2020 22:30:47 +0100
Message-Id: <20200318213051.3200981-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200318213051.3200981-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200318213051.3200981-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a flags field to the media_device_info structure by taking one
of the reserved u32 fields. The use-case is to have a way to
(optionally) report to user-space if the media graph is complete or not.

Also define two flags to carry information about if the graph is
complete or not. If neither of the two flags are set the
media device does not support reporting its graph status. The other bits
in the flags field are unused for now, but could be claimed to carry
other type of information in the future.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 include/uapi/linux/media.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 383ac7b7d8f07eca..9b37ed8b41d0d866 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -34,9 +34,16 @@ struct media_device_info {
 	__u32 media_version;
 	__u32 hw_revision;
 	__u32 driver_version;
-	__u32 reserved[31];
+	__u32 flags;
+	__u32 reserved[30];
 };
 
+/*
+ * Graph flags
+ */
+#define MEDIA_INFO_FLAG_INCOMPLETE	(1 << 0)
+#define MEDIA_INFO_FLAG_COMPLETE	(1 << 1)
+
 /*
  * Base number ranges for entity functions
  *
-- 
2.25.1

