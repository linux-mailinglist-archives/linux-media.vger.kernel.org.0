Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07E9D51F8D7
	for <lists+linux-media@lfdr.de>; Mon,  9 May 2022 12:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232200AbiEIJvc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 May 2022 05:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237101AbiEIJUe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 May 2022 05:20:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96F1E14916F
        for <linux-media@vger.kernel.org>; Mon,  9 May 2022 02:16:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 74963614AB
        for <linux-media@vger.kernel.org>; Mon,  9 May 2022 09:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 034E3C385AC;
        Mon,  9 May 2022 09:16:02 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 6/7] s5k6a3: add missing clk_disable_unprepare
Date:   Mon,  9 May 2022 11:15:52 +0200
Message-Id: <20220509091553.2637089-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220509091553.2637089-1-hverkuil-cisco@xs4all.nl>
References: <20220509091553.2637089-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix smatch warning:

drivers/media/i2c/s5k6a3.c:234 __s5k6a3_power_on() warn: 'sensor->clock' from clk_prepare_enable() not released on lines: 234.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/i2c/s5k6a3.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/s5k6a3.c b/drivers/media/i2c/s5k6a3.c
index b97dd6149e90..f6ecf6f92bb2 100644
--- a/drivers/media/i2c/s5k6a3.c
+++ b/drivers/media/i2c/s5k6a3.c
@@ -213,7 +213,7 @@ static int __s5k6a3_power_on(struct s5k6a3 *sensor)
 	for (i++; i < S5K6A3_NUM_SUPPLIES; i++) {
 		ret = regulator_enable(sensor->supplies[i].consumer);
 		if (ret < 0)
-			goto error_reg_dis;
+			goto error_clk;
 	}
 
 	gpio_set_value(sensor->gpio_reset, 1);
@@ -226,6 +226,8 @@ static int __s5k6a3_power_on(struct s5k6a3 *sensor)
 	msleep(20);
 	return 0;
 
+error_clk:
+	clk_disable_unprepare(sensor->clock);
 error_reg_dis:
 	for (--i; i >= 0; --i)
 		regulator_disable(sensor->supplies[i].consumer);
-- 
2.34.1

