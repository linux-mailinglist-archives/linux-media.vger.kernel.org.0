Return-Path: <linux-media+bounces-32065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A337AB072F
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 02:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C4931C01667
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 00:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D0F31EB3E;
	Fri,  9 May 2025 00:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="MGYaxESq"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7AC1F5FD;
	Fri,  9 May 2025 00:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746751407; cv=none; b=oe5BJAwVZRGn20cgjoxb3cf7zg3UOQI7IteWG5cOV2Jpd+jsw3P7mtvlFdyB93ulekDpVv3A1/8qpwlRO/oO6aP4BfDqumqS31VhlFRusIoQ/ubh8FnAedI78yPDzsJPZs7JrKhM3trPY7/1LBDD3Wgig1gAzq9fi4G6OCm7TYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746751407; c=relaxed/simple;
	bh=mrUpPE0EUKpDjR4ZljgRIVLcV4xGvjmPpGkgqkmaLZ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CQumhoo8fli2rYKDnFiWT4Cn3961IG5i8YB4npcTmkOO6yt3Ynmbmcc3H26f4Lf0vzaC8iqNer23WNrSIoVed0a8h5tK05NbvrksZ148Hr3Yts9FqW1A6TpwQttKpMtM5RdykKXWrz1vKEG9+Nkb2N/RQ3n56Etw/lFNVgOlDcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=MGYaxESq; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Pk
	wBpWHJdPYb2AnQNwr86bUir8BNrGUCWW793DJsGy8=; b=MGYaxESqnVk/fVGY8Z
	rtk2C6TnLwCQqzTOdGA/00esinpfU9WEJV0YVV40O+WRxtdbaL3VMFkDXU5YJry9
	TnfQnRvqwrx1MDP1GRhHK+M/sqhyW5jLxkgjxZ3QgRpxr76o3Kv04+4iI1cjXL+l
	IoSmuNBC+CTcwd7Q9epy2bfto=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3P_OGTx1o4blZAA--.13887S2;
	Fri, 09 May 2025 08:42:47 +0800 (CST)
From: chenchangcheng <ccc194101@163.com>
To: laurent.pinchart@ideasonboard.com,
	ribalda@chromium.org
Cc: hdegoede@redhat.com,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	chenchangcheng <chenchangcheng@kylinos.cn>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v8] media: uvcvideo: Fix bandwidth issue for Alcor camera.
Date: Fri,  9 May 2025 08:42:45 +0800
Message-Id: <20250509004245.45893-1-ccc194101@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3P_OGTx1o4blZAA--.13887S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFWDKry5WFWfKF1xAr4UCFg_yoW8Ar1Dpa
	1ruayFyryUJrWFganrJa1Fga15Janaka1fKFW3u34UZr45JryxZFy3K340q34qyan3Cw13
	tryqqr9F93yvvr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jYVbkUUUUU=
X-CM-SenderInfo: 5fffimiurqiqqrwthudrp/1tbiThVI3mgdTHNNmgAAsQ

From: chenchangcheng <chenchangcheng@kylinos.cn>

Some broken device return wrong dwMaxPayloadTransferSize fields
as follows:
    [  218.632537] [pid:20427,cpu6,guvcview,8]uvcvideo: Device requested 2752512 B/frame bandwidth.
    [  218.632598] [pid:20427,cpu6,guvcview,9]uvcvideo: No fast enough alt setting for requested bandwidth.

When dwMaxPayloadTransferSize is greater than maxpsize,
it will prevent the camera from starting.
So use the bandwidth of maxpsize.

Signed-off-by: chenchangcheng <chenchangcheng@kylinos.cn>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505072016.LlOxF8BG-lkp@intel.com/
---
 drivers/media/usb/uvc/uvc_video.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e3567aeb0007..0d5c17509ceb 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -262,6 +262,15 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 
 		ctrl->dwMaxPayloadTransferSize = bandwidth;
 	}
+
+	if (stream->intf->num_altsetting > 1 &&
+	    ctrl->dwMaxPayloadTransferSize > stream->maxpsize) {
+		dev_warn_ratelimited(&stream->intf->dev,
+				   "the max payload transmission size (%d) exceededs the size of the ep max packet (%d). Using the max size.\n",
+				   ctrl->dwMaxPayloadTransferSize,
+				   stream->maxpsize);
+		ctrl->dwMaxPayloadTransferSize = stream->maxpsize;
+	}
 }
 
 static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)

base-commit: d76bb1ebb5587f66b0f8b8099bfbb44722bc08b3
-- 
2.25.1


