Return-Path: <linux-media+bounces-39225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4697FB1F685
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6959A17D7F7
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9B52C08C4;
	Sat,  9 Aug 2025 21:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ka+wZ7Ar"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3995327B4FA
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774292; cv=none; b=tlwuNlJEheL2zQud/qmOquclsFx4Qcr3HdF0C54zReDr9cvQw+/sests5auMzb046dXw0eb3WtrOHRkRLTj/Joz9gyNTZ0frPowVRUt4kfBKcW6s5uZdq+TJoh2Y8iVxkcO9XdCkeYpOOyF+XWWPuZ13zyQvvFgxm7WSgQ5xiqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774292; c=relaxed/simple;
	bh=b/s6aKT9/8bORLj9dutuxHP5fXWPBse8crgXh2bS11w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VSSoUXovMa8R96PuYvf72lXwuQO9ZxP3zyGW4BNiBaFmGq63nwyRxzr0cFXGqdFCH7yh7Bob0HQHTNrkpq90xbpPxoVhkCC8DEWn1uwEbXY7xtkzSRVGSTbMvZIt3FYOreVTfuKXaEdTtKqCNJp8b58jJe6BOSfFfCGxAwiStzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ka+wZ7Ar; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 708DD3B8B;
	Sat,  9 Aug 2025 23:17:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774235;
	bh=b/s6aKT9/8bORLj9dutuxHP5fXWPBse8crgXh2bS11w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ka+wZ7Arl4/ZIgvjzg8EfslUibjhpoesS0juDcmp4rTU6vqCL5F8VacQGpuW7QACI
	 cwI3/qeFtHdTgE6jLwJzSsb1jHuEfr6QWK7JHde9fX4CtbT3N+Fz/QosWfr5ZdEqCz
	 ztjbCL+EoDknKjJH30B+coe2MHEFXlk08r4BnRlI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Corentin Labbe <clabbe@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	mjpeg-users@lists.sourceforge.net
Subject: [PATCH v2 33/76] media: zoran: Remove zoran_fh structure
Date: Sun, 10 Aug 2025 00:16:10 +0300
Message-ID: <20250809211654.28887-34-laurent.pinchart@ideasonboard.com>
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

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

The zoran_fh structure is a wrapper around v4l2_fh. Its usage has been
mostly removed by commit 83f89a8bcbc3 ("media: zoran: convert to vb2"),
but the structure stayed by mistake. It is now used in a single
location, assigned from a void pointer and then recast to a void
pointer, without being every accessed. Drop it.

Fixes: 83f89a8bcbc3 ("media: zoran: convert to vb2")
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/pci/zoran/zoran.h        | 6 ------
 drivers/media/pci/zoran/zoran_driver.c | 3 +--
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/media/pci/zoran/zoran.h b/drivers/media/pci/zoran/zoran.h
index 1cd990468d3d..d05e222b3921 100644
--- a/drivers/media/pci/zoran/zoran.h
+++ b/drivers/media/pci/zoran/zoran.h
@@ -154,12 +154,6 @@ struct zoran_jpg_settings {
 
 struct zoran;
 
-/* zoran_fh contains per-open() settings */
-struct zoran_fh {
-	struct v4l2_fh fh;
-	struct zoran *zr;
-};
-
 struct card_info {
 	enum card_type type;
 	char name[32];
diff --git a/drivers/media/pci/zoran/zoran_driver.c b/drivers/media/pci/zoran/zoran_driver.c
index f42f596d3e62..ec7fc1da4cc0 100644
--- a/drivers/media/pci/zoran/zoran_driver.c
+++ b/drivers/media/pci/zoran/zoran_driver.c
@@ -511,12 +511,11 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *__fh,
 			       struct v4l2_format *fmt)
 {
 	struct zoran *zr = video_drvdata(file);
-	struct zoran_fh *fh = __fh;
 	int i;
 	int res = 0;
 
 	if (fmt->fmt.pix.pixelformat == V4L2_PIX_FMT_MJPEG)
-		return zoran_s_fmt_vid_out(file, fh, fmt);
+		return zoran_s_fmt_vid_out(file, __fh, fmt);
 
 	for (i = 0; i < NUM_FORMATS; i++)
 		if (fmt->fmt.pix.pixelformat == zoran_formats[i].fourcc)
-- 
Regards,

Laurent Pinchart


