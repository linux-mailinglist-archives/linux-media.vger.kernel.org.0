Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9E73907E2
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 19:36:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233784AbhEYRiH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 13:38:07 -0400
Received: from m12-14.163.com ([220.181.12.14]:44649 "EHLO m12-14.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234123AbhEYRhy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 13:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=OdYXP
        pa0ZDQMtZGtyalDSl75BLbfhf57+2BhDu/Wwx8=; b=EsNhscowKKFUFKJKolUyb
        /NPI4Psb8ftmVQ+2JdePdIFhvmgsSKO+RLgycB9pXexkXmjb1oAQAxnje/Ed8Ow/
        uicjt8oTGaFtb6jZES4bOdXheM7+/Qks8RjEFaHUzUXiHXknNzfH2yLYVSG2wLWn
        zRXvAuslOlBH5ge9WiKNHY=
Received: from localhost.localdomain (unknown [218.17.89.92])
        by smtp10 (Coremail) with SMTP id DsCowAAHYW43x6xg3jaOKw--.45330S2;
        Tue, 25 May 2021 17:45:28 +0800 (CST)
From:   lijian_8010a29@163.com
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, ezequiel@collabora.com,
        laurent.pinchart@ideasonboard.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        lijian <lijian@yulong.com>
Subject: [PATCH] media: v4l2-dev.c: Modified the macro SET_VALID_IOCTL
Date:   Tue, 25 May 2021 17:41:48 +0800
Message-Id: <20210525094148.74300-1-lijian_8010a29@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsCowAAHYW43x6xg3jaOKw--.45330S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xry8Zr48KFW5XF17XFy7KFg_yoWkJrg_Wr
        1kuF97XryqyF10vw1qyw1rA34qva98uryruF9xtrs3JFy5Z3WUXr1vqry3trsrW3W7ZFn8
        XF9xWr1Ska48CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUexcTJUUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5olmxttqbyiikqdsmqqrwthudrp/xtbBLBOdUF++L6NhUAAAsu
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: lijian <lijian@yulong.com>

Macros starting with if should be enclosed by a do - while loop
to avoid possible if/else logic defects.
So modified the macro SET_VALID_IOCTL with do - while loop.

Signed-off-by: lijian <lijian@yulong.com>
---
 drivers/media/v4l2-core/v4l2-dev.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 7d0edf3530be..15067843456e 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -520,9 +520,8 @@ static int get_index(struct video_device *vdev)
 	return find_first_zero_bit(used, VIDEO_NUM_DEVICES);
 }
 
-#define SET_VALID_IOCTL(ops, cmd, op)			\
-	if (ops->op)					\
-		set_bit(_IOC_NR(cmd), valid_ioctls)
+#define SET_VALID_IOCTL(ops, cmd, op) \
+	do { if (ops->op) set_bit(_IOC_NR(cmd), valid_ioctls); } while (0)
 
 /* This determines which ioctls are actually implemented in the driver.
    It's a one-time thing which simplifies video_ioctl2 as it can just do
-- 
2.25.1

