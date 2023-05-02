Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E31766F3C6A
	for <lists+linux-media@lfdr.de>; Tue,  2 May 2023 05:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233481AbjEBD2V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 May 2023 23:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233418AbjEBD2N (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 May 2023 23:28:13 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B773C3E
        for <linux-media@vger.kernel.org>; Mon,  1 May 2023 20:28:10 -0700 (PDT)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 7D8D0660321C;
        Tue,  2 May 2023 04:28:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1682998089;
        bh=ezPcahJid2DeHKTa/sdsqyQoylInWbto3ILhAu2h52k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OOczpFI+ZSATNl5/8KxCg09t1qjfJoW+JyM38N6AYzHemsZtD+xdUbYMXrs97ptyI
         3/slR7wnRvwTOFo10M1MPrp6poWKS0XXFEjJN/XB+HYpT/u7uRdPu+50uUr1ohJ9kQ
         lTK8FDJhz7j9rqtHkDL3/7TiFG634vDZ98nj1dWCCnCmdwgtkunaAiubaFPSvi8mrB
         eHEizm7/k9PvXpXty9hZlqH/9dUsVWb+/7LrZGnzTLdm7gWDn9nCeejWKy8rkJozm4
         bkBX6deiSte/2XVx93ydOn/w5+MSqQP9oYapFNNfh29FMOTc9pveDtPMupvtDqoXej
         0J5c3Vw1+IXAg==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 12/13] media: bttv: use audio defaults for winfast2000
Date:   Mon,  1 May 2023 20:27:30 -0700
Message-Id: <66195dcffd1907d3a383161d004f06142b0479f6.1682995256.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1682995256.git.deborah.brouwer@collabora.com>
References: <cover.1682995256.git.deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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

