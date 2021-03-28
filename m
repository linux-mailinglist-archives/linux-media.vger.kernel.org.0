Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2711034BE92
	for <lists+linux-media@lfdr.de>; Sun, 28 Mar 2021 21:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231267AbhC1Tdn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Mar 2021 15:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbhC1TdV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Mar 2021 15:33:21 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB59C061756;
        Sun, 28 Mar 2021 12:33:21 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id v15so15218811lfq.5;
        Sun, 28 Mar 2021 12:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zx0gjXefZkjjmVtJuNuR5xvVJ5W2H3MpyKkPYQPu0u4=;
        b=M1i8QImYoXzXJzlLbqZSy4m5eDOwKzzIE9YFTR2kLdh1AotByfC141oeh9JI1c/t0C
         NQ14/idEwKiywMvOP+MmdpWxw+MrHHw0MyqtE5JUI4F/PxvJVZfbxlsjbOIYQTofz8FG
         8dVwUhNuw3xkyjxdnAD4/G8CBSMrKogSxI/ZU4mLyR4Ix709TwyhjdZbwIg1nzmOBBI3
         H9lF4QlHb0w471OB6A1pzf5atlPBeIPm35gv/nFrS7WluuvebWi7djAbmW+RXCdthgNg
         gIje68dJuaV8f8xhw+z8vQO59csKcahSOiiZ2wokrKWPomDZAVix8n8KDwqCFCr9lgMn
         yLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zx0gjXefZkjjmVtJuNuR5xvVJ5W2H3MpyKkPYQPu0u4=;
        b=nNB32qhJeCyYZSF+r5AnK3OUUhksqSWyLMbLL0Vf0v232juuqf0VNKsPY88+zISPQY
         aVdCM4W5h6djrLtj6anhQ/0GTxtfNezp5neZw6ob1uEHgH4gOXJ25xiDQ4ECvRx2bwjt
         0fh9LHhrhIFBWG3R+AynoxYlmjeioo/c8Jivr0OV0haCHfCc70UyB0Ei1aK0ruy45UHa
         5cksIVPTBZsnMJv9UURYy2EbZj0daKcHgedfBI1nT0wazp4ntuj/ivEdAZsvPvbwXm9t
         P8IqaszKzgRyUsEIEOlV/CwV+z7wSZ/dH33hW2cssum9t3Vp05qpxtqaZZ9qWelXYnJ/
         P//w==
X-Gm-Message-State: AOAM531CwCp0GXSdiTT6Z+syB7rgdXe1rtn53UPl9VyP9rI3r9H+yRyV
        L+NHPU/SJe4iymBCFBS/540=
X-Google-Smtp-Source: ABdhPJyRY0rj/HeUNv7/6Mzx1KvsJ940EwqBa3VJKwjRg011UXCS6QK2HTCeo7VcquWNi0d7ufGGzw==
X-Received: by 2002:a05:6512:338a:: with SMTP id h10mr14831660lfg.277.1616959999408;
        Sun, 28 Mar 2021 12:33:19 -0700 (PDT)
Received: from localhost.localdomain ([94.103.227.42])
        by smtp.gmail.com with ESMTPSA id n11sm1566670lfe.243.2021.03.28.12.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 12:33:18 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     mchehab@kernel.org, sean@mess.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Skripkin <paskripkin@gmail.com>,
        syzbot+3c2be7424cea3b932b0e@syzkaller.appspotmail.com
Subject: [PATCH] usb: dvb-usb: fix memory leak in dvb_usb_adapter_init
Date:   Sun, 28 Mar 2021 22:32:19 +0300
Message-Id: <20210328193219.18647-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot reported memory leak in dvb-usb. The problem was
in invalid error handling in dvb_usb_adapter_init().

for (n = 0; n < d->props.num_adapters; n++) {
....
	if ((ret = dvb_usb_adapter_stream_init(adap)) ||
		(ret = dvb_usb_adapter_dvb_init(adap, adapter_nrs)) ||
		(ret = dvb_usb_adapter_frontend_init(adap))) {
		return ret;
	}
...
	d->num_adapters_initialized++;
...
}

In case of error in dvb_usb_adapter_dvb_init() or
dvb_usb_adapter_dvb_init() d->num_adapters_initialized won't be
incremented, but dvb_usb_adapter_exit() relies on it:

	for (n = 0; n < d->num_adapters_initialized; n++)

So, allocated objects won't be freed.

Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Reported-by: syzbot+3c2be7424cea3b932b0e@syzkaller.appspotmail.com
---
 drivers/media/usb/dvb-usb/dvb-usb-init.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dvb-usb-init.c b/drivers/media/usb/dvb-usb/dvb-usb-init.c
index c1a7634e27b4..adc8b287326b 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
@@ -79,11 +79,17 @@ static int dvb_usb_adapter_init(struct dvb_usb_device *d, short *adapter_nrs)
 			}
 		}
 
-		if ((ret = dvb_usb_adapter_stream_init(adap)) ||
-			(ret = dvb_usb_adapter_dvb_init(adap, adapter_nrs)) ||
-			(ret = dvb_usb_adapter_frontend_init(adap))) {
+		ret = dvb_usb_adapter_stream_init(adap);
+		if (ret)
 			return ret;
-		}
+
+		ret = dvb_usb_adapter_dvb_init(adap, adapter_nrs);
+		if (ret)
+			goto dvb_init_err;
+
+		ret = dvb_usb_adapter_frontend_init(adap);
+		if (ret)
+			goto frontend_init_err;
 
 		/* use exclusive FE lock if there is multiple shared FEs */
 		if (adap->fe_adap[1].fe)
@@ -103,6 +109,12 @@ static int dvb_usb_adapter_init(struct dvb_usb_device *d, short *adapter_nrs)
 	}
 
 	return 0;
+
+frontend_init_err:
+	dvb_usb_adapter_dvb_exit(adap);
+dvb_init_err:
+	dvb_usb_adapter_stream_exit(adap);
+	return ret;
 }
 
 static int dvb_usb_adapter_exit(struct dvb_usb_device *d)
-- 
2.30.2

