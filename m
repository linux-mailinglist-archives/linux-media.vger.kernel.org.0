Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1194718A714
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 22:31:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727184AbgCRVb0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 17:31:26 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:6205 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726747AbgCRVb0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 17:31:26 -0400
X-Halon-ID: bd65fea8-695f-11ea-9f40-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2392.dip0.t-ipconnect.de [79.202.35.146])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id bd65fea8-695f-11ea-9f40-0050569116f7;
        Wed, 18 Mar 2020 22:30:51 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] [DNI] v4l-utils: Add flags filed to media_device_info in media.h
Date:   Wed, 18 Mar 2020 22:31:14 +0100
Message-Id: <20200318213115.3201107-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200318213115.3201107-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200318213115.3201107-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the flags from the out of tree patches that adds a field and flags
to struct media_device_info. This patch is not intended for consumption
but to ease adding logic to media-ctl while the patches makes their way
into the media-tree.

Not-yet-Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 include/linux/media.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/linux/media.h b/include/linux/media.h
index f4ba8ae3e410103c..0982814dfc06daab 100644
--- a/include/linux/media.h
+++ b/include/linux/media.h
@@ -32,9 +32,13 @@ struct media_device_info {
 	__u32 media_version;
 	__u32 hw_revision;
 	__u32 driver_version;
-	__u32 reserved[31];
+	__u32 flags;
+	__u32 reserved[30];
 };
 
+#define MEDIA_INFO_FLAG_INCOMPLETE	(1 << 0)
+#define MEDIA_INFO_FLAG_COMPLETE	(1 << 1)
+
 /*
  * Base number ranges for entity functions
  *
-- 
2.25.0

