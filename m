Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECD7E1C5916
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 16:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730256AbgEEOV4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 10:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729256AbgEEOV4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 10:21:56 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B45C061A0F;
        Tue,  5 May 2020 07:21:56 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 207so1086068pgc.6;
        Tue, 05 May 2020 07:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=cPehjVZlHj3aHIpwlaH11wYRizkllSVBKTyEpG1u9o8=;
        b=cQe6rtuYwQupTWb2O+AmXwy/AngOD5Gs7e004xd9rHZ8q0lFfYjREUPKhrReYPNq+y
         Y+LFSx278dRQWd4kuh6dz9PX70JoD+PBkFrX6cAgBKSl4eIl8dSUWj6XCkiKYL3aa9bC
         Bcxyclf2McA4goDo32h13h1kKMPxHbcRadw7TI9B2ynWCS8Jn2urb3BxH0ZiShuakOh0
         M0NZgA9Ejv2g1rHRUcvXf+CSBa16TUnzfCJeOOGNoqOPgvMAOb1ry/qz6qOe9fa45sDl
         9LNqnq714nyPQ17T8yZ4QlvQRvh7rb5qewA3WdIXi01mf/9V7W/X1Vs3HopzbBLiKtrn
         2baA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cPehjVZlHj3aHIpwlaH11wYRizkllSVBKTyEpG1u9o8=;
        b=QK82PuiXB3KVWcJwb8IbpPerj0OO0ragzm8yRVGpaBDy6QzJ7Fzche4GGlpy7kbteV
         mqSE2E9hIahwu0UZFttXozbjEEEzXU2wG/2mcIRwDd5hAjuvHK/53HUswmxYoOJfnPu9
         AHz/JCUbeHgYsj27APY/UhrxLCcGN0v6JI+5UB4KdimOgUPKM+anrW4aFQRC449s+ziM
         CSQIbg0P+ofVMkelzWe1cCltP+iBMIDxejO0/0kB1rs/ns4lpCbEkw3cV8wT9Rf84RE6
         ogE2jQpZ/xiC3boW7FmH/f/UGaqNDecrRROqoOuq6p1TeLDAMhQoUpdnPSrCEEESuCWy
         LTKw==
X-Gm-Message-State: AGi0PubosorSy67EL2Kp7o5ldTMDPR7RnVTN5dymRZlgGY3MF3JQWQ1D
        LwslKdI5SR+zvL2vZSlsfuc=
X-Google-Smtp-Source: APiQypLEf1iEWLOIV3zKy//l6iBpXlZXz4d2EO3uWFl2oLEiwZOq4ELIBlobuJS0yMohcdO7rPPZow==
X-Received: by 2002:a63:8d4b:: with SMTP id z72mr2992726pgd.376.1588688515628;
        Tue, 05 May 2020 07:21:55 -0700 (PDT)
Received: from localhost.localdomain ([120.244.110.63])
        by smtp.gmail.com with ESMTPSA id o63sm2235060pjb.40.2020.05.05.07.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 07:21:55 -0700 (PDT)
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
To:     mchehab@kernel.org, kstewart@linuxfoundation.org,
        tomasbortoli@gmail.com, gregkh@linuxfoundation.org, sean@mess.org,
        allison@lohutok.net, tglx@linutronix.de
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] media: usb: ttusb-dec: avoid buffer overflow in ttusb_dec_handle_irq() when DMA failures/attacks occur
Date:   Tue,  5 May 2020 22:21:10 +0800
Message-Id: <20200505142110.7620-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In ttusb_dec_init_usb():
  dec->irq_buffer = usb_alloc_coherent(...)

Thus, "dec->irq_buffer" is a DMA value, and it is assigned to "buffer"
in ttusb_dec_handle_irq():
  char *buffer = dec->irq_buffer;

When DMA failures or attacks occur, the value of buffer[4] can be
changed at any time. In this case, "buffer[4] - 1 < ARRAY_SIZE(rc_keys)"
can be first satisfied, and then the value of buffer[4] can be changed
to a large number, causing a buffer-overflow vulnerability.

To avoid the risk of this vulnerability, buffer[4] is assigned to a
non-DMA local variable "index" at the beginning of
ttusb_dec_handle_irq(), and then this variable replaces each use of
buffer[4] in the function.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/media/usb/ttusb-dec/ttusb_dec.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c b/drivers/media/usb/ttusb-dec/ttusb_dec.c
index 3198f9624b7c..8543c552515b 100644
--- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
+++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
@@ -250,6 +250,7 @@ static void ttusb_dec_handle_irq( struct urb *urb)
 	struct ttusb_dec *dec = urb->context;
 	char *buffer = dec->irq_buffer;
 	int retval;
+	u8 index = buffer[4];
 
 	switch(urb->status) {
 		case 0: /*success*/
@@ -281,11 +282,11 @@ static void ttusb_dec_handle_irq( struct urb *urb)
 		 * this should/could be added later ...
 		 * for now lets report each signal as a key down and up
 		 */
-		if (buffer[4] - 1 < ARRAY_SIZE(rc_keys)) {
-			dprintk("%s:rc signal:%d\n", __func__, buffer[4]);
-			input_report_key(dec->rc_input_dev, rc_keys[buffer[4] - 1], 1);
+		if (index - 1 < ARRAY_SIZE(rc_keys)) {
+			dprintk("%s:rc signal:%d\n", __func__, index);
+			input_report_key(dec->rc_input_dev, rc_keys[index - 1], 1);
 			input_sync(dec->rc_input_dev);
-			input_report_key(dec->rc_input_dev, rc_keys[buffer[4] - 1], 0);
+			input_report_key(dec->rc_input_dev, rc_keys[index - 1], 0);
 			input_sync(dec->rc_input_dev);
 		}
 	}
-- 
2.17.1

