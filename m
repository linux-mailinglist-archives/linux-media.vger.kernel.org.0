Return-Path: <linux-media+bounces-20592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 764F99B62C5
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 13:15:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22DBD1F21059
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 12:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0491A1E909B;
	Wed, 30 Oct 2024 12:15:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BAD1E7C0A;
	Wed, 30 Oct 2024 12:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290506; cv=none; b=AIITliwaNzSUr66+QSQUtM76BwTtSFcxhMMfNfxsqm7uuvlXnBw+YnKlTQ2cFPew1OvH/IUKsIBCkSYa/ragO4Sk3GRrWmuDpcpnWsskgBJgprsOG7HXp6cngvhDHc3mCXVI0pjdJbrVdxjEslT6ThwuX+149xMbp3dBkQut59k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290506; c=relaxed/simple;
	bh=UhSiF+V6M9qHwAONR8rQ3KB37XoyLkc3yCdh97dZiGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N6CHLUnObQWDh+GsQxQvlu8PjYBKgHUeNG2FBosIWyr5F3+Gsa9+I5pZJtLrUCHEk19iNAHWk6yHv69ufgeUTLdBgmLy10r4RpbjxeHkwBsQp/E5LAdbiup/T5LJkFdgIpEC9xgHQzkI/QILEGwGiLCF9+85bw3y+fQCxGsaxMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.. (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 3A3386F807;
	Wed, 30 Oct 2024 13:14:54 +0100 (CET)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH] media: mgb4: Fix inconsistent input/output alignment in loopback mode
Date: Wed, 30 Oct 2024 13:14:46 +0100
Message-ID: <20241030121446.1743-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Fixes broken output due to different input/output alignment in loopback
mode when the (last) input device is closed. Instead of on device close,
do the alignment synchronisation when enabling the loopback.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/media/pci/mgb4/mgb4_sysfs_out.c |  5 ++++-
 drivers/media/pci/mgb4/mgb4_vin.c       | 19 +------------------
 2 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_sysfs_out.c b/drivers/media/pci/mgb4/mgb4_sysfs_out.c
index 573aa61c69d4..88429d400ce3 100644
--- a/drivers/media/pci/mgb4/mgb4_sysfs_out.c
+++ b/drivers/media/pci/mgb4/mgb4_sysfs_out.c
@@ -122,9 +122,12 @@ static ssize_t video_source_store(struct device *dev,
 	if (loopin_old && loopin_cnt(loopin_old) == 1)
 		mgb4_mask_reg(&mgbdev->video, loopin_old->config->regs.config,
 			      0x2, 0x0);
-	if (loopin_new)
+	if (loopin_new) {
 		mgb4_mask_reg(&mgbdev->video, loopin_new->config->regs.config,
 			      0x2, 0x2);
+		mgb4_write_reg(&mgbdev->video, voutdev->config->regs.padding,
+			       loopin_new->padding);
+	}
 
 	if (val == voutdev->config->id + MGB4_VIN_DEVICES)
 		mgb4_write_reg(&mgbdev->video, voutdev->config->regs.config,
diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
index 185fb28226b6..1fb28dd443fa 100644
--- a/drivers/media/pci/mgb4/mgb4_vin.c
+++ b/drivers/media/pci/mgb4/mgb4_vin.c
@@ -331,27 +331,10 @@ static int fh_open(struct file *file)
 	return rv;
 }
 
-static int fh_release(struct file *file)
-{
-	struct mgb4_vin_dev *vindev = video_drvdata(file);
-	int rv;
-
-	mutex_lock(&vindev->lock);
-
-	if (v4l2_fh_is_singular_file(file))
-		set_loopback_padding(vindev, 0);
-
-	rv = _vb2_fop_release(file, NULL);
-
-	mutex_unlock(&vindev->lock);
-
-	return rv;
-}
-
 static const struct v4l2_file_operations video_fops = {
 	.owner = THIS_MODULE,
 	.open = fh_open,
-	.release = fh_release,
+	.release = vb2_fop_release,
 	.unlocked_ioctl = video_ioctl2,
 	.read = vb2_fop_read,
 	.mmap = vb2_fop_mmap,

base-commit: 698b6e3163bafd61e1b7d13572e2c42974ac85ec
-- 
2.46.2


