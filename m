Return-Path: <linux-media+bounces-39214-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E33B1F673
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75F1917DC53
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3CC254AE7;
	Sat,  9 Aug 2025 21:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kGtvF6KX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831E82798EB;
	Sat,  9 Aug 2025 21:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774277; cv=none; b=BDw3gm8syC4/UfZwMxbLf0PWJ4K97v5aj32lQCW8mHfCSluOQMN13IE0TNJdfkDHGMMuDzQPfynVozL5+bDCTiGGQUBCn4TVb4iH3hP8txh4niRu/x+PA6lvFLJxVRajIttr0H7MjhtF8aOtAZpBS/MuANJ8bHI9dxe6/mZmEJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774277; c=relaxed/simple;
	bh=EoKiG4bJJgn0LvmoTdjdfJUVTtcA1oULTiIMA6ro8UU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RZiPBSVIhZYYe96qdcdpP6mla5xBfeAcN8z/laU25vqO2pP2O8YRscFZHRvi5pnhRXDVZgdp23xCBapgrbg1XAIpaDBNkWrBOw4Y6crHGH4Up9kGYtuyP/IuFEchqymlfX5y1A8iIrbNqPTfMGUDdIf/LDz6ngQDCZeXs+Ix/LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kGtvF6KX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 06524305E;
	Sat,  9 Aug 2025 23:16:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774210;
	bh=EoKiG4bJJgn0LvmoTdjdfJUVTtcA1oULTiIMA6ro8UU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kGtvF6KXVwRHdpuWpdwKw5s+O644pKU+wQqqkEeRlOumceTl7Ap9pl0VPtKgZPsJO
	 O9k5e6YPw06SRTd1Ffi0T/C7AXvyGHw++6l6DZQUCH15ASMKhL3VIKZ6uc1M/ORKAx
	 39gon0xR3COsNmsSxSZ2cy2/s5s2T6m/GD6phcmc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 19/76] media: camss: Replace .open() file operation with v4l2_fh_open()
Date: Sun, 10 Aug 2025 00:15:56 +0300
Message-ID: <20250809211654.28887-20-laurent.pinchart@ideasonboard.com>
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

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The custom video_open() function in the camss driver open-codes the
v4l2_fh_open() helper, with an additional mutex that protects the whole
function. Given that the function does not modify any data guarded by
the lock, there's no need for using the mutex and the function can be
replaced by v4l2_fh_open().

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/qcom/camss/camss-video.c   | 32 +------------------
 1 file changed, 1 insertion(+), 31 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 8d05802d1735..c5d02f9ebc6a 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -604,36 +604,6 @@ static const struct v4l2_ioctl_ops msm_vid_ioctl_ops = {
  * V4L2 file operations
  */
 
-static int video_open(struct file *file)
-{
-	struct video_device *vdev = video_devdata(file);
-	struct camss_video *video = video_drvdata(file);
-	struct v4l2_fh *vfh;
-	int ret;
-
-	mutex_lock(&video->lock);
-
-	vfh = kzalloc(sizeof(*vfh), GFP_KERNEL);
-	if (vfh == NULL) {
-		ret = -ENOMEM;
-		goto error_alloc;
-	}
-
-	v4l2_fh_init(vfh, vdev);
-	v4l2_fh_add(vfh);
-
-	file->private_data = vfh;
-
-	mutex_unlock(&video->lock);
-
-	return 0;
-
-error_alloc:
-	mutex_unlock(&video->lock);
-
-	return ret;
-}
-
 static int video_release(struct file *file)
 {
 	vb2_fop_release(file);
@@ -646,7 +616,7 @@ static int video_release(struct file *file)
 static const struct v4l2_file_operations msm_vid_fops = {
 	.owner          = THIS_MODULE,
 	.unlocked_ioctl = video_ioctl2,
-	.open           = video_open,
+	.open           = v4l2_fh_open,
 	.release        = video_release,
 	.poll           = vb2_fop_poll,
 	.mmap		= vb2_fop_mmap,
-- 
Regards,

Laurent Pinchart


