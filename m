Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E754237F4BB
	for <lists+linux-media@lfdr.de>; Thu, 13 May 2021 11:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231267AbhEMJPm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 May 2021 05:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230343AbhEMJPk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 May 2021 05:15:40 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0263C061574
        for <linux-media@vger.kernel.org>; Thu, 13 May 2021 02:14:30 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 604F4C64D7; Thu, 13 May 2021 10:14:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1620897267; bh=W+JOR5GgfgX4k62dbGSMT6dyoZpjI8Q+88z76eouRpw=;
        h=Date:From:To:Subject:From;
        b=MwhdSGhoWvFUVuEJB6PPP/6fDt3e/UJWqu8SIjGEOwfhk39LJtrk4JmwcmHFUsCmO
         U9rgcCXLRYeKkxx1n2fY6kqiuKZS4XFnoCgDExegQVntzdK3p5MprhBz2t4ZZvyf/Q
         tktBZg87vpEYfdg9Br8aIyYKaH+GYshnt45PszOPLP8LeCLfRwKLms2NS5D4SZe9s0
         1Z7Jc8rT6wY39oIrSY27tl/silyaOnPNHMtcA0j3zAZgoh9U6w1P8gmsw5UAHSOVE9
         +HZ6xHOspWrQyjcBB2S9D/MROSAWHEIgHSQ7wS10s3g6dzAMc/+uDFJX0XHRbvq3Cp
         WhIy3j/5/lZ8w==
Date:   Thu, 13 May 2021 10:14:27 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.14] Minor RC & DVB updates
Message-ID: <20210513091426.GA12409@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 73edc4da40635774100d0eb9ca2e6476e3b2b470:

  media: staging: media: atomisp: pci: Format comments according to coding-style in file atomisp_cmd.h (2021-05-10 11:36:35 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.14a

for you to fetch changes up to 48e871fb566d07bf822b90d94e084cbd15d8e449:

  media: dvb-usb: fix wrong definition (2021-05-13 10:06:06 +0100)

----------------------------------------------------------------
v5.14a

----------------------------------------------------------------
Arnd Bergmann (2):
      media: rc: remove tango ir driver and keymap
      media: rc: clean up Kconfig dependencies

Christophe JAILLET (1):
      media: rc: i2c: Fix an error message

Dan Carpenter (1):
      media: lmedm04: delete lme2510_get_adapter_count()

Pavel Skripkin (1):
      media: dvb-usb: fix wrong definition

Sean Young (1):
      media: lirc: remove out of date comment

Ye Bin (1):
      media: siano: use DEFINE_MUTEX() for mutex lock and LIST_HEAD for list head

wengjianfeng (1):
      media: dvb-frontends: remove redundant words and fix several typos

 Documentation/devicetree/bindings/media/rc.yaml    |   1 -
 .../devicetree/bindings/media/tango-ir.txt         |  21 --
 drivers/media/common/siano/smsdvb-main.c           |   7 +-
 drivers/media/dvb-frontends/drx39xyj/drxj.h        |  35 +--
 drivers/media/i2c/ir-kbd-i2c.c                     |   4 +-
 drivers/media/rc/Kconfig                           |  83 +------
 drivers/media/rc/Makefile                          |   1 -
 drivers/media/rc/keymaps/Makefile                  |   1 -
 drivers/media/rc/keymaps/rc-tango.c                |  89 -------
 drivers/media/rc/tango-ir.c                        | 267 ---------------------
 drivers/media/usb/dvb-usb-v2/lmedm04.c             |   9 +-
 drivers/media/usb/dvb-usb/cxusb.c                  |   2 +-
 include/media/rc-map.h                             |   1 -
 include/uapi/linux/lirc.h                          |   1 -
 14 files changed, 35 insertions(+), 487 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/tango-ir.txt
 delete mode 100644 drivers/media/rc/keymaps/rc-tango.c
 delete mode 100644 drivers/media/rc/tango-ir.c
