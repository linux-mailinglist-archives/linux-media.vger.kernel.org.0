Return-Path: <linux-media+bounces-39216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE63AB1F676
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDB57189B62B
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB932BEFF9;
	Sat,  9 Aug 2025 21:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GsiFJoTv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BBA27A47F;
	Sat,  9 Aug 2025 21:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774280; cv=none; b=gXVUavA0ngIRy58FtNC3DQVGz27BXYrwF+Hs9R2OPiOWedXlQjFO1vDnEnPrFGZDU1Zc2/DhjYeyJbHdBnvqlH6vHrIcGiBM6EC53rFsRpw9ZPG9OfX5KKfybS4ao4Uxm2IQ5pxR4mKSJEoFLswrwGn4A4qa0+PM+Opua6SAgpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774280; c=relaxed/simple;
	bh=8+zZuboUZF4aS+eDNQD/FJOQiR0mE9DzVdyFH3KT+Ns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UI6g+YuNDkhSU9G9Xi41YRyaAM0MYrFoBxd9dIwTkZkI/vrmmmhMN28uIvL0B8jmBUU/rP6NO8IH+Dp9vA5gw1zVY2Xo28vTHUPkZtJQwh4N21mqxAHFa3Ayrbz/lEPAVaMh4NX2ldQfudnnotQNY/zLHXiLD1OvW5imEPtpiFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GsiFJoTv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 83745111D;
	Sat,  9 Aug 2025 23:16:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774211;
	bh=8+zZuboUZF4aS+eDNQD/FJOQiR0mE9DzVdyFH3KT+Ns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GsiFJoTvYz4FOlIdY9O7FdPmezU/E5/WHHCgu6hLyvES8tOsSKmuRDggwaCIUdVDW
	 JIDoECUiz1Vc4Eo9Oo+nprdnW+gd1n5OR+TC6pNl0L3Km/U6jLUSc283YNdNDfT+Mi
	 1qG7f1MriB30j92A5CVppf7kKmy157T1qy7usBWo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 20/76] media: camss: Remove custom .release fop()
Date: Sun, 10 Aug 2025 00:15:57 +0300
Message-ID: <20250809211654.28887-21-laurent.pinchart@ideasonboard.com>
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

The 'file->private_data' pointer is reset in the vb2_fop_release()
call path. For this reason a custom handler for the .release
file operation is not needed and the driver can use
vb2_fop_release() directly.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/qcom/camss/camss-video.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index c5d02f9ebc6a..831486e14754 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -604,20 +604,11 @@ static const struct v4l2_ioctl_ops msm_vid_ioctl_ops = {
  * V4L2 file operations
  */
 
-static int video_release(struct file *file)
-{
-	vb2_fop_release(file);
-
-	file->private_data = NULL;
-
-	return 0;
-}
-
 static const struct v4l2_file_operations msm_vid_fops = {
 	.owner          = THIS_MODULE,
 	.unlocked_ioctl = video_ioctl2,
 	.open           = v4l2_fh_open,
-	.release        = video_release,
+	.release        = vb2_fop_release,
 	.poll           = vb2_fop_poll,
 	.mmap		= vb2_fop_mmap,
 	.read		= vb2_fop_read,
-- 
Regards,

Laurent Pinchart


