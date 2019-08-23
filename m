Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33C9D9A8D9
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 09:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731701AbfHWHb7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 03:31:59 -0400
Received: from retiisi.org.uk ([95.216.213.190]:33494 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729116AbfHWHb7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 03:31:59 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id AD005634C88;
        Fri, 23 Aug 2019 10:31:10 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1i142Q-0001vi-37; Fri, 23 Aug 2019 10:31:10 +0300
Date:   Fri, 23 Aug 2019 10:31:10 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Cc:     maxime.ripard@bootlin.com
Subject: [GIT PULL for 5.4] A10 CSI driver and atmel-isi fix
Message-ID: <20190823073109.GR3504@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a driver for A10 CSI parallel receiver and a fix for atmel-isi.

There are three checkpatch.pl warnings; two on Makefile / Kconfig on
MAINTAINERS (i.e. not worth mentioning in MAINTAINERS) while the third is
on a spinlock missing a comment. If you'd like the last one to be
addressed, I'm proposing doing that in a separate patch.

Please pull.


The following changes since commit 01faced6f65d0224bf6ce1262a4137771e28519f:

  media: dt-bindings: media: Convert Allwinner A10 IR to a schema (2019-08-21 18:39:55 -0300)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.4-7-signed

for you to fetch changes up to 494630237a2ce13f1e0b8fe06b48811ce5254ce4:

  media: sunxi: Add A10 CSI driver (2019-08-23 10:25:33 +0300)

----------------------------------------------------------------
A10 CSI1 driver + sensor fix

----------------------------------------------------------------
Alexandre Kroupski (1):
      media: atmel: atmel-isi: fix timeout value for stop streaming

Maxime Ripard (3):
      dt-bindings: media: Add Allwinner A10 CSI binding
      media: sunxi: Refactor the Makefile and Kconfig
      media: sunxi: Add A10 CSI driver

 .../bindings/media/allwinner,sun4i-a10-csi.yaml    | 109 +++++
 MAINTAINERS                                        |   8 +
 drivers/media/platform/Kconfig                     |   2 +-
 drivers/media/platform/Makefile                    |   2 +-
 drivers/media/platform/atmel/atmel-isi.c           |   2 +-
 drivers/media/platform/sunxi/Kconfig               |   2 +
 drivers/media/platform/sunxi/Makefile              |   2 +
 drivers/media/platform/sunxi/sun4i-csi/Kconfig     |  11 +
 drivers/media/platform/sunxi/sun4i-csi/Makefile    |   5 +
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 314 ++++++++++++++
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h | 160 ++++++++
 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c | 454 +++++++++++++++++++++
 .../media/platform/sunxi/sun4i-csi/sun4i_v4l2.c    | 385 +++++++++++++++++
 13 files changed, 1453 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
 create mode 100644 drivers/media/platform/sunxi/Kconfig
 create mode 100644 drivers/media/platform/sunxi/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun4i-csi/Kconfig
 create mode 100644 drivers/media/platform/sunxi/sun4i-csi/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
 create mode 100644 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
 create mode 100644 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
 create mode 100644 drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c

-- 
Kind regards,

Sakari Ailus
