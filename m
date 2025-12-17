Return-Path: <linux-media+bounces-49025-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF84CC99E2
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 22:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22119304699E
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 21:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FEDE2FD66D;
	Wed, 17 Dec 2025 21:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rosa.ru header.i=@rosa.ru header.b="iOfrMbcL"
X-Original-To: linux-media@vger.kernel.org
Received: from forward202b.mail.yandex.net (forward202b.mail.yandex.net [178.154.239.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075982C0F8F;
	Wed, 17 Dec 2025 21:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766007762; cv=none; b=JwKeb2G/TAI1AdFHMb1gTf1jgbit3HyKZKSHnCmT+kDX7k+wAmS2TuY3Y2i0S01ol6gaxnYygzKw7RCraB7cK97gK4KjMgdRzFA1F3JIF9z13hjhl75wqkmY/pN174usIBVCbfUk3eN4F1vJTFY0DEm14PHrErtad2vxmTAIuvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766007762; c=relaxed/simple;
	bh=4b5FNTCheTYP6P5wcICIh6JCvk0kPHYw+b9qaOwTyEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JAoGsyO8wnc8PrIDLZbJTxm2I6wgFuj9Dg+/ZJBKW1+3v5MT6sYy0pvRc0mAjqevkfhlNAMMGq6MqadMYAiO0gAtf7ZWMaOKIwnpxqTkWxne6Y8kmstgIOzOurzYnq5qdOkIOqwdg/YXxjHmV3D4krP6oU04f2KJaRDa3G/DFqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosa.ru; spf=pass smtp.mailfrom=rosa.ru; dkim=pass (1024-bit key) header.d=rosa.ru header.i=@rosa.ru header.b=iOfrMbcL; arc=none smtp.client-ip=178.154.239.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosa.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosa.ru
Received: from forward102b.mail.yandex.net (forward102b.mail.yandex.net [IPv6:2a02:6b8:c02:900:1:45:d181:d102])
	by forward202b.mail.yandex.net (Yandex) with ESMTPS id CCE6AC0D2C;
	Thu, 18 Dec 2025 00:36:37 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:152e:0:640:fcd0:0])
	by forward102b.mail.yandex.net (Yandex) with ESMTPS id BED74C0006;
	Thu, 18 Dec 2025 00:36:29 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id KadFMd1GGSw0-q5bSxvuB;
	Thu, 18 Dec 2025 00:36:29 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosa.ru; s=mail;
	t=1766007389; bh=UpPloyiXia/Dv4Z4z4Roiw/+E2oYB7f69OaXPtJSopc=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=iOfrMbcLsPAUPD1EuArUTRcHG3mCL6a0nWiibB178uUdbC2ommQOg6FBgmG3OefNa
	 UCeCmp7VkE6jAR1raGj83+lCm14z5ZORZrqEy3N6zNQKNi4iFpWItzUHd9snmlGzjH
	 elRa1PqrXcV4omT20NHBN1BYlXRyb2tOY/91GEaA=
Authentication-Results: mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net; dkim=pass header.i=@rosa.ru
From: Mikhail Lobanov <m.lobanov@rosa.ru>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mikhail Lobanov <m.lobanov@rosa.ru>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH v2 2/2] media: ipu6: isys: video: guard remote pad lookups in streaming helpers
Date: Thu, 18 Dec 2025 00:35:23 +0300
Message-ID: <20251217213526.196533-3-m.lobanov@rosa.ru>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251217213526.196533-1-m.lobanov@rosa.ru>
References: <20251217213526.196533-1-m.lobanov@rosa.ru>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipu6_isys_video_set_streaming(), ipu6_isys_fw_pin_cfg() and link_validate()
use media_pad_remote_pad_first() on the video node pad and dereference the
returned pad (and its entity) unconditionally. media_pad_remote_pad_first()
only returns a pad for an enabled link, and it may return NULL when the
pipeline is not connected or during teardown/error unwind.

Handle a missing remote pad explicitly: return -ENOTCONN when the remote
pad cannot be obtained and bail out from the firmware pin configuration
helper instead of crashing.

Reported by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 3c1dfb5a69cf ("media: intel/ipu6: input system video nodes and buffer queues")
Signed-off-by: Mikhail Lobanov <m.lobanov@rosa.ru>
---
v1: https://lore.kernel.org/lkml/20251211230037.48186-1-m.lobanov@rosa.ru
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index dec8f5ffcfa5..8ac310b6b342 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -401,6 +401,9 @@ static int link_validate(struct media_link *link)
 		link->sink->entity->name);
 
 	s_pad = media_pad_remote_pad_first(&av->pad);
+	if (!s_pad)
+		return -ENOTCONN;
+
 	s_stream = ipu6_isys_get_src_stream_by_src_pad(s_sd, s_pad->index);
 
 	v4l2_subdev_lock_state(s_state);
@@ -454,7 +456,6 @@ static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 				struct ipu6_fw_isys_stream_cfg_data_abi *cfg)
 {
 	struct media_pad *src_pad = media_pad_remote_pad_first(&av->pad);
-	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(src_pad->entity);
 	struct ipu6_fw_isys_input_pin_info_abi *input_pin;
 	struct ipu6_fw_isys_output_pin_info_abi *output_pin;
 	struct ipu6_isys_stream *stream = av->stream;
@@ -466,10 +467,16 @@ static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 	struct ipu6_isys *isys = av->isys;
 	struct device *dev = &isys->adev->auxdev.dev;
 	int input_pins = cfg->nof_input_pins++;
+	struct v4l2_subdev *sd;
 	int output_pins;
 	u32 src_stream;
 	int ret;
 
+	if (!src_pad)
+		return -ENOTCONN;
+
+	sd = media_entity_to_v4l2_subdev(src_pad->entity);
+
 	src_stream = ipu6_isys_get_src_stream_by_src_pad(sd, src_pad->index);
 	ret = ipu6_isys_get_stream_pad_fmt(sd, src_pad->index, src_stream,
 					   &fmt);
@@ -1016,6 +1023,9 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 
 	sd = &stream->asd->sd;
 	r_pad = media_pad_remote_pad_first(&av->pad);
+	if (!r_pad)
+		return -ENOTCONN;
+
 	r_stream = ipu6_isys_get_src_stream_by_src_pad(sd, r_pad->index);
 
 	subdev_state = v4l2_subdev_lock_and_get_active_state(sd);
-- 
2.47.2


