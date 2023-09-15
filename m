Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1730C7A1D96
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 13:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234243AbjIOLlo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 07:41:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233504AbjIOLlo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 07:41:44 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BF4C71FE8
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 04:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=CY24/
        IMTGSKHaAaQ0QLN5OMMOE+Jf5xAvkok9QROw60=; b=IZiM7RFLF8MgGALmCSxP2
        am2EDpRYwYrln2uVfgW5s4tLhp4AxqhuO3AWPvpDjQ8toRyBJpkR0tLHYv/T0hq2
        5jRbWXQwsXh6DFKIJ+Wls1b+IWLRcGqQn9kWyWAPTbz8VrJucTKqhppLiV9E3Em5
        oXjy0rEhI71b5jb4U7KiN8=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
        by zwqz-smtp-mta-g5-4 (Coremail) with SMTP id _____wDnaCG4QgRliT58CA--.42312S4;
        Fri, 15 Sep 2023 19:40:51 +0800 (CST)
From:   Ma Ke <make_ruc2021@163.com>
To:     mripard@kernel.org, paul.kocialkowski@bootlin.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Ma Ke <make_ruc2021@163.com>
Subject: [PATCH] media: cedrus: fix use after free bug in cedrus_remove due to race condition
Date:   Fri, 15 Sep 2023 19:40:38 +0800
Message-Id: <20230915114038.3407953-1-make_ruc2021@163.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnaCG4QgRliT58CA--.42312S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr1UGry8Gw4kGrW7ZF1DWrg_yoWkKrbEkF
        yvyw1I9r1UCrykZasrKF45ArWFvr4xZFWkJw4YqFZxAayUAFZ5JrWqyrs3J34ag3yxKF9x
        ArWvqr45Gw47XjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKGQ6JUUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: 5pdnvshuxfjiisr6il2tof0z/1tbiyAbrC1p7Lw5+dwAAsn
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_BL,
        RCVD_IN_MSPIKE_L4,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In cedrus_probe, dev->watchdog_work is bound with cedrus_watchdog. Then
cedrus_device_run may be called to start the work.

If we close the file or remove the module which will call cedrus_release and
cedrus_remove to make cleanup, there may be an unfinished work. The possible
sequence is as follows, which will cause a typical UAF bug.

The same thing will happen in cedrus_release, and use ctx after freeing it.

Fix it by canceling the work before cleanup in cedrus_release.

Signed-off-by: Ma Ke <make_ruc2021@163.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 8e248d4a0aec..0a2cb615d717 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -404,6 +404,8 @@ static int cedrus_release(struct file *file)
 	struct cedrus_ctx *ctx = container_of(file->private_data,
 					      struct cedrus_ctx, fh);
 
+	cancel_delayed_work_sync(&ctx->dev->watchdog_work);
+
 	mutex_lock(&dev->dev_mutex);
 
 	v4l2_fh_del(&ctx->fh);
-- 
2.37.2

