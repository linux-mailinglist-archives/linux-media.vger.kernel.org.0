Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0326B5339D4
	for <lists+linux-media@lfdr.de>; Wed, 25 May 2022 11:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbiEYJVJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 May 2022 05:21:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229773AbiEYJVI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 May 2022 05:21:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CBD078930;
        Wed, 25 May 2022 02:21:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (unknown [141.113.67.45])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4096F59D;
        Wed, 25 May 2022 11:21:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1653470461;
        bh=4ppQi6Q+8jKdd9MisM65iV4SXHNyv2SAU9tmCGb/LzU=;
        h=From:To:Cc:Subject:Date:From;
        b=rhkX8Aq//vKrvhAUwvuoiN+n6P9B0cdgr/0qslXarOy5kXCoRSdHm6nNBmcUEu9Q7
         HlWlZYUKuy53xxIaSL9NcXV9y5svPhU5h6kPFZLCoW+XgBJejam9HzpXKnKk8EqeHy
         hs3bQSdeeAwpLP5K5eLSjTVBvlAQR8Oq+DAHFpjg=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH] media: renesas: rcar_drif: Drop of_match_ptr()
Date:   Wed, 25 May 2022 12:20:54 +0300
Message-Id: <20220525092054.26089-1-laurent.pinchart+renesas@ideasonboard.com>
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

The device_driver structure's of_match_table field exists
unconditionally, so there's no need for of_match_ptr(). This fixes a
compiler warning when test-compiling on non-OF platforms:

drivers/media/platform/renesas/rcar_drif.c:1470:34: warning: unused variable 'rcar_drif_of_table' [-Wunused-const-variable]
static const struct of_device_id rcar_drif_of_table[] = {
                                 ^
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar_drif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
index 9a0982fa5c6b..5167960781bf 100644
--- a/drivers/media/platform/renesas/rcar_drif.c
+++ b/drivers/media/platform/renesas/rcar_drif.c
@@ -1477,7 +1477,7 @@ MODULE_DEVICE_TABLE(of, rcar_drif_of_table);
 static struct platform_driver rcar_drif_driver = {
 	.driver = {
 		.name = RCAR_DRIF_DRV_NAME,
-		.of_match_table = of_match_ptr(rcar_drif_of_table),
+		.of_match_table = rcar_drif_of_table,
 		.pm = &rcar_drif_pm_ops,
 		},
 	.probe = rcar_drif_probe,

base-commit: 6c1c1eb8c87de221051b9198d40971640060842f
-- 
Regards,

Laurent Pinchart

