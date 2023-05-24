Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC8670F5F0
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 14:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbjEXML7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 08:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbjEXML5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 08:11:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A54F95
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 05:11:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C3E8D63C95
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 12:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29F3AC433EF;
        Wed, 24 May 2023 12:11:54 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 2/8] media: rockchip: rga: fix clock cleanup
Date:   Wed, 24 May 2023 14:11:44 +0200
Message-Id: <20230524121150.435736-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230524121150.435736-1-hverkuil-cisco@xs4all.nl>
References: <20230524121150.435736-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix this smatch warning:

drivers/media/platform/rockchip/rga/rga.c:734 rga_enable_clocks() warn: 'rga->sclk' from clk_prepare_enable() not released on lines: 734.

The reason is that aclk should be disabled/unprepared before
sclk, instead of the other way around.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Jacob Chen <jacob-chen@iotwrt.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 67dcf22e5ba3..cbb33dd62fdd 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -726,10 +726,10 @@ static int rga_enable_clocks(struct rockchip_rga *rga)
 
 	return 0;
 
-err_disable_sclk:
-	clk_disable_unprepare(rga->sclk);
 err_disable_aclk:
 	clk_disable_unprepare(rga->aclk);
+err_disable_sclk:
+	clk_disable_unprepare(rga->sclk);
 
 	return ret;
 }
-- 
2.39.2

