Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F23462DF6E6
	for <lists+linux-media@lfdr.de>; Sun, 20 Dec 2020 22:32:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727300AbgLTVbS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Dec 2020 16:31:18 -0500
Received: from mga06.intel.com ([134.134.136.31]:14836 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727279AbgLTVbS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Dec 2020 16:31:18 -0500
IronPort-SDR: qACv4YXbjqHpBPR5VM3loR6CHLf8E2EYYaD0MUG+48lZnUK5Ilm/NdxbAsnK8enbIqRmVCo+rO
 8htSy5HV9XUQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9841"; a="237220766"
X-IronPort-AV: E=Sophos;i="5.78,435,1599548400"; 
   d="scan'208";a="237220766"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2020 13:29:31 -0800
IronPort-SDR: SaSo4Vuc49s2tlW12R2hTwf/0LomY+kj7N+XA5VFOVAGkR6jJ+WDFKzZdJ0GEBhk9kLi8XKba6
 M8NQGueBPu/Q==
X-IronPort-AV: E=Sophos;i="5.78,435,1599548400"; 
   d="scan'208";a="560244545"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2020 13:29:30 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 8A80820204;
        Sun, 20 Dec 2020 23:29:28 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1kr6HM-0004Lc-8z; Sun, 20 Dec 2020 23:30:12 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 1/1] v4l: ioctl: Use kmalloc to allocate a small chunk of memory
Date:   Sun, 20 Dec 2020 23:30:12 +0200
Message-Id: <20201220213012.16671-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

kvmalloc() was used to release the temporary memory buffer that was used
to contain both the IOCTL argument as well as a possible array argument
that could have been large. Now that the two are separated, the IOCTL
argument is known to be small in size. Use kmalloc to allocate it instead
of kvmalloc. Similarly for releasing it.

Suggested-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 9906b41004e9b..8d5d9c39c1622 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3300,7 +3300,7 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 			parg = sbuf;
 		} else {
 			/* too big to allocate from stack */
-			mbuf = kvmalloc(ioc_size, GFP_KERNEL);
+			mbuf = kmalloc(ioc_size, GFP_KERNEL);
 			if (NULL == mbuf)
 				return -ENOMEM;
 			parg = mbuf;
@@ -3377,7 +3377,7 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 		err = -EFAULT;
 out:
 	kvfree(array_buf);
-	kvfree(mbuf);
+	kfree(mbuf);
 	return err;
 }
 
-- 
2.20.1

