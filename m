Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 309E13EC229
	for <lists+linux-media@lfdr.de>; Sat, 14 Aug 2021 12:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237850AbhHNK65 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Aug 2021 06:58:57 -0400
Received: from m12-16.163.com ([220.181.12.16]:58512 "EHLO m12-16.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229919AbhHNK64 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Aug 2021 06:58:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=geV4Y
        LFYGoxJq/Dmh5var0NpU95VmA1N39ebsj9UzJM=; b=nGbRMpBGWJfnNEiLb8vwx
        yOGcXJwC9liKs+U6+gXhD+UdOvRrhK6YiQtbGAza806aZOVaKFEhqN95bIZFyPaN
        jWGTc83m1oqdjZqgtptALmvnnEathSt9fIEHeou+oPdpPJbKUKM7SPAF/gJHSLzM
        aob8k908aHaxL+4dvMYbro=
Received: from nilus-desk (unknown [120.229.1.29])
        by smtp12 (Coremail) with SMTP id EMCowAAX+TjOoRdhVyMF7g--.6555S3;
        Sat, 14 Aug 2021 18:58:23 +0800 (CST)
Date:   Sat, 14 Aug 2021 18:58:22 +0800
From:   Nil Yi <teroincn@163.com>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Subject: [PATCH] media: usb: tm6000:clear the freed pointer
Message-ID: <20210814105822.GA67154@nilus-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CM-TRANSID: EMCowAAX+TjOoRdhVyMF7g--.6555S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrWrCrW3WF4fJF1rCF4xtFb_yoW3AFX_Cr
        ykur4DWryjqrn8Kw1xtwnxZr90kFs7ZFyxZFnxt3yrGF1jkF1Y9rWDZF4xJw1kuFy2yF98
        Zr9xKFyrWr12gjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8vApUUUUUU==
X-Originating-IP: [120.229.1.29]
X-CM-SenderInfo: 5whu0xxqfqqiywtou0bp/1tbi3xDuEmB0HLnzsgAAsD
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After free the ir->int_urb, the pointer need to
be set to NULL.

Signed-off-by: Nil Yi <teroincn@163.com>
---
 drivers/media/usb/tm6000/tm6000-input.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/tm6000/tm6000-input.c b/drivers/media/usb/tm6000/tm6000-input.c
index 84602edf3..49acb97ca 100644
--- a/drivers/media/usb/tm6000/tm6000-input.c
+++ b/drivers/media/usb/tm6000/tm6000-input.c
@@ -346,6 +346,7 @@ static int __tm6000_ir_int_start(struct rc_dev *rc)
 	ir->int_urb->transfer_buffer = kzalloc(size, GFP_ATOMIC);
 	if (!ir->int_urb->transfer_buffer) {
 		usb_free_urb(ir->int_urb);
+		ir->int_urb = NULL;
 		return err;
 	}
 	dprintk(1, "int interval: %d\n", dev->int_in.endp->desc.bInterval);
-- 
2.17.1


