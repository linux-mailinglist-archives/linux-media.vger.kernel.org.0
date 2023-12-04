Return-Path: <linux-media+bounces-1566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58870803487
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:24:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1419E280FAF
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBCD22555C;
	Mon,  4 Dec 2023 13:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="R1cyr0Cz"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55E94D4B;
	Mon,  4 Dec 2023 05:23:56 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A5222660711D;
	Mon,  4 Dec 2023 13:23:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701696235;
	bh=INhnWKxfeyDOt5+MSDz9mj1pvx9+8U4kzLbB8RirFts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R1cyr0Cz6N9zmXvAIXxoYllx2wyLKTZZi4UYPUCpchQiqpZuk7NPNTzz3K3ba6nGW
	 U65GelxmN6oDuAemsPWzYSVsdMZ5L5VpLjLgHzafY7hXTt1Bfd6rpAJ3+OMe0nAhSV
	 LvPfgrilMfXz+gqfJCoeX4RMCHXmpkC2oC/mSQkTw8iCrgP3KTz2BTKby2C0kBTPeo
	 /iRGBvglcJwdnpUDyyTsp0gY1cdgwlANhHhT2akrKRbVaNGNQpVicR/3xKaXRDAn9E
	 qcYRl+2pZAfgnqhozV1MrzMUmc/9uk/eCDUre8aw4G14HthQUetSCFgnjGchc2GRhl
	 rHRWGCFHaQ1cg==
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
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: [PATCH v2 10/36] media: ti: am437x: Remove useless setting of min_buffers_needed
Date: Mon,  4 Dec 2023 14:22:57 +0100
Message-Id: <20231204132323.22811-11-benjamin.gaignard@collabora.com>
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
CC: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
---
 drivers/media/platform/ti/am437x/am437x-vpfe.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index f18acf9286a2..228920450e7a 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -2234,7 +2234,6 @@ static int vpfe_probe_complete(struct vpfe_device *vpfe)
 	q->buf_struct_size = sizeof(struct vpfe_cap_buffer);
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->lock = &vpfe->lock;
-	q->min_buffers_needed = 1;
 	q->dev = vpfe->pdev;
 
 	err = vb2_queue_init(q);
-- 
2.39.2


