Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6857C3AE03B
	for <lists+linux-media@lfdr.de>; Sun, 20 Jun 2021 22:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbhFTUZf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Jun 2021 16:25:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbhFTUZf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Jun 2021 16:25:35 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AD1FC061574;
        Sun, 20 Jun 2021 13:23:21 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id h15so8006157lfv.12;
        Sun, 20 Jun 2021 13:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SrBBo2xUqMg+tHTMzV3CujkK2QsqZ6Q4qMqTjzZFegg=;
        b=HlGF9uxQs68nba4LqCR2Bjp0sBHaVZwhQnhYZC0Lmf3oOA1MPmitB3j1yuDOEcaGK5
         ht4xiO9xiLu15evpkTFtM8VQ8CWGoavpJqX7RGU5r5hDWSlgLJuedCn6XfmS89mmOTGM
         zrTgdK6KPgHeG9La9U9TCl+C9z3s0MHA1+LxoCDZVtt8KenUeT09WGj92kl/yCC0yoWS
         nZ2yw8tE95/65wCeWaSKYt/vSr/rXabDCPTOmdYkzYY1vZxIHKPdSNfo+MKwmSPLXyl6
         1yys8+w9FPD8keqELQkdO2W3J+ZKlRPRfUCgW2SgztAhMdipNDHsaRAssDFJHbtRlNrt
         OOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SrBBo2xUqMg+tHTMzV3CujkK2QsqZ6Q4qMqTjzZFegg=;
        b=VMzyU/QVaOwG1jMkwQxtkWJldxK5ovur+q8EcfcyEuYY15axDimZHA7LeM6vGn/z7x
         1tJtGl6x347sFzd1pYnvu3GGGZ7AVWycNA9chFv09e8Sn2Rbye/izD/a0kZR1OzNyE0K
         9YvZN8lqLELaK53SYSFPOw+Al9m8O+sraKTD50P4EhevmvrTWvLAxQUPmK55NGYZuDlW
         WHEUKs223TaKnLAhWaTuHueSLpW4hXtcG7EhVzK4Wg6yL9jgiIEhVABUuhWA3TBVLXR7
         VSgH+sjsPsIN4kjKYCvYzcL42tNSdQhZmyrj6eI/OYULu1laN+uitnanO6+CdRxxm3Pq
         DglQ==
X-Gm-Message-State: AOAM530lFetzH29bjK3E1s3GeS9QO8+eQQe3WYky3MyAeTm+Fj6ZejWn
        F+oQmrqtR818qkOugh+mFCs+Wg/Wf8bG5Q==
X-Google-Smtp-Source: ABdhPJwAP9+SXSqKbrXAK8JnzRSD6FssxGxODNXRDurVODIrIXN00SPjSzpM7wOKrvqaNkpDJSMAgA==
X-Received: by 2002:a05:6512:3c83:: with SMTP id h3mr11553892lfv.80.1624220599915;
        Sun, 20 Jun 2021 13:23:19 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.24])
        by smtp.gmail.com with ESMTPSA id m18sm1880052ljg.105.2021.06.20.13.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 13:23:19 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     mchehab@kernel.org, tomimo@ncircle.nullnet.fi,
        thierry.merle@free.fr
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH] media: dvb-usb: fix memory leak in cinergyt2_frontend_attach
Date:   Sun, 20 Jun 2021 23:23:17 +0300
Message-Id: <20210620202317.4338-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

My local syzbot instance hit a memory leak in
cinergyt2_frontend_attach() [1].

The problem was in non-freed dvb_frontend in case of error.
If dvb_usb_generic_rw() call fails, an error will be returned from
cinergyt2_frontend_attach() [1] and num_adapters_initialized of
dvb_usb_device won't be incremented. That means dvb usb library
won't take care of freeing allocated frontend.

Fail log:
BUG: memory leak
unreferenced object 0xffff88801d9c6000 (size 2048):
  comm "kworker/1:3", pid 2960, jiffies 4295150569 (age 17.150s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 54 65 72 72 61 54 65 63  ........TerraTec
    2f 71 61 6e 75 20 55 53 42 32 2e 30 20 48 69 67  /qanu USB2.0 Hig
  backtrace:
    [<ffffffff85e169f0>] kmalloc include/linux/slab.h:556 [inline]
    [<ffffffff85e169f0>] kzalloc include/linux/slab.h:686 [inline]
    [<ffffffff85e169f0>] cinergyt2_fe_attach+0x40/0x110 drivers/media/usb/dvb-usb/cinergyT2-fe.c:271
    [<ffffffff85e15b31>] cinergyt2_frontend_attach+0x61/0x140 drivers/media/usb/dvb-usb/cinergyT2-core.c:74 [1]
    [<ffffffff85dcd71e>] dvb_usb_adapter_frontend_init+0x35e/0x5b0 drivers/media/usb/dvb-usb/dvb-usb-dvb.c:290
    [<ffffffff88f98e83>] dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:90 [inline]
    [<ffffffff88f98e83>] dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:184 [inline]

Fixes: 986bd1e58b18 ("V4L/DVB (9107): Alternative version of Terratec Cinergy T2
driver")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/media/usb/dvb-usb/cinergyT2-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/dvb-usb/cinergyT2-core.c b/drivers/media/usb/dvb-usb/cinergyT2-core.c
index 969a7ec71dff..fb60af097535 100644
--- a/drivers/media/usb/dvb-usb/cinergyT2-core.c
+++ b/drivers/media/usb/dvb-usb/cinergyT2-core.c
@@ -79,6 +79,7 @@ static int cinergyt2_frontend_attach(struct dvb_usb_adapter *adap)
 	ret = dvb_usb_generic_rw(d, st->data, 1, st->data, 3, 0);
 	if (ret < 0) {
 		deb_rc("cinergyt2_power_ctrl() Failed to retrieve sleep state info\n");
+		kfree(adap->fe_adap[0].fe);
 	}
 	mutex_unlock(&d->data_mutex);
 
-- 
2.32.0

