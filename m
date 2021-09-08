Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97D50403A37
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 15:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231727AbhIHNEb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 09:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235502AbhIHNE0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 09:04:26 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54FAFC061757
        for <linux-media@vger.kernel.org>; Wed,  8 Sep 2021 06:03:18 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxES-0004mG-L9; Wed, 08 Sep 2021 15:03:16 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxER-0004S7-LS; Wed, 08 Sep 2021 15:03:15 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxER-00DpG0-KV; Wed, 08 Sep 2021 15:03:15 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     kernel@pengutronix.de, m.tretter@pengutronix.de
Subject: [PATCH 0/6] media: allegro: Add support for the Encoder Buffer
Date:   Wed,  8 Sep 2021 15:03:09 +0200
Message-Id: <20210908130315.3295253-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This series adds support for the Encoder Buffer to the Allegro DVT driver.

The Encoder Buffer (the reference manual sometime also uses the terms L2 cache
or Prefetch Buffer) acts as a cache for the reference frames. The Encoder
Buffer reduces the read accesses of the encoder on its AXI ports. The size of
the buffer is configurable with Vivado before the FPGA bitstream is
synthesized, but not during runtime. The driver is responsible for configuring
the firmware to the configured size of the Encoder Buffer.

Patch 1 adds a check to make sure that the response mailbox is initialized
before the interrupt handler tries to handle mails from this mailbox. This
should never happen, but having the check does not hurt and should make the
checkers happy.

Patch 2 fixes the removal of the module when the firmware initialization has
failed.

Patch 3 and 4 integrate the Allegro DVT driver with the Xilinx VCU driver,
which handles the glue code between the encoder and the FPGA.

Patch 5 and 6 add support for the actual Encoder Buffer and add a control to
explicitly disable it per encoding context, because the Encoder Buffer might
have a negativ impact on the encoding quality.

This series is independent of my other series regarding the NAL unit fixes.

Michael

Michael Tretter (6):
  media: allegro: ignore interrupt if mailbox is not initialized
  media: allegro: fix module removal if initialization failed
  media: allegro: lookup VCU settings
  media: allegro: add pm_runtime support
  media: allegro: add encoder buffer support
  media: allegro: add control to disable encoder buffer

 .../media/platform/allegro-dvt/allegro-core.c | 229 +++++++++++++++++-
 .../media/platform/allegro-dvt/allegro-mail.c |  19 +-
 .../media/platform/allegro-dvt/allegro-mail.h |  10 +-
 include/uapi/linux/v4l2-controls.h            |   5 +
 4 files changed, 235 insertions(+), 28 deletions(-)

-- 
2.30.2

