Return-Path: <linux-media+bounces-45575-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9A9C0AFE6
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 19:13:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 680A73A7EEE
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 18:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D5B2E8DFE;
	Sun, 26 Oct 2025 18:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nhFqgK9e"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01DA26290
	for <linux-media@vger.kernel.org>; Sun, 26 Oct 2025 18:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761502374; cv=none; b=CaRaISXhUHZta/EaI9qM5CX6Ud4yXqMtWY79ViEWw0JIxlZ/eAxjj0bmy3OKHRxegOpkHqtPUlzfbilxLPaiXYQ7COZya0hHtetKgkdCRphfgXD0icBnI5oqNG0LS7uX3pvJKiEjDPCBFTzkz2zfvAjS73hGxuXeQAYXTxZlpxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761502374; c=relaxed/simple;
	bh=abwDLIXYuQaIlCNwYScYD5MWUz+NkpBpLnE2OhMS/qU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c2pbPMfRvQSViRD72GaznJ0tmpX8qk4HmzvMZkRZ0sn8m0rq5Veic5J85sU8aCI4eIQe0rJEgL25V5accoOcYxZoNZVaonep8qSQ4eP76UOnDRCBh+mj0FPCmcbykLQitzMaeiZ92eHIZK+F3x3ncyaL+Dk2Flp3bFj7SQ9SGKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nhFqgK9e; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 050851E39;
	Sun, 26 Oct 2025 19:11:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761502264;
	bh=abwDLIXYuQaIlCNwYScYD5MWUz+NkpBpLnE2OhMS/qU=;
	h=From:To:Cc:Subject:Date:From;
	b=nhFqgK9e7Wp56w63sRjXLzBn0yiAwyVUQkwCjQTtpIkKjzeIgNIF4m9uqNN3I09yT
	 SDrx3i/tKmy3np/yIZmh/KszXTM9DbWW1mTsLFoI+Tt3rV4olMnZ0pcOrAZVB+Qqip
	 kA4FwukN3Ll5dU64FssAl6onCHtg11yEkDjo3t6A=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH] media: staging: ipu7: isys: Drop video_open() function
Date: Sun, 26 Oct 2025 20:12:37 +0200
Message-ID: <20251026181237.13565-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The video_open() function is just a wrapper around v4l2_fh_open().
Replace it by the latter in the v4l2_file_operations.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/ipu7/ipu7-isys-video.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7-isys-video.c b/drivers/staging/media/ipu7/ipu7-isys-video.c
index 1a7c8a91fffb..8c6730833f24 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-video.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-video.c
@@ -88,11 +88,6 @@ const struct ipu7_isys_pixelformat ipu7_isys_pfmts[] = {
 	 IPU_INSYS_FRAME_FORMAT_RGBA888},
 };
 
-static int video_open(struct file *file)
-{
-	return v4l2_fh_open(file);
-}
-
 const struct ipu7_isys_pixelformat *ipu7_isys_get_isys_format(u32 pixelformat)
 {
 	unsigned int i;
@@ -867,7 +862,7 @@ static const struct v4l2_file_operations isys_fops = {
 	.poll = vb2_fop_poll,
 	.unlocked_ioctl = video_ioctl2,
 	.mmap = vb2_fop_mmap,
-	.open = video_open,
+	.open = v4l2_fh_open,
 	.release = vb2_fop_release,
 };
 

base-commit: ea299a2164262ff787c9d33f46049acccd120672
-- 
Regards,

Laurent Pinchart


