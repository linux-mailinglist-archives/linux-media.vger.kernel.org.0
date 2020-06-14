Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89D8E1F8AE6
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2020 23:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727917AbgFNVaQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 17:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726648AbgFNVaQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 17:30:16 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12543C03E97C
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2020 14:30:16 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id E69AFC637E; Sun, 14 Jun 2020 22:30:12 +0100 (BST)
Date:   Sun, 14 Jun 2020 22:30:12 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.9] RC & DVB fixes
Message-ID: <20200614213012.GA2231@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here is the new rc driver ir_toy and some minor fixes.

Thanks,
Sean

The following changes since commit 2630e1bb0948c3134c6f22ad275ae27cc6023532:

  media: rkvdec: Fix H264 scaling list order (2020-06-11 19:21:38 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.9a

for you to fetch changes up to 824812364f8916f7662a51f1b759fe22ba3a4ede:

  media: budget-core: Improve exception handling in budget_register() (2020-06-14 21:34:40 +0100)

----------------------------------------------------------------
v5.9a

----------------------------------------------------------------
Arnd Bergmann (1):
      media: cxusb-analog: fix V4L2 dependency

Chuhong Yuan (1):
      media: budget-core: Improve exception handling in budget_register()

Jan Pieter van Woerkom (1):
      media: dvbsky: MyGica T230* receivers also do DVB-C and DVB-T

Jia-Ju Bai (1):
      media: pci: ttpci: av7110: fix possible buffer overflow caused by bad DMA value in debiirq()

Sean Young (3):
      media: rc: add support for Infrared Toy and IR Droid devices
      USB: cdc-acm: blacklist IR Droid / IR Toy device
      MAINTAINERS: rc-core and lirc maintainership

 MAINTAINERS                           |  13 +
 drivers/media/pci/ttpci/av7110.c      |   5 +-
 drivers/media/pci/ttpci/budget-core.c |  11 +-
 drivers/media/rc/Kconfig              |  11 +
 drivers/media/rc/Makefile             |   1 +
 drivers/media/rc/ir_toy.c             | 509 ++++++++++++++++++++++++++++++++++
 drivers/media/usb/dvb-usb-v2/dvbsky.c |   8 +-
 drivers/media/usb/dvb-usb/Kconfig     |   1 +
 drivers/usb/class/cdc-acm.c           |   6 +
 9 files changed, 556 insertions(+), 9 deletions(-)
 create mode 100644 drivers/media/rc/ir_toy.c
