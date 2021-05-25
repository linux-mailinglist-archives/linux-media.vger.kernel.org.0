Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67A3438F9F4
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 07:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbhEYFfn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 01:35:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbhEYFfm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 01:35:42 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9988AC061574;
        Mon, 24 May 2021 22:34:13 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id r1so6974751pgk.8;
        Mon, 24 May 2021 22:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zac22uAhz/Ss8FPGvYhFKLAp0Z8bAkUW4CspCmu4NcE=;
        b=kQYinu00gWIACsHG4Bo+fhR1pddPy5fh7cCWwHjxZTLSLGUTgKh7xMWG1N4dGzpHeh
         7MrDDqKCOk7XK22vY0U9wWWzteTDhcDQadwXfiuiRXFs5NPAWZB3jNMTPOsU9GxBSwcM
         l69mH0aGtKb7LnwiphP6jnNSazwq/uYTGeJzgVm+h9Yae/TJmXptD3wsbLxvWTqJfg93
         N1w0c1mSyGwspIPGEW76ZPGT/w4GYpKufkN0BjIK+a4gBpBi0eZ2E8yKmM/shtvV5PZ5
         3WOvorZyb3hyGUGJHnFt7ekzPuH7O0+b6maDg4qeWHUdyXxlX/LlyAj1oNWXXju6l1O1
         ZUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zac22uAhz/Ss8FPGvYhFKLAp0Z8bAkUW4CspCmu4NcE=;
        b=k4dDRSbbbnx8xtk8SYlKaqaeft8wKsdgWp8BSNTKH4Rgw1CGS0laJAqOHklhqEit2/
         N9po52TAkb3mL7so8qCN269XlgdsqIlL49JZEdcsuJfh+yIVSR7Z3/HdOUqIItQtB9fZ
         48CeUkB/ZDYqnz2z4P4YLOuPn2ByCndVNEMTddX7pDLl72goNzXNc0SWX+7TjiU2dKHA
         BmxMFaqhkqEF1Eplk1lcqZwkbarud0KEuYlsNnzWNu+WNYc7fapSBMY9h1p4arAqygFK
         rXIVrSQ0rRanV3WwECKWspmm43A7ililckPbrLYv1i6gjV8DD3mH0mhDz8gx8KUrP3XI
         uzOQ==
X-Gm-Message-State: AOAM531PS139GisJyWtSB0ss9XLjt7kN08dXKNyuOR3ZIdeklvGONFRJ
        uquKcDu2HGygfQ+9Z+V8ZR0=
X-Google-Smtp-Source: ABdhPJxOCgeBsF5GzgeXJF/apvRxPjSBRTc3CZW8+n/YOWJdhAeGG6Wb414eW+6smyOt/V1uKIHZpw==
X-Received: by 2002:a65:5684:: with SMTP id v4mr16832577pgs.218.1621920852844;
        Mon, 24 May 2021 22:34:12 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.113])
        by smtp.gmail.com with ESMTPSA id h13sm339242pfr.216.2021.05.24.22.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 22:34:12 -0700 (PDT)
From:   Dongliang Mu <mudongliangabcd@gmail.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dongliang Mu <mudongliangabcd@gmail.com>,
        syzbot+e1de8986786b3722050e@syzkaller.appspotmail.com
Subject: [PATCH] media: dvd_usb: memory leak in cinergyt2_fe_attach
Date:   Tue, 25 May 2021 13:33:59 +0800
Message-Id: <20210525053359.1147899-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When cinergyt2_frontend_attach returns a negative value, the allocation
is already successful, but in the error handling, there is no any clean
corresponding operation, which leads to memory leak.

Fix it by freeing struct cinergyt2_fe_state when the return value is
nonzero.

backtrace:
  [<0000000056e17b1a>] kmalloc include/linux/slab.h:552 [inline]
  [<0000000056e17b1a>] kzalloc include/linux/slab.h:682 [inline]
  [<0000000056e17b1a>] cinergyt2_fe_attach+0x21/0x80 drivers/media/usb/dvb-usb/cinergyT2-fe.c:271
  [<00000000ae0b1711>] cinergyt2_frontend_attach+0x21/0x70 drivers/media/usb/dvb-usb/cinergyT2-core.c:74
  [<00000000d0254861>] dvb_usb_adapter_frontend_init+0x11b/0x1b0 drivers/media/usb/dvb-usb/dvb-usb-dvb.c:290
  [<0000000002e08ac6>] dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:84 [inline]
  [<0000000002e08ac6>] dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:173 [inline]
  [<0000000002e08ac6>] dvb_usb_device_init.cold+0x4d0/0x6ae drivers/media/usb/dvb-usb/dvb-usb-init.c:287

Reported-by: syzbot+e1de8986786b3722050e@syzkaller.appspotmail.com
Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 drivers/media/usb/dvb-usb/dvb-usb-dvb.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/dvb-usb-dvb.c b/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
index 0a7f8ba90992..f9f004fb0a92 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
@@ -288,7 +288,7 @@ int dvb_usb_adapter_frontend_init(struct dvb_usb_adapter *adap)
 		}
 
 		ret = adap->props.fe[i].frontend_attach(adap);
-		if (ret || adap->fe_adap[i].fe == NULL) {
+		if (adap->fe_adap[i].fe == NULL) {
 			/* only print error when there is no FE at all */
 			if (i == 0)
 				err("no frontend was attached by '%s'",
@@ -297,6 +297,12 @@ int dvb_usb_adapter_frontend_init(struct dvb_usb_adapter *adap)
 			return 0;
 		}
 
+		if (ret) {
+			struct dvb_frontend *fe = adap->fe_adap[i].fe;
+
+			fe->ops.release(fe);
+			return 0;
+		}
+
 		adap->fe_adap[i].fe->id = i;
 
 		/* re-assign sleep and wakeup functions */
-- 
2.25.1

