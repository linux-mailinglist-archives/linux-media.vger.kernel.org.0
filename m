Return-Path: <linux-media+bounces-39280-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5C1B1F78E
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1620C3A10DB
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44856C120;
	Sun, 10 Aug 2025 01:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ik3H6ZwN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF725B21A
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789494; cv=none; b=Qc02a6NqKqEoz4Dl+kZJ3qeTAOL8mpVRrpNTHGKapdis4roYYpMpMbi23OONiKHFXknUzPQJcUgGJqHicn/Qxs0c6qPdp7NKPAHhWlqwS5hjf5aZQvqtZAU36+q2H1uswPvPh2Z1M3rMRU1XDaVtep1M3c2m/ooOQ34PATAu0LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789494; c=relaxed/simple;
	bh=xBT7ujv6VSEDaLZl6ARKJQYa2JlE2lH1XZ6TydjARX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DSasx2CpHF21AhGWGAaNWJQ8zeWiskXRV23EbZK0vURGs6dpkEPiWAylGEGD6Nxo+VRg/beY3byJ5pCPtFq+VzMJDKyeQGtxuzO7Nsq8xCw9BmSvFDQK5JEYfaSDFKZvdhL1ADwNTgEba1qKZSn5VUQ54hOk7iJB+gPgIBGfvZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ik3H6ZwN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 60EA9104D;
	Sun, 10 Aug 2025 03:30:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789439;
	bh=xBT7ujv6VSEDaLZl6ARKJQYa2JlE2lH1XZ6TydjARX4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ik3H6ZwNcE7KczjS+tVP48tB8hDlqCGGp8RLwRg8Km+R124OqQVu9ds/mfdHXdOj5
	 xBnTpwYbRBQXgw0mOzzxR3/23Fklj1sX6Zyc1QtR8mNTyFx7yuUfk+u7rTYZ6qJ8id
	 Mz4jFCJ3NYAiu0JgFpetx7LSd7H+TlzOuRQYz+Cg=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 07/76] media: staging: most: Store v4l2_fh pointer in file->private_data
Date: Sun, 10 Aug 2025 04:29:49 +0300
Message-ID: <20250810013100.29776-8-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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


