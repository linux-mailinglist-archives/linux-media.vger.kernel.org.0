Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 956D94BCC5
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2019 17:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbfFSP2t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jun 2019 11:28:49 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42365 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726238AbfFSP2t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jun 2019 11:28:49 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1hdcVs-0003oR-VH; Wed, 19 Jun 2019 17:28:40 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1hdcVs-00081W-A2; Wed, 19 Jun 2019 17:28:40 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     sakari.ailus@linux.intel.com, mchehab@kernel.org,
        robh+dt@kernel.org, Jacopo Mondi <jacopo@jmondi.org>
Cc:     devicetree@vger.kernel.org, graphics@pengutronix.de,
        linux-media@vger.kernel.org
Subject: [PATCH v2 0/2] media: add Toshiba TC358746 Bridge support
Date:   Wed, 19 Jun 2019 17:28:36 +0200
Message-Id: <20190619152838.25079-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

this is my v2 contains all the review feedback made on my v1 [1].
Since Rob didn't responed to the question how we should handle the
different input/output config I decided to use Jacopo approach since
it is common for mux devices too.

I rebased the patches ontop of media_tree/master so there should be no
conflicts.

Regards,
  Marco

[1] https://patchwork.ozlabs.org/cover/1015381/

Marco Felsch (2):
  media: dt-bindings: add bindings for Toshiba TC358746
  media: tc358746: add Toshiba TC358746 Parallel to CSI-2 bridge driver

 .../bindings/media/i2c/toshiba,tc358746.txt   |   95 +
 MAINTAINERS                                   |    7 +
 drivers/media/i2c/Kconfig                     |   12 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/tc358746.c                  | 1807 +++++++++++++++++
 drivers/media/i2c/tc358746_regs.h             |  208 ++
 6 files changed, 2130 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.txt
 create mode 100644 drivers/media/i2c/tc358746.c
 create mode 100644 drivers/media/i2c/tc358746_regs.h

-- 
2.20.1

