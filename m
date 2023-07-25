Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34E5B761CEC
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 17:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231485AbjGYPIV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 11:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232415AbjGYPIA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 11:08:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8923219A1
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 08:07:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18D43558;
        Tue, 25 Jul 2023 17:07:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690297620;
        bh=tqtrS/tKg4IZ8C0oVN6k98XURzaRMBnMZnm5nRJ/Ifg=;
        h=From:To:Cc:Subject:Date:From;
        b=KynZfTh1ny5OlDxTX6k5e51bac6SCfQvv3tKEzvkHWRfbwrwOdVUEJy1MAvw9hcv/
         nsBo+CeS+8UzV9AiUP4Rr0DNVvWoOhYgrp/y6UxnKcKf6uP5HiuPBn2gpbppIlUFxI
         1oJal2w0ljXAnqhzeJ3q9U83ntD5Tbb0H/gJFLb4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-media@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Subject: [PATCH] arm64: defconfig: Drop CONFIG_VIDEO_IMX_MEDIA
Date:   Tue, 25 Jul 2023 18:08:06 +0300
Message-Id: <20230725150806.16286-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CONFIG_VIDEO_IMX_MEDIA isn't needed on arm64 platforms since commit
9f257f502c2e ("media: imx: Unstage the imx7-media-csi driver") which
moved the last arm64 driver depending on that Kconfig symbol out of
staging. Drop it from the arm64 defconfig.

Fixes: 9f257f502c2e ("media: imx: Unstage the imx7-media-csi driver")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 0777bcae9104..193693409aba 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1129,7 +1129,6 @@ CONFIG_XEN_GNTDEV=y
 CONFIG_XEN_GRANT_DEV_ALLOC=y
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_VIDEO_IMX_MEDIA=m
 CONFIG_VIDEO_MAX96712=m
 CONFIG_CHROME_PLATFORMS=y
 CONFIG_CROS_EC=y
-- 
Regards,

Laurent Pinchart

