Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24C1C5E50E
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 15:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbfGCNPN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 09:15:13 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33881 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfGCNPN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 09:15:13 -0400
Received: by mail-pl1-f193.google.com with SMTP id i2so1253384plt.1;
        Wed, 03 Jul 2019 06:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ZV4664A39G+E6xvODcM+DpAlzMdjGt2KYNEEeApEiuo=;
        b=TAIXhbj93OUgU0AXbnRQRjMsXiEu4+duPzpDjw0soxo+pyTp3asGq7hqYEc4Jjg5l+
         5RZIF/BU5RW5i2eyK49H0omuT93q6VuIljYrYgjvOaHdBCkaqijBC1cLoboC0I43x1bN
         f1viIAwlyC4iUtQAaObduyS0s7RpFA+6p0KARKNNrNDh/AI1Gmv8BbtbDvrVL4jjeR0g
         UleMGAh176TQcHWDkX/bAzetXT7ROpmbK6mJwOt1keJA6ThEdQQ37n2ngiXWlvukre+r
         +xAu1nVTYhvDa4Vrwhn0WZAitEDjBUf11lMiz2oWjxwKyhRTyzoo3GQbXm60Q3ryvVFR
         cUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ZV4664A39G+E6xvODcM+DpAlzMdjGt2KYNEEeApEiuo=;
        b=sSMOXgL8VI7MFzoYyWrSfY/5Y2uwfVBVTFpah9U1lFPIrhiHn8mLHvmKsm6g729/km
         dtFi2XGhBXHbHk5aLIm24Suc0BBahDEKD4Uif0d7h8sR4WVPybwk5uilU2aEhUd2lZ4R
         l65JKCfOT6t0rLeFZQF564oNIH9j/LcLuMf8L/l4vjIp+4x9h2mR8gDpiInBhy5w6xQN
         0RFh6B69a/LP5DrB+oULLY8z06IG0hzfkpWGooFOOSrQBPh2M7DSUx3uHPciy1aM4hyp
         GGlZ+ur22o4JSx20mi4QXqMeduz/Dik+1t4hvlaMQVK0z2omPdDMpmoFT3SztpALi7uG
         sOsw==
X-Gm-Message-State: APjAAAU6c51LrBhLmwaVxtEL2tfr2SyJJ0NUkM2aOhjsaLDshT1L0m6K
        gOYJYzwt37Dsl7mAHpoXT2k9dhOuwn0=
X-Google-Smtp-Source: APXvYqy5UwsK5KUYxrgCBn17zr14APAmeMPwzlUYBI3ogGtYVO28cY5mMW8KYwDR8Q5+t3a5Udv3AA==
X-Received: by 2002:a17:902:760a:: with SMTP id k10mr39098236pll.83.1562159712373;
        Wed, 03 Jul 2019 06:15:12 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.googlemail.com with ESMTPSA id b3sm4615854pfp.65.2019.07.03.06.15.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 06:15:11 -0700 (PDT)
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fuqian Huang <huangfq.daxian@gmail.com>
Subject: [PATCH 10/30] media/dvb: Use kmemdup rather than duplicating its implementation
Date:   Wed,  3 Jul 2019 21:15:01 +0800
Message-Id: <20190703131501.25131-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

kmemdup is introduced to duplicate a region of memory in a neat way.
Rather than kmalloc/kzalloc + memset, which the programmer needs to
write the size twice (sometimes lead to mistakes), kmemdup improves
readability, leads to smaller code and also reduce the chances of mistakes.
Suggestion to use kmemdup rather than using kmalloc/kzalloc + memset.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
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

