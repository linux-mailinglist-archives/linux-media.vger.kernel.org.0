Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2ADC39140E
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 11:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233375AbhEZJuH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 05:50:07 -0400
Received: from m12-12.163.com ([220.181.12.12]:37409 "EHLO m12-12.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233348AbhEZJuG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 05:50:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=YxOm6
        DHuFZFQ0I2jcKEP4n+Ouc0/6ud2y9Z9N7Lct7s=; b=oklor4E/3RzqD7t5Jy9yB
        mOgBMPohaZb15dYVN16z+rfVnkXEEqn3xrhSSbweRL6R0BloCb84P6VrA6z+HmR1
        jlyHnwGUAZjUe7YtuIQ16BIVzNSs94j0KwJnQBK/qk15WAIWptrqMfTxgER0mU4/
        MFtp1jiyaUlnGuUM+N+p2g=
Received: from localhost.localdomain (unknown [218.17.89.92])
        by smtp8 (Coremail) with SMTP id DMCowACXExFdGa5gNPo4GQ--.4454S2;
        Wed, 26 May 2021 17:48:15 +0800 (CST)
From:   lijian_8010a29@163.com
To:     mchehab@kernel.org, akpm@linux-foundation.org,
        daniel.m.jordan@oracle.com, rppt@kernel.org, walken@google.com,
        vbabka@suse.cz
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        lijian <lijian@yulong.com>
Subject: [PATCH] media: videobuf-dma-sg: void function return statements are not generally useful
Date:   Wed, 26 May 2021 17:47:12 +0800
Message-Id: <20210526094712.95681-1-lijian_8010a29@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMCowACXExFdGa5gNPo4GQ--.4454S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw18Zr1fXryxtF4xXr47Jwb_yoW3JFc_Z3
        4kua4xXrWDtw4jyw1UK3y3A34jy3yxuFn7KF97t3y3JrWUJayYyr1UZr10grn2vFnFvas8
        WFs8WF18CayfCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5j-e7UUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5olmxttqbyiikqdsmqqrwthudrp/xtbBLBOdUF++L6NhUAACss
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: lijian <lijian@yulong.com>

void function videobuf_vm_close return statements are not generally useful,
so deleted the return in function videobuf_vm_close().

Signed-off-by: lijian <lijian@yulong.com>
---
 drivers/media/v4l2-core/videobuf-dma-sg.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/v4l2-core/videobuf-dma-sg.c b/drivers/media/v4l2-core/videobuf-dma-sg.c
index 8dd0562de287..f75e5eedeee0 100644
--- a/drivers/media/v4l2-core/videobuf-dma-sg.c
+++ b/drivers/media/v4l2-core/videobuf-dma-sg.c
@@ -423,7 +423,6 @@ static void videobuf_vm_close(struct vm_area_struct *vma)
 		videobuf_queue_unlock(q);
 		kfree(map);
 	}
-	return;
 }
 
 /*
-- 
2.25.1


