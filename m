Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA952CE96E
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 09:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728983AbgLDIVY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 03:21:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:33886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727069AbgLDIVY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Dec 2020 03:21:24 -0500
From:   Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        clang-built-linux@googlegroups.com
Subject: [PATCH] [v2] media: i2c: fix an uninitialized error code
Date:   Fri,  4 Dec 2020 09:20:14 +0100
Message-Id: <20201204082037.1658297-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Clang points out that the error handling in ov02a10_s_stream() is
broken, and just returns a random error code:

drivers/media/i2c/ov02a10.c:537:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
        if (ov02a10->streaming == on)
            ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/media/i2c/ov02a10.c:568:9: note: uninitialized use occurs here
        return ret;
               ^~~
drivers/media/i2c/ov02a10.c:537:2: note: remove the 'if' if its condition is always false
        if (ov02a10->streaming == on)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If streaming is already on, leave it that way and return success.

Suggested-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
Fixes: 91807efbe8ec ("media: i2c: add OV02A10 image sensor driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2:
- return success instead of -EBUSY, according to feedback from Dongchun Zhu
- remove incorrect advice from warning message citation
---
 drivers/media/i2c/ov02a10.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index 391718136ade..8683ffd3287a 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -534,8 +534,10 @@ static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
 
 	mutex_lock(&ov02a10->mutex);
 
-	if (ov02a10->streaming == on)
+	if (ov02a10->streaming == on) {
+		ret = 0;
 		goto unlock_and_return;
+	}
 
 	if (on) {
 		ret = pm_runtime_get_sync(&client->dev);
-- 
2.27.0

