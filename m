Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04DC55E8E0
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 18:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbfGCQ2p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 12:28:45 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42148 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbfGCQ2p (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 12:28:45 -0400
Received: by mail-pf1-f194.google.com with SMTP id q10so1525166pff.9;
        Wed, 03 Jul 2019 09:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Y22V+QiD3udZ68iGALmAszObqPvb6BnxuzJ2QUOgG5E=;
        b=ZR4Y2xkZz4em40s7mAjpzAV9ClrWOWuoWJXIgaS7GPywVctv3VMbPQMrV8zy2qOsZn
         KTB355sUPrmdy1EawHP87Wg8ipfxjYHMrsADVX1KQXxtWC9tBx0epno6wEp08DL4SIBR
         c3DZL2hbg6ZClbf2AsIhzdbNyGuMJBqDwEVTsxqkRjwvlQBvfOmWq7UsyX5y+GJrPrZI
         stewt+K3ismacqa+snLXMZgHpuTqA/JAvwwhub9uiKKHy1orFQsgYpJJxW/44+wlA2so
         hV4TuAGsdf2eBiyk/pKfRXGN7R7z2EY4whktxue1r4z7pc8bdV/kQCnnVSRcPA7q1nxU
         DF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Y22V+QiD3udZ68iGALmAszObqPvb6BnxuzJ2QUOgG5E=;
        b=q4WvfwW/YPrZ9S4t4PPwhN0AsFDfQvLNY/fMZkL+ngS+UMNCYcJ5DLJ70pHzuwSeHn
         MyhFGedMW9HULq+VWZMyxD6LOXp4ij00OTy6SmrXBcW0pR/ljz0biC2DmaITi0BjT5ik
         Cw7H0dK5Bga/546XEEFMiY7X1cpjazpBNBE9lmUK0qQ/uCvjq2w/fWxBJ35i4IQa0IWI
         t1g12lY60krZ6NS7IObQfpVWmYcYqODrGbB25OA8OWAr2UK1tcfu1B97m80SuOZDDAA7
         9KMbanH2XZ2aSBGUHSDc1j3K4GJRijg4lHzZhCya5F25v1Xg0uE+3WU2r0MMP/Rf5TCm
         HFVA==
X-Gm-Message-State: APjAAAVQPgxzT81uzYckWsuKoQZABFvMxK5laTfqoNtqhN5tsqcjhCM3
        bL7bvKg682vK5BRXviMRkGc=
X-Google-Smtp-Source: APXvYqxTgObwCcgoIWKwMobbwSi7RECPXR2FXREl1JcEbHpgPk4S9V4SjxBmUPfl2cOWcwaw2G64+g==
X-Received: by 2002:a65:6204:: with SMTP id d4mr37728589pgv.104.1562171324924;
        Wed, 03 Jul 2019 09:28:44 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.googlemail.com with ESMTPSA id z14sm2767546pgs.79.2019.07.03.09.28.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 09:28:44 -0700 (PDT)
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fuqian Huang <huangfq.daxian@gmail.com>
Subject: [PATCH v2 11/35] media/dvb: Use kmemdup rather than duplicating its implementation
Date:   Thu,  4 Jul 2019 00:28:37 +0800
Message-Id: <20190703162837.32369-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

kmemdup is introduced to duplicate a region of memory in a neat way.
Rather than kmalloc/kzalloc + memcpy, which the programmer needs to
write the size twice (sometimes lead to mistakes), kmemdup improves
readability, leads to smaller code and also reduce the chances of mistakes.
Suggestion to use kmemdup rather than using kmalloc/kzalloc + memcpy.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
Changes in v2:
  - Fix a typo in commit message (memset -> memcpy)

 drivers/media/dvb-core/dvbdev.c             | 3 +--
 drivers/media/dvb-frontends/drx39xyj/drxj.c | 5 ++---
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index a3393cd4e584..e4abe8d34535 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -476,7 +476,7 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 		return -ENOMEM;
 	}
 
-	dvbdevfops = kzalloc(sizeof(struct file_operations), GFP_KERNEL);
+	dvbdevfops = kmemdup(template->fops, sizeof(struct file_operations), GFP_KERNEL);
 
 	if (!dvbdevfops){
 		kfree (dvbdev);
@@ -492,7 +492,6 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	dvbdev->fops = dvbdevfops;
 	init_waitqueue_head (&dvbdev->wait_queue);
 
-	memcpy(dvbdevfops, template->fops, sizeof(struct file_operations));
 	dvbdevfops->owner = adap->module;
 
 	list_add_tail (&dvbdev->list_head, &adap->device_list);
diff --git a/drivers/media/dvb-frontends/drx39xyj/drxj.c b/drivers/media/dvb-frontends/drx39xyj/drxj.c
index a6876fa48753..2f5af4813a74 100644
--- a/drivers/media/dvb-frontends/drx39xyj/drxj.c
+++ b/drivers/media/dvb-frontends/drx39xyj/drxj.c
@@ -12287,7 +12287,8 @@ struct dvb_frontend *drx39xxj_attach(struct i2c_adapter *i2c)
 	if (state == NULL)
 		goto error;
 
-	demod = kmalloc(sizeof(struct drx_demod_instance), GFP_KERNEL);
+	demod = kmemdup(&drxj_default_demod_g,
+			sizeof(struct drx_demod_instance), GFP_KERNEL);
 	if (demod == NULL)
 		goto error;
 
@@ -12311,8 +12312,6 @@ struct dvb_frontend *drx39xxj_attach(struct i2c_adapter *i2c)
 	state->demod = demod;
 
 	/* setup the demod data */
-	memcpy(demod, &drxj_default_demod_g, sizeof(struct drx_demod_instance));
-
 	demod->my_i2c_dev_addr = demod_addr;
 	demod->my_common_attr = demod_comm_attr;
 	demod->my_i2c_dev_addr->user_data = state;
-- 
2.11.0

