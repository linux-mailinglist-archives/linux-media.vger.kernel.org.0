Return-Path: <linux-media+bounces-47021-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB50C5A2A5
	for <lists+linux-media@lfdr.de>; Thu, 13 Nov 2025 22:41:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76D163ADDE1
	for <lists+linux-media@lfdr.de>; Thu, 13 Nov 2025 21:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1441A324B2E;
	Thu, 13 Nov 2025 21:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XsTEx+gX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ECB311C30;
	Thu, 13 Nov 2025 21:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763070072; cv=none; b=GR+pT0YSdysic9shEQGl01xfEWMyWInDEb1TMuRBKu3nWVDaHZ0KXDhjieXNva5W9+DMT4WF2ZBd9rOvasLBeF4dS+Llm06ZOFwyUYh7Egr+zGTcoCBvAOfwxT0LNJfe0vy3zUiOwG4BJYDc0coSseByXYeh5D9BOyepMyFu1Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763070072; c=relaxed/simple;
	bh=eu7NYUTUWF5gzp9BGkvySEE/pZLj88tWJe3I0rLR/Is=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E+avXEB3P1NOfkzynbCp0NgoqXxQYTzBkFqrYOG2Szug1SXZ1PHK7UEZ5TDlhsRALWbPH7ojTGLy/cIYI4uk2R7wbhFOU6deGdZP1qhjKFGujxxOFzh3sSartiRlmj2YLxdkq/NtgkjAVWrh+Pl3CujAi7CHDslTXF51TRtQQo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XsTEx+gX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-165-222.bb.dnainternet.fi [82.203.165.222])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 633AB5B2;
	Thu, 13 Nov 2025 22:39:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763069948;
	bh=eu7NYUTUWF5gzp9BGkvySEE/pZLj88tWJe3I0rLR/Is=;
	h=From:To:Cc:Subject:Date:From;
	b=XsTEx+gXZBjxbNS9h5+aLH9o6lN0M2TqLzudjR7mnzcpv9mYYzHCQceQJxxbS7WlU
	 Av4H142yhhq1yF/Hiut7mT+QdkmPLP3wWRIQIn4NPLSc4xWVcVKkiwmRtQ7WvkbOTX
	 ardvGNpWYbdfeeRUMG9MfBojvaF7lnPw+yZH1vE8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: uvcvideo: Return queued buffers on start_streaming() failure
Date: Thu, 13 Nov 2025 23:40:56 +0200
Message-ID: <20251113214056.2464-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michal Pecio <michal.pecio@gmail.com>

Return buffers if streaming fails to start due to uvc_pm_get() error.

This bug may be responsible for a warning I got running

    while :; do yavta -c3 /dev/video0; done

on an xHCI controller which failed under this workload.
I had no luck reproducing this warning again to confirm.

xhci_hcd 0000:09:00.0: HC died; cleaning up
usb 13-2: USB disconnect, device number 2
WARNING: CPU: 2 PID: 29386 at drivers/media/common/videobuf2/videobuf2-core.c:1803 vb2_start_streaming+0xac/0x120

Fixes: 7dd56c47784a ("media: uvcvideo: Remove stream->is_streaming field")
Cc: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Link: https://patch.msgid.link/20251015133642.3dede646.michal.pecio@gmail.com
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Reorganize error path
---
 drivers/media/usb/uvc/uvc_queue.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 790184c9843d..e838c6c1893a 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -177,18 +177,20 @@ static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
 
 	ret = uvc_pm_get(stream->dev);
 	if (ret)
-		return ret;
+		goto err_buffers;
 
 	queue->buf_used = 0;
 
 	ret = uvc_video_start_streaming(stream);
-	if (ret == 0)
-		return 0;
+	if (ret)
+		goto err_pm;
 
+	return 0;
+
+err_pm:
 	uvc_pm_put(stream->dev);
-
+err_buffers:
 	uvc_queue_return_buffers(queue, UVC_BUF_STATE_QUEUED);
-
 	return ret;
 }
 

base-commit: d363bdfa0ec6b19a4f40b572cec70430d5b13ad6
-- 
Regards,

Laurent Pinchart


