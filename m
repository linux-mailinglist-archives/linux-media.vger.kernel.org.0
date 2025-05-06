Return-Path: <linux-media+bounces-31851-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9921DAAC48E
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 14:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE3DA1C262D9
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 12:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B936327FD74;
	Tue,  6 May 2025 12:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tmsO5YzL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8931F27FD5B
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 12:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746535832; cv=none; b=SWGOZ5Gi8PxLLZfjUT6z8Ae6xW5cDCqNp9jyROsm3fUIsCRsi7UA8ZHWUo8UhFSKpFb5ueZFUjlv6K7bGT/w62BiUs8uZrmwx/rRdyASMyzzJkQr8U9FVucMZOwbHOat26nNJlzMrcK4+xyjTcxE+jtMojL6F0E5qQO70wNYZLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746535832; c=relaxed/simple;
	bh=ilbCgY83lFO3SarbgqZg+AmS/eTRee7mR1kw5PhwX/I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cv3LwEAstljdmqW+nqrKgDi2UGUwZBLGZCz0MgSZl7WCUN37iIws6pI1ZPh/76tdgWVpWQ67uJmVOcHpi+5QZrmrFeiTagZYjzZEbFadzFRJNCA0J86T1paGjOYENau11SwX/fp05Boismuu0P57/93/jjEFBs8faSJCCM7Dwcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tmsO5YzL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D8C974C;
	Tue,  6 May 2025 14:50:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746535815;
	bh=ilbCgY83lFO3SarbgqZg+AmS/eTRee7mR1kw5PhwX/I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tmsO5YzLjmxJRiWIq969py8ysmtgmXBkaoWq2yEjFBSgEjR+MVm+fhje8I0L+SnRs
	 gMaaIHyiNa/FDKxmxXXaWY5bfRdGVi/d6T5YTZMD5H6Ag9+fvDRG/Sl6Y2vck+J9g9
	 rk4YtwVzTeaepIPojUQoyXqKIqSu2OUC+1bevCO0=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Subject: [PATCH v4 2/6] media: rzg2l-cru: Add vidioc_enum_framesizes()
Date: Tue,  6 May 2025 13:50:11 +0100
Message-Id: <20250506125015.567746-3-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250506125015.567746-1-dan.scally@ideasonboard.com>
References: <20250506125015.567746-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Scally <dan.scally+renesas@ideasonboard.com>

Add a callback to fill VIDIOC_ENUM_FRAMESIZES ioctl for the CRU

Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
---
Changes in v4:

	- New patch 

 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 067c6af14e95..15afb647d4d6 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -1031,7 +1031,33 @@ static int rzg2l_cru_enum_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
+static int rzg2l_cru_enum_framesizes(struct file *file, void *fh,
+				     struct v4l2_frmsizeenum *fsize)
+{
+	struct rzg2l_cru_dev *cru = video_drvdata(file);
+	const struct rzg2l_cru_info *info = cru->info;
+	const struct rzg2l_cru_ip_format *fmt;
+
+	if (fsize->index)
+		return -EINVAL;
+
+	fmt = rzg2l_cru_ip_format_to_fmt(fsize->pixel_format);
+	if (!fmt)
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMIVAL_TYPE_CONTINUOUS;
+	fsize->stepwise.min_width = RZG2L_CRU_MIN_INPUT_WIDTH;
+	fsize->stepwise.max_width = info->max_width;
+	fsize->stepwise.step_width = 1;
+	fsize->stepwise.min_height = RZG2L_CRU_MIN_INPUT_HEIGHT;
+	fsize->stepwise.max_height = info->max_height;
+	fsize->stepwise.step_height = 1;
+
+	return 0;
+}
+
 static const struct v4l2_ioctl_ops rzg2l_cru_ioctl_ops = {
+
 	.vidioc_querycap		= rzg2l_cru_querycap,
 	.vidioc_try_fmt_vid_cap		= rzg2l_cru_try_fmt_vid_cap,
 	.vidioc_g_fmt_vid_cap		= rzg2l_cru_g_fmt_vid_cap,
@@ -1047,6 +1073,8 @@ static const struct v4l2_ioctl_ops rzg2l_cru_ioctl_ops = {
 	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
 	.vidioc_streamon		= vb2_ioctl_streamon,
 	.vidioc_streamoff		= vb2_ioctl_streamoff,
+
+	.vidioc_enum_framesizes		= rzg2l_cru_enum_framesizes,
 };
 
 /* -----------------------------------------------------------------------------
-- 
2.34.1


