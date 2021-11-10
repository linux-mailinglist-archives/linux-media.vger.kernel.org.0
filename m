Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D974244BE07
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 10:49:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbhKJJwm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 04:52:42 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:58192 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229653AbhKJJwl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 04:52:41 -0500
Received: from localhost.localdomain (unknown [124.16.141.244])
        by APP-03 (Coremail) with SMTP id rQCowACnr6uplYth71WhBg--.484S2;
        Wed, 10 Nov 2021 17:49:30 +0800 (CST)
From:   Xu Wang <vulab@iscas.ac.cn>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: Remove unneeded null check
Date:   Wed, 10 Nov 2021 09:49:10 +0000
Message-Id: <20211110094910.67951-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowACnr6uplYth71WhBg--.484S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF1xtr45Cr1xKr4rGr48JFb_yoW8Aw48pF
        18XFnxArWkXr1xWasxAF1xXas8Zws3tF1UKrWfJa4Iyr1ay3s2vF4fKa48tF1j9395Aw1U
        CFn8Ar9rur4DuF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkab7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVW8uwCF04k2
        0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIx
        AIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
        x4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jr189UUUUU=
X-Originating-IP: [124.16.141.244]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCgkBA1z4kHl9UAAAsh
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In ia_css_frame_map, the check of 'err' is unneeded to be done twice.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 .../atomisp/pci/runtime/frame/src/frame.c     | 32 +++++++++----------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index 10c4907187d9..529decf3f57f 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -168,25 +168,23 @@ int ia_css_frame_map(struct ia_css_frame **frame,
 	if (err)
 		return err;
 
-	if (!err) {
-		if (pgnr < ((PAGE_ALIGN(me->data_bytes)) >> PAGE_SHIFT)) {
-			dev_err(atomisp_dev,
-				"user space memory size is less than the expected size..\n");
-			err = -ENOMEM;
-			goto error;
-		} else if (pgnr > ((PAGE_ALIGN(me->data_bytes)) >> PAGE_SHIFT)) {
-			dev_err(atomisp_dev,
-				"user space memory size is large than the expected size..\n");
-			err = -ENOMEM;
-			goto error;
-		}
+	if (pgnr < ((PAGE_ALIGN(me->data_bytes)) >> PAGE_SHIFT)) {
+		dev_err(atomisp_dev,
+			"user space memory size is less than the expected size..\n");
+		err = -ENOMEM;
+		goto error;
+	} else if (pgnr > ((PAGE_ALIGN(me->data_bytes)) >> PAGE_SHIFT)) {
+		dev_err(atomisp_dev,
+			"user space memory size is large than the expected size..\n");
+		err = -ENOMEM;
+		goto error;
+	}
 
-		me->data = hmm_alloc(me->data_bytes, HMM_BO_USER, 0, data,
-				     attribute & ATOMISP_MAP_FLAG_CACHED);
+	me->data = hmm_alloc(me->data_bytes, HMM_BO_USER, 0, data,
+			     attribute & ATOMISP_MAP_FLAG_CACHED);
 
-		if (me->data == mmgr_NULL)
-			err = -EINVAL;
-	}
+	if (me->data == mmgr_NULL)
+		err = -EINVAL;
 
 error:
 	if (err) {
-- 
2.25.1

