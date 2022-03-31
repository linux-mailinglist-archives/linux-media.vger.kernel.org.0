Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF6884ED9A9
	for <lists+linux-media@lfdr.de>; Thu, 31 Mar 2022 14:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233075AbiCaMdr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Mar 2022 08:33:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235086AbiCaMdq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Mar 2022 08:33:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B809A211EC3
        for <linux-media@vger.kernel.org>; Thu, 31 Mar 2022 05:31:58 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 20B0E59D;
        Thu, 31 Mar 2022 14:31:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1648729916;
        bh=jr2RrAS4n2ewqjM7Ivc/UcnDRA4hM9XgPbG7f31loqg=;
        h=From:To:Cc:Subject:Date:From;
        b=RVr2eyLZRPmH+ZhgYXRZkKEHXseMo1VFxXGNMyv/r19qjqBLp2TLmSa5CL61+3W6D
         x86xD+S24uXbebIWfwzSSDgbj4K1Ub21h6niDbHPxt3afMgkdJ33293wxEO5X650MB
         ip0YL0QValo5IMAfCo9wVFv6oA1FfW6OGdHBGOUo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] media: platform: imx-mipi-csis: Add dependency on VIDEO_DEV
Date:   Thu, 31 Mar 2022 15:31:51 +0300
Message-Id: <20220331123151.1953-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
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

The imx-mipi-csis driver (VIDEO_IMX_MIPI_CSIS) lost its dependency on
VIDEO_DEV in commit 63fe3d27b226 ("media: platform/*/Kconfig: make
manufacturer menus more uniform"). This causes build failures with
configurations that don't have VIDEO_DEV set. Fix it by restoring the
dependency.

Fixes: 63fe3d27b226 ("media: platform/*/Kconfig: make manufacturer menus more uniform")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Mauro, this fixes a regression in Linus' master branch, and is thus a
candidate fix for v5.18.
---
 drivers/media/platform/nxp/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
index 28f2bafc14d2..5afa373e534f 100644
--- a/drivers/media/platform/nxp/Kconfig
+++ b/drivers/media/platform/nxp/Kconfig
@@ -7,6 +7,7 @@ comment "NXP media platform drivers"
 config VIDEO_IMX_MIPI_CSIS
 	tristate "NXP MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
 	depends on ARCH_MXC || COMPILE_TEST
+	depends on VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API

base-commit: 787af64d05cd528aac9ad16752d11bb1c6061bb9
-- 
Regards,

Laurent Pinchart

