Return-Path: <linux-media+bounces-25307-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAC9A1D513
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 12:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2D3318870CF
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 11:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751FD1FE44E;
	Mon, 27 Jan 2025 11:04:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2067603F
	for <linux-media@vger.kernel.org>; Mon, 27 Jan 2025 11:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737975865; cv=none; b=kLurzs7GCcOKCwZB3UaQYzgZWG11662t18Cq/KYcSt7C8LrJWV8SB/dvgqOf8foCzBO2sXMDnAUgXNbIATwu6jHAmH0TbfYY5XzgouUmfPq00zfeqUCidB3IOVaazTOs0HSyuzUkUOnEkvDEEdDRyPeio+4qGohQU2LYFBR5zjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737975865; c=relaxed/simple;
	bh=XfZu26jnOi/NOhI1BHJt6les00al3rVxXG8p9d6t28k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tzWv9h0DT/eI+gGwnUHUQYFM/ZG4K/E3DuQ+2tn6YsFiK9AS2r8Smrp/538/ngFijH2ndLq4uFe0R9ouOqBiw8G1A6/KeP0YSL4HUhVW/18Rp8xEs12SzkOxIJPhWvMkjxjKVeu4L320EU+S7PyHRycezlUpKFAMh8U3UA1CrKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3221C4CEE1;
	Mon, 27 Jan 2025 11:04:23 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv2 1/2] media: v4l2-dv-timings: add v4l2_num_edid_blocks() helper
Date: Mon, 27 Jan 2025 12:03:12 +0100
Message-ID: <0c7d1bbf315b4a695625ad9cb0f2cb8ee55544e3.1737975793.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1737975793.git.hverkuil@xs4all.nl>
References: <cover.1737975793.git.hverkuil@xs4all.nl>
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
 drivers/media/v4l2-core/v4l2-dv-timings.c | 36 +++++++++++++++++++++++
 include/media/v4l2-dv-timings.h           |  1 +
 2 files changed, 37 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dv-timings.c b/drivers/media/v4l2-core/v4l2-dv-timings.c
index d26edf157e64..6361e11d2be7 100644
--- a/drivers/media/v4l2-core/v4l2-dv-timings.c
+++ b/drivers/media/v4l2-core/v4l2-dv-timings.c
@@ -1017,6 +1017,42 @@ v4l2_hdmi_rx_colorimetry(const struct hdmi_avi_infoframe *avi,
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
+	unsigned int blocks;
+
+	if (!edid || !max_blocks)
+		return 0;
+
+	// The number of extension blocks is recorded at byte 126 of the
+	// first 128-byte block in the EDID.
+	//
+	// If there is an HDMI Forum EDID Extension Override Data Block
+	// present, then it is in bytes 4-6 of the first CTA-861 extension
+	// block of the EDID.
+	blocks = edid[126] + 1;
+	// Check for HDMI Forum EDID Extension Override Data Block
+	if (blocks >= 2 &&	// The EDID must be at least 2 blocks
+	    max_blocks >= 3 &&  // The caller supports at least 3 blocks
+	    edid[128] == 2 &&	// The first extension block is type CTA-861
+	    edid[133] == 0x78 && // Identifier for the EEODB
+	    (edid[132] & 0xe0) == 0xe0 && // Tag Code == 7
+	    (edid[132] & 0x1f) >= 2 &&	// Length >= 2
+	    edid[134] > 1)	// Number of extension blocks is sane
+		blocks = edid[134] + 1;
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


