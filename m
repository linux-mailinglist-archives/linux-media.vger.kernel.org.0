Return-Path: <linux-media+bounces-21163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 740139C1F1F
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 15:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16BDFB2133C
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 14:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27531F4299;
	Fri,  8 Nov 2024 14:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dyn4Ocj7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93971401C
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 14:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731075842; cv=none; b=gGD2typEHsYtFcAg7Y/s31Z84MdroNexTYuSBtlsOm6fs/MEPDGc9AMpGX5oU8ruu4plQElUIen2yr1WYfjNSlS9dY2HYvEtZnsNWNV7FRgzGIpd4Er4Q8SJxFhv5Tcg4OL1QCPwmVP0MNY7nN9WYIPYsKwwTxDPinKag0ONdBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731075842; c=relaxed/simple;
	bh=Sqn9+HWWpQdz7MYA+L6Bmtb9dNvQnT5ZEPvL9moloz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RwAqFeF+FXP1h9NtlLkOK9xVmuEuMJ/h6YC/s+njXDEzYqSfNu7p6xpFvLU5hGkciYwyJ+Wk8ArgStaMRdP+pmYGY2qV89ovB7vwZth2t6yBEJ1XhCyHWOJreM88G+wdxaYrRWvpsjfchs+veXnxcd9usJGrwot+gW4BAg+nofU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dyn4Ocj7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.local (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14F0F7E9;
	Fri,  8 Nov 2024 15:23:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731075829;
	bh=Sqn9+HWWpQdz7MYA+L6Bmtb9dNvQnT5ZEPvL9moloz0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dyn4Ocj7B34EyPv14W++3yZMHmHtfWrxKG24hK+3ITQ+4nwJqg2Hjc7CsdtmzV+iP
	 NhKbjFDwk2owTcxyNDNZLPeP120Z4hL97GwMEPA8iTL+KUJk8WuXK2vLaEfJxxpron
	 5m+IynJYjHmySuszVrX488Gefw1qcd03+GWRLGwU=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH 3/3] media: uvcvideo: Implement dual stream quirk to fix loss of usb packets
Date: Fri,  8 Nov 2024 14:23:10 +0000
Message-ID: <20241108142310.19794-4-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241108142310.19794-1-isaac.scott@ideasonboard.com>
References: <20241108142310.19794-1-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some cameras, such as the Sonix Technology Co. 292A exhibit issues when
running two parallel streams, causing USB packets to be dropped when an
H.264 stream posts a keyframe while an MJPEG stream is running
simultaneously. This occasionally causes the driver to erroneously
output two consecutive JPEG images as a single frame.

To fix this, we inspect the buffer, and trigger a new frame when we
find an SOI, inverting the FID to make sure no frames are erroneously
dropped.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_video.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 2fb9f2b59afc..f754109f5e96 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1211,6 +1211,30 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 		return -EAGAIN;
 	}
 
+	/*
+	 * Some cameras, such as the Sonix Technology Co. 292A exhibit issues
+	 * when running two parallel streams, causing USB packets to be dropped
+	 * when an H.264 stream posts a keyframe while an MJPEG stream is
+	 * running simultaneously. This occasionally causes the driver to
+	 * erroneously output two consecutive JPEG images as a single frame.
+	 *
+	 * Check the buffer for a new SOI on JPEG streams and complete the
+	 * preceding buffer using EAGAIN, and invert the FID to make sure the
+	 * erroneous frame is not dropped.
+	 */
+	if ((stream->dev->quirks & UVC_QUIRK_MJPEG_NO_EOF) &&
+	    (stream->cur_format->fcc == V4L2_PIX_FMT_MJPEG ||
+	     stream->cur_format->fcc == V4L2_PIX_FMT_JPEG)) {
+		const u8 *packet = data + header_len;
+
+		if ((packet[0] == 0xff && packet[1] == 0xd8) && buf->bytesused != 0) {
+			buf->state = UVC_BUF_STATE_READY;
+			buf->error = 1;
+			stream->last_fid ^= UVC_STREAM_FID;
+			return -EAGAIN;
+		}
+	}
+
 	stream->last_fid = fid;
 
 	return header_len;
-- 
2.43.0


