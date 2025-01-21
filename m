Return-Path: <linux-media+bounces-25037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8389A17B94
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 11:27:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADEF216C41C
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 10:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE091F191A;
	Tue, 21 Jan 2025 10:25:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0782F1EE7D6
	for <linux-media@vger.kernel.org>; Tue, 21 Jan 2025 10:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737455106; cv=none; b=TulOHeB9O0zVJc9WbnE9cLDJOUgODzhsi2Bsjc2OaYQG4Y04ykVzr7qzGpKyMLLJ7kqOiHzvnWk+uW3F2p24csDv3bV2qWAaGjVtslEA3rkMfBYkWDZnpj5w+E5mUGS+oaf202TJ2+O9JUXVSQsDLztL5/A2WT6HGVn/yKPjVgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737455106; c=relaxed/simple;
	bh=eyBf1XNyXzl+Xm0C/gTGK/kpxWbD/yc6f/K/JrLz1yM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JScEcNWSWMQLJRRBEKUlhHGzKcUsxkGFSQCPcNkrBb8PE1CKEA2VloZBsHefCgP99Umb7u1CFBrR2avubN3/9D4kC6TJMYaAJgnm0aOhEbgoqhyu2opsh3LK0p7BfpKz32UcjCn9T6VfbGyfgfOfx/xnu9CwutNoEK4bFb8qZLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B09C4CEE2;
	Tue, 21 Jan 2025 10:25:04 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 1/2] media: v4l2-dv-timings: add v4l2_num_edid_blocks() helper
Date: Tue, 21 Jan 2025 11:21:41 +0100
Message-ID: <aa6ec77d6c0e565a8c1105178540a5a7e8170b27.1737454902.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1737454902.git.hverkuil@xs4all.nl>
References: <cover.1737454902.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This new function determines how many blocks the EDID has.
Traditionally the number of extension blocks is read from
the EDID at offset 126, but this can be overridden by the
HDMI Forum EDID Extension Override Data Block. So check
that as well in this helper.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-dv-timings.c | 29 +++++++++++++++++++++++
 include/media/v4l2-dv-timings.h           |  1 +
 2 files changed, 30 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dv-timings.c b/drivers/media/v4l2-core/v4l2-dv-timings.c
index d26edf157e64..f17766b2d800 100644
--- a/drivers/media/v4l2-core/v4l2-dv-timings.c
+++ b/drivers/media/v4l2-core/v4l2-dv-timings.c
@@ -1017,6 +1017,35 @@ v4l2_hdmi_rx_colorimetry(const struct hdmi_avi_infoframe *avi,
 }
 EXPORT_SYMBOL_GPL(v4l2_hdmi_rx_colorimetry);
 
+/**
+ * v4l2_num_edid_blocks() - return the number of EDID blocks
+ *
+ * @edid:	pointer to the EDID data
+ * @max_blocks:	maximum number of supported EDID blocks
+ *
+ * Return: the number of EDID blocks based on the contents of the EDID.
+ *	   This supports the HDMI Forum EDID Extension Override Data Block.
+ */
+unsigned int v4l2_num_edid_blocks(const u8 *edid, unsigned int max_blocks)
+{
+	unsigned int blocks = 0;
+
+	if (edid && max_blocks) {
+		blocks = edid[126] + 1;
+		// Check for HDMI Forum EDID Extension Override Data Block
+		if (blocks >= 2 &&
+		    max_blocks >= 3 &&
+		    edid[128] == 2 &&
+		    edid[133] == 0x78 &&
+		    (edid[132] & 0xe0) == 0xe0 &&
+		    (edid[132] & 0x1f) >= 2 &&
+		    edid[134] > 1)
+			blocks = edid[134] + 1;
+	}
+	return blocks > max_blocks ? max_blocks : blocks;
+}
+EXPORT_SYMBOL_GPL(v4l2_num_edid_blocks);
+
 /**
  * v4l2_get_edid_phys_addr() - find and return the physical address
  *
diff --git a/include/media/v4l2-dv-timings.h b/include/media/v4l2-dv-timings.h
index ff07dc6b103c..714075c72f77 100644
--- a/include/media/v4l2-dv-timings.h
+++ b/include/media/v4l2-dv-timings.h
@@ -252,6 +252,7 @@ v4l2_hdmi_rx_colorimetry(const struct hdmi_avi_infoframe *avi,
 			 const struct hdmi_vendor_infoframe *hdmi,
 			 unsigned int height);
 
+unsigned int v4l2_num_edid_blocks(const u8 *edid, unsigned int max_blocks);
 u16 v4l2_get_edid_phys_addr(const u8 *edid, unsigned int size,
 			    unsigned int *offset);
 void v4l2_set_edid_phys_addr(u8 *edid, unsigned int size, u16 phys_addr);
-- 
2.45.2


