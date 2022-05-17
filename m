Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 095A052A016
	for <lists+linux-media@lfdr.de>; Tue, 17 May 2022 13:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345019AbiEQLKX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 07:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345282AbiEQLJj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 07:09:39 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4BC51A39F
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 04:09:07 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 8617D21D0D;
        Tue, 17 May 2022 11:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1652785746; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=4fuZ/g8RT2KaTqMLEcydGPjqFuQuDXeKFrTesiV9+ao=;
        b=BAryVy2h8hr2Cf5GpT6QOukyYX06hDWvdun4/xMjKnGeyYnN9clVE0xJ38k7ZeIavmbEfq
        7edwjtwW9L0ITmAGUgUZZ+ym2njMrAxbBn8eO/IQSaX3crW5P+ijSDzi1i3PV8RB0s64I/
        lEaXwrLhaj0DrqilHwwY8mcsF9rS/8o=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 56CB613AA2;
        Tue, 17 May 2022 11:09:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id YmZ4E1KCg2LHaAAAMHmgww
        (envelope-from <oneukum@suse.com>); Tue, 17 May 2022 11:09:06 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     linux-media@vger.kernel.org, mchehab@kernel.org, crope@iki.fi
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] airspy: respect the DMA coherency rules
Date:   Tue, 17 May 2022 13:09:03 +0200
Message-Id: <20220517110903.25491-1-oneukum@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If we want to avoid memory corruption
on incoherent architectures, buffers for DMA
must not reside
- on the stack
- embedded within other structures

Allocate them separately.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/usb/airspy/airspy.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
index d568452618d1..ed560e594efb 100644
--- a/drivers/media/usb/airspy/airspy.c
+++ b/drivers/media/usb/airspy/airspy.c
@@ -123,7 +123,7 @@ struct airspy {
 
 	/* USB control message buffer */
 	#define BUF_SIZE 128
-	u8 buf[BUF_SIZE];
+	u8 *buf;
 
 	/* Current configuration */
 	unsigned int f_adc;
@@ -856,6 +856,7 @@ static void airspy_video_release(struct v4l2_device *v)
 
 	v4l2_ctrl_handler_free(&s->hdl);
 	v4l2_device_unregister(&s->v4l2_dev);
+	kfree(s->buf);
 	kfree(s);
 }
 
@@ -963,7 +964,7 @@ static int airspy_probe(struct usb_interface *intf,
 {
 	struct airspy *s;
 	int ret;
-	u8 u8tmp, buf[BUF_SIZE];
+	u8 u8tmp, *buf = NULL;
 
 	s = kzalloc(sizeof(struct airspy), GFP_KERNEL);
 	if (s == NULL) {
@@ -971,6 +972,13 @@ static int airspy_probe(struct usb_interface *intf,
 		return -ENOMEM;
 	}
 
+	s->buf = kzalloc(BUF_SIZE, GFP_KERNEL);
+	if (!s->buf)
+		goto err_free_mem;
+	buf = kzalloc(BUF_SIZE, GFP_KERNEL);
+	if (!buf)
+		goto err_free_mem;
+
 	mutex_init(&s->v4l2_lock);
 	mutex_init(&s->vb_queue_lock);
 	spin_lock_init(&s->queued_bufs_lock);
@@ -1068,6 +1076,8 @@ static int airspy_probe(struct usb_interface *intf,
 	v4l2_ctrl_handler_free(&s->hdl);
 	v4l2_device_unregister(&s->v4l2_dev);
 err_free_mem:
+	kfree(buf);
+	kfree(s->buf);
 	kfree(s);
 	return ret;
 }
-- 
2.35.3

