Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2BC938B117
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 16:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242471AbhETOKb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 10:10:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:40170 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243616AbhETOI6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 10:08:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 30A9F6100A;
        Thu, 20 May 2021 14:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621519657;
        bh=kupeuC3n1iiW2j6FKJGOOkSeMKpo8aC3un0J8hxf1dE=;
        h=From:To:Cc:Subject:Date:From;
        b=hbyduGdIsTpVSoRO0aqi2DtqNgIzox5oEZrtJ6GgJgUltGln34z4MwzsQiFH+4Ank
         X2ypjmIBRfdjmo/Dikeeuj7Beg9RB5m6k/CQyGtTEBTumrIANg/E8tbQ8sD8YnWLCk
         67Gq6lfmZoTwUDbIhP6wRvbaQoQOlVWsM2IYfzPxBgyTpUNvOF3a7t+M6auUruB7jX
         TMRYoUL5wu+Hroxccq9PrYUPE5rwTKRB7tI7pJRdY6AQIdQz0eeEhOaaRf+gPRHS75
         RpybM68Z4VMSpGOFprRceWderdUFJxMGkMwk+O8wJkbeKRZyzTbJ40wEfR6NIYgiNj
         ez53B3SSmjlVQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1ljjKo-0009jn-QX; Thu, 20 May 2021 16:07:34 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH] media: davinci: fix two kernel-doc comments
Date:   Thu, 20 May 2021 16:07:33 +0200
Message-Id: <89cf71e62cd39da12e7a6e36ae6db126391ca9e2.1621519649.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A typo there is causing two warnings:
	drivers/media/platform/davinci/vpif_display.c:114: warning: Function parameter or member 'nplanes' not described in 'vpif_buffer_queue_setup'
	drivers/media/platform/davinci/vpif_capture.c:112: warning: Function parameter or member 'nplanes' not described in 'vpif_buffer_queue_setup'

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/davinci/vpif_capture.c | 2 +-
 drivers/media/platform/davinci/vpif_display.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
index 8d2e165bf7de..c034e25dd9aa 100644
--- a/drivers/media/platform/davinci/vpif_capture.c
+++ b/drivers/media/platform/davinci/vpif_capture.c
@@ -99,7 +99,7 @@ static int vpif_buffer_prepare(struct vb2_buffer *vb)
  * vpif_buffer_queue_setup : Callback function for buffer setup.
  * @vq: vb2_queue ptr
  * @nbuffers: ptr to number of buffers requested by application
- * @nplanes:: contains number of distinct video planes needed to hold a frame
+ * @nplanes: contains number of distinct video planes needed to hold a frame
  * @sizes: contains the size (in bytes) of each plane.
  * @alloc_devs: ptr to allocation context
  *
diff --git a/drivers/media/platform/davinci/vpif_display.c b/drivers/media/platform/davinci/vpif_display.c
index e5f61d9b221d..59f6b782e104 100644
--- a/drivers/media/platform/davinci/vpif_display.c
+++ b/drivers/media/platform/davinci/vpif_display.c
@@ -101,7 +101,7 @@ static int vpif_buffer_prepare(struct vb2_buffer *vb)
  * vpif_buffer_queue_setup : Callback function for buffer setup.
  * @vq: vb2_queue ptr
  * @nbuffers: ptr to number of buffers requested by application
- * @nplanes:: contains number of distinct video planes needed to hold a frame
+ * @nplanes: contains number of distinct video planes needed to hold a frame
  * @sizes: contains the size (in bytes) of each plane.
  * @alloc_devs: ptr to allocation context
  *
-- 
2.31.1

