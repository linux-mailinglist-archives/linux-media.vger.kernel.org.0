Return-Path: <linux-media+bounces-48128-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02765C9E3BC
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 09:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC8DD3A5C83
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 08:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D832D4B5A;
	Wed,  3 Dec 2025 08:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rw6D1pPo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB86E24DD09
	for <linux-media@vger.kernel.org>; Wed,  3 Dec 2025 08:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764750930; cv=none; b=etwj209ANQoT2QvCXkoClMJtmvbjewOEVU4jNh/hTYPj6D19Ryvlq8aW4/IJ9tuGfMUvX8rqSUwSiVv7wBZ6sc2N4lg5cMPKkWwlfA0TJKHAQgQosn3ZCAKkrCCMUsmHSRvks0fZi1UO67IaKORSJ+UoMWD/1gxCtoGYk/ddbAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764750930; c=relaxed/simple;
	bh=oH8yQGzzXZcaEdMki6U8Ym7VH1MYIj3PoyhKbQTCAts=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WXmLSkEgJgPZRq6tJY15DKLuGbA5BQ2KcwdXoXE8GLfXDxAyQ8DkimtTYO7ovMD41LJuLguMIP26bTbQkdv6SglDXFN0IdyLlzUv2cQ51Csl2DYYDVhU3Ivsy4oIll3r8ti2lnyNlCMefyHocyZuzewNb+s7srNMvIfw3P//py8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rw6D1pPo; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-29555b384acso72029075ad.1
        for <linux-media@vger.kernel.org>; Wed, 03 Dec 2025 00:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764750928; x=1765355728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tf1nnmSZ7EAkZS208EkRia8wUwwUIdfQx1MPOO30xbk=;
        b=Rw6D1pPo4yydAjNVGTdbJSQD+0DnBjAupZ0PQ+oFqqoyeImVD9NfKoYQxUjJT/8ljJ
         /RzDBGCbvYm2QPqGaenBnE4sGmejD4HZIUWx0KBPQEY/HKPcalKgMg2kbZH5FXakxHOn
         XA5sM25pEIjDIoe63kmQ0G7PGqMbvzH68Kxe3KNIkO4urg3029Tm2XSYLCcIraJX+/Vm
         fgcQcMEoVYUbVEqSph4rPg1hluZCxcxK9j4haCZL1TN8MlRE2nmHzrJxv19yAeJDZGO4
         5MPOnzWulyRKgAfIe3xc/E67/JgdI5YDHjbWryIBT1RkZDr++wesCPmfR5Wnmr3dlFm8
         YdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764750928; x=1765355728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tf1nnmSZ7EAkZS208EkRia8wUwwUIdfQx1MPOO30xbk=;
        b=ByTBkv6LcZMBeRv8Waceek6bqsMRAQOQrMMWmJ0LZLThSspXbAXCXysBnoXY/kfZp9
         uKw29iYpy9M4b7XXahtGejQPdGdjNZkqbTizxkNeHBAjep8P2Flgd8yy4C3IirT4lBcN
         u4onrlAvaY56OIDNQcPw6+LKvFJIC5v+TF8Ww8qbemjm31i/2Qdc5i7hoV3grlLmj07X
         VYf5hutmVVqsxD3EZycIH3VuFiLWTVwsqxeoD3Ol4VPgndsTljMR6/9L+TVWSTDnvjly
         Qtwb6ZzW4jfLWqi4rIgjUPPmTBffjWOcC1RugsxVh54I6u7UGZaJ+hn2JIXalYDFc1on
         wMUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFZg19lILKT74f1yZoKrxYzG+h4KowbV7lT7YcDU3HEU/4dl0trhqmah71bF5yRdT9nA0bNt0wr7cKVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNd0j+mS4YhOeiCcVkIbzIunnZtfOTJa+bVh61nIjvM3E5zz1o
	f0liJ3MWiXJBToeimM66Nln0ykl3oE+uRfsgYYGHbu/jkKaCkcyWj8qx
