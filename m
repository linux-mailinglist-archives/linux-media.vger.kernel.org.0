Return-Path: <linux-media+bounces-1213-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DBE7FB70D
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:22:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFA72282AFF
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB22D4E600;
	Tue, 28 Nov 2023 10:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vapJaxkX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20233E1
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 02:22:20 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08373BB2;
	Tue, 28 Nov 2023 11:21:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701166901;
	bh=yCPjeZXwJpMHjLU9xbEapeJcCuvQVvsO+wlqmdMj5q4=;
	h=From:To:Cc:Subject:Date:From;
	b=vapJaxkXcImwezp/x+8l2RsLR3dqAYgZgss8sneylEzoguF+IEC6+ISgYWf/QI56Q
	 gBI6WgwTTDHzxH7GT+8TxKGRqU1b52DdNpCR6LCFCJW/h53H5K2gsJNsu7sCPJYp0h
	 K4of8RpERMlbGbRbjElZqqfg5jLXg2hpPn5cJ24Y=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: i2c: thp7312: Fix missing unlock in return path
Date: Tue, 28 Nov 2023 12:22:22 +0200
Message-ID: <20231128102222.9795-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One of the return paths in the thp7312_fw_write() function failed to
release a lock. Fix it.

Fixes: 29adc7a89b52 ("media: i2c: Add driver for THine THP7312")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Sakari, this patch fixes a bug in your master branch scheduled for v6.8.
Feel free to apply it on top or squash it with the commit that
introduced the bug based on what is the most convenient for you.
---
 drivers/media/i2c/thp7312.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/thp7312.c b/drivers/media/i2c/thp7312.c
index 04b78c1f8090..3d46e428e0ac 100644
--- a/drivers/media/i2c/thp7312.c
+++ b/drivers/media/i2c/thp7312.c
@@ -1805,12 +1805,15 @@ static enum fw_upload_err thp7312_fw_write(struct fw_upload *fw_upload,
 	struct device *dev = thp7312->dev;
 	u16 header_size = size - THP7312_FW_RAM_SIZE;
 	enum fw_upload_err ret;
+	bool cancel;
 
 	mutex_lock(&thp7312->fw_lock);
-	if (thp7312->fw_cancel)
-		return FW_UPLOAD_ERR_CANCELED;
+	cancel = thp7312->fw_cancel;
 	mutex_unlock(&thp7312->fw_lock);
 
+	if (cancel)
+		return FW_UPLOAD_ERR_CANCELED;
+
 	ret = thp7312_flash_erase(thp7312);
 	if (ret != FW_UPLOAD_ERR_NONE)
 		return ret;

base-commit: bdfbc0f7b7d2b8e9a2ddeb2da7f003c4f60da97e
-- 
Regards,

Laurent Pinchart


