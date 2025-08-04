Return-Path: <linux-media+bounces-38823-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3AAB19EB8
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 11:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE6E217878E
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 09:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A840524467E;
	Mon,  4 Aug 2025 09:26:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E23F1EEF9;
	Mon,  4 Aug 2025 09:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754299597; cv=none; b=TbJC+3kHqaW8DJhMX5PtK5MIbQVcP/pKg6KF3Ahz8fYPAWnzN7pJnA+nWITPBPRuU55VROGznB4a/YXPULYXnrMHUqlYkcOxjGORYc98avjE7KvbI8Cv6oXlTnGf8aTZaGDo/yZII3J5OCl4pbdeaUmBm2/0OTUMFSDsUx4fdZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754299597; c=relaxed/simple;
	bh=wZSrlD82d5i/1oBor0tGqA9r3UTj89Q0/mLhlIYrTYw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K5FVE8HAQt4bpAopMnNBDyK3ROQz6+zc2y5Pbh1z7X4khdilPfSxW5E1lzCS8EzTqSEaAuBXouscZ9tLsaHKNnc7GUPAliuI/qSEHyHxek01Bopod3Mi0dWaJM3ZkuQrPU9AFaTdIDdbBX17EXTburUj2nTMPSir5iUpa+i4JLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.digiteq.red (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 92CD36058B;
	Mon, 04 Aug 2025 11:20:39 +0200 (CEST)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH] media: pci: mgb4: Fix timings comparison in VIDIOC_S_DV_TIMINGS
Date: Mon,  4 Aug 2025 11:20:32 +0200
Message-ID: <20250804092032.1639-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Compare the whole v4l2_bt_timings struct, not just the width/height when
setting new timings. Timings with the same resolution and different
pixelclock can now be properly set.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/media/pci/mgb4/mgb4_vin.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
index 989e93f67f75..15182549d108 100644
--- a/drivers/media/pci/mgb4/mgb4_vin.c
+++ b/drivers/media/pci/mgb4/mgb4_vin.c
@@ -610,8 +610,8 @@ static int vidioc_s_dv_timings(struct file *file, void *fh,
 	    timings->bt.height < video_timings_cap.bt.min_height ||
 	    timings->bt.height > video_timings_cap.bt.max_height)
 		return -EINVAL;
-	if (timings->bt.width == vindev->timings.bt.width &&
-	    timings->bt.height == vindev->timings.bt.height)
+	if (!memcmp(&timings->bt, &vindev->timings.bt,
+		    sizeof(struct v4l2_bt_timings)))
 		return 0;
 	if (vb2_is_busy(&vindev->queue))
 		return -EBUSY;

base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
-- 
2.50.1


