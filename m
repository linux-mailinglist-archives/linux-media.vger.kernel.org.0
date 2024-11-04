Return-Path: <linux-media+bounces-20737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 054769BAABA
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 03:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB2A72837EF
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 02:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA28166F29;
	Mon,  4 Nov 2024 02:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="akuvA6gA"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7131632CF;
	Mon,  4 Nov 2024 02:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730686223; cv=none; b=CMR5JlvIOxX+DwS2K/7K1KxNPb7ymbOCOlBM+aLVuUqC+cKDs0cXZ6daMfXPt2pNFwlPczh10C5jOz9aU+JIpff65lIvGuzqLmWrNu5Dc+o56IlbOLlGrLLU7jTAYTOrSzFiZOjW4RB3pOa5RuiLrXa3grA9ZRQ0oZSgEPVNr1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730686223; c=relaxed/simple;
	bh=Qf/xmk+FV8HKlRNyQyg+Ih7eb2p4jh+jD2BDeholjZE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IGIZKrd8AQG5JJC2pv8Nk4wI/azR6CaNJyEx7ulouLZCiJEkNp9z/WQ9ezuj9ZLjoIX5X2vifiwVSZTerUYH9tSoPaT3q/VU8uyNQszedoInFbPLEe/SHH+npZmr4t0da/5QRdjnq5Q+iub5mt+V2PQhYKYEkD3R60QzCGslbpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=akuvA6gA; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=5RHlg
	TOb3MFlaJrBBhW3oFcovH15bFSOk0tg4F6W0bE=; b=akuvA6gAiaZnh7q7NIqVC
	BT+7IgiJf1fLdnTLd0i60otLTsrA/VgC4ADS3g+Gc1CA+DRFsgZKR1VkHDBru9mF
	9rbnA+gRRSHMhnthpGzU7MQAmXqwwQIqUqGizZc2r273hT5LdFdSeDtdLTGvBh1G
	A9MH1766+f5ojDOGTHwctw=
Received: from localhost.localdomain (unknown [111.48.69.247])
	by gzsmtp4 (Coremail) with SMTP id PygvCgD3nBf4LChn3aNECQ--.35612S2;
	Mon, 04 Nov 2024 10:10:01 +0800 (CST)
From: chenchangcheng <ccc194101@163.com>
To: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenchangcheng <ccc194101@163.com>
Subject: [PATCH] media: uvcvideo:Create input device for all uvc devices with status endpoints.
Date: Mon,  4 Nov 2024 10:09:59 +0800
Message-Id: <20241104020959.637736-1-ccc194101@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgD3nBf4LChn3aNECQ--.35612S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr1Dur4xXF1DArW5tr4kXrb_yoW8Aw4xpa
	y5CayYyry5JF4rG3WDtw1q93W5Cw4Iy343tFyfG39Y9F15JF1FkFy5try0grn5Ja4kAF4j
	qan0y34UCayUZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi6wZ5UUUUU=
X-CM-SenderInfo: 5fffimiurqiqqrwthudrp/1tbiZRyN3mcoJsG0OwAAsN

Some applications need to check if there is an input device on the camera
before proceeding to the next step. When there is no input device,
the application will report an error.
Create input device for all uvc devices with status endpoints.
and only when bTriggerSupport and bTriggerUsage are one are
allowed to report camera button.

Fixes: 3bc22dc66a4f (media: uvcvideo: Only create input devs if hw supports it)
Signed-off-by: chenchangcheng <ccc194101@163.com>
---
 drivers/media/usb/uvc/uvc_status.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index a78a88c710e2..177640c6a813 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -44,9 +44,6 @@ static int uvc_input_init(struct uvc_device *dev)
 	struct input_dev *input;
 	int ret;
 
-	if (!uvc_input_has_button(dev))
-		return 0;
-
 	input = input_allocate_device();
 	if (input == NULL)
 		return -ENOMEM;
@@ -110,10 +107,12 @@ static void uvc_event_streaming(struct uvc_device *dev,
 		if (len <= offsetof(struct uvc_status, streaming))
 			return;
 
-		uvc_dbg(dev, STATUS, "Button (intf %u) %s len %d\n",
-			status->bOriginator,
-			status->streaming.button ? "pressed" : "released", len);
-		uvc_input_report_key(dev, KEY_CAMERA, status->streaming.button);
+		if (uvc_input_has_button(dev)) {
+			uvc_dbg(dev, STATUS, "Button (intf %u) %s len %d\n",
+				status->bOriginator,
+				status->streaming.button ? "pressed" : "released", len);
+			uvc_input_report_key(dev, KEY_CAMERA, status->streaming.button);
+		}
 	} else {
 		uvc_dbg(dev, STATUS, "Stream %u error event %02x len %d\n",
 			status->bOriginator, status->bEvent, len);
-- 
2.25.1


