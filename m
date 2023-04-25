Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F169C6ED936
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 02:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232829AbjDYALH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 20:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232808AbjDYALG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 20:11:06 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D70009741
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 17:10:58 -0700 (PDT)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 911B1660329B;
        Tue, 25 Apr 2023 01:10:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1682381457;
        bh=ezPcahJid2DeHKTa/sdsqyQoylInWbto3ILhAu2h52k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=C1VkkMvIrbEY51tyJax7WezYGSUQCkvKzKM/wpc4rvzqMTjEosSm4Xq2Z+fuFmEXb
         eCyZNZRgvVjDN4uUUWH9694me0McGcW0YlFwtaTkOxve45EYeY/a8VjkvOQnP3NLb6
         POQDePDRzUzirMs+jXgSflYTeCISEqdEnLtAukyU/U2zQh93wYJd4ASqp92rkCoJme
         /vUbhbyG1f+F7awhsDSF8xCjK0rngpCrfEDPbNcevErXgB8kGF2gXTO1WUr276JcCx
         5w/GOskDAhrsGlTbH0FCwSoJlEse/j+ZAu0jIUxEsyfSuGS/LavhZaRuJvmHYY9OBD
         x+WpZcI5TJcRg==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 12/13] media: bttv: use audio defaults for winfast2000
Date:   Mon, 24 Apr 2023 17:10:11 -0700
Message-Id: <e528f0ac2ae58faa159d5f8740e1f2a2fe909208.1682379348.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1682379348.git.deborah.brouwer@collabora.com>
References: <cover.1682379348.git.deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
2.39.2

