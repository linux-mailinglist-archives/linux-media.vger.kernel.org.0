Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84CA812085A
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 15:16:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728239AbfLPOPw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 09:15:52 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:50961 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728087AbfLPOPX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 09:15:23 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1N2mS2-1hiL4S2aQW-01347x; Mon, 16 Dec 2019 15:15:16 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        y2038@lists.linaro.org, linux-kernel@vger.kernel.org, arnd@arndb.de
Subject: [PATCH v6 4/8] media: v4l2-core: split out data copy from video_usercopy
Date:   Mon, 16 Dec 2019 15:15:02 +0100
Message-Id: <20191216141506.121728-5-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191216141506.121728-1-arnd@arndb.de>
References: <20191216141506.121728-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7JSUzHfz/mbuQfJNavPjiqCzsXGd9fJEom9KwECjrbOwLFc6TMp
 Gj5Yste2o4h31yzfmrpmkyiRypci3Q4f4AaBDHDCMVtMwJzz8J6UjjNEknexRZvyTuUtkJs
 YJ7cAY9P+OzZrpzTkwlzA+B759mTBD9eTQJkqhGxdiHjYtFNWVZN6NZSUNtJiTkSWhNwESD
 mOQUR+cjtUU9feZ50vmlA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6Nv+ryBJKpw=:nAQQwoyLzZ9/6s8J8JNNLb
 mGDeh9Otfxwg+rBZ9M2vJOWW+88D6/tw6rPvaU9bgwBYN+MYBLsldvAn5TE6pxCLc4lJq9H6H
 VCaISPOswiNyWorwtxGHJ/BzXt7KXwzQg5c8jIvinIqTI4zjKgnUc54vdf5sGKHZ7N1YT1LWQ
 U4vHGbDvYsWzsti455fEncN9MrhvNklWj67tRlaKJ7GhUkBxvleUz9r4xuRsnJvqfXGuXdUWu
 NFuPctBEPAOXdWef0Pq53Myj1SxsAUyiyeSkZKidRPfQhUZc8xiN1amBCBsq8E1t2ERMRBKXj
 2iC4hLwjbLrKBPRMODst0dg7SvXLGSMjhL0VXfUIaa8Pjjr6wynW27hiRpqV5FBkhSDtN9g0p
 8ao9mlKTkVbci8qyg/5immco3F9YJBNgC04AUYH4rz+zqhrwGROqBWNTzWui59Zaq9Q9r93nQ
 o6SRppmdKuGfy/CPBLYI7eZ94SVojVB5gUTgvZoGLklxzDvGGvVV+J3husVL8y4TiW1NZcguo
 QODLRBjZRV6MMxryz2n0zEFWxU94L5Eg/QHGWAB43UbHKOp5DwU23EDbW6/Ac7H132cRwkMGE
 N55LLYjFgUqoy4W33ZIAE7zxrcaSpIV+TvOZV6v/UFiv9CZTcvGFuhJZgQ94M+uATKrOc2wGw
 r611rU3CZJcRSCUs+Kmlxjxj0xnXtWiZiTjeOpvzhhJHCr1E4pRF4xYeG0veKolFQrjGd+k3B
 m/lM9+yXlEMPuk4OgGZsS01iBVZbyKO0XgAiKSSDP4MbtqTN3YjMEpxwZDuHfAR9oWj99RYCy
 zrC9KtbDCpnQSjqBzvD0t/ndN/kvvENDo3nJsmYpdatY8JGaqKbAlL6n+1AoZM/zBw+hvS1Sf
 Tfq4nNqbJK4djw8eAtZQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The copy-in/out portions of video_usercopy() are about to
get more complex, so turn then into separate functions as
a cleanup first.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 108 +++++++++++++++++----------
 1 file changed, 69 insertions(+), 39 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 4e700583659b..fe4678965e1b 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3023,8 +3023,69 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
 	return ret;
 }
 
