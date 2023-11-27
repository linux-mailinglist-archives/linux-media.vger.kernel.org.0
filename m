Return-Path: <linux-media+bounces-1147-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 293347FA742
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:58:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0AD2B217D1
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB3A374F2;
	Mon, 27 Nov 2023 16:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="J82+hXDN"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2E4926A9;
	Mon, 27 Nov 2023 08:55:39 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 14A19660738D;
	Mon, 27 Nov 2023 16:55:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104138;
	bh=HM7bQJTrYq0xI931RRj+exZg69MbeR6CU1nWD8Ux+n0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J82+hXDNdOP+SagJpnZv37YHnFlwnFOlaRqILeWuFtj4UTpODQiiCXLoHRJMpFxxE
	 TQseQi+Fb8JdftmA3rnrIRSHvbwN7H4s47izIb49/vo5u8p51C9EHhCVbhtUbzDsxY
	 y886IwJB4KRf5I0fMIDCogDzSogPOEgvGPOycf7QjzGSncgxT6R0fWOOQwVGh26nHf
	 eU2d6+t+2Ju5ICKEsFFgqUm2V8J4Afke1g+PCCHrXBYDRtgzpRfQPvZpFqgUgt1QG3
	 9B1+YAIEWU+WDdP3tRlFpWO6IEjzk/9xBChtGcNV+hAqKsQl63YCRhugv/z50+YPAG
	 ZVqNQ3e/37VTQ==
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
Subject: [PATCH 42/55] media: pci: dt3155: Use min_dma_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:41 +0100
Message-Id: <20231127165454.166373-43-benjamin.gaignard@collabora.com>
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

dt3155 driver use a dma engine and needs a minimum number of
buffers to be present before start streaming.
That is 'min_dma_buffers_needed' purpose so use it instead
of 'min_buffers_needed' field.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/pci/dt3155/dt3155.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/dt3155/dt3155.c b/drivers/media/pci/dt3155/dt3155.c
index d09cde2f6ee4..43b44af1e9ca 100644
--- a/drivers/media/pci/dt3155/dt3155.c
+++ b/drivers/media/pci/dt3155/dt3155.c
@@ -517,7 +517,7 @@ static int dt3155_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	pd->vidq.ops = &q_ops;
 	pd->vidq.mem_ops = &vb2_dma_contig_memops;
 	pd->vidq.drv_priv = pd;
-	pd->vidq.min_buffers_needed = 2;
+	pd->vidq.min_dma_buffers_needed = 2;
 	pd->vidq.gfp_flags = GFP_DMA32;
 	pd->vidq.lock = &pd->mux; /* for locking v4l2_file_operations */
 	pd->vidq.dev = &pdev->dev;
-- 
2.39.2


