Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CED67074A
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 19:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbfGVR3r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 13:29:47 -0400
Received: from sauhun.de ([88.99.104.3]:42116 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731296AbfGVR0G (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 13:26:06 -0400
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
        by pokefinder.org (Postfix) with ESMTPSA id 5D44C4A1493;
        Mon, 22 Jul 2019 19:26:04 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 0/8] media: convert subsystem to i2c_new_dummy_device()
Date:   Mon, 22 Jul 2019 19:25:54 +0200
Message-Id: <20190722172604.3572-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series is part of a tree-wide movement to replace the I2C API call
'i2c_new_dummy' which returns NULL with its new counterpart returning an
ERRPTR.

The series was generated with coccinelle (audited afterwards, of course) and
build tested by me and by buildbot. No tests on HW have been performed.

The branch is based on v5.3-rc1. A branch (with some more stuff included) can
be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i2c/new_dummy

Some drivers still need to be manually converted. Patches for those will be
sent out individually.


Wolfram Sang (8):
  media: dvb-frontends: cxd2820r_core: convert to i2c_new_dummy_device
  media: dvb-frontends: mn88443x: convert to i2c_new_dummy_device
  media: dvb-frontends: mn88472: convert to i2c_new_dummy_device
  media: dvb-frontends: mn88473: convert to i2c_new_dummy_device
  media: i2c: ad9389b: convert to i2c_new_dummy_device
  media: i2c: adv7180: convert to i2c_new_dummy_device
  media: i2c: adv7511-v4l2: convert to i2c_new_dummy_device
  media: usb: go7007: s2250-board: convert to i2c_new_dummy_device

 drivers/media/dvb-frontends/cxd2820r_core.c |  6 +++---
 drivers/media/dvb-frontends/mn88443x.c      |  6 +++---
 drivers/media/dvb-frontends/mn88472.c       | 12 ++++++------
 drivers/media/dvb-frontends/mn88473.c       | 12 ++++++------
 drivers/media/i2c/ad9389b.c                 |  6 +++---
 drivers/media/i2c/adv7180.c                 | 12 ++++++------
 drivers/media/i2c/adv7511-v4l2.c            | 18 +++++++++---------
 drivers/media/usb/go7007/s2250-board.c      |  6 +++---
 8 files changed, 39 insertions(+), 39 deletions(-)

-- 
2.20.1

