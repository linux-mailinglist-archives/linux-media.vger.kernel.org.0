Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5FC12DE53
	for <lists+linux-media@lfdr.de>; Wed,  1 Jan 2020 10:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725809AbgAAJ12 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jan 2020 04:27:28 -0500
Received: from gofer.mess.org ([88.97.38.141]:38363 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725783AbgAAJ12 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Jan 2020 04:27:28 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 2B36C11A001; Wed,  1 Jan 2020 09:27:27 +0000 (GMT)
Date:   Wed, 1 Jan 2020 09:27:26 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.6] DVB & RC
Message-ID: <20200101092726.GA15659@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are the first set of changes for dvb and rc.

Thanks,
Sean

The following changes since commit 0885acd77eb4644fd88f6d9f41e433f4ee9bc37a:

  media: vivid: support multiplanar touch devices (2019-12-16 13:24:16 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.6a

for you to fetch changes up to 7f539aff71435d56f374912935565ee8efb287f4:

  media: dvb: add support for TerraTec TC2 Stick (193534) (2020-01-01 08:27:23 +0000)

----------------------------------------------------------------
v5.6a

----------------------------------------------------------------
Bodo Eggert (1):
      media: serial_ir: change "ignoring spike" to debug level

Daniel W. S. Almeida (2):
      media: dvb_dummy_fe: place EXPORT_SYMBOL below corresponding function
      media: dvb_dummy_fe: Add blank line after declaration

David J. Fiddes (1):
      media: rtl28xxu: Add support for PROlectrix DV107669 DVB-T dongle

James Hogan (1):
      MAINTAINERS: Orphan img-ir driver

Sean Young (5):
      media: digitv: don't continue if remote control state can't be read
      media: af9005: uninitialized variable printked
      media: vp7045: do not read uninitialized values if usb transfer fails
      media: cxusb: use dev_dbg() rather than hand-rolled debug
      media: rc: ensure lirc is initialized before registering input device

Tomasz Maciej Nowak (1):
      media: dvb: add support for TerraTec TC2 Stick (193534)

 MAINTAINERS                                |  3 +--
 drivers/media/dvb-frontends/dvb_dummy_fe.c | 10 ++++-----
 drivers/media/rc/rc-main.c                 | 27 ++++++++++++++----------
 drivers/media/rc/serial_ir.c               |  2 +-
 drivers/media/usb/dvb-usb-v2/af9035.c      | 15 +++++++++-----
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c    |  2 ++
 drivers/media/usb/dvb-usb/af9005.c         |  2 +-
 drivers/media/usb/dvb-usb/cxusb.c          | 33 ++++++++++++++----------------
 drivers/media/usb/dvb-usb/digitv.c         | 10 ++++++---
 drivers/media/usb/dvb-usb/vp7045.c         | 21 ++++++++++++-------
 include/media/dvb-usb-ids.h                |  2 ++
 11 files changed, 74 insertions(+), 53 deletions(-)
