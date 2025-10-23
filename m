Return-Path: <linux-media+bounces-45394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F79CC01CA1
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 16:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DA7E3A5471
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 14:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7823E32D0CA;
	Thu, 23 Oct 2025 14:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="igX4e8dg"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C173093AB
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 14:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761229611; cv=none; b=VoTgJZDXIGas8nbg047dgIyOF+DnLFBoyTlCPeFFCSDPMeL3GT3DB+A+kcZhz3KrW28XDb6NYrxcA3a/mL7q0cXBcwzHZcpNFFkAdRTsFyLtgWf+/8498OJyFHY72rTbPUwWq8bbwFcxHB8VSM/p5jSHwIbWhW3K+0esAyLl50k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761229611; c=relaxed/simple;
	bh=YI68EKFU9TffrHd/D7HWgGIjlN8nwL7+yudUSckbKA8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=GFlpJNB+zBZsZGzL3mA4+DaNsAQmQCijioYpw3+dhyI/Abu0X5ZmtgaZeNeOaqjqpz/8Ikiy6lm7CzYi/TGHQeg6Q5sQ8z9F+ut2d6wg/v4J1BlXH9rTaRsZzIHF9xT4x9/9TYzGwSPOVYrUxBPcsjVVG0YnWn3fty6fcmMyQZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=igX4e8dg; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251023142647euoutp0232f32005bf27d1cab52eeb958dcbef31~xJP8mUoJx1897818978euoutp02k
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 14:26:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251023142647euoutp0232f32005bf27d1cab52eeb958dcbef31~xJP8mUoJx1897818978euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761229607;
	bh=o0EkiVKNDKSUvha+9OqEAkQuyqaVZO0R6kPtgT+LbmI=;
	h=From:To:Cc:Subject:Date:References:From;
	b=igX4e8dg4LC1f+TjPWEChHJunKIUPmmbrKPKkPiQfQ5TGmMOND6hoB+W0ITh6e70L
	 aY9+x8Xm28OHTao1AS+xRpz9v3Ka7ArtAGLb0v+I5LhcxBZEzbOGgK5bMbMl2DsGRL
	 rJxLvIkWjJygKnvvsC//vJChmskY3kDNs/IrjRuc=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251023142646eucas1p1d963e56756c927f37cba10c7a6250002~xJP7sG-za2140321403eucas1p1N;
	Thu, 23 Oct 2025 14:26:46 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251023142646eusmtip137f5fdc97e2bdc2816f4d3c4b24f84e0~xJP7MykQW0194901949eusmtip1N;
	Thu, 23 Oct 2025 14:26:46 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa
	<tfiga@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Guennadi
	Liakhovetski <g.liakhovetski@gmx.de>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Hans Verkuil <hverkuil@kernel.org>,
	stable@vger.kernel.org, Shuangpeng Bai <SJB7183@psu.edu>
Subject: [PATCH v4] media: videobuf2: forbid remove_bufs when legacy fileio
 is active
Date: Thu, 23 Oct 2025 16:26:34 +0200
Message-Id: <20251023142634.1642093-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251023142646eucas1p1d963e56756c927f37cba10c7a6250002
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251023142646eucas1p1d963e56756c927f37cba10c7a6250002
X-EPHeader: CA
X-CMS-RootMailID: 20251023142646eucas1p1d963e56756c927f37cba10c7a6250002
References: <CGME20251023142646eucas1p1d963e56756c927f37cba10c7a6250002@eucas1p1.samsung.com>

vb2_ioctl_remove_bufs() call manipulates queue internal buffer list,
potentially overwriting some pointers used by the legacy fileio access
mode. Forbid that ioctl when fileio is active to protect internal queue
state between subsequent read/write calls.

CC: stable@vger.kernel.org
Fixes: a3293a85381e ("media: v4l2: Add REMOVE_BUFS ioctl")
Reported-by: Shuangpeng Bai <SJB7183@psu.edu>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v4:
- got back to simple vb2_fileio_is_active() check as in v1, as relying on
  vb2_verify_memory_type() misses some corner cases important to v4l2
  compliance

v3: https://lore.kernel.org/all/20251023113052.1303082-1-m.szyprowski@samsung.com/
- moved vb2_verify_memory_type() check after (d->count == 0) check to pass v4l2
 compliance

v2: https://lore.kernel.org/all/20251020160121.1985354-1-m.szyprowski@samsung.com/
- dropped a change to vb2_ioctl_create_bufs(), as it is already handled
  by the vb2_verify_memory_type() call
- replaced queue->type check in vb2_ioctl_remove_bufs() by a call to
  vb2_verify_memory_type() which covers all cases

v1: https://lore.kernel.org/all/20251016111154.993949-1-m.szyprowski@samsung.com/
---
 drivers/media/common/videobuf2/videobuf2-v4l2.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index d911021c1bb0..83862d57b126 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -1010,6 +1010,11 @@ int vb2_ioctl_remove_bufs(struct file *file, void *priv,
 	if (vb2_queue_is_busy(vdev->queue, file))
 		return -EBUSY;
 
+	if (vb2_fileio_is_active(vdev->queue)) {
+		dprintk(vdev->queue, 1, "file io in progress\n");
+		return -EBUSY;
+	}
+
 	return vb2_core_remove_bufs(vdev->queue, d->index, d->count);
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_remove_bufs);
-- 
2.34.1


