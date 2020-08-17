Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96788246048
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 10:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728134AbgHQIdF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 04:33:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728364AbgHQIcw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 04:32:52 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0312C061388;
        Mon, 17 Aug 2020 01:32:52 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id i92so7644337pje.0;
        Mon, 17 Aug 2020 01:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BpUIfyiY1033QwITtcsFngj/BQQY04YlOMIFJZLa7+8=;
        b=ZOndhxRJ3kEbaFup5uwE3vRCh/fWHZK/tTXskLR+/ZHLmu2kJ6agoy8gcsU8BZgSbQ
         bNx+AiqivgU2wITRcKzE6YwQOFztZ+p5H6AWYfOGLc9MJkukU+jiVY2Db0tb+smV09Xb
         pFEC3viI/CDZFUzGwEsXRQm27W37vYPaM9vMxJdwMqjL79GhfzUjjug9fWzEe7wl4fQ5
         lVSJ+ALfHyMuXyDOR3awBvGAqPX62bNsMpC23qq/nVCDllUu5DgKd1ICkUt7Qk/PQ67F
         GtWE3HdpmEzQTDxHoW+ss2rkANsti/yv4L3PIgXpwW/FdOD5apQZWgjwj5pCPZraRxGP
         yBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BpUIfyiY1033QwITtcsFngj/BQQY04YlOMIFJZLa7+8=;
        b=FEjkldx3zP+W3AubP0vy0qaBYdn/GeMTw5r5eF5rJ/8/01j3tARTNsypbHuhUIjyyA
         wKKw9omtP9IvcwrjBxxL+IkSQRopI+O82MzCd/NZKAN1j4/x/nuqxq19tIJsMa1AwBLo
         u9mPcN65IPu17AQtenD+j8qZMEKAIIUmkS75Oq4eXLdJT0ntY4EP9NZLHqCyNrPjcEf1
         aQw3aEW6LNEr6sjvLW3xX4hv1aO9sx9Kv4F8XzW6LljOoCZxpvNr06lrERch5WWSJvSe
         5QYQa4fxNw2jAQxN+hPwQdxl3Az749/IQ2K7laHzlRpnfgZpipsSKqWkpXbrOPSNC0SG
         eWXg==
X-Gm-Message-State: AOAM530dRCiC41KqezXpM3CL/qn+KZmk5zzy/teJdqg6uHuF5s7aV6x0
        HBmhmwAu5WN+0xPtn3Piop0=
X-Google-Smtp-Source: ABdhPJwaWkqCYqUBJJSToCQOkC6GsGzRFgolzc1uotq1Pm6RULRT8DqLVDN3+wpVySp9QLmAIY3Wmg==
X-Received: by 2002:a17:902:968a:: with SMTP id n10mr10479044plp.67.1597653172452;
        Mon, 17 Aug 2020 01:32:52 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
        by smtp.gmail.com with ESMTPSA id b15sm18448351pft.116.2020.08.17.01.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 01:32:52 -0700 (PDT)
From:   Allen Pais <allen.lkml@gmail.com>
To:     mchehab@kernel.org, maintainers@bluecherrydvr.com,
        patrice.chotard@st.com
Cc:     keescook@chromium.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Allen Pais <allen.lkml@gmail.com>,
        Romain Perier <romain.perier@gmail.com>
Subject: [PATCH 11/11] media: ttusb-dec: convert tasklets to use new tasklet_setup() API
Date:   Mon, 17 Aug 2020 14:01:53 +0530
Message-Id: <20200817083153.22218-12-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817083153.22218-1-allen.lkml@gmail.com>
References: <20200817083153.22218-1-allen.lkml@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/media/usb/ttusb-dec/ttusb_dec.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c b/drivers/media/usb/ttusb-dec/ttusb_dec.c
index b8d39b2f777f..df6c5e4a0f05 100644
--- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
+++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
@@ -769,9 +769,9 @@ static void ttusb_dec_process_urb_frame(struct ttusb_dec *dec, u8 *b,
 	}
 }
 
-static void ttusb_dec_process_urb_frame_list(unsigned long data)
+static void ttusb_dec_process_urb_frame_list(struct tasklet_struct *t)
 {
-	struct ttusb_dec *dec = (struct ttusb_dec *)data;
+	struct ttusb_dec *dec = from_tasklet(dec, t, urb_tasklet);
 	struct list_head *item;
 	struct urb_frame *frame;
 	unsigned long flags;
@@ -1209,8 +1209,7 @@ static void ttusb_dec_init_tasklet(struct ttusb_dec *dec)
 {
 	spin_lock_init(&dec->urb_frame_list_lock);
 	INIT_LIST_HEAD(&dec->urb_frame_list);
-	tasklet_init(&dec->urb_tasklet, ttusb_dec_process_urb_frame_list,
-		     (unsigned long)dec);
+	tasklet_setup(&dec->urb_tasklet, ttusb_dec_process_urb_frame_list);
 }
 
 static int ttusb_init_rc( struct ttusb_dec *dec)
-- 
2.17.1

