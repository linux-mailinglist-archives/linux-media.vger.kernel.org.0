Return-Path: <linux-media+bounces-29552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD563A7E5B5
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 18:10:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 658EE188AF97
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 16:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA45206F17;
	Mon,  7 Apr 2025 15:59:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738D52066E4;
	Mon,  7 Apr 2025 15:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041567; cv=none; b=aFQztY4rsPqBQGsxsT0vwNxFa+twSJJ0hYMVNAOrQkIUjP3BaC1tF5MhngCZrQ1OYMsEeqIdhuBRN/lSzXsTSYsaxFw0pKMnuWNEfoYktVLWdQdyFx3m4eeVaixiRBStFOKcxbXuv4apw4eecsAUIqLrR7sEdDFSonEOh9TPZRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041567; c=relaxed/simple;
	bh=JwqOQkNelC69EItq+At4pUrJoaPuZVJh2g7lZpkUbDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OlA/O8CoQYFo8Tz+pSrtaoN/t5QqzMe28BHBHPkCwuPw122G3K9cgzNp4ud8JwE/sZXUbEAXlGuElWeulBNl/9oOR/ZRUJLpxb+GJCN7CuD6d/DIo2rN215PHRScEdbqtKMJtsOZ29wzOT7WQQPOrGMBhMPfy0CyqWOC8+OYSL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.. (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id E80A86AF4C;
	Mon, 07 Apr 2025 17:50:40 +0200 (CEST)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH] media: mgb4: Fix resolution change events triggering
Date: Mon,  7 Apr 2025 17:50:35 +0200
Message-ID: <20250407155035.3804-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Always generate the resolution change event when the HW reports it and only
discard the streaming termination in case the new resolution is the same as
the old one. The old logic prevented events on
"no signal" -> "valid resolution" transitions as VIDIOC_QUERY_DV_TIMINGS
never updates the timings when there is no signal present.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/media/pci/mgb4/mgb4_vin.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
index 434eaf0440e2..6e806e075837 100644
--- a/drivers/media/pci/mgb4/mgb4_vin.c
+++ b/drivers/media/pci/mgb4/mgb4_vin.c
@@ -749,14 +749,14 @@ static void signal_change(struct work_struct *work)
 	u32 width = resolution >> 16;
 	u32 height = resolution & 0xFFFF;
 
-	if (timings->width != width || timings->height != height) {
-		static const struct v4l2_event ev = {
-			.type = V4L2_EVENT_SOURCE_CHANGE,
-			.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
-		};
+	static const struct v4l2_event ev = {
+		.type = V4L2_EVENT_SOURCE_CHANGE,
+		.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
+	};
 
-		v4l2_event_queue(&vindev->vdev, &ev);
+	v4l2_event_queue(&vindev->vdev, &ev);
 
+	if (timings->width != width || timings->height != height) {
 		if (vb2_is_streaming(&vindev->queue))
 			vb2_queue_error(&vindev->queue);
 	}

base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
-- 
2.48.1


