Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFAA4FAB73
	for <lists+linux-media@lfdr.de>; Sun, 10 Apr 2022 03:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbiDJCBY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Apr 2022 22:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiDJCBW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Apr 2022 22:01:22 -0400
Received: from m12-16.163.com (m12-16.163.com [220.181.12.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5311813CE3
        for <linux-media@vger.kernel.org>; Sat,  9 Apr 2022 18:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=d59jm
        OjmRtt7VuM0OGSqqejfN4hTR0dUO+7luSMrMI4=; b=HIehj6DNqZe9bsKqMTqwN
        i+x5hR534xUEZGkErjbwRESlid8xn1M3Zz8EbV11ZzCr2VICmPa4BgvwNfOX3fIy
        Tcwqq+ikR2H8J1Mz7d1Wd6ABRFgO3Eod2yzGNgjhgZnD3x+ARjjr9LBm7mgvXQss
        3N2pCyWIQnynu8/dWmzwsE=
Received: from localhost.localdomain.localdomain (unknown [122.234.236.113])
        by smtp12 (Coremail) with SMTP id EMCowADX_AjgOVJiq55qAg--.16304S2;
        Sun, 10 Apr 2022 09:58:57 +0800 (CST)
From:   chinayanlei2002@163.com
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, Yan Lei <yan_lei@dahuatech.com>
Subject: [PATCH] media: v4l2: fix uninitialized value tuner_status(CWE-457)
Date:   Sun, 10 Apr 2022 09:58:54 +0800
Message-Id: <20220410015854.2826-1-chinayanlei2002@163.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EMCowADX_AjgOVJiq55qAg--.16304S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr13ZF4xtw18Ww18Gw47XFb_yoW8GrW3p3
        sxXrWayr1UGr40ya1DAF15Wa4rJ34rXFW2yF93Jw1rGF1ruFsIyF1UAF18ZrWxCFWUJF42
        kFW0yF98Aan0yw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UBuWJUUUUU=
X-Originating-IP: [122.234.236.113]
X-CM-SenderInfo: xfkl0tx1dqzvblsqiji6rwjhhfrp/1tbiOwHeLGC5iv5UTQAAs8
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yan Lei <yan_lei@dahuatech.com>

-------------------------------------------------
Declaring variable "tuner_status" without initializer.
Using uninitialized value "tuner_status" when calling "*fe_tuner_ops->get_status". 
(The function pointer resolves to "cx24113_get_status".)


Signed-off-by: Yan Lei <yan_lei@dahuatech.com>

---
 drivers/media/v4l2-core/tuner-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/tuner-core.c b/drivers/media/v4l2-core/tuner-core.c
index ad9224a18853..2d47c10de062 100644
--- a/drivers/media/v4l2-core/tuner-core.c
+++ b/drivers/media/v4l2-core/tuner-core.c
@@ -1118,7 +1118,7 @@ static void tuner_status(struct dvb_frontend *fe)
 	if (t->mode != V4L2_TUNER_RADIO)
 		return;
 	if (fe_tuner_ops->get_status) {
-		u32 tuner_status;
+		u32 tuner_status = 0;
 
 		fe_tuner_ops->get_status(&t->fe, &tuner_status);
 		if (tuner_status & TUNER_STATUS_LOCKED)
@@ -1258,7 +1258,7 @@ static int tuner_g_tuner(struct v4l2_subdev *sd, struct v4l2_tuner *vt)
 	if (vt->type == t->mode) {
 		vt->rxsubchans = V4L2_TUNER_SUB_MONO | V4L2_TUNER_SUB_STEREO;
 		if (fe_tuner_ops->get_status) {
-			u32 tuner_status;
+			u32 tuner_status = 0;
 
 			fe_tuner_ops->get_status(&t->fe, &tuner_status);
 			vt->rxsubchans =
-- 
2.33.0

