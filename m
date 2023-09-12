Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A4F079C733
	for <lists+linux-media@lfdr.de>; Tue, 12 Sep 2023 08:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230296AbjILGxP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Sep 2023 02:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbjILGxP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Sep 2023 02:53:15 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ABCB9B
        for <linux-media@vger.kernel.org>; Mon, 11 Sep 2023 23:53:11 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id EA8371007F4; Tue, 12 Sep 2023 07:53:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1694501589; bh=wGvpcblluFnLBKaK8UBnOaxaMR+F28CaT5hY01WKTdc=;
        h=Date:From:To:Subject:From;
        b=aCoZ2SblYLguxYLi2HbT+77anvDH6Cahkn67xTWUw5KOn783u1d/GD27vAqeHm01X
         CgugzKD6/R/KikzDqrT7/jUyyHL7oQwMMiH5cbpZ64G8F7Bbe8LLS0z3wTaFRl6DOx
         9xntSiT9sVQtJIxKwJCj1biaQIqpaFoB9WjZO6kHW0WrQ1/7k3zCkIcRaUGgm/HHre
         6zZGQtzQUmYwjq3ixr77DqSt/fbRS/s9BCBA5exBApFJtP/p9GDWJj7BqpegMAxXkB
         Zc1B18sglgoTGUxfZU7KumEC04WaGSNDHubfJK+U6ABUrsZWrHYqiNJqFA2BgtHuJK
         SiEMc2UvfcS0Q==
Date:   Tue, 12 Sep 2023 07:53:09 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.7] RC fixes
Message-ID: <ZQAK1UxQlcx2ExWr@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit f32b68cd3604a824769ffeb02d2adea492a9d221:

  media: cx231xx: Add EP5_BUF_SIZE and EP5_TIMEOUT_MS macros (2023-09-06 12:29:09 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v6.7a

for you to fetch changes up to c6ab671c3b08b7b5231346ec7a7f06ff2b22bf07:

  arm64: dts: meson: add IR controller for Meson-S4 SoC (2023-09-11 11:49:43 +0100)

----------------------------------------------------------------
v6.7a

----------------------------------------------------------------
Sean Young (2):
      dt-bindings: media: remove nokia,n900-ir as pwm-ir-tx is compatible
      media: rc: remove ir-rx51 in favour of generic pwm-ir-tx

Zelong Dong (2):
      media: rc: meson-ir: support rc driver type RC_DRIVER_SCANCODE
      arm64: dts: meson: add IR controller for Meson-S4 SoC

 .../devicetree/bindings/leds/irled/pwm-ir-tx.yaml  |   5 +-
 .../devicetree/bindings/media/nokia,n900-ir        |  20 -
 arch/arm/configs/omap2plus_defconfig               |   1 -
 .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     |   6 +
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |  15 +
 drivers/media/rc/Kconfig                           |  10 -
 drivers/media/rc/Makefile                          |   1 -
 drivers/media/rc/ir-rx51.c                         | 285 -----------
 drivers/media/rc/meson-ir.c                        | 522 ++++++++++++++++++---
 drivers/media/rc/pwm-ir-tx.c                       |   1 +
 10 files changed, 477 insertions(+), 389 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/nokia,n900-ir
 delete mode 100644 drivers/media/rc/ir-rx51.c
