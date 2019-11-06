Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1FECF1F2E
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 20:47:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732277AbfKFTro (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 14:47:44 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:52407 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732094AbfKFTro (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 14:47:44 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1N6KMR-1hqxmj1WdF-016fo9; Wed, 06 Nov 2019 20:47:28 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        y2038@lists.linaro.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Daniel Mentz <danielmentz@google.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v3 4/8] media: v4l2-core: split out data copy from video_usercopy
Date:   Wed,  6 Nov 2019 20:47:11 +0100
Message-Id: <20191106194715.2238044-5-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191106194715.2238044-1-arnd@arndb.de>
References: <20191106194715.2238044-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MgGhQlMf0sQoX4BwSigDgTPdaQVjvrw+JuXQJm8is4+E1D0ai/K
 530O9xJB2RZpYJ2lmJ5LXDAr6OFFhRx/hW44o/bTprnxfxKi616Z6UoZqBcquaecc/XxrPg
 MeYeI6B7usdOtgEB0lOnPct/7tK+f1Cd8l5HjpxXl/z+qMIeOYFekuZpSkR4iN9hlhjB+EW
 BD0jjVlbOQt0jnb15+MQw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gJ+jAHu+iP8=:brf46HfddiyxJLj/6/Rdr4
 6SeZYDsG4RpDct51rF8Ffa0RLEWccrnvPCxK4zB/PHILcdXWo+/TzlD+jJsIFDRm2dLadzN0O
 gqmSOtrzpIT5/trnJViivjYrJT9/tMNYMC9IIpUtXxn4pm3NGEsJAIP4hF2wIeI3lviy0g/64
 G7lrpMGuACRWZsKARZxEj9sYmo3WkyWjxhNoFnJs7YKwayUYzKl/+jGpZVocFmK8KnFqPrP9h
 JSNXbZbOk0X2cMQvkcyC9NG6bl3jiQHNRfx2xzJ9BGBdvVe8Bcwfr/HQIWXidcYd2nepTlMfm
 6lVIbMnKR9nFzOeB6CP873lPAVkUdUdaXTwPwiots3Hgt5g8/Pjqv066J8Ohlm7AU17ypBsxN
 dMhLCXLu79YeBZQZZ3ZjRupIbKCd5D1rNE7h1BSHsVLGzWMEDPV5HIrK+8unDW67f7TNoikBF
 6LzGW6z0JAPGXpKxC4SLgtMCzU2xRVInvQeSVgatpm6ZO05Ia122XNs5tfWp01JFXQMsbyeQS
 hdhsdTtupIzlmxlHsE8G3u14Z5KTab2yRQpXAxnX6Btq1NDPqt3+9f0W5dx6XMjVDzaHjpPjA
 yUkEL0xFumEJaQxiXj4XSqL230VgWskjbLSGdAfUBiccrizQgJbUvN7xk1Y5glbww9f2ljXGE
 7b6PkrlJnOUHi9pVywGGFyBglpn3fFSGTpdFzJ/U6R7o5hV8TSQClARFtryW7YssFiPUnkkDE
 thfuMBeNPBr9q47lubCKegU2mw72FcDw7HqMhHcXalevKaGdBN4h4SyRkYiqEGC49bEa7tOit
 927QSn6u8/RoRgCXSXiQo4h3RU6B0xnVZygYRbUD9TxReuELWTUmPYg7bXTopRtWpmi88yzal
 xCVYsDnlp/fFqZg/D8+A==
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
index 315ac12c3e0a..50612b4749d3 100644
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

