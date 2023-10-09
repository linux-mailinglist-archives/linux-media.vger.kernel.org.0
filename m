Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67AFC7BD30C
	for <lists+linux-media@lfdr.de>; Mon,  9 Oct 2023 08:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345164AbjJIGJY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 02:09:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345128AbjJIGJX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 02:09:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD8E29E
        for <linux-media@vger.kernel.org>; Sun,  8 Oct 2023 23:09:21 -0700 (PDT)
Received: from umang.jainideasonboard.com (unknown [IPv6:2405:201:2033:3002:3848:5d20:59c9:c87c])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F4C97E1;
        Mon,  9 Oct 2023 08:09:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696831756;
        bh=A7900hRoNjHIzc5sH159mzKXlqgTRZCR0gjaerNuZFo=;
        h=From:To:Cc:Subject:Date:From;
        b=C7Y11jmiULGpsDObBY5alcmikwSHa5p0aqULxzJqm0yova8imKTLa+WEYKV717FxH
         8CouggJ6EK0Cps4YlB6LwRihD10gV54iBNiye7qtuS/OLx/oFQP+Npx+bYpYLnj1kX
         W/27bwk9ILY8ed17QxeJedNH7wAUe7xr7XIyWsL0=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH] staging: vc04_services: vchiq_bus: Do not kfree device
Date:   Mon,  9 Oct 2023 11:39:06 +0530
Message-Id: <20231009060906.33407-1-umang.jain@ideasonboard.com>
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

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
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
 
-- 
2.40.1

