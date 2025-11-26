Return-Path: <linux-media+bounces-47742-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7286BC88DA6
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 10:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 784054EB884
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 09:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D11F31A56C;
	Wed, 26 Nov 2025 09:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rosa.ru header.i=@rosa.ru header.b="aeR4UvF+"
X-Original-To: linux-media@vger.kernel.org
Received: from forward202b.mail.yandex.net (forward202b.mail.yandex.net [178.154.239.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD0E30BF74;
	Wed, 26 Nov 2025 09:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764147968; cv=none; b=Ur144X8jUaWI4SZtp5hr+6tD2p+RNnp8y1ZI411ySkxNOHKPuPC7fHmlMSGs0ZtkquH+F3ZvwLsCB9TRAO5QJNc+zvxSVzaFcqqIG6OLdQ/1WtdZWxRiejETNNGSw1SSIjMGvWTsNJ2tiJDlv7D3W2mlARM/b93+RUVguLnuzRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764147968; c=relaxed/simple;
	bh=t2D9zTi3yzpM1US3TyIIKlUvKQWN7AbPD6Vsej4C2j8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iXp3ugRnjQxZqhbSWyLG6igPzyZjtmN40susgfPkGFgy0PMpaQw3PEHiwX/2usZtP9sHhnUqGedK+9g6eJOpWoWsYBKLcPmsIwDxEoTb3jqVRXAVbTm0jJluhJSgjPvF/Tf0BVbxZ9c3ce3ebTewnnjr6Ec5SiBvPq7Cx5l1vGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosa.ru; spf=pass smtp.mailfrom=rosa.ru; dkim=pass (1024-bit key) header.d=rosa.ru header.i=@rosa.ru header.b=aeR4UvF+; arc=none smtp.client-ip=178.154.239.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosa.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosa.ru
Received: from forward100b.mail.yandex.net (forward100b.mail.yandex.net [IPv6:2a02:6b8:c02:900:1:45:d181:d100])
	by forward202b.mail.yandex.net (Yandex) with ESMTPS id D70ABC6B69;
	Wed, 26 Nov 2025 12:05:57 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-60.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-60.sas.yp-c.yandex.net [IPv6:2a02:6b8:c24:25b4:0:640:a124:0])
	by forward100b.mail.yandex.net (Yandex) with ESMTPS id 9C9FF80AE4;
	Wed, 26 Nov 2025 12:05:49 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-60.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id k5Z5KF9LtCg0-myeGhbKl;
	Wed, 26 Nov 2025 12:05:49 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosa.ru; s=mail;
	t=1764147949; bh=NVaWNxH7aw+f30xafEBllRkp2WBQzlLrZm8JIY4pRms=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=aeR4UvF+6Q6PU7HJ6YhKUZMLb1D/cUmzn6rMov6VRA6lZGkiq/YSIjAmC1BMuNQgf
	 qPZU9YvIsKACTgSsBFUtmAmYFz5qR7aSmGHIIaxVMuGvcnBAn0J27k8EQGolN49Qm7
	 nWW26SdR2/kPjoNvGXy0VGq9+/tGJISF9deYo3lE=
Authentication-Results: mail-nwsmtp-smtp-production-main-60.sas.yp-c.yandex.net; dkim=pass header.i=@rosa.ru
From: Alexei Safin <a.safin@rosa.ru>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: a.safin@rosa.ru,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH] media: ipu6: isys: csi2: guard remote pad/subdev and zero link freq
Date: Wed, 26 Nov 2025 12:05:43 +0300
Message-ID: <20251126090545.97411-1-a.safin@rosa.ru>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

media_pad_remote_pad_first() may return NULL when the media link is absent
or disabled. The code dereferenced remote_pad->entity unconditionally in
ipu6_isys_csi2_enable_streams() and ipu6_isys_csi2_disable_streams(),
leading to a possible NULL dereference.

Guard the remote pad/subdev: in enable path return -ENOLINK/-ENODEV, in
disable path always shut down the local stream first and return 0 if the
remote side is missing. This keeps local shutdown semantics intact and
prevents a crash when the graph is partially torn down.

Also, ipu6_isys_csi2_calc_timing() passes link_freq into calc_timing()
where it is used as a divisor. v4l2_get_link_freq() may yield 0; add an
explicit check and return -EINVAL to avoid division by zero.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 3a5c59ad926b ("media: ipu6: Rework CSI-2 sub-device streaming control")
Cc: stable@vger.kernel.org
Signed-off-by: Alexei Safin <a.safin@rosa.ru>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index d1fece6210ab..58944918c344 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -171,6 +171,10 @@ ipu6_isys_csi2_calc_timing(struct ipu6_isys_csi2 *csi2,
 	if (link_freq < 0)
 		return link_freq;
 
+	/* Avoid division by zero in calc_timing() if link frequency is zero */
+	if (!link_freq)
+		return -EINVAL;
+
 	timing->ctermen = calc_timing(CSI2_CSI_RX_DLY_CNT_TERMEN_CLANE_A,
 				      CSI2_CSI_RX_DLY_CNT_TERMEN_CLANE_B,
 				      link_freq, accinv);
@@ -352,7 +356,12 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
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
@@ -389,7 +398,16 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
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


