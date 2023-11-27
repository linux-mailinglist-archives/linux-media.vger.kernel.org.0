Return-Path: <linux-media+bounces-1145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A300C7FA73B
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EA8F1F20F63
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF523EA82;
	Mon, 27 Nov 2023 16:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gQd0qoEa"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95B171BC;
	Mon, 27 Nov 2023 08:55:38 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 79A6566073FB;
	Mon, 27 Nov 2023 16:55:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104137;
	bh=71+AtmSDH/h7dLOlV29BkPWy1yXzA9ywoJKq5O/+QVk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gQd0qoEaJv55RD/PrXt+M/nrSvjUEquEZ2G5fgA7OMdfJZaDwhH6jBTTLr5QcJolC
	 yFnWShT0rf29LNlSkd2gvc/eScBdKzW5La19tsISe+50xLBUNwloLBYWR1EFfuQ09K
	 p3oM5Rg2A26IsLuIzOiEo2mSevVNxQr90CQJSzk1EUc+RD4h9stUI7t/GnfW8F4VLk
	 AQjtMvKHqqto+zemN7U2/lkzeXukE93ac/XxPqQs50EVnSZcRsplFumvh7PjsAa+SF
	 5xgPu331hbJAPLpTeBvIR0HNQFAux32Q/dl616VKWKzHONlienAESESHUFStNjQ3ed
	 3wvzKRLBOFQng==
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
Subject: [PATCH 40/55] samples: v4l2: pci: Use min_dma_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:39 +0100
Message-Id: <20231127165454.166373-41-benjamin.gaignard@collabora.com>
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

v4l2 pci skeleton sample driver use a dma engine and
needs a minimum number of buffers to be present before
start streaming.
That is 'min_dma_buffers_needed' purpose so use it instead
of 'min_buffers_needed' field.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 samples/v4l/v4l2-pci-skeleton.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/v4l/v4l2-pci-skeleton.c b/samples/v4l/v4l2-pci-skeleton.c
index a65aa9d1e9da..6018c5e7b3f1 100644
--- a/samples/v4l/v4l2-pci-skeleton.c
+++ b/samples/v4l/v4l2-pci-skeleton.c
@@ -821,7 +821,7 @@ static int skeleton_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	 * available before it can be started. The start_streaming() op
 	 * won't be called until at least this many buffers are queued up.
 	 */
-	q->min_buffers_needed = 2;
+	q->min_dma_buffers_needed = 2;
 	/*
 	 * The serialization lock for the streaming ioctls. This is the same
 	 * as the main serialization lock, but if some of the non-streaming
-- 
2.39.2


