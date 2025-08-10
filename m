Return-Path: <linux-media+bounces-39302-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E988B1F7BF
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7FF57A7CDD
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646461E7C12;
	Sun, 10 Aug 2025 01:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qQs1aSyg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8448113E02A
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789533; cv=none; b=TCkzMRnqY5WZ7w1rttQjf/5A/fP7Uxc95StBfglQRyLNy9eDqC3HjkwS9Xecox/KmG1YZErqeVfg1nLwCVx1FP1lkqB1MM84Ho2fH+2FuLxoeNSekMsqBe+0wOJPbSqjNajMKpZALHYrZt1vtzV1F22+2NFn84tgBV24vLKhqww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789533; c=relaxed/simple;
	bh=+YrZbRpCWDN6IwYCyze0/SvdvOAnNp5ivDaPwWg8hzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kwSbjnmIn+YAyx4/JhewuwX6McsX+JBVs6waxm6EsHlDAi5XCLN0UP0rj/WeKj+tECASuph35uilme9Q7DGoRfC2xw0bA7k8HF3eLlI0U+waImf1SoVNzvE9mUEJQP7RQ50jDlCS6FIjFhIlQJ+/PxenNa4+Odwb3VWlu4RQTkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qQs1aSyg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 39C9819C8;
	Sun, 10 Aug 2025 03:31:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789478;
	bh=+YrZbRpCWDN6IwYCyze0/SvdvOAnNp5ivDaPwWg8hzQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qQs1aSygtEJDEBUbLynz7qKpNyW65Cgly06f5AGcQFr83YemsRUu7XuhfSTFLYUr2
	 AFGwQvHLorHY93Nqyx1Hkd9TO4/PubH7RT35j/huFUAzVrBvHi0zhh+zb0jWwbpTcW
	 WRdYU8bPdYkPbWcCYButoTEMUYIkBOceeQhFJI/g=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 29/76] media: staging: ipu7: isys: Don't set V4L2_FL_USES_V4L2_FH manually
Date: Sun, 10 Aug 2025 04:30:11 +0300
Message-ID: <20250810013100.29776-30-laurent.pinchart+renesas@ideasonboard.com>
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

The V4L2_FL_USES_V4L2_FH flag is set by v4l2_fh_init(). It is not meant
to be set manually by drivers. Drop it from the ipu7-isys driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/ipu7/ipu7-isys-video.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/ipu7/ipu7-isys-video.c b/drivers/staging/media/ipu7/ipu7-isys-video.c
index 8756da3a8fb0..6b31c766bc58 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-video.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-video.c
@@ -1082,7 +1082,6 @@ int ipu7_isys_video_init(struct ipu7_isys_video *av)
 	__ipu_isys_vidioc_try_fmt_vid_cap(av, &format);
 	av->pix_fmt = format.fmt.pix;
 
-	set_bit(V4L2_FL_USES_V4L2_FH, &av->vdev.flags);
 	video_set_drvdata(&av->vdev, av);
 
 	ret = video_register_device(&av->vdev, VFL_TYPE_VIDEO, -1);
-- 
Regards,

Laurent Pinchart


