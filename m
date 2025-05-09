Return-Path: <linux-media+bounces-32066-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09292AB0736
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 02:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3B02987D98
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 00:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF9824B29;
	Fri,  9 May 2025 00:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="dcXQRGKT"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29B0CA5A;
	Fri,  9 May 2025 00:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746751502; cv=none; b=U4G4+JsePAT50xEBqORymb1/g/9fU3CTJvPlRsGNHexyw4+8Sq+lb4QRR6x9sgcSZNKDKUgFM+4lrm5xvD8P54eS8N8Jo8TEDNB3N0D1fI8sLhzcUtVLDXrPK5b+nEaHY+NfzZSUG5BwfQ/nsk3xr8loyNNvyip0iqwP4lLyf+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746751502; c=relaxed/simple;
	bh=WYLEN7GDQuX8YI51h/mpEIQKMRk9tXif0YsrrNFvm0E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=StuoBmMeDOXyVvR/YLFPVJIYxZnGWEOo/g5sX1OoqaauAwIpnCEw7z2SgBa5fDTwklS+XIT0E6ialuqGkXu/sgLWk4GEchnbVdqnNBF1/DYezCTKTCcDITVmMuTm5zAZaix+W/30YO3NN8VWr+NPhuEjTlXkaGJ/5Yghjq3IkIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=dcXQRGKT; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=IS
	vOnkwzNUeBg/PRQTOPDM/n0oOrO34l9pZ/YMUW4PU=; b=dcXQRGKTocpY0OvxmF
	aZ7NgTSrvCq1ECd0ElkPYOmJSEd3k2ZKNkhCedmu+pjmxZTvDGWtaB3ZjHrwgXIB
	xfDjEvPqafKg2rKhxZmsCGVlT/Z+kr/EdqwqbOjH9VhmMp7hymbYjGs+NCkWk+gc
	l1jT+iR3NACDieEWKCYK/2R34=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wBXlr_lTx1oLptcAA--.13195S2;
	Fri, 09 May 2025 08:44:22 +0800 (CST)
From: chenchangcheng <ccc194101@163.com>
To: laurent.pinchart@ideasonboard.com,
	ribalda@chromium.org
Cc: hdegoede@redhat.com,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	chenchangcheng <chenchangcheng@kylinos.cn>
Subject: [PATCH v9] media: uvcvideo: Fix bandwidth issue for Alcor camera.
Date: Fri,  9 May 2025 08:44:19 +0800
Message-Id: <20250509004419.49750-1-ccc194101@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBXlr_lTx1oLptcAA--.13195S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFWDKry5WFWfKF1xAr4UCFg_yoW8Xw1xpa
	1ruayFyryUJrWrWanrJa1rKw4rJanakw4fKFW3W34DZr15JryxXFy3G340q34qyan3Aw13
	tr1qqrnF939Yvr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jolksUUUUU=
X-CM-SenderInfo: 5fffimiurqiqqrwthudrp/1tbiwhFI3mgdSP6qlQAAs5

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


