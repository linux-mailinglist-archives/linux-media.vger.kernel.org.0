Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 096797CD3A3
	for <lists+linux-media@lfdr.de>; Wed, 18 Oct 2023 07:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbjJRFwm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Oct 2023 01:52:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjJRFwl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Oct 2023 01:52:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D663AC4
        for <linux-media@vger.kernel.org>; Tue, 17 Oct 2023 22:52:39 -0700 (PDT)
Received: from umang.jainideasonboard.com (unknown [103.251.226.39])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E033E741;
        Wed, 18 Oct 2023 07:52:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697608351;
        bh=+6DT5N/Krj0AEQOv9axjWEn0p+dV8RS7uTpBekTn03A=;
        h=From:To:Cc:Subject:Date:From;
        b=prUuZwerFMwIxvX7fNJclXKfITyabsIrv4LmFbgS3nEoBLVvHjwAkATKYUHpZcxmZ
         UbYz26hfT1m/q2c9weGbq45B8Y+0zjizjK2o2H8QcIqAB8yMtdWUOybH93wfHIr7r/
         Tla1WSKQUb8U7vRN05WSOVBNIyR6JyIkvxEUCsIA=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2] staging: vc04_services: vchiq_bus: Do not kfree device
Date:   Wed, 18 Oct 2023 11:22:28 +0530
Message-Id: <20231018055228.825524-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As per device_register() documentation, this kfree() on error path will
crash. The call to put_device() is all that is needed here to free the
memory.

Fixes: 027e5703de6b ("staging: vc04_services: vchiq_arm: Add new bus type and device type")
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
Changes in v2:
- Add a Fixes: tag
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
index 4ac3491efe45..0076d091b9b2 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
@@ -73,7 +73,6 @@ vchiq_device_register(struct device *parent, const char *name)
 	if (ret) {
 		dev_err(parent, "Cannot register %s: %d\n", name, ret);
 		put_device(&device->dev);
-		kfree(device);
 		return NULL;
 	}
 

base-commit: a2fc3e8215313c8e4e42d4b2062830aaf1ef49c0
-- 
2.40.1

