Return-Path: <linux-media+bounces-1939-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5066E80A14B
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 11:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C3DA281A33
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 10:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BDAC18E38;
	Fri,  8 Dec 2023 10:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QNChLG3C"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F2FE1728;
	Fri,  8 Dec 2023 02:39:18 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8F57366022D2;
	Fri,  8 Dec 2023 10:39:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702031957;
	bh=FTU8KzPND5ID0Hx3E+vk2e0gEDIDzN1LiyjU+EkE4jI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QNChLG3Cd7dmkazS0LpWTdD/h0zPVtHSVak2JH6E9IfHxMxkOq/bHBxUwqAmAUKi0
	 L3oWB7YIP3p73uKSlAhjz/0elhDsgrCmDyBuQnVyEDm5iI7zt4j2srjFoRqLncentA
	 BtSYj2uX9gbKFN0WcKW3vehsgbbD2kS5fOJtRZIdF1AOc1WxG1+zTJEqfeSSrurE7r
	 f4i1YvMQCdAkS07dHKIjTc4dIZos+UTh8gmRFfT7i+NtNIDk20NXLPNcwhmoN6OhP2
	 SapJYYoeaKX+3z+Sa6Ublgv8HP9DTi6UhH1jlMikNME3BI3fx3WBbZ3+8ypuBBuFC0
	 iRpsFglLQF2pg==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org,
	tfiga@chromium.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v4 2/2] videobuf2: Add min_reqbufs_allocation field to vb2_queue structure
Date: Fri,  8 Dec 2023 11:39:08 +0100
Message-Id: <20231208103908.85874-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231208103908.85874-1-benjamin.gaignard@collabora.com>
References: <20231208103908.85874-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add 'min_reqbufs_allocation' field in vb2_queue structure so drivers
can specificy the minimum number of buffers to allocate when calling
VIDIOC_REQBUFS.
If used this minimum should be higher than the minimum number of
queued buffers needed to start streaming.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 1 +
 include/media/videobuf2-core.h                  | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 7b6d89641e66..3bc30d107308 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -866,6 +866,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	 * Make sure the requested values and current defaults are sane.
 	 */
 	num_buffers = max_t(unsigned int, *count, q->min_queued_buffers);
+	num_buffers = max_t(unsigned int, num_buffers, q->min_reqbufs_allocation);
 	num_buffers = min_t(unsigned int, num_buffers, q->max_num_buffers);
 	memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
 	/*
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 6d11cb724e95..252d34cc47d3 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -550,6 +550,11 @@ struct vb2_buf_ops {
  *		@start_streaming can be called. Used when a DMA engine
  *		cannot be started unless at least this number of buffers
  *		have been queued into the driver.
+ * @min_reqbufs_allocation: the minimum number of buffers allocated when
+ *		calling VIDIOC_REQBUFS. Used when drivers need a to
+ *		specify a minimum buffers allocation before setup a queue.
+ *		If min_queued_buffers < min_queued_buffers then min_queued_buffers
+ *		is the minimum.
  */
 /*
  * Private elements (won't appear at the uAPI book):
@@ -615,6 +620,7 @@ struct vb2_queue {
 	u32				timestamp_flags;
 	gfp_t				gfp_flags;
 	u32				min_queued_buffers;
+	u32				min_reqbufs_allocation;
 
 	struct device			*alloc_devs[VB2_MAX_PLANES];
 
-- 
2.39.2


