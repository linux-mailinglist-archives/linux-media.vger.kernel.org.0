Return-Path: <linux-media+bounces-33643-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B0DAC8C11
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 12:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66E06189DC33
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 10:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8042222C1;
	Fri, 30 May 2025 10:24:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9A61DA5F;
	Fri, 30 May 2025 10:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748600689; cv=none; b=H5XXm8jcvTSa8ra4r0rv4BRyDBtHmpB+2raOlfV4jwgyWcnQnGQUnYMsZ1aPUqcOESim9oOXmPKYroYHglkJWU4y03NZUpxzB4YpmpmL8NEG9zVTmNGNiZJzmZCQPE9KWjzP53X0G0ppq6OwAkWLjtul4z6SIJWs4iflzbDcHkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748600689; c=relaxed/simple;
	bh=Lupz2iTDHGUuhlaI2fVwSrIneOs8j+pnxEeTB6pHpRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ATAitM2jS3eJydIxlazYeffF4xeYon3lPjWR7kyMRzwzxAAoCRxdSYLhjyK4kbtQSTrs9Gd8ZvlbvhNgipOoe9R2W8A+jR8UJLC8DIcZLLUlrMMQNPdUeCeat9vbdcgJYJZFqyeeAKWCb+QvDaM08TBYKSaBVJETdwvgl9KcQso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.. (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 85A4486AE6;
	Fri, 30 May 2025 12:17:26 +0200 (CEST)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH] Enumerate only the available timings
Date: Fri, 30 May 2025 12:17:20 +0200
Message-ID: <20250530101720.1663-1-tumic@gpxsee.org>
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

Enumerate only the available (as given by the sysfs setup - our "EDID
replacement") timings, not all theoretically possible. This is the video
outputs part of the previous inputs patch that somehow got "lost in
translation".

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/media/pci/mgb4/mgb4_vout.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/mgb4/mgb4_vout.c b/drivers/media/pci/mgb4/mgb4_vout.c
index 14c5725bd4d8..c179c425e167 100644
--- a/drivers/media/pci/mgb4/mgb4_vout.c
+++ b/drivers/media/pci/mgb4/mgb4_vout.c
@@ -492,7 +492,14 @@ static int vidioc_s_dv_timings(struct file *file, void *fh,
 static int vidioc_enum_dv_timings(struct file *file, void *fh,
 				  struct v4l2_enum_dv_timings *timings)
 {
-	return v4l2_enum_dv_timings_cap(timings, &video_timings_cap, NULL, NULL);
+	struct mgb4_vout_dev *voutdev = video_drvdata(file);
+
+	if (timings->index != 0)
+		return -EINVAL;
+
+	get_timings(voutdev, &timings->timings);
+
+	return 0;
 }
 
 static int vidioc_dv_timings_cap(struct file *file, void *fh,

base-commit: 5e1ff2314797bf53636468a97719a8222deca9ae
-- 
2.48.1


