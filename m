Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0127D4F1D
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 13:44:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232461AbjJXLot (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 07:44:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232340AbjJXLor (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 07:44:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB73C128
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 04:44:41 -0700 (PDT)
Received: from umang.jain (unknown [103.86.18.159])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6FC45C67;
        Tue, 24 Oct 2023 13:44:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698147869;
        bh=UDw7HdIOhh9PBndXp+jZ/iO/eXfz1vImrJOM86kYLko=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QxQwlaYk+Z/Nj+yRKihIf3non9OJw6BwE1Ys6Xi7+MST5c28myaRInetjZjntOp5f
         dTZF5PZkrQzTVlZN/9ido9hQkv8b3/h50ZiIPeDT7XHwcgjal88HX8i9/xYBHeRzPU
         n66kgLDUfMm3MRYKZh7p+ww3NTVVjnF18MTRjFCs=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 2/8] staging: vc04_services: Pass struct device to vchiq_init_slots()
Date:   Tue, 24 Oct 2023 07:44:22 -0400
Message-ID: <20231024114428.443528-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231024114428.443528-1-umang.jain@ideasonboard.com>
References: <20231024114428.443528-1-umang.jain@ideasonboard.com>
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

Pass struct device pointer to vchiq_init_slots(). In subsequent
commits, vchiq_log_* macros will be ported to use dynamic debug
(dev_dbg()), hence they need access to a struct device pointer.

No functional changes intended in this commit.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c  | 2 +-
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 2 +-
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index eef9c8c06e66..8d15ac4e1700 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -506,7 +506,7 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 
 	WARN_ON(((unsigned long)slot_mem & (PAGE_SIZE - 1)) != 0);
 
-	vchiq_slot_zero = vchiq_init_slots(slot_mem, slot_mem_size);
+	vchiq_slot_zero = vchiq_init_slots(dev, slot_mem, slot_mem_size);
 	if (!vchiq_slot_zero)
 		return -ENOMEM;
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index a12afac95dcd..fb9af0127c49 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -2122,7 +2122,7 @@ get_conn_state_name(enum vchiq_connstate conn_state)
 }
 
 struct vchiq_slot_zero *
-vchiq_init_slots(void *mem_base, int mem_size)
+vchiq_init_slots(struct device *dev, void *mem_base, int mem_size)
 {
 	int mem_align =
 		(int)((VCHIQ_SLOT_SIZE - (long)mem_base) & VCHIQ_SLOT_MASK);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 8b234cad24ea..ddab99017395 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -471,7 +471,7 @@ extern const char *
 get_conn_state_name(enum vchiq_connstate conn_state);
 
 extern struct vchiq_slot_zero *
-vchiq_init_slots(void *mem_base, int mem_size);
+vchiq_init_slots(struct device *dev, void *mem_base, int mem_size);
 
 extern int
 vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero, struct device *dev);
-- 
2.41.0

