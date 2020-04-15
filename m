Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7947C1A9926
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 11:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895741AbgDOJlj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 05:41:39 -0400
Received: from gofer.mess.org ([88.97.38.141]:43639 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2895721AbgDOJlf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 05:41:35 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 1FDAC11A002; Wed, 15 Apr 2020 10:41:31 +0100 (BST)
Date:   Wed, 15 Apr 2020 10:41:30 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.8] DVB/RC updates
Message-ID: <20200415094130.GA26234@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 8e5b5d75e9d0a6d75e554047ad5c8d2c935447d4:

  media: Kconfig: DVB support should be enabled for Digital TV (2020-04-15 10:06:59 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.8a

for you to fetch changes up to 3d951d70a1ac0952d4da8a699aec18db4fbe8fed:

  media: ir-rx51: Use 64-bit division macro (2020-04-15 10:11:23 +0100)

----------------------------------------------------------------
v5.8a

----------------------------------------------------------------
Christophe JAILLET (1):
      media: m88ds3103: Add missing '\n' in log messages

Colin Ian King (1):
      media: dvb: return -EREMOTEIO on i2c transfer failure.

Guru Das Srinagesh (1):
      media: ir-rx51: Use 64-bit division macro

Sean Young (3):
      media: dvb: digitv: remove unused array element 0
      media: rc: if kernel is built without an IR codec, don't advertise it
      media: dvb-usb: make dvb_usb_device_properties const

 drivers/media/dvb-frontends/m88ds3103.c      |   2 +-
 drivers/media/rc/ir-rx51.c                   |   2 +-
 drivers/media/usb/dvb-usb/a800.c             |   6 +-
 drivers/media/usb/dvb-usb/af9005.c           |   4 +-
 drivers/media/usb/dvb-usb/az6027.c           |   4 +-
 drivers/media/usb/dvb-usb/cxusb.c            |   4 +-
 drivers/media/usb/dvb-usb/dib0700.h          |  31 ++++----
 drivers/media/usb/dvb-usb/dib0700_core.c     |   6 +-
 drivers/media/usb/dvb-usb/dibusb-mb.c        |   2 +-
 drivers/media/usb/dvb-usb/digitv.c           |  29 ++++----
 drivers/media/usb/dvb-usb/dvb-usb-common.h   |   3 +-
 drivers/media/usb/dvb-usb/dvb-usb-firmware.c |   3 +-
 drivers/media/usb/dvb-usb/dvb-usb-init.c     |   8 +--
 drivers/media/usb/dvb-usb/dvb-usb.h          |  10 +--
 drivers/media/usb/dvb-usb/dw2102.c           |   4 +-
 drivers/media/usb/dvb-usb/m920x.c            |   4 +-
 drivers/media/usb/dvb-usb/technisat-usb2.c   |   4 +-
 drivers/media/usb/dvb-usb/ttusb2.c           |   7 +-
 include/media/rc-map.h                       | 103 ++++++++++++++++++++-------
 19 files changed, 151 insertions(+), 85 deletions(-)
