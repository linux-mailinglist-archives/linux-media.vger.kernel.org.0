Return-Path: <linux-media+bounces-1568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DC480348C
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:24:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 091EC1F210C6
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56BCE2556C;
	Mon,  4 Dec 2023 13:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iGgq6AMr"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A1EE187;
	Mon,  4 Dec 2023 05:24:00 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4DE0A6607090;
	Mon,  4 Dec 2023 13:23:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701696238;
	bh=JC1ApPThEFi+YkEPaYavKRjqsYCfmAjyWnjgDZQA57Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iGgq6AMrz/K6w72xKTX2JlOjH5fAYO4VyU8r4gTG5zhCF9vZdh6XfNr7UqL5sAOp+
	 yig/ihVATezjkLt35itsHyTI3bHdGtrz/yDhtV6el27SDNamXMZW2RRZY41roQKKfv
	 1A6dXuesJNJnxiORpnVTE4QphvJNAi7d9+PTRsjFzmINtILg7Tb8DttYbxf7wA7nLj
	 KOoB2tIV47W8mplraKZ8dMwpJQgE6nfC/T+1FWJy0S1ka8vPd/Ub1QZRuYPuHUayi1
	 mhVdCzArsjjHnVtif3FbIfedLSRlNvIGwT6Hayo1bAFyJDDH/BLdL6KxhSFf8DdvsW
	 LRbO4121PBseA==
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
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Nick Dyer <nick@shmanahar.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Subject: [PATCH v2 12/36] input: touchscreen: atmel: Remove useless setting of min_buffers_needed
Date: Mon,  4 Dec 2023 14:22:59 +0100
Message-Id: <20231204132323.22811-13-benjamin.gaignard@collabora.com>
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
CC: Nick Dyer <nick@shmanahar.org>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: linux-input@vger.kernel.org
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 20094b9899f0..d98cf9560511 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2546,7 +2546,6 @@ static const struct vb2_queue mxt_queue = {
 	.ops = &mxt_queue_ops,
 	.mem_ops = &vb2_vmalloc_memops,
 	.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC,
-	.min_buffers_needed = 1,
 };
 
 static int mxt_vidioc_querycap(struct file *file, void *priv,
-- 
2.39.2


