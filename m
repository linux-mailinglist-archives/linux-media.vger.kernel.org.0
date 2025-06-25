Return-Path: <linux-media+bounces-35855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03763AE7CD3
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 11:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B8463A975A
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 09:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24F129E0E9;
	Wed, 25 Jun 2025 09:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gG8d41SA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B481029E0E1
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 09:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843252; cv=none; b=COIUofs6Qb4GEwu23z3I0gOE0iB6vhv+Z4CmrVMD5Fv1pSkarKG7RW9MKliO40GdYe7lGT1W99p+3jcmegSgq4M8eKoslfXVmIvchvmI/LYBMoDhu4uFXMmawfLLLzUBZyBPp9inyoJWEiNgO4WTtx2ufZG1AC6WwL76ZM65ck4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843252; c=relaxed/simple;
	bh=lDKvV0aAUcq6HORypFxErWR6/9Ud1t+U17qZlCQsWg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e+LbsdRmRMX9DwyJepVrfJ69Ok80XE9wfaPRl5KdGmOhRtiwMJ8/TXmzriHeLs5GJeHYw4wngXd3+4vloQXboBAz/Sz7JwQglLdGMqeG9G8lVAH0zHdEXL/3tCFvCfj/s/nLDgPe7PqRT1qYgbplidNUJ8oefpjD4CXB+fHs3Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gG8d41SA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D40BD77;
	Wed, 25 Jun 2025 11:20:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750843221;
	bh=lDKvV0aAUcq6HORypFxErWR6/9Ud1t+U17qZlCQsWg0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gG8d41SAk1HWuAbBEQf2c2hMfxA9LJI3/JcLPCC8PnzCnZNiG58Trh/UOa+mL58C8
	 sU+JDz7RxClZFfAfb55gNGruQKg7WAj8Jwt+MFGH9OK3uq6ladFd2bSj81T4LKyt/b
	 iAFCgNFkEF7zqpGpy/00sjodciMRPxL2riyHOwlY=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Wed, 25 Jun 2025 10:20:28 +0100
Subject: [PATCH v6 2/6] media: rzg2l-cru: Add vidioc_enum_framesizes()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-rzg2l-cru-v6-2-a9099ed26c14@ideasonboard.com>
References: <20250625-rzg2l-cru-v6-0-a9099ed26c14@ideasonboard.com>
In-Reply-To: <20250625-rzg2l-cru-v6-0-a9099ed26c14@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoW79koBxUIhBa48bPAWwmV+UPx2mYrZAbirTD0
 Z9qL+wIkECJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFu/ZAAKCRDISVd6bEV1
 Mly1EACQv8IxyqXPPfXYzJX7PutEgm96naqY39xBTrmnx6GOSTxfDC26H/xbrMmHi+Ihyr27B5y
 vUrym3wjanlqUkmkLc1P9S0jVjYjuR860bJoZ5AdksR7mt91e/j6GMHB0Xilg2o6KORNe4X9ZCO
 4JSWXLmtMMTsCf0/iUQ35ROA/HCGJjuzq0NPqPz0Zyg1KCJAJqjmh4CeUGiUQzaOHAz6lfmeNbi
 z4tiJoq1HF3zp7d5x1Pm82O/zbNsFFY/VC5RDF/9VGYQjxzewGAvrlfeuMQlgYipiDsX9XG5LzR
 cbaz65BCaHV5jkMtBnqZrS1XgESIQtDTJNq+6MdOwqLrr0iybat3BHUAvIt56fthaqc8Y5PxTB9
 Tuwiv5aox6i2h6JjsKvyhUxTF3J2zWmhaQgcYFlzo4r971EcmWrtxizjYkObVVCpk5XcybV+3VJ
 bO0kCG1UHtjaJf11H7LRu2ADKqi2hSfJZdoVQsnpnJ+K5ViNDKqxEWANmGdIl4NLzD7hPq1oTJb
 XL8ww7FYtSRCHUjhmUzUdaGHvYSHpbHhsYh5unY4r2Ebr4f1tg+8nSVx9q4mnv0NDwOmmiYzP7t
 0OIXSoYdDky3LxgAf8dVL/ltpDBmn26bm36oELIwC+5nyC54zuYIZxGc5iu5HU42yG53RL2q3kr
 rGWnE6XusEpWdSg==
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


