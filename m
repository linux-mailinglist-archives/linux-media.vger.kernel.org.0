Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4075B3C6D8A
	for <lists+linux-media@lfdr.de>; Tue, 13 Jul 2021 11:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235181AbhGMJgO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jul 2021 05:36:14 -0400
Received: from gofer.mess.org ([88.97.38.141]:51475 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234819AbhGMJgN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jul 2021 05:36:13 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 2E47DC6373; Tue, 13 Jul 2021 10:33:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1626168803; bh=iBhVL6JNTxsDZBB6F9X1eAVRe+iFjRlCPMWJ6L0avk8=;
        h=Date:From:To:Subject:From;
        b=kpgsqTg8eFaLF2S0u4tqfhWSgRzWnCR51z5tDinGBzyujQjIN8Seln+4oqFTFLKGH
         4wrmBmenAyvf1FlcsuHCXVkQTT+ecoLechF3wSGOv8yuLA4tUABkZddxy06MDvvMXp
         DGhg0WNLl6Tu5pksktWZKucG1Z2b6+qig9di+14X1S+Iz95LGrG18UJVDRN0eRlTyb
         sCVY94acCqISv/8bdbF9KPcNhmaXIoYO10KXwMW0uhUqpIjwUOm+s3F5GEGFSgULSX
         NGCCcnVNGZUNuZTGhPNFiMLjkLBTID9fXy8cr9H04J7tGxEzqGJmLpnKtgg1Mltdjt
         2cM9U4kkKt0Jg==
Date:   Tue, 13 Jul 2021 10:33:23 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.15] Various fixes
Message-ID: <20210713093322.GD6572@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 379e205dab9d7f9761984728e7d6f5f8305cc424:

  media: usb: dvb-usb-v2: af9035: let subdrv autoselect enable si2168 and si2157 (2021-07-12 14:28:49 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.15a

for you to fetch changes up to 21cc8c46c8c700b58de82577adb56c259a311a06:

  media: dvb-usb: Fix error handling in dvb_usb_i2c_init (2021-07-13 10:21:02 +0100)

----------------------------------------------------------------
v5.15a

----------------------------------------------------------------
Dongliang Mu (3):
      media: dvb-usb: fix uninit-value in dvb_usb_adapter_dvb_init
      media: dvb-usb: fix uninit-value in vp702x_read_mac_addr
      media: dvb-usb: Fix error handling in dvb_usb_i2c_init

Sean Young (5):
      media: rc-loopback: return number of emitters rather than error
      media: rc-loopback: use dev_dbg() rather than handrolled debug
      media: rc-loopback: send carrier reports
      media: rc-loopback: max_timeout of UINT_MAX does not work
      media: rc: rename s_learning_mode() to s_wideband_receiver()

 drivers/media/rc/ene_ir.c                |  2 +-
 drivers/media/rc/lirc_dev.c              |  6 +--
 drivers/media/rc/mceusb.c                |  2 +-
 drivers/media/rc/rc-loopback.c           | 82 ++++++++++++++++----------------
 drivers/media/usb/dvb-usb/dvb-usb-i2c.c  |  9 +++-
 drivers/media/usb/dvb-usb/dvb-usb-init.c |  2 +-
 drivers/media/usb/dvb-usb/nova-t-usb2.c  |  6 ++-
 drivers/media/usb/dvb-usb/vp702x.c       | 12 +++--
 include/media/rc-core.h                  |  5 +-
 9 files changed, 70 insertions(+), 56 deletions(-)
