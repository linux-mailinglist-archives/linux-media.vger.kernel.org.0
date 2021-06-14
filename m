Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7DA63A615C
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 12:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233510AbhFNKqX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 06:46:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:50472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234096AbhFNKoI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 06:44:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 546CE6143F;
        Mon, 14 Jun 2021 10:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623666974;
        bh=xaMr2dGdBv8aHkc7XxHh77JyHfxg49iiEuvmvsKKGSM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UBJtcR1Z/NaZYdmI0trZt+V091wI9YrkETLuUm+IOUdJ+vIaFIHLcyHAdFs6jP4xJ
         YVD9lsTA9F4lrOkG9w+YbDfzOytyqoEY2DaIM55W5wZpoRHDxJGz3i5f9hTRvq5Ng9
         u3gG2sY83zIhfT5oEBSCvYI6H1DUo2uvtGoEzX1ion1ODlK9U25xUYQJ6Dm61k7cxg
         rUEgn4aN9j6lv2hyJoNzfKkJC2m2BUcol0jCTOlQlKnaDlH3ELWe7IIcNUGXp4fVNt
         Cz0OXyJyEUXVLboCwiYXhWvQc60FlggDHbg+PqowQJx/cK9R331I53iDGoTyRYVxfx
         tpnIDE15uaRRQ==
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
Subject: [PATCH v3 2/8] media: v4l2-core: explicitly clear ioctl input data
Date:   Mon, 14 Jun 2021 12:34:03 +0200
Message-Id: <20210614103409.3154127-3-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210614103409.3154127-1-arnd@kernel.org>
References: <20210614103409.3154127-1-arnd@kernel.org>
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
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 58df927aec7e..f19e56116e53 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3124,8 +3124,10 @@ static int video_get_user(void __user *arg, void *parg,
 		if (copy_from_user(parg, (void __user *)arg, n))
 			err = -EFAULT;
 	} else if (in_compat_syscall()) {
+		memset(parg, 0, n);
 		err = v4l2_compat_get_user(arg, parg, cmd);
 	} else {
+		memset(parg, 0, n);
 		switch (cmd) {
 #if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
 		case VIDIOC_QUERYBUF_TIME32:
-- 
2.29.2

