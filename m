Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98240F8B9B
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 10:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727142AbfKLJWi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 04:22:38 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:48613 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727113AbfKLJWi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 04:22:38 -0500
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id USNYib7EmQBsYUSNbiAWsk; Tue, 12 Nov 2019 10:22:31 +0100
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        syzbot+32310fc2aea76898d074@syzkaller.appspotmail.com,
        syzbot+99706d6390be1ac542a2@syzkaller.appspotmail.com,
        syzbot+64437af5c781a7f0e08e@syzkaller.appspotmail.com
Subject: [PATCH 1/5] gspca: zero usb_buf
Date:   Tue, 12 Nov 2019 10:22:24 +0100
Message-Id: <20191112092228.15800-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112092228.15800-1-hverkuil-cisco@xs4all.nl>
References: <20191112092228.15800-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfAp2Ur2fDuqphm8JVUep51Qv9YrmE410jqLEkJhAtuuVozpejR0H5p46yO2llTYD5gNidG6LHLCW+Tri7kAsdWGe3QkhJlenyp1cYKZrbrAYEJRZl1aL
 jLiijHCMaSWnV1Ccg2kATR3zv81Z0A+CPBN7byg9fQdooBzEf7T91pcgh/EQ/6UjuM9rOY28j6bl+MHcLFs/UvH80gjvJKs7lQMzSP4YH48j08dri0tH6YBA
 godWun84K0f7QdW58FhMsLEmIrtrHcK1KKgD6K7vcLkASYfZ86Ea/ZZz7K1aSqjkAdX04WdpBt6lMhFBlYYOitU8YAlIs71fxUVJHMLuXZcf1lgvsh0t2S3T
 V6LU3/MSLpCv2S96YigGNOl0cMnIqpBJ8g3B6RGeCtWdu51ppToQJ/bZE6PakqNBWtFJAv+MLruqJGqBLC7iwI+f8KkgkC2eNv+be7GAqdiudmsmjFI=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allocate gspca_dev->usb_buf with kzalloc instead of kmalloc to
ensure it is property zeroed. This fixes various syzbot errors
about uninitialized data.

Syzbot links:

https://syzkaller.appspot.com/bug?extid=32310fc2aea76898d074
https://syzkaller.appspot.com/bug?extid=99706d6390be1ac542a2
https://syzkaller.appspot.com/bug?extid=64437af5c781a7f0e08e

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-and-tested-by: syzbot+32310fc2aea76898d074@syzkaller.appspotmail.com
Reported-and-tested-by: syzbot+99706d6390be1ac542a2@syzkaller.appspotmail.com
Reported-and-tested-by: syzbot+64437af5c781a7f0e08e@syzkaller.appspotmail.com
---
 drivers/media/usb/gspca/gspca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
index 4add2b12d330..c1b307bbe540 100644
--- a/drivers/media/usb/gspca/gspca.c
+++ b/drivers/media/usb/gspca/gspca.c
@@ -1461,7 +1461,7 @@ int gspca_dev_probe2(struct usb_interface *intf,
 		pr_err("couldn't kzalloc gspca struct\n");
 		return -ENOMEM;
 	}
-	gspca_dev->usb_buf = kmalloc(USB_BUF_SZ, GFP_KERNEL);
+	gspca_dev->usb_buf = kzalloc(USB_BUF_SZ, GFP_KERNEL);
 	if (!gspca_dev->usb_buf) {
 		pr_err("out of memory\n");
 		ret = -ENOMEM;
-- 
2.24.0

