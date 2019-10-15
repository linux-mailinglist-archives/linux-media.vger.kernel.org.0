Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBBDD71A6
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 10:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727898AbfJOI7F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 04:59:05 -0400
Received: from gofer.mess.org ([88.97.38.141]:46145 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726335AbfJOI7F (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 04:59:05 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 0BEEFC6391; Tue, 15 Oct 2019 09:59:03 +0100 (BST)
Date:   Tue, 15 Oct 2019 09:59:03 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.5] DVB/RC (II)
Message-ID: <20191015085903.GA11348@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

We have a new keymap, new usb IDs, some minor cleanups and the DVB fixes
you wrote.

Thanks,

Sean

The following changes since commit 3ff3a712a9eabb3d7bf52c263dd1ece054345df4:

  media: ti-vpe: vpe: don't rely on colorspace member for conversion (2019-10-10 13:54:22 -0300)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.5ii

for you to fetch changes up to 34c982dfacb381ac0984b4ded082deb35e9c5dc0:

  media: cxd2841er: avoid too many status inquires (2019-10-14 16:02:18 +0100)

----------------------------------------------------------------
5.5 II

----------------------------------------------------------------
Christian Hewitt (1):
      media: rc: add keymap for Tronsmart Vega S95/S96 remote

Jisheng Zhang (1):
      media: rc-map: Sort rc map name MACROs

Mauro Carvalho Chehab (2):
      media: mb86a20s: make the bit rate estimation function more generic
      media: cxd2841er: avoid too many status inquires

Sean Young (1):
      media: imon_raw: simplify loop

Thomas Voegtle (1):
      media: dvbsky: add support for eyeTV Geniatech T2 lite

Vito Caputo (1):
      media: cxusb: detect cxusb_ctrl_msg error in query

zhong jiang (2):
      media: dvb-frontends: Use DIV_ROUND_CLOSEST directly to make it readable
      media: tuners/qm1d1c0042: Use DIV_ROUND_CLOSEST directly to make it readable

 drivers/media/dvb-frontends/cxd2841er.c | 12 +++++++-
 drivers/media/dvb-frontends/mb86a20s.c  | 54 ++++++++++++++-------------------
 drivers/media/dvb-frontends/mt312.c     | 13 +++-----
 drivers/media/rc/imon_raw.c             | 22 +++-----------
 drivers/media/rc/keymaps/Makefile       |  1 +
 drivers/media/rc/keymaps/rc-vega-s9x.c  | 54 +++++++++++++++++++++++++++++++++
 drivers/media/tuners/qm1d1c0042.c       |  2 +-
 drivers/media/usb/dvb-usb-v2/dvbsky.c   |  3 ++
 drivers/media/usb/dvb-usb/cxusb.c       |  3 +-
 include/media/dvb-usb-ids.h             |  1 +
 include/media/rc-map.h                  | 23 +++++++-------
 11 files changed, 116 insertions(+), 72 deletions(-)
 create mode 100644 drivers/media/rc/keymaps/rc-vega-s9x.c
