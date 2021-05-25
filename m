Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 902FA3901AC
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 15:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233056AbhEYNIj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 09:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232942AbhEYNIi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 09:08:38 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 418FAC061574;
        Tue, 25 May 2021 06:07:08 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id gb21-20020a17090b0615b029015d1a863a91so13209487pjb.2;
        Tue, 25 May 2021 06:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TBVk+OE5/lYyRoJ0rR5Me0YMGRJp92xBlZfM3Osvy3s=;
        b=X89dJyiEvDwr1AAPX28tdouRMfV7teJgP3+kMIrRSK/JDc6c7Y2YTgF9V9CdfwyEpy
         IBh7tH3ZF6gB94dG1lGNPQfASvzCJm2MKGRh0q5/tmpybkx5QBGdi7TdgV1zlFH59tHN
         UCRGHNVKHg3OveIh9joTXbVgkbH+5CnmJJu3crUrTYdc4emCXkcCt3UxseJyxXx6G57B
         DLULbxreEzS+kZ9zjqh9MBwJcGfKYkqAnsqKcokCfbhBy3oCXMpUNvoz3GJknEtiB9SK
         0+JeLCso4Xgqt6jitJ+zhmjIxarDudIR0QaWpHo6lL8zw38MQ4/ErT/nRaS0O90Inn1N
         GATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TBVk+OE5/lYyRoJ0rR5Me0YMGRJp92xBlZfM3Osvy3s=;
        b=Kmo7kJuuyClJMf6lv27A+/QO1zDo5Qnmlmezu4eB3ZzVyVmL2yrGbr1eBGs3An3up/
         PGawotULLa7Su12jb6tbyXwpxlpTcDrb6qPeE0aU+LV1sYLN41KLWafUt3spAJBjZmUq
         aZEWeNJIXBoxBEvEbtQoUgS/iHDXe1esPfR5nVTa2Z7SBc6PyFpgxYZjUqTFZp7f4MO/
         GiqaE9AFng27NL1+NWsrjSWQlEFPBgSNtxMKIuOkPeqHnQulawDriy+i84qjstZ4BgZn
         1XFhNs7utKOKFoqTZ+aW6TPeZGlcS+3pxYRXfFnIMIHnXMXJ7wQTrOsJcxlK8bU9L7jx
         zgug==
X-Gm-Message-State: AOAM5311XTNxAFm1pTft4Fc+LsDHcTt1riUyjOWOdUBggceOOl5yemsM
        k8oCFvnfy0VjqEGQ9806giQ=
X-Google-Smtp-Source: ABdhPJyF+tsHEfkDO3oluIRS1U4zN/lk4XCNk1Qqmhbjbu8Pv8hV1Y4gB+y44QZE2EAientsJl+Mdw==
X-Received: by 2002:a17:90b:4386:: with SMTP id in6mr30841429pjb.160.1621948027622;
        Tue, 25 May 2021 06:07:07 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.113])
        by smtp.gmail.com with ESMTPSA id m1sm2026952pjo.10.2021.05.25.06.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 06:07:06 -0700 (PDT)
From:   Dongliang Mu <mudongliangabcd@gmail.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dongliang Mu <mudongliangabcd@gmail.com>,
        syzbot+e1de8986786b3722050e@syzkaller.appspotmail.com
Subject: [PATCH v2] media: dvd_usb: memory leak in cinergyt2_fe_attach
Date:   Tue, 25 May 2021 21:06:52 +0800
Message-Id: <20210525130652.1498800-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the driver fails to talk with the hardware with dvb_usb_generic_rw,
it will return an error to dvb_usb_adapter_frontend_init. However, the
driver forgets to free the resource (e.g., struct cinergyt2_fe_state),
which leads to a memory leak.

Fix this by freeing struct cinergyt2_fe_state when dvb_usb_generic_rw
fails in cinergyt2_frontend_attach.

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
v1->v2: move fix to cinergyt2_frontend_attach other than dvb-usb core
 drivers/media/usb/dvb-usb/cinergyT2-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/dvb-usb/cinergyT2-core.c b/drivers/media/usb/dvb-usb/cinergyT2-core.c
index 969a7ec71dff..4116ba5c45fc 100644
--- a/drivers/media/usb/dvb-usb/cinergyT2-core.c
+++ b/drivers/media/usb/dvb-usb/cinergyT2-core.c
@@ -78,6 +78,8 @@ static int cinergyt2_frontend_attach(struct dvb_usb_adapter *adap)
 
 	ret = dvb_usb_generic_rw(d, st->data, 1, st->data, 3, 0);
 	if (ret < 0) {
+		if (adap->fe_adap[0].fe)
+			adap->fe_adap[0].fe->ops.release(adap->fe_adap[0].fe);
 		deb_rc("cinergyt2_power_ctrl() Failed to retrieve sleep state info\n");
 	}
 	mutex_unlock(&d->data_mutex);
-- 
2.25.1

