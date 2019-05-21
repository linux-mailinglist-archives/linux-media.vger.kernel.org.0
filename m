Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38FEA2527C
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2019 16:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728055AbfEUOqN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 May 2019 10:46:13 -0400
Received: from gofer.mess.org ([88.97.38.141]:45037 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727999AbfEUOqN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 May 2019 10:46:13 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 09B6760168; Tue, 21 May 2019 15:46:11 +0100 (BST)
Date:   Tue, 21 May 2019 15:46:11 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.3] RC & DVB
Message-ID: <20190521144611.xa2lo7rxul6f6y4y@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Some of the DVB & RC patches. There are more to come.

Thanks,
Sean

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git for-v5.3a

for you to fetch changes up to bf0f4f6e1b14a6d920ad11cd3c6cb404801da8cc:

  media: dvb: warning about dvb frequency limits produces too much noise (2019-05-21 11:36:25 +0100)

----------------------------------------------------------------
Daniel Gomez (1):
      media: spi: IR LED: add missing of table registration

Neil Armstrong (1):
      media: rc: meson-ir: update with SPDX Licence identifier

Oliver Neukum (1):
      media: dvb: usb: fix use after free in dvb_usb_device_exit

Sean Young (2):
      media: au0828: fix null dereference in error path
      media: dvb: warning about dvb frequency limits produces too much noise

Stefan Brüns (3):
      media: dvb-usb-v2: Report error on all error paths
      media: dvbsky: Remove duplicate error reporting for dvbsky_usb_generic_rw
      media: af9035: Remove duplicate error reporting for dvbsky_usb_generic_rw

 drivers/media/dvb-core/dvb_frontend.c      |  2 +-
 drivers/media/rc/ir-spi.c                  |  1 +
 drivers/media/rc/meson-ir.c                |  8 +-------
 drivers/media/usb/au0828/au0828-core.c     | 12 ++++++------
 drivers/media/usb/dvb-usb-v2/af9035.c      |  2 --
 drivers/media/usb/dvb-usb-v2/dvb_usb_urb.c | 15 ++++++++++-----
 drivers/media/usb/dvb-usb-v2/dvbsky.c      | 11 -----------
 drivers/media/usb/dvb-usb/dvb-usb-init.c   |  7 +++++--
 8 files changed, 24 insertions(+), 34 deletions(-)
