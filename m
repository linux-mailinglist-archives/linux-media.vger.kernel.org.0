Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A4AB75463F
	for <lists+linux-media@lfdr.de>; Sat, 15 Jul 2023 04:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbjGOCQp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jul 2023 22:16:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbjGOCQo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jul 2023 22:16:44 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA0B62D68
        for <linux-media@vger.kernel.org>; Fri, 14 Jul 2023 19:16:43 -0700 (PDT)
Received: from db550.. (node-1w7jr9st5p2esmclet71ntnwp.ipv6.telus.net [IPv6:2001:569:beb1:1500:6f9d:3a5c:4d25:e949])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 8382B660702A;
        Sat, 15 Jul 2023 03:16:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1689387402;
        bh=LR1i34euy+PuxBNW2fCqH6Ji7RKAtDwdG3QlFMwrPcY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OsgBiWy7IihldXUgLxYLXa4KXIdvdGBWXu/Ea/5l94u/elBGBmAlzdhgL7njNob0E
         sDow3tT26ngGmlV/2UHm4Qzr3VOtnJZ4JX3lBfq44MNqOE2fI4rEGzsSCuzhrBEkpd
         fd1Qo+ZrbaIFh+t2b2koZEvousNTUFIBghcLCZLy/JwwyEfnzQgZaeUMQhGYyqLVYB
         mHQKpPh4sFtp+3ix97/Nc9s4FeDQN0rKD9Ne4zGQy1UQ4hPzQxoUndzggpOc/ZbrY4
         wyLpUb7VfL86BhL5QncjNMktt+U9I6ls7d0KJpMKOR0ZgK/ExSzIGyNyTbaoABW1g+
         z6IJPZ8qMiPMw==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, deborahbrouwer3563@gmail.com,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v3 12/13] media: bttv: use audio defaults for winfast2000
Date:   Fri, 14 Jul 2023 19:16:08 -0700
Message-Id: <60d4fcd4580dddece2291487683ea5e4b4f320eb.1689379982.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1689379982.git.deborah.brouwer@collabora.com>
References: <cover.1689379982.git.deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The winfast2000 card advertised rxsubchans that weren't compatible with
its default audmode. Just use the default audmode (V4L2_TUNER_MODE_MONO)
and default audio reception flag (V4L2_TUNER_SUB_MONO) for this card.
Fixes compliance test failures.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/media/pci/bt8xx/bttv-audio-hook.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-audio-hook.c b/drivers/media/pci/bt8xx/bttv-audio-hook.c
index da1914a20b81..b5d071835354 100644
--- a/drivers/media/pci/bt8xx/bttv-audio-hook.c
+++ b/drivers/media/pci/bt8xx/bttv-audio-hook.c
@@ -293,16 +293,8 @@ void winfast2000_audio(struct bttv *btv, struct v4l2_tuner *t, int set)
 {
 	unsigned long val;
 
-	if (!set) {
-		/* Not much to do here */
-		t->audmode = V4L2_TUNER_MODE_LANG1;
-		t->rxsubchans = V4L2_TUNER_SUB_MONO |
-				V4L2_TUNER_SUB_STEREO |
-				V4L2_TUNER_SUB_LANG1 |
-				V4L2_TUNER_SUB_LANG2;
-
+	if (!set)
 		return;
-	}
 
 	/*btor (0xc32000, BT848_GPIO_OUT_EN);*/
 	switch (t->audmode) {
-- 
2.40.1

