Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0395C34B7DC
	for <lists+linux-media@lfdr.de>; Sat, 27 Mar 2021 16:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbhC0PLP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Mar 2021 11:11:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbhC0PKp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Mar 2021 11:10:45 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE15BC0613B1;
        Sat, 27 Mar 2021 08:10:44 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id f26so10764417ljp.8;
        Sat, 27 Mar 2021 08:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3xfofQcDvN4J+tG1djpCVc7GNwqtmS+FRdc3V48y94c=;
        b=g4xMcu9gaK87RePOaVte17/kJoqmPyPYDU8XeDvo5IrlKk9mVS90Pw3HsKodIfYNeG
         msRcRaA6pUGv7nKFzQpq6pUOnDQOFU6tN71G25FCnIsfaXQCiTGPb5iU5FhyB+S8hvSa
         5pxLDIGU13ItEW0tv3aqIDbaOkcAk3j5f53QLnS0RbOx3w1qtwkYCsomRrXXk6XNDjR9
         dIK2KrzAG1z5YA4cK0GWEsao7ZY0JQkcA+Rm2iujwe0gRdGw6+vXEGNuC9FXDSUwlmG1
         ArLgLZfBKwfTMAv7mOa4DKcHEgI14+ZVQYdNIAgMIohA25MIxGJNiXV5T0JML2hlz/le
         a3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3xfofQcDvN4J+tG1djpCVc7GNwqtmS+FRdc3V48y94c=;
        b=eExvP63xOubT4UxkZXysdgQ17NpWU0IL8oEBWXVS1WQmazaYa84HPu+ImR8jgqkdIl
         ZdnJbxF9tkUVcU2p3F0M+dkZr5QC+sXSvNYVm3PSmt/Gm8tOXQVlCdOdb9oTMjek5Xm4
         GEKRXIOoBDeF7Q/sd6AmKbvXbGEWPulKQj7yzU1SlgPkHU26Q7gCnzZ17wn/j1glEkZi
         hfDZKn2LLWRTX9+5b/cax2o+Zye1JxuAnGxIqvZy5stMZV+3Y13247Ui7WO1a6LAMQiX
         dvQIMCpg2p8cnA3RQohK7v3hHbXm7r6IM8LlI4PPkqmLzu6Jp+Z34wQGBTTozlzPinUQ
         nbBQ==
X-Gm-Message-State: AOAM530sVz6xuzeUfQPDnGoFJdJn6YcKRtoYHlRzG0mcJ0Rw+8gAhB2B
        le7msd+YceWhW1MnzGHEGp1gMSYmYuiPBEpWpso=
X-Google-Smtp-Source: ABdhPJwafV4KNkPy1zHGiOqitY4kgFI/fQAcdR1EfGqZGLCO1GBSj03JQziROm1n/De278FX7mZzgg==
X-Received: by 2002:a2e:9793:: with SMTP id y19mr11876186lji.374.1616857843167;
        Sat, 27 Mar 2021 08:10:43 -0700 (PDT)
Received: from localhost.localdomain ([94.103.227.42])
        by smtp.gmail.com with ESMTPSA id x13sm1590125ljj.4.2021.03.27.08.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 08:10:42 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     mchehab@kernel.org, andy.shevchenko@gmail.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Skripkin <paskripkin@gmail.com>,
        syzbot+889397c820fa56adf25d@syzkaller.appspotmail.com
Subject: [PATCH v2] media: usb: fix memory leak in em28xx_dvb_init
Date:   Sat, 27 Mar 2021 18:09:16 +0300
Message-Id: <20210327150916.31848-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210327082613.4702-1-paskripkin@gmail.com>
References: <20210327082613.4702-1-paskripkin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot reported memory leak in em28xx_dvb_init()[1]
The problem was in wrong error handling after em28xx_alloc_urbs()[2] call.
In case of error allocated urbs must be freed

  backtrace:
    [<ffffffff8304c141>] kmalloc_array.constprop.0+0x41/0x60 include/linux/slab.h:594
    [<ffffffff8304dba2>] kcalloc include/linux/slab.h:623 [inline]
    [<ffffffff8304dba2>] em28xx_alloc_urbs+0x102/0x550 drivers/media/usb/em28xx/em28xx-core.c:930 [2]
    [<ffffffff84279fa7>] em28xx_dvb_init drivers/media/usb/em28xx/em28xx-dvb.c:1517 [inline]	  [1]

Reported-by: syzbot+889397c820fa56adf25d@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-dvb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c b/drivers/media/usb/em28xx/em28xx-dvb.c
index 526424279637..471bd74667e3 100644
--- a/drivers/media/usb/em28xx/em28xx-dvb.c
+++ b/drivers/media/usb/em28xx/em28xx-dvb.c
@@ -2010,6 +2010,7 @@ static int em28xx_dvb_init(struct em28xx *dev)
 	return result;
 
 out_free:
+	em28xx_uninit_usb_xfer(dev, EM28XX_DIGITAL_MODE);
 	kfree(dvb);
 	dev->dvb = NULL;
 	goto ret;
-- 
2.30.2

