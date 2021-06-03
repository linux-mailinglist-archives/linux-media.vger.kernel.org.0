Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC3EE39A0B7
	for <lists+linux-media@lfdr.de>; Thu,  3 Jun 2021 14:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbhFCMWk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 08:22:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbhFCMWj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Jun 2021 08:22:39 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48303C06174A
        for <linux-media@vger.kernel.org>; Thu,  3 Jun 2021 05:20:55 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 5C8ECC641C; Thu,  3 Jun 2021 13:20:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1622722852; bh=ryjo/EatSH7G4ocBORSRb4BN45QkqUk5EqvG/uxZkCQ=;
        h=Date:From:To:Subject:From;
        b=aX6Gc0YQ0Z28Gqwx81vFeexeeA7pyqatYfqsSz8+iFJPEI6O29Pf7Hn7rRMVI09Xi
         mfPwvOnDdDIh1gh7BAhuHTBEr1UIeWBp1JKD00Bb4BjoX+cBR4V79GJMGPcKzy/pZ5
         E+MlGD/2xBR8YZ2gZZ0gkrqJcHI9BeuHhxgGfhfFVfq9HJ3ps77JJ4sbjLETOyoG+N
         AQH4n6uuRNYC1BtCgGv1v6DzSeCaXHkS7XPbVVYaCnjEWuftaVgzS5MT7ZD9tS5qLi
         Qf2ABCrVQjfeRToVi7gh5p47lTJbbK1ySpj9n7VSZJkBmoRy/bVs9lT/7YMXEkpNas
         6hrsB15rcTQkQ==
Date:   Thu, 3 Jun 2021 13:20:52 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.14] rc and dvb: new keymap, constify and more
Message-ID: <20210603122052.GA17253@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 71c689dc2e732d4cb190aaf0edea73116b1611bd:

  media: v4l2-ctrls: split up into four source files (2021-05-25 17:03:29 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.14b

for you to fetch changes up to a5ee5f3bd5a1b3805e7f3fd0fac13b9458fecd50:

  media: imon: use DEVICE_ATTR_RW() helper macro (2021-06-03 11:50:07 +0100)

----------------------------------------------------------------
v5.14b

----------------------------------------------------------------
Alexander Voronov (1):
      media: rc: add keymap for Toshiba CT-90405 remote

Christophe JAILLET (1):
      media: cxd2880-spi: Fix some error messages

Colin Ian King (1):
      media: mxl692: make a const array static, makes object smaller

Dongliang Mu (1):
      media: dvd_usb: memory leak in cinergyt2_fe_attach

Evgeny Novikov (1):
      media: st_rc: Handle errors of clk_prepare_enable()

Sean Young (1):
      media: cinergyt2: make properties const

Zhen Lei (1):
      media: imon: use DEVICE_ATTR_RW() helper macro

 Documentation/devicetree/bindings/media/rc.yaml |  1 +
 drivers/media/dvb-frontends/mxl692.c            |  4 +-
 drivers/media/rc/imon.c                         | 15 ++---
 drivers/media/rc/keymaps/Makefile               |  1 +
 drivers/media/rc/keymaps/rc-ct-90405.c          | 86 +++++++++++++++++++++++++
 drivers/media/rc/st_rc.c                        | 22 +++++--
 drivers/media/spi/cxd2880-spi.c                 | 12 ++--
 drivers/media/usb/dvb-usb/cinergyT2-core.c      | 13 ++--
 include/media/rc-map.h                          |  1 +
 9 files changed, 127 insertions(+), 28 deletions(-)
 create mode 100644 drivers/media/rc/keymaps/rc-ct-90405.c
