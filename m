Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF57F44C8
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 11:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729896AbfKHKmA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 05:42:00 -0500
Received: from gofer.mess.org ([88.97.38.141]:53237 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726149AbfKHKmA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Nov 2019 05:42:00 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id B988CC64B1; Fri,  8 Nov 2019 10:41:58 +0000 (GMT)
Date:   Fri, 8 Nov 2019 10:41:58 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>,
        Jan Pieter van Woerkom <jp@jpvw.nl>,
        Colin Ian King <colin.king@canonical.com>,
        =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Subject: Re: [GIT PULL FOR v5.5] DVB/RC fixes (2nd)
Message-ID: <20191108104158.GB14205@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This includes flexcop fixes which I had failed to pick up and the rc keymap
for the Beelink GS1. This pull request is from signed tag.

Thanks
Sean

The following changes since commit 25a55a70307da947c04b6b8d27a6bc51b0dc569a:

  media: v4l2-device.h: fix typo: putss -> puts (2019-11-08 07:44:17 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.5iv

for you to fetch changes up to 200cc4e2331a60e75bcb9cd2adeca41d2826a0c9:

  arm64: dts: allwinner: beelink-gs1: Add rc-beelink-gs1 keymap (2019-11-08 08:57:44 +0000)

----------------------------------------------------------------
Clément Péron (2):
      media: rc: add keymap for Beelink GS1 remote control
      arm64: dts: allwinner: beelink-gs1: Add rc-beelink-gs1 keymap

Colin Ian King (1):
      media: flexcop-usb: ensure -EIO is returned on error condition

Jan Pieter van Woerkom (1):
      media: dvbsky: remove unused code

Oliver Neukum (1):
      media: b2c2-flexcop-usb: add sanity checking

 Documentation/devicetree/bindings/media/rc.yaml    |  1 +
 .../boot/dts/allwinner/sun50i-h6-beelink-gs1.dts   |  1 +
 drivers/media/rc/keymaps/Makefile                  |  1 +
 drivers/media/rc/keymaps/rc-beelink-gs1.c          | 84 ++++++++++++++++++++++
 drivers/media/usb/b2c2/flexcop-usb.c               |  5 +-
 drivers/media/usb/dvb-usb-v2/dvbsky.c              |  9 ---
 include/media/rc-map.h                             |  1 +
 7 files changed, 92 insertions(+), 10 deletions(-)
 create mode 100644 drivers/media/rc/keymaps/rc-beelink-gs1.c
