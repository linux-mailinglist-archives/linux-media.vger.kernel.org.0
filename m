Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16AAD7E3829
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 10:52:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233839AbjKGJwN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 04:52:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233826AbjKGJwM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 04:52:12 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A13B4F3
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 01:52:09 -0800 (PST)
Received: from umang.jain (unknown [103.251.226.110])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B477F468;
        Tue,  7 Nov 2023 10:51:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1699350705;
        bh=992nyrW3qUC6fzmLZft4VuCTg3PrVta5dBlOJYrS35k=;
        h=From:To:Cc:Subject:Date:From;
        b=aviGoKyF5NftuZmyd/Nb3WLsScbCXI2DuSnLk+A7qwghnMoQP0LlPrlvGKtgH2dkR
         VMAoU3XFex629xKg3DDH21wy1WYmKQ+2xBFpNaHfKFEch+H/k7Ucdaw3soEWse2GTg
         uV0ELuXZZhHwUch5MCgbJuFW8eBgOFi48VUM2j0M=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 0/9] staging: vc04_services: Smatch fixes and remove custom logging
Date:   Tue,  7 Nov 2023 04:51:47 -0500
Message-ID: <20231107095156.365492-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Patch 1/9 to 3/9 targets the warnings exposed by Smatch analysis.
Smatch fixes was sent earlier under "staging: vc04: Smatch analysis
fixes", but now I have patches on top of them, I have tied
these fixes in this series (so could be merged all at once).

This series also removes the vchiq_log_* macro and makes use of dev_dbg()
directly.

4/9 is just a drive-by patch to shorten function helper.
5/9 is bug fixup where NULL was passed instead of a struct device
pointer

6/9 to 7/9 removes each of the vchiq_log_* respectively.

This completes the following TODO item:

```
* Cleanup logging mechanism

The driver should probably be using the standard kernel logging mechanisms
such as dev_info, dev_dbg, and friends.
```

Umang Jain (9):
  staging: vc04_services: vchiq_core: Log through struct vchiq_instance
  staging: vc04_services: Log using pr_err() when vchiq_state is unset
  staging: vc04_services: bcm2835-camera: Remove redundant null check
  staging: vc04_services: Shorten helper function name
  staging: vc04_services: Do not pass NULL to vchiq_log_error()
  staging: vc04_services: Drop vchiq_log_error() in favour of dev_dbg
  staging: vc04_services: Drop vchiq_log_warning() in favour of dev_dbg
  staging: vc04_services: Drop vchiq_log_trace() in favour of dev_dbg
  staging: vc04_services: Drop vchiq_log_debug() in favour of dev_dbg

 .../bcm2835-camera/bcm2835-camera.c           |   7 +-
 drivers/staging/vc04_services/interface/TODO  |   5 -
 .../interface/vchiq_arm/vchiq_arm.c           | 223 +++++----
 .../interface/vchiq_arm/vchiq_connected.c     |   8 +-
 .../interface/vchiq_arm/vchiq_connected.h     |   4 +-
 .../interface/vchiq_arm/vchiq_core.c          | 463 ++++++++++--------
 .../interface/vchiq_arm/vchiq_core.h          |  36 +-
 .../interface/vchiq_arm/vchiq_dev.c           | 112 +++--
 8 files changed, 461 insertions(+), 397 deletions(-)


base-commit: d2f51b3516dade79269ff45eae2a7668ae711b25
-- 
2.41.0

