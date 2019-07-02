Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F01EF5D120
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 16:02:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbfGBOC0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 10:02:26 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45021 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbfGBOC0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jul 2019 10:02:26 -0400
Received: by mail-pg1-f194.google.com with SMTP id i18so3069516pgl.11;
        Tue, 02 Jul 2019 07:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2rKTJik0bNrJcZfdY1VXO0Y12wZ+rcUxHFgolJg0Bi0=;
        b=Da1vGZYhN+2O3HqnlZp780wKxET6aFyhHJqF8YuGzSU1pCYGwypekf40WmSCXWoY0B
         GcuvasW+OWm6p5Iw1KN0AvSeCAujDcLzs+vYNG9j2AqwF/DF32JSQhnFTur2qOBotwla
         S5sb6M7XDCKzuiWVpxNzh5tVTt6/Wjw67XJKEdk9Ykr99CMaKfoE2hb4Aa2IUf7xeL49
         lW7ca7Qb+xXrhgHMyHk7qFUCkPfC65Sc9O+e9A1lK1HFgLSpcAxDsryVbh+cSf5ysLTK
         C8ApVpNi4d4HF5AZE9AWODuJiOp/U862aVVYDhOkqG5oZfaeNPNaS1AZ52b1Ag0MnWjM
         ja4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2rKTJik0bNrJcZfdY1VXO0Y12wZ+rcUxHFgolJg0Bi0=;
        b=RYO8ffNGlFoitbrIJgLXnLHBqALQXXEjC4vD4UaSMrFakkz0fd253y2N4nzWZdp+wI
         tcRvhkwknPBVCrD78Y0omarPCbFsAONCnI1bCah4bA2EkBRWFApasD6uWi6MiQqLVVAe
         jMMo93mUN2ChHEBkQZu63Q7eTNO4Es9hOaMutsYw5vA7p2ubM/ZYnuYNBXFb+gYd0DAB
         J9u1mPtOoYPvvqvc/WLldi7aLb2d/F36naBv/0udSI+KCqMg6lK1XpZzYg8C2llDuxeP
         t4hP0T493tm1Achy8WDygIJ65POhFnhcPrvT/Tl3Om6CDxzc6NFrmQDD9evnVZOYFvL3
         7mjQ==
X-Gm-Message-State: APjAAAWpDOCc30hjMdzslVTUCx3CCbpaL9KLaqzz34DCfYYsmYvHcfD5
        Ku8WW4J/bsxQ0Ca9fUc2HeU=
X-Google-Smtp-Source: APXvYqzM/ofHTj8Se67LGNZ4KP+h+Rm8WYTXnfvZFHewiHXWwm9hMzAV+SOpR8z/M8dW6iGAvuCVAA==
X-Received: by 2002:a17:90a:ca0f:: with SMTP id x15mr5696221pjt.82.1562076145506;
        Tue, 02 Jul 2019 07:02:25 -0700 (PDT)
Received: from debian.net.fpt ([2405:4800:58f7:57a9:d288:4a68:7763:f51e])
        by smtp.gmail.com with ESMTPSA id j2sm16587685pfn.135.2019.07.02.07.02.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 07:02:24 -0700 (PDT)
From:   Phong Tran <tranmanphong@gmail.com>
To:     syzbot+eaaaf38a95427be88f4b@syzkaller.appspotmail.com,
        andreyknvl@google.com, hans.verkuil@cisco.com, mchehab@kernel.org,
        skhan@linuxfoundation.org, gregkh@linuxfoundation.org
Cc:     keescook@chromium.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Phong Tran <tranmanphong@gmail.com>
Subject: [PATCH] media: usb: technisat-usb2: fix buffer overflow
Date:   Tue,  2 Jul 2019 21:02:11 +0700
Message-Id: <20190702140211.28399-1-tranmanphong@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <000000000000089d7f058683115e@google.com>
References: <000000000000089d7f058683115e@google.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The buffer will be overflow in case of the while loop can not break.
Add the checking buffer condition in while loop for avoiding
overlooping index.

This issue was reported by syzbot

Reported-by: syzbot+eaaaf38a95427be88f4b@syzkaller.appspotmail.com

Tested by:
https://groups.google.com/d/msg/syzkaller-bugs/CySBCKuUOOs/0hKq1CdjCwAJ

Signed-off-by: Phong Tran <tranmanphong@gmail.com>
---
 drivers/media/usb/dvb-usb/technisat-usb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/technisat-usb2.c b/drivers/media/usb/dvb-usb/technisat-usb2.c
index c659e18b358b..4e0b6185666a 100644
--- a/drivers/media/usb/dvb-usb/technisat-usb2.c
+++ b/drivers/media/usb/dvb-usb/technisat-usb2.c
@@ -655,7 +655,7 @@ static int technisat_usb2_get_ir(struct dvb_usb_device *d)
 #endif
 
 	ev.pulse = 0;
-	while (1) {
+	while (b != (buf + 63)) {
 		ev.pulse = !ev.pulse;
 		ev.duration = (*b * FIRMWARE_CLOCK_DIVISOR * FIRMWARE_CLOCK_TICK) / 1000;
 		ir_raw_event_store(d->rc_dev, &ev);
-- 
2.11.0

