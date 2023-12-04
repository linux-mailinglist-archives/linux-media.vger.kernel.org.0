Return-Path: <linux-media+bounces-1575-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B214680349C
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4B8C1C20968
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3D325105;
	Mon,  4 Dec 2023 13:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ItkreTcL"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31E3619D;
	Mon,  4 Dec 2023 05:24:10 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8B87766072E6;
	Mon,  4 Dec 2023 13:24:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701696249;
	bh=cSCDQ8wlrHHxZIMdX6yERM4DP0+7F96unl/YfCpM+80=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ItkreTcLbIUWjrggv+eBydLFkXe5BAIpJoa2R/UzOo0kch36mgtQE5M7SmUk2KbUi
	 Ml9N0D2Z+myIvIoFBmd61zoLNXl33ivazxw/vaDFXAh60T1/hJzvVN7zxianSIYtvN
	 0KkH/xOHVYfzHE/H85y4sANcUJdLU5eGR9pTsbWz8alHpX+NcrldS7oZLk8ooaxDjf
	 OJsG7qvi0VMLggkv1csdCGLIIvtCrnARMFcctD6IZaGSL3cgSk4wppqIrYKQsRLH7Q
	 ZWGkjaYqQ/KUtcsAZfJCnu1K5lNXr114+PC7CHbadgq8OGvnSvheAjP5DEBGPFzGB/
	 a/Yqt3ouhA81w==
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
Subject: [PATCH v2 19/36] media: usb: gspca: Fix misuse of min_buffers_needed field
Date: Mon,  4 Dec 2023 14:23:06 +0100
Message-Id: <20231204132323.22811-20-benjamin.gaignard@collabora.com>
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
gspca driver doesn't use DMA engine and just want to specify
the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
That 'min_reqbufs_allocation' field purpose so use it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/usb/gspca/gspca.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
index 770714c34295..7b701275f76d 100644
--- a/drivers/media/usb/gspca/gspca.c
+++ b/drivers/media/usb/gspca/gspca.c
@@ -1257,7 +1257,7 @@ static int vidioc_g_parm(struct file *filp, void *priv,
 {
 	struct gspca_dev *gspca_dev = video_drvdata(filp);
 
-	parm->parm.capture.readbuffers = gspca_dev->queue.min_buffers_needed;
+	parm->parm.capture.readbuffers = gspca_dev->queue.min_reqbufs_allocation;
 
 	if (!gspca_dev->sd_desc->get_streamparm)
 		return 0;
@@ -1273,7 +1273,7 @@ static int vidioc_s_parm(struct file *filp, void *priv,
 {
 	struct gspca_dev *gspca_dev = video_drvdata(filp);
 
-	parm->parm.capture.readbuffers = gspca_dev->queue.min_buffers_needed;
+	parm->parm.capture.readbuffers = gspca_dev->queue.min_reqbufs_allocation;
 
 	if (!gspca_dev->sd_desc->set_streamparm) {
 		parm->parm.capture.capability = 0;
@@ -1517,7 +1517,7 @@ int gspca_dev_probe2(struct usb_interface *intf,
 	q->ops = &gspca_qops;
 	q->mem_ops = &vb2_vmalloc_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->min_buffers_needed = 2;
+	q->min_reqbufs_allocation = 2;
 	q->lock = &gspca_dev->usb_lock;
 	ret = vb2_queue_init(q);
 	if (ret)
-- 
2.39.2


