Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE2574DE29F
	for <lists+linux-media@lfdr.de>; Fri, 18 Mar 2022 21:38:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240711AbiCRUjV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Mar 2022 16:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239028AbiCRUjT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Mar 2022 16:39:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11821E29DF
        for <linux-media@vger.kernel.org>; Fri, 18 Mar 2022 13:37:59 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB8CFEE;
        Fri, 18 Mar 2022 21:37:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647635877;
        bh=VjyaiLuBjjXdEBWXVin/rjPGvmckOvSopLNhTWJnBbg=;
        h=From:To:Cc:Subject:Date:From;
        b=si4vQJP/O8nZuQVUMSEmWFSZfPNI1GjBFj4pWDfZxhMN59TJ9GboX0LGYL/pwzZvh
         p6udZ0GTKnOrKXfnj9S1NL21P0+++LPXO4nSw390MIs4QLAtzAU4b3wXUG0ZsQJbUr
         8l+ApcYi/uWLLbktArsieAytj9KLOF7FfTvBsKsM=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH] media: nxp: Restrict VIDEO_IMX_MIPI_CSIS to ARCH_MXC or COMPILE_TEST
Date:   Fri, 18 Mar 2022 22:37:35 +0200
Message-Id: <20220318203735.5923-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The imx-mipi-csis driver is specific to NXP platforms. Restrict it to
those by default, and enable compilation with COMPILE_TEST to keep a
wide test coverage.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
index 7473096f5885..28f2bafc14d2 100644
--- a/drivers/media/platform/nxp/Kconfig
+++ b/drivers/media/platform/nxp/Kconfig
@@ -6,6 +6,7 @@ comment "NXP media platform drivers"
 
 config VIDEO_IMX_MIPI_CSIS
 	tristate "NXP MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
+	depends on ARCH_MXC || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API

base-commit: 71e6d0608e4d1b79069990c7dacb3600ced28a3b
-- 
Regards,

Laurent Pinchart

