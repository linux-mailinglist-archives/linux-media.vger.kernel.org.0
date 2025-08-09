Return-Path: <linux-media+bounces-39202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C5CB1F65C
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F7203BD290
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA13627A462;
	Sat,  9 Aug 2025 21:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eJhWXgcR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A674327E04C
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774255; cv=none; b=XrrYyhWvoFPv3TvTXqrSNQo+MYDxht6m1uyUHlFe12ivSK9hmiahNC6IjskYynt1g27xSpGKCml5i7lmeHROH85k9nrFN/oKIxF1PZ+jkJA+zw4seOB9QrGiAHtqQS8/11TnJ9J8m+HWjLUL1zkWElOk0ZsOLTwacGvSlK6ZD/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774255; c=relaxed/simple;
	bh=32uVZABTehXGrjaKvRTvfJ2qrB4t6hmSmr2gRS/e4eM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oz+nO0LkqCcBWw5ohDXh+IugfUvkhloNH9U+DsP9WPzZwMSHGBdSitA8VeX7sSZ9SzrE6kpSBtJ5O5DvWt48GSLzja5zk/TY7kpfHOIbexDKlBv4gDK6cxAJyXqNTtRvtywbhhna1TQFSG9wtzW2aR1DFC2JTrQUcH8vwDG1Fak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eJhWXgcR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D5DEA162B;
	Sat,  9 Aug 2025 23:16:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774191;
	bh=32uVZABTehXGrjaKvRTvfJ2qrB4t6hmSmr2gRS/e4eM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eJhWXgcR7SCg0E41rxejqZKbgz5wW2RZtwUj+hAkthRnD0Wz1m4bnlIzUesWTNGR/
	 RHj9QUTSZhMwnXbAZ07UlAkNa+F6BNa5Y81BjH8BIryxT3gi5eJVL+ctQppz3Y9hY+
	 AID6HkeYqvPRrZekpXeIVSaTZHOgRdUf70jLiXic=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 07/76] media: staging: most: Store v4l2_fh pointer in file->private_data
Date: Sun, 10 Aug 2025 00:15:44 +0300
Message-ID: <20250809211654.28887-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Most V4L2 drivers store the v4l2_fh pointer in file->private_data. The
most driver instead stores the pointer to the driver-specific structure
that embeds the v4l2_fh. Switch to storing the v4l2_fh pointer itself to
standardize behaviour across drivers. This also prepares for future
refactoring that depends on v4l2_fh being stored in private_data.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/staging/most/video/video.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 2b3cdb1ce140..bce7ffeac8fe 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -52,6 +52,11 @@ struct comp_fh {
 	u32 offs;
 };
 
+static inline struct comp_fh *to_comp_fh(struct file *filp)
+{
+	return container_of(filp->private_data, struct comp_fh, fh);
+}
+
 static LIST_HEAD(video_devices);
 static DEFINE_SPINLOCK(list_lock);
 
@@ -91,7 +96,7 @@ static int comp_vdev_open(struct file *filp)
 
 	fh->mdev = mdev;
 	v4l2_fh_init(&fh->fh, vdev);
-	filp->private_data = fh;
+	filp->private_data = &fh->fh;
 
 	v4l2_fh_add(&fh->fh);
 
@@ -115,7 +120,7 @@ static int comp_vdev_open(struct file *filp)
 
 static int comp_vdev_close(struct file *filp)
 {
-	struct comp_fh *fh = filp->private_data;
+	struct comp_fh *fh = to_comp_fh(filp);
 	struct most_video_dev *mdev = fh->mdev;
 	struct mbo *mbo, *tmp;
 
@@ -151,7 +156,7 @@ static int comp_vdev_close(struct file *filp)
 static ssize_t comp_vdev_read(struct file *filp, char __user *buf,
 			      size_t count, loff_t *pos)
 {
-	struct comp_fh *fh = filp->private_data;
+	struct comp_fh *fh = to_comp_fh(filp);
 	struct most_video_dev *mdev = fh->mdev;
 	int ret = 0;
 
@@ -200,7 +205,7 @@ static ssize_t comp_vdev_read(struct file *filp, char __user *buf,
 
 static __poll_t comp_vdev_poll(struct file *filp, poll_table *wait)
 {
-	struct comp_fh *fh = filp->private_data;
+	struct comp_fh *fh = to_comp_fh(filp);
 	struct most_video_dev *mdev = fh->mdev;
 	__poll_t mask = 0;
 
-- 
Regards,

Laurent Pinchart


