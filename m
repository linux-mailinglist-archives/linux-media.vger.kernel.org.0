Return-Path: <linux-media+bounces-41091-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BEFB37041
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 18:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39DE6188C838
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 16:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D1D530AD14;
	Tue, 26 Aug 2025 16:29:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E087D17C211;
	Tue, 26 Aug 2025 16:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756225749; cv=none; b=Ui30eFShS3xXmI12+VMURmxx6BVUi0usrTzCl/gkQXDcGYk/OzmSn0zNPByA902fG1mEk8aL+KpBSdypqRxc/gdnFx3zRVgdXyRwQqo4lrUCrZbodN2fne8Zkz2hau/znpkQa0TuwzuPemRqYNMLTf6xd3KmNrFY/JIR7xMrO7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756225749; c=relaxed/simple;
	bh=AAcyihQv5XLEctuNaZICT2NIJkI17KX4f1zliLxnpik=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MUs6+2meCwdZ9p4UqHk2eGGHNoQ22QZA73oafDaZQv5KnWC/gvlwEyns0wAOl6g7rruYk4vdXJx8F8YOm3BV0JU65UXwYD7wPDiviclWWDFiHJZK3KEytnRNN/Flxd6smn9+k9gzX2trciwQHA27QeCkg9r976CusRQ7Y5LEbNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from localhost (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id E39E453EB3;
	Tue, 26 Aug 2025 18:28:52 +0200 (CEST)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH v2] media: pci: mgb4: Fix timings comparison in VIDIOC_S_DV_TIMINGS
Date: Tue, 26 Aug 2025 18:28:29 +0200
Message-ID: <20250826162829.4434-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.51.0
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
 drivers/media/pci/mgb4/mgb4_vin.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
index 989e93f67f75..42c327bc50e1 100644
--- a/drivers/media/pci/mgb4/mgb4_vin.c
+++ b/drivers/media/pci/mgb4/mgb4_vin.c
@@ -610,8 +610,7 @@ static int vidioc_s_dv_timings(struct file *file, void *fh,
 	    timings->bt.height < video_timings_cap.bt.min_height ||
 	    timings->bt.height > video_timings_cap.bt.max_height)
 		return -EINVAL;
-	if (timings->bt.width == vindev->timings.bt.width &&
-	    timings->bt.height == vindev->timings.bt.height)
+	if (v4l2_match_dv_timings(timings, &vindev->timings, 0, false))
 		return 0;
 	if (vb2_is_busy(&vindev->queue))
 		return -EBUSY;

base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
-- 
2.51.0


