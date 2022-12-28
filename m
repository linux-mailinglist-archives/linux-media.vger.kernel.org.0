Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35231658562
	for <lists+linux-media@lfdr.de>; Wed, 28 Dec 2022 18:48:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232168AbiL1RsK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Dec 2022 12:48:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232106AbiL1RsI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Dec 2022 12:48:08 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C26CB1400F
        for <linux-media@vger.kernel.org>; Wed, 28 Dec 2022 09:48:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4A93661582
        for <linux-media@vger.kernel.org>; Wed, 28 Dec 2022 17:48:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE15C433EF;
        Wed, 28 Dec 2022 17:48:05 +0000 (UTC)
Message-ID: <1ae68c9f-726a-3307-65e6-e699be1fc7b9@xs4all.nl>
Date:   Wed, 28 Dec 2022 18:48:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.3] Convert to i2c's .probe_new()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is the second series of patches converting the old i2c probe() to
probe_new(). These depend on the new i2c_client_get_device_id() function,
so I had to wait until that function appeared in the 6.3 kernel.

Regards,

	Hans

The following changes since commit 6599e683db1bf22fee74302c47e31b9a42a1c3d2:

  Merge tag 'v6.2-rc1' into media_tree (2022-12-28 16:07:44 +0000)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.3a

for you to fetch changes up to d638a5b606e4f101e5e9482a188780bce92e9b8b:

  media: tuners/si2157: Convert to i2c's .probe_new() (2022-12-28 18:38:43 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Uwe Kleine-König (19):
      media: dvb-frontends/dvb-pll: Convert to i2c's .probe_new()
      media: dvb-frontends/m88ds3103: Convert to i2c's .probe_new()
      media: dvb-frontends/mn88443x: Convert to i2c's .probe_new()
      media: dvb-frontends/tc90522: Convert to i2c's .probe_new()
      media: i2c/adv7180: Convert to i2c's .probe_new()
      media: i2c/adv7604: Convert to i2c's .probe_new()
      media: i2c/cs53l32a: Convert to i2c's .probe_new()
      media: i2c/ir-kbd-i2c: Convert to i2c's .probe_new()
      media: i2c/msp3400-driver: Convert to i2c's .probe_new()
      media: i2c/mt9p031: Convert to i2c's .probe_new()
      media: i2c/mt9v032: Convert to i2c's .probe_new()
      media: i2c/ov7670: Convert to i2c's .probe_new()
      media: i2c/saa7115: Convert to i2c's .probe_new()
      media: i2c/saa7127: Convert to i2c's .probe_new()
      media: i2c/tda1997x: Convert to i2c's .probe_new()
      media: i2c/tvaudio: Convert to i2c's .probe_new()
      media: i2c/tvp514x: Convert to i2c's .probe_new()
      media: i2c/video-i2c: Convert to i2c's .probe_new()
      media: tuners/si2157: Convert to i2c's .probe_new()

 drivers/media/dvb-frontends/dvb-pll.c   | 5 +++--
 drivers/media/dvb-frontends/m88ds3103.c | 6 +++---
 drivers/media/dvb-frontends/mn88443x.c  | 6 +++---
 drivers/media/dvb-frontends/tc90522.c   | 6 +++---
 drivers/media/i2c/adv7180.c             | 6 +++---
 drivers/media/i2c/adv7604.c             | 6 +++---
 drivers/media/i2c/cs53l32a.c            | 6 +++---
 drivers/media/i2c/ir-kbd-i2c.c          | 5 +++--
 drivers/media/i2c/msp3400-driver.c      | 5 +++--
 drivers/media/i2c/mt9p031.c             | 6 +++---
 drivers/media/i2c/mt9v032.c             | 6 +++---
 drivers/media/i2c/ov7670.c              | 6 +++---
 drivers/media/i2c/saa7115.c             | 6 +++---
 drivers/media/i2c/saa7127.c             | 6 +++---
 drivers/media/i2c/tda1997x.c            | 6 +++---
 drivers/media/i2c/tvaudio.c             | 5 +++--
 drivers/media/i2c/tvp514x.c             | 6 +++---
 drivers/media/i2c/video-i2c.c           | 6 +++---
 drivers/media/tuners/si2157.c           | 6 +++---
 19 files changed, 57 insertions(+), 53 deletions(-)
