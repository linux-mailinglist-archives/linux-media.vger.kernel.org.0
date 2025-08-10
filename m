Return-Path: <linux-media+bounces-39292-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D37B1F7A4
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 764E03BE37C
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B8C1AF0AF;
	Sun, 10 Aug 2025 01:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ux5Y9d43"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57031A314F;
	Sun, 10 Aug 2025 01:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789515; cv=none; b=lZNfgl5dJOtJVN324L1ASTtTMQnbMv2q7+NBltpo6NL6nMCB4gToEdFhRBWHYNZR1eYhppZFS7aNL7q9YKtuyzUS6gQB2QSCXKQCEu3UmqkLhNUpxyIBMZxX+NAN04V/Wq35SVAEWbLt5yZ4NFa76s1cKcagMbapxazkBZclz5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789515; c=relaxed/simple;
	bh=l8/7wMQIRuFK/F5YO9Sb18ohip5hNDAGhrpGYIBetv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bv5bT02QU0JFkeqNFOUsMqIPkPzBB60uEdBD34ZxEzHSb8kJ2SMNo+0ERofmSA9LYdcQEsyDELILOZVJ7mE5bHVP3zaOS21MSVGf8kn5XipmQNJAlKfytPZclnBGXTrVppDxa/tQgN0iNWBVev+Vuw954JkayVSLt12vdT3Nh9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ux5Y9d43; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 22AF51DAB;
	Sun, 10 Aug 2025 03:31:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789461;
	bh=l8/7wMQIRuFK/F5YO9Sb18ohip5hNDAGhrpGYIBetv4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ux5Y9d433L31KsbA6gOFOY9YaSa/n4EEb4unEznXxW6usghBca7itJ+yCZi9nDesB
	 OOMd0jV8NhTUja/AsxXfxmtMBmParNOrTO0OjwUm9uhDUdqgX1qnCvAQ0x5Bd57/b/
	 F4lVFit6QxS6ShLlRCjk9bY3INLB3n48hsZ/BqG8=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 19/76] media: camss: Replace .open() file operation with v4l2_fh_open()
Date: Sun, 10 Aug 2025 04:30:01 +0300
Message-ID: <20250810013100.29776-20-laurent.pinchart+renesas@ideasonboard.com>
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


