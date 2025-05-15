Return-Path: <linux-media+bounces-32582-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56636AB84A0
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 13:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F32E9E66D9
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 11:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C692298990;
	Thu, 15 May 2025 11:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="qJC4ZpqD"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B75C20297C;
	Thu, 15 May 2025 11:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747307696; cv=none; b=TTKzJkB21q3/HcfgySdss9nM7BLRFOsv3bVSjuhe53n7+1JUa/xcYHbEHmfTehC2oMQ048a3P0ucOyZV5NbqkJj6hey4IcyNqMlZq0fZKC98pjyoqbGyY4jk84LCXKPGGv/Otgi5llSdaI/pLCkoK1PwceUuHsENyhb6bJF/4rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747307696; c=relaxed/simple;
	bh=KAOGf5l3a1QUryljVuiJwl1E3W/RvEWQRQxTmy+qBjU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DqryfyU7rNmQ4qt/tD66KLuNlfNxQI32A87hYLB6RipIZhBHT9ucyp+27hJ/ZQPZ7V2dJ0qp4woV9W0DF/6ub7OCn1wJIwRAVJmzRjGtY2r5o11xDhnigbq9nAWNuBkCOp7Is6pug5FEuTyRgMQZKL/7UAvWUjhboSvRX8e20mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=qJC4ZpqD; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=z/
	DVrSVzhckFzlr5cf1y4a94mQlkYtE0DByz9JiadCU=; b=qJC4ZpqDS0Pyt0eGa4
	ahQcJ2RC5HjLtImKssw6hzcu0RrvMcOIhGF0wn7f8lQ4v020vxsI3MNtbQ8MNTf4
	KaYrOnDjdR7KpShQIwQNN9rFuUlLEwNKBlSKCPo7/R9Y+KNu5BlUmne+Jagr4Hrv
	hUjEUCqo90d3PAhaEBG9j4bh4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wC3lfSQzCVo+qkzBg--.11996S2;
	Thu, 15 May 2025 19:14:24 +0800 (CST)
From: chenchangcheng <ccc194101@163.com>
To: laurent.pinchart@ideasonboard.com,
	ribalda@chromium.org
Cc: hdegoede@redhat.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenchangcheng <chenchangcheng@kylinos.cn>
Subject: [PATCH v11] media: uvcvideo: Fix bandwidth issue for Alcor camera.
Date: Thu, 15 May 2025 19:14:06 +0800
Message-Id: <20250515111406.1470687-1-ccc194101@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wC3lfSQzCVo+qkzBg--.11996S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFWDKry5WFWfKF1xAr4UCFg_yoW8Wr1Upa
	1ruayFyryUJrWFganrJa1rKa1rAanYyw4fKFW3W34kZr45JryxXFy3G340q3sFya1fAw1a
	qr1qqrnru39YvrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jreOJUUUUU=
X-CM-SenderInfo: 5fffimiurqiqqrwthudrp/1tbiTQZO3mglx4yKJAAAsz

From: chenchangcheng <chenchangcheng@kylinos.cn>

Some broken device return wrong dwMaxPayloadTransferSize fields
as follows:
    [  218.632537] [pid:20427,cpu6,guvcview,8]uvcvideo: Device requested 2752512 B/frame bandwidth.
    [  218.632598] [pid:20427,cpu6,guvcview,9]uvcvideo: No fast enough alt setting for requested bandwidth.

When dwMaxPayloadTransferSize is greater than maxpsize,
it will prevent the camera from starting.
So use the bandwidth of maxpsize.

Signed-off-by: chenchangcheng <chenchangcheng@kylinos.cn>
---
 drivers/media/usb/uvc/uvc_video.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e3567aeb0007..11769a1832d2 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -262,6 +262,15 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 
 		ctrl->dwMaxPayloadTransferSize = bandwidth;
 	}
+
+	if (stream->intf->num_altsetting > 1 &&
+	    ctrl->dwMaxPayloadTransferSize > stream->maxpsize) {
+		dev_warn_ratelimited(&stream->intf->dev,
+				     "UVC non compliance: the max payload transmission size (%u) exceeds the size of the ep max packet (%u). Using the max size.\n",
+				     ctrl->dwMaxPayloadTransferSize,
+				     stream->maxpsize);
+		ctrl->dwMaxPayloadTransferSize = stream->maxpsize;
+	}
 }
 
 static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)

base-commit: 9f35e33144ae5377d6a8de86dd3bd4d995c6ac65
-- 
2.25.1


