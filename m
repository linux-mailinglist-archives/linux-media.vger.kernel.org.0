Return-Path: <linux-media+bounces-1556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFD8803473
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:23:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18A451F21095
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3C824B51;
	Mon,  4 Dec 2023 13:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LGuCyNM5"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9758295;
	Mon,  4 Dec 2023 05:23:36 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E91DF6605835;
	Mon,  4 Dec 2023 13:23:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701696215;
	bh=/jXOJsw0p75OXpH12qRqf2mFFTImN471wSEgNYwBmG0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LGuCyNM5hcxzCsRTiYNtAcnlFtm2LTROFeLGFP+16aozE/clXAf370U6xBkhRtOhe
	 uSGmSVWUvaRyW4Bil7+Jh5PX2e9pny6Is9oMmv1FoS0skDmPZXX+6srUwjZni61EeU
	 Y9j+C0RIicWsyX0uQCVCWj3DEi8dFOC2LlHjv2nRMfioCdoTSpRYI3M6GHKuvpPpVG
	 O9G9QhUfr8v6o6LkctQt9NPED5klHsOVoGbB6HysCFy5Z4/Ae7aPM3J/tZKHEERrsY
	 bQf0WWOelyNfruoqU3vMI4M9TxoEnszzW5QCT6RzlBW9HgHoIeO0+2ENgTi5kNqmnu
	 yWShit1oxBLUQ==
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
Subject: [PATCH v2 01/36] media: usb: cx231xx: Remove useless setting of min_buffers_needed
Date: Mon,  4 Dec 2023 14:22:48 +0100
Message-Id: <20231204132323.22811-2-benjamin.gaignard@collabora.com>
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
 drivers/media/usb/cx231xx/cx231xx-417.c   | 1 -
 drivers/media/usb/cx231xx/cx231xx-video.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index 45973fe690b2..24c94cfb5268 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -1782,7 +1782,6 @@ int cx231xx_417_register(struct cx231xx *dev)
 	q->ops = &cx231xx_video_qops;
 	q->mem_ops = &vb2_vmalloc_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->min_buffers_needed = 1;
 	q->lock = &dev->lock;
 	err = vb2_queue_init(q);
 	if (err)
diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index c8eb4222319d..ce44114e2188 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -1811,7 +1811,6 @@ int cx231xx_register_analog_devices(struct cx231xx *dev)
 	q->ops = &cx231xx_video_qops;
 	q->mem_ops = &vb2_vmalloc_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->min_buffers_needed = 1;
 	q->lock = &dev->lock;
 	ret = vb2_queue_init(q);
 	if (ret)
@@ -1871,7 +1870,6 @@ int cx231xx_register_analog_devices(struct cx231xx *dev)
 	q->ops = &cx231xx_vbi_qops;
 	q->mem_ops = &vb2_vmalloc_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->min_buffers_needed = 1;
 	q->lock = &dev->lock;
 	ret = vb2_queue_init(q);
 	if (ret)
-- 
2.39.2