X-Gm-Gg: ASbGncuMQf83OSyFNxMbPoHzuSG5IvX/VrLmNrjAiDryuVG5ZBB1KAtSF31kI/qLIHP
	5nf7atIqOTIcmN3aihHp7sSE0uSU7ocCFbP/fQnu2jbFh+avDDwnJLRgNMeuDaNU8wmxt7Zkxqi
	ozBbulxyExokBxMyqIOXH5tGdGEbS5q843tAtV+tXFHGA46UeuzvPvvmLrroAgKXbjZYJT43tjP
	mSR4caEycoKBTu6uL70ZSbOaZOPUoWnq/6T5bPEMEpYELrPexWq5nL60vsGtpEXlHGtEaUHRKQA
	Qb3Tv4RSk7o5FkQ7BYW09ctwAlpEh0CfQUiKBr7+ywXkpcume79c5QgiBG5zDND8p19FUW3lDbI
	XmmMHaytzJWi7we6KF6ojT4qzPdDS9RuaADvOoEfy7P5+GDGsWEHkzKypkeJ0KY7kv33D5g2Udx
	5Yojplo8lTV85F+fbEfSwyVdXCq00=
X-Google-Smtp-Source: AGHT+IEAKboQRaFs/KJv+Ej0IKMc71NAUxirzYj6FDqusBLvHmU6/h0Z+CFr40zf6m6cyoyFqNmkVg==
X-Received: by 2002:a17:903:11c3:b0:297:d6c2:d06 with SMTP id d9443c01a7336-29d682f4d7dmr18117135ad.20.1764750927866;
        Wed, 03 Dec 2025 00:35:27 -0800 (PST)
Received: from pavan.localdomain ([49.37.149.66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1520a48b2sm19390530b3a.28.2025.12.03.00.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 00:35:27 -0800 (PST)
From: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	laurent.pinchart+renesas@ideasonboard.com,
	hverkuil+cisco@kernel.org,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	pavankumaryalagada@gmail.com
Subject: [PATCH v5] staging: most: video: prevent probes during component exit
Date: Wed,  3 Dec 2025 03:34:11 -0500
Message-ID: <20251203083411.7072-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When comp_exit() runs, comp_probe_channel() could still add new devices
to video_devices, creating a race and potentially leaving the list in
an inconsistent state.

This patch prevents new devices from being added while exiting by:

- comp_probe_channel() checks comp_exiting before modifying video_devices.

	if (comp_exiting) {
		spin_unlock_irq(&list_lock);
		ret = -BUSY;
		goto err_unreg;
	}

This ensures that all partially created resources are properly freed
and no new channels are allowed while the driver is being unloaded.

Signed-off-by: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>

---

v5:
 - Removed unlikely() macro since this is not fast path.
 - Added comp_unregister_videodev() to err_unreg cleanup patch.
 - Removed blank line in comp_exit().

v4:
 - Used unlikely() for the comp_exiting check to optimize branch
   prediction.
 - Removed err_cleanup and use err_unreg for proper cleanup
   of partially initialized mdev/v4l2 structures.
 - Removed redundant spinlock usage around 'comp_exiting = true;'
   comp_exit().
 - Removed explicit kfree(mdev) in comp_exit() loop.

v3:
 - comp_exiting flag update and memory cleanup for early exits.
 - Commit message clarified for reviewers.
 - Removed WARN/BUG as it becomes unnecessary.
---
 drivers/staging/most/video/video.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 32f71d9a9cf7..11e63f5d5b84 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -60,6 +60,8 @@ static inline struct comp_fh *to_comp_fh(struct file *filp)
 static LIST_HEAD(video_devices);
 static DEFINE_SPINLOCK(list_lock);

+static bool comp_exiting;
+
 static inline bool data_ready(struct most_video_dev *mdev)
 {
 	return !list_empty(&mdev->pending_mbos);
@@ -498,11 +500,17 @@ static int comp_probe_channel(struct most_interface *iface, int channel_idx,
 		goto err_unreg;

 	spin_lock_irq(&list_lock);
+	if (comp_exiting) {
+		spin_unlock_irq(&list_lock);
+		ret = -EBUSY;
+		goto err_unreg;
+	}
 	list_add(&mdev->list, &video_devices);
 	spin_unlock_irq(&list_lock);
 	return 0;

 err_unreg:
+	comp_unregister_videodev(mdev);
 	v4l2_device_disconnect(&mdev->v4l2_dev);
 	v4l2_device_put(&mdev->v4l2_dev);
 	return ret;
@@ -555,6 +563,8 @@ static void __exit comp_exit(void)
 {
 	struct most_video_dev *mdev, *tmp;

+	comp_exiting = true;
+
 	/*
 	 * As the mostcore currently doesn't call disconnect_channel()
 	 * for linked channels while we call most_deregister_component()
@@ -575,7 +585,6 @@ static void __exit comp_exit(void)

 	most_deregister_configfs_subsys(&comp);
 	most_deregister_component(&comp);
-	BUG_ON(!list_empty(&video_devices));
 }

 module_init(comp_init);
--
2.47.3


