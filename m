Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1515C7BB4DD
	for <lists+linux-media@lfdr.de>; Fri,  6 Oct 2023 12:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231705AbjJFKJI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Oct 2023 06:09:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231663AbjJFKJF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Oct 2023 06:09:05 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8865CFD
        for <linux-media@vger.kernel.org>; Fri,  6 Oct 2023 03:09:04 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BD5BC433D9;
        Fri,  6 Oct 2023 10:09:02 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 8/9] media: i2c: mt9m114: goto proper error path
Date:   Fri,  6 Oct 2023 12:08:49 +0200
Message-Id: <6e2b3d5971905c1cf63184e7c3cd269c10151bb7.1696586632.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1696586632.git.hverkuil-cisco@xs4all.nl>
References: <cover.1696586632.git.hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In two places the probe function returns instead of going
to the correct goto label.

This fixes this smatch warning:

drivers/media/i2c/mt9m114.c:2381 mt9m114_probe() warn: missing unwind goto?

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/mt9m114.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index dae675e52390..ac19078ceda3 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2367,7 +2367,7 @@ static int mt9m114_probe(struct i2c_client *client)
 
 	ret = mt9m114_clk_init(sensor);
 	if (ret)
-		return ret;
+		goto error_ep_free;
 
 	/*
 	 * Identify the sensor. The driver supports runtime PM, but needs to
@@ -2378,7 +2378,7 @@ static int mt9m114_probe(struct i2c_client *client)
 	ret = mt9m114_power_on(sensor);
 	if (ret < 0) {
 		dev_err_probe(dev, ret, "Could not power on the device\n");
-		return ret;
+		goto error_ep_free;
 	}
 
 	ret = mt9m114_identify(sensor);
-- 
2.40.1