+static unsigned int video_translate_cmd(unsigned int cmd)
+{
+	return cmd;
+}
+
+static int video_get_user(void __user *arg, void *parg, unsigned int cmd,
+			  bool *always_copy)
+{
+	unsigned int n = _IOC_SIZE(cmd);
+
+	if (!(_IOC_DIR(cmd) & _IOC_WRITE)) {
+		/* read-only ioctl */
+		memset(parg, 0, n);
+		return 0;
+	}
+
+	switch (cmd) {
+	default:
+		/*
+		 * In some cases, only a few fields are used as input,
+		 * i.e. when the app sets "index" and then the driver
+		 * fills in the rest of the structure for the thing
+		 * with that index.  We only need to copy up the first
+		 * non-input field.
+		 */
+		if (v4l2_is_known_ioctl(cmd)) {
+			u32 flags = v4l2_ioctls[_IOC_NR(cmd)].flags;
+
+			if (flags & INFO_FL_CLEAR_MASK)
+				n = (flags & INFO_FL_CLEAR_MASK) >> 16;
+			*always_copy = flags & INFO_FL_ALWAYS_COPY;
+		}
+
+		if (copy_from_user(parg, (void __user *)arg, n))
+			return -EFAULT;
+
+		/* zero out anything we don't copy from userspace */
+		if (n < _IOC_SIZE(cmd))
+			memset((u8 *)parg + n, 0, _IOC_SIZE(cmd) - n);
+		break;
+	}
+
+	return 0;
+}
+
+static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
+{
+	if (!(_IOC_DIR(cmd) & _IOC_READ))
+		return 0;
+
+	switch (cmd) {
+	default:
+		/*  Copy results into user buffer  */
+		if (copy_to_user(arg, parg, _IOC_SIZE(cmd)))
+			return -EFAULT;
+		break;
+	}
+
+	return 0;
+}
+
 long
-video_usercopy(struct file *file, unsigned int cmd, unsigned long arg,
+video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 	       v4l2_kioctl func)
 {
 	char	sbuf[128];
@@ -3036,6 +3097,7 @@ video_usercopy(struct file *file, unsigned int cmd, unsigned long arg,
 	size_t  array_size = 0;
 	void __user *user_ptr = NULL;
 	void	**kernel_ptr = NULL;
+	unsigned int cmd = video_translate_cmd(orig_cmd);
 	const size_t ioc_size = _IOC_SIZE(cmd);
 
 	/*  Copy arguments into temp kernel buffer  */
@@ -3050,37 +3112,12 @@ video_usercopy(struct file *file, unsigned int cmd, unsigned long arg,
 			parg = mbuf;
 		}
 
-		err = -EFAULT;
-		if (_IOC_DIR(cmd) & _IOC_WRITE) {
-			unsigned int n = ioc_size;
-
-			/*
-			 * In some cases, only a few fields are used as input,
-			 * i.e. when the app sets "index" and then the driver
-			 * fills in the rest of the structure for the thing
-			 * with that index.  We only need to copy up the first
-			 * non-input field.
-			 */
-			if (v4l2_is_known_ioctl(cmd)) {
-				u32 flags = v4l2_ioctls[_IOC_NR(cmd)].flags;
-
-				if (flags & INFO_FL_CLEAR_MASK)
-					n = (flags & INFO_FL_CLEAR_MASK) >> 16;
-				always_copy = flags & INFO_FL_ALWAYS_COPY;
-			}
-
-			if (copy_from_user(parg, (void __user *)arg, n))
-				goto out;
-
-			/* zero out anything we don't copy from userspace */
-			if (n < ioc_size)
-				memset((u8 *)parg + n, 0, ioc_size - n);
-		} else {
-			/* read-only ioctl */
-			memset(parg, 0, ioc_size);
-		}
 	}
 
+	err = video_get_user((void __user *)arg, parg, orig_cmd, &always_copy);
+	if (err)
+		goto out;
+
 	err = check_array_args(cmd, parg, &array_size, &user_ptr, &kernel_ptr);
 	if (err < 0)
 		goto out;
@@ -3131,15 +3168,8 @@ video_usercopy(struct file *file, unsigned int cmd, unsigned long arg,
 		goto out;
 
 out_array_args:
-	/*  Copy results into user buffer  */
-	switch (_IOC_DIR(cmd)) {
-	case _IOC_READ:
-	case (_IOC_WRITE | _IOC_READ):
-		if (copy_to_user((void __user *)arg, parg, ioc_size))
-			err = -EFAULT;
-		break;
-	}
-
+	if (video_put_user((void __user *)arg, parg, orig_cmd))
+		err = -EFAULT;
 out:
 	kvfree(mbuf);
 	return err;
-- 
2.20.0

