Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E26834C0C0
	for <lists+linux-media@lfdr.de>; Mon, 29 Mar 2021 03:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbhC2BAR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Mar 2021 21:00:17 -0400
Received: from m12-18.163.com ([220.181.12.18]:37514 "EHLO m12-18.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229656AbhC2A7r (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Mar 2021 20:59:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=vcHDw
        UCJe7PHRRTdl0k7qv2/1oydeaTEJZCVUTrxpY8=; b=iqdAKgx4AEhdI/F9Y+UMw
        9QW0UUKrlcosvf4iXLM4WNMvj1f50kq/Zd1XioY9o2mofcqHUhN5bYuG8ItP+Or7
        0tmQCNxx+IDb7RfOHsn9lSr5gsn8e4IOYb3iBkMthjW9M7fjzTbqjKiFfiD+E6hY
        +hwNybqCEHCaF9L4wM1jPI=
Received: from localhost.localdomain (unknown [223.104.185.5])
        by smtp14 (Coremail) with SMTP id EsCowACXlfNnJmFg2lTRbA--.28547S2;
        Mon, 29 Mar 2021 08:59:20 +0800 (CST)
From:   Dianlong Li <dianlong_lee@163.com>
To:     mchehab+huawei@kernel.org
Cc:     linux-media@vger.kernel.org, Dianlong Li <dianlong_lee@163.com>
Subject: [PATCH] media: videobuf2: num_buffers should record the number of all buffers
Date:   Mon, 29 Mar 2021 08:59:17 +0800
Message-Id: <20210329005917.2201436-1-dianlong_lee@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EsCowACXlfNnJmFg2lTRbA--.28547S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruFW7uFyUKFy7ArWDuF1DGFg_yoWfurg_ur
        ykZ34xW345JF4ftw1UAFWrZ34vy3y5Jrn3WFnayrn3GryUAFWrJrn0qr1fWw1I9a1DZ3sr
        Zr4YqFW8ur45CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRu7KsPUUUUU==
X-Originating-IP: [223.104.185.5]
X-CM-SenderInfo: hgld0zprqjszlhh6il2tof0z/1tbiEQhkr17+3XPZ0wAAsW
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The variable q->num_buffers records the number of buffers previously
applied for, and the variable allocated_buffers records the number of
buffers applied for this time, so the total number should be the sum
of these two buffers.

Signed-off-by: Dianlong Li <dianlong_lee@163.com>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 4eab6d81cce1..2716c4138655 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -836,7 +836,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	}
 
 	mutex_lock(&q->mmap_lock);
-	q->num_buffers = allocated_buffers;
+	q->num_buffers += allocated_buffers;
 
 	if (ret < 0) {
 		/*
-- 
2.25.1


