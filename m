Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28671F815C
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2019 21:38:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727543AbfKKUir (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Nov 2019 15:38:47 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:50135 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727170AbfKKUiq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Nov 2019 15:38:46 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MlL5x-1i2OQc4Am5-00lqC9; Mon, 11 Nov 2019 21:38:40 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
        y2038@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v4 4/8] media: v4l2-core: split out data copy from video_usercopy
Date:   Mon, 11 Nov 2019 21:38:31 +0100
Message-Id: <20191111203835.2260382-5-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191111203835.2260382-1-arnd@arndb.de>
References: <20191111203835.2260382-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XYSYE4CP2TXV0A5SoFgD7xC90DDcVn86gtgneJ99KiQ7zVJ2UsL
 5d1PhMLzTTi9pJ4MJwArMpXoh5E3LJe1xXvzLtuPEcbxxajp6CjgvYc6nR1geKrcyAVARiw
 eMfP9R9Jer1sIbQQQ0qZDue60m5rAaQQo9/V+TtRE6czNZPGAfKtv/1qxGxliCkYmywgOMj
 NlkiM7jdlkkrluJoFjPSw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WbYCTQEH2I8=:XkR8BsI9YP60yyNEnM2ClU
 nK+0BFpzUx0clF0GWFYdPaByYz+bzyfp5aXOtWq83abKAdHNBj7y5NueZNSAnGFMNz9pG1P2l
 TSgX7XWTSoDVMQ5GWHIlr3ZP2hRLB0xJsdwgnWUALTUxUBwVEj1Hk9p26evebkNYJaiqShyH9
 VcrNd+0UnEv2Yw4FZ8+znwkkbVbIIbPxQuZBXoEr4/lNET72lj9x3akCG3/p4SDYJiq63NGC6
 fGZ3BuLp7v64IwDBntNUsOs/h7ymFG7CTAeGqbZw+NakzX8Tum5qcB27j9d14K7MyJ0DssPJ/
 qx+csRUtyK/Lva9PRxXbzO9CGkp/FKfD4taU+PltZNAI4keRnyY3OQ5+KUs324xx/7iYbZ5ki
 LokA4uZdYqqOg7lhCIZEaJZFBTW76D4EHS+wlqkcRp31FX9Y6NupaSEbmaHnmH7zFWrKLzifO
 d9aUJc+FhKMLv+iJx77esxSN+32ss+e+fs4t4TgY+8yoGg2jcKpG7La45GdROjQDtOeDC67Cj
 SPV0oML6LPPRR5uD54hWnQ23JWDa18JV0sGBL59opmnmf+Tn3qkqbeMXUJGulv2bUaXqHkVo+
 LxZzVjYgBkYHVtC1DVXy++1r2KD6QAcOS4qv7w8G4uaRnEmN2soLHI9bqLJADWcxskq8uG79N
 H/U8BI6WwaUE32HZ9YLo6cRbvBfk3Xzpn9o4BO2N+8PRoFZuE5hn5ypz8/zRoJbbRIbwrKwKU
 6mXd1WcCj5urjX1kmmORaCXk9/ux5w6X3TT7+VXkIpwlSBs5HLXpo8TjMAFoBZM0a5tjSZBGg
 5c31W7QK5Ik6PlUScx1rDk1nhYQSbJY51HfXkr0KAEiZ12dWSWJMZUmocQ9sT6ctAJ62p5Dd/
 5EbDFinEmK2zRUqo20Ig==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The copy-in/out portions of video_usercopy() are about to
get more complex, so turn then into separate functions as
a cleanup first.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 107 +++++++++++++++++----------
 1 file changed, 68 insertions(+), 39 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 51b912743f0f..693f9eb8e01b 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3008,8 +3008,69 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
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
@@ -3021,6 +3082,7 @@ video_usercopy(struct file *file, unsigned int cmd, unsigned long arg,
 	size_t  array_size = 0;
 	void __user *user_ptr = NULL;
 	void	**kernel_ptr = NULL;
+	unsigned int cmd = video_translate_cmd(orig_cmd);
 	const size_t ioc_size = _IOC_SIZE(cmd);
 
 	/*  Copy arguments into temp kernel buffer  */
@@ -3035,37 +3097,12 @@ video_usercopy(struct file *file, unsigned int cmd, unsigned long arg,
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
@@ -3116,15 +3153,7 @@ video_usercopy(struct file *file, unsigned int cmd, unsigned long arg,
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
+	err = video_put_user((void __user *)arg, parg, orig_cmd);
 out:
 	kvfree(mbuf);
 	return err;
-- 
2.20.0

