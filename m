Return-Path: <linux-media+bounces-21090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F359C13D2
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 02:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 577271C222A6
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 01:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 409D01A28D;
	Fri,  8 Nov 2024 01:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="GAOPsFJ3"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8B417BB6;
	Fri,  8 Nov 2024 01:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731031056; cv=none; b=X7diXJk6I3f9mwjbdjLHDNSnMerP5HBpuJnf4MTlY/zMskkVPKzqmeF+KL0zl3XplVjRrN0kARZLh2lzX8h/nvdKM3UbTvBGYm3Lfkm9SZgKhOnbLyFKB4p7fOwtGiC3Wly/p8sjItIC7hluguYP9nwhGKhJ8hZx45fIudKUEvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731031056; c=relaxed/simple;
	bh=RBKoOqNLxAOJPEd5G4Qc3/0H4RH7WzouuRga+CltUFU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BG5LsJWL9qaba6G6ARxIZ6nL01yOKHRPpzrpw55i+ULvAyxDeSTaQOS1qDcPzKrSrRW65DdC1/vv8UzurYyu5A41wsrL4uwh4E4GBpYY9uIDHcJoTZ78+B3k9c4hjcw+cnxb+eL+q+q217jm/FD/btz2MJJ+o/6wt6SwxsMDxSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=GAOPsFJ3; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=iVgcl
	gDwWCO9pSFKEtAHF4gBB9qmLiUoyIv2MOq3Zac=; b=GAOPsFJ3NxQ41GGTzILqO
	taDalrjdL4ZtlLp08NpQrBgnEsT0EVY9NmfLsH4bea9923obS1ceLJ1DdEXitosC
	7jUSBbGyzofSNX+g5R+5F0Wi6xEDCFQts++z7Lqe6XzQBIvWYSnjCoZ+fJd5LDDC
	uWXX0o9OmvSZ1bYofT46a4=
Received: from localhost.localdomain (unknown [111.48.69.247])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCXTA7tby1nSNi3BQ--.12951S2;
	Fri, 08 Nov 2024 09:57:02 +0800 (CST)
From: chenchangcheng <ccc194101@163.com>
To: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	chenchangcheng <ccc194101@163.com>
Subject: [PATCH] media: uvcvideo:Create input device for all uvc devices with status endpoints.
Date: Fri,  8 Nov 2024 09:56:58 +0800
Message-Id: <20241108015658.471109-1-ccc194101@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgCXTA7tby1nSNi3BQ--.12951S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr1Dur4xXF1DArW5Zw13Jwb_yoW8CF1kpa
	y5Cay5try5JF4rG3Wqyw1qg3W5Cw4Iy343tFyfG39YvF15Jr1FkFyrtry0grn5Ja4kAFWU
	tanIy34UCayUZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piByxAUUUUU=
X-CM-SenderInfo: 5fffimiurqiqqrwthudrp/1tbiYwSR3mctbHpebwAAsF

Some applications need to check if there is an input device on the camera
before proceeding to the next step. When there is no input device,
the application will report an error.
Create input device for all uvc devices with status endpoints.
and only when bTriggerSupport and bTriggerUsage are one are
allowed to report camera button.

Fixes: 3bc22dc66a4f ("media: uvcvideo: Only create input devs if hw supports it")
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

base-commit: ff7afaeca1a15fbeaa2c4795ee806c0667bd77b2
-- 
2.25.1


