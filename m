Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F32D7BD8EF
	for <lists+linux-media@lfdr.de>; Mon,  9 Oct 2023 12:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234423AbjJIKra (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 06:47:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232713AbjJIKr3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 06:47:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EAD999
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 03:47:27 -0700 (PDT)
Received: from umang.jainideasonboard.com (unknown [IPv6:2405:201:2033:3002:3848:5d20:59c9:c87c])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E85D97E2;
        Mon,  9 Oct 2023 12:47:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696848445;
        bh=WHU7IPXZKXTE1rhuy3e+aOCX4v7cqCvPdHa9poBLiDU=;
        h=From:To:Cc:Subject:Date:From;
        b=VNGmRy+iA/wTsHM8P0vpMJuGVk9ygETdTb6P0r4kgn5g4pn8XiTlw6F5oUbiX5SAf
         0OK5p0V8RjR2OCCFYZs+Tmssoa+qm7UTW3xdJsS//feWej/RdaHjCaB7hLidw/N6JG
         IFGTYrDQquATNBn+thPjgUdYJsAJrJdjRz0yOcno=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2] staging: vc04_services: vchiq_bus: Do not kfree device
Date:   Mon,  9 Oct 2023 16:17:14 +0530
Message-Id: <20231009104714.142880-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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

