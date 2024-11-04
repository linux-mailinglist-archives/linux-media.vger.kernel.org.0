Return-Path: <linux-media+bounces-20736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2613C9BAAB9
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 03:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EEFB1C2128F
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 02:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A34C1632FC;
	Mon,  4 Nov 2024 02:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mJLFefwS"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E64145FDA7;
	Mon,  4 Nov 2024 02:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730686200; cv=none; b=FONHtJmzW+gl793bqcI0bgDhKljMUgjkHV5AN3Q1iMjiTLiDS3hmJuK+HPcj4JfAC3yoa5gKXyMsCj0h93Lfl4Z+X37ZLV7UH4YUWcTGEMg/Z6UkoNP3cexKER0rga1eDddg6jHEQhecbN3UpMQael1FswbB0E57XDd5qI3+TrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730686200; c=relaxed/simple;
	bh=gce2bBFZU6kYY57OQy8L45hTQd5Wj1Vf6stn2qyUKMY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FQzSyVtSdhSUjy+BZYZNIgmyI3H9cqkzgCvsfOAD91bSR+1jdaVhD4BH3le6wEW47i93xPEhXDLU7CZdPnh79thuiAeCladjk3nOQ0ILTCSfQ4M3tPpCHVizFqrSp4YD/pzn99xXxOescKrb2e2qfY+zDHZNOX6IqldDYZ8VRQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mJLFefwS; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=KgTFV
	w5o8r2pR8lGeTh3dHtILbRc4kpX5LjxwNyv2Hw=; b=mJLFefwSTEJ5vgCX6u7tO
	8Zj9T9dCMiXjSij3AInldPUH5qtnYAJPM6LNDET02BASPht/uuiBlx4xm4D3SoOi
	XRqRuvExm2eUVhlX2t7sLHFeDmLTFr3HJhf9r/PNhAgIDg8t0fKWSnCNu/0vF0yk
	hmzoeXALD8EpCmjRgLlnXU=
Received: from localhost.localdomain (unknown [111.48.69.247])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnDwLcLChnD3dYAQ--.51384S2;
	Mon, 04 Nov 2024 10:09:32 +0800 (CST)
From: chenchangcheng <ccc194101@163.com>
To: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenchangcheng <ccc194101@163.com>
Subject: [PATCH] KYLIN: uvc:Create input device for all uvc devices with status endpoints.
Date: Mon,  4 Nov 2024 10:09:31 +0800
Message-Id: <20241104020931.634552-1-ccc194101@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnDwLcLChnD3dYAQ--.51384S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr1Dur4xXF1DWF4rAFWfGrg_yoW8Aryfpa
	y5CayYyry5JF4rG3Wqyw1q93W5Cws2y3y3KFyfG39YvF15JF1FkFy3try09FnYya4kAF4j
	van0y34UCayUZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pihiSkUUUUU=
X-CM-SenderInfo: 5fffimiurqiqqrwthudrp/1tbiwhyN3mcoKukdygABsX

Some applications need to check if there is an input device on the camera
before proceeding to the next step. When there is no input device,
the application will report an error.
Create input device for all uvc devices with status endpoints.
and only when bTriggerSupport and bTriggerUsage are one are
allowed to report camera button.

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


