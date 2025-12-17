Return-Path: <linux-media+bounces-49024-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3006CC99DC
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 22:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E5753035A68
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 21:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BEF82EBBB3;
	Wed, 17 Dec 2025 21:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rosa.ru header.i=@rosa.ru header.b="MVr22lQ2"
X-Original-To: linux-media@vger.kernel.org
Received: from forward200a.mail.yandex.net (forward200a.mail.yandex.net [178.154.239.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4143A1E6E;
	Wed, 17 Dec 2025 21:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766007751; cv=none; b=HGTy35OZwMIGws8ZguvFgrvZ38VeJNXH6da7gAsEXdP+qg2kiUK6QkhPxbFcGCN9//Q3puxBJ/eX4eoAGmrwJa0gWYyRq3EnbW8A/pObW8uontMHu+Q7IQ7SQUTl+o/U6iij9X93AMZ+1VQNefLRKfjmf772XoWBw2iR8Vlx+hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766007751; c=relaxed/simple;
	bh=HFFSYw+9TFWIDl0kw5JFM9nHu9PrUVsNIfx6WLSyI4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CdvSfRS1lGFxJ6hbGZxs5a8fhpjKHpy4tN45bsrQffnKwAJ3jA7McF6bJj0Gt+XrRolPt0BW8+3OfgonaA8mICOwmCIwZkmpJJV/VAt+//86OdzbSY4hBgJU2FvywoB0tySVcx3MOMXdBzO9e67VLeNz31eugGslXIKUU6adLh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosa.ru; spf=pass smtp.mailfrom=rosa.ru; dkim=pass (1024-bit key) header.d=rosa.ru header.i=@rosa.ru header.b=MVr22lQ2; arc=none smtp.client-ip=178.154.239.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosa.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosa.ru
Received: from forward100a.mail.yandex.net (forward100a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d100])
	by forward200a.mail.yandex.net (Yandex) with ESMTPS id 17D3EC65F7;
	Thu, 18 Dec 2025 00:36:36 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:152e:0:640:fcd0:0])
	by forward100a.mail.yandex.net (Yandex) with ESMTPS id A231CC0151;
	Thu, 18 Dec 2025 00:36:27 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id KadFMd1GGSw0-J4t2V3Ta;
	Thu, 18 Dec 2025 00:36:26 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosa.ru; s=mail;
	t=1766007386; bh=ZRgKpu92AOafXoykEorh7ztjqNxci17cSIrR1UvoS2s=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=MVr22lQ2q766JHDbOSLvtT8lmBxOtm0dEsBrx5OzXHnC+7DhQwK1o0N1sJ4oZC+bJ
	 JVfj0yEzpFq11x+Rvzai0IrxiWCeJolQ1ysZizRNutYHMZxnh/6lI5fraKvOpPV2C5
	 0fEsjOhLPwPJKmOOYm3X+pLIvw/K3NsebbymNg5M=
Authentication-Results: mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net; dkim=pass header.i=@rosa.ru
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
Subject: [PATCH v2 1/2] media: ipu6: isys: csi2: guard remote pad lookups in stream ops
Date: Thu, 18 Dec 2025 00:35:22 +0300
Message-ID: <20251217213526.196533-2-m.lobanov@rosa.ru>
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

ipu6_isys_csi2_enable_streams() and ipu6_isys_csi2_disable_streams()
use media_pad_remote_pad_first() on the CSI-2 sink pad and dereference
the returned remote pad unconditionally. media_pad_remote_pad_first()
only returns a pad for an enabled link, and the external subdev -> CSI-2
sink link is created only when the external subdev is successfully bound
in isys_complete_ext_device_registration().

CSI-2 subdevs are registered independently of external devices and are
created with HAS_DEVNODE and STREAMS flags. As a result, the CSI-2 stream
callbacks can be reached even when a given CSI-2 port has no enabled
upstream link, in which case media_pad_remote_pad_first() returns NULL.

Check the remote pad before dereferencing it. Return -ENOTCONN from the
enable path when no remote pad is found. In the disable path, always stop
the local CSI-2 receiver and return success when the remote link is
missing to keep teardown best-effort and consistent with the existing
behaviour (remote disable errors are not propagated today).

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 3a5c59ad926b ("media: ipu6: Rework CSI-2 sub-device streaming control")
Signed-off-by: Mikhail Lobanov <m.lobanov@rosa.ru>
---
v1: https://lore.kernel.org/lkml/20251211221040.19870-1-m.lobanov@rosa.ru
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


