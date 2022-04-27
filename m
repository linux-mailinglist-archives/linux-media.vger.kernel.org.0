Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2B5B5124E8
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 23:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235346AbiD0WCm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 18:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237870AbiD0WCj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 18:02:39 -0400
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 004BE26FF
        for <linux-media@vger.kernel.org>; Wed, 27 Apr 2022 14:59:25 -0700 (PDT)
Message-ID: <5ba2bee6-5d00-6414-a30a-7f8be8596eb0@gentoo.org>
Date:   Wed, 27 Apr 2022 17:59:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
References: <90ec589b-7361-03aa-dab1-54ccd4116207@gentoo.org>
 <YmmthjPAJIboBCbk@valkosipuli.retiisi.eu>
 <7a3bfccf-743f-6c18-e221-9490c258a903@gentoo.org>
From:   Mike Pagano <mpagano@gentoo.org>
To:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1 v2] media: i2c: ov2640: Depend on V4L2_ASYNC
In-Reply-To: <7a3bfccf-743f-6c18-e221-9490c258a903@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add V4L2_ASYNC as a dependency to match other drivers and prevent failures when compile testing.

Fixes: ff3cc65cadb5 ("media: v4l: async, fwnode: Improve module organisation")

Signed-off-by: Mike Pagano <mpagano@gentoo.org>
---
  drivers/media/i2c/Kconfig | 1 +
  1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index fae2baabb773..2b20aa6c37b1 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -372,6 +372,7 @@ config VIDEO_OV13B10
  config VIDEO_OV2640
  	tristate "OmniVision OV2640 sensor support"
  	depends on VIDEO_DEV && I2C
+	select V4L2_ASYNC
  	help
  	  This is a Video4Linux2 sensor driver for the OmniVision
  	  OV2640 camera.
-- 
2.35.1
