Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E077340711
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 14:45:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbhCRNob (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 09:44:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:34904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230010AbhCRNn7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 09:43:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8902264E4D;
        Thu, 18 Mar 2021 13:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616075039;
        bh=M/awrcCSuKIqOO2dmf7RKrAzqBZawv3ByeWFBOHNV9Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tvzLhSlOEy7dCNqLkoFPSJ7DAlxsG5RAo0ns+QYpq+UrW9JrAUln88DcFs/NC0OJs
         T+GBiXt5nHG8vVrImz57sLy1Krri1JXQIwe+PeXmVHvx3XaM85RFib2ALg12XqaaFB
         fuy9UpJ2ezFNdlKGINaY3k8T2r/k07cicOzR/N3jzogfGsrrnkNeAVCKGZin7M19MH
         OiE/XtNe3ry+YfI1fjH37CnNaOD5Z4MLNGTwp3GAKm8d7xwpjUQiZ4sXCtLDYS1pHx
         3c6BtbyNjxYQBUEr38ghw3WHyIrRrBW3zT3g4bV/xfNTBCHbeZj1QiaCbBBo5m4roi
         eUPIBahJZqtMQ==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Dmitry Vyukov <dvyukov@google.com>, Arnd Bergmann <arnd@arndb.de>,
        syzbot+142888ffec98ab194028@syzkaller.appspotmail.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: v4l2-core: explicitly clear ioctl input data
Date:   Thu, 18 Mar 2021 14:43:19 +0100
Message-Id: <20210318134334.2933141-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210318134334.2933141-1-arnd@kernel.org>
References: <20210318134334.2933141-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

As seen from a recent syzbot bug report, mistakes in the compat ioctl
implementation can lead to uninitialized kernel stack data getting used
as input for driver ioctl handlers.

The reported bug is now fixed, but it's possible that other related
bugs are still present or get added in the future. As the drivers need
to check user input already, the possible impact is fairly low, but it
might still cause an information leak.

To be on the safe side, always clear the entire ioctl buffer before
calling the conversion handler functions that are meant to initialize
them.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 51 ++++++++++++++++------------
 1 file changed, 29 insertions(+), 22 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 2b1bb68dc27f..6cec92d0972c 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3164,12 +3164,23 @@ static int video_get_user(void __user *arg, void *parg,
 
 	if (cmd == real_cmd) {
 		if (copy_from_user(parg, (void __user *)arg, n))
-			err = -EFAULT;
-	} else if (in_compat_syscall()) {
-		err = v4l2_compat_get_user(arg, parg, cmd);
-	} else {
-		switch (cmd) {
+			return -EFAULT;
+
+		/* zero out anything we don't copy from userspace */
+		if (n < _IOC_SIZE(real_cmd))
+			memset((u8 *)parg + n, 0, _IOC_SIZE(real_cmd) - n);
+
+		return 0;
+	}
+
+	/* zero out whole buffer first to deal with missing emulation */
+	memset(parg, 0, _IOC_SIZE(real_cmd));
+
+	if (in_compat_syscall())
+		return v4l2_compat_get_user(arg, parg, cmd);
+
 #if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
+	switch (cmd) {
 		case VIDIOC_QUERYBUF_TIME32:
 		case VIDIOC_QBUF_TIME32:
 		case VIDIOC_DQBUF_TIME32:
@@ -3182,28 +3193,24 @@ static int video_get_user(void __user *arg, void *parg,
 
 			*vb = (struct v4l2_buffer) {
 				.index		= vb32.index,
-					.type		= vb32.type,
-					.bytesused	= vb32.bytesused,
-					.flags		= vb32.flags,
-					.field		= vb32.field,
-					.timestamp.tv_sec	= vb32.timestamp.tv_sec,
-					.timestamp.tv_usec	= vb32.timestamp.tv_usec,
-					.timecode	= vb32.timecode,
-					.sequence	= vb32.sequence,
-					.memory		= vb32.memory,
-					.m.userptr	= vb32.m.userptr,
-					.length		= vb32.length,
-					.request_fd	= vb32.request_fd,
+				.type		= vb32.type,
+				.bytesused	= vb32.bytesused,
+				.flags		= vb32.flags,
+				.field		= vb32.field,
+				.timestamp.tv_sec	= vb32.timestamp.tv_sec,
+				.timestamp.tv_usec	= vb32.timestamp.tv_usec,
+				.timecode	= vb32.timecode,
+				.sequence	= vb32.sequence,
+				.memory		= vb32.memory,
+				.m.userptr	= vb32.m.userptr,
+				.length		= vb32.length,
+				.request_fd	= vb32.request_fd,
 			};
 			break;
 		}
-#endif
-		}
 	}
+#endif
 
-	/* zero out anything we don't copy from userspace */
-	if (!err && n < _IOC_SIZE(real_cmd))
-		memset((u8 *)parg + n, 0, _IOC_SIZE(real_cmd) - n);
 	return err;
 }
 
-- 
2.29.2

