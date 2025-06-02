Return-Path: <linux-media+bounces-33879-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A326ACAB61
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 11:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28E4C3BD6F7
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 09:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577B11E0DD9;
	Mon,  2 Jun 2025 09:28:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8D91DF757;
	Mon,  2 Jun 2025 09:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748856497; cv=none; b=QAzriUo96KAh4U1H3SW6z+8rYEk1+qnRopTD0WSacyKaKf90G62RMe6oKljjKaAffN+XbRPd67QsAyWNSqqOVJ6dP3gbvwnwUAXUBIuvo7Q6oW4odohnLvMA6AMTNOdcQn1bSGjMyuyQVfF2CG/J2nZn15mIMDY3anU74HbsBm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748856497; c=relaxed/simple;
	bh=Lupz2iTDHGUuhlaI2fVwSrIneOs8j+pnxEeTB6pHpRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DvldS6JfoBE0pBMJqRQc7aJGRC9PDJ4qzfOqfX8nUrYxeaLdK9Cq8lIJQQOD8nFuQV+C14kCW/cY+nqhsLv97DxKB4UEXbBV8lVEP38agvcGOqvfFKJhlGkKFdtc/2N6qCri6hYiq1xnsQ3stwh96EROpNXqyny8OtNaJKKaZBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.. (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id B936879B9E;
	Mon, 02 Jun 2025 11:28:04 +0200 (CEST)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH v2] media: mgb4: Enumerate only the available timings
Date: Mon,  2 Jun 2025 11:27:51 +0200
Message-ID: <20250602092751.2529-1-tumic@gpxsee.org>
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


