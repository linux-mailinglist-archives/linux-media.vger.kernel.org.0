Return-Path: <linux-media+bounces-35660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A25AE472C
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 16:43:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 672117A28AC
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 14:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1099267B74;
	Mon, 23 Jun 2025 14:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mLzaeEFS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F72D267733
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 14:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750689815; cv=none; b=da7bwqe8L+UeutuYgvFi/e0TbJ6mNW4skH8Mof3LVovj9lfusuTeyzL+X5hfUhmmR0P8Imjxj1bW+Diqw2MGg/82EfF4FPf5+KYxJM0nm1YILCv7LJRhXl0t54FLIuWwDSlZ8p0NZFL4UQ/K4dg3eVK4aN8528wpVVZd80D5Cwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750689815; c=relaxed/simple;
	bh=lDKvV0aAUcq6HORypFxErWR6/9Ud1t+U17qZlCQsWg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TA3F+v1WoXcj3jgXBKvc5Jq3jwvGOMgQjWauLVlcEr3PbpIpYUk1nFn+zKn6wIlTxlxj6C/CPTpcjx/h2bbyjjajUPDZ9YEV5CJ1v/1B+X+CIOplyvQoYkoUZeR48XufMXCaR4X6OE6JoCvbrobTPoDm8OIG4oYoaFUe2v6+SmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mLzaeEFS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4AB9015BF;
	Mon, 23 Jun 2025 16:43:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750689793;
	bh=lDKvV0aAUcq6HORypFxErWR6/9Ud1t+U17qZlCQsWg0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mLzaeEFSAQOFt2SFAoyo6nQu6lioo96SdFnOhekKANYvkq5ABoIAm9nwDwifQv9Aa
	 xogfIAo99cKuHMAvMsq2+My5VT+ttVQqSnOA8hBrKz6mWji6w5lBiSQ7FvEWuBb0q0
	 ehe6BxtZUYkneFuiElNQVajKTQE3uCMHXdJesVY0=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Mon, 23 Jun 2025 15:43:19 +0100
Subject: [PATCH v5 2/6] media: rzg2l-cru: Add vidioc_enum_framesizes()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-rzg2l-cru-v5-2-1663a8c6719a@ideasonboard.com>
References: <20250623-rzg2l-cru-v5-0-1663a8c6719a@ideasonboard.com>
In-Reply-To: <20250623-rzg2l-cru-v5-0-1663a8c6719a@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, jacopo.mondi@ideasonboard.com, 
 dan.scally@ideasonboard.com, Hans Verkuil <hverkuil@xs4all.nl>, 
 Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2177;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=aweHcGzFVGOkFJDU0OaBFxdmZy+q5Zf5r8+9BuN4Dos=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWWgOypkReaR4y3tJXS9c3wkQ0h6qc7FgjFOPB
 oX64MkHZeOJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFloDgAKCRDISVd6bEV1
 MqPvEACSmtBaV7EucjcLmfhcKH9F719NedtjxbE2pTJcGkUpD4FQbXPLDNe4vrq2P5xKPBSD9UN
 2CrBDKY251OQOuPFcPZu9xY/U/Q41sQYe4MYUlqU590kx+/FXSuSjWv2gYtMFfIbM8ApdpP22b8
 CZyn5NSysQnjfS6toJyfQLd2duS3MFeqzo/QOzCLHbwGMklw1ukJUMFWo2IiRy9jJDPjKBzbF+h
 +LN0BX/EpGl7TCijmxrbhBKnOLyXeA4jUXOZRNE2Tb7h/GmcE9Jjin0rNeESuXMgsGyrUZ8sZML
 KijYu2MNd4z6EwqpW7g5MO49Z0CBpF/eYw8pu+qt6DonLnmzLB0cICX8wlwwXDtdzgc4tZDZhr3
 EnfY/J7IorKDzGWXoHjujo6Ge4sBdIDASvHzIkmmsUG0DUlx0b0cWvxMYVelZrbxG8KczKmymLC
 3oQKgUG+mcnua5kq9Dsdm0sQOpsQXFmuo36XfzdCIXsZ6ITfYzBM8pEVOV7lnXH2nq0ymBxFrzq
 8zYCBQQl1AkY4O51NP6eUGo6LGqwg5DDr3kTrE+yQIIGct+6jOZ5Hu0mN7BXduozd+r5tqX0IPL
 REvgXm06jOJ87L63OpjfF2c513jJf4HYIKSotV5CCQTXf7Pie7COQUOg0LudEAkSAen+UzzNltb
 SXPZ2Wex2lmqPXQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

From: Daniel Scally <dan.scally+renesas@ideasonboard.com>

Add a callback to implement the VIDIOC_ENUM_FRAMESIZES ioctl for the
CRU driver.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
---
Changes in v5:

	- None

Changes in v4:

	- New patch
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 067c6af14e956d42bb82328cb33c91df6b7f1d54..a92c6fc4dfaff7931700e967460802725c3dcd56 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -1031,6 +1031,31 @@ static int rzg2l_cru_enum_fmt_vid_cap(struct file *file, void *priv,
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
 	.vidioc_querycap		= rzg2l_cru_querycap,
 	.vidioc_try_fmt_vid_cap		= rzg2l_cru_try_fmt_vid_cap,
@@ -1047,6 +1072,7 @@ static const struct v4l2_ioctl_ops rzg2l_cru_ioctl_ops = {
 	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
 	.vidioc_streamon		= vb2_ioctl_streamon,
 	.vidioc_streamoff		= vb2_ioctl_streamoff,
+	.vidioc_enum_framesizes		= rzg2l_cru_enum_framesizes,
 };
 
 /* -----------------------------------------------------------------------------

-- 
2.34.1


