Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8CE310A4ED
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 20:56:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727172AbfKZTzx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 14:55:53 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:35157 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfKZTzx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 14:55:53 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.129]) with ESMTPA (Nemesis) id
 1M89P1-1iVa4X058F-005Hn9; Tue, 26 Nov 2019 20:55:46 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     y2038@lists.linaro.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v5.1 4/8] media: v4l2-core: split out data copy from video_usercopy
Date:   Tue, 26 Nov 2019 20:55:38 +0100
Message-Id: <20191126195538.4160031-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191126161824.337724-1-arnd@arndb.de>
References: <20191126161824.337724-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XVWRP1o8QaB5DUD89+2m/pjduCozGfCbQfT6tZiPgI3KqyGt+fL
 s6uOTS/r7c+o1AcAKLeFhEbDpDfyc16LPV/hN8lWjTd17iLJqRMjKCnH3TgGyVpx1LH+BGy
 fik+tSBz+fI/Dviu4kfx97OsrjaQISdAIZJe5ipcVg8VdjHrahxGnoSJj9MWoByiMFw4fG9
 /Ao/bS/cN3OXN/dg/IwMQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+qzM3W6W4dM=:sXFMvuHQqh9zObXzv2Rxi2
 7lmcdzO+dlBCFXbPo62ynWwr9V01HoASvWOkVp13cy2LCMqUBG7hbggDsGojG4xX0oyZnSM9R
 FjnMGT48qHJB/4ryeGNPJGXdgU+N3ESqQQ9s9g9oeRV83pzoUN/KdhY4mDApjRZVjfsm6yPj6
 qldYFosTnSW1E4+m6W228eX8yOJ6zqGl3afZxBGrumRfOzBTP8l+OdTeB87/A62On/h0DzFo+
 hr9UddmMgCIz1XA0FeVOMHdXqP3IB9buqhxjypx2+kyINZhgcJhm+NfkrDAUqf6hVXaZz9nIb
 MHluJsIISqWJUP8gW81eYzf7F9X5XwksVuD/lpLbFPYvMr5dhROAKVK7Eix/H2cWjwmPYPFUL
 Lg4nk7YRBsabff+fW0YEtlMZ766Sqb9xI8HFVvkzVOUmaBUa+bsb1M2XSGV8nZEp46CMZJ9TO
 lbnRUqlQ/7bkgu/pDLloKjSpWEMKdnU3UdnWfaBM/+ynhKswSERySeeS9DB/75FKJg/7DsQi+
 ClUk4zXOApjZeIdirl6tPxvXTdGSqMBqZavtFJI8aVwP5Ay760JpT1i+tKS5tR786qKhl+ATj
 u3VpoJdVfM37Y9RW6sM7sP8Pq+YWDBI21KYGeBe92+5AdwNqQvIhIcSsFlBhck831xqI+3j2o
 YPxO5TbymC2+pfBiBaoHga38lfR6HhXsyveSdJJskyCOiQWB2ZmXHUuRXGZR18Ts/EtcY2VLa
 IwdUN0fH3AEleNmSmaegNnpPRhaD4kAcmut4qdnvefm3Z08WzoRFyiFpeLrvx1SZLFkNt8S2b
 izrHxf4WAyP4VxysoDXLpTxwlhoKEGgE34VshR5YL8Nwy3VWW48vDmM+99TMCLfyd1GtHoIgE
 nyYpzH/lRas10U5F3Slg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The copy-in/out portions of video_usercopy() are about to
get more complex, so turn then into separate functions as
a cleanup first.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v5.1: fix error handling for positive return code

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

