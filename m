Return-Path: <linux-media+bounces-48657-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51653CB74AE
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 23:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 933FE303D31B
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 22:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965022E8B85;
	Thu, 11 Dec 2025 22:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rosa.ru header.i=@rosa.ru header.b="HRawDAyE"
X-Original-To: linux-media@vger.kernel.org
Received: from forward201b.mail.yandex.net (forward201b.mail.yandex.net [178.154.239.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677C72868A7;
	Thu, 11 Dec 2025 22:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765491585; cv=none; b=XeEHZnTlrKjXfu94YiohLt6H1GcDAxD5vSDYLyLTKB7nZZydiYa7wrvAKO3wIXNu395TeYuIrKJfeCPTHDCZfwiqrerdSH03OZMhle3uAFxReDlUaZyz8QJLboFatsrJRIT1fch0lkN8CGdrzw+LY4pF3KQ9TxvQeJQRZwq3fSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765491585; c=relaxed/simple;
	bh=94NGcgyxrXJa05Ey6GfoAvuw44K9PFGl8dsNS5vhcvs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KpYnHwPg4S4j+95EPQqZ/GimtvfqX+rnJJsct5g1pondPVhutq6OibYodFeQ9oiYRIgxF8QXzQaGHLhq9l8mHE7JGgUZbYVFalu5WOx3glioU/nTRLQhcEKvkC341C0BC72ZrbDXBD2ye/ji2KX/eK/QtJF9XeKRfgjEdNlSYpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosa.ru; spf=pass smtp.mailfrom=rosa.ru; dkim=pass (1024-bit key) header.d=rosa.ru header.i=@rosa.ru header.b=HRawDAyE; arc=none smtp.client-ip=178.154.239.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosa.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosa.ru
Received: from forward100b.mail.yandex.net (forward100b.mail.yandex.net [IPv6:2a02:6b8:c02:900:1:45:d181:d100])
	by forward201b.mail.yandex.net (Yandex) with ESMTPS id C64F5C44F2;
	Fri, 12 Dec 2025 01:11:26 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net [IPv6:2a02:6b8:c10:2220:0:640:d16f:0])
	by forward100b.mail.yandex.net (Yandex) with ESMTPS id 5874680B58;
	Fri, 12 Dec 2025 01:11:18 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id FBYmOwcLpOs0-KIybKqoz;
	Fri, 12 Dec 2025 01:11:17 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosa.ru; s=mail;
	t=1765491077; bh=VUQgAXncN1qB3sUeSmlTirbqZ3LQ9AqEd4D9XYd8D+Q=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=HRawDAyEtSigW8/oubc032lxoHYB4V4bsO4jOhltzKcvj/z3F9s9SXUOPxx/1MMcc
	 mDb9Jx7StPRHAsN0lzasdWZFzqNE6sNPhQ5EREWxXi1HceB6W/9CsSTcqpYN06gfN4
	 eHAg9ec85P8LYhXBrPG2S5WjLWr3LMeSohxGYXag=
Authentication-Results: mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net; dkim=pass header.i=@rosa.ru
From: Mikhail Lobanov <m.lobanov@rosa.ru>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mikhail Lobanov <m.lobanov@rosa.ru>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] media: ipu6: isys: fix csi2 NULL deref in stream enable/disable
Date: Fri, 12 Dec 2025 01:10:38 +0300
Message-ID: <20251211221040.19870-1-m.lobanov@rosa.ru>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

media_pad_remote_pad_first() may return NULL when there is no enabled
media link on the CSI-2 sink pad. ipu6_isys_csi2_enable_streams() and
ipu6_isys_csi2_disable_streams() dereference remote_pad->entity
unconditionally, which can lead to a NULL pointer dereference when no
remote pad is present.

Check the remote pad before dereferencing it, return -ENOTCONN from the
enable path when no remote pad is found, and always stop the local CSI-2
stream in the disable path even if the remote entity is already gone.
Rely on this check to also cover the remote sub-device, as
media_entity_to_v4l2_subdev() only returns NULL when called with a NULL
entity.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 3a5c59ad926b ("media: ipu6: Rework CSI-2 sub-device streaming control")
Signed-off-by: Mikhail Lobanov <m.lobanov@rosa.ru>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 43a2a16a3c2a..29791b66d479 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -356,6 +356,9 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	int ret;
 
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
+	if (!remote_pad)
+		return -ENOTCONN;
+
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
 	sink_streams =
@@ -393,6 +396,11 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 						&streams_mask);
 
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
+	if (!remote_pad) {
+		ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
+		return 0;
+	}
+
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
 	ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
-- 
2.47.2


