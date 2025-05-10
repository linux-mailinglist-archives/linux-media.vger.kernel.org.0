Return-Path: <linux-media+bounces-32199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7617AB2178
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 08:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A5A4A06CFA
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 06:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF571DF75B;
	Sat, 10 May 2025 06:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ELd7srLu"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED7DEAC7;
	Sat, 10 May 2025 06:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746857934; cv=none; b=ixTI+eezlTD98s2R+N1En2biZthE95jMKIx1ted5ujnuCZmomYb0IEAVtqd4QlLMt5IadDVQsum4xufNttMIA5Kr540vFDdwIyJ5nkfiTTf2Ny/n6uVeDUkIhGitnRFsHur/PshnAUKbPchgdq1AB1O30jcso04yJDTyzCnbxu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746857934; c=relaxed/simple;
	bh=bkaSkQKKL+Wfa26ihWSrZj6fNEzSNv23lXHNw7dkRgk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P2Fozr3giFbYT7bMbHxrprUFY/TI5BMtCas0Z5DvdGG+RV57mCOsfgqz5ovlvmrqt+0hFHJn5M9zdYIlkdZd5eASuUxyR40DRHbnc+9dLDMEVvPlZwakxyqFA2CP2VW2AnaJqYH4wkbEuU1PN+Qtd1/2O6V7FnREZMUGsYVIZao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ELd7srLu; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=E6
	sFA1+0o6qqX1tn2eUR7zvx/z+b6iz6uSlv8sbSvvs=; b=ELd7srLuavvnUVJfEn
	GfHSGbz2/OJTFHCQz6UoxGCKe1pyGCejW5yXcleZdMZMYHCU7SARYkfl0YVCl0UD
	HpQE2f8r9KlkVz5lcGJ9UK5BG+FfBPpwqSIiqC3KWt1vqO6Aju6Ou8BZZeCFRcKY
	W1+I/1xs3BeFKfS3ylo04wrao=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3i1Kf7x5oX2eZAQ--.58511S2;
	Sat, 10 May 2025 14:18:08 +0800 (CST)
From: chenchangcheng <ccc194101@163.com>
To: laurent.pinchart@ideasonboard.com,
	ribalda@chromium.org
Cc: hdegoede@redhat.com,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	chenchangcheng <chenchangcheng@kylinos.cn>
Subject: [PATCH v10] media: uvcvideo: Fix bandwidth issue for Alcor camera.
Date: Sat, 10 May 2025 14:18:03 +0800
Message-Id: <20250510061803.811433-1-ccc194101@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3i1Kf7x5oX2eZAQ--.58511S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFWDKry5WFWfKF1xAr4UCFg_yoW8Xw1xpa
	1ruayFyryUJrWFganrJa1rKw4rJanakw4fKFy3W34UZr45JryxXFy3G340q34qya1fAw13
	tr1qqrnF939Yvr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07joGQDUUUUU=
X-CM-SenderInfo: 5fffimiurqiqqrwthudrp/1tbiVhdI3mgeVhAAwwABsl

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
index e3567aeb0007..a74cf89852d1 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -262,6 +262,15 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 
 		ctrl->dwMaxPayloadTransferSize = bandwidth;
 	}
+
+	if (stream->intf->num_altsetting > 1 &&
+	    ctrl->dwMaxPayloadTransferSize > stream->maxpsize) {
+		dev_warn_ratelimited(&stream->intf->dev,
+				     "the max payload transmission size (%d) exceededs the size of the ep max packet (%d). Using the max size.\n",
+				     ctrl->dwMaxPayloadTransferSize,
+				     stream->maxpsize);
+		ctrl->dwMaxPayloadTransferSize = stream->maxpsize;
+	}
 }
 
 static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)

base-commit: d76bb1ebb5587f66b0f8b8099bfbb44722bc08b3
-- 
2.25.1


