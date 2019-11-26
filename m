Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B86410A1D3
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 17:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728744AbfKZQSn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 11:18:43 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:39427 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728250AbfKZQSk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 11:18:40 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MaIKJ-1iL14x2lz3-00WBEs; Tue, 26 Nov 2019 17:18:34 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     y2038@lists.linaro.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v5 4/8] media: v4l2-core: split out data copy from video_usercopy
Date:   Tue, 26 Nov 2019 17:18:20 +0100
Message-Id: <20191126161824.337724-5-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191126161824.337724-1-arnd@arndb.de>
References: <20191126161824.337724-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:r++WgAlr/NGAG5oOEEOa/W39DoBoyYcLns/mRUgxxpoktk06+ym
 5xeohg1HW7rYPasW+z9VUJajRk+OLnFxeuCVTax2GwEsOcY4rGelk560Ro/n/jyS+lkXDPq
 Ilx8QVYx72Tz5qAK/RizIX+8hLDvqfNIZho0SByxH2KR02Wd7eeVxVOK9ZGMKK+gU/0GGhy
 GZkKeyy9I+NH8FS/hJe6w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wWBfceJaoWk=:WQemL2H/yF3X7qE+DDrrJj
 bCsQ//nqLfGQ6m/CYqhbqGF1XoM4xYMEteIjS/v4dfhx4V2I9Y5+C20EsKMr7qxMTKqauKO+/
 O9SDc3AVJKKS0FlPrLptoObqW69ooCl6VCglGBHE3ZttrUJuN+TAf7buuwN/XJgr5Icvz3ekT
 s6EmEC6Y340iWOipAPTrlJgozryk0xpKDLF9k+wWaIbMP7YkNKq3oQ/t7ILft/aihtv98M3QP
 lRJZqq6ZLi3HgscdShxdvuBZxkGXOhsQWAghoJFlVvDNRYJevKQx4a75Cp/C3AN1O/zOleQVQ
 HgNuSxAMZY24BdFiGrvXBTIes7W8ZZLeDX65emvtm1B+5Pdj82g0RYYrNsJ5H/jeKNVOA5bBV
 xkVeazjhgBWzfHU78esr8+5OUEPyJt/Rh1tT5CR54AUpG9M3W9u92PLFcYl5dlLF3mCll9KXO
 OoFjfwfBKg4RWYM3qLe5RsMyt7akBVpETHcxE3Mj8b7f8IggrqaYfUgcWcQo7Q09EMtqIf0XL
 7KTXeFcne9Vi2kah7VolsPnWWPHOs+ED+cIw/uFSyd944qn8qQ07RkavH9gsiFm25NNWG6hxC
 HnITohetp+AJuQ/2GCBLDfLH4ntTMbd2UBYK1dsd89gY7hSrzo0Ds9squxv4BLd80V8wROl4/
 dc6NzuQdIbGKM8W9rarKd7Gx27zQpYNu+Zed5TWzcMobIzcs0GSwrBGXdTiJbYknv7gHefK7h
 rD9vncTnmPVucLn+Fwcv1L62Qvoqk6sBR+TuW/g+xoyrNTgFb9lc7r5Q3D1zOi8S7nspZJWXM
 U+HbZyIDAUdDU3IX1c7uwgtoE3ltsT9frlT254gsZE5rIHNUiIB7UuDdz9zZwByl2CbQ/0b3D
 +uaDnWrP756v6gNDPNAg==
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
index 4e700583659b..2ce91f88369b 100644
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
@@ -3131,15 +3168,7 @@ video_usercopy(struct file *file, unsigned int cmd, unsigned long arg,
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

