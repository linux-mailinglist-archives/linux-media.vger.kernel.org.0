Return-Path: <linux-media+bounces-1558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F77803477
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:23:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 964C21C20A7C
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B100524B3F;
	Mon,  4 Dec 2023 13:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="e4isb/PH"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88880D2;
	Mon,  4 Dec 2023 05:23:39 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DB358660711D;
	Mon,  4 Dec 2023 13:23:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701696218;
	bh=SGWc3SJhUtEriZPP5qupv/R50VZL3SHH8MYp7sJ69S4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e4isb/PHzPqbYTiDeO0t2dgjXId0TEpiepai054+cSFHueB9PjmQG14sNxwrOoL9y
	 Jale9GU8xk5ZPILkf7eoZoxxGaWFjgBq5g2Xo7+42VAtB7SaOSgSy6mUO/5Y/3UBU3
	 tsmO+daHgh4NxoiuI/65um63McMKYsRsKB1grdewU6f1qtNirrqzzh35/ikYuN0uVL
	 oR7seZX2nKDzLe5KG8WNfoasMFnCZ2JXzoI4kqrtAnKtcx66EkvR7pSQhovGJYFbEa
	 e9yMzJUFaVyHFMp957ZfjTgr7XExwyQm0AlNDS5BXt1NYWcRUAef17zP7J4w26aHIJ
	 VtJcwuMYLAzTg==
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
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 02/36] media: chips-media: coda: Remove useless setting of min_buffers_needed
Date: Mon,  4 Dec 2023 14:22:49 +0100
Message-Id: <20231204132323.22811-3-benjamin.gaignard@collabora.com>
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
CC: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/chips-media/coda/coda-common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index f1d85758f6dd..d5529f988d2c 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -2546,7 +2546,6 @@ static int coda_queue_init(struct coda_ctx *ctx, struct vb2_queue *vq)
 	 * would need to be reflected in job_ready(). Currently we expect all
 	 * queues to have at least one buffer queued.
 	 */
-	vq->min_buffers_needed = 1;
 	vq->dev = ctx->dev->dev;
 
 	return vb2_queue_init(vq);
-- 
2.39.2


