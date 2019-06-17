Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D7BF48073
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 13:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728046AbfFQLRj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 07:17:39 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:50983 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727722AbfFQLRi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 07:17:38 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MsHwC-1iVLw61pjW-00th1H; Mon, 17 Jun 2019 13:17:24 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Maxime Jourdan <mjourdan@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@lists.freedesktop.org,
        linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] media: meson: include linux/kthread.h
Date:   Mon, 17 Jun 2019 13:16:51 +0200
Message-Id: <20190617111718.2277220-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mSHisb9SBlgUUulWsfD80t6IakUBYWZsI/Spxa2zTsENfcv0/oL
 wXRwf2cAITNDLjhX5OdADkdf0mkzcN1j9sL2qpnkOOHIYc63+Isk5bje/I7TYvBZHfDGJVA
 r7A0t7lhVt8vsJkJcZAlSHPCCkG2B0cUlkxSCtyTkeBDZivJYXHrZfJrcHVhh8U/NkHVn+G
 z8XIUrkJTFpUT9flwto5A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5enVdSaVH3g=:lmcLQZFPDGsXUdZosube+q
 +4bBPYpxQcZH3YRVmoqGVXVMqUPyq8TM7t1NN71zGmMECjpzcIQmLaU7wBehGX3UGiPVgveud
 bZngn+x3mEc1dBYhDKvsXXpaE3OprU81Txg5XLowGYq6isNZ6KIOgJi3tH6dlfn0uObbpEFnB
 4ahGUcHZnkN5rAZttQtt3MZX4IPADmEW6qUqV2DG/ljWH+HInH0qSuztP0TS86JrXpIR6ePUb
 T9kfGAMH9jVdznB3U2hmjp1OnjUtgCzDYFg8YA6Jo54lmz+kHJ0j5B5DhwrlDxsYQ3wTqGKoo
 tl/Tqaz6zYPScHb1WWULi1QSKdcTUd6rJi1lfl7njBI5S48ulo7ZqtY8ljuokbZG6vFHeUmi5
 dRp3yhAluO/M9XvyQ1PMIop6lgTH1YdxbXROBk48FbCe6K6aGHWoYhBIh/aYUTTNgdrZreBiD
 d4tEKweu7ZsbYbMrbcUuxk6cwHkAcU4KiM2ux1AALq9D51+xFnsXwX3sLjkn6hJdLskd186X5
 nAhmEuYcb7MnoiAOOv3WDlNbTJ9ewCh82N1J2PS0IbKHBlQU6uVmHG3b9gTNNTwcHu9a6rFjN
 a2ovzOzKLSDdWfmAw6B4p9m6nN7wTMN3DAm9rqgQ6nyghjUgg2s1YbddtQiK3Xor9sp6xjfbg
 hGvLWwPgjOhrvGT0k4E5veu8V5wi1NikcQB656On7/8RjcH8m4TpuG8OplhGPBBx0Ssb3EV5h
 +N7WfNq/1vPfUrrjdHG00Z4MX80xwcFKSjHb1A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Without this header, we get a compilation error in some configurations:

drivers/staging/media/meson/vdec/vdec.c: In function 'vdec_recycle_thread':
drivers/staging/media/meson/vdec/vdec.c:59:10: error: implicit declaration of function 'kthread_should_stop' [-Werror=implicit-function-declaration]

Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/media/meson/vdec/vdec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 0a1a04fd5d13..eb335a0f2bdd 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/kthread.h>
 #include <linux/platform_device.h>
 #include <linux/mfd/syscon.h>
 #include <linux/slab.h>
-- 
2.20.0

