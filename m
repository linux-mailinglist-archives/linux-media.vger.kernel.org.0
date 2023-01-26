Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 727DE67CF44
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 16:07:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbjAZPHd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 10:07:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232109AbjAZPH2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 10:07:28 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AE4B6BBF2
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 07:07:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CF799B81CC0
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 15:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE95BC433EF;
        Thu, 26 Jan 2023 15:07:14 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 13/17] media: i2c: ov7670: 0 instead of -EINVAL was returned
Date:   Thu, 26 Jan 2023 16:06:53 +0100
Message-Id: <20230126150657.367921-14-hverkuil-cisco@xs4all.nl>
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

If the media bus is unsupported, then return -EINVAL. Instead it
returned 'ret' which happened to be 0.

This fixes a smatch warning:

ov7670.c:1843 ov7670_parse_dt() warn: missing error code? 'ret'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov7670.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
index 27db0a07de1f..b1bb0833571e 100644
--- a/drivers/media/i2c/ov7670.c
+++ b/drivers/media/i2c/ov7670.c
@@ -1840,7 +1840,7 @@ static int ov7670_parse_dt(struct device *dev,
 
 	if (bus_cfg.bus_type != V4L2_MBUS_PARALLEL) {
 		dev_err(dev, "Unsupported media bus type\n");
-		return ret;
+		return -EINVAL;
 	}
 	info->mbus_config = bus_cfg.bus.parallel.flags;
 
-- 
2.39.0

