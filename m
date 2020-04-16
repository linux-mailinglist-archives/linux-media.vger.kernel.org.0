Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5B661AC4BF
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 16:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392842AbgDPODr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 10:03:47 -0400
Received: from gofer.mess.org ([88.97.38.141]:38235 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392833AbgDPODk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 10:03:40 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 8549711A002; Thu, 16 Apr 2020 15:03:38 +0100 (BST)
Date:   Thu, 16 Apr 2020 15:03:38 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Bradford Love <brad@nextdimension.cc>
Subject: [GIT PULL FOR v5.8] analog support
Message-ID: <20200416140338.GA18975@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are Brad's patches for analog support. Please pull.

Thanks,

Sean

The following changes since commit dacca5f0fa69f04c2e70aad9847e8250b459971c:

  media: media/test_drivers: rename to test-drivers (2020-04-16 10:38:31 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.8b

for you to fetch changes up to 340da20f4983d4a89f4e353d2c26e72845419c9e:

  media: iguanair: rc drivers no longer need to do locking (2020-04-16 13:16:26 +0100)

----------------------------------------------------------------
v5.8b

----------------------------------------------------------------
Brad Love (14):
      media: si2157: Enable tuner status flags
      media: si2157: Check error status bit on cmd execute
      media: si2157: Better check for running tuner in init
      media: si2157: Add analog tuning related functions
      media: si2157: Briefly wait for tuning operation to complete
      media: si2157: module debug option to wait on signal lock
      media: cx23885: Add analog frontend to Hauppauge QuadHD
      media: cx23885: Add analog frontend to 1265_K4
      media: cx23885: Add analog frontend to HVR5525
      media: cx23885: Add i2c device analog tuner support
      media: cx231xx: Add i2c device analog tuner support
      media: si2157: add on-demand rf strength func
      media: lgdt3306a: Add CNR v5 stat
      media: cx25840: Register labeling, chip specific correction

Sean Young (1):
      media: iguanair: rc drivers no longer need to do locking

 drivers/media/dvb-frontends/lgdt3306a.c    |  14 +
 drivers/media/i2c/cx25840/cx25840-core.c   |  40 +--
 drivers/media/pci/cx23885/cx23885-cards.c  |  51 +++-
 drivers/media/pci/cx23885/cx23885-dvb.c    |  31 +++
 drivers/media/pci/cx23885/cx23885-video.c  |  99 ++++++-
 drivers/media/rc/iguanair.c                |  36 +--
 drivers/media/tuners/si2157.c              | 416 +++++++++++++++++++++++++++--
 drivers/media/tuners/si2157_priv.h         |   2 +
 drivers/media/usb/cx231xx/cx231xx-avcore.c |  35 ++-
 drivers/media/usb/cx231xx/cx231xx-video.c  |  85 +++++-
 10 files changed, 702 insertions(+), 107 deletions(-)
