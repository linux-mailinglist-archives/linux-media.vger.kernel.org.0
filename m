Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1045740CBE3
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 19:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbhIORqr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 13:46:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbhIORqr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 13:46:47 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 196AFC061574
        for <linux-media@vger.kernel.org>; Wed, 15 Sep 2021 10:45:28 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 778F0C63A9; Wed, 15 Sep 2021 18:45:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1631727926; bh=5v3Pmn5fRyTznPaJMKk3WoOyRDcvsKbiSLuAiLMLXO4=;
        h=Date:From:To:Subject:From;
        b=O3IxPvNbQTLMrcFfNNyEHWjqVnrgbtGML3yLyh51QlXHpAfDbbZ2FDWmEUq5dOUbc
         heIEOGgOjTC3HB/E2iio9JhsljfWxbRBzYcCh28kdY6T2kbxOoEVpO+Z3suWT9QX8V
         Xsr5V5FweAD/amWUXBBQIuHZL0y6UMQ5hoN6x4y9SN8a/8M/JJ/bsRlI5CDdHUaCVM
         WrG2lc5u1hzooROGXUxqQ+xcEfELzRf0oqiExGoVAUl0BDhdwDOj0tzqRM57ImB0Fc
         dQG64BGD5pFpeDpuKmTEe3nHA+06ZKmzRkrTaDJZsGJ5JiUb6zVsvhMLryRkNMzFav
         bMWJYuba3gHig==
Date:   Wed, 15 Sep 2021 18:45:26 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.16] First batch
Message-ID: <20210915174526.GA19504@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 826a9903fab5f7404265ddccd0bb4f240382e825:

  media: camss: vfe: Don't call hw_version() before its dependencies are met (2021-09-06 09:40:05 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.16a

for you to fetch changes up to f507435c1731c7c5871efad78fd15c9152dd0245:

  media: dvb-frontends/cxd2099: Remove repeated verbose license text (2021-09-15 18:01:34 +0100)

----------------------------------------------------------------
v5.16a

----------------------------------------------------------------
Cai Huoqing (5):
      media: dvb-frontend/mxl692: Remove repeated verbose license text
      media: dvb-frontend/mxl5xx: Remove repeated verbose license text
      media: dvb-frontends/stv6111: Remove repeated verbose license text
      media: dvb-frontends/stv0910: Remove repeated verbose license text
      media: dvb-frontends/cxd2099: Remove repeated verbose license text

Pavel Skripkin (1):
      media: mxl111sf: change mutex_init() location

Rajat Asthana (1):
      media: mceusb: return without resubmitting URB in case of -EPROTO error.

Sean Young (4):
      media: ir-kbd-i2c: improve responsiveness of hauppauge zilog receivers
      media: ir_toy: print firmware version in correct format
      media: ir_toy: deal with residual irdata before expected response
      media: ir_toy: do not resubmit broken urb

jing yangyang (1):
      media: meson-ir-tx: fix platform_no_drv_owner.cocci warnings

 drivers/media/dvb-frontends/cxd2099.c     |  9 ---------
 drivers/media/dvb-frontends/cxd2099.h     |  9 ---------
 drivers/media/dvb-frontends/mxl5xx.c      |  9 ---------
 drivers/media/dvb-frontends/mxl5xx.h      |  9 ---------
 drivers/media/dvb-frontends/mxl5xx_defs.h |  4 ----
 drivers/media/dvb-frontends/mxl5xx_regs.h | 10 ----------
 drivers/media/dvb-frontends/mxl692.c      |  9 ---------
 drivers/media/dvb-frontends/mxl692.h      |  9 ---------
 drivers/media/dvb-frontends/mxl692_defs.h |  9 ---------
 drivers/media/dvb-frontends/stv0910.c     |  9 ---------
 drivers/media/dvb-frontends/stv0910.h     |  9 ---------
 drivers/media/dvb-frontends/stv6111.c     |  9 ---------
 drivers/media/dvb-frontends/stv6111.h     |  9 ---------
 drivers/media/i2c/ir-kbd-i2c.c            |  1 +
 drivers/media/rc/ir_toy.c                 | 27 +++++++++++++++++----------
 drivers/media/rc/mceusb.c                 |  1 +
 drivers/media/rc/meson-ir-tx.c            |  1 -
 drivers/media/usb/dvb-usb-v2/mxl111sf.c   | 16 ++++++++++++++--
 18 files changed, 33 insertions(+), 126 deletions(-)
