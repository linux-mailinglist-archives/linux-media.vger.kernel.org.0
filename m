Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63145133ECC
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 11:00:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727160AbgAHKA1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 05:00:27 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:57259 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726927AbgAHKA0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jan 2020 05:00:26 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MqJyX-1jSqrc1z7L-00nOpV; Wed, 08 Jan 2020 11:00:15 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     syzbot+54fd8cca4b7226c94b8e@syzkaller.appspotmail.com,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Vandana BN <bnvandana@gmail.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: v4l2-core: only zero-out ioctl-read buffers
Date:   Wed,  8 Jan 2020 11:00:00 +0100
Message-Id: <20200108100013.284108-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:CVOlEaB3G4b+yq/fgEU8QwUgyL0mON3Gtm7AhWwU6x3RboXTNPi
 I+WMsU653svG0Zy2qvrYMB9pLrY0OkAb/r7t/z9IDA5dtAdqZX0+hemSZsxsmdzwXGM2gnH
 kRQWxF42lv3v/GOC9gJRxxxBCOXLM9nWEVPB1ZvwBG70y1EuCrm9TPtKyeb/Vn6Vv5vcBri
 oyes0WkWIpWko2xvjmKBQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:H/LDq2q0KTg=:EZx+1YOXITU+Zlx3KhsF5z
 UHJpYb2efAbCvSq3g0hvc02JH9+seYy3t1Baq19O4gwTSRRia/yBL8C8xETKt4n1NKvICnSAp
 Hzf58RThek+qtU5fRAmu6bchog4TByWyGMCYlWb2ILCiMsCw+NZC2O0IW7bOHU3aZu/qF4eBt
 FPa5L3fKkHmjK+CfU1+7ochQyBLxr4brRRLd3YYFo5+DhjbFViPdBbWMquXzjvEA5ALoay9cO
 xEstnkHxCoM7qTRO6bWu+cXroBvPJqMfEtbj1EUGnH4OZGq0bioJDO/K04JcUvNuzEEKfu/uE
 oByG76VJilkTlHgd+e74JhAVpQDcaYsLvSGdE7oeeXeDe4+NPCAnBzOJ0rC2TjJ3e8GPY7Vmf
 yhRR8pyCuaftF6nOgTjVSrcLysSIZmqbQN0kJbI465mfc/MmUq6oG/UZsAO+N9uf4NZLjmGgY
 MuRlJPFTkiWgA8OKZszV0Q7R9kmqf9QlOnSR2EwHMrWq/5LnYhByGezyRHXV6TgJ0xrz/UkOZ
 LRFcl5uXTbpwkpAnBHxThulyKr6LjMOs7VLaiCNfGAtQrF4ewRQGXvFksXcU69rZkax4I6opZ
 fFVw1rw2Zs9rEqtEXOZu0gCE3MePkCnTrxue2mpH3cWUURnmBvMbTgeOd7OMFBs3ZhAAYkaUD
 ITrCzBsWEhwqLgDoznJxF4LUKpKceeWvYd9h/XhEX+ybPiEYwIFascEKlBwkwuvs/6UDC7DDc
 GDKHOXDlDpvt4Ih/uWdzjZcp9Vf+/RqmNbytwprXPhfJkVy08iWqjv7bb3JLIh2ZVknjvpi1F
 FrojwBjPpKcb2pwyhckznRcuPT1aPlW0dZB1ebzCxNIhRVTfOBW3WdVUvDVJwmp2KPYwJMABj
 OHABREwyQ5t5D30lIOlA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The memset() got moved out of the check for _IOC_NONE, so passing a
made-up command number with a size but no direction would allow clearing
data on user-provided pointers.

Move video_get_user() back into the _IOC_NONE check where it belongs.

Reported-by: syzbot+54fd8cca4b7226c94b8e@syzkaller.appspotmail.com
Fixes: 6c625c01c7a6 ("media: v4l2-core: split out data copy from video_usercopy")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index b0d670715c27..0f11fc6b5447 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3208,12 +3208,12 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 			parg = mbuf;
 		}
 
+		err = video_get_user((void __user *)arg, parg, orig_cmd,
+				     &always_copy);
+		if (err)
+			goto out;
 	}
 
-	err = video_get_user((void __user *)arg, parg, orig_cmd, &always_copy);
-	if (err)
-		goto out;
-
 	err = check_array_args(cmd, parg, &array_size, &user_ptr, &kernel_ptr);
 	if (err < 0)
 		goto out;
-- 
2.20.0

