Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 202A17AAC03
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 10:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232327AbjIVILD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 04:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232333AbjIVIKq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 04:10:46 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D9D4CC6
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 01:10:39 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id B54B01000CC; Fri, 22 Sep 2023 09:10:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1695370236; bh=Agf7BL8ucpfXF1Z+yvl21G+4q4GDgxleODPbzqF4R2A=;
        h=Date:From:To:Subject:From;
        b=LvadacdL6y1RdJnqyaXs8q+A9816kZO5bGtbARttQAMMfKelABbdVt8QoobD+Bjf1
         EZvzCGlbKs5tVAoJmdn70r31qSGRiDVee73Jri+zwU/mox5g0OsutG+KVbjKpL9KE9
         1JUtaTCtEsJYobqRy1Y6rIOABDPILIxwJ2c7AfCpZvPfq2yvDYwFitgH0vULon+lDE
         gPKGtoq5VsPZXaRSy6k7h4zI00f66xYVAAHp9rm90v3oCtdWoQGIUOYOOrNg/fHTWX
         ct75h6YoAjwKPbRGuoXblrNQZIB4IR0qc6FPZc8l2qc+Ab5jyuzOMmz2cMyqnix5xp
         x1SjVAQ8DvHZw==
Date:   Fri, 22 Sep 2023 09:10:36 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.7] RC fixes (v2)
Message-ID: <ZQ1L/LOtJn1ewOG/@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 776c8d0a4ed54ddc93b72ccf2a3d716880a0ff02:

  media: remove the old videobuf framework (2023-09-21 14:45:05 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v6.7a

for you to fetch changes up to 7183c8d35b360589d0d0588f97907790033332fc:

  dt-bindings: media: Add compatible for Meson-S4 IR Controller (2023-09-22 08:35:48 +0100)

----------------------------------------------------------------
v6.7a

----------------------------------------------------------------
Sean Young (2):
      dt-bindings: media: remove nokia,n900-ir as pwm-ir-tx is compatible
      media: rc: remove ir-rx51 in favour of generic pwm-ir-tx

Zelong Dong (2):
      media: rc: meson-ir: support rc driver type RC_DRIVER_SCANCODE
      dt-bindings: media: Add compatible for Meson-S4 IR Controller

 .../devicetree/bindings/leds/irled/pwm-ir-tx.yaml  |   5 +-
 .../bindings/media/amlogic,meson6-ir.yaml          |   1 +
 .../devicetree/bindings/media/nokia,n900-ir        |  20 -
 arch/arm/configs/omap2plus_defconfig               |   1 -
 drivers/media/rc/Kconfig                           |  10 -
 drivers/media/rc/Makefile                          |   1 -
 drivers/media/rc/ir-rx51.c                         | 285 -----------
 drivers/media/rc/meson-ir.c                        | 522 ++++++++++++++++++---
 drivers/media/rc/pwm-ir-tx.c                       |   1 +
 9 files changed, 457 insertions(+), 389 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/nokia,n900-ir
 delete mode 100644 drivers/media/rc/ir-rx51.c
