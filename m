Return-Path: <linux-media+bounces-1143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C71877FA737
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D37B1F20F22
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B133EA8C;
	Mon, 27 Nov 2023 16:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="d5k8un7Z"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 161632689;
	Mon, 27 Nov 2023 08:55:36 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 10CF3660732E;
	Mon, 27 Nov 2023 16:55:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104135;
	bh=+QiW4+PKMpn2QOF9ET7fPoqeBffKw0nbwvNL+3C6ds0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d5k8un7Z4Qh5e/OGB9kL3m0OUr76zb73WO5lo60s/dRut7VkUohGVMUPd76SkojDB
	 QQeeHKv8AGcKmyEhuPhxffYBlVBY+uq+No1fxE8S0EFp/7X2bJo7c/2a6iyhmf2JJl
	 PRn3rcCY7uZ8JQMC0BBZjA0ZKXxkBMcDvhztqel1YmVdNWTjk9jw2AqvS/kZZuDE7P
	 hdSRxbOF7g0ZcEcDv0njaD9jtbLTJHmWt7l5H1PWMAnaHCN2buGJLHfzZoL8SZwvwp
	 BHeTczCoV+xl60d9M5YcqyaXzBOpF1nR0yI9xAQTgFoEwxGSpN1X2XNBVWrgPykaZm
	 U4T7u6KX2KF4w==
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
	Jai Luthra <j-luthra@ti.com>
Subject: [PATCH 38/55] media: ti: j721e-csi2rx: Use min_dma_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:37 +0100
Message-Id: <20231127165454.166373-39-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
References: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

j721e-csi2rx driver use a dma engine and needs a minimum number of
buffers to be present before start streaming.
That is 'min_dma_buffers_needed' purpose so use it instead
of 'min_buffers_needed' field.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Jai Luthra <j-luthra@ti.com>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index ada61391c8d2..55e843419eb9 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -873,7 +873,7 @@ static int ti_csi2rx_init_vb2q(struct ti_csi2rx_dev *csi)
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->dev = dmaengine_get_dma_device(csi->dma.chan);
 	q->lock = &csi->mutex;
-	q->min_buffers_needed = 1;
+	q->min_dma_buffers_needed = 1;
 
 	ret = vb2_queue_init(q);
 	if (ret)
-- 
2.39.2


