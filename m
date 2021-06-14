Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 866003A615E
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 12:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233490AbhFNKq3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 06:46:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:47606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234187AbhFNKo1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 06:44:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6457A61404;
        Mon, 14 Jun 2021 10:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623666980;
        bh=ql1oV1rq//CRvUy0F7HDTW6q+eFb02wnUXlrJrXa2hs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KUruyy5gO6Rmb9YkIRNn/KwupM5Pb0ct4xe1wCoCaBnmYprT1PW9wqxiuu2Xunb7R
         qrEUnCiomDmSUCPgnyvv8y6bYDk0bcci3f2U0amKU/oKmuvJl9Z6RvPntny/JT3feD
         2bYU8/RhCaW+A0ehXoiP+mktv7qyupCkZKNxkWLqj5vDAPICGNd1D5VMeNqIQzrMEd
         0o1Ug/EUQeklXR3bH5p6MHpZlADgSxXUQ69J3l0Y/q2XlkKzT6N5skalKKc/0dEa1k
         8uETFO7ZrPtTMoEUittl+hs7k5ywoQni8JuDoZULVXmVhfxA/Gxu1Kw+FXVhtB4eff
         +b0GHFN11F7lg==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH v3 4/8] media: subdev: remove VIDIOC_DQEVENT_TIME32 handling
Date:   Mon, 14 Jun 2021 12:34:05 +0200
Message-Id: <20210614103409.3154127-5-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210614103409.3154127-1-arnd@kernel.org>
References: <20210614103409.3154127-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Converting the VIDIOC_DQEVENT_TIME32/VIDIOC_DQEVENT32/
VIDIOC_DQEVENT32_TIME32 arguments to the canonical form is done in common
code, but for some reason I ended up adding another conversion helper to
subdev_do_ioctl() as well. I must have concluded that this does not go
through the common conversion, but it has done that since the ioctl
handler was first added.

I assume this one is harmless as there should be no way to arrive here
from user space, but since it is dead code, it should just get removed.

Fixes: 1a6c0b36dd19 ("media: v4l2-core: fix VIDIOC_DQEVENT for time64 ABI")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 956dafab43d4..bf3aa9252458 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -428,30 +428,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 
 		return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NONBLOCK);
 
-	case VIDIOC_DQEVENT_TIME32: {
-		struct v4l2_event_time32 *ev32 = arg;
-		struct v4l2_event ev = { };
-
-		if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
-			return -ENOIOCTLCMD;
-
-		rval = v4l2_event_dequeue(vfh, &ev, file->f_flags & O_NONBLOCK);
-
-		*ev32 = (struct v4l2_event_time32) {
-			.type		= ev.type,
-			.pending	= ev.pending,
-			.sequence	= ev.sequence,
-			.timestamp.tv_sec  = ev.timestamp.tv_sec,
-			.timestamp.tv_nsec = ev.timestamp.tv_nsec,
-			.id		= ev.id,
-		};
-
-		memcpy(&ev32->u, &ev.u, sizeof(ev.u));
-		memcpy(&ev32->reserved, &ev.reserved, sizeof(ev.reserved));
-
-		return rval;
-	}
-
 	case VIDIOC_SUBSCRIBE_EVENT:
 		return v4l2_subdev_call(sd, core, subscribe_event, vfh, arg);
 
-- 
2.29.2

