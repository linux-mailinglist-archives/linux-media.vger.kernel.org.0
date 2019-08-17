Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33D8C90D64
	for <lists+linux-media@lfdr.de>; Sat, 17 Aug 2019 08:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbfHQGme (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Aug 2019 02:42:34 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:43568 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfHQGme (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Aug 2019 02:42:34 -0400
Received: by mail-yb1-f193.google.com with SMTP id o82so2687076ybg.10;
        Fri, 16 Aug 2019 23:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bale4j+paQBD9glH/sZot6T6/3YbaFl0IAnEriPEsWI=;
        b=rUwTi5te/Q/4PT8EOp1RRfgh+3uWfn5jQCh8JtxvD/QuBU3eV9fKcFu+OIHY0nQa1N
         Y4dYXaxSI4yu6eeC6u3usNQLqv1p7EesqGYZITsxMYUrMgV8PcamiDWE5wJ2ccxWJg9d
         /0w2RuuH+MnXcTUZE/G7t8E6/WI/jlt855ry682Us9xTfL9g9fuU+drSOpmENXXmPIkH
         FxMwnyHNlyKINFrxuJH71gx7grhAK4sQcSZwaTGTJhTATjgDllDXtuzW0TzSPWSc/LWp
         rJrQZKwaWrEgk5ubTN6uXhv1pOtct8EQQHgAxphQsA1fTWa7CGUtVlFnAgu1OleS1G7c
         EPaw==
X-Gm-Message-State: APjAAAUF1uyv4rVjG+3IM+LXuvnyIr7x/prZ0CBH2KdbCD2ompe66Nf1
        Ac7vWBssb5dGinp7pE8KyU0=
X-Google-Smtp-Source: APXvYqyhs4PZFnM2NFm/TNl4QMeFQjeRB+T9lqI/hP7hBAj/CGuR0QWrnf5M+oJp9YM0ebqNnRsCLQ==
X-Received: by 2002:a25:5d0f:: with SMTP id r15mr9782932ybb.59.1566024153119;
        Fri, 16 Aug 2019 23:42:33 -0700 (PDT)
Received: from localhost.localdomain (24-158-240-219.dhcp.smyr.ga.charter.com. [24.158.240.219])
        by smtp.gmail.com with ESMTPSA id b64sm1690960ywe.43.2019.08.16.23.42.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 16 Aug 2019 23:42:31 -0700 (PDT)
From:   Wenwen Wang <wenwen@cs.uga.edu>
To:     Wenwen Wang <wenwen@cs.uga.edu>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] media: dvb-frontends: fix memory leaks
Date:   Sat, 17 Aug 2019 01:42:24 -0500
Message-Id: <1566024146-4793-1-git-send-email-wenwen@cs.uga.edu>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In dib7000pc_detection(), 'tx' and 'rx' are allocated through kzalloc()
respectively. However, if DiB7000PC is detected, they are not deallocated,
leading to memory leaks. To fix this issue, create a label to free 'tx' and
'rx' before returning from the function.

Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
---
 drivers/media/dvb-frontends/dib7000p.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/dib7000p.c b/drivers/media/dvb-frontends/dib7000p.c
index 52f5e697..0d22c70 100644
--- a/drivers/media/dvb-frontends/dib7000p.c
+++ b/drivers/media/dvb-frontends/dib7000p.c
@@ -2036,7 +2036,8 @@ static int dib7000pc_detection(struct i2c_adapter *i2c_adap)
 	if (i2c_transfer(i2c_adap, msg, 2) == 2)
 		if (rx[0] == 0x01 && rx[1] == 0xb3) {
 			dprintk("-D-  DiB7000PC detected\n");
-			return 1;
+			ret = 1;
+			goto out;
 		}
 
 	msg[0].addr = msg[1].addr = 0x40;
@@ -2044,11 +2045,13 @@ static int dib7000pc_detection(struct i2c_adapter *i2c_adap)
 	if (i2c_transfer(i2c_adap, msg, 2) == 2)
 		if (rx[0] == 0x01 && rx[1] == 0xb3) {
 			dprintk("-D-  DiB7000PC detected\n");
-			return 1;
+			ret = 1;
+			goto out;
 		}
 
 	dprintk("-D-  DiB7000PC not detected\n");
 
+out:
 	kfree(rx);
 rx_memory_error:
 	kfree(tx);
-- 
2.7.4

