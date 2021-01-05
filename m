Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C456F2EA63A
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 09:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727365AbhAEIAk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 03:00:40 -0500
Received: from mail.zju.edu.cn ([61.164.42.155]:56306 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726097AbhAEIAk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 Jan 2021 03:00:40 -0500
Received: from localhost.localdomain (unknown [222.205.25.254])
        by mail-app3 (Coremail) with SMTP id cC_KCgAXbthKHPRfU0UJAA--.6516S4;
        Tue, 05 Jan 2021 15:59:10 +0800 (CST)
From:   Dinghao Liu <dinghao.liu@zju.edu.cn>
To:     dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Michel Lespinasse <walken@google.com>,
        Ricardo Cerqueira <v4l@cerqueira.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: v4l2: Fix memleak in videobuf_read_one
Date:   Tue,  5 Jan 2021 15:59:02 +0800
Message-Id: <20210105075904.27102-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cC_KCgAXbthKHPRfU0UJAA--.6516S4
X-Coremail-Antispam: 1UD129KBjvJXoW7KryUtF4xCr13Cr4DWrWUtwb_yoW8GFykpF
        Z0yry3CryUWw1xC3Z7JFnrW3s8K34ktFWrurWxKw1fCw15Jwn3Xa48Ga4UWrWkCanrtF1Y
        qr1DAr95CF45ZF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9q1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
        w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
        IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW0oVCq3wA2z4x0Y4vEx4A2
        jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
        x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWU
        GwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
        8JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCY02Avz4vE
        14v_GF4l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uw4UJr1UMxC20s026x
        CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
        JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
        1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_
        WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
        4UJbIYCTnIWIevJa73UjIFyTuYvjfUYMKZDUUUU
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgMQBlZdtR1gpwAGs1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When videobuf_waiton() fails, we should execute clean
functions to prevent memleak. It's the same when
__videobuf_copy_to_user() fails.

Fixes: 7a7d9a89d0307 ("V4L/DVB (6251): Replace video-buf to a more generic approach")
Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/media/v4l2-core/videobuf-core.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/videobuf-core.c b/drivers/media/v4l2-core/videobuf-core.c
index 606a271bdd2d..0709b75d11cd 100644
--- a/drivers/media/v4l2-core/videobuf-core.c
+++ b/drivers/media/v4l2-core/videobuf-core.c
@@ -924,8 +924,12 @@ ssize_t videobuf_read_one(struct videobuf_queue *q,
 
 	/* wait until capture is done */
 	retval = videobuf_waiton(q, q->read_buf, nonblocking, 1);
-	if (0 != retval)
+	if (retval != 0) {
+		q->ops->buf_release(q, q->read_buf);
+		kfree(q->read_buf);
+		q->read_buf = NULL;
 		goto done;
+	}
 
 	CALL(q, sync, q, q->read_buf);
 
@@ -940,8 +944,12 @@ ssize_t videobuf_read_one(struct videobuf_queue *q,
 
 	/* Copy to userspace */
 	retval = __videobuf_copy_to_user(q, q->read_buf, data, count, nonblocking);
-	if (retval < 0)
+	if (retval < 0) {
+		q->ops->buf_release(q, q->read_buf);
+		kfree(q->read_buf);
+		q->read_buf = NULL;
 		goto done;
+	}
 
 	q->read_off += retval;
 	if (q->read_off == q->read_buf->size) {
-- 
2.17.1

