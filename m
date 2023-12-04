Return-Path: <linux-media+bounces-1563-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAAA803482
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:24:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 378DF1F2112F
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE47250E2;
	Mon,  4 Dec 2023 13:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FZw6LLkP"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD15510E;
	Mon,  4 Dec 2023 05:23:50 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2AEF06607090;
	Mon,  4 Dec 2023 13:23:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701696229;
	bh=b75WmWdAC31wYaSj8EBGol+3A1YhixNlBQKHyIrP9VU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FZw6LLkPRHbExevSYSoH3pN3MBxZ7bW7Aw6MEyb4D/Fu0G8RD9H43mXqdqXqWmodr
	 T/PtPCwwHCegixiV3VWHttC6gwCy5ko2iKNOjWbCXWE6hnyFAdSCpHyhUhQhSTyVrh
	 mSjaKvufxbrIDjYSr5SXOLOx8GYv4bTPnGutkjZMYBIfB7B0RrdbQH7uBkytjbJa+Q
	 DZPEfVsQTUK64laJ6Gi4X5t+rIP7cpN/h8C6QQ1eDMmWGaIO6aRrJzKa9BMU7byIGK
	 7+OP5AbdnJEi009Q2SQXoGCDl2y5PNLyRuLOjnuLZ/My4T0FPNYhOXTXShUhOs5tFl
	 sOLBbYrysVCQQ==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	matt.ranostay@konsulko.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 07/36] media: dvb-core: Remove useless setting of min_buffers_needed
Date: Mon,  4 Dec 2023 14:22:54 +0100
Message-Id: <20231204132323.22811-8-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204132323.22811-1-benjamin.gaignard@collabora.com>
References: <20231204132323.22811-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver uses min_buffers_needed which vb2 uses to ensure
start_streaming is called when at least 'min_buffers_needed'
buffers are queued. However, this driver doesn't need this,
it can stream fine without any buffers queued.
Just drop this unnecessary restriction.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/dvb-core/dvb_vb2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dvb_vb2.c
index 167ff82a6fed..54a3649d8424 100644
--- a/drivers/media/dvb-core/dvb_vb2.c
+++ b/drivers/media/dvb-core/dvb_vb2.c
@@ -171,7 +171,6 @@ int dvb_vb2_init(struct dvb_vb2_ctx *ctx, const char *name, int nonblocking)
 	q->io_modes = VB2_MMAP;
 	q->drv_priv = ctx;
 	q->buf_struct_size = sizeof(struct dvb_buffer);
-	q->min_buffers_needed = 1;
 	q->ops = &dvb_vb2_qops;
 	q->mem_ops = &vb2_vmalloc_memops;
 	q->buf_ops = &dvb_vb2_buf_ops;
-- 
2.39.2


