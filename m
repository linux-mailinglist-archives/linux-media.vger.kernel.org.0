Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8644B789860
	for <lists+linux-media@lfdr.de>; Sat, 26 Aug 2023 19:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbjHZRRa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Aug 2023 13:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjHZRRO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Aug 2023 13:17:14 -0400
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 803B1E5C
        for <linux-media@vger.kernel.org>; Sat, 26 Aug 2023 10:17:11 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id A18051000CD; Sat, 26 Aug 2023 18:17:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1693070229; bh=bIxfSfrsQswZJ5Cafjvp8CwnzR3aQdJBXWXtz8PG/U0=;
        h=From:To:Subject:Date:From;
        b=PBAFiZC6lKEseoa+3JaJpCO8pwVLLHzBAtGR4rLrWID/SBuQGYg6oIaHbjYToWdWD
         W496E4r1ERSkHcXliVp+Hqq1nA5lqFS526PY3wh1bcc26rh80ZpDTu8ebGT4A9dUdV
         QPizojiTU30W4FHbNc8BRCePtS0B5EOWG/hSx+ph4xZtQq0ustVa3R5uEM86yjM/o3
         YPFk/BJM6qOUyUCY1vMjdwr3oLpivG10NXl7tbTSgpk6KVk5e4H9fGFIWym98+Qndv
         qpL53gm5UQWRzXATloY0vSMOdrPfa4izBqA7x4tQ6dM36WG50Mp5/xsBNWrv9GFPiK
         FQH50S5wP7ftg==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4 0/2] Remove ir-rx51 driver
Date:   Sat, 26 Aug 2023 18:17:09 +0100
Message-Id: <20230826171709.366607-1-sean@mess.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ir-rx51 driver is no longer necessary, pwm-ir-tx does the same job
and is more generic.

changes:
 v4:
  - Fixed issues with pwm-ir-tx.yaml and did some more testing

 v3:
  - Fixed issues with pwm-ir-tx.yaml

 v2:
  - Made pwm-ir-tx compatible with nokia,n900-ir rather than changing
    the n900 devicetree


Sean Young (2):
  media: rc: remove ir-rx51 in favour of generic pwm-ir-tx
  dt-bindings: media: remove nokia,n900-ir as pwm-ir-tx is compatible

 .../bindings/leds/irled/pwm-ir-tx.yaml        |   5 +-
 .../devicetree/bindings/media/nokia,n900-ir   |  20 --
 arch/arm/configs/omap2plus_defconfig          |   1 -
 drivers/media/rc/Kconfig                      |  10 -
 drivers/media/rc/Makefile                     |   1 -
 drivers/media/rc/ir-rx51.c                    | 285 ------------------
 drivers/media/rc/pwm-ir-tx.c                  |   1 +
 7 files changed, 5 insertions(+), 318 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/nokia,n900-ir
 delete mode 100644 drivers/media/rc/ir-rx51.c

-- 
2.42.0

