Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5431B1C86A6
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 12:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgEGKZt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 06:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725910AbgEGKZt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 06:25:49 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C32FC061A10;
        Thu,  7 May 2020 03:25:49 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id z6so1890840plk.10;
        Thu, 07 May 2020 03:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=eyQI8JLiukg5hsarHG9sBQAMSiRoxhwvfjPhjSw8K/o=;
        b=TtSTJiYO+U3hIwC0bLXhTg2Vy+Ka8M7YD6iWszwVE+AypowHMOiGM8fYUTj2omh78v
         T00iT/zY5mum9tpyN01TwjDP9hTqtaELLjZjB+MCwni1fFovJ2nyavfE6yKzSBOXtzHM
         cSNhSMCnKWK2IPrkNmwQl8L/hJ13W9v7+QV5g53lD2ogs6JcNLDRR2a5IwvQW6mrzPey
         fi69zYGUMeMpW+0gixXZTZ/PX3goIajW+QO6Nw7Lg6qdeeHez8LXbvKi+YnWYjy9vlNF
         71eTkl7qIgZOO3v8VLyJaOQbzusevYANrhUngDBHumQVqsQuJZ/xvuU2fPAM/QClCJRM
         WBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=eyQI8JLiukg5hsarHG9sBQAMSiRoxhwvfjPhjSw8K/o=;
        b=RCkgH5IJnP1mlf3AhXWfugw4DJyMuoHrvJaadu9UpHA7G8z9fStMRZR8zdNmY9AXtJ
         WvRa06kmoHE0CqrI1WEHthPDK5ZpGhjhERnp9E2XaUFM0hxTPpfCDT5kjvD2GYDld1yK
         j0DtUVAB0rKa0jfDeho8udWPyVA9FnuLuX1QryD1vmewXNymRWD+SteRKFBx5xgwcp9B
         BR/44+3/cQ8FYvByno3MSPSR+8S5pFGqQjG6OIbaHuGOLYhrIjob0nPjNvyUfKGISO8i
         xZ/XPVRNtvAzpuqEXLCQTuiUnejLuEjO0jLm/Nm2AbQzdzwN84Vmybi5EZBBtoDkQ1pk
         6XKg==
X-Gm-Message-State: AGi0PuZdMNBDTREp12NF1Sd2J3c2TTM/crX7lmMEdquAIw1vXP9Rj23r
        jlJYblWTDt98Q2of6x6oeww=
X-Google-Smtp-Source: APiQypKtLMObouxK278qs8imSqkHllBxKT/Bz7CMJw4dBFbW2tzbNDXxr+1epqKk5H4jnl9GFfbnQw==
X-Received: by 2002:a17:902:bf46:: with SMTP id u6mr12150109pls.318.1588847148711;
        Thu, 07 May 2020 03:25:48 -0700 (PDT)
Received: from localhost.localdomain ([120.244.109.48])
        by smtp.gmail.com with ESMTPSA id w75sm4432029pfc.156.2020.05.07.03.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 03:25:48 -0700 (PDT)
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
To:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        allison@lohutok.net, tglx@linutronix.de, rfontana@redhat.com,
        tomasbortoli@gmail.com, sean@mess.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] media: usb: ttusb-dec: reduce the number of memory reads in ttusb_dec_handle_irq()
Date:   Thu,  7 May 2020 18:25:21 +0800
Message-Id: <20200507102521.17602-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In ttusb_dec_handle_irq(), buffer[4] is continuously read from memory 
three times, without being modified.
To reduce the number of memory reads, buffer[4] is first assigned to a
local variable index, and then index is used to replace buffer[4].

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
+	int index = buffer[4];
 
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

