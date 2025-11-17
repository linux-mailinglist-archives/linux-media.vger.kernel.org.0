Return-Path: <linux-media+bounces-47217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D6717C64EC3
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 16:41:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EDDFE4EAB6E
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 15:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5597275112;
	Mon, 17 Nov 2025 15:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rosa.ru header.i=@rosa.ru header.b="ebuGxqXG"
X-Original-To: linux-media@vger.kernel.org
Received: from forward204a.mail.yandex.net (forward204a.mail.yandex.net [178.154.239.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B442571A1;
	Mon, 17 Nov 2025 15:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763394037; cv=none; b=CMQmytnCVtOBWiLBJYDuPvc75+XSCRddfD3iXwwRnqYqoy9d1x8xL9cN8XEBw8BWc4IOjgrr1psKzS8AYsvCexX6E5EoBIeU2r94ikSY9FRyfADp5uS6yI2bymG8VX7CjbYUyvCUW49sXEekn6kAcbJ0yZC9JyeDzePdhOUhtGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763394037; c=relaxed/simple;
	bh=B0BBEYut7RIJlNGta6URCghTht5K6Ylx4CfM49OtJcI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fZ0s5SueRoXDOMyY6i1NwLkty51kWO5BbB+L6IYsZeKBmVOPj1tmDAgAJLXN06V+42nP3b+ekLRCacLJPngjX6dI8hhII9RXmLG/32BJz0Fmikd1jfY9XHPZdXQfXebWesgS13WDYp+VpOugzU5ZM0rX/kxkGojzrQu0HDNFCCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosa.ru; spf=pass smtp.mailfrom=rosa.ru; dkim=pass (1024-bit key) header.d=rosa.ru header.i=@rosa.ru header.b=ebuGxqXG; arc=none smtp.client-ip=178.154.239.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosa.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosa.ru
Received: from forward103a.mail.yandex.net (forward103a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d103])
	by forward204a.mail.yandex.net (Yandex) with ESMTPS id A08008246A;
	Mon, 17 Nov 2025 18:32:58 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net [IPv6:2a02:6b8:c2d:6c0a:0:640:c879:0])
	by forward103a.mail.yandex.net (Yandex) with ESMTPS id D1D4E80695;
	Mon, 17 Nov 2025 18:32:49 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id kWWweLwLr0U0-32uqdvfV;
	Mon, 17 Nov 2025 18:32:49 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosa.ru; s=mail;
	t=1763393569; bh=2FdZrhnoWupSb9f/5xpKxyzrRF/l3tMNY1G5OKa5HCY=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=ebuGxqXGmg+CDD5AGnXIJDWAPZZ1gdu7jcYZtE4Pgf4oBFFfgBD/gYQdfgGLZp+6K
	 NaouY6NnH6wSXZhqYwn65L3m753uKN1AG/MUw6fCg4C4DAgq7mpt0VEoXhJX29lRsQ
	 wvG94Cbyz8w41f99p2zS6U1ZgGjQ3xhbJ9uKgQBw=
Authentication-Results: mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net; dkim=pass header.i=@rosa.ru
From: Alexei Safin <a.safin@rosa.ru>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: a.safin@rosa.ru,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] media: ipu6: isys: csi2: guard NULL remote pad/subdev on enable/disable
Date: Mon, 17 Nov 2025 18:32:42 +0300
Message-ID: <20251117153244.16095-1-a.safin@rosa.ru>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

media_pad_remote_pad_first() may return NULL when the media link is absent
or disabled. The code dereferenced remote_pad->entity unconditionally,
leading to a possible NULL dereference.

On the disable path, always shut down the local stream when the remote pad
or subdev is missing and then return 0, preserving local shutdown semantics
and avoiding a crash.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 3a5c59ad926b ("media: ipu6: Rework CSI-2 sub-device streaming control")
Signed-off-by: Alexei Safin <a.safin@rosa.ru>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 08148bfc2b4b..4a75b0b6c525 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -358,7 +358,12 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	int ret;
 
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
+	if (!remote_pad)
+		return -ENOLINK;
+
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+	if (!remote_sd)
+		return -ENODEV;
 
 	sink_streams =
 		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
@@ -395,7 +400,16 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 						&streams_mask);
 
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
+	if (!remote_pad) {
+		ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
+		return 0;
+	}
+
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+	if (!remote_sd) {
+		ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
+		return 0;
+	}
 
 	ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
 
-- 
2.50.1 (Apple Git-155)


