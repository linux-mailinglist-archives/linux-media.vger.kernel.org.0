Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3E1E56C4A6
	for <lists+linux-media@lfdr.de>; Sat,  9 Jul 2022 01:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239675AbiGHSrK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jul 2022 14:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239198AbiGHSrJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jul 2022 14:47:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F06BF5070B
        for <linux-media@vger.kernel.org>; Fri,  8 Jul 2022 11:47:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AE690B825EB
        for <linux-media@vger.kernel.org>; Fri,  8 Jul 2022 18:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26A5C341C0;
        Fri,  8 Jul 2022 18:47:05 +0000 (UTC)
Message-ID: <6381ead8-3d1a-372d-a331-e103529dd766@xs4all.nl>
Date:   Fri, 8 Jul 2022 20:47:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] ar0521: fix Kconfig: VIDEO_V4L2 -> VIDEO_DEV
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VIDEO_V4L2 no longer exists, instead use VIDEO_DEV. Without this change
this driver cannot be selected.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 9f274162bca0..b3812371c755 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -36,7 +36,7 @@ config VIDEO_CCS_PLL
 
 config VIDEO_AR0521
 	tristate "ON Semiconductor AR0521 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
