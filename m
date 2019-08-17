Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5F6590D9D
	for <lists+linux-media@lfdr.de>; Sat, 17 Aug 2019 09:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbfHQHEO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Aug 2019 03:04:14 -0400
Received: from mail-yb1-f195.google.com ([209.85.219.195]:33411 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfHQHEO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Aug 2019 03:04:14 -0400
Received: by mail-yb1-f195.google.com with SMTP id b16so2718542ybq.0;
        Sat, 17 Aug 2019 00:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=GaE8AdPWP2CvtbUBOKaQC7z0Y9OZpgy5HIC4jNxXiLY=;
        b=ZIh4ge7ncwF8PdNblZ261J7bYxaRtFPDQBpOp5cnq/jDgSOXxX8QdpLmWtC5wsLEdU
         aZ83EfRWbCz2jPeoW3M39YGHmQGV1CSKA1n6/EsbJeQyZONTFGKUJCsozCtMj4qzLX2d
         3wxiLf4ogiKHE2ztCAObjLCH+nKViz61uecCyqZbbV0gU31oyVJjt4sTizWUO6wNilzv
         K+QdO2XEgRiZ5avavzIstsPKXShYjY+f3RqNwSBNLnwiIce5iOU8asuGH3SXkjcI2LGN
         +6xOug+F0gMYhRTzLNDffhH2F2jkZfRA/dvjkIEfV36FPPDF6wSZCIMfzChrYRLZwul1
         81OQ==
X-Gm-Message-State: APjAAAWte0kOhH753PvkNXe5rq8lDVUKV4L886PBHPeX9H7suX9C6yPN
        Pdvt8PRa1OK3LzalUQ0TXE4=
X-Google-Smtp-Source: APXvYqwOLR8TvHSUwjWn178dDEA/rlLUsfdD3cDN4gTH95Cl2zZ5s1Oluvzd/iz2UOh0AhZu8Dr7Yg==
X-Received: by 2002:a25:be87:: with SMTP id i7mr10081044ybk.388.1566025453049;
        Sat, 17 Aug 2019 00:04:13 -0700 (PDT)
Received: from localhost.localdomain (24-158-240-219.dhcp.smyr.ga.charter.com. [24.158.240.219])
        by smtp.gmail.com with ESMTPSA id u191sm2128754ywf.74.2019.08.17.00.04.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 17 Aug 2019 00:04:12 -0700 (PDT)
From:   Wenwen Wang <wenwen@cs.uga.edu>
To:     Wenwen Wang <wenwen@cs.uga.edu>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Richard Fontana <rfontana@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] media: dvb-frontends: fix a memory leak bug
Date:   Sat, 17 Aug 2019 02:04:04 -0500
Message-Id: <1566025445-5383-1-git-send-email-wenwen@cs.uga.edu>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In cx24117_load_firmware(), 'buf' is allocated through kmalloc() to hold
the firmware. However, if i2c_transfer() fails, it is not deallocated,
leading to a memory leak bug.

Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
---
 drivers/media/dvb-frontends/cx24117.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/cx24117.c b/drivers/media/dvb-frontends/cx24117.c
index 42697a5..9fccc90 100644
--- a/drivers/media/dvb-frontends/cx24117.c
+++ b/drivers/media/dvb-frontends/cx24117.c
@@ -619,8 +619,10 @@ static int cx24117_load_firmware(struct dvb_frontend *fe,
 
 	/* send fw */
 	ret = i2c_transfer(state->priv->i2c, &msg, 1);
-	if (ret < 0)
+	if (ret < 0) {
+		kfree(buf);
 		return ret;
+	}
 
 	kfree(buf);
 
-- 
2.7.4

