Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 091B45123C9
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 22:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235945AbiD0UXk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 16:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236558AbiD0UXd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 16:23:33 -0400
Received: from smtp.gentoo.org (smtp.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 347E5939CB
        for <linux-media@vger.kernel.org>; Wed, 27 Apr 2022 13:20:16 -0700 (PDT)
Message-ID: <90ec589b-7361-03aa-dab1-54ccd4116207@gentoo.org>
Date:   Wed, 27 Apr 2022 16:20:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To:     linux-media@vger.kernel.org
From:   Mike Pagano <mpagano@gentoo.org>
Subject: [PATCH 1/1] media: i2c: ov2640: Depend on V4L2_FWNODE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add V4L2_FWNODE as a dependency to match other drivers and prevent
failures when compile testing.

Signed-off-by: Mike Pagano <mpagano@gentoo.org>
---
  drivers/media/i2c/Kconfig | 1 +
  1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index fae2baabb773..6168c04d8b37 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -372,6 +372,7 @@ config VIDEO_OV13B10
  config VIDEO_OV2640
  	tristate "OmniVision OV2640 sensor support"
  	depends on VIDEO_DEV && I2C
+	select V4L2_FWNODE
  	help
  	  This is a Video4Linux2 sensor driver for the OmniVision
  	  OV2640 camera.
-- 
2.35.1
