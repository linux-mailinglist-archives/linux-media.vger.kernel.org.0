Return-Path: <linux-media+bounces-29619-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D8CA80C48
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 15:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAA1D503624
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 13:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC06F19CC05;
	Tue,  8 Apr 2025 13:22:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC461E4B2;
	Tue,  8 Apr 2025 13:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744118528; cv=none; b=JKs+0T7AMmrDSAWa1DR/qaqoZgnYNL24QiBJd9nfzdXVyAkzjK1gtGuS/LuTnh4Bj5i/iGvdEzahcN0kbuTsggcHsr6OFP3+h2goV4ObRiuZt9Fg2Yo9A2puE9JahvFUNDYrydJMruqY8Uhubf3lo2Jr0KIgjEWJeX0mcUce7WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744118528; c=relaxed/simple;
	bh=5T6qTj0z4s40YRVnm8hfl2+R/wT516z8Gd7elDtYSmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gB0bUAeXh7gCc4APv2T9bmOU+pJqNZqBF6N90otoUEKfWW1i92skfsF5q1jQeK0V9/lu9pr9+7g23QRFwAHaVA7RV+McUqaKdlVedOn1PkJcNC7b4xdSXkbjbJfVDH2BL4Lhr7rSw8hF4EcvzS+hRJ3rjvq89+sYDbqm/OmjuiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.. (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id E27CD229D8;
	Tue, 08 Apr 2025 15:22:02 +0200 (CEST)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH v2 1/1] media: mgb4: Enumerate only the available timings
Date: Tue,  8 Apr 2025 15:21:55 +0200
Message-ID: <20250408132155.2175-2-tumic@gpxsee.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250408132155.2175-1-tumic@gpxsee.org>
References: <20250408132155.2175-1-tumic@gpxsee.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Enumerate only the available (as given by the input source) timings, not
all theoretically possible.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/media/pci/mgb4/mgb4_vin.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
index 434eaf0440e2..288546a113b6 100644
--- a/drivers/media/pci/mgb4/mgb4_vin.c
+++ b/drivers/media/pci/mgb4/mgb4_vin.c
@@ -641,7 +641,14 @@ static int vidioc_query_dv_timings(struct file *file, void *fh,
 static int vidioc_enum_dv_timings(struct file *file, void *fh,
 				  struct v4l2_enum_dv_timings *timings)
 {
-	return v4l2_enum_dv_timings_cap(timings, &video_timings_cap, NULL, NULL);
+	struct mgb4_vin_dev *vindev = video_drvdata(file);
+
+	if (timings->index != 0)
+		return -EINVAL;
+	if (get_timings(vindev, &timings->timings) < 0)
+		return -ENODATA;
+
+	return 0;
 }
 
 static int vidioc_dv_timings_cap(struct file *file, void *fh,
-- 
2.48.1


