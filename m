Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D05587D4F1B
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 13:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231437AbjJXLom (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 07:44:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232340AbjJXLok (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 07:44:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4552F10CC
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 04:44:38 -0700 (PDT)
Received: from umang.jain (unknown [103.86.18.159])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8DCE89CC;
        Tue, 24 Oct 2023 13:44:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698147864;
        bh=d/TBDkN7fp48rTk5REeNd656c8xRSfl6ruoVymyN7vk=;
        h=From:To:Cc:Subject:Date:From;
        b=IUDSbSJCJenITLZRrB+mJCAAoF4xnz5oKaRiL3njAI1TOHQXrnecL6NkEZZtFA4ap
         eWbDxLSnW2vkUObfFLyXdPM7v6LEVkEI2uTh/Bk4KHzarc/EnHMNyOfOgfNymeiA/U
         IIaTwTCM53t3obNp6nf0ERDFNg66+TKg0MAdwqx0=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 0/8] staging: vc04: Drop custom logging based on printk
Date:   Tue, 24 Oct 2023 07:44:20 -0400
Message-ID: <20231024114428.443528-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This series address the discussion on [1], i.e. removing the printk
based logging mechanism and migrate it use dynamic debug.

Patch 1/8 and 2/8 are prep-up patch to pass struct device pointers
so that we can use dev_dbg() in those functions. 

Patch 3/8 targets migration of vchiq_log_error() to use dynamic debug
Patch 4/8 targets migration of vchiq_log_warning() to use dynamic debug
Patch 5/8 targets rename of vchiq_log_info() to vchiq_log_debug() and
migration to use dynamic debug.
Patch 6/8 targets mirgration of vchiq_log_trace to use dynamic debug.

Patch 7/8 drops a unused macro.
Patch 8/8 is log levels remnants cleanup along with debugfs entries.

Changes in v2:
- Address feedback from v1, added 1/8, 2/8 as new patches
  Hence, Remove pr_*() based logging in few cases
- Cleanup debugfs log entries (8/8) and update TODO list
- Fixed bugs where NULL deference was happening due to unitialised
  pointers.

Testing:
Booted RPi 3-b with:
`dyndbg="file *vchiq_arm* +p" dyndbg="file *vchiq_core* +p"`
on cmdline.txt (kernel args)

And run drivers/staging/vc04_services/interface/TESTING and verify
dynamic debug logs with `dmesg -WH`.

[1] https://lore.kernel.org/linux-media/20230913185528.770634-1-umang.jain@ideasonboard.com/

Umang Jain (8):
  staging: vc04_services: Pass struct device to vchiq_log_dump_mem()
  staging: vc04_services: Pass struct device to vchiq_init_slots()
  staging: vc04: Convert vchiq_log_error() to use dynamic debug
  staging: vc04: Convert vchiq_log_warning() to use dynamic debug
  staging: vc04: Convert(and rename) vchiq_log_info() to use dynamic
    debug
  staging: vc04: Convert vchiq_log_trace() to use dynamic debug
  staging: vc04_services: Drop VCHIQ_LOG_PREFIX macro
  staging: vc04_services: Drop log level mechanisms

 drivers/staging/vc04_services/interface/TODO  |   5 -
 .../interface/vchiq_arm/vchiq_arm.c           | 149 ++++---
 .../interface/vchiq_arm/vchiq_arm.h           |   3 -
 .../interface/vchiq_arm/vchiq_connected.c     |   2 +-
 .../interface/vchiq_arm/vchiq_core.c          | 403 ++++++++----------
 .../interface/vchiq_arm/vchiq_core.h          |  61 +--
 .../interface/vchiq_arm/vchiq_debugfs.c       | 103 -----
 .../interface/vchiq_arm/vchiq_dev.c           |  59 +--
 8 files changed, 327 insertions(+), 458 deletions(-)

-- 
2.41.0

