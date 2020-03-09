Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25FF317E0FC
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 14:23:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgCINXB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 09:23:01 -0400
Received: from gofer.mess.org ([88.97.38.141]:58337 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726403AbgCINXB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Mar 2020 09:23:01 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id EF180C63FC; Mon,  9 Mar 2020 13:22:59 +0000 (GMT)
Date:   Mon, 9 Mar 2020 13:22:59 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.7] DVB & RC
Message-ID: <20200309132259.GA10756@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here is take 2 of the 64 bit scancodes and the last set for v5.7.

Thanks
Sean

The following changes since commit 00c43088aa680989407b6afbda295f67b3f123f1:

  media: meson: vdec: add VP9 decoder support (2020-03-05 23:05:34 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.7b

for you to fetch changes up to 96229c08e89ca048200c2171d99f03228996fd40:

  media: lmedm04: remove redundant assignment to variable gate (2020-03-09 12:43:08 +0000)

----------------------------------------------------------------
v5.7b

----------------------------------------------------------------
Brad Love (3):
      m88ds3103: Add support for ds3103b demod
      em28xx: Enable Hauppauge 461e rev2
      dw2102: probe for demodulator i2c address

Colin Ian King (2):
      media: tda10071: fix unsigned sign extension overflow
      media: lmedm04: remove redundant assignment to variable gate

Sean Young (1):
      media: rc: make scancodes 64 bit

 drivers/media/dvb-frontends/m88ds3103.c      | 466 ++++++++++++++++++++++++++-
 drivers/media/dvb-frontends/m88ds3103_priv.h |  14 +-
 drivers/media/dvb-frontends/tda10071.c       |   9 +-
 drivers/media/rc/bpf-lirc.c                  |   5 -
 drivers/media/rc/lirc_dev.c                  |   7 +-
 drivers/media/rc/rc-main.c                   |  80 +++--
 drivers/media/usb/dvb-usb-v2/lmedm04.c       |   5 +-
 drivers/media/usb/dvb-usb/dw2102.c           |  45 ++-
 drivers/media/usb/em28xx/em28xx-cards.c      |  18 ++
 drivers/media/usb/em28xx/em28xx-dvb.c        |  60 ++++
 drivers/media/usb/em28xx/em28xx.h            |   1 +
 include/media/rc-core.h                      |   8 +-
 include/media/rc-map.h                       |   4 +-
 13 files changed, 660 insertions(+), 62 deletions(-)
