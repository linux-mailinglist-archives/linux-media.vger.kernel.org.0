Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1EC932BB06
	for <lists+linux-media@lfdr.de>; Wed,  3 Mar 2021 22:04:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358589AbhCCMOG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 07:14:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1843077AbhCCKZT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 05:25:19 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2B37C034620
        for <linux-media@vger.kernel.org>; Wed,  3 Mar 2021 01:33:33 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 5A91CC63BE; Wed,  3 Mar 2021 09:33:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1614764011; bh=2JO4cvRR7z/zyCTetF5QSzXbgnWp6XLZ0MXqjc0lum4=;
        h=Date:From:To:Subject:From;
        b=c5WxUly0PAbT4Eb2v9f8seN+mXixace+0QMqPKZBJD0HA2kq1G390HzE0I/ud2AeI
         BAEaeACYb7kwo5YL/XmKjC2WWresTkivfJloZj+H/4i8ulYfOOoWavoOGQn3rCe44w
         7wfhzTqkNoHDlpCTEw/9ShM4GuScUz6J08DQAEug8vnP1P0hA94kfReC7coIyJdATk
         qjfdFyCYNkJ20T73edlNB6FiIzFJhcoAQ1WmMHaGyc05tKgcNNEhFv5XGZ9cPVxEsy
         wO0QLxaqIwbO/wrYNcR56yujJQiGDW4NBU4ZU/P+24006Rta5O9tl+vwyry09GxD0C
         tDlwPz8gwU+tw==
Date:   Wed, 3 Mar 2021 09:33:31 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.13] RC & DVB fixes
Message-ID: <20210303093331.GA21839@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

First batch of rc & dvb fixes. 

Thanks

Sean

The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:

  Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git for-v5.13a

for you to fetch changes up to d2698e1c31b1ed334e5c03d145f2179e43c4ceaa:

  media: rc: add keymap for Xbox 360 Universal Media remote (2021-03-02 10:43:09 +0000)

----------------------------------------------------------------
Bastien Nocera (1):
      media: rc: add keymap for Xbox 360 Universal Media remote

Brad Love (2):
      media: em28xx: Add pid for bulk revision of Hauppauge 461e
      media: em28xx: Add pid for bulk revision of Hauppauge 461eV2

Christian Hewitt (1):
      media: rc: add keymap for minix-neo remote

Daode Huang (1):
      media: rc/ite-cir: replace spin_lock_irqsave by spin_lock in hard IRQ

Sean Young (7):
      media: ite-cir: remove unused fields
      media: ite-cir: set parent device
      media: ite-cir: use standard logging and reduce noise
      media: ite-cir: carrier and duty cycle can be set via ioctl
      media: ite-cir: move runtime information into driver data
      media: ite-cir: check for receive overflow
      media: ite-cir: in_use is not needed

Takashi Iwai (2):
      media: dvb-usb: Fix memory leak at error in dvb_usb_device_init()
      media: dvb-usb: Fix use-after-free access

 Documentation/devicetree/bindings/media/rc.yaml |   2 +
 drivers/media/rc/ite-cir.c                      | 349 ++++++------------------
 drivers/media/rc/ite-cir.h                      |  51 +---
 drivers/media/rc/keymaps/Makefile               |   2 +
 drivers/media/rc/keymaps/rc-minix-neo.c         |  55 ++++
 drivers/media/rc/keymaps/rc-xbox-360.c          |  83 ++++++
 drivers/media/usb/dvb-usb/dvb-usb-init.c        |  70 +++--
 drivers/media/usb/em28xx/em28xx-cards.c         |   4 +
 include/media/rc-map.h                          |   2 +
 9 files changed, 286 insertions(+), 332 deletions(-)
 create mode 100644 drivers/media/rc/keymaps/rc-minix-neo.c
 create mode 100644 drivers/media/rc/keymaps/rc-xbox-360.c
