Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2A607E382E
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 10:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233866AbjKGJwU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 04:52:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233867AbjKGJwS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 04:52:18 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E5C11A
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 01:52:16 -0800 (PST)
Received: from umang.jain (unknown [103.251.226.110])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57302D8B;
        Tue,  7 Nov 2023 10:51:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1699350713;
        bh=OSaU2JfcRpqaoQ4rtzBWYlTRgjft76ZQtKn1Q/INCPI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NlmWAtbNmBLdIaH/LGalMA5siqISenWvl3SJ79wlWPstu27dRxQg2KIiuYxScM7DQ
         z6KbXIViNZ6sTTJExMe91MyCUBeFddOBkHVF0opTtR1mXzTOeuQWGd4duDhBdhtSUX
         ibD1nnxqWsh7tZlfDgzOX856y63X2A0eeKNN5wus=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Umang Jain <umang.jain@ideasonboard.com>,
        "Ricardo B . Marliere" <ricardo@marliere.net>
Subject: [PATCH 2/9] staging: vc04_services: Log using pr_err() when vchiq_state is unset
Date:   Tue,  7 Nov 2023 04:51:49 -0500
Message-ID: <20231107095156.365492-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107095156.365492-1-umang.jain@ideasonboard.com>
References: <20231107095156.365492-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In cases, where the global vchiq state is still unset, we cannot log
to dynamic debug (access to struct device is needed, hence potential
NULL de-reference). Log using pr_err() instead.

In vchiq_initialise(), remove the 'goto' because it is just again
trying to log to dynamic debug. Simply return with -ENNOTCONN after
logging to pr_err().

In vchiq_open(), move the vchiq_log_debug() after the state pointer
null check.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c  | 6 ++----
 .../staging/vc04_services/interface/vchiq_arm/vchiq_dev.c  | 7 +++----
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 9fb8f657cc78..9fb3e240d9de 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -687,10 +687,8 @@ int vchiq_initialise(struct vchiq_instance **instance_out)
 		usleep_range(500, 600);
 	}
 	if (i == VCHIQ_INIT_RETRIES) {
-		vchiq_log_error(state->dev, VCHIQ_CORE, "%s: videocore not initialized\n",
-				__func__);
-		ret = -ENOTCONN;
-		goto failed;
+		pr_err("%s: videocore not initialized\n", __func__);
+		return -ENOTCONN;
 	} else if (i > 0) {
 		vchiq_log_warning(state->dev, VCHIQ_CORE,
 				  "%s: videocore initialized after %d retries\n", __func__, i);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 0bc93f48c14c..3425d2b199c2 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -1170,14 +1170,13 @@ static int vchiq_open(struct inode *inode, struct file *file)
 	struct vchiq_state *state = vchiq_get_state();
 	struct vchiq_instance *instance;
 
-	vchiq_log_debug(state->dev, VCHIQ_ARM, "vchiq_open");
-
 	if (!state) {
-		vchiq_log_error(state->dev, VCHIQ_ARM,
-				"vchiq has no connection to VideoCore");
+		pr_err("%s: vchiq has no connection to VideoCore\n", __func__);
 		return -ENOTCONN;
 	}
 
+	vchiq_log_debug(state->dev, VCHIQ_ARM, "vchiq_open");
+
 	instance = kzalloc(sizeof(*instance), GFP_KERNEL);
 	if (!instance)
 		return -ENOMEM;
-- 
2.41.0

