Return-Path: <linux-media+bounces-39293-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9D3B1F7A5
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3D3D3BE271
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C40BB1C1AB4;
	Sun, 10 Aug 2025 01:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bBL+Ppmx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31AB335BA;
	Sun, 10 Aug 2025 01:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789516; cv=none; b=iBJK9S+cXgv0awQsXajVdFr/XQVzmEmpj4QvF8yxk650iDxJGWpPbupqKsd95ZcVbl6LPWD6FcKv9rZDBTAA+Jw52xBS9ygGJRllWtQGtreMZmfRAzphECEm23vt3FJtFPqu2mK0EyqEKLA1H2r8cooZU7usZ2+FlhLac1Ax83Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789516; c=relaxed/simple;
	bh=8+zZuboUZF4aS+eDNQD/FJOQiR0mE9DzVdyFH3KT+Ns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lj/+qypLCiar06aPIHBSneINdNYgCONMoi6xHmkEZR4fS/Ezzw/bsHxuB3GbB+z4q5g7H09/GhfJdLu/iKFHl2GBHvnJ1ZZrw1nld5A4H5ZIP9QCvWbOrVYo5Els0B6c71EB50gurr1FG3GW3JTc1+DqWMQv2X8PeK5M2uulAas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bBL+Ppmx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AC8DA8CB;
	Sun, 10 Aug 2025 03:31:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789462;
	bh=8+zZuboUZF4aS+eDNQD/FJOQiR0mE9DzVdyFH3KT+Ns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bBL+PpmxLWkPaQ4X0vAi5tGCp4Eu3EFRWqX64bLK5JD0eE4MRitMphBcag2k9Hfzd
	 7ddhNSxGIkLcCk1+zttMVMtEv95vnlAFafLG4lJ1TrgSBGi8xosLJ1PDGqt2ikVfHL
	 c7U6xKoZD/mHpcuzWRMwNJCN+1XP+msgkP3TYTws=
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
Subject: [PATCH v3 20/76] media: camss: Remove custom .release fop()
Date: Sun, 10 Aug 2025 04:30:02 +0300
Message-ID: <20250810013100.29776-21-laurent.pinchart+renesas@ideasonboard.com>
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


