Return-Path: <linux-media+bounces-47714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0017C86A99
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 19:37:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F2133AFA2C
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 18:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6622332908;
	Tue, 25 Nov 2025 18:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rosa.ru header.i=@rosa.ru header.b="Ud7xH5uZ"
X-Original-To: linux-media@vger.kernel.org
Received: from forward202b.mail.yandex.net (forward202b.mail.yandex.net [178.154.239.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B691C3314D2;
	Tue, 25 Nov 2025 18:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764095824; cv=none; b=s5LR9X7QmwD7j+Eo2mw9S42+NMbjX//ta4hosearCElCEZsdQH5uoCMktNae5qSn9Ptl/hil0PeogBccm9z1uI8dmnDrM9TYFid52L8Cpj3h5t6mnWoeCM84Zmqwx3RsH4SsQx0HJdF0zWZpDSJAvZA7f+hRaBxpLXjugZhcLF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764095824; c=relaxed/simple;
	bh=B0BBEYut7RIJlNGta6URCghTht5K6Ylx4CfM49OtJcI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bP1q9J0qwSo815OlCexKprUXa5KLfQ5F7GvPnI48EjBn2URIvJAGL2JiTnrA38nJNjLB3O84wsOYKkrJ61nHCsFSfae1QN+LMr+1IzhcJJJmoKGCPyHeRV4Vrs+Gm5T8qqhW74n/9wToB0cDzxPYTi3GcngynQDJ5gOtyS6zjac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosa.ru; spf=pass smtp.mailfrom=rosa.ru; dkim=pass (1024-bit key) header.d=rosa.ru header.i=@rosa.ru header.b=Ud7xH5uZ; arc=none smtp.client-ip=178.154.239.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosa.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosa.ru
Received: from forward102b.mail.yandex.net (forward102b.mail.yandex.net [IPv6:2a02:6b8:c02:900:1:45:d181:d102])
	by forward202b.mail.yandex.net (Yandex) with ESMTPS id 09E55C3763;
	Tue, 25 Nov 2025 21:31:25 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net [IPv6:2a02:6b8:c23:21b4:0:640:bc6c:0])
	by forward102b.mail.yandex.net (Yandex) with ESMTPS id 18C0DC00E0;
	Tue, 25 Nov 2025 21:31:15 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id CVhIZ91LUGk0-DtaOzvLb;
	Tue, 25 Nov 2025 21:31:14 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosa.ru; s=mail;
	t=1764095474; bh=2FdZrhnoWupSb9f/5xpKxyzrRF/l3tMNY1G5OKa5HCY=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=Ud7xH5uZupD9I9n9Ua98CKElrKFDjYjLlNdJ//k9cKN+x9U0zHCagOakuBE3jUNYT
	 h0U8UbyWi/2r0Ie7odPJSv8ADO6+Eut8vLijE9fl48wH3jdJ4gLtiNPEKNTejpF3e+
	 YizKmN87JLlTie4AoCGEg0fxzCSTwWGe35kQf6OI=
Authentication-Results: mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net; dkim=pass header.i=@rosa.ru
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
Subject: [PATCH] media: ipu6: isys: csi2: guard NULL remote pad/subdev on enable/disable
Date: Tue, 25 Nov 2025 21:31:08 +0300
Message-ID: <20251125183110.80525-1-a.safin@rosa.ru>
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


