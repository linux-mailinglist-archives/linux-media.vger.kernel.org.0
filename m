Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73CD82C44B8
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 17:14:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730560AbgKYQOP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 11:14:15 -0500
Received: from gofer.mess.org ([88.97.38.141]:36281 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729755AbgKYQOP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 11:14:15 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 35304C6379; Wed, 25 Nov 2020 16:14:14 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1606320854; bh=u72drLsALwTpFtQvU0vgWN6o8BnTxGJarqYuiLHc/gU=;
        h=Date:From:To:Subject:From;
        b=TMluLAmRS4MIncSKpN9Ewgj/iZeHZnM+V/qm0pMS+Smh5cN8vWCkmSpyor89wXGYU
         tKDR/Os9d5Dgahj26KTS0igb9mDOGxdOloWYyKQQMyyAkwyeONgAOk09a34MmTadGW
         Cmr4WDehPVZkkcm0b7muT0v1/77ehQeULfhZ5XKVV1C6LJqkJQSStZS4ZnCQysYdda
         Xf9DiaOi2Wx5veeGkuCFY8HIdf5HRtcFWQok7+hanN+llJoLc5j6Z31xDy8sR6ktpx
         zrPlfuCr5gLeG/SXL31NFx8c7qkqsDNnV9uREfPfFAJZWaVXnayUKtjDB/acwgDp/i
         H8ADjD90gPXdg==
Date:   Wed, 25 Nov 2020 16:14:14 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.11] RC/DVB fixes
Message-ID: <20201125161413.GA915@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 4863b93cfd2dfe88557f820b3399c3fa2163ec43:

  media: camss: csiphy: Set rate on csiX_phy clock on SDM630/660 (2020-11-25 15:02:44 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.11c

for you to fetch changes up to dcc231959b232085124f76c3d341eb8a1ce6cefd:

  media: rc: add keymap for KHAMSIN remote (2020-11-25 15:10:16 +0000)

----------------------------------------------------------------
v5.11c

----------------------------------------------------------------
Christian Hewitt (1):
      media: rc: add keymap for KHAMSIN remote

Kai Muenz (1):
      media: dvb-usb: Add Hauppauge MAX S2's USB-IDs

Keita Suzuki (1):
      media: siano: fix memory leak of debugfs members in smsdvb_hotplug

 Documentation/devicetree/bindings/media/rc.yaml |  1 +
 drivers/media/common/siano/smsdvb-main.c        |  5 +-
 drivers/media/rc/keymaps/Makefile               |  1 +
 drivers/media/rc/keymaps/rc-khamsin.c           | 75 +++++++++++++++++++++++++
 drivers/media/usb/dvb-usb/dw2102.c              |  8 ++-
 include/media/rc-map.h                          |  1 +
 6 files changed, 89 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/rc/keymaps/rc-khamsin.c
