Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 617E267CF45
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 16:07:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232207AbjAZPHi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 10:07:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232172AbjAZPH2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 10:07:28 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E196BBEC
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 07:07:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DE93EB81DEF
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 15:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26EBC433A4;
        Thu, 26 Jan 2023 15:07:16 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 15/17] media: i2c: adp1653: introduce 'no_child' label
Date:   Thu, 26 Jan 2023 16:06:55 +0100
Message-Id: <20230126150657.367921-16-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl>
References: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The code mixed gotos and returns, which confused smatch. Add a no_child
label before the 'return -EINVAL;' to help smatch understand this.
It's a bit more consistent as well.

This fixes this smatch warning:

adp1653.c:444 adp1653_of_init() warn: missing unwind goto?

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/adp1653.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/adp1653.c b/drivers/media/i2c/adp1653.c
index a61a77de6eee..136bca801db7 100644
--- a/drivers/media/i2c/adp1653.c
+++ b/drivers/media/i2c/adp1653.c
@@ -420,7 +420,7 @@ static int adp1653_of_init(struct i2c_client *client,
 
 	child = of_get_child_by_name(node, "flash");
 	if (!child)
-		return -EINVAL;
+		goto no_child;
 
 	if (of_property_read_u32(child, "flash-timeout-us",
 				 &pd->max_flash_timeout))
@@ -441,7 +441,7 @@ static int adp1653_of_init(struct i2c_client *client,
 
 	child = of_get_child_by_name(node, "indicator");
 	if (!child)
-		return -EINVAL;
+		goto no_child;
 
 	if (of_property_read_u32(child, "led-max-microamp",
 				 &pd->max_indicator_intensity))
@@ -459,6 +459,7 @@ static int adp1653_of_init(struct i2c_client *client,
 err:
 	dev_err(&client->dev, "Required property not found\n");
 	of_node_put(child);
+no_child:
 	return -EINVAL;
 }
 
-- 
2.39.0

