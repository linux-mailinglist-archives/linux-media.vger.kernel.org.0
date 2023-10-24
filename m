Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68D717D4F22
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 13:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232474AbjJXLpF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 07:45:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232525AbjJXLpD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 07:45:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4379DD7B
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 04:45:01 -0700 (PDT)
Received: from umang.jain (unknown [103.86.18.159])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CEAD4EBA;
        Tue, 24 Oct 2023 13:44:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698147881;
        bh=H/nz2gkbrMm7IT7ydeLh0hLjQygmW288aTznsob3DGA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KLYnWVLOh+BLtw9NZbdro+YtM0sEEkM0vGXLEnZt8Spiyk+o2COQ/RbXeeishohIi
         X7AUBrXEYW7nxBSa9T8Bs7WGwGmI8yySR3uniGe+OZwbY7Ni6tnob7payB9bT83dJ4
         a79A86yFWuFo+EWydrZKZn+BoKnHcr/PiqyfDwgU=
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
Subject: [PATCH v2 7/8] staging: vc04_services: Drop VCHIQ_LOG_PREFIX macro
Date:   Tue, 24 Oct 2023 07:44:27 -0400
Message-ID: <20231024114428.443528-8-umang.jain@ideasonboard.com>
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

The macro is not used anymore, so drop it.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 7a36648d6dad..076c6d9ad56a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -38,8 +38,6 @@
 #define VCHIQ_LOG_INFO     6
 #define VCHIQ_LOG_TRACE    7
 
-#define VCHIQ_LOG_PREFIX   KERN_INFO "vchiq: "
-
 enum vchiq_log_category {
 	VCHIQ_ARM,
 	VCHIQ_CORE,
-- 
2.41.0

