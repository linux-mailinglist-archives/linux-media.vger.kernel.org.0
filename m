Return-Path: <linux-media+bounces-29986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A117FA84E5B
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 22:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A4734E0B83
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 20:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F90293450;
	Thu, 10 Apr 2025 20:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="o7GeOvSH"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE2820C038;
	Thu, 10 Apr 2025 20:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744317842; cv=none; b=CVUPdNNJsq/EuFVtxrGiFmQkezw39FZWcycGOWDazbuo8Brqi8Cx1SYfZ863PYzqklFtljQr0xCQZA6GlYRxW2TpGAkNwOO1eKBegSILa+JT4Xr6xMakR08yoe6hx1t7vYYiEFLNW1vBPf5mkzqsFPBhvSaiU3rPbKnZ37Mug4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744317842; c=relaxed/simple;
	bh=pAj+FYiDwcaN3SFIk8hI/X3xkau9At2wavKUmU451gc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZtyMh7N91IP6uGT/RXGjiuH50letHB3VSlvudt4n09TzJ+kvVVnEzoOxdDc4naqsUGHp96kgo1i0A7OllH3JIBWSPzG5UGOTweKccprVIC5iPuI/H7FhkXLcqTZCd8lEj4Pjr26RqgKkeFxFQzjjNJRDW52uo4UkOkeMszhceZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=o7GeOvSH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744317838;
	bh=pAj+FYiDwcaN3SFIk8hI/X3xkau9At2wavKUmU451gc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o7GeOvSHDvJcIPcO8OFl3CWGUxXryXPL7B+7ioaZB+M16sQ4DWl2D8O9sHj9CyqYY
	 mzMw7stjXsMptYWD2x9TXSpjGemM8HJgZzSxfXWt+jDsf4qiJF6pYZhgZ8SJklCTmX
	 PF2tperY7P0SgzjW81UuM9JQ5m2oCnH/4eJz+YFZLnAYgXSA4xgRBEQahhKYV71khH
	 Ygqa2gww/qle1oVgy/XrIOfxJ33hIRaUaYnhYst8ATnXXl1P5hu7Q2Pn3nkWFuiiMK
	 kwDVy6k+nvof0+xribo4mSDXr6W09LrNr+n70nPo1u2RO25Y4RWRUzlLUjQ7VoR52z
	 I9MQHBGiG6uqA==
Received: from [192.168.13.3] (unknown [IPv6:2606:6d00:11:e976::c73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CFC4017E0809;
	Thu, 10 Apr 2025 22:43:57 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Thu, 10 Apr 2025 16:43:46 -0400
Subject: [PATCH 1/2] media: synopsys: hdmirx: Renamed frame_idx to sequence
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-rk3588-hdmirx-sequence-v1-1-aad3f216d351@collabora.com>
References: <20250410-rk3588-hdmirx-sequence-v1-0-aad3f216d351@collabora.com>
In-Reply-To: <20250410-rk3588-hdmirx-sequence-v1-0-aad3f216d351@collabora.com>
To: Shreeya Patel <shreeya.patel@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Dingxian Wen <shawn.wen@rock-chips.com>
Cc: linux-media@vger.kernel.org, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2

This variable is used to fill the v4l2_buffer.sequence, let's name it
the exact same way to reduce confusion.

No functional changes.

Fixes: 7b59b132ad439 ("media: platform: synopsys: Add support for HDMI input driver")
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 3d2913de9a86c6a4e66562727388b4326365048a..f5b3f5010ede55bde28756da326a434cc9245492 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -114,7 +114,7 @@ struct hdmirx_stream {
 	spinlock_t vbq_lock; /* to lock video buffer queue */
 	bool stopping;
 	wait_queue_head_t wq_stopped;
-	u32 frame_idx;
+	u32 sequence;
 	u32 line_flag_int_cnt;
 	u32 irq_stat;
 };
@@ -1540,7 +1540,7 @@ static int hdmirx_start_streaming(struct vb2_queue *queue, unsigned int count)
 	int line_flag;
 
 	mutex_lock(&hdmirx_dev->stream_lock);
-	stream->frame_idx = 0;
+	stream->sequence = 0;
 	stream->line_flag_int_cnt = 0;
 	stream->curr_buf = NULL;
 	stream->next_buf = NULL;
@@ -1948,7 +1948,7 @@ static void dma_idle_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
 
 			if (vb_done) {
 				vb_done->vb2_buf.timestamp = ktime_get_ns();
-				vb_done->sequence = stream->frame_idx;
+				vb_done->sequence = stream->sequence;
 
 				if (bt->interlaced)
 					vb_done->field = V4L2_FIELD_INTERLACED_TB;
@@ -1956,8 +1956,8 @@ static void dma_idle_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
 					vb_done->field = V4L2_FIELD_NONE;
 
 				hdmirx_vb_done(stream, vb_done);
-				stream->frame_idx++;
-				if (stream->frame_idx == 30)
+				stream->sequence++;
+				if (stream->sequence == 30)
 					v4l2_dbg(1, debug, v4l2_dev,
 						 "rcv frames\n");
 			}

-- 
2.48.1


