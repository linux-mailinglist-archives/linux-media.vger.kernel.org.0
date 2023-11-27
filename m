Return-Path: <linux-media+bounces-1110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8011C7FA6F6
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:55:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BCE11F20F31
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA588374C4;
	Mon, 27 Nov 2023 16:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WBbok1Zw"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77E2D192;
	Mon, 27 Nov 2023 08:55:09 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AD80466071EF;
	Mon, 27 Nov 2023 16:55:07 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104108;
	bh=nXea1hVd1CLJC4QjmTPo1Qmgjq3TpB25wTNYX2076fw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WBbok1ZwVmzcYZ6qijikokOfeNVx1QY8q/v6QMqMKEShjboAWMnVi1KcNOilv/t8u
	 ZGA/Y5dZbaa/+i79WxGiAt2wbRQE6bOJvd0ao1gRx7SIQ1BDzCgi61+Ctc132LkxBk
	 OsX5mifJ6HyfdcolBMSvdvawfw5+tN1BzsTKRNbodDmZd0wXooyb0bqBoq8fYyPmdC
	 Q6O+EvfitG568RQT8EMQzzcm9kKBH2w7MJMt6RXJtUnosr5XO0wqZfo4ikFJgTmytD
	 QaRkTe6R11Hb8saK91cMDMCEr55N+m3J0afxeTkWn2hIx05xBMfQhubNP2c+qySLux
	 WxX7gsXCjBTLQ==
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
Subject: [PATCH 04/55] media: usb: dvb-usb: cxusb-analog: Stop abusing of min_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:03 +0100
Message-Id: <20231127165454.166373-5-benjamin.gaignard@collabora.com>
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


