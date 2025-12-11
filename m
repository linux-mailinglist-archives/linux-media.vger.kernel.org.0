Return-Path: <linux-media+bounces-48659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE6CCB753D
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 00:01:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2EC97300FE28
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 23:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53AB8246770;
	Thu, 11 Dec 2025 23:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rosa.ru header.i=@rosa.ru header.b="EJmw+zOu"
X-Original-To: linux-media@vger.kernel.org
Received: from forward102a.mail.yandex.net (forward102a.mail.yandex.net [178.154.239.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281611F95C;
	Thu, 11 Dec 2025 23:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765494094; cv=none; b=u5O0V4BWy7i44kjB5Q/bqdtNOk9nrEjdS1K8GlYOiNy0TbKp45HjNCtZ5UzSDRPWp7+WE/XUZIE+cWpF9DkgBqGjnLe/7lkUQeFPTIeTiXWA19zRreE5cdVTP8TzphwBUv+ZeFh3Nb2iuM8P+lTqRvNpzCGgnbRXeGQ7kgJOaKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765494094; c=relaxed/simple;
	bh=J6sc6H5F1zF6uwfyZySSF9Izffw/d6iEbnw23B4zgmE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RXo+Ed5EaFYebc/aZgfhxwdmaYtKdV4zGyf7ZJQBfdYUiuysts2AVbfdp41iuKvYYE0NK+yvnak5FRJeddDXcbKT0pGE25we2VyiWXwr91iBoH33MV8iRnZJ2k6E2p1tSffGnKpbwCW4WusiGfvQljrO6NrkVrbZIAXCHSVAd0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosa.ru; spf=pass smtp.mailfrom=rosa.ru; dkim=pass (1024-bit key) header.d=rosa.ru header.i=@rosa.ru header.b=EJmw+zOu; arc=none smtp.client-ip=178.154.239.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosa.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosa.ru
Received: from mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1f:5d94:0:640:92d3:0])
	by forward102a.mail.yandex.net (Yandex) with ESMTPS id C1C57C005E;
	Fri, 12 Dec 2025 02:01:18 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id F1Ze28fLpW20-oVgEpMUT;
	Fri, 12 Dec 2025 02:01:18 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosa.ru; s=mail;
	t=1765494078; bh=3HEl06BiMqQbhShWpuDvvwJd/ZAzLr+rNiMN52qpYag=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=EJmw+zOukoVf5Y/A8TReXpUG7awt7UtZekKgpZ03ypXtRX4dTK8mwLZveuWrHzrIp
	 uD1IeXOuCpvXj32gP3LQ6s10rPMOb3gZKriuXHiRB1ztLldzI5OpF9GxFQ/0iivEQi
	 pYcV9YeUY4Kc1qVmQOnINXxDb7sq4FwdpnNqD8BM=
Authentication-Results: mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net; dkim=pass header.i=@rosa.ru
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
Subject: [PATCH] media: ipu6: isys: fix video NULL deref on missing remote pad
Date: Fri, 12 Dec 2025 02:00:36 +0300
Message-ID: <20251211230037.48186-1-m.lobanov@rosa.ru>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

media_pad_remote_pad_first() may return NULL when there is no enabled
media link on the video node pad. ipu6_isys_video_set_streaming() and
ipu6_isys_fw_pin_cfg() dereference the returned pad and its entity
unconditionally, which can lead to a NULL pointer dereference when the
pipeline is not connected.

Check the remote pad before using it, return -ENOTCONN from the streaming
setup path when no remote pad is found, and bail out from the firmware
pin configuration helper instead of crashing.

Reported by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 3c1dfb5a69cf ("media: intel/ipu6: input system video nodes and buffer queues")
Signed-off-by: Mikhail Lobanov <m.lobanov@rosa.ru>
---
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


