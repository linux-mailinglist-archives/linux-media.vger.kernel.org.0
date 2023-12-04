Return-Path: <linux-media+bounces-1574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F25C0803499
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:25:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C31F1F20FF8
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7EA25764;
	Mon,  4 Dec 2023 13:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Q16SfkSU"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0151134;
	Mon,  4 Dec 2023 05:24:08 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 362426607090;
	Mon,  4 Dec 2023 13:24:07 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701696247;
	bh=nXea1hVd1CLJC4QjmTPo1Qmgjq3TpB25wTNYX2076fw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q16SfkSUODOUuv0aRr1a3vsuwi50wG5boYx5dbxzV+1JktEOinEGm2IbRY9SpbKIV
	 uM2jMqTnnGkJTXKKIa8mKU7hq6w1abgA7+HUszwqS82ybLLjoXljwQygr7sorOQRB7
	 KZwGn6pABnYlJv7ayfvX9QB860fC9ChvBaocsCayHnHRWp4AJE6RWCnPzPBxda0HHt
	 vnVWvcjjNz7i1wyRuKe2qbBTVG9/qsj5O/UOfArfMDW43kU60C6gjjfNL3VH36Cp9Y
	 BLJsRd8531dND0h9nAJRsyvud+k5/sVWisQpOXTHzV/objUYPOyC4YM4mU6wdBvTA6
	 kz5tfeY4HaeOg==
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
	Michael Krufky <mkrufky@linuxtv.org>
Subject: [PATCH v2 18/36] media: usb: dvb-usb: cxusb-analog: Fix misuse of min_buffers_needed field
Date: Mon,  4 Dec 2023 14:23:05 +0100
Message-Id: <20231204132323.22811-19-benjamin.gaignard@collabora.com>
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
cxusb-analog driver doesn't use DMA engine and just want to specify
the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
That 'min_reqbufs_allocation' field purpose so use it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Michael Krufky <mkrufky@linuxtv.org>
---
 drivers/media/usb/dvb-usb/cxusb-analog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/cxusb-analog.c b/drivers/media/usb/dvb-usb/cxusb-analog.c
index deba5224cb8d..a038d97dd62e 100644
--- a/drivers/media/usb/dvb-usb/cxusb-analog.c
+++ b/drivers/media/usb/dvb-usb/cxusb-analog.c
@@ -1632,7 +1632,7 @@ static int cxusb_medion_register_analog_video(struct dvb_usb_device *dvbdev)
 	cxdev->videoqueue.buf_struct_size =
 		sizeof(struct cxusb_medion_vbuffer);
 	cxdev->videoqueue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	cxdev->videoqueue.min_buffers_needed = 6;
+	cxdev->videoqueue.min_reqbufs_allocation = 6;
 	cxdev->videoqueue.lock = &cxdev->dev_lock;
 
 	ret = vb2_queue_init(&cxdev->videoqueue);
-- 
2.39.2


