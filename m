Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87C462DF512
	for <lists+linux-media@lfdr.de>; Sun, 20 Dec 2020 12:09:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbgLTLH7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Dec 2020 06:07:59 -0500
Received: from mga18.intel.com ([134.134.136.126]:30539 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727128AbgLTLH7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Dec 2020 06:07:59 -0500
IronPort-SDR: nwGo2nRkOr51BZWfqFihsbAbQX/pRVM+49CObDS5dqCMh86XvPGJvS8RHMtrM3Y1Xk0EPyPPGv
 pcv33zIMUFtg==
X-IronPort-AV: E=McAfee;i="6000,8403,9840"; a="163353599"
X-IronPort-AV: E=Sophos;i="5.78,434,1599548400"; 
   d="scan'208";a="163353599"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2020 03:06:13 -0800
IronPort-SDR: C7+H2FL7TMkTQ42yBlELOUKfNFRnWy2Vhr8mbI1fMVp3wEEAAzNdXxQPE7wQAX/xkRkcGhGlFF
 Ely/8hYZIcvg==
X-IronPort-AV: E=Sophos;i="5.78,434,1599548400"; 
   d="scan'208";a="341808315"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2020 03:06:11 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id DF34420337;
        Sun, 20 Dec 2020 13:06:08 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1kqwY7-0003VN-K9; Sun, 20 Dec 2020 13:06:51 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>,
        syzbot <syzbot+1115e79c8df6472c612b@syzkaller.appspotmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: [PATCH 1/1] v4l: ioctl: Fix memory leak in video_usercopy
Date:   Sun, 20 Dec 2020 13:06:51 +0200
Message-Id: <20201220110651.13432-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When an IOCTL with argument size larger than 128 that also used array
arguments were handled, two memory allocations were made but alas, only
the latter one of them was released. This happened because there was only
a single local variable to hold such a temporary allocation.

Fix this by adding separate variables to hold the pointers to the
temporary allocations.

Reported-by: Arnd Bergmann <arnd@kernel.org>
Reported-by: syzbot+1115e79c8df6472c612b@syzkaller.appspotmail.com
Fixes: d14e6d76ebf7 ("[media] v4l: Add multi-planar ioctl handling code")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 31 +++++++++++++---------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 3198abdd538ce..f42a779948779 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3283,7 +3283,7 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 	       v4l2_kioctl func)
 {
 	char	sbuf[128];
-	void    *mbuf = NULL;
+	void    *mbuf = NULL, *array_buf = NULL;
 	void	*parg = (void *)arg;
 	long	err  = -EINVAL;
 	bool	has_array_args;
@@ -3318,27 +3318,21 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 	has_array_args = err;
 
 	if (has_array_args) {
-		/*
-		 * When adding new types of array args, make sure that the
-		 * parent argument to ioctl (which contains the pointer to the
-		 * array) fits into sbuf (so that mbuf will still remain
-		 * unused up to here).
-		 */
-		mbuf = kvmalloc(array_size, GFP_KERNEL);
+		array_buf = kvmalloc(array_size, GFP_KERNEL);
 		err = -ENOMEM;
-		if (NULL == mbuf)
+		if (array_buf == NULL)
 			goto out_array_args;
 		err = -EFAULT;
 		if (in_compat_syscall())
-			err = v4l2_compat_get_array_args(file, mbuf, user_ptr,
-							 array_size, orig_cmd,
-							 parg);
+			err = v4l2_compat_get_array_args(file, array_buf,
+							 user_ptr, array_size,
+							 orig_cmd, parg);
 		else
-			err = copy_from_user(mbuf, user_ptr, array_size) ?
+			err = copy_from_user(array_buf, user_ptr, array_size) ?
 								-EFAULT : 0;
 		if (err)
 			goto out_array_args;
-		*kernel_ptr = mbuf;
+		*kernel_ptr = array_buf;
 	}
 
 	/* Handles IOCTL */
@@ -3360,12 +3354,14 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 		if (in_compat_syscall()) {
 			int put_err;
 
-			put_err = v4l2_compat_put_array_args(file, user_ptr, mbuf,
-							     array_size, orig_cmd,
+			put_err = v4l2_compat_put_array_args(file, user_ptr,
+							     array_buf,
+							     array_size,
+							     orig_cmd,
 							     parg);
 			if (put_err)
 				err = put_err;
-		} else if (copy_to_user(user_ptr, mbuf, array_size)) {
+		} else if (copy_to_user(user_ptr, array_buf, array_size)) {
 			err = -EFAULT;
 		}
 		goto out_array_args;
@@ -3381,6 +3377,7 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 	if (video_put_user((void __user *)arg, parg, cmd, orig_cmd))
 		err = -EFAULT;
 out:
+	kvfree(array_buf);
 	kvfree(mbuf);
 	return err;
 }
-- 
2.20.1

