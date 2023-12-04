Return-Path: <linux-media+bounces-1577-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7448034A0
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CF63B2093F
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8357A250F7;
	Mon,  4 Dec 2023 13:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cmdA99+l"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B26118C;
	Mon,  4 Dec 2023 05:24:13 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 34C7066071CC;
	Mon,  4 Dec 2023 13:24:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701696252;
	bh=/omb2mE5oy70HH/kBxdqmwaLlWf6cHg+GYUl9K/Xqzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cmdA99+lx9aZEXddvjpGcFHe+LHYhFZOdqop2nz1UDCU+bPLUh2JECYEzI2cs8zXM
	 K8KWqXxiJPw6h8mP9P3IMxbxnp9yPP+ex1Of7/IVKc/OUHpnJIWTCsLcQRyGH0ZMnx
	 xaNXV9IXL/PLks7SwuQhtv1ikqUls0XLa1L5HBJa+ziRhJBLZIFKyeF9vAJXn2zFBW
	 1uPGEJqoukF0hNS9X16V7H6c7R/o2SGTDnp1XLcbHSVYDuZNZXUxe/ch/iI2zbcmr1
	 W/lboNlHvTbMr7jIzYSWFvNcaHMrCDb1Uv4UQmARaopu/Vnou0q7vU7cYvidXMYxdC
	 R2PULw7GPZ0IQ==
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
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH v2 21/36] media: imx7-media-csi: Fix misuse of min_buffers_needed field
Date: Mon,  4 Dec 2023 14:23:08 +0100
Message-Id: <20231204132323.22811-22-benjamin.gaignard@collabora.com>
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

'min_buffers_needed' is suppose to be used to indicate the number
of buffers needed by DMA engine to start streaming.
imx7-media-csi driver doesn't use DMA engine and just want to specify
the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
That 'min_reqbufs_allocation' field purpose so use it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Rui Miguel Silva <rmfrfs@gmail.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Martin Kepplinger <martink@posteo.de>
CC: Purism Kernel Team <kernel@puri.sm>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Sascha Hauer <s.hauer@pengutronix.de>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: Fabio Estevam <festevam@gmail.com>
CC: NXP Linux Team <linux-imx@nxp.com>
---
 drivers/media/platform/nxp/imx7-media-csi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 1d2464ca59b8..dcc8c54228e4 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1676,7 +1676,7 @@ static int imx7_csi_video_init(struct imx7_csi *csi)
 	vq->mem_ops = &vb2_dma_contig_memops;
 	vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	vq->lock = &csi->vdev_mutex;
-	vq->min_buffers_needed = 2;
+	vq->min_reqbufs_allocation = 2;
 	vq->dev = csi->dev;
 
 	ret = vb2_queue_init(vq);
-- 
2.39.2


